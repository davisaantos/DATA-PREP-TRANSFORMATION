import pandas as pd
from sqlalchemy import create_engine
import pyodbc
from config import Config
from utils import get_last_sync, update_sync_control, load_incremental_data

def main():
    conn_transacional = pyodbc.connect(Config.TRANSACTIONAL_DB_CONN)
    engine_star = create_engine(Config.STAR_SCHEMA_DB_CONN)
    engine_wide = create_engine(Config.WIDE_TABLE_DB_CONN)
    last_sync = get_last_sync(conn_transacional)

    # Dados incrementais
    orders = load_incremental_data(conn_transacional, "olist_orders", "order_purchase_timestamp", last_sync)
    order_items = load_incremental_data(conn_transacional, "olist_order_items", "shipping_limit_date", last_sync)
    products = pd.read_sql("SELECT * FROM olist_products", conn_transacional)
    customers = pd.read_sql("SELECT * FROM olist_customers", conn_transacional)
    sellers = pd.read_sql("SELECT * FROM olist_sellers", conn_transacional)

    if orders.empty and order_items.empty:
        print("Nenhum dado novo para processar.")
        return

    # Transformações
    orders['order_purchase_timestamp'] = pd.to_datetime(orders['order_purchase_timestamp'])
    order_items['shipping_limit_date'] = pd.to_datetime(order_items['shipping_limit_date'])

    # Criação das tabelas DIM
    dim_products = products[['product_id', 'product_category_name', 'product_name_lenght', 
                             'product_description_lenght', 'product_photos_qty']]
    
    # FATO
    fact_orders = pd.merge(order_items, orders[['order_id', 'customer_id', 'order_purchase_timestamp']], on='order_id')
    fact_orders['year_month'] = fact_orders['order_purchase_timestamp'].dt.to_period('M')

    fact_orders_grouped = fact_orders.groupby(['year_month', 'product_id', 'customer_id']).agg({
        'price': 'sum',
        'freight_value': 'sum'
    }).reset_index()

    # WIDE
    wide_table = pd.merge(fact_orders, dim_products, on='product_id')
    wide_table = pd.merge(wide_table, customers, on='customer_id')
    wide_table = pd.merge(wide_table, sellers, on='seller_id')

    # Analítico
    fact_orders_grouped.to_sql('fact_orders_star', engine_star, if_exists='append', index=False)
    wide_table.to_sql('wide_table', engine_wide, if_exists='append', index=False)

    print("Dados carregados com sucesso.")
    update_sync_control(conn_transacional)

if __name__ == "__main__":
    main()

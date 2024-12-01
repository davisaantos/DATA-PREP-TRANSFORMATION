-- Validador de Dados: Contagem de Registros
SELECT 'olist_orders' AS table_name, COUNT(*) AS record_count FROM olist_orders;
SELECT 'olist_order_items' AS table_name, COUNT(*) AS record_count FROM olist_order_items;
SELECT 'olist_products' AS table_name, COUNT(*) AS record_count FROM olist_products;

-- Validador de Agregações: Star Schema
SELECT year_month, SUM(price) AS total_price, SUM(freight_value) AS total_freight
FROM fact_orders_star
GROUP BY year_month;

-- Validador de Agregações: Wide Table
SELECT COUNT(DISTINCT order_id) AS total_orders, COUNT(*) AS total_items
FROM wide_table;

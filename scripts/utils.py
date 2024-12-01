import pandas as pd
from datetime import datetime

def get_last_sync(conn):
    try:
        sync_data = pd.read_sql("SELECT MAX(last_sync) AS last_sync FROM sync_control", conn)
        return sync_data['last_sync'][0]
    except Exception as e:
        print("Tabela não encontrada. Sincronização inicial.")
        return None

def update_sync_control(conn):
    current_time = datetime.now()
    query = f"INSERT INTO sync_control (last_sync) VALUES ('{current_time}')"
    with conn.cursor() as cursor:
        cursor.execute(query)
        conn.commit()
    print("Tabela atualizada.")

def load_incremental_data(conn, table_name, column_name, last_sync):
    query = f"SELECT * FROM {table_name}"
    if last_sync:
        query += f" WHERE {column_name} > '{last_sync}'"
    print(f"Executando a consulta incremental: {query}")
    return pd.read_sql(query, conn)

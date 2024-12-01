class Config:
    #Conexão do banco transacional
    TRANSACTIONAL_DB_CONN = (
        "DRIVER={ODBC Driver 17 for SQL Server};"
        "SERVER=localhost;"
        "DATABASE=OlistDatabase;"
        "UID=sa;"
        "PWD=your_password;"
    )

    STAR_SCHEMA_DB_CONN = (
        "mssql+pyodbc://sa:your_password@localhost/StarSchema?driver=ODBC+Driver+17+for+SQL+Server"
    )

    WIDE_TABLE_DB_CONN = (
        "mssql+pyodbc://sa:your_password@localhost/WideTable?driver=ODBC+Driver+17+for+SQL+Server"
    )

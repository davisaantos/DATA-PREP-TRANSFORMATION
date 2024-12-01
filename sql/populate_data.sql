-- Inserir Dados na Tabela: olist_orders
BULK INSERT olist_orders
FROM ''
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    TABLOCK
);

-- Inserir Dados na Tabela: olist_order_items
BULK INSERT olist_order_items
FROM ''
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    TABLOCK
);

-- Inserir Dados na Tabela: olist_products
BULK INSERT olist_products
FROM ''
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    TABLOCK
);

-- Inserir Dados na Tabela: olist_customers
BULK INSERT olist_customers
FROM ''
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    TABLOCK
);

-- Inserir Dados na Tabela: olist_sellers
BULK INSERT olist_sellers
FROM ''
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
    FIRSTROW = 2,
    DATAFILETYPE = 'char',
    TABLOCK
);

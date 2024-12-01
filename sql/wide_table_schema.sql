-- Criar Banco Analítico Wide Table
CREATE DATABASE WideTable;
GO

USE WideTable;
GO

-- Criar Wide Table
CREATE TABLE wide_table (
    order_id CHAR(32),
    order_item_id INT,
    customer_id CHAR(32),
    product_id CHAR(32),
    seller_id CHAR(32),
    product_category_name VARCHAR(512),
    price NUMERIC(12, 2),
    freight_value NUMERIC(12, 2),
    order_status VARCHAR(20),
    shipping_limit_date DATETIME,
    PRIMARY KEY (order_id, order_item_id)
);

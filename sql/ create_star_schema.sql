-- Banco Analítico Star Schema
CREATE DATABASE StarSchema;
GO

USE StarSchema;
GO

-- Dimensão: Produtos
CREATE TABLE dim_products (
    product_id CHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(512),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT
);

-- Dimensão: Clientes
CREATE TABLE dim_customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32),
    customer_zip_code_prefix CHAR(5),
    customer_city VARCHAR(120),
    customer_state CHAR(2)
);

-- Dimensão: Vendedores
CREATE TABLE dim_sellers (
    seller_id CHAR(32) PRIMARY KEY,
    seller_zip_code_prefix CHAR(5),
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

-- Fato
CREATE TABLE fact_orders_star (
    order_id CHAR(32) PRIMARY KEY,
    customer_id CHAR(32),
    product_id CHAR(32),
    seller_id CHAR(32),
    year_month CHAR(7),
    price NUMERIC(12, 2),
    freight_value NUMERIC(12, 2)
);

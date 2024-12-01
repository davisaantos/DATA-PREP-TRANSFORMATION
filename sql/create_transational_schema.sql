CREATE DATABASE OlistDatabase;
GO

USE OlistDatabase;
GO

-- Criar Tabela: olist_orders
CREATE TABLE olist_orders (
    order_id CHAR(32) PRIMARY KEY,
    customer_id CHAR(32),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

-- Criar Tabela: olist_order_items
CREATE TABLE olist_order_items (
    order_id CHAR(32),
    order_item_id INT,
    product_id CHAR(32),
    seller_id CHAR(32),
    shipping_limit_date DATETIME,
    price NUMERIC(12, 2),
    freight_value NUMERIC(12, 2),
    PRIMARY KEY (order_id, order_item_id)
);

-- Criar Tabela: olist_products
CREATE TABLE olist_products (
    product_id CHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(512),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Criar Tabela: olist_customers
CREATE TABLE olist_customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32),
    customer_zip_code_prefix CHAR(5),
    customer_city VARCHAR(120),
    customer_state CHAR(2)
);

-- Criar Tabela: olist_sellers
CREATE TABLE olist_sellers (
    seller_id CHAR(32) PRIMARY KEY,
    seller_zip_code_prefix CHAR(5),
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);


ALTER TABLE olist_order_items
ADD CONSTRAINT FK_order_items_orders FOREIGN KEY (order_id)
REFERENCES olist_orders(order_id);

ALTER TABLE olist_order_items
ADD CONSTRAINT FK_order_items_products FOREIGN KEY (product_id)
REFERENCES olist_products(product_id);

ALTER TABLE olist_orders
ADD CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id)
REFERENCES olist_customers(customer_id);

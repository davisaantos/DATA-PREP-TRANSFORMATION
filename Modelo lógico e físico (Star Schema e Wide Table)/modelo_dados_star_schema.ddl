CREATE TABLE bi_star.dm_customers_star (
  customer_id              char(32) NOT NULL, 
  customer_unique_id       char(32) NULL, 
  customer_zip_code_prefix char(5) NOT NULL, 
  customer_city            varchar(120) NULL, 
  customer_state           char(2) NULL, 
  geolocation_lat          decimal(19, 17) NULL, 
  geolocation_lng          numeric(19, 17) NULL, 
  PRIMARY KEY (customer_id));
CREATE TABLE bi_star.dm_orders_star (
  order_id                      char(32) NOT NULL, 
  customer_id                   char(32) NOT NULL, 
  order_status                  varchar(20) NULL, 
  order_purchase_timestamp      datetime NULL, 
  order_approved_at             datetime2(7) NULL, 
  order_delivered_carrier_date  datetime2(7) NULL, 
  order_delivered_customer_date datetime2(7) NULL, 
  order_estimated_delivery_date datetime2(7) NULL, 
  PRIMARY KEY (order_id));
CREATE TABLE bi_star.dm_produto (
  product_id                    char(32) NOT NULL, 
  product_category_name         varchar(512) NOT NULL, 
  product_name_lenght           int NULL, 
  product_category_name_english varchar(512) NULL, 
  product_description_lenght    int NULL, 
  product_photos_qty            int NULL, 
  product_weight_g              int NULL, 
  product_length_cm             int NULL, 
  product_height_cm             int NULL, 
  product_width_cm              int NULL, 
  PRIMARY KEY (product_id));
CREATE TABLE bi_star.dm_sellers_str (
  seller_id              char(32) NOT NULL, 
  seller_zip_code_prefix char(5) NOT NULL, 
  seller_city            varchar(100) NULL, 
  seller_state           char(2) NULL, 
  geolocation_lat        decimal(19, 17) NULL, 
  geolocation_lng        numeric(19, 17) NULL, 
  PRIMARY KEY (seller_id));
CREATE TABLE bi_star.ft_orders_items_str (
  order_id            char(32) NOT NULL, 
  order_item_id       int NOT NULL, 
  product_id          char(32) NOT NULL, 
  seller_id           char(32) NOT NULL, 
  customer_id         char(32) NOT NULL, 
  shipping_limit_date datetime NULL, 
  price               numeric(12, 2) NULL, 
  freight_value       numeric(12, 2) NULL, 
  PRIMARY KEY (order_id, 
  order_item_id));
ALTER TABLE bi_star.ft_orders_items_str ADD CONSTRAINT FKft_orders_83480 FOREIGN KEY (customer_id) REFERENCES bi_star.dm_customers_star (customer_id);
ALTER TABLE bi_star.ft_orders_items_str ADD CONSTRAINT FKft_orders_243510 FOREIGN KEY (seller_id) REFERENCES bi_star.dm_sellers_str (seller_id);
ALTER TABLE bi_star.ft_orders_items_str ADD CONSTRAINT FKft_orders_496048 FOREIGN KEY (order_id) REFERENCES bi_star.dm_orders_star (order_id);
ALTER TABLE bi_star.ft_orders_items_str ADD CONSTRAINT FKft_orders_232193 FOREIGN KEY (product_id) REFERENCES bi_star.dm_produto (product_id);


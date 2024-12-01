CREATE TABLE olist.customers (
  customer_id              char(32) NOT NULL, 
  customer_unique_id       char(32) NULL, 
  customer_zip_code_prefix char(5) NOT NULL, 
  customer_city            varchar(120) NULL, 
  customer_state           char(2) NULL, 
  CONSTRAINT customers_pk 
    PRIMARY KEY (customer_id));
CREATE TABLE olist.geolocation (
  geolocation_zip_code_prefix char(5) NOT NULL, 
  geolocation_lat             decimal(19, 17) NULL, 
  geolocation_lng             numeric(19, 17) NULL, 
  geolocation_city            varchar(120) NULL, 
  geolocation_state           char(2) NULL, 
  CONSTRAINT geolocation_pk 
    PRIMARY KEY (geolocation_zip_code_prefix));
CREATE TABLE olist.order_items (
  order_id            char(32) NOT NULL, 
  order_item_id       int NOT NULL, 
  product_id          char(32) NOT NULL, 
  seller_id           char(32) NOT NULL, 
  shipping_limit_date datetime NULL, 
  price               numeric(12, 2) NULL, 
  freight_value       numeric(12, 2) NULL, 
  CONSTRAINT order_items_pk 
    PRIMARY KEY (order_id, 
  order_item_id));
CREATE TABLE olist.order_payments (
  order_id             char(32) NOT NULL, 
  payment_sequential   int NOT NULL, 
  payment_type         varchar(20) NULL, 
  payment_installments int NULL, 
  payment_value        numeric(12, 2) NULL, 
  CONSTRAINT order_payments_pk 
    PRIMARY KEY (order_id, 
  payment_sequential));
CREATE TABLE olist.order_reviews (
  review_id               char(32) NULL, 
  order_id                char(32) NOT NULL, 
  review_score            int NULL, 
  review_comment_title    varchar(500) NULL, 
  review_comment_message  varchar(512) NULL, 
  review_creation_date    datetime2(7) NULL, 
  review_answer_timestamp datetime NULL);
CREATE TABLE olist.orders (
  order_id                      char(32) NOT NULL, 
  customer_id                   char(32) NOT NULL, 
  order_status                  varchar(20) NULL, 
  order_purchase_timestamp      datetime NULL, 
  order_approved_at             datetime2(7) NULL, 
  order_delivered_carrier_date  datetime2(7) NULL, 
  order_delivered_customer_date datetime2(7) NULL, 
  order_estimated_delivery_date datetime2(7) NULL, 
  CONSTRAINT orders_pk 
    PRIMARY KEY (order_id));
CREATE TABLE olist.product_category_name (
  product_category_name         varchar(512) NOT NULL, 
  product_category_name_english varchar(512) NULL, 
  CONSTRAINT product_category_name_pk 
    PRIMARY KEY (product_category_name));
CREATE TABLE olist.products (
  product_id                 char(32) NOT NULL, 
  product_category_name      varchar(512) NOT NULL, 
  product_name_lenght        int NULL, 
  product_description_lenght int NULL, 
  product_photos_qty         int NULL, 
  product_weight_g           int NULL, 
  product_length_cm          int NULL, 
  product_height_cm          int NULL, 
  product_width_cm           int NULL, 
  CONSTRAINT products_pk 
    PRIMARY KEY (product_id));
CREATE TABLE olist.sellers (
  seller_id              char(32) NOT NULL, 
  seller_zip_code_prefix char(5) NOT NULL, 
  seller_city            varchar(100) NULL, 
  seller_state           char(2) NULL, 
  CONSTRAINT sellers_pk 
    PRIMARY KEY (seller_id));
ALTER TABLE olist.orders ADD CONSTRAINT FKorders637563 FOREIGN KEY (customer_id) REFERENCES olist.customers (customer_id);
ALTER TABLE olist.customers ADD CONSTRAINT FKcustomers796264 FOREIGN KEY (customer_zip_code_prefix) REFERENCES olist.geolocation (geolocation_zip_code_prefix);
ALTER TABLE olist.sellers ADD CONSTRAINT FKsellers598640 FOREIGN KEY (seller_zip_code_prefix) REFERENCES olist.geolocation (geolocation_zip_code_prefix);
ALTER TABLE olist.order_items ADD CONSTRAINT FKorder_item104923 FOREIGN KEY (order_id) REFERENCES olist.orders (order_id);
ALTER TABLE olist.order_payments ADD CONSTRAINT FKorder_paym610509 FOREIGN KEY (order_id) REFERENCES olist.orders (order_id);
ALTER TABLE olist.order_reviews ADD CONSTRAINT FKorder_revi269396 FOREIGN KEY (order_id) REFERENCES olist.orders (order_id);
ALTER TABLE olist.order_items ADD CONSTRAINT FKorder_item767787 FOREIGN KEY (seller_id) REFERENCES olist.sellers (seller_id);
ALTER TABLE olist.order_items ADD CONSTRAINT FKorder_item312756 FOREIGN KEY (product_id) REFERENCES olist.products (product_id);
ALTER TABLE olist.products ADD CONSTRAINT FKproducts230286 FOREIGN KEY (product_category_name) REFERENCES olist.product_category_name (product_category_name);


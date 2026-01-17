--CPT 166 Module 2 Assignment: Add Foreign Keys to Demo Database
--Sylvia Schlotterbeck 9-21-25

SELECT *
FROM products
WHERE category_id = NULL;
--No rows where category_id = NULL

SELECT *
FROM products
WHERE category_id < 1 OR category_id > 8;
--No rows where category_id is less than 1 or more than 8

ALTER TABLE products
ADD CONSTRAINT FK_products_category_id
FOREIGN KEY (category_id) REFERENCES categories(category_id)
ON DELETE RESTRICT ON UPDATE CASCADE;
--Creates Foreign Key constraint (category_id) in table products

SELECT * 
FROM orders
WHERE customer_id = NULL;
--No rows where category_id = NULL

SELECT * 
FROM orders
WHERE customer_id < 1 OR customer_id > 91;
--No rows where category_id is less than 1 or more than 91

ALTER TABLE orders
ADD CONSTRAINT FK_orders_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE RESTRICT ON UPDATE CASCADE;
--Creates Foreign Key constraint (customer_id) in table orders

--orphan row pre-check:
SELECT *
FROM order_details
WHERE order_id = NULL;
--returns No rows where category_id = NULL

SELECT *
FROM order_details
WHERE order_id < 10248 OR order_id > 11077;
--returns No rows where category_id is lower than 10248 or higher than 11077

ALTER TABLE order_details
ADD CONSTRAINT FK_order_details_order_id
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON DELETE RESTRICT ON UPDATE CASCADE;
--Creates Foreign Key constraint (order_id) in table order_details

--orphan row pre-check:
SELECT *
FROM order_details
WHERE product_id = NULL;
--returns No rows where category_id = NULL

SELECT *
FROM order_details
WHERE product_id < 1 OR product_id > 77;
--returns No rows where product_id is less than 1 or more than 77

ALTER TABLE order_details
ADD CONSTRAINT FK_order_details_product_id
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON DELETE RESTRICT ON UPDATE CASCADE;
--Creates Foreign Key constraint (product_id) in table order_details

--orphan row pre-check:
SELECT *
FROM testproducts
WHERE product_id = NULL;
--returns No rows where category_id = NULL

SELECT *
FROM testproducts
WHERE category_id < 1 or category_id > 8;
--returns 6 rows with category ids outside the range of category_id

INSERT INTO categories (category_id, category_name, description)
VALUES (9, 'Unknown', 'New Category/Not Yet Categorized');
--Creates a new category 'Unknown' for all products in the testproduct
--table whose category_id falls outside of the known categories in category.
--This category can be deleted once all products within it have been
--successfully categorized into existing categories or have had a new category
--created for them and been placed into that new category_id.

UPDATE testproducts
SET category_id = 9
WHERE category_id > 8;
--Updates all test products whose category_id falls outside of the 8 existing 
--category_ids in the categories table.

ALTER TABLE testproducts
ADD CONSTRAINT FK_testproducts_category_id
FOREIGN KEY (category_id) REFERENCES categories(category_id)
ON DELETE RESTRICT ON UPDATE CASCADE;
--Creates Foreign Key constraint (category_id) in table testproducts

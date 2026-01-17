-- 1.
CREATE OR REPLACE VIEW vw_product_sales AS
	SELECT order_details.product_id, product_name, quantity, price
	FROM order_details
	LEFT JOIN products ON products.product_id = order_details.product_id
;

CREATE OR REPLACE FUNCTION get_product_sales(x_product_id INT) 
RETURNS numeric
LANGUAGE plpgsql
AS $$
DECLARE
	total_sales NUMERIC :=0;
BEGIN
	SELECT SUM(quantity * price)
	INTO total_sales
	FROM vw_product_sales
	WHERE product_id = x_product_id;

	RETURN total_sales;
END;
$$;

SELECT get_product_sales(11) AS total_sales_for_product_11;

SELECT get_product_sales(72) AS total_sales_for_product_72;

SELECT get_product_sales(65) AS total_sales_for_product_65;


--2
CREATE OR REPLACE FUNCTION count_orders(x_customer_id INT) 
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	customer_order_count INT :=0;
BEGIN
	SELECT COUNT(order_id)
	INTO customer_order_count
	FROM orders
	WHERE customer_id = x_customer_id;

	RETURN customer_order_count;
END;
$$;

SELECT count_orders(90) AS order_count_for_customer_90;

SELECT count_orders(1000) AS order_count_for_customer_1000;

--3
CREATE OR REPLACE PROCEDURE add_product(prod_id INT, prod_name TEXT, cat_id INT, unit_descr TEXT, price NUMERIC)  
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO products (product_id, product_name, category_id, unit, price)
	VALUES (prod_id, prod_name, cat_id, unit_descr, price);

	RAISE NOTICE 'New product added to products table';
END;
$$;


CALL add_product(78, 'Willy Wonka Everlasting Gobstoppers', 3, '50 gal. barrel', 450.50);

CALL add_product(79, 'Gustavo Glorious Grape Juice', 1, '12 - 12-oz. bottles', 11.50)

CALL add_product(80, 'Stinky Socks Limburger', 4, '6 - 8-oz. sock-shaped packages', 33.33)
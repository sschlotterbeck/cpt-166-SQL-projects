--Module 6 Assignment

--Query 1

CREATE VIEW vw_customer_orders AS
  SELECT customer_name, order_id, order_date
  FROM orders
  LEFT JOIN customers ON customers.customer_id = orders.customer_id 
;

SELECT *
FROM vw_customer_orders
ORDER BY order_date DESC
LIMIT 10;

--Query 2

CREATE VIEW vw_product_sales_summary AS
  SELECT 
    products.product_id,
	product_name, 
	SUM(quantity) AS total_quantity, 
	SUM(quantity) * price AS total_sales 
  FROM 
    products
  INNER JOIN order_details ON products.product_id = order_details.product_id
  GROUP BY products.product_id;

SELECT * 
FROM vw_product_sales_summary
ORDER BY total_sales DESC
LIMIT 5;

--Query 3

CREATE VIEW vw_active_customers AS
  SELECT 
    customer_name, COUNT(order_id) AS number_of_orders 
  FROM 
    orders
  LEFT JOIN customers ON orders.customer_id = customers.customer_id
  GROUP BY customer_name
  HAVING COUNT(order_id) >= 5
  ORDER BY number_of_orders DESC
  ;

SELECT customer_name
FROM vw_active_customers
ORDER BY customer_name;

--Query 4

CREATE MATERIALIZED VIEW mv_monthly_sales AS
  SELECT 
    SUM(quantity * price) AS total_sales, 
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(YEAR FROM order_date) AS year
  FROM orders
  LEFT JOIN order_details ON orders.order_id = order_details.order_id
  LEFT JOIN products ON order_details.product_id = products.product_id
  GROUP BY year, month
  ORDER BY year, month 
;

SELECT *
FROM mv_monthly_sales
ORDER BY year DESC, month DESC
LIMIT 6;

--Query 5

REFRESH MATERIALIZED VIEW mv_monthly_sales;
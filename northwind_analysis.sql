USE northwind;

-- DATA RANGE

/* What period does the order data cover? */

SELECT
MIN(orderDate) AS Earliest_order_date,
MAX(orderDate) AS Latest_order_date
FROM orders;

-- 1. SALES OVERVIEW

/* How many orders were placed each year? */

SELECT
YEAR(orderDate) AS Year,
COUNT(orderID) AS Number_of_orders
FROM orders
GROUP BY YEAR(orderDate)
ORDER BY Number_of_orders DESC;

/* How many customers are in the database? */

SELECT
COUNT(DISTINCT customerID) AS Number_of_customers
FROM customers;

/* How many employees handle sales orders? */

SELECT
COUNT(DISTINCT employeeID) AS Number_of_employees
FROM employees;

/* How many different products are currently in the product range? */

SELECT
COUNT(productID) AS Number_of_products
FROM products;

/* What is the average number of units per order line? */

SELECT
AVG(quantity) AS Average_units_per_order_line
FROM order_details;

-- 2. SALES OVER TIME

/* How many units were sold each year? */

SELECT
YEAR(orders.orderDate) AS Year,
SUM(order_details.quantity) AS Units_sold
FROM orders
INNER JOIN order_details
ON orders.orderID = order_details.orderID
GROUP BY YEAR(orders.orderDate)
ORDER BY Units_sold DESC;

/* How many units were sold in each month, combining data from all years? */

SELECT
MONTHNAME(orders.orderDate) AS Month,
SUM(order_details.quantity) AS Units_sold
FROM orders
INNER JOIN order_details
ON orders.orderID = order_details.orderID
GROUP BY MONTHNAME(orders.orderDate)
ORDER BY Units_sold DESC;

-- 3. PRODUCTS

/* Which 10 products sold the highest number of units? */

SELECT
products.productName,
SUM(order_details.quantity) AS Units_sold
FROM products
INNER JOIN order_details
ON products.productID = order_details.productID
GROUP BY products.productName
ORDER BY Units_sold DESC
LIMIT 10;

/* Which 10 products sold the lowest number of units? */

SELECT
products.productName,
SUM(order_details.quantity) AS Units_sold
FROM products
INNER JOIN order_details
ON products.productID = order_details.productID
GROUP BY products.productName
ORDER BY Units_sold
LIMIT 10;

/* Which 10 products have the highest unit price? */

SELECT
productName,
unitPrice
FROM products
ORDER BY unitPrice DESC
LIMIT 10;

/* Which 10 products have the lowest unit price? */

SELECT
productName,
unitPrice
FROM products
ORDER BY unitPrice
LIMIT 10;

/* How many products are in each category? */

SELECT
categories.categoryName,
COUNT(products.productID) AS Number_of_products
FROM categories
INNER JOIN products
ON categories.categoryID = products.categoryID
GROUP BY categories.categoryName
ORDER BY Number_of_products DESC;

/* How many units were sold in each product category? */

SELECT
categories.categoryName,
SUM(order_details.quantity) AS Units_sold
FROM categories
INNER JOIN products
ON categories.categoryID = products.categoryID
INNER JOIN order_details
ON products.productID = order_details.productID
GROUP BY categories.categoryName
ORDER BY Units_sold DESC;

-- 4. CUSTOMERS

/* How many orders did each customer place? */

SELECT
customers.contactName,
COUNT(orders.orderID) AS Number_of_orders
FROM customers
INNER JOIN orders
ON customers.customerID = orders.customerID
GROUP BY customers.contactName
ORDER BY Number_of_orders DESC;

/* How many units did each customer purchase? */

SELECT
customers.contactName,
SUM(order_details.quantity) AS Units_purchased
FROM customers
INNER JOIN orders
ON customers.customerID = orders.customerID
INNER JOIN order_details
ON orders.orderID = order_details.orderID
GROUP BY customers.contactName
ORDER BY Units_purchased DESC;

/* Which customers did not place any orders? */

SELECT
customers.contactName,
COUNT(orders.orderID) AS Number_of_orders
FROM customers
LEFT JOIN orders
ON customers.customerID = orders.customerID
GROUP BY customers.contactName
HAVING COUNT(orders.orderID) = 0;

-- 5. EMPLOYEES

/* How many orders did each employee handle? */

SELECT
employees.employeeName,
COUNT(orders.orderID) AS Number_of_orders
FROM employees
INNER JOIN orders
ON employees.employeeID = orders.employeeID
GROUP BY employees.employeeName
ORDER BY Number_of_orders DESC;

/* How many units were sold in orders handled by each employee? */

SELECT
employees.employeeName,
SUM(order_details.quantity) AS Units_sold
FROM employees
INNER JOIN orders
ON employees.employeeID = orders.employeeID
INNER JOIN order_details
ON orders.orderID = order_details.orderID
GROUP BY employees.employeeName
ORDER BY Units_sold DESC;
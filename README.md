# Northwind Sales Analysis — SQL Project

## Project Goal

In this project, I focused on analyzing Northwind sales data using SQL. The analysis covers sales over time, product and category performance, customer activity, and employees responsible for handling orders.

My main goal was to use basic SQL queries to obtain information about sales, customer activity, and employee activity.

## About the Dataset

The analysis was conducted using the Northwind database, which contains information about orders, customers, products, product categories, and employees.

The data used in this project covers the period from July 4, 2013, to May 6, 2015. The database contains:

- 830 orders
- 91 customers
- 77 products
- 8 product categories
- 9 employees

2014 is the only full year included in the dataset. Therefore, the results for individual years and months should be interpreted with consideration of the incomplete data for 2013 and 2015.

## SQL Skills Used

I used SQL clauses such as `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT`. I also used both `INNER JOIN` and `LEFT JOIN`.

The project also includes aggregate functions such as `SUM()`, `COUNT()`, `AVG()`, `MIN()`, and `MAX()`.

## Tools

- MySQL
- MySQL Workbench

## Scope of Analysis

The analysis covers several business areas: sales over time, products and product categories, customers, and employees.

I checked how many units were sold each year, which products were the best-selling, which products had the highest unit prices, and how sales were distributed across product categories.

In the customer analysis, I focused on the number of orders and the number of units purchased. For employees, I compared the number of orders handled and the number of units sold.

## Key Findings

### 1. Dairy Products had high unit sales

The highest number of units was sold in the Beverages category — 9,532, followed by Dairy Products — 9,149. Also, the three best-selling products in the entire dataset — Camembert Pierrot, Raclette Courdavault, and Gorgonzola Telino — belong to the Dairy Products category.

### 2. A higher number of products does not automatically mean higher unit sales

Dairy Products had a smaller product range than Confections — 10 products instead of 13 — but 1,243 more units were sold in this category.

### 3. A high unit price does not automatically mean low unit sales

Raclette Courdavault is the 6th most expensive product and also the 2nd best-selling product in terms of the number of units sold. This shows that a high unit price does not necessarily mean low unit sales. However, the analysis does not allow us to determine the impact of price on sales.

### 4. A significant share of unit sales is concentrated among a few customers

Jose Pavarotti, Roland Mendel, and Horst Kloss rank in the top three both in terms of the number of orders and units purchased. Together, they purchased 13,462 out of 51,317 units, which represents approximately 26.2% of total unit sales. Out of 91 customers, two did not place any orders.

This result could be a starting point for further analysis of the differences between the most active customers and the remaining customers.

### 5. A large share of order handling is concentrated among three employees

Margaret Peacock, Janet Leverling, and Nancy Davolio handled 406 out of 830 orders, which represents approximately 48.9%. A total of 25,462 out of 51,317 units were sold in the orders they handled — approximately 49.6%.

Margaret Peacock ranks first in both metrics, with 156 orders handled and 9,798 units sold.

This result could be a starting point for further analysis of the differences between orders handled by individual employees.

## Limitations of the Analysis

- **Incomplete data for 2013 and 2015** — 2014 is the only full year in the dataset. This makes it difficult to directly compare annual results and assess sales seasonality.

- **No analysis of sales value** — the analysis focuses mainly on the number of units sold and the number of orders, rather than sales value.

- **Basic scope of analysis** — the project does not include an analysis of more complex relationships, such as the impact of product price on sales.

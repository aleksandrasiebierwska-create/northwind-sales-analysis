# Cosmetics Sales Analysis

## Project Overview
This project focuses on cosmetics and skincare product sales data from 2022. The analysis focuses on product sales performance and salesperson performance. SQL was used to analyze key metrics such as total sales and the products with the highest revenue. The analysis also helped identify interesting patterns and draw business insights from the data.


## Dataset
This dataset contains skincare product sales data from 2022. It includes information about salespeople, countries, products, sale dates, sales amounts, and boxes shipped.

Source: Kaggle


## Tools & Technologies
- SQL
- MySQL Workbench
- Google Sheets


## Business Questions
1. What is the total sales value?
2. Which product generated the highest revenue?
3. Which products were sold most frequently?
4. Which salesperson generated the highest revenue?
5. Which months had the highest sales?
6. Which salesperson had the highest average transaction value?


## SQL Analysis
### 1. Total Sales

The total sales amounted to $2,909,104.12.

```sql
SELECT 
    ROUND(SUM(amount), 2) AS total_sales 
FROM sales;
```

### 2. Product Revenue

Tea Tree Moisturizer generated the highest revenue at $260,905.44.

```sql
SELECT 
product, 
ROUND(SUM(amount), 2) AS revenue 
FROM sales 
GROUP BY product 
ORDER BY revenue DESC;
``` 

### 3. Sales Volume by Product

Hydrating Face Serum was the most frequently sold product, appearing in 31 transactions. Tea Tree Moisturizer and Hair Repair Oil followed with 30 transactions each.

```sql
SELECT 
product, 
COUNT(product) AS transaction_count 
FROM sales 
GROUP BY product
ORDER BY transaction_count DESC;
```

### 4. Salesperson Revenue

Olivia D'Souza generated the highest revenue at $387,405.91. She also recorded 47 transactions.

```sql
SELECT 
sales_person, ROUND(SUM(amount), 2) AS revenue 
FROM sales 
GROUP BY sales_person 
ORDER BY revenue DESC;
```

### 5. Monthly Revenue

March was the strongest sales month, generating $484,101.59 in revenue. A separate transaction count analysis showed 58 transactions in March.

```sql
SELECT
MONTH(sale_date) AS month, 
ROUND(SUM(amount), 2) AS revenue 
FROM sales 
GROUP BY MONTH(sale_date) 
ORDER BY revenue DESC;
```

### 6. Average Transaction Value by Salesperson
Ava Sharma had the highest average transaction value at $8,791.94. Despite this, she generated $246,174.28 in total sales and had the fewest transactions, with 28.

```sql
SELECT
    sales_person,
    ROUND(SUM(amount), 2) AS total_revenue,
    COUNT(amount) AS number_of_transactions,
    ROUND(AVG(amount), 2) AS average_transaction_value
FROM sales
GROUP BY sales_person
ORDER BY average_transaction_value DESC;
```

## Key Findings
1. **Total sales:** Total sales amounted to $2,909,104.12.
2. **Top revenue product:** Tea Tree Moisturizer generated the highest revenue at $260,905.44. It also ranked second in the number of transactions.
3. **Best-selling products:** The three most frequently sold products were:
- **Hydrating Face Serum** — 31 transactions; it also generated the second-highest revenue.
- **Tea Tree Moisturizer** — 30 transactions and the highest number of boxes shipped (8,319).
- **Hair Repair Oil** — 30 transactions; it had the largest single transaction, worth $23,977.48.
4. **Top-performing salesperson:** Olivia D'Souza was the top-performing salesperson, generating $387,405.91 across 47 transactions. She also had the highest number of transactions among all salespeople.
5. **Strongest sales month:** March was the strongest sales month, recording the highest revenue ($484,101.59) and the highest number of transactions (58).
6. **High transaction value vs. sales volume:** Ava Sharma had the highest average transaction value ($8,791.94), despite generating only $246.2K in total sales and having the fewest transactions (28). This suggests that her lower total sales were driven by a lower transaction volume rather than a low transaction value.


## Business Insights
1. **Overall sales:** The total sales value provides a baseline for evaluating future business performance and comparing sales results over time.
2. **Tea Tree Moisturizer:** Tea Tree Moisturizer was the highest-revenue product and one of the most frequently sold products. The product has strong sales performance, so it may be worth further investing in its development and promotion. Customer feedback could also be analyzed to identify opportunities to improve the product, such as packaging or other product features.
3. **Top-selling products:** Hydrating Face Serum, Tea Tree Moisturizer, and Hair Repair Oil were the three most frequently sold products, with relatively similar sales volumes. These products could be highlighted in future marketing campaigns and promotional activities.
4. **Salesperson performance:** Olivia D'Souza generated both the highest revenue and the highest number of transactions. This suggests that her strong performance was not based only on selling high-value products, but also on her ability to generate a high number of sales. Her sales approach could be analyzed to identify practices that could be shared with other salespeople.
5. **March sales:** March was the strongest sales month, with the highest revenue and number of transactions. One possible explanation could be increased customer interest in skincare and self-care at the beginning of the year. However, this would require further analysis of seasonal trends and customer behavior to confirm.
6. **Ava Sharma:** Ava Sharma had the highest average transaction value despite having the lowest number of transactions. This suggests that her individual transactions were relatively high in value, potentially because customers purchased higher-value products or larger quantities. Further analysis could identify which products or sales patterns contributed to her high average transaction value.


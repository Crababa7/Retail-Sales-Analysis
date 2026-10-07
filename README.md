# SQL Retail Sales Analysis
## Project Overview

This project analyzes retail sales data using SQL to evaluate sales performance, customer purchasing behavior, product performance, regional performance, and sales trends.
The project was designed around a series of business questions that progress from basic SQL queries to more advanced analytical techniques such as CTEs, subqueries, ranking functions, and window functions.
The analysis was performed using a retail sales dataset containing 60 orders and 12 variables covering customer information, products, regions, sales channels, quantities, sales amounts, and order status.

## Business Scenario
As a Junior Data Analyst working for a retail company, the objective was to use SQL to transform sales transaction data into meaningful business insights.

Management needs to understand:

- Overall sales performance
- Regional sales performance
- Product category performance
- Customer purchasing behavior
- Online versus Store sales
- Order patterns
- Monthly sales performance
- High-value customers and products

  
## Business Objectives
The main objectives of the project were to:
- Analyze total and average sales performance.
- Compare sales performance across regions.
- Evaluate product category performance.
- Analyze customer purchasing behavior.
- Compare Online and Store sales channels.
- Identify high-value customers and products.
- Analyze monthly sales trends.
- Apply advanced SQL techniques to support business decision-making.

## Dataset
The dataset contains 60 retail sales transactions with the following fields:
Column	            Description
- Order_ID	          Unique order identifier
- Order_Date	        Date the order was placed
- Customer_ID	        Unique customer identifier
- Customer_Name	      Customer name
- Region	            Customer/order region
- Category	          Product category
- Product            	Product purchased
- Quantity	          Number of units purchased
- Unit_Price	        Price per unit
- Sales_Amount	      Total value of the order
- Sales_Channel      	Online or Store
- Order_Status	      Order completion/status
  
## Tools & Technologies
### Tools
- MySQL
- CSV dataset
- GitHub

### SQL Techniques Used
- SELECT
- DISTINCT
- WHERE
- SUM()
- COUNT()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- ORDER BY
- CASE WHEN
- Date functions
- String functions
- Subqueries
- Common Table Expressions (CTEs)
- RANK()
- ROW_NUMBER()
- DENSE_RANK()
- PARTITION BY
- Window functions

## Analysis Process
The project was completed progressively, starting with basic data exploration and moving into more advanced business analysis.

### Section 1 — Basic SQL Queries

- <img width="1549" height="783" alt="Screenshot 2026-09-21 084524" src="https://github.com/user-attachments/assets/5d8126bd-afd3-4ede-a33d-c693b570c4bd" />

The first stage focused on understanding the structure and contents of the sales dataset.
- Questions analyzed
- Display all records from the sales table.
- Retrieve key fields such as Order ID, Order Date, Customer Name, Product, and Sales Amount.
- Identify the unique regions represented in the dataset.
- Identify unique product categories.
- Identify unique sales channels.

SQL concepts demonstrated
SELECT
DISTINCT
Basic data exploration

## Result
The dataset contains multiple Nigerian regions, product categories, and two sales channels: Online and Store.

### Section 2 — Aggregate Functions
Aggregate functions were used to calculate overall business performance.

<img width="1801" height="928" alt="Screenshot 2026-09-21 084641" src="https://github.com/user-attachments/assets/1298676c-159a-4b5b-9da5-3414538d9c48" />

### Questions analyzed
What is the total sales revenue?
What is the average order value?
How many orders were placed?
SQL functions used
SUM()
AVG()
COUNT()

### Results
- Total Sales Revenue: ₦25,831,000
- Average Order Value: ₦430,516.67
- Total Orders: 60
- Total Quantity Sold: 186 units
These calculations provide a high-level view of the company's overall sales performance.

### Section 3 — GROUP BY Analysis
GROUP BY was used to break overall performance into meaningful business categories.


### Questions analyzed
Total sales by region
Total sales by product category
Average order value by sales channel
Regional Sales Performance
Region	Total Sales
Lagos	₦6,615,000
Abuja	₦3,825,000
Kano	₦3,755,000
Port Harcourt	₦3,473,000
Enugu	₦2,996,000
Kaduna	₦2,692,000
Ibadan	₦2,475,000
Product Category Performance
Category	Total Sales
Electronics	₦12,589,000
Furniture	₦7,142,000
Home Appliances	₦6,100,000
Sales Channel Average Order Value
Channel	Average Order Value
Online	₦394,484.85
Store	₦474,555.56
Key observation

Lagos generated the highest total sales, while Electronics was the strongest-performing product category.

### Section 4 — GROUP BY + HAVING
HAVING was used to filter aggregated results and identify areas meeting specific business thresholds.

### Questions analyzed
Regions with total sales above ₦2,000,000
Product categories with total sales above ₦5,000,000
Regions with more than 10 orders

### Key findings
- All seven regions generated more than ₦2 million in sales.
- All three product categories generated more than ₦5 million.
Lagos was the only region with more than 10 orders, recording 15 orders.

SQL concepts demonstrated
- GROUP BY
- HAVING
- Aggregate filtering
  
### Section 5 — SQL Functions
This section focused on manipulating dates and customer names and creating business classifications.

Date analysis
The project used:
- YEAR()
- MONTH() to extract information from Order_Date.

Monthly sales were calculated using the month extracted from each order date.

### Monthly Sales
Month	Sales
January	₦3,795,000
February	₦2,905,000
March	₦3,840,000
April	₦2,633,000
May	₦2,849,000
June	₦3,310,000
July	₦3,515,000
August	₦2,984,000

### Key finding
March recorded the highest monthly sales at ₦3,840,000.

### String functions
The project also used:
- UPPER() to convert customer names to uppercase
- LOWER() to convert customer names to lowercase
- LEFT() to extract the first three characters of customer names

Conditional analysis
CASE WHEN was used to classify orders according to sales amount and quantity.

### Section 6 — CASE WHEN Business Analysis
Conditional logic was used to create business categories from raw transaction data.

### Sales Classification
Orders were classified into:
Low: Below ₦200,000
Medium: ₦200,000–₦500,000
High: Above ₦500,000

### Order Classification
Orders were also categorized according to quantity.
The analysis classified transactions into small, medium, and large order groups.

### Order Status Classification
Orders were classified as:
- Completed
- Cancelled
The dataset contains 1 cancelled order.

### Sales Channel Classification
Orders were classified into:
- Online
- Physical
This allowed the sales channel to be analyzed as a business dimension.

### Section 7 — Subqueries
Subqueries were used to answer higher-level business questions.

### Questions analyzed
- Which region has the highest total sales?
- Which customer has the highest total spending?
- Which product has the highest total quantity sold?

### Results
- Highest-performing region: Lagos
- Highest-spending customer: Emeka Nwosu — ₦3,050,000
- Product with highest quantity sold: Mouse — 22 units
These queries demonstrate how SQL can be used to move from raw transactions to business-level conclusions.

### Section 8 — Common Table Expressions (CTEs)
CTEs were introduced using the WITH clause to make multi-step analysis easier to structure.
- CTE analyses performed
- Customer total spending
- Regional sales ranking
- Product sales above ₦500,000
- Customer spending above ₦1,000,000
 
Example business application
A customer-level CTE was created to calculate total spending by customer before filtering customers whose total purchases exceeded ₦1,000,000.

This separates the calculation stage from the filtering stage and makes complex SQL easier to read and maintain.

### Section 9 — Window Functions
Window functions were used to perform ranking and analytical calculations without collapsing the underlying rows.

#### Techniques used
- RANK()
- ROW_NUMBER()
- SUM() OVER()
- AVG() OVER()
- ORDER BY
- Analysis performed
- Ranking orders by sales amount
- Ranking orders by order date
- Ranking regions
- Ranking customers
- Ranking products
- Business application

Ranking allows management to identify high-performing orders, customers, products, and regions without losing the underlying transaction-level information.

### Section 10 — Advanced Window Functions
The project extended the window-function analysis to customer and product-level comparisons.

Analysis performed
- Identifying customers' first orders using ROW_NUMBER()
- Ranking products within categories
- Ranking customers based on spending
- Applying PARTITION BY

Example
ROW_NUMBER() was used with PARTITION BY Customer_ID and ORDER BY Order_Date to identify the first order made by each customer.
This is useful for understanding customer acquisition and purchasing history.

### Section 11 — Advanced CTE + Window Functions
The project combined CTEs with window functions to perform more advanced analytical tasks.

 <img width="1868" height="884" alt="Screenshot 2026-09-21 084716" src="https://github.com/user-attachments/assets/e6e5bd5f-2fa5-4427-ac50-b056e8db18e4" />
 
Analysis performed
- Calculating total sales by customer
- Ranking customers based on total spending
- Calculating total sales by product
- Ranking products using DENSE_RANK()

Business value
Combining CTEs and window functions allows multiple stages of analysis to be performed within a structured SQL query.
This approach is useful for building more complex business reports and analytical datasets.

## Key Business Findings
Based on the retail dataset:

1. Overall revenue
The business generated:₦25,831,000 from 60 orders.

2. Regional performance
Lagos was the highest-performing region with:₦6,615,000 in total sales.

3. Product performance
Electronics generated the highest category revenue:₦12,589,000

4. Sales channel
Online sales generated:₦13,018,000
while Store sales generated:₦12,813,000

Online therefore generated slightly more total revenue.

5. Monthly performance
March recorded the highest monthly sales:₦3,840,000

6. Customer performance
Emeka Nwosu was the highest-spending customer in the dataset with:₦3,050,000 in total purchases.

7. Product volume
Mouse recorded the highest quantity sold: 22 units

8. Order status
The dataset contained 1 cancelled order out of 60.

## Business Insights
The analysis provides several useful insights for management:

Lagos is the strongest revenue-generating region and should be examined for factors contributing to its performance.
Electronics is the leading product category and represents a major contributor to overall revenue.
Online sales slightly outperform Store sales in total revenue, suggesting that the online channel is an important source of revenue.
Store orders have a higher average order value than Online orders, indicating that customers purchasing through the Store tend to spend more per transaction.
High-value customers represent an important segment for customer retention strategies.
Monthly sales fluctuate throughout the year, with March producing the strongest sales performance in the dataset.
Product quantity and product revenue provide different views of product performance and should be considered separately when making inventory and sales decisions.

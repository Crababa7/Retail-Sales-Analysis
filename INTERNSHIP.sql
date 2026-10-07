-- CREATE DATABASE 
CREATE DATABASE  RETAILCOMPANY;
-- Display all records from the sales table.
SELECT * FROM sql_retail_sales_project_dataset;
-- Display only:Order ID
SELECT Order_ID FROM sql_retail_sales_project_dataset;
-- Display only:Order Date
SELECT Order_Date FROM sql_retail_sales_project_dataset;
-- Display only: Customer_Name
SELECT Customer_Name FROM sql_retail_sales_project_dataset;
-- Display only: Product
SELECT Product FROM sql_retail_sales_project_dataset;
-- Display only: Sales Amount
SELECT Sales_Amount FROM sql_retail_sales_project_dataset;
-- Find all unique regions represented in the dataset.
SELECT DISTINCT Region FROM sql_retail_sales_project_dataset;
-- What is the total sales revenue generated?
SELECT SUM(Sales_Amount) AS Total_Sales_Revenue_Generated FROM sql_retail_sales_project_dataset;
-- What is the Average Order Value?
SELECT AVG(Sales_Amount) AS Avergae_Order_Value FROM sql_retail_sales_project_dataset;
-- How many orders were placed?
SELECT COUNT(Order_ID) FROM sql_retail_sales_project_dataset;
-- Calculate total sales by region
SELECT Region,SUM(Sales_Amount) AS Total_Sales FROM sql_retail_sales_project_dataset GROUP BY Region;
-- Calculate total sales by product category.
SELECT Category,SUM(Sales_Amount) AS Total_sales_By_Product_Category FROM sql_retail_sales_project_dataset GROUP BY Category;
-- Calculate the average order value for each sales channel
SELECT Sales_Channel, AVG(Sales_Amount) AS Average_Order_Value_for_Sales_Channel FROM sql_retail_sales_project_dataset GROUP BY Sales_Channel;
-- Find regions whose total sales exceed ₦2,000,000.
SELECT Region,SUM(Sales_Amount) AS Total_Sales FROM sql_retail_sales_project_dataset GROUP BY Region HAVING Total_Sales>2000000;
-- Find product categories whose total sales exceed ₦5,000,000.
SELECT Category, SUM(Sales_Amount) AS Total_Sales FROM sql_retail_sales_project_dataset GROUP BY Category HAVING Total_Sales>5000000;
-- Find regions with more than 10 orders.
SELECT Region, COUNT(Order_ID) AS Region_Count FROM sql_retail_sales_project_dataset GROUP BY Region HAVING Region_Count>10;
-- Extract the year from Order_Date.
SELECT YEAR(Order_Date) AS Order_Year FROM sql_retail_sales_project_dataset;
-- Extract the month from Order_Date.
SELECT MONTH(Order_Date) AS Order_Month FROM sql_retail_sales_project_dataset;
-- Calculate total sales for each month
SELECT MONTH(Order_Date),SUM(Sales_Amount) AS Total_Sales_For_Each_Month FROM sql_retail_sales_project_dataset GROUP BY MONTH(Order_Date);
-- Display customer names in uppercase
SELECT UPPER(Customer_Name) AS Customer_Names FROM sql_retail_sales_project_dataset;
-- Display customer names in Lowercase
SELECT LOWER(Customer_Name) AS Customer_Names FROM sql_retail_sales_project_dataset;
-- Display the first three characters of each customer's name.
SELECT LEFT(Customer_Name,3) AS First_Three_Characters FROM sql_retail_sales_project_dataset;
-- Create a Sales_Category column:Sales below ₦200,000 → Low,₦200,000–₦500,000 → Medium,Above ₦500,000 → High
SELECT Sales_Amount,CASE WHEN Sales_Amount < 200000 THEN 'Low' WHEN Sales_Amount BETWEEN 200000 AND 500000 THEN 'Medium' WHEN Sales_Amount > 500000 THEN 'High' END AS Sales_Category FROM sql_retail_sales_project_dataset;
-- Create an Order_Type column: Quantity ≤ 2 → Small Order Quantity 3–5 → Medium Order Quantity > 5 → Large Order
SELECT Quantity, CASE WHEN Quantity < 2 THEN 'Small Order' WHEN Quantity BETWEEN 2 AND 5 THEN 'Medium Order' WHEN  Quantity > 5 THEN 'Large Order' END AS Order_Category FROM sql_retail_sales_project_dataset;
-- Classify customers based on their total spending: Below ₦500,000 → Low Value ₦500,000–₦1,000,000 → Medium Value Above ₦1,000,000 → High Value
SELECT Sales_Amount, CASE WHEN Sales_Amount < 500000 THEN 'Low Value' WHEN Sales_Amount BETWEEN 500000 AND 1000000 THEN 'Medium Value' WHEN Sales_Amount > 1000000 THEN 'Large Value' END AS Total_Spending FROM sql_retail_sales_project_dataset;
-- Create a column that identifies cancelled orders as Cancelled and all other orders as Completed.
SELECT Order_ID,Order_Status, CASE WHEN Order_Status = 'Delivered' THEN 'Completed' ELSE 'Cancelled' END AS Status_Category FROM sql_retail_sales_project_dataset;
-- Identify whether each order was made through: Online,Physical Store
SELECT Order_ID,Sales_Channel, CASE WHEN Sales_Channel = 'Online' THEN 'Online' ELSE 'Physical' END AS Channel_Category FROM sql_retail_sales_project_dataset;
-- Find the region with the highest total sales
SELECT region, SUM(Sales_Amount) AS total_sales FROM sql_retail_sales_project_dataset GROUP BY region ORDER BY total_sales DESC LIMIT 1;
-- Find the customer with the highest total spending.
SELECT Customer_ID, SUM(Sales_Amount) AS Highest_total_sales FROM sql_retail_sales_project_dataset GROUP BY Customer_ID ORDER BY Highest_total_sales DESC LIMIT 1;
-- Find the product with the highest total quantity sold
SELECT Product, SUM(Quantity) AS total_quantity_sold FROM sql_retail_sales_project_dataset GROUP BY Product ORDER BY total_quantity_sold DESC LIMIT 1;
-- Create a CTE that calculates total sales for each customer. Then display customers whose total spending exceeds ₦1,000,000.
WITH CustomerSales AS (SELECT customer_id,SUM(Sales_Amount) AS total_spending FROM sql_retail_sales_project_dataset GROUP BY customer_id)SELECT customer_id,total_spending FROM CustomerSales WHERE total_spending > 1000000;
-- Create a CTE calculating total sales by region. Then rank the regions according to their sales.
WITH CustomerSales AS (SELECT region,SUM(Sales_Amount) AS total_sales FROM sql_retail_sales_project_dataset GROUP BY region)SELECT region,total_sales,RANK() OVER (ORDER BY total_sales DESC) AS Customer_Rank FROM CustomerSales;
-- Create a CTE calculating sales by product.Then display products generating more than ₦500,000.
WITH CustomerSales AS (SELECT Product,SUM(Sales_Amount) AS Sales_By_Product FROM sql_retail_sales_project_dataset GROUP BY Product)SELECT Product,Sales_By_Product FROM CustomerSales WHERE Sales_By_Product > 500000;
-- Rank all orders from highest to lowest sales amount.
SELECT Order_ID,Sales_Amount,RANK() OVER (ORDER BY Sales_Amount DESC) AS Sales_Rank FROM sql_retail_sales_project_dataset;
-- Assign a row number to every order based on order date
SELECT Order_ID,Order_Date,RANK() OVER (ORDER BY Order_Date DESC) AS Order_Date_Rank FROM sql_retail_sales_project_dataset;
-- Rank regions based on total sales
SELECT Region,Sales_Amount AS Total_Sales,RANK() OVER (ORDER BY region DESC) AS Region_Rank FROM sql_retail_sales_project_dataset;
-- Use ROW_NUMBER() to identify the first order made by each customer
WITH RankedOrders AS (SELECT customer_id,order_id,order_date,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS order_number FROM sql_retail_sales_project_dataset)SELECT * FROM RankedOrders WHERE order_number = 1;
-- Rank customers within each region based on their total spending.
SELECT Region,Customer_ID,Sales_Amount AS Total_Spending, RANK() OVER (ORDER BY Customer_ID DESC) AS Customer_Rank FROM sql_retail_sales_project_dataset;
-- Rank products within each category using:RANK() OVER(PARTITION BY Category ORDER BY ...)
SELECT Product,Category AS Category_Ranking, RANK() OVER (PARTITION BY Category ORDER BY Product DESC) AS Category_Ranking FROM sql_retail_sales_project_dataset;
-- Create a CTE containing total sales by customer.Then use RANK() to rank customers from highest to lowest spending.
WITH Customersales AS (SELECT Customer_ID, SUM(Sales_Amount) AS Total_Sales FROM sql_retail_sales_project_dataset GROUP BY Customer_ID)SELECT Customer_ID,Total_Sales,RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank FROM CustomerSales;
-- Create a CTE containing total sales by product.Use DENSE_RANK() to rank products within each category.
WITH CustomerSales AS (SELECT Product,SUM(Sales_Amount) AS Total_Sales FROM sql_retail_sales_project_dataset GROUP BY Product)SELECT Product,Total_Sales,DENSE_RANK() OVER (ORDER BY Total_Sales DESC) AS Product_Rank FROM CustomerSales;
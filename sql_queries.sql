-- SQL QUERIES FOR RETAIL BUSINESS ANALYSIS
-- Database: retail_analysis
-- By: Chandra Prakash Choudhary

-- Query 1: Total Sales by Category
SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Query 2: Total Profit by Category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 3: Top 5 Profitable Products
SELECT 
    Product_Name,
    Category,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name, Category
ORDER BY Total_Profit DESC
LIMIT 5;

-- Query 4: Monthly Sales Trend
SELECT 
    STRFTIME('%Y-%m', Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- Query 5: Region-wise Sales
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 6: Low Performing Products (Negative Profit)
SELECT 
    Product_Name,
    Category,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name, Category
HAVING Total_Profit < 0
ORDER BY Total_Profit;

-- Query 7: Category-wise Product Count
SELECT 
    Category,
    COUNT(DISTINCT Product_Name) AS Product_Count
FROM retail_sales
GROUP BY Category;

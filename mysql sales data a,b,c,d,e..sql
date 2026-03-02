USE amazingmart_project;
SELECT productName,
SUM(Sales) AS TotalSales
FROM orderbreakdown
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 5;

USE amazingmart_project;

SELECT l.Region,
       l.CustomerName,
       AVG(o.Sales) AS AvgPurchase
FROM listoforders l
JOIN orderbreakdown o
ON l.OrderID = o.OrderID
GROUP BY l.Region, l.CustomerName
ORDER BY l.Region;

SELECT CustomerName
FROM listoforders
WHERE OrderID NOT IN (
    SELECT DISTINCT OrderID FROM orderbreakdown
);



SELECT 
    DATE_FORMAT(l.OrderDate, '%Y-%m') AS Month,
    SUM(o.Sales) AS Revenue
FROM listoforders l
JOIN orderbreakdown o
    ON l.OrderID = o.OrderID
WHERE YEAR(l.OrderDate) = 2023
GROUP BY Month
ORDER BY Month;

SELECT Category,
       SUM(Profit) AS TotalProfit
FROM orderbreakdown
GROUP BY Category
ORDER BY TotalProfit DESC
LIMIT 3;


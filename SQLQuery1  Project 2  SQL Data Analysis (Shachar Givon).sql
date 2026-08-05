Project 2 – SQL Data Analysis
-----------------------------

/*
1.Write an SQL query that calculates the annual sales amount and linear annual revenue for each year.
In addition, calculate the growth rate of linear annual revenue compared to the previous year.
Notes: Linear Annual Revenue: Previous. Calculate the monthly average and multiply by 12.
*/

--1--
WITH MonthlySales AS
(
SELECT
YEAR(InvoiceDate) AS 'SalesYear',
MONTH(InvoiceDate) AS 'SalesMonth',
SUM(ExtendedPrice) AS 'MonthlyRevenue'
FROM Sales.Invoices I JOIN Sales.InvoiceLines IL
ON I.InvoiceID = IL.InvoiceID
GROUP BY YEAR(InvoiceDate),MONTH(InvoiceDate)),

AnnaulSales AS
(
SELECT SalesYear,
SUM(MonthlyRevenue) AS 'TotalIncome',
AVG(MonthlyRevenue) * 12 AS 'LinearAnnualRevenue'
FROM MonthlySales
GROUP BY SalesYear)

SELECT SalesYear,TotalIncome,
ROUND(LinearAnnualRevenue,2) AS LinearAnnualRevenue,
LEFT(CAST(ROUND((LinearAnnualRevenue - LAG(LinearAnnualRevenue) OVER(ORDER BY SalesYear)) * 100.0
/LAG(LinearAnnualRevenue) OVER(ORDER BY SalesYear),2)AS varchar(255)),4)+'%' AS 'GrowthPercent'
FROM AnnaulSales
ORDER BY SalesYear

/*
Write an SQL query that displays the top five customers for each quarter by net income.
*/
--2--
WITH CustomerQuarterRevenue AS
(
SELECT
YEAR(InvoiceDate) AS 'SalesYear',
DATEPART(QUARTER, InvoiceDate) AS 'QuarterNumber',
C.CustomerID, CustomerName,
SUM(UnitPrice*Quantity) AS 'NetRevenue'
FROM Sales.Invoices I JOIN Sales.InvoiceLines IL
ON I.InvoiceID = IL.InvoiceID
JOIN Sales.Customers C
ON I.CustomerID = C.CustomerID
GROUP BY YEAR(InvoiceDate), DATEPART(QUARTER, InvoiceDate),
C.CustomerID,C.CustomerName),

RankedCustomers AS
(
SELECT*,
RANK() OVER (PARTITION BY SalesYear, QuarterNumber ORDER BY NetRevenue DESC) AS 'RankNumber'
FROM CustomerQuarterRevenue)
SELECT
SalesYear, QuarterNumber, CustomerName, RankNumber ,NetRevenue
FROM RankedCustomers
WHERE RankNumber <= 5
ORDER BY SalesYear,QuarterNumber,RankNumber

/*
3. Write a query that returns the top 10 products that generated the highest total profit based on rows sold,
ranking the products by total profit, and returning their item ID, item name, and total profit.
*/

--3--
SELECT TOP 10 SI.StockItemID,StockItemName,
SUM(IL.UnitPrice * IL.Quantity) AS 'TotalProfit'
FROM Sales.InvoiceLines AS IL JOIN Warehouse.StockItems AS SI
ON IL.StockItemID = SI.StockItemID
GROUP BY SI.StockItemID, StockItemName
ORDER BY TotalProfit DESC

--------------------------------------------------------------
WITH ProductProfit AS
(
SELECT
SI.StockItemID,StockItemName,
SUM(IL.UnitPrice * IL.Quantity) AS 'TotalProfit'
FROM Sales.InvoiceLines AS IL JOIN Warehouse.StockItems AS SI
ON IL.StockItemID = SI.StockItemID
GROUP BY SI.StockItemID, StockItemName
),

RankedProducts AS
(
SELECT*,
ROW_NUMBER() OVER (ORDER BY TotalProfit DESC) AS 'RankNumber'
FROM ProductProfit)
SELECT StockItemID, StockItemName,TotalProfit
FROM RankedProducts
WHERE RankNumber <= 10
ORDER BY RankNumber

/*
4. Write a query that finds all inventory items that are still valid,
calculates the nominal profit for each item (the difference between the suggested retail price and the unit price),
and ranks the items by nominal profit in descending order.
Also display the serial number of each item in this order.
*/

--4--
SELECT
ROW_NUMBER() OVER(ORDER BY RecommendedRetailPrice - UnitPrice DESC) AS 'RowNumber',
StockItemID,StockItemName, UnitPrice, RecommendedRetailPrice, 
RecommendedRetailPrice - UnitPrice AS 'NominalProfit'
FROM Warehouse.StockItems
WHERE ValidTo = '9999-12-31 23:59:59.9999999'
ORDER BY NominalProfit DESC

/*
5. Write a query that displays, for each supplier code and supplier name,
the combination of product details in stock for that supplier, separated by ',//'.
The product details should include the product code and product name from the product inventory.

*/

--5--
SELECT S.SupplierID,SupplierName,
STRING_AGG(CAST(StockItemID AS VARCHAR(255)) + ' ' + StockItemName,',  //  ') AS 'ProductDetails'
FROM Purchasing.Suppliers AS S JOIN Warehouse.StockItems AS SI
ON S.SupplierID = SI.SupplierID
GROUP BY S.SupplierID,S.SupplierName
ORDER BY S.SupplierID

/*
6. Write a query that displays the top 5 customers by total purchase spend, and their geographic location details.
*/

--6--
SELECT TOP 5
C.CustomerID,CityName,CountryName,Continent,Region,
SUM(ExtendedPrice) AS 'TotalPurchases'
FROM Sales.Customers AS C JOIN Sales.Invoices AS I
ON C.CustomerID = I.CustomerID
JOIN Sales.InvoiceLines AS IL
ON I.InvoiceID = IL.InvoiceID
JOIN Application.Cities AS City
ON C.DeliveryCityID = City.CityID
JOIN Application.StateProvinces AS SP
ON City.StateProvinceID = SP.StateProvinceID
JOIN Application.Countries AS Country
ON SP.CountryID = Country.CountryID
GROUP BY C.CustomerID,CityName, CountryName, Continent, Region
ORDER BY TotalPurchases DESC

/*
7. Write a query that displays the amount of products in an order for each month of the year and the cumulative amount each year.
Pay attention to the visibility of the report.
A row should be displayed that highlights the year-over-year summary.
*/
   
--7--
WITH MonthlySales AS
(
SELECT
YEAR(InvoiceDate) AS 'InvoiceYear',
MONTH(InvoiceDate) AS 'InvoiceMonth',
SUM(UnitPrice * Quantity) AS 'MonthlyTotal'
FROM Sales.Invoices AS I JOIN Sales.InvoiceLines AS IL
ON I.InvoiceID = IL.InvoiceID
GROUP BY YEAR(I.InvoiceDate), MONTH(I.InvoiceDate)),

MonthlySalesCumulative AS
(
SELECT InvoiceYear, InvoiceMonth, MonthlyTotal,
SUM(MonthlyTotal) OVER (PARTITION BY InvoiceYear ORDER BY InvoiceMonth
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'CumulativeTotal'
FROM MonthlySales)

SELECT InvoiceYear,
     CASE
        WHEN GROUPING(InvoiceMonth) = 1 THEN 'Grand Total'
        ELSE CAST(InvoiceMonth AS VARCHAR)
     END AS 'InvoiceMonth',
SUM(MonthlyTotal) AS 'MonthlyTotal',
MAX(CumulativeTotal) AS 'CumulativeTotal'
FROM MonthlySalesCumulative
GROUP BY ROLLUP (InvoiceYear,InvoiceMonth)
HAVING GROUPING(InvoiceYear) = 0
ORDER BY InvoiceYear,
    CASE
       WHEN GROUPING(InvoiceMonth) = 1 THEN 13
       ELSE InvoiceMonth
    END

/*
8. Display the number of orders made each month of the year using a matrix (pivot).
*/

--8--

SELECT *
FROM
(
SELECT
OrderID,
MONTH(OrderDate) AS OrderMonth,
YEAR(OrderDate) AS OrderYear
FROM Sales.Orders) AS OrderCountTable
PIVOT
(COUNT(OrderID) FOR OrderYear IN ([2013],[2014],[2015],[2016])) AS PVT
ORDER BY OrderMonth


/*
9. How can you identify potential customers who are likely to abandon your order based on their order patterns?
A customer will be considered a 'potential customer' if the time elapsed since their last order,
relative to the last order in the entire table, is greater than twice their average time between orders.
In addition, the query should include the customer's name, the current order date, the date of their previous order,
the average number of days the customer places an order, the customer's last order date, the number of days since the customer's last churn (relative to the last order date in the table)
, and the customer status (Active or Potential Churn).
*/

--9--
WITH CustomerOrders AS
(
SELECT C.CustomerID,CustomerName,OrderDate,
LAG(O.OrderDate) OVER (PARTITION BY C.CustomerID ORDER BY O.OrderDate) AS 'PreviousOrderDate'
FROM Sales.Customers AS C JOIN Sales.Orders AS O
ON C.CustomerID = O.CustomerID),

OrderGaps AS
(
SELECT CustomerID,CustomerName,OrderDate,PreviousOrderDate,
DATEDIFF(DAY, PreviousOrderDate, OrderDate) AS 'DaysBetweenOrders'
FROM CustomerOrders),

CustomerAVG AS
(
SELECT CustomerID,
AVG(CAST(DaysBetweenOrders AS FLOAT)) AS 'AvgDaysBetweenOrders',
MAX(OrderDate) AS 'LastCustOrderDate'
FROM OrderGaps
WHERE PreviousOrderDate IS NOT NULL
GROUP BY CustomerID),

LastCustomerOrder AS
(SELECT MAX(OrderDate) AS 'LastOrder'
FROM Sales.Orders)

SELECT OG.CustomerID, CustomerName,OrderDate,
PreviousOrderDate,AvgDaysBetweenOrders,LastCustOrderDate,LastOrder,
DATEDIFF(DAY, LastCustOrderDate, LastOrder) AS 'DaysSinceLastOrder',
     CASE
        WHEN DATEDIFF(DAY,LastCustOrderDate,LastOrder)> AvgDaysBetweenOrders * 2
            THEN 'Potential Churn'
        ELSE 'Active'
     END AS 'CustomerStatus'
FROM OrderGaps AS OG JOIN CustomerAVG AS CA
ON OG.CustomerID = CA.CustomerID
CROSS JOIN LastCustomerOrder AS LCO
ORDER BY CustomerID,OrderDate

/*
10. How can you examine a company's business risk by customer category?
Identify the customer categories with the highest number of unique customers, assigning common names to customers that begin with "Wingtip" or "Tailspin."
Consider the relative distribution of customers in each category out of the total number of customers,
and assess where the highest risk exists based on the concentration of customers in each category.
*/

--10--
WITH CustomerNames AS
(
SELECT CustomerCategoryName,
     CASE
        WHEN C.CustomerName LIKE 'Wingtip%' THEN 'Wingtip'
        WHEN C.CustomerName LIKE 'Tailspin%' THEN 'Tailspin'
        ELSE C.CustomerName
     END AS 'CommonCustomerName'
FROM Sales.Customers AS C JOIN Sales.CustomerCategories AS CC
ON C.CustomerCategoryID = CC.CustomerCategoryID),

CategoryDetails AS
(
SELECT CustomerCategoryName,
COUNT(DISTINCT CommonCustomerName) AS 'CustomerCount'
FROM CustomerNames
GROUP BY CustomerCategoryName),

TotalCustomers AS
(
SELECT COUNT(DISTINCT CommonCustomerName) AS 'TotalCustomers'
FROM CustomerNames)

SELECT CustomerCategoryName, CustomerCount,TotalCustomers,
LEFT(CAST(CustomerCount * 100.0 / TotalCustomers AS VARCHAR(255)),5)+ '%' AS 'DistributionFactor'
FROM CategoryDetails AS CD CROSS JOIN TotalCustomers AS TC
ORDER BY CustomerCategoryName 



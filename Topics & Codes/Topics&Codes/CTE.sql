/* Working with CTE - Common Table Expression */

SELECT OrderYear,COUNT(*) AS SalesCount
FROM (
	SELECT YEAR(OrderDate) AS OrderYear,SalesOrderID
	FROM Sales.SalesOrderHeader
	) AS SalesDetails
WHERE OrderYear = '2006'
GROUP BY OrderYear
GO

WITH SalesDetails
AS (
	SELECT YEAR(OrderDate) AS OrderYear,SalesOrderID
	FROM Sales.SalesOrderHeader
)

SELECT OrderYear, COUNT(*) AS SalesCount
FROM SalesDetails
WHERE OrderYear = '2006'
GROUP BY OrderYear

SELECT *
FROM (
	SELECT BusinessEntityID,NationalIDNumber,YEAR(BirthDate) AS BirthYear,
	YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
	) AS Hire_Emp
WHERE HireYear >= 2004
GO

WITH Hire_Emp
AS (
	SELECT BusinessEntityID,NationalIDNumber,YEAR(BirthDate) AS BirthYear,
	YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
)
SELECT *
FROM Hire_Emp
WHERE HireYear >= 2004

SELECT 
	SalesCurrentYear.SalesYear,
	SalesCurrentYear.TotalSales AS AnnualSales,
	SalesPriorYear.TotalSales AS PriorYearSales
FROM (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
	) AS SalesCurrentYear
LEFT OUTER JOIN (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
	) AS SalesPriorYear
ON SalesCurrentYear.SalesYear = SalesPriorYear.SalesYear
ORDER BY 1
GO
/* OR */
WITH SalesByYear
AS (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
)

SELECT 
	CurrentYearSales.SalesYear,
	CurrentYearSales.TotalSales AS AnnualSales,
	CurrentYearSales.TotalSales AS PriorYearSales
FROM SalesByYear CurrentYearSales
LEFT OUTER JOIN SalesByYear AS PriorYearSales
ON CurrentYearSales.SalesYear = PriorYearSales.SalesYear
ORDER BY 1

WITH S1
AS (
	SELECT YEAR(OrderDate) AS SalesYear,SalesOrderID,TotalDue
	FROM Sales.SalesOrderHeader
),
S2 AS (
	SELECT SalesYear,COUNT(SalesOrderID) AS SalesCount,
	SUM(TotalDue) AS AnnualSales
	FROM S1
	GROUP BY SalesYear
)

SELECT SalesYear, SalesCount, AnnualSales
FROM S2
WHERE SalesCount > 5000
ORDER BY 1

/* Common Table Expressions Lab Problems */

/* 1. Will the following code execute properly? Why or why not?

WITH Sales
AS (
SELECT YEAR(OrderDate), TotalDue
FROM Sales.SalesOrderHeader
)

SELECT *
FROM Sales
*/

/*

WITH Sales
AS (
SELECT YEAR(OrderDate), TotalDue
FROM Sales.SalesOrderHeader
)

SELECT *
FROM Sales

*/

/* Gives Error */

/* 2.Using CTEs, find out, for each year the company hired new employees, how many employees
the company hired for each year and how many employees they hired the previous year. Use
the HumanResources.Employee table for this lab question. You should have return three
columns: the hire year, the number of employees hired that year, and the number of employees
hired the year before. */

WITH Hires
AS (
	SELECT
		YEAR(HireDate) AS HireYear,
		BusinessEntityID
	FROM HumanResources.Employee
), HireByYear AS (
	SELECT
		HireYear,
		COUNT(*) AS HireCount
	FROM Hires
	GROUP BY HireYear
)
SELECT
	H1.HireYear,
	H1.HireCount AS CurrentYearHireCount,
	H2.HireCount AS PriorYearHireCount
FROM HireByYear H1
LEFT OUTER JOIN HireByYear H2
ON H1.HireYear = H2.HireYear + 1
statement, find the number of products that began selling per year (using the
Production.Product table and the SellStartDate column). */
AS (
	SELECT
		YEAR(SellStartDate) AS ProductSellStartYear,
		ProductID
	FROM Production.Product
)
SELECT
	ProductSellStartYear,
	COUNT(*) AS ProductCount
FROM Products
GROUP BY ProductSellStartYear
the year 2006. No functions should be used in either the WHERE or the GROUP BY clause of
your SELECT statement. */
GO
WITH SalesMonth
AS (
	SELECT
		MONTH(OrderDate) AS OrderMonth,
	TotalDue
	FROM Sales.SalesOrderHeader
	WHERE YEAR(OrderDate) = 2006
)
SELECT
	OrderMonth,
	SUM(TotalDue) AS MonthlySales
	FROM SalesMonth
	GROUP BY OrderMonth
	ORDER BY 1
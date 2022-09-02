/* Nested Derived Tables */

SELECT *
FROM (
	SELECT
		BusinessEntityID,
		NationalIDNumber,
		BirthYear,
		YEAR(HireDate) AS HireYear
	FROM (
		SELECT 
			BusinessEntityID,
			NationalIDNumber,
			YEAR(BirthDate) AS BirthYear,
			HireDate
		FROM HumanResources.Employee
		) AS InnerNested
	) AS OuterNested

SELECT *
FROM (
	SELECT
		BusinessEntityID,
		NationalIDNumber,
		BirthYear,
		YEAR(HireDate) AS HireYear
	FROM (
		SELECT 
			BusinessEntityID,
			NationalIDNumber,
			YEAR(BirthDate) AS BirthYear,
			HireDate
		FROM HumanResources.Employee
		) AS InnerNested
	) AS OuterNested
WHERE HireYear < 2004

SELECT *
FROM (
	SELECT
		BusinessEntityID,
		NationalIDNumber,
		BirthYear,
		YEAR(HireDate) AS HireYear
	FROM (
		SELECT 
			BusinessEntityID,
			NationalIDNumber,
			YEAR(BirthDate) AS BirthYear,
			HireDate
		FROM HumanResources.Employee
		) AS InnerNested
		WHERE BirthYear < 1960
	) AS OuterNested
WHERE HireYear < 2004

SELECT 
	Sales_by_Year.SalesYear,
	Sales_by_Year.TotalRevenue,
	Hires_by_Year.NewHireCount
FROM (
	SELECT 
		SalesYear,
		SUM(TotalDue) AS TotalRevenue
	FROM (
		SELECT YEAR(OrderDate) AS SalesYear, TotalDue	
		FROM Sales.SalesOrderHeader
		) AS SalesDetails
	GROUP BY SalesYear
	) AS Sales_by_Year
LEFT OUTER JOIN (
	SELECT 
		HireYear ,
		COUNT(BusinessEntityID) AS NewHireCount
	FROM (
		SELECT 
			YEAR(HireDate) AS HireYear, 
			BusinessEntityID
		FROM HumanResources.Employee
		) AS EmployeeDetails
	GROUP BY HireYear
	) AS Hires_by_Year
ON Hires_by_Year.HireYear = Sales_by_Year.SalesYear
ORDER BY 1

--------------------------------

SELECT 
		SalesYear,
		SUM(TotalDue) AS TotalRevenue
	FROM (
		SELECT YEAR(OrderDate) AS SalesYear, TotalDue	
		FROM Sales.SalesOrderHeader
		) AS SalesDetails
	GROUP BY SalesYear

SELECT 
		HireYear ,
		COUNT(BusinessEntityID) AS NewHireCount
	FROM (
		SELECT 
			YEAR(HireDate) AS HireYear, 
			BusinessEntityID
		FROM HumanResources.Employee
		) AS EmployeeDetails
	GROUP BY HireYear
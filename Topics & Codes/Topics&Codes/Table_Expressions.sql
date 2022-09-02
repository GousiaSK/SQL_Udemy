/* Working with Table Expressions */

SELECT *
FROM HumanResources.Employee

/* Need to Use AS otherwise Error will generated PersonName is table -- Derived Table */

SELECT *
FROM (
	SELECT BusinessEntityID,FirstName,LastName
	FROM Person.Person
	) AS PersonName

SELECT YEAR(OrderDate) AS OrderYear,COUNT(*) AS SalesCount
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = '2006'
GROUP BY YEAR(OrderDate)

/* Or */

SELECT OrderYear,COUNT(*) AS SalesCount
FROM (
	SELECT YEAR(OrderDate) AS OrderYear,SalesOrderID
	FROM Sales.SalesOrderHeader
	) AS SalesDetails
WHERE OrderYear = 2006
GROUP BY OrderYear

SELECT *
FROM HumanResources.Employee

SELECT *
FROM (
	SELECT 
		BusinessEntityID,
		NationalIDNumber,
		YEAR(BirthDate) AS BirthYear,
		YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
	) AS HR_Employee
WHERE BirthYear < 1960

SELECT *
FROM (
	SELECT 
		BusinessEntityID,
		NationalIDNumber,
		YEAR(BirthDate) AS BirthYear,
		YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
	) AS HR_Employee
WHERE HireYear >= 2004

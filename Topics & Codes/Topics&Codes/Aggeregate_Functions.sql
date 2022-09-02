/* Aggregate functions */

SELECT TOP 100 *
FROM Sales.SalesOrderHeader

SELECT MAX(TotalDue)
FROM Sales.SalesOrderHeader

SELECT TotalDue
FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC

SELECT MIN(TotalDue)
FROM Sales.SalesOrderHeader

SELECT TotalDue
FROM Sales.SalesOrderHeader
ORDER BY TotalDue

SELECT *
FROM Sales.SalesOrderHeader

SELECT COUNT(*)
FROM Sales.SalesOrderHeader

SELECT TOP 100 *
FROM Sales.SalesOrderHeader

SELECT COUNT(SalesOrderID)
FROM Sales.SalesOrderHeader

SELECT COUNT(SalesPersonID)
FROM Sales.SalesOrderHeader

SELECT COUNT(*)
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL

SELECT *
FROM Person.Person

SELECT COUNT(*)
FROM Person.Person

SELECT COUNT(FirstName)
FROM Person.Person

SELECT COUNT(DISTINCT FirstName)
FROM Person.Person

SELECT TOP 100 *
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader

SELECT SUM(TotalDue)
FROM Sales.SalesOrderHeader

SELECT TOP 100 *
FROM Sales.SalesOrderHeader

SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'


SELECT SUM(TotalDue)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'

/*
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

SELECT FirstName
FROM Person.Person

SELECT MAX(FirstName)
FROM Person.Person

SELECT MIN(FirstName)
FROM Person.Person

/* 
Gives Error 
SELECT SUM(FirstName)
FROM Person.Person
*/

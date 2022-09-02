/* Grouping with the Group By Clause */

/* 
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT SalesPersonID, SUM(TotalDue) AS [Total Dues]
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID

/* 
Gives Error
SELECT SalesPersonID,TotalDue
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID
*/

SELECT *
FROM Production.ProductInventory

SELECT ProductID, SUM(Quantity) AS [Total In Stock]
FROM Production.ProductInventory
GROUP BY ProductID

SELECT 
	ProductID, 
	SUM(Quantity) AS [Total In Stock],
	COUNT(*) AS [Total Locations]
FROM Production.ProductInventory
GROUP BY ProductID

SELECT *
FROM Sales.SalesOrderHeader

SELECT 
	ST.Name AS [TerriiTory Name],
	P.FirstName + ' ' + P.LastName AS [Sales Person Name],
	SUM(TotalDue) AS [Total Sales]
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesPerson SP
ON SP.BusinessEntityID = SOH.SalesPersonID
INNER JOIN Person.Person P
ON P.BusinessEntityID = SP.BusinessEntityID
INNER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID 
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY ST.Name, P.FirstName+' '+ P.LastName
ORDER BY 1, 2

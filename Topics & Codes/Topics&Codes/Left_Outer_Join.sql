/* Left Outer Join */

/* Table A --left table will return Table A, Right outer join --Table B */

SELECT P.Name,P.ProductNumber,PS.Name AS ProductSubCategoryName
FROM Production.Product P
INNER JOIN Production.ProductSubcategory PS
ON PS.ProductSubcategoryID = P.ProductSubcategoryID	

/*295 ROWS*/

SELECT P.Name,P.ProductNumber,PS.Name AS ProductSubCategoryName
FROM Production.Product P
LEFT OUTER JOIN Production.ProductSubcategory PS
ON PS.ProductSubcategoryID = P.ProductSubcategoryID	

/*RIGHT OUTER JOIN*/

SELECT P.Name,P.ProductNumber,PS.Name AS ProductSubCategoryName
FROM Production.ProductSubcategory PS
RIGHT OUTER JOIN Production.Product P
ON PS.ProductSubcategoryID = P.ProductSubcategoryID	

/*Left Outer join part-2*/

SELECT *
FROM Sales.SalesOrderHeader

SELECT *
FROM Sales.SalesPerson

SELECT 
	P.FirstName, P.LastName,
	SO.SalesOrderNumber,
	SO.TotalDue AS Salesamount,
	T.Name AS Territoryname
FROM Sales.SalesPerson SP
LEFT OUTER JOIN Sales.SalesOrderHeader SO
ON SP.BusinessEntityID = SO.SalesPersonID
LEFT OUTER JOIN HumanResources.Employee E
ON E.BusinessEntityID = SP.BusinessEntityID
LEFT OUTER JOIN Person.Person P
ON P.BusinessEntityID = E.BusinessEntityID
LEFT OUTER JOIN Sales.SalesTerritory T
ON T.TerritoryID = SO.TerritoryID
WHERE T.Name = 'Northwest'
ORDER BY TotalDue DESC
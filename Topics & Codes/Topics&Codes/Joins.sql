/* Joins */

/* It returns columns from different tables in the same time */

SELECT *
FROM HumanResources.Employee

/* 1.INNER JOIN -- Intersection of two sets */

SELECT *
FROM Production.Product

SELECT *
FROM Production.ProductSubcategory

SELECT P.Name,P.ProductNumber
FROM Production.Product P ---Alias ---
INNER JOIN Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID

SELECT P.Name,P.ProductNumber,PS.Name AS [Product SubCategory Name]
FROM Production.Product P ---Alias ---
INNER JOIN Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID

SELECT P.Name,P.ProductNumber,P.ProductSubcategoryID ,PS.Name AS [Product SubCategory Name]
FROM Production.Product P ---Alias ---
INNER JOIN Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID

SELECT *
FROM Production.ProductSubcategory

SELECT *
FROM Production.ProductCategory

SELECT PS.Name [Product Sub Category Name],PC.Name AS [Product Category Name]
FROM Production.ProductCategory PC 
INNER JOIN Production.ProductSubcategory PS
ON PC.ProductCategoryID = PS.ProductCategoryID

SELECT *
FROM Person.Person

SELECT *
FROM Person.EmailAddress

SELECT P.FirstName,P.LastName,E.EmailAddress,PP.PhoneNumber
FROM Person.Person P
INNER JOIN Person.EmailAddress E
ON E.BusinessEntityID = P.BusinessEntityID
INNER JOIN Person.PersonPhone PP
ON PP.BusinessEntityID = P.BusinessEntityID
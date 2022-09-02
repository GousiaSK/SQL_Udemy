/* Case Statements */

SELECT ProductID,ListPrice
FROM Production.Product
WHERE ListPrice <> 0

SELECT ProductID,ListPrice,
	CASE 
		WHEN ListPrice > 100 THEN 'Expensive'
		ELSE 'InExpensive'
	END AS Product_Status
FROM Production.Product
WHERE ListPrice <> 0

SELECT ProductID,ListPrice,
	CASE 
		WHEN ListPrice > 100 THEN 'Expensive'
		WHEN ListPrice <= 100 THEN 'InExpensive'
	END AS Product_Status
FROM Production.Product
WHERE ListPrice <> 0

WITH CustomerAges
AS (
	SELECT P.FirstName,P.LastName,
		FLOOR(DATEDIFF(DAY,PD.BirthDate,GETDATE())/365.25) AS Age
	FROM Sales.vPersonDemographics PD
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = PD.BusinessEntityID
)

SELECT *,
	CASE
		WHEN Age IS NULL THEN 'UnKnown Age'
		WHEN Age BETWEEN 0 AND 17 THEN 'Under 18'
		WHEN Age BETWEEN 18 AND 24 THEN '18 To 24'
		WHEN Age BETWEEN 25 AND 34 THEN '25 To 34'
		ELSE 'Over 35'
	END AS AgeRange
FROM CustomerAges

GO

WITH CustomerAges
AS (
	SELECT P.FirstName,P.LastName,
		FLOOR(DATEDIFF(DAY,PD.BirthDate,GETDATE())/365.25) AS Age
	FROM Sales.vPersonDemographics PD
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = PD.BusinessEntityID
),
CustomerAgeRanges
AS (
	SELECT *,
		CASE
			WHEN Age IS NULL THEN 'UnKnown Age'
			ELSE 'Over 35'
		END AS AgeRange
	FROM CustomerAges
)
SELECT AgeRange,COUNT(*) AS Customer_Count
FROM CustomerAgeRanges
GROUP BY AgeRange
ORDER BY 1

SELECT 
	PD.BusinessEntityID,
	P.FirstName,
	P.LastName,
	CASE
		WHEN PD.Gender = 'M' THEN 'Male'
		WHEN PD.Gender = 'F' THEN 'Female'
		ELSE 'Not Specified'
	END AS Gendervalue
FROM Sales.vPersonDemographics PD
INNER JOIN Person.Person P
ON P.BusinessEntityID = PD.BusinessEntityID

SELECT TOP 100 *
FROM Person.Person

SELECT 
	MiddleName,
	COALESCE(MiddleName,' ') AS Mid,
	CASE
		WHEN MiddleName IS NULL THEN ' '
		ELSE MiddleName
	END AS Midname
FROM Person.Person

GO

WITH CustomerSales
AS (
	SELECT
		P.BusinessEntityID,
		SUM(TotalDue) AS TotalSalesAmount
	FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.Customer SC
	ON SC.CustomerID = SOH.CustomerID
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = SC.PersonID
	GROUP BY P.BusinessEntityID
), 
CustomerSalesRange
AS (
	SELECT 
		P.FirstName+' '+P.LastName AS CustomerName,
		CASE 
			WHEN CS.TotalSalesAmount BETWEEN 0 AND 149.99 THEN 'Under 150'
			WHEN CS.TotalSalesAmount BETWEEN 150 AND 499.99 THEN '150 - 500'
			WHEN CS.TotalSalesAmount BETWEEN 500 AND 999.99 THEN '500-1000'
			WHEN CS.TotalSalesAmount BETWEEN 1000 AND 4999.99 THEN '1000-5000'
			WHEN CS.TotalSalesAmount BETWEEN 5000 AND 14999.99 THEN '5000-15000'
			ELSE 'Over 15000'
		END AS SalesRange
	FROM CustomerSales CS
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = CS.BusinessEntityID
)
SELECT SalesRange, COUNT(*) AS [Country is Large]
FROM CustomerSalesRange
GROUP BY SalesRange
ORDER BY 1

WITH CustomerSales
AS (
	SELECT
		P.BusinessEntityID,
		SUM(TotalDue) AS TotalSalesAmount
	FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.Customer SC
	ON SC.CustomerID = SOH.CustomerID
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = SC.PersonID
	GROUP BY P.BusinessEntityID
), 
CustomerSalesRange
AS (
	SELECT 
		P.FirstName+' '+P.LastName AS CustomerName,
		CASE 
			WHEN CS.TotalSalesAmount BETWEEN 0 AND 149.99 THEN 'Under 150'
			WHEN CS.TotalSalesAmount BETWEEN 150 AND 499.99 THEN '150 - 500'
			WHEN CS.TotalSalesAmount BETWEEN 500 AND 999.99 THEN '500-1000'
			WHEN CS.TotalSalesAmount BETWEEN 1000 AND 4999.99 THEN '1000-5000'
			WHEN CS.TotalSalesAmount BETWEEN 5000 AND 14999.99 THEN '5000-15000'
			ELSE 'Over 15000'
		END AS SalesRange
	FROM CustomerSales CS
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = CS.BusinessEntityID
)
SELECT SalesRange, COUNT(*) AS [Country is Large]
FROM CustomerSalesRange
GROUP BY SalesRange
ORDER BY 
	CASE
		WHEN SalesRange = 'Under 150' THEN 1
		WHEN SalesRange = '150 - 500' THEN 2
		WHEN SalesRange = '500-1000' THEN 3
		WHEN SalesRange = '1000-5000' THEN 4
		WHEN SalesRange = '5000-15000' THEN 5
		ELSE 6
		END
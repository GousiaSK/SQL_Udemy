/* Where Clause */

/* SELECT [Column 1],[Column 2]....[Colu,mn N]
FROM Table Name
WHERE [Column Name] {Comparision Operator} [Some Value] */

SELECT *
FROM Production.Product

SELECT *
FROM Production.Product
WHERE ListPrice>10

 /* Simple Where Clause Filters out Data */

 SELECT *
 FROM Production.Product
 WHERE ListPrice>=10

 SELECT *
 FROM Production.Product
 WHERE ListPrice<10

 SELECT *
 FROM Production.Product
 WHERE ListPrice=10

 SELECT *
 FROM Production.Product
 WHERE ListPrice<>10

 /* <> Not Equal Operator */

 SELECT *
 FROM HumanResources.vEmployee

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName='Chris'

/* Most Databases are Case Insensitive */

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName='CHRIS'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName<>'Chris'

SELECT *
FROM HumanResources.Employee

/* How to filter Dates */

SELECT *
FROM HumanResources.Employee
WHERE  BirthDate >= '1-1-1980'

SELECT *
FROM HumanResources.Employee
WHERE  BirthDate >= '1/1/1980'

/* For Date Filtering We need to put the Date in String format */

SELECT *
FROM HumanResources.Employee
WHERE  BirthDate < '1-1-1980'

/* Multiple Filtering --> Need to use AND--if all conditions satisfied, OR--if atleast one or more satisfied */

SELECT *
FROM HumanResources.Employee

SELECT *
FROM HumanResources.Employee
WHERE BirthDate >= '1-1-1980'

SELECT *
FROM HumanResources.Employee
WHERE BirthDate >= '1-1-1980' AND Gender = 'F'

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M'

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'S' OR Gender = 'M'

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M' OR OrganizationLevel = 4

/* And is having higher precedence first it evaluates */

SELECT *
FROM HumanResources.Employee
WHERE (MaritalStatus = 'S' AND Gender = 'M') OR OrganizationLevel = 4

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'S' AND (Gender = 'M'OR OrganizationLevel = 4)

SELECT *
FROM Production.Product
WHERE (ListPrice > 100 AND Color = 'RED') OR StandardCost > 30

SELECT *
FROM Production.Product
WHERE ListPrice > 100 AND (Color = 'RED' OR StandardCost > 30)

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department = 'Research and Development' OR 
	(
	StartDate = '1/1/2005' AND
	Department='Executive'
	)

SELECT *
FROM Sales.vStoreWithDemographics
WHERE (AnnualSales > 1000000 AND BusinessType = 'OS') OR 
	(
	YearOpened < 1990 AND SquareFeet > 40000 AND 
	NumberEmployees > 10
	)

/*In,Between operator */

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName = 'Chris' OR FirstName = 'STEVE'
	OR FirstName= 'Michael' OR FirstName = 'Thomas'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName IN ('CHRIS','STEVE','MICHAEL','THOMAS')

SELECT *
FROM Sales.vStoreWithDemographics
WHERE AnnualSales >= 1000000 AND AnnualSales <=2000000

SELECT *
FROM Sales.vStoreWithDemographics
WHERE AnnualSales BETWEEN 1000000 AND 2000000

/* Wild Operators */

SELECT *
FROM HumanResources.vEmployee

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'Mi%'

/* Like operator expect some wild operator */

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'Mi_'

/* _ represents only one charachter */

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE '%s'  ---The first name is ended with S can be returned ---

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE '%s%' --- It return all names where it is having 'S' somewhere ---

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE '_on'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'D[a,o]n'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'D[a-o]n'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'D[a-f]n'

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'D[^a]n'	--- It Shows that second letter should not 'a' ---

SELECT *
FROM HumanResources.vEmployee
WHERE FirstName LIKE 'D[^o]n'	--- It Shows that second letter should not 'o' ---

/* NULL Values -- There is no data --Nothing */

SELECT *
FROM Person.Person
WHERE MiddleName = NULL --- It returns nothing ---

SELECT *
FROM Person.Person
WHERE MiddleName  IS NULL 

SELECT *
FROM Person.Person
WHERE MiddleName IS NOT NULL

SELECT *
FROM HumanResources.vEmployee
WHERE MiddleName IS NOT NULL AND PhoneNumberType = 'Cell'
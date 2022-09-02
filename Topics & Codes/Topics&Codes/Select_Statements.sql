/* Using SELECT Statement which contained String or Text values */

SELECT 'Brewster Knowlton'
SELECT 'Hello World'

/* Coumn for first name and last name */

SELECT 'Hello','World'
SELECT 'Gousia','Shaik','Kandukuru'

/* SELECT for operations */

SELECT 2+3
SELECT 5-3
SELECT 4*4
SELECT 5/2
SELECT (5*5)-(4*4)

/* Basic SELECT Statements */

SELECT FirstName
FROM Person.Person

SELECT LastName 
FROM Person.Person

SELECT FirstName,LastName 
FROM Person.Person

SELECT FirstName,MiddleName,LastName
FROM Person.Person

SELECT TOP 500 FirstName,MiddleName,LastName
FROM Person.Person

SELECT TOP 10 PERCENT FirstName,MiddleName,LastName
FROM Person.Person

SELECT *
FROM Person.Person

SELECT TOP 100 * 
FROM Person.Person

SELECT TOP 100 *
FROM Production.Product

/* Column Alias */
SELECT TOP 100
	FirstName AS [CUSTOMER FIRST NAME],LastName
FROM Person.Person

/*SELECT TOP 100
	FirstName AS CUSTOMER FIRST NAME,LastName
FROM Person.Person--ERROR */

SELECT TOP 100
	FirstName AS "CUSTOMER FIRST NAME",LastName
FROM Person.Person

/* In SQL double quotes indicates that column aliases is having name with spaces */

/* Ceating a VIEW --Executing a SQL Statement*/

SELECT *
FROM HumanResources.vEmployee

SELECT *
FROM HumanResources.Employee

SELECT FirstName,LastName,EmailAddress,PhoneNumber
FROM Sales.vIndividualCustomer
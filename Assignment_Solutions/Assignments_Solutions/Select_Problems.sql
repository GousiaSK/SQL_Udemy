/* Select Practice Problems */

/* 1.Retrieve all rows	from the HumanResources.Employee table.	Return only the	
NationalIDNumber column. */

SELECT * 
FROM HumanResources.Employee

SELECT NationalIDNumber
FROM HumanResources.Employee

/* 2.Retrieve	all	rows	from	the	HumanResources.Employee	table.		Return	the	
NationalIDNumber	and	JobTitle	columns. */

SELECT NationalIDNumber,JobTitle
FROM HumanResources.Employee

/* 3.Retrieve	the	top	20	percent	of	rows	from	the	HumanResources.Employee	table.		
Return	the	NationalIDNumber,	JobTitle	and	BirthDate	columns. */

SELECT TOP 20 PERCENT NationalIDNumber,JobTitle,BirthDate
FROM HumanResources.Employee

/* 4.Retrieve	the	top	500	rows	from	the	HumanResources.Employee	table.		Return	the	
NationalIDNumber,	JobTitle	and	BirthDate	columns.		Give	the	NationalIDNumber	
column	an	alias,	“SSN”,	and	the	JobTitle	column	an	alias,	“Job	Title”.  */

SELECT TOP 500 NationalIDNumber AS SSN, JobTitle AS [Job Title]
FROM HumanResources.Employee
/* 5.Return	all	rows	and	all	columns	from	the	Sales.SalesOrderHeader	table. */

SELECT *
FROM Sales.SalesOrderHeader

/* 6.Return	the	top	50	percent	of	rows	and	all	columns	from	the	Sales.Customer	table. */

SELECT TOP 50 PERCENT *
FROM Sales.Customer

/* 7.Return	the	Name	column	from the Production.vProductAndDescription view.		Give	
this	column	an	alias	“Product’s	Name”. */

SELECT Name AS [Product's Name]
FROM Production.vProductAndDescription

/* 8.Return	the	top	400	rows	from	HumanResources.Department */

SELECT TOP 400 *
FROM HumanResources.Department

/* 9. Return	all	rows	and	columns	from	the	table	named	Production.BillOfMaterials */

SELECT *
FROM Production.BillOfMaterials

/* 10.Return	the	top	1500 rows	and	columns	from	the	view	named	
Sales.vPersonDemographics */

SELECT TOP 1500 *
FROM Sales.vPersonDemographics
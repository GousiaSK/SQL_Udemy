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

/* Practice Problem */

/* 1.Execute a literal select statement that returns your name. */

SELECT 'Gousia Shaik Kandukuru'

/* 2.Write the literal select statement that evaluates the product of 7 and 4. */

SELECT (7*4)

/* 3. Write the literal select statement that takes the difference of 7 and 4 then multiplies
that difference by 8. */

SELECT (7-4)*8

/*4. Write a literal select statement that returns the phrase “Brewster’s SQL Training
Class”. (Hint: note the single apostrophe in the string). */

SELECT 'Brewster''s SQL Training Class'

/* 5.Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in
one column and the result of 5*3 in another column. */

SELECT 'Day 1 of Training',5*3

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

/* WhERE Practice problems */

/* 1. Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the	
FirstName	column	is	equal	to	“Mark” */

SELECT Firstname,LastName
FROM Person.Person
WHERE FirstName = 'Mark'

/* 2.Find	the	top	100	rows	from	Production.Product	where	the	ListPrice	is	not	equal	to	
0.00 */

SELECT TOP 100 *
FROM Production.Product
WHERE ListPrice <> 0.00

/* 3. Return	all	rows	and	columns	from	the	view	HumanResources.vEmployee	where	the	
employee’s	last	name	starts	with	a	letter	less	than	“D” */

SELECT *
FROM HumanResources.vEmployee
WHERE LastName LIKE 'D%'

/* 4.Return	all	rows	and	columns	from	Person.StateProvince	where	the	
CountryRegionCode	column	is	equal	to	“CA” */

SELECT *
FROM Person.StateProvince
WHERE CountryRegionCode = 'CA'

/* 5.Return	the	FirstName	and	LastName	columns	from	the	view	
Sales.vIndividualCustomer	where	the	LastName	is	equal	to	“Smith”.		Give	the	
column	alias	“Customer	First	Name”	and	“Customer	Last	Name”	to	the	FirstName	
and	LastName	columns	respectively */

SELECT FirstName AS [Customer First Name],LastName AS [Customer Last Name]
FROM Sales.vIndividualCustomer
WHERE LastName = 'Smith'

/* 6.Using	the	Sales.vIndividualCustomer	view,	find	all	customers	with	a	
CountryRegionName	equal	to	“Australia”	or	all	customers	who	have	a	
PhoneNumberType	equal	to	“Cell”	and	an	EmailPromotion	column	value	equal	to	0.		
(Hint:	the	correct	query	requires	the	use	of	parentheses	in	your	WHERE	clause) */

SELECT *
FROM Sales.vIndividualCustomer
WHERE CountryRegionName = 'Australia' OR (PhoneNumberType = 'Cell' AND EmailPromotion = 0)

/* 7.Find	all	employees	from	the	view	HumanResources.vEmployeeDepartment	who	
have	a	Department	column	value	in	the	list	of:	“Executive”,	“Tool	Design”,	and	
“Engineering”.		Complete	this	query	twice	– once	using	the	IN	operator	in	the	
WHERE	clause	and	a	second	time	using	multiple	OR	operators. */

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department IN ('Executive','Tool','Design','Engineering')

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department ='Executive'OR Department='Tool'OR Department='Design'OR Department='Engineering'

/* 8.Using	HumanResources.vEmployeeDepartment,	find	all	employees	who	have	a	
StartDate	between	July	1,	2000	and	June	30,	2002.		Complete	this	query	twice	– once	
using	the	BETWEEN	operator	and	then	by	using	a	combination	of	the	“greater	than	
or	equal	to” and	“less	than	or	equal	to” operators. */

SELECT * 
FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '7-1-2000' AND '6-30-2002'

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '7/1/2000' AND '6/30/2002'

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate>='7/1/2000' AND StartDate<'6/30/2002'

/* 9.Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	starts	
with	the	letter	“R”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query) */

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName LIKE 'R%'

/* 10.Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	ends	
with	the	letter	“r”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query) */

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName LIKE '%r'

/* 11.Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	is	
either	“Lopez”,	“Martin”,	or	“Wood”	and	whose	FirstName	starts	with	any	letter	
between	“C”	and	“L”	in	the	alphabet.	(Hint:	multiple	wildcard	characters	will	be	used	
in	this	query) */

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName IN ('Lopez','Martin','Wood') AND
FirstName LIKE '[C-O]%'

/* 12.Return	all	columns	from	the	Sales.SalesOrderHeader	table	for	all	sales	that	are	
associated	with	a	sales	person.		That	is,	return	all	rows	where	the	SalesPersonID	
column	does	not	contain	a	NULL	value. */

SELECT *
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL

/* 13.Return	the	SalesPersonID	and	TotalDue	columns	from	Sales.SalesOrderHeader	for	
all	sales	that	do	not	have	a	NULL	value	in	the	SalesPersonID	column	and	whose	
TotalDue	value	exceeds	$70,000. */

SELECT SalesPersonID,TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL AND TotalDue < 70000

/* ORDER BY -- Sorting by column names or Column Alias ASC/DESC*/

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY FirstName 

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY FirstName ASC

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY FirstName DESC

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY 2 ---LastName is in Ascending Order --- 

SELECT FirstName AS [Customer First Name],LastName
FROM Sales.vIndividualCustomer
ORDER BY [Customer First Name]

/* Order of Clauses --Our Written Code
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
SQL Order evaluating is
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

/*SELECT FirstName AS [Customer First Name],LastName
FROM Sales.vIndividualCustomer
WHERE [Customer Last Name] = 'Alexander'*/ ---ERROR--Priority of SQL evaluation

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY 2 DESC

/* LastName --ASC and FirstName --DESC */

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY LastName, FirstName DESC

SELECT FirstName,LastName
FROM Sales.vIndividualCustomer
ORDER BY 1

SELECT FirstName AS [Customer First Name],LastName
FROM Sales.vIndividualCustomer
ORDER BY 2,[Customer First Name]

SELECT LastName,FirstName,SalesQuota AS [Sales Quota]
FROM Sales.vSalesPerson
WHERE SalesQuota >= 250000
ORDER BY [Sales Quota] DESC, 1 ASC

/* Order BY cluse Practice Problems */

/* 1.From	the	HumanResources.vEmployeeDepartment	view,	return	the	FirstName,	
LastName	and	JobTitle	columns.		Sort	the	results	by	the	FirstName	column	in	
ascending	order. */

SELECT FirstName,LastName,JobTitle
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName

/* 2. Modify	the	query	from	question	1	to	sort	the	results	by	the	FirstName	column	in	
ascending	order	and	then	by	the	LastName	column	in	descending	order. */

SELECT FirstName,LastName,JobTitle
FROM HumanResources.vEmployeeDepartment
ORDER BY FirstName , LastName DESC

/* 3.From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns.		Sort	the	results	by	the	CountryRegionName	column.		
Use	the	column	ordinal	in	the	ORDER	BY	clause. */

SELECT FirstName,LastName,CountryRegionName
FROM Sales.vIndividualCustomer
ORDER BY 3

/* 4.From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	
either	“United	States”	or	“France”.		Sort	the	results	by	the	CountryRegionName	
column	in	ascending	order.	*/

SELECT FirstName,LastName,CountryRegionName
FROM Sales.vIndividualCustomer
WHERE CountryRegionName = 'United States' OR CountryRegionName = 'France'
ORDER BY CountryRegionName

/* 5.From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
column	the	alias	“Store	Size”	and	the	NumberEmployees	column	the	alias	“Total	
Employees”.		Return	only	those	rows	with	AnnualSales	greater	than	1,000,000	and	
with	NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
“Store	Size”	alias	in	descending	order	and	then	by	the	“Total	Employees”	alias	in	
descending	order. */

SELECT Name,AnnualSales,YearOpened,SquareFeet AS [Store Size],NumberEmployees AS [Total Employees]
FROM Sales.vStoreWithDemographics
WHERE AnnualSales >= 1000000 AND NumberEmployees >= 45
ORDER BY [Store Size] DESC,[Total Employees] DESC

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

/* INNER JOIN Practice Problems */

/* 1.Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
columns	from	Person.Person	and	then	PasswordHash	column	from	
Person.Password */

SELECT P.FirstName,P.LastName,PA.PasswordHash
FROM Person.Person P
INNER JOIN Person.Password PA
ON PA.BusinessEntityID = P.BusinessEntityID

/* 2. Join	the	HumanResources.Employee	and	the	
HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
using	the	BusinessEntityID	column.		Return	the	BusinessEntityID,	
NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	the	
DepartmentID,	StartDate,	and	EndDate	columns	from	
HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
returned.		Why	is	the	row	count	what	it	is? */

SELECT E.BusinessEntityID,
	E.NationalIDNumber,
	E.JobTitle,
	ED.DepartmentID,
	ED.StartDate,
	ED.EndDate
FROM HumanResources.Employee E
INNER JOIN HumanResources.EmployeeDepartmentHistory ED
ON E.BusinessEntityID = ED.BusinessEntityID

/* 296 ROWS */

/* 3.Expand	upon	the	query	used	in	question	1.		Using	the	existing	query,	add	another	
INNER	JOIN	to	the	Person.EmailAddress	table	and	include	the	EmailAddress	column	
in	your	select	statement */

SELECT P.FirstName,P.LastName,PA.PasswordHash,EA.EmailAddress
FROM Person.Person P
INNER JOIN Person.Password PA
ON PA.BusinessEntityID = P.BusinessEntityID
INNER JOIN Person.EmailAddress EA
ON P.BusinessEntityID = EA.BusinessEntityID

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

/* Left Outer Join and Right Outer Join Practice Problems */

/* 1.Return	the	BusinessEntityID	and	SalesYTD	column	from	Sales.SalesPerson.		Join	this	
table	to	the	Sales.SalesTerritory	table	in	such	a	way	that	every	in	Sales.SalesPerson	
will	be	returned	regardless	of	whether	or	not	they	are	assigned	to	a	territory.		Also,	
return	the	Name	column	from	Sales.SalesTerritory.		Give	this	column	the	column	
alias	“Territory	Name”. */

SELECT
	SP.BusinessEntityID,SP.SalesYTD,
	ST.Name AS [Territory Name]
FROM Sales.SalesPerson SP
LEFT OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SP.TerritoryID

/* 2. Using	the	previous	example	as	your	foundation,	join	to	the	Person.Person	table	to	
return	the	sales	person’s	first	name	and	last	name.		Now,	only	include	those	rows	
where	the	territory’s	name	is	either	“Northeast”	or	“Central” */

SELECT
	SP.BusinessEntityID,SP.SalesYTD,
	ST.Name AS [Territory Name],
	P.FirstName,P.LastName
FROM Sales.SalesPerson SP
LEFT OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SP.TerritoryID
INNER JOIN Person.Person P
ON P.BusinessEntityID = SP.BusinessEntityID
WHERE ST.Name = 'Northwest' or ST.Name = 'Central'


/* 3. Return	the	Name	and	ListPrice	columns from	Production.Product.		For	each	product,	
regardless	of	whether	or	not	it	has	an	assigned	ProductSubcategoryID,	return	the	
Name	column	from	Product.ProductSubcategory	for	each	product.		Then,	return	the	
Name	column	from	Production.ProductCategory	for	each	row.		Give	the	Name	
column	from	Production.Product	the	alias	“ProductName”,	the	Name	column	from	
Production.ProductSubcategory	the	alias	“ProductSubcategoryName”,	and	the	Name	
column	from	Production.ProductCategory	the	alias	“ProductCategoryName”.		Order	
the	results	by	the	“ProductCategoryName”	in	descending	order	and	then	the	
“ProductSubcategoryName”	in	ascending	order */

SELECT
	P.Name AS [ProductName],P.ListPrice,
	PS.Name AS [ProductSubcategoryName],PC.Name AS [ProductCategoryName]
FROM Production.Product P
LEFT OUTER JOIN Production.ProductSubcategory PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
LEFT OUTER JOIN Production.ProductCategory PC
ON PC.ProductCategoryID = PS.ProductCategoryID
ORDER BY ProductCategoryName DESC, ProductSubcategoryName ASC

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

/* Aggregate	Function Practice	Problems */

/* 1. How	many	rows	are	in	the	Person.Person	table?		Use	an	aggregate	function	NOT	
“SELECT	*”. */

SELECT COUNT(*)
FROM Person.Person

/* 2. How	many	rows	in	the	Person.Person	table	do	not	have	a	NULL	value	in	the	
MiddleName	column? */

SELECT COUNT(*)
FROM Person.Person
WHERE MiddleName IS NOT NULL

SELECT COUNT(MiddleName)
FROM Person.Person

/* 3. What	is	the	average	StandardCost	(located	in	Production.Product)	for	each	product	
where	the	StandardCost	is	greater	than	$0.00? */

SELECT AVG(StandardCost)
FROM Production.Product
WHERE StandardCost > 0

/* 4. What	is	the	average	Freight	amount	for	each	sale	(found	in	Sales.SalesOrderHeader)	
where	the	sale	took	place	in	TerritoryID	4? */

SELECT AVG(Freight)
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4

/* 5.How	expensive	is	the	most	expensive	product,	by	ListPrice,	in	the	table	
Production.Product? */

SELECT MAX(ListPrice)
FROM Production.Product

/* 6.Join	the	Production.Product	table	and	the	Production.ProductInventory	table	for	
only	the	products	that	appear	in	both	table.		Use	the	ProductID	as	the	joining	
column.		Production.ProductInventory	contains	the	quantity	of	each	product	
(several	rows	can	appear	for	each	product	to	indicate	the	product	appears	in	
multiple	locations).		Your	goal	is	to	determine	how	much	money	we	would	earn	if	
we	sold	every	product	for	its	list	price for	each	product	with	a	ListPrice	greater	than	
$0.		That	is,	if	you	summed	the	product	of	each	product’s	inventory	by	its	list	price,	
what	would	that	value	be?		(Hint:	This	is	intentionally	challenging.		You	must	use	an	
aggregate	function	with	a	mathematical	expression	to	accomplish	your	goal) */

SELECT SUM(Quantity * ListPrice)
FROM Production.Product P
JOIN Production.ProductInventory PI
ON P.ProductID = PI.ProductID
WHERE ListPrice > 0

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

/* GROUP	BY	Clause	Practice	Problems */

/* 1.In	the	Person.Person	table,	how	many	people	are	associated	with	each	PersonType? */

SELECT PersonType,COUNT(*) AS Persons
FROM Person.Person
GROUP BY PersonType

/* 2. Using	only	one	query,	find	out	how	many	products	in	Production.Product	are	the	
color	“red”	and	how	many	are	“black”. */

SELECT Color,COUNT(*)
FROM Production.Product
WHERE Color = 'Black' or Color = 'Red'
GROUP BY Color

/* 3. Using	Sales.SalesOrderHeader,	how	many	sales	occurred	in	each	territory	between	
July	1,	2005	and	December	31,	2006?		Order	the	results	by	the	sale	count	in	
descending	order. */

SELECT TerritoryID, COUNT(*)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY TerritoryID

/* 4. Expanding	on	the	previous	example,	group	the	results	not	by	the	TerritoryID	but	by	
the	name	of	the	territory	(found	in	the	Sales.SalesTerritory	table). */

SELECT ST.Name, COUNT(*)
FROM Sales.SalesOrderHeader SOH
JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY ST.Name

/* Filtering Groups with Having Clause
Syntax:
Having [Aggregate function] [Comparision Operator] [Filtering Criteria]
*/

SELECT 
	ST.Name AS [Territory Name],
	SUM(TotalDue) AS [Total Sales - 2006]
FROM Sales.SalesOrderHeader SOH
JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY ST.Name
HAVING SUM(TotalDue) > 4000000
ORDER BY 1

SELECT 
	PS.Name AS [Sub Catogory Name],
	COUNT(*) AS [Product Count]
FROM Production.Product P
JOIN Production.ProductSubcategory PS
ON PS.ProductSubcategoryID = P.ProductSubcategoryID
GROUP BY PS.Name
HAVING COUNT(*) >= 15
ORDER BY 1

SELECT *
FROM HumanResources.vEmployeeDepartment

SELECT 
	Department AS [Department Name],
	COUNT(*) AS [Employee Count]
FROM HumanResources.vEmployeeDepartment
GROUP BY Department
HAVING COUNT(*) >= 8
ORDER BY 1

SELECT 
	Department AS [Department Name],
	COUNT(*) AS [Employee Count]
FROM HumanResources.vEmployeeDepartment
GROUP BY Department
HAVING COUNT(*) BETWEEN 6 AND 10
ORDER BY 1

SELECT 
	Department AS [Department Name],
	COUNT(*) AS [Employee Count]
FROM HumanResources.vEmployeeDepartment
GROUP BY Department
HAVING COUNT(*) IN (6,10)
ORDER BY 1

SELECT 
	SalesPersonID,
	SUM(TotalDue) AS [Total Sales Amount],
	COUNT(*) AS [Total Sales Count]
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
	AND SalesPersonID IS NOT NULL
GROUP BY SalesPersonID
HAVING SUM(TotalDue) > 2000000
	AND COUNT(*) >=75
ORDER BY [Total Sales Amount] DESC

/* 
Where clause filters the data based on column values
whereas having clause filters groups based on aggregate functions
*/

/* HAVING	Clause Practice	Problems */

/* 1. Find	the	total	sales	by	territory	for	all	rows	in	the	Sales.SalesOrderHeader	table.		
Return	only	those	territories	that	have	exceeded	$10	million	in	historical	sales */

SELECT TerritoryID,SUM(TotalDue)
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) >= 1000000

/* 2. Using	the	query	from	the	previous	question,	join	to	the	Sales.SalesTerritory	table	
and	replace	the	TerritoryID	column	with	the	territory’s	name. */


SELECT ST.Name,SUM(TotalDue)
FROM Sales.SalesOrderHeader SOH
LEFT OUTER JOIN Sales.SalesTerritory ST
ON SOH.TerritoryID = ST.TerritoryID
GROUP BY ST.Name
HAVING SUM(TotalDue) >= 1000000

/* 3. Using	the	Production.Product	table,	find	how	many	products	are	associated	with	
each	color.		Ignore	all	rows	where	the	color	has	a	NULL	value.		Once	grouped,	return	
to	the	results	only	those	colors	that	had	at	least	20	products	with	that color. */

SELECT Color,COUNT(*)
FROM Production.Product 
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(*) >= 20

/* 4.Starting	with	the	Sales.SalesOrderHeader	table,	join	to	the	Sales.SalesOrderDetail	
table.		This	table	contains	the	line	item	details	associated	with	each	sale.		From	
Sales.SalesOrderDetail,	join	to	the	Production.Product	table.		Return	the	Name	
column	from	Production.Product	and	assign	it	the	column	alias	“Product	Name”.		
For	each	product,	find	out	how	many	of	each	product	was	ordered	for	all	orders	that	
occurred	in	2006.		Only	output	those	products	where	at	least	200	were	ordered. */

SELECT 
	P.Name AS [Product Name],
	SUM(SOD.OrderQty) AS [Product Order Count]
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
ON SOH.SalesOrderID= SOD.SalesOrderID
JOIN Production.Product P
ON SOD.ProductID = P.ProductID
WHERE OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200

/* 5.Find	the	first	and	last	name	of	each	customer	who	has	placed	at	least	6	orders	
between	July	1,	2005	and	December	31,	2006.		Order	your	results	by	the	number	of	
orders	placed	in	descending	order.		(Hint:	You	will	need	to	join	to	three	tables	–
Sales.SalesOrderHeader,	Sales.Customer,	and	Person.Person.		You	will	use	every	
clause	to	complete	this	query). */

SELECT 
	P.FirstName,
	P.LastName,
	COUNT(*) AS [OrderPlaced]
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.Customer SC
ON SOH.CustomerID = SC.CustomerID
JOIN Person.Person P
ON P.BusinessEntityID = SC.PersonID
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY P.FirstName,P.LastName
HAVING COUNT(*) >= 6
ORDER BY OrderPlaced DESC

/* Functions */

/* left function */

SELECT 'Brewster' , LEFT('Brewster', 4)

SELECT TOP 100 *
FROM Person.Person

SELECT LEFT(LastName,5),LastName
FROM Person.Person

/* Right Function */

SELECT RIGHT(LastName,5) AS [Last Five Chars], LastName
FROM Person.Person

/* Substring function */

SELECT 'Brewster', SUBSTRING('Brewster',2,4)

SELECT TOP 100
	FirstName,
	SUBSTRING(FirstName,3,5)
FROM Person.Person

/* Char Index function */

SELECT CHARINDEX('r','Brewster')

SELECT CHARINDEX('r','Brewster',3)

/* Ltrim, Rtrim */

SELECT LTRIM('	This is a test'),RTRIM('This is a test	')

/* Uppercase, lowercase */

SELECT 'brewster',UPPER('brewster'),LOWER('BREWSTER')

/* Len function */

SELECT TOP 100 LastName,LEN(LastName)
FROM Person.Person

/* Nested Functions */

SELECT LEN('		T-SQL Class')

/*Leading Spaces should be trimmed - Using Len */

SELECT LEN(LTRIM('		T-SQL Class')),LEN('		T-SQL Class')

SELECT LEN('	This is a sample text'),LEN('This is a sample text')

SELECT LEN(LTRIM('	This is a sample text')),LEN('	This is a sample text')

SELECT *
FROM Production.Product

SELECT 
	Name,
	SUBSTRING(Name,3,7) AS Step_1,
	UPPER(SUBSTRING(Name,3,7)) AS Step_2,
	REPLACE(UPPER(SUBSTRING(Name,3,7)), 'E', 'X') AS Step_3
FROM Production.Product

/*  String Functions and Nested Functions Problems */

 /* 1.Return the first eight characters of the string “This is a basic string”. */
 
 SELECT LEFT('This is a basic string',8)

 /* 2.Return the last six characters of the string “This is another string” */ SELECT RIGHT('This is another string',6) /* 3. Find the index (integer location) of the first instance of the letter “e” in each product name from
the Production.Product table. */SELECT *FROM Production.Product  SELECT Name, CHARINDEX('e',Name)FROM Production.Product/* 4. Find the substring of the territory name from Sales.SalesTerritory starting at the third character
and lasting four characters in length. */

SELECT Name,SUBSTRING(Name,3,4)
FROM Sales.SalesTerritory

/* 5.Starting with the string “This is a slightly longer string”, find the last eight characters and then,
from that result, find the first four characters. In other words, find the first four characters of
the last eight characters from the string “This is a slightly longer string”. (Hint: use a nested
function for this query) */

SELECT 
	'This is a slightly longer string' AS Step_1,
	RIGHT('This is a slightly longer string',8) AS Step_2,
	LEFT(RIGHT('This is a slightly longer string',8),4) AS Step_3

/* 6.Find the string that results from finding all characters to left of and including the first “e” in each
FirstName from Person.Person. Only return those results where the resulting string is not blank.
(Hint: this will be challenging. Use a nested function in the SELECT statement and then that
same nested function in the WHERE clause) */

SELECT 
	CHARINDEX('e',FirstName) AS Step_1,
	LEFT(FirstName,CHARINDEX('e',FirstName)) AS Step_2
FROM Person.Person
WHERE LEFT(FirstName,CHARINDEX('e',FirstName)) <> ''

/* Date functions */

SELECT GETDATE()	/* Seconds */

SELECT SYSDATETIME()	/* Micro Seconds */

SELECT DATEDIFF(YEAR, '7/1/1927','5/14/1929')

SELECT DATEDIFF(MM,'7/18/1990','5/14/1991')

SELECT DATEDIFF(DD,'3/17/2022','6/22/2022')

SELECT DATEDIFF(HOUR,'6/3/2008 17:14:00','6/5/2008 12:15:00')

SELECT DATEADD(DD,30,'7/4/2011')

SELECT DATEADD(DAY,30,'7/4/2011')

SELECT DATEADD(DD,-30,'7/4/2011')

SELECT DATEADD(DAY,30,GETDATE())

SELECT DATEADD(DAY,-21,'01/26/2013')

SELECT DATEADD(WK,-3,'01/26/2013')

/* Date and Time Built-In Functions Lab Problems */

/* 1. What is the month datepart for June 12, 2011? */

SELECT DATEPART(MONTH,'06/12/2011')

/* 2. What is the year datepart for November 20, 1992? */

SELECT DATEPART(YEAR,'11/20/1992')
SELECT YEAR('11/20/1992')

/* 3.What day was it seventy-four days ago? */

SELECT DATEADD(DAY,-74,GETDATE())

/* 4.What is the current date? Complete this problem using at least two different date functions. */

SELECT GETDATE()
SELECT SYSDATETIME()
SELECT GETUTCDATE()

/* 5. How many days are between April 17, 1996 and September 4, 2001? */

SELECT DATEDIFF(DAY,'04/17/1996','09/04/2001')

/* 6. How many months are between December 25, 1993 and the date that is 2,719 days before
today’s date? */

SELECT DATEDIFF(MONTH, '12/25/1993', DATEADD(DAY, -2719, GETDATE()))

/* Null functions */

SELECT TOP 100 *
FROM Person.Person

SELECT TOP 100 
	FirstName,COALESCE(MiddleName,'') AS MiddleName,LastName
FROM Person.Person

SELECT TOP 100 *
FROM Sales.SalesOrderHeader

SELECT BillToAddressID,ShipToAddressID,
	COALESCE(NULLIF(BillToAddressID, ShipToAddressID),1)
FROM Sales.SalesOrderHeader

/* NULL Handling Functions Lab Problems */

/* 1. If the Title column of Person.Person is NULL then return the string “No Title Listed” */

SELECT COALESCE(Title,'No Title Listed') AS Title
FROM Person.Person

/* 2.If the MiddleName column of Person.Person is NULL then return the string “No Middle Name
Listed” */

SELECT COALESCE(MiddleName,'No Middle Name Listed')
FROM Person.Person

/* 3.If the MiddleName column is NULL then return the FirstName and LastName concatenated. If
the MiddleName is non-NULL then return the FirstName, MiddleName and LastName
concatenated. */

SELECT COALESCE(FirstName + ' '+ MiddleName + ' ' + LastName,FirstName + ' ' + LastName) AS FullName
FROM Person.Person

/* 4. Using the Production.Product table, if the MakeFlag and FinishedGoodsFlag columns are equal
then return a NULL value. */

SELECT NULLIF(MakeFlag, FinishedGoodsFlag)
FROM Production.Product

/* SQL Server Data Types and Type Casting */

SELECT GETDATE(),CAST(GETDATE() AS Date) AS Casted_Date

SELECT GETDATE(),CONVERT(DATE,GETDATE()) AS Type_Casted_Date
/* Gives Error
SELECT TOP 100 CAST(FirstName AS INT)
FROM Person.Person
*/

/* SQL Server Data Types & Type Casting */

/* 1. Write the SQL SELECT statement that returns the FirstName column of Person.Person casted as
the VARCHAR data type. */
SELECT CAST(FirstName AS varchar)
FROM Person.Person

/* 2.Write three expressions in a single SELECT statement: one that returns the results of 11 divided
by 4. The second column should return the result of 11 casted as float divided by 4 casted as
float. The final column should divide 11.0 by 4.0 (including the decimal point and trailing zero). */

SELECT 11/4,CAST(11 AS float)/CAST(4 AS float),11.0/4.0

/* 3.Cast the FirstName column of Person.Person as the VARCHAR(3) data type. What happens?
Why? */

SELECT CAST(FirstName AS VARCHAR(3))
FROM Person.Person

/* 4.Many of the values in the Size column of the Production.Product table contain numeric values.
Write a SELECT statement that returns the Size column casted as the integer data type. What is
the result? Why? */
 
/* Gives Error
SELECT CAST(Size AS INT)
FROM Production.Product
*/

/* 5.  Using the same SELECT statement that you developed in problem 4, add the WHERE clause,
“WHERE ISNUMERIC(Size) = 1”. What is the result of the query now? Why? (Hint: use the MSDN
articles to find how the ISNUMERIC() function is used). */

SELECT CAST(Size AS INT)
FROM Production.Product
WHERE ISNUMERIC(Size) = 1

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

------------------------------------

/* Derived Tables Lab Problems */

/* 
1. Will the following query execute properly? Why or why not?
SELECT *
FROM (
SELECT P.BusinessEntityID, P.FirstName, P.LastName, YEAR(E.HireDate)
FROM HumanResources.Employee E
INNER JOIN Person.Person P
ON P.BusinessEntityID = E.BusinessEntityID
) AS EmployeeDetails
*/
-------
/*
SELECT *
FROM (
	SELECT P.BusinessEntityID, P.FirstName, P.LastName, YEAR(E.HireDate)
	FROM HumanResources.Employee E
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = E.BusinessEntityID
) AS EmployeeDetails
*/
-------
/* The query will not execute because a required condition of a table expression is that each column must
have a name specified. The “YEAR(HireDate)” column does not have an alias specified, therefore the
table expression cannot be evaluated and the query will fail */

/* 2.Will the following query execute properly? Why or why not? */

SELECT *
FROM (
SELECT TOP 100 P.BusinessEntityID, P.FirstName, P.LastName
FROM HumanResources.Employee E
INNER JOIN Person.Person P
ON P.BusinessEntityID = E.BusinessEntityID
ORDER BY 1
) AS EmployeeDetails

/* Executed Properly */

/* 3. Using a derived table so that no functions will appear in the WHERE clause, find all employees
from the HumanResources.Employee table who were hired in the year 2006 or greater and who
were born in the year 1968 or less */

SELECT *
FROM HumanResources.Employee
WHERE YEAR(HireDate) >= 2006 AND YEAR(BirthDate) <= 1968

SELECT *
FROM (
	SELECT *, YEAR(HireDate) AS HireYear, YEAR(BirthDate) AS BirthYear
	FROM HumanResources.Employee
	) AS Employee
WHERE HireYear >= 2006 AND BirthYear <= 1968

/* 4. Using a derived table, find the total sales revenue generated for the year 2005 and 2006. The
WHERE and GROUP BY clause of your SELECT statement should have no functions. */

SELECT 
	OrderYear,
	SUM(TotalDue) AS TotalSales
FROM (
	SELECT *, YEAR(OrderDate) AS OrderYear
	FROM Sales.SalesOrderHeader
	) AS SalesOrders
WHERE OrderYear IN (2005,2006)
GROUP BY OrderYear

/* Working with CTE - Common Table Expression */

SELECT OrderYear,COUNT(*) AS SalesCount
FROM (
	SELECT YEAR(OrderDate) AS OrderYear,SalesOrderID
	FROM Sales.SalesOrderHeader
	) AS SalesDetails
WHERE OrderYear = '2006'
GROUP BY OrderYear
GO

WITH SalesDetails
AS (
	SELECT YEAR(OrderDate) AS OrderYear,SalesOrderID
	FROM Sales.SalesOrderHeader
)

SELECT OrderYear, COUNT(*) AS SalesCount
FROM SalesDetails
WHERE OrderYear = '2006'
GROUP BY OrderYear

SELECT *
FROM (
	SELECT BusinessEntityID,NationalIDNumber,YEAR(BirthDate) AS BirthYear,
	YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
	) AS Hire_Emp
WHERE HireYear >= 2004
GO

WITH Hire_Emp
AS (
	SELECT BusinessEntityID,NationalIDNumber,YEAR(BirthDate) AS BirthYear,
	YEAR(HireDate) AS HireYear
	FROM HumanResources.Employee
)
SELECT *
FROM Hire_Emp
WHERE HireYear >= 2004

SELECT 
	SalesCurrentYear.SalesYear,
	SalesCurrentYear.TotalSales AS AnnualSales,
	SalesPriorYear.TotalSales AS PriorYearSales
FROM (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
	) AS SalesCurrentYear
LEFT OUTER JOIN (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
	) AS SalesPriorYear
ON SalesCurrentYear.SalesYear = SalesPriorYear.SalesYear
ORDER BY 1
GO
/* OR */
WITH SalesByYear
AS (
	SELECT YEAR(OrderDate) AS SalesYear,SUM(TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
)

SELECT 
	CurrentYearSales.SalesYear,
	CurrentYearSales.TotalSales AS AnnualSales,
	CurrentYearSales.TotalSales AS PriorYearSales
FROM SalesByYear CurrentYearSales
LEFT OUTER JOIN SalesByYear AS PriorYearSales
ON CurrentYearSales.SalesYear = PriorYearSales.SalesYear
ORDER BY 1

WITH S1
AS (
	SELECT YEAR(OrderDate) AS SalesYear,SalesOrderID,TotalDue
	FROM Sales.SalesOrderHeader
),
S2 AS (
	SELECT SalesYear,COUNT(SalesOrderID) AS SalesCount,
	SUM(TotalDue) AS AnnualSales
	FROM S1
	GROUP BY SalesYear
)

SELECT SalesYear, SalesCount, AnnualSales
FROM S2
WHERE SalesCount > 5000
ORDER BY 1

/* Common Table Expressions Lab Problems */

/* 1. Will the following code execute properly? Why or why not?

WITH Sales
AS (
SELECT YEAR(OrderDate), TotalDue
FROM Sales.SalesOrderHeader
)

SELECT *
FROM Sales
*/

/*

WITH Sales
AS (
SELECT YEAR(OrderDate), TotalDue
FROM Sales.SalesOrderHeader
)

SELECT *
FROM Sales

*/

/* Gives Error */

/* 2.Using CTEs, find out, for each year the company hired new employees, how many employees
the company hired for each year and how many employees they hired the previous year. Use
the HumanResources.Employee table for this lab question. You should have return three
columns: the hire year, the number of employees hired that year, and the number of employees
hired the year before. */

WITH Hires
AS (
	SELECT
		YEAR(HireDate) AS HireYear,
		BusinessEntityID
	FROM HumanResources.Employee
), HireByYear AS (
	SELECT
		HireYear,
		COUNT(*) AS HireCount
	FROM Hires
	GROUP BY HireYear
)
SELECT
	H1.HireYear,
	H1.HireCount AS CurrentYearHireCount,
	H2.HireCount AS PriorYearHireCount
FROM HireByYear H1
LEFT OUTER JOIN HireByYear H2
ON H1.HireYear = H2.HireYear + 1/* 3.Using a CTE such that no functions are contained in the GROUP BY clause of the SELECT
statement, find the number of products that began selling per year (using the
Production.Product table and the SellStartDate column). */WITH Products
AS (
	SELECT
		YEAR(SellStartDate) AS ProductSellStartYear,
		ProductID
	FROM Production.Product
)
SELECT
	ProductSellStartYear,
	COUNT(*) AS ProductCount
FROM Products
GROUP BY ProductSellStartYear/* 4.Using a CTE that references the Sales.SalesOrderHeader table, find each month’s total sales for
the year 2006. No functions should be used in either the WHERE or the GROUP BY clause of
your SELECT statement. */
GO
WITH SalesMonth
AS (
	SELECT
		MONTH(OrderDate) AS OrderMonth,
	TotalDue
	FROM Sales.SalesOrderHeader
	WHERE YEAR(OrderDate) = 2006
)
SELECT
	OrderMonth,
	SUM(TotalDue) AS MonthlySales
	FROM SalesMonth
	GROUP BY OrderMonth
	ORDER BY 1

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

/* CASE Statements Lab Problems */

/* 1. Return the FirstName and LastName column from Person.Person. Return a third column
that outputs “Promotion 1” if the EmailPromotion column value is 0, “Promotion 2” if the
EmailPromotion value is 1, and “Promotion 3” if the column value is 2. */

SELECT
	FirstName,
	LastName,
	CASE
	WHEN EmailPromotion = 0 THEN 'Promotion 1'
	WHEN EmailPromotion = 1 THEN 'Promotion 2'
	WHEN EmailPromotion = 2 THEN 'Promotion 3'
	END AS PromotionName
FROM Person.Person

/* 2.In a CASE statement you define conditional expressions based on column values. What
happens if a value does not meet any of the conditions expressed in the CASE statement? */

/*If a value does not meet any of the conditions in a CASE statement, the output to be returned will be a
NULL value.*/

/* 3. Using the Person.Person table, complete a CASE statement that returns the string “Long
Name” if the FirstName column is at least ten characters long. If the FirstName column is
less than ten characters, return the string “Short Name” */

SELECT
	CASE
	WHEN LEN(FirstName) >= 10 THEN 'Long Name'
	ELSE 'Short Name'
	END
FROM Person.Person/* 4. Find out how many sales in Sales.SalesOrderHeader fell into the following ranges: “$0 to
$149.99”, “$150 – 499.99”, “$500 to $4,999.99”, “$5,000 - $24,999.99”, and “Over
$25,000”. Only analyze sales that had a sales person associated with them. */

WITH SalesRanges
AS (
	SELECT
		CASE
			WHEN TotalDue BETWEEN 0 AND 149.99
				THEN '$0 to $149.99'
			WHEN TotalDue BETWEEN 150 AND 499.99
				THEN '$150 to $499.99'
			WHEN TotalDue BETWEEN 500 AND 4999.99
				THEN '$500 to $4,999.99'
			WHEN TotalDue BETWEEN 5000 AND 24999.99
				THEN '$5,000 to $24,999.99'
			ELSE 'Over $25,000'
		END AS SalesPriceRange,
			SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
)
SELECT
	SalesPriceRange,
	COUNT(*)
FROM SalesRanges
GROUP BY SalesPriceRange

/* 5.Using the Production.Product table, if the value in Color column is NULL then return the string
“No Color”. If a color exists, then return that color. Complete this request two ways: once with
a CASE statement, and the second with a function we have previously discussed in this guide. */

SELECT
	CASE
		WHEN Color IS NULL THEN 'No Color'
		ELSE Color
	END AS Color
FROM Production.Product

SELECT
	COALESCE(Color, 'No Color')
FROM Production.Product

/* Creating Table */

CREATE TABLE TestTable(
	Column_A VARCHAR(100),
	Column_B INT,
	Column_C DATETIME,
	Column_D VARCHAR(10)
)

INSERT INTO TestTable(Column_A,Column_B,Column_C,Column_D)
VALUES ('Test_Value',10,GETDATE(),'Test_val'),
	   ('Test_Value 2',7,DATEADD(DAY, -1 , GETDATE()),'Test_Val 2')

SELECT *
FROM TestTable

INSERT INTO TestTable
SELECT FirstName,BusinessEntityID,GETDATE(),PhoneNumberType
FROM HumanResources.vEmployee

SELECT *
FROM TestTable

/* Updating Data */

SELECT *
FROM TestTable

UPDATE TestTable
	SET Column_B = 1234

SELECT *
FROM TestTable


UPDATE TestTable
	SET Column_B = 123
		WHERE Column_A = 'Test_value'
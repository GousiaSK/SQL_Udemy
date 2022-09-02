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
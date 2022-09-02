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
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
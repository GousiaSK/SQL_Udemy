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

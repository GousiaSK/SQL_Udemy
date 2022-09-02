/*  String Functions and Nested Functions Problems */

 /* 1.Return the first eight characters of the string �This is a basic string�. */
 
 SELECT LEFT('This is a basic string',8)

 /* 2.Return the last six characters of the string �This is another string� */
the Production.Product table. */
and lasting four characters in length. */

SELECT Name,SUBSTRING(Name,3,4)
FROM Sales.SalesTerritory

/* 5.Starting with the string �This is a slightly longer string�, find the last eight characters and then,
from that result, find the first four characters. In other words, find the first four characters of
the last eight characters from the string �This is a slightly longer string�. (Hint: use a nested
function for this query) */

SELECT 
	'This is a slightly longer string' AS Step_1,
	RIGHT('This is a slightly longer string',8) AS Step_2,
	LEFT(RIGHT('This is a slightly longer string',8),4) AS Step_3

/* 6.Find the string that results from finding all characters to left of and including the first �e� in each
FirstName from Person.Person. Only return those results where the resulting string is not blank.
(Hint: this will be challenging. Use a nested function in the SELECT statement and then that
same nested function in the WHERE clause) */

SELECT 
	CHARINDEX('e',FirstName) AS Step_1,
	LEFT(FirstName,CHARINDEX('e',FirstName)) AS Step_2
FROM Person.Person
WHERE LEFT(FirstName,CHARINDEX('e',FirstName)) <> ''
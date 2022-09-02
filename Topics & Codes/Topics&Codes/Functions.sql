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

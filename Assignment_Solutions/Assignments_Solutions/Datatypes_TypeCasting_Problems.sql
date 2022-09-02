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
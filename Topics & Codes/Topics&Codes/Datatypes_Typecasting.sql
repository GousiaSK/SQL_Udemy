/* SQL Server Data Types and Type Casting */

SELECT GETDATE(),CAST(GETDATE() AS Date) AS Casted_Date

SELECT GETDATE(),CONVERT(DATE,GETDATE()) AS Type_Casted_Date
/* Gives Error
SELECT TOP 100 CAST(FirstName AS INT)
FROM Person.Person
*/
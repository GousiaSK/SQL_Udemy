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
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
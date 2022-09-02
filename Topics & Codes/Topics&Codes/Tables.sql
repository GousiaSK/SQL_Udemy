/* Creating Table */

CREATE TABLE TestTable(
	Column_A VARCHAR(100),
	Column_B INT,
	Column_C DATETIME,
	Column_D VARCHAR(10)
)

INSERT INTO TestTable(Column_A,Column_B,Column_C,Column_D)
VALUES ('Test_Value',10,GETDATE(),'Test_val'),
	   ('Test_Value 2',7,DATEADD(DAY, -1 , GETDATE()),'Test_Val 2')

SELECT *
FROM TestTable

INSERT INTO TestTable
SELECT FirstName,BusinessEntityID,GETDATE(),PhoneNumberType
FROM HumanResources.vEmployee

SELECT *
FROM TestTable

/* Updating Data */

SELECT *
FROM TestTable

UPDATE TestTable
	SET Column_B = 1234

SELECT *
FROM TestTable


UPDATE TestTable
	SET Column_B = 123
		WHERE Column_A = 'Test_value'
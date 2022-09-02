/* Date functions */

SELECT GETDATE()	/* Seconds */

SELECT SYSDATETIME()	/* Micro Seconds */

SELECT DATEDIFF(YEAR, '7/1/1927','5/14/1929')

SELECT DATEDIFF(MM,'7/18/1990','5/14/1991')

SELECT DATEDIFF(DD,'3/17/2022','6/22/2022')

SELECT DATEDIFF(HOUR,'6/3/2008 17:14:00','6/5/2008 12:15:00')

SELECT DATEADD(DD,30,'7/4/2011')

SELECT DATEADD(DAY,30,'7/4/2011')

SELECT DATEADD(DD,-30,'7/4/2011')

SELECT DATEADD(DAY,30,GETDATE())

SELECT DATEADD(DAY,-21,'01/26/2013')

SELECT DATEADD(WK,-3,'01/26/2013')

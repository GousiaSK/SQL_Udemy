/* Date and Time Built-In Functions Lab Problems */

/* 1. What is the month datepart for June 12, 2011? */

SELECT DATEPART(MONTH,'06/12/2011')

/* 2. What is the year datepart for November 20, 1992? */

SELECT DATEPART(YEAR,'11/20/1992')
SELECT YEAR('11/20/1992')

/* 3.What day was it seventy-four days ago? */

SELECT DATEADD(DAY,-74,GETDATE())

/* 4.What is the current date? Complete this problem using at least two different date functions. */

SELECT GETDATE()
SELECT SYSDATETIME()
SELECT GETUTCDATE()

/* 5. How many days are between April 17, 1996 and September 4, 2001? */

SELECT DATEDIFF(DAY,'04/17/1996','09/04/2001')

/* 6. How many months are between December 25, 1993 and the date that is 2,719 days before
today’s date? */

SELECT DATEDIFF(MONTH, '12/25/1993', DATEADD(DAY, -2719, GETDATE()))

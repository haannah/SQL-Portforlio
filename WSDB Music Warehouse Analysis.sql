/* 1) How many transactions took place between the years 2011 and 2012? */ 

SELECT
	count(*)
FROM
	Invoice
WHERE
	InvoiceDate >= "2011-01-01" AND InvoiceDate <= "2012-12-31"
	
	
/* 2) How much money did WSDA Music make during the same period? */ 

SELECT 
	SUM(total)
From 
	Invoice
WHERE
	InvoiceDate >= "2011-01-01" AND InvoiceDate <= "2012-12-31"


/* 3) Get a list of customers who made purchases between 2011 and 2012.*/

 SELECT
	c.FirstName,
	c.LastName,
	i.total
FROM
	invoice i 
INNER JOIN
	Customer c 
ON i.CustomerId = c.CustomerId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY 
	i.total DESC
	
	
/* 40 Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.*/
SELECT
	c.FirstName,
	c.LastName,
	e.FirstName,
	e.LastName,
	c.SupportRepId,
	i.total
FROM
	invoice i 
INNER JOIN
	Customer c 
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e 
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY 
	i.total DESC
	
	
/* 5) How many transactions are above the average transaction amount during the same time period*/


SELECT
	count(total)
FROM
	Invoice
WHERE
	total > (
	SELECT
	round(avg(total),2) -- Find the average transaction amount between 2011 and 2012
FROM
	invoice 
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	) AND InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	
/* 6) What is the average transaction amount for each year that WSDA Music has been in business?*/

SELECT
	round(avg(total),2) AS [Average Transition Amount],
	strftime('%Y', InvoiceDate) AS [ Year]
FROM
	invoice 
GROUP BY 
	strftime('%Y', InvoiceDate)
	
	
	
/* 7) Get a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012. */

SELECT
	DISTINCT e.FirstName,
	e.LastName
FROM
	Invoice i 
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON  e.EmployeeId = c.SupportRepId 
WHERE
	total > (
	SELECT
	round(avg(total),2) -- Find the average transaction amount between 2011 and 2012
FROM
	invoice 
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	) AND InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	
/*  8) Create a Commission Payout column that displays each employee’s commission based on 15% of the sales transaction amount. */

SELECT
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	sum(i.total) AS [Total Sales],
	round(sum(i.total) *.15,2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN 
	Customer c
ON i.CustomerId = c.CustomerId 
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId 
WHERE
	InvoiceDate >= '2011-01-01'AND InvoiceDate <='2012-12-31'
GROUP BY 
	e.FirstName,
	e.LastName
ORDER BY [Total Sales] DESC

-- 9)Which employee made the highest commission?
-- jane peacock

/* 10) List the customers that the employee identified in the last question.*/

SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	sum(i.total) AS [Total Sales],
	round(sum(i.total) *.15,2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN 
	Customer c
ON i.CustomerId = c.CustomerId 
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId 
WHERE
	InvoiceDate >= '2011-01-01'AND InvoiceDate <='2012-12-31' AND e.LastName = 'Peacock'
GROUP BY 
	c.FirstName,
	c.LastName, 
	e.FirstName,
	e.LastName
ORDER BY [Total Sales] DESC

-- 11) Which customer made the highest purchase?
-- John Doeein
-- 12) Look at this customer record—do you see anything suspicious?
SELECT
	*
FROM
	Customer c
WHERE
	c.LastName = 'Doeein'
	
-- Every Detail is missing!

-- 13) Who do you conclude is our primary person of interest?
-- Jane Peacock!

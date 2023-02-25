/*
Created by Hannah Kareti 
Created 2/23/23

Description: This query displayes all customers FirstName, LastNames with EmailAddresses 
*/
SELECT
	FirstName AS [Customer FirstName],
	LastName AS [ Customer LastName],
	Email as EMAIL
FROM
	Customer
ORDER BY 
	FirstName ASC,
	LastName DESC
LIMIT 10


/*
Description: how many customers purchased two songs at 0.99 each
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total = 1.98
ORDER BY 
		InvoiceDate 

/*
Description: how many customers purchased two songs at 0.99 each and how many
 invoices between 1.98 and 5.00?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total BETWEEN 1.98 AND 5.00
ORDER BY 
		InvoiceDate 


/*
Description: how many customers purchased two songs at 0.99 each and how many
 invoices between 1.98 or 3.96?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total(1.98, 3.96)
ORDER BY 
		InvoiceDate 
		
/*
Description: how many invoices were billed to Brussels?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity = 'Brussels'
ORDER BY 
		InvoiceDate 
		
		
/*
Description: how many invoices were billed to Brussels , Orlando, or Paris?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity in ('Brussels', 'Paris', 'Orlando')
ORDER BY 
		InvoiceDate 
		
		
/*
Description: how many invoices were billed that start with B?
*/
-- % is the wild card charecter; we dont care what comes after

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity LIKE 'B%'
ORDER BY 
		InvoiceDate 
		
/*
Description: how many invoices were billed that has a B?
*/
-- % is the wild card charecter; we dont care what comes after

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity LIKE '%B%'
ORDER BY 
		InvoiceDate 
		

Description: how many invoices were billed on 2010-05-22?
*/
-- % is the wild card charecter; we dont care what comes after

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	date(InvoiceDate) = '2010-05-22'
ORDER BY 
		InvoiceDate 
		
/*
Description: how many invoices were after 2010-05-22 and have a total than 3:00?
*/
-- % is the wild card charecter; we dont care what comes after

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	DATE(InvoiceDate) > '2010-05-22' AND total < 3.00
ORDER BY 
		InvoiceDate 
		
		
		
/*
Description: Get all invoices whose billing city is starts with P or starts with D?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity LIKE 'P%' BillingCity LIKE 'D%'
ORDER BY 
		InvoiceDate 
		
		
		
/*
Description: WSDA Music Sales Goal: 
They want as many customers as possible to spend between $7 and $15

Sales Categories 
Baseline Purchase - Between $0.99 - $1.99
Low Purchase - Between $2.00 - $6.99
Target Purchase - Between $7 snd $15
Top Performer - Above $15.00

*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total,
	CASE 
	WHEN total < 2.00 THEN 'Baseline Purchase' 
	WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	WHEN total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performer'
	END as PurchaseType
FROM
	Invoice
WHERE
	PurchaseType = 'Top Performer'
ORDER BY 
		BillingCity
		
		
/* 
Description: JOINS
*/

SELECT
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.CustomerId,
	i.InvoiceDate,
	i.total
FROM
	Invoice AS i
LEFT OUTER JOIN
	Customer AS c
ON 
	i.CustomerId = c.CustomerId
order by c.CustomerId

/* DEscriptions: Joins on more than two tables | What employees are responsible for the 10 heighest indivuals sales 
*/


SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId, 
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.CustomerId,
	i.total
FROM
	Invoice AS i 
INNER JOIN
	Customer AS c 
ON 
	i.CustomerId = c.CustomerId
INNER JOIN 
	Employee AS e 
ON 
	c.SupportRepId = e.EmployeeId
ORDER BY 
	i.total DESC
LIMIT 10 




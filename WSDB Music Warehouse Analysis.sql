/* How many transactions took place between the years 2011 and 2012? */ 

SELECT
	count(*)
FROM
	Invoice
WHERE
	InvoiceDate >= "2011-01-01" AND InvoiceDate <= "2012-12-31"
	
	
/* How much money did WSDA Music make during the same period? */ 

SELECT 
	SUM(total)
From 
	Invoice
WHERE
	InvoiceDate >= "2011-01-01" AND InvoiceDate <= "2012-12-31"


/*Get a list of customers who made purchases between 2011 and 2012.*/

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
	
	
f
	

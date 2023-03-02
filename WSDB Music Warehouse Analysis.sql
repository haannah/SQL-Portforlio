/* How many transactions took place between the years 2011 and 2012? */ 

SELECT
	count(*)
FROM
	Invoice
WHERE
	InvoiceDate >= "2011-01-01" AND InvoiceDate <= "2012-12-31"
	
	
/* How much money did WSDA Music make during the same period? */ 

Select

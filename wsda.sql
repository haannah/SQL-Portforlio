/*
Description: FUNCTIONS 
//create a mailing list of US customers 
*/

SELECT
	FirstName,
	LastName,
	Address,
	FirstName || ' ' || LastName || ' ' || Address || ',' || City || State || ' ' || PostalCode
FROM
	Customer
WHERE
	Country = 'USA'


/* Various functions */
SELECT
	FirstName,
	LastName,
	Address,
	FirstName || ' ' || LastName || ' ' || Address || ',' || City || ' ' || State || ' ' || PostalCode AS [Mailing Address],
	LENGTH(postalcode),
	substr(postalcode, 1,5) AS [5 Digit Postal Code]
FROM
	Customer
WHERE
	Country = 'USA'
	
/*upper*/ 	
SELECT
	FirstName,
	LastName,
	Address,
	FirstName || ' ' || LastName || ' ' || Address || ',' || City || ' ' || State || ' ' || PostalCode AS [Mailing Address],
	LENGTH(postalcode),
	substr(postalcode, 1,5) AS [5 Digit Postal Code],
	upper(firstname) AS [First Name All caps]
FROM
	Customer
WHERE
	Country = 'USA'
	
/*lower*/	
SELECT
	FirstName,
	LastName,
	Address,
	FirstName || ' ' || LastName || ' ' || Address || ',' || City || ' ' || State || ' ' || PostalCode AS [Mailing Address],
	LENGTH(postalcode),
	substr(postalcode, 1,5) AS [5 Digit Postal Code],
	upper(firstname) AS [First Name All caps],
	lower(lastname) AS [Last Name All lower]
FROM
	Customer
WHERE
	Country = 'USA'
	
	
/*
Description: calculate the ages of all employees 
*/

SELECT
	FirstName,
	LastName,
	BirthDate,
	strftime('%Y-%m-%d', Birthdate) AS [BirthDate No Timecode],
	strftime('%Y-%m-%d','now') - strftime('%Y-%m-%d', Birthdate) AS Age 
FROM
	Employee
	
	

/*
Description: What are our all times global sales 
*/
SELECT
	SUM(Total) AS [Total Sales]
FROM
	Invoice 
	
	
/*
Description: What are our all times global sales 
*/
SELECT
	SUM(Total) AS [Total Sales],
	AVG(Total) AS [Average Sales],
-- round(AVG(Total),2) AS [Average Sales],
 	MAX(Total) AS [Maximum Sales],
	MIN(Total) AS [Mininum Sales],
	COUNT(*) AS [Sales Count]
FROM
	Invoice 
	

/*
Description: Average invoice by city ?
*/
SELECT
	BillingCity,
	round(avg(total),2)
FROM	
	invoice 
GROUP BY 
	BillingCity
ORDER BY
	BillingCity
	
/*
Description: Average invoice totals by city with only cityies that start with L ?
*/
SELECT
	BillingCity,
	round(avg(total),2)
FROM	
	invoice 
WHERE
	BillingCity LIKE 'L%'
GROUP BY 
	BillingCity
ORDER BY
	BillingCity
	
	
	
/*
Description: Average invoice totals greater than 5.00 for cities start with B ?
*/
SELECT
	BillingCity,
	round(avg(total),2)
FROM	
	invoice 
WHERE
	BillingCity like 'B%'
GROUP BY 
	BillingCity
HAVING
	avg(total) > 5
ORDER BY
	BillingCity
	
	
/*
Description: Subqueriess Gather data about all invoices that are less than this average? 
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
	total
FROM
	Invoice
WHERE
	total < 
	(SELECT avg(total) from Invoice)
ORDER BY
	total DESC
	
/*
Description: Subqueries without agregate functions 
*/


SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate >
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId = 251)
	
	
/* Description: Returning multiple values in a subquery 
*/


SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate IN
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId In (251, 252, 2554))
	
/*Subqueries and DISTINCT
which items are not selling*/

SELECT
	TrackId,
	Composer,
	Name
FROM
	Track
WHERE
	TrackId
NOT IN
(SELECT
	DISTINCT
	TrackId
FROM
	InvoiceLine
ORDER BY
	TrackId)

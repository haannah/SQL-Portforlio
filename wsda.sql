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

/*
Description: How is each indiviual city performing againist the global average sales ?
*/


SELECT
	BillingCity,
	AVG(total) AS [City Average],
	(SELECT avg(total) from Invoice) AS [Global Average]
FROM
	Invoice 
GROUP BY 
	BillingCity
ORDER BY 
	BillingCity

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

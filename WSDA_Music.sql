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
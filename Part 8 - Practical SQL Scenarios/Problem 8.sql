USE AdventureWorks2017

SELECT 
*
FROM 
	Person.EmailAddress ea
INNER JOIN
	Person.Person p ON p.BusinessEntityID = ea.BusinessEntityID
WHERE p.Suffix = 'Jr.'

DELETE ea
FROM Person.EmailAddress ea
INNER JOIN
	Person.Person p ON p.BusinessEntityID = ea.BusinessEntityID
WHERE p.Suffix = 'Jr.'

USE AdventureWorks2017

SELECT * FROM Sales.Store
WHERE BusinessEntityID = 934

SELECT * FROM Sales.SalesTerritory
WHERE TerritoryID = 1 

SELECT * FROM Person.Person p
WHERE NOT EXISTS (
	SELECT NULL FROM Sales.Customer c
	WHERE p.BusinessEntityID = c.PersonID
)
AND p.Suffix = 'Jr.'

SELECT * FROM Sales.Customer
WHERE StoreID = 934 and TerritoryID = 1

-- EXPECT 11 at the end

INSERT INTO [Sales].[Customer]
           ([PersonID]
           ,[StoreID]
           ,[TerritoryID]
           ,[rowguid]
           ,[ModifiedDate])
SELECT 
	p.BusinessEntityID,
	934,
	1,
	NEWID(),
	GETDATE()
FROM Person.Person p
WHERE NOT EXISTS (
	SELECT NULL FROM Sales.Customer c
	WHERE p.BusinessEntityID = c.PersonID
)
AND p.Suffix = 'Jr.'

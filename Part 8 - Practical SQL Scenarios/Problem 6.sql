USE AdventureWorks2017

SELECT COUNT(*) FROM Person.Person -- 19972
SELECT COUNT(*) FROM HumanResources.Employee -- 290

SELECT COUNT(*) FROM Person.Person p -- 19682
WHERE NOT EXISTS (
	SELECT NULL FROM HumanResources.Employee e
	WHERE e.BusinessEntityID = p.BusinessEntityID
)

SELECT COUNT(*) FROM HumanResources.Employee e -- 0
WHERE NOT EXISTS (
	SELECT NULL FROM Person.Person p
	WHERE e.BusinessEntityID = p.BusinessEntityID
)

SELECT p.BusinessEntityID FROM Person.Person p -- 19682
WHERE NOT EXISTS (
	SELECT NULL FROM HumanResources.Employee e
	WHERE e.BusinessEntityID = p.BusinessEntityID
)

SELECT * FROM HumanResources.Employee WHERE BusinessEntityID = 963
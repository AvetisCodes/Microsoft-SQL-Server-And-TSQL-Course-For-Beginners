USE AdventureWorks2017

SELECT * FROM HumanResources.Employee

SELECT * FROM Person.Person

SELECT * FROM HumanResources.EmployeeDepartmentHistory

SELECT * FROM HumanResources.Department

SELECT
	CONCAT(p.FirstName, p.LastName) [Full Name],
	e.Gender [Employee Gender],
	d.[Name] [Department Name],
	edh.StartDate [Started On],
	edh.EndDate [Ended On]
FROM HumanResources.Employee e
INNER JOIN Person.Person p ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON edh.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.Department d ON d.DepartmentID = edh.DepartmentID

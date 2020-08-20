USE AdventureWorks2017

SELECT * FROM Person.Person

SELECT * FROM HumanResources.Employee

SELECT 
	Counted.JobTitle,
	SUM(Counted.NoTitle) [No Title],
	SUM(Counted.WithTitle) [With Title]
FROM 
(
	SELECT 
		e.JobTitle,
		CASE
			WHEN p.Title IS NULL THEN 1
			ELSE 0
		END [NoTitle],
		CASE
			WHEN p.Title IS NOT NULL THEN 1
			ELSE 0
		END [WithTitle]
	FROM
		Person.Person p
	INNER JOIN
		HumanResources.Employee e ON e.BusinessEntityID = p.BusinessEntityID
) AS [Counted]
GROUP BY 
	Counted.JobTitle
ORDER BY
	Counted.JobTitle
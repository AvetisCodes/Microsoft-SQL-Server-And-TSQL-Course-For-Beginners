USE AdventureWorks2017

SELECT * FROM Production.Product
SELECT * FROM Production.ProductReview

SELECT * FROM Production.Product
WHERE ProductNumber = 'SO-B909-M'

-- 709

UPDATE pr
SET
	pr.Comments = CONCAT(pr.Comments, ' ', 'Thanks once again!')
FROM 
	Production.Product p
INNER JOIN 
	Production.ProductReview pr ON p.ProductID = pr.ProductID
WHERE
	ProductNumber = 'SO-B909-M'

SELECT 
	pr.ProductID,
	pr.ProductReviewID,
	p.ProductNumber,
    pr.Comments
FROM 
	Production.Product p
INNER JOIN 
	Production.ProductReview pr ON p.ProductID = pr.ProductID
WHERE
	ProductNumber = 'SO-B909-M'


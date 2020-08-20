CREATE TABLE Customer (
	CustomerID INT IDENTITY(1,1) NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PRIMARY KEY(CustomerID)
)

CREATE TABLE CustomerOrder (
	OrderID INT IDENTITY(1,1) NOT NULL,
	CustomerID INT NOT NULL,
	Amount FLOAT NOT NULL,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
)

INSERT INTO Customer (FirstName, LastName) VALUES ('Kimberly', 'Twomey')
INSERT INTO Customer (FirstName, LastName) VALUES ('Louise', 'Nguyen')
INSERT INTO Customer (FirstName, LastName) VALUES ('Betty', 'Garrett')
INSERT INTO Customer (FirstName, LastName) VALUES ('Stephanie', 'Kinkead')

SELECT CustomerID, FirstName, LastName FROM Customer

INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (1, 10)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (1, 20)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (2, 50)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (2, 10)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (3, 20)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (4, 30)
INSERT INTO CustomerOrder (CustomerID, Amount) VALUES (4, 10)

SELECT * FROM CustomerOrder

SELECT 
	CustomerID, 
	FirstName,  
	(SELECT SUM(co.Amount) FROM CustomerOrder co WHERE co.CustomerID = c.CustomerID) [PurchaseTotal]
FROM Customer c

SELECT 
	CustomerID, 
	FirstName,
	(SELECT SUM(co.Amount) FROM CustomerOrder co WHERE co.CustomerID = c.CustomerID)
FROM Customer c
ORDER BY (SELECT SUM(co.Amount) FROM CustomerOrder co WHERE co.CustomerID = c.CustomerID) DESC

SELECT 
	oc.CustomerID,
	oc.FirstName,
	oc.LastName,
	CASE
		WHEN BuyCount.AmountOfPurchases IS NULL THEN 'Non Repeat Customer'
		ELSE 'Repeat Customer'
	END [CustomerType]
FROM
	Customer oc
LEFT JOIN
(
	SELECT 
		ic.CustomerID [CustomerID],
		COUNT(ico.Amount) [AmountOfPurchases]
	FROM 
		Customer ic
	INNER JOIN 
		CustomerOrder ico ON ic.CustomerID = ico.CustomerID
	GROUP BY 
		ic.CustomerID
	HAVING
		COUNT(ico.Amount) > 1

) AS BuyCount ON BuyCount.CustomerID = oc.CustomerID

SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	CASE
		WHEN COUNT(co.Amount) IS NULL THEN 'Non Repeat Customer'
		ELSE 'Repeat Customer'
	END [CustomerType]
FROM
	Customer c
INNER JOIN
	CustomerOrder co ON co.CustomerID = c.CustomerID
GROUP BY
	c.CustomerID,
	c.FirstName,
	c.LastName
HAVING
	COUNT(co.Amount) > 1


SELECT
	co.OrderID,
	co.CustomerID,
	co.Amount
FROM 
	CustomerOrder co
WHERE 
	CustomerID IN (SELECT c.CustomerID FROM Customer c)


SELECT
	co.OrderID,
	co.CustomerID,
	co.Amount
FROM 
	CustomerOrder co
WHERE EXISTS (
	SELECT NULL FROM
		Customer c WHERE c.CustomerID = co.CustomerID
)

SELECT
	co.OrderID,
	co.CustomerID,
	co.Amount
FROM 
	CustomerOrder co
WHERE 
	CustomerID NOT IN (SELECT c.CustomerID FROM Customer c)


SELECT
	co.OrderID,
	co.CustomerID,
	co.Amount
FROM 
	CustomerOrder co
WHERE NOT EXISTS (
	SELECT NULL FROM
		Customer c WHERE c.CustomerID = co.CustomerID
)

SELECT
	c.CustomerID,
	c.FirstName,
	c.LastName,
	AVG(co.Amount),
	(SELECT AVG(Amount) FROM CustomerOrder)
FROM 
	Customer c
LEFT JOIN
	CustomerOrder co ON c.CustomerID = co.CustomerID
GROUP BY 
	c.CustomerID, c.FirstName, c.LastName
HAVING 
	AVG(co.Amount) > (SELECT AVG(Amount) FROM CustomerOrder)

-- Get rid of the tables
DROP TABLE CustomerOrder
DROP TABLE Customer

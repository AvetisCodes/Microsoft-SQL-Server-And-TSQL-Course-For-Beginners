

CREATE TABLE Member (
	MemberID INT IDENTITY(1,1) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	PRIMARY KEY(MemberID)
)

CREATE TABLE Customer (
	CustomerID INT IDENTITY(1,1) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Age INT NULL,
	PRIMARY KEY(CustomerID)
)

INSERT INTO Member (FirstName, LastName) VALUES ('Susan', 'Averill')
INSERT INTO Member (FirstName, LastName) VALUES ('James', 'Pena')
INSERT INTO Member (FirstName, LastName) VALUES ('Tom', 'Cobb')
INSERT INTO Member (FirstName, LastName) VALUES ('Annie', 'Wright')
INSERT INTO Member (FirstName, LastName) VALUES ('Dewitt', 'Trammell')

SELECT MemberID, FirstName, LastName FROM Member

INSERT INTO Customer (FirstName, LastName, Age) VALUES ('Susan', 'Averill', 29)
INSERT INTO Customer (FirstName, LastName, Age) VALUES ('James', 'Pena', 25)
INSERT INTO Customer (FirstName, LastName, Age) VALUES ('Tom', 'Cobb', NULL)
INSERT INTO Customer (FirstName, LastName, Age) VALUES ('Rebecca', 'Werner', 29)
INSERT INTO Customer (FirstName, LastName, Age) VALUES ('Mary', 'Martin', 30)

SELECT CustomerID, FirstName, LastName, Age FROM Customer


SELECT 
	MemberID [CustomerID], 
	FirstName, 
	LastName,
	NULL [Age]
FROM 
	Member
UNION
SELECT 
	CustomerID, 
	FirstName, 
	LastName, 
	Age 
FROM 
	Customer

SELECT 
	MemberID [CustomerID], 
	FirstName, 
	LastName,
	NULL [Age]
FROM 
	Member
UNION ALL
SELECT 
	CustomerID, 
	FirstName, 
	LastName, 
	Age 
FROM 
	Customer

SELECT 
	MemberID [CustomerID], 
	FirstName, 
	LastName,
	NULL [Age]
FROM 
	Member
INTERSECT
SELECT 
	CustomerID, 
	FirstName, 
	LastName, 
	Age 
FROM 
	Customer

SELECT 
	MemberID [CustomerID], 
	FirstName, 
	LastName,
	NULL [Age]
FROM 
	Member
EXCEPT
SELECT 
	CustomerID, 
	FirstName, 
	LastName, 
	Age 
FROM 
	Customer

SELECT 
	CustomerID, 
	FirstName, 
	LastName, 
	Age 
FROM 
	Customer
EXCEPT
SELECT 
	MemberID [CustomerID], 
	FirstName, 
	LastName,
	NULL [Age]
FROM 
	Member


-- Get rid of the tables
DROP TABLE Member
DROP TABLE Customer




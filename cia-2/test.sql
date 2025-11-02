USE SubqueryDemoDB;

-- Clean slate
DROP TABLE Students;
DROP TABLE Colleges;

CREATE TABLE Students(
    sId INT PRIMARY KEY,
    name VARCHAR(50),
    clgId INT
);

CREATE TABLE college(
    clgId INT,
    clgNames VARCHAR(50)
);

INSERT INTO Students VALUES
(1,'yugesh',2),
(2,'prakash',1),
(3,'gaya',2),
(4, 'Arun', NULL);

INSERT INTO college VALUES
(1,'KLCE'),
(2,'SLCS'),
(3, 'HICAS');

SELECT * FROM college;

SELECT s.name, c.clgNames 
FROM Students s 
INNER JOIN college c
ON s.clgId = c.clgId;


SELECT s.name, c.clgNames 
FROM Students s 
RIGHT JOIN college c
ON s.clgId = c.clgId;


SELECT s.name, c.clgNames 
FROM Students s 
LEFT JOIN college c
ON s.clgId = c.clgId;


SELECT s.name, c.clgNames 
FROM Students s 
FULL OUTER JOIN college c
ON s.clgId = c.clgId;


SELECT s.name, c.clgNames 
FROM Students s 
CROSS JOIN college c;




CREATE TABLE Products (
ProductID INT IDENTITY(1,1) PRIMARY KEY,
ProductName VARCHAR(100),
Price DECIMAL(10,2),
Stock INT
);

CREATE TABLE Sales (
SaleID INT IDENTITY(1,1) PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATETIME DEFAULT GETDATE(),
TotalAmount DECIMAL(10,2),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 2: Insert Sample Products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Laptop', 50000, 10),
('Mobile', 20000, 25),
('Headphones', 1500, 50);


create procedure updatee 
@NewPrice DECIMAL(10,2),
@ProductID INT
as BEGIN
UPDATE Products 
set Price = @NewPrice
WHERE ProductID = @ProductID;
END;

exec updatee @NewPrice = 2000,@ProductID = 1;
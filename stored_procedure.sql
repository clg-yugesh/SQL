CREATE DATABASE strod_pro;

use strod_pro;

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

-- Stored Procedures for Sales Database
-- 1. View All Products
CREATE PROCEDURE GetAllProducts
AS
BEGIN
SELECT * FROM Products;
END;
-- Execute:
EXEC GetAllProducts;


-- 2. Add New Sale (with Stock Check)
CREATE PROCEDURE AddSale
    @ProductID INT,
    @Quantity INT
AS
BEGIN
DECLARE @Price DECIMAL(10,2);
DECLARE @Stock INT;
-- Get current stock and price
SELECT @Stock = Stock, @Price = Price FROM Products WHERE ProductID = @ProductID;
IF @Stock >= @Quantity
BEGIN
-- Insert into Sales
INSERT INTO Sales (ProductID, Quantity, TotalAmount)
VALUES (@ProductID, @Quantity, @Quantity * @Price);
-- Update Stock
UPDATE Products
SET Stock = Stock - @Quantity
WHERE ProductID = @ProductID;
PRINT 'Sale recorded successfully!'
END
ELSE
BEGIN
PRINT 'Not enough stock'
END
END;

-- Execute Example:
EXEC AddSale @ProductID = 1, @Quantity = 2;


-- If stock available → Sale added, stock updated.
-- If stock not enough → Prints error message, no changes made.
-- 3. View Sales by Product
CREATE PROCEDURE GetSalesByProduct
@ProductID INT
AS
BEGIN
SELECT SaleID, ProductID, Quantity, TotalAmount, SaleDate
FROM Sales
WHERE ProductID = @ProductID;
END;

-- Execute Example:
EXEC GetSalesByProduct @ProductID = 1;

-- 4. Update Product Price
CREATE PROCEDURE UpdateProductPrice
@ProductID INT,
@NewPrice DECIMAL(10,2)
AS
BEGIN
UPDATE Products
SET Price = @NewPrice
WHERE ProductID = @ProductID;
PRINT 'Product price updated successfully'
END;

exec UpdateProductPrice @ProductID = 2, @NewPrice = 21000

select * from Products;
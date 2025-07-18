create database employees007;

use employees007;

-- Drop existing tables if needed
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Employees Table with additional details and DepartmentID as Foreign Key
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary) VALUES
(1, 'Alice', 'Johnson', 1, 'HR Manager', 75000.00),
(2, 'Bob', 'Smith', 2, 'Software Engineer', 85000.00),
(3, 'Carol', 'Williams', 3, 'Accountant', 65000.00),
(4, 'David', 'Brown', 2, 'Software Engineer', 87000.00),
(5, 'Eva', 'Davis', 4, 'Marketing Analyst', 62000.00);


-- select all columns
select * from Employees;

-- select specific columns
select FirstName from Employees;

-- using where clause
select * from Employees where Position = 'Software Engineer';

-- using order by clause
select * from Employees order by Salary DESC;

-- using distinct 
select distinct DepartmentID from Employees;

-- using like
select * from employees where FirstName LIKE 'A%';

-- using between 
select * from employees where Salary between  60000 and 70000;

-- using in 
SELECT * FROM Employees WHERE Position IN ('Software Engineer', 'Accountant');

-- using alias
SELECT FirstName AS 'First Name', LastName AS 'Last Name' FROM Employees;

-- using joins
SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- ---------------------------------------------------------------------------------------

-- ex 3


-- Create the database
CREATE DATABASE CompanyDB2_o;

-- Use the database
USE CompanyDB;

-- Create Departments table with PRIMARY KEY
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- Create Employees table with:
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,                        -- PRIMARY KEY
    Name VARCHAR(50) NOT NULL,                   -- NOT NULL
    Email VARCHAR(100) UNIQUE,                   -- UNIQUE
    Salary DECIMAL(10, 2) CHECK (Salary > 0),    -- CHECK
    DeptID INT,                                  -- FOREIGN KEY
    Status VARCHAR(20) DEFAULT 'Active',         -- DEFAULT
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)  -- FOREIGN KEY
);

-- Insert example data
INSERT INTO Departments (DeptID, DeptName)
VALUES (1, 'HR'), (2, 'IT');

INSERT INTO Employees (EmpID, Name, Email, Salary, DeptID)
VALUES 
(101, 'Alice Johnson', 'alice@example.com', 55000.00, 1),
(102, 'Bob Smith', 'bob@example.com', 62000.00, 2);

-- Insert employee without specifying Status (uses DEFAULT)
INSERT INTO Employees (EmpID, Name, Email, Salary, DeptID)
VALUES (103, 'Carol Davis', 'carol@example.com', 47000.00, 1);

-- Try inserting a record with a duplicate email (will fail due to UNIQUE constraint)
INSERT INTO Employees (EmpID, Name, Email, Salary, DeptID)
VALUES (104, 'David Lee', 'alice@example.com', 50000.00, 2);

-- Try inserting a record with null name (will fail due to NOT NULL)
INSERT INTO Employees (EmpID, Name, Email, Salary, DeptID)
VALUES (105, NULL, 'david@example.com', 50000.00, 2);

-- Try inserting a record with negative salary (will fail due to CHECK constraint)
INSERT INTO Employees (EmpID, Name, Email, Salary, DeptID)
VALUES (106, 'Eve Watson', 'eve@example.com', -10000.00, 2);

create database employees007;

use employees007;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Position, Salary, HireDate)
VALUES
(1, 'Alice', 'Johnson', 'HR', 'HR Manager', 75000.00, '2018-03-01'),
(2, 'Bob', 'Smith', 'IT', 'Software Engineer', 85000.00, '2019-07-15'),
(3, 'Carol', 'Williams', 'Finance', 'Accountant', 65000.00, '2020-01-20'),
(4, 'David', 'Brown', 'IT', 'DevOps Engineer', 87000.00, '2021-05-10'),
(5, 'Eva', 'Davis', 'Marketing', 'Marketing Analyst', 62000.00, '2022-09-30');

alter table Employees drop column HireDate;

-- select all columns
select * from Employees;

-- select specific columns
select FirstName from Employees;

-- using where clause
select * from Employees where Department = 'HR';

-- using order by clause
select * from Employees order by Salary DESC;

-- using distinct 
select distinct Department from Employees;

-- using like
select * from employees where FirstName LIKE '%A';

-- using between 
select * from employees where Salary between  60000 and 70000;

-- using in 
SELECT * FROM Employees WHERE Department IN ('HR', 'IT');






drop table Employees;
drop table Departments;


 -- creating two tables and connecting it with a key then print the contents

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Employees
INSERT INTO Employees (EmployeeID, FirstName, DepartmentID) VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', 1),
(104, 'Diana', 3);


SELECT Employees.FirstName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

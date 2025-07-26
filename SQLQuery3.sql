CREATE DATABASE SubqueryDemoDB;

USE SubqueryDemoDB;

-- Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    ManagerID INT
);

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    Location VARCHAR(100)
);

-- Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeID INT
);

-- Departments
INSERT INTO Departments VALUES
(1, 'HR',     101, 'Chennai'),
(2, 'Finance',102, 'Mumbai'),
(3, 'IT',     103, 'Chennai'),
(4, 'Sales',  104, 'Delhi');

-- Employees
INSERT INTO Employees VALUES
(101, 'Alice',   90000, 1,  NULL),
(102, 'Bob',     85000, 2,  101),
(103, 'Charlie', 75000, 3,  101),
(104, 'David',   95000, 4,  101),
(105, 'Eve',     70000, 3,  103),
(106, 'Frank',   72000, 2,  102),
(107, 'Grace',   98000, 4,  104);

-- Projects
INSERT INTO Projects VALUES
(1, 'ProjectA', 101),
(2, 'ProjectB', 102),
(3, 'ProjectC', 102),
(4, 'ProjectD', 105),
(5, 'ProjectE', 105),
(6, 'ProjectF', 107);

-- Single Row Subquery
SELECT FirstName, Salary 
FROM Employees 
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- Multiple row subquery
SELECT FirstName 
FROM Employees 
WHERE DepartmentID IN (
    SELECT DepartmentID 
    FROM Departments 
    WHERE Location = 'Chennai'
);

-- Multiple column subquery
SELECT E.FirstName, E.DepartmentID
FROM Employees E
JOIN Departments D
    ON E.DepartmentID = D.DepartmentID AND E.ManagerID = D.ManagerID
WHERE D.Location = 'Mumbai';

-- Correlated subquery
SELECT E1.FirstName, E1.Salary 
FROM Employees E1 
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees E2 
    WHERE E1.DepartmentID = E2.DepartmentID
);

-- subquery in from clause
SELECT DepartmentID, AVG(Salary) AS AvgSalary 
FROM (
    SELECT DepartmentID, Salary
    FROM Employees
) AS Temp
GROUP BY DepartmentID;

-- subquery in select clause
SELECT FirstName, 
       (SELECT COUNT(*) 
        FROM Projects 
        WHERE Projects.EmployeeID = Employees.EmployeeID) AS ProjectCount
FROM Employees;

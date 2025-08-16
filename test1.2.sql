CREATE database ABC_companies;
use ABC_companies;

CREATE table Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE,
    City VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate, City) VALUES
(1001, 'Alice', 'Johnson', 'HR', 50000, '2020-01-15', 'New York'),
(1002, 'Bob', 'Smith', 'IT', 75000, '2019-03-10', 'Chicago'),
(1003, 'Carol', 'Lee', 'IT', 72000, '2021-06-25', 'San Francisco'),
(1004, 'David', 'Kim', 'Finance', 67000, '2018-09-12', 'New York'),
(1005, 'Eva', 'Brown', 'HR', 52000, '2022-02-01', 'Boston'),
(1006, 'Frank', 'White', 'Marketing', 60000, '2020-11-30', 'Seattle');

SELECT * FROM Employees;

SELECT FirstName, LastName, Salary from Employees;

SELECT * from Employees WHERE Department = 'IT';

SELECT * from Employees WHERE City = 'New York' AND Salary > 60000;

SELECT * from Employees ORDER BY Salary DESC;

SELECT * FROM Employees where HireDate BETWEEN '2020-01-01' and '2021-12-31';

SELECT Department, AVG(Salary) as AvgSalary
from Employees GROUP BY Department;

SELECT * FROM Employees where LastName LIKE 'B%';

SELECT Department, AVG(Salary) as AvgSalary
from Employees 
GROUP BY Department
HAVING AVG(Salary) > 60000;


SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;


SELECT FirstName, MAX(Salary) as HighestSalary 
from Employees
GROUP BY FirstName;


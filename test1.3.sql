use ABC_companies;

CREATE TABLE Employees1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DeptID INT,
    Budget DECIMAL(12,2)
);

CREATE TABLE TimeSheet (
    EmpID INT,
    ProjectID INT,
    HoursWorked INT
    FOREIGN KEY(EmpID) REFERENCES Employees1(EmpID),
    FOREIGN KEY(ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');


INSERT INTO Employees1 (EmpID, Name, DeptID, Salary) VALUES
(101, 'Alice Johnson', 1, 50000),
(102, 'Bob Smith', 2, 75000),
(103, 'Carol Lee', 2, 72000),
(104, 'David Kim', 3, 67000),
(105, 'Eva Brown', 1, 52000),
(106, 'Frank White', 4, 60000);

INSERT INTO Projects (ProjectID, ProjectName, DeptID, Budget) VALUES
(201, 'Recruitment Drive', 1, 20000),
(202, 'Website Redesign', 2, 50000),
(203, 'Data Migration', 2, 80000),
(204, 'Annual Audit', 3, 30000),
(205, 'Social Media Campaign', 4, 25000);

INSERT INTO Timesheet (EmpID, ProjectID, HoursWorked) VALUES
(101, 201, 35),
(102, 202, 40),
(102, 203, 25),
(103, 202, 30),
(103, 203, 45),
(104, 204, 50),
(105, 201, 20),
(106, 205, 38);

SELECT Name FROM Employees1 
where Salary > (SELECT AVG(Salary) from Employees1 );

-- display the names of employees who are working in 
-- departments that have at least one project.
SELECT name from Employees1 
where DeptID in (SELECT DeptID FROM Projects);

-- to find employees whose salary 
-- is greater than all employees in department 3.
SELECT name from Employees1
where Salary > all
(SELECT Salary FROM Employees1 where DeptID = 3);

-- display employees whose salary is greater than 
-- the average salary of their own department.
SELECT name from Employees1
where Salary > (SELECT AVG(Salary) from Employees1 where DeptID = DeptID);


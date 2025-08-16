USE SubqueryDemoDB;
create table employee2(
    id int PRIMARY key,
    name VARCHAR(50),
    salary int,
    manager_id int,
    dept_id int,
    jobRole VARCHAR(50),
    city VARCHAR(50)
);

insert into employee2 values
(1,'Rahul',50000,2,1,'Developer','Mumbai'),
(2, 'Raj', 60000, 3, 2, 'Tester', 'Delhi'),
(3, 'Rajesh', 70000, 4, 3, 'Developer', 'Bangalore'),
(4, 'Ramesh', 80000, 5, 4, 'Tester', 'Chennai'),
(5, 'Rajat', 90000, 6, 5, 'Developer', 'Hyderabad'),
(6, 'Rajesh', 100000, 7, 6, 'Tester', 'Pune'),
(7, 'Rajat', 110000, 8, 7, 'Developer', 'Ahmedabad'),
(8, 'Rajesh', 120000, 9, 8, 'Tester', 'Jaipur'),
(9, 'Rajat', 130000, 10, 9, 'Developer', 'Kolkata'),
(10, 'Rajesh', 140000, 11, 10, 'Tester', 'Surat');

create table department (
    deptId int PRIMARY KEY,
    dept_name VARCHAR(50),
    Location varchar(50),
    manager_id int
);

insert into department values (1, 'IT', 'Mumbai', 2), (2, 'HR', 'Delhi', 3), (3, 'Finance', 'Bangalore', 4), (4, 'Marketing', 'Chennai', 5), (5, 'Operations', 'Hyderabad', 6), (6, 'R&D', 'Pune', 7), (7, 'Sales', 'Ahmedabad', 8), (8, 'Legal', 'Jaipur', 9), (9, 'Customer Service', 'Kolkata', 10), (10, 'Research', 'Surat', 11);

SELECT name, dept_id FROM employee2 WHERE (dept_id, ManagerID) IN
(SELECT deptId, manager_id FROM department WHERE Location = 'Mumbai');

SELECT E1.FirstName, E1.Salary FROM Employees E1 WHERE Salary > ( SELECT AVG(Salary)
FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);
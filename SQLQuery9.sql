USE SubqueryDemoDB;

-- Employees, Departments

select * from Employees;
select * from Departments;

select Employees.FirstName, Departments.DepartmentName
from Employees
INNER JOIN Departments on Employees.ManagerID = Departments.ManagerID;

select Employees.FirstName, Departments.DepartmentName
from Employees
LEFT JOIN Departments on Employees.ManagerID = Departments.ManagerID; 

select Employees.FirstName, Departments.DepartmentName
from Employees
RIGHT JOIN Departments on Employees.ManagerID = Departments.ManagerID;

select Employees.FirstName, Departments.DepartmentName
from Employees
FULL JOIN Departments on Employees.ManagerID = Departments.ManagerID; 

select Employees.FirstName, Departments.DepartmentName
from Employees
FULL OUTER JOIN Departments on Employees.ManagerID = Departments.ManagerID; 

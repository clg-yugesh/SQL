
SELECT FirstName, Salary FROM Employees WHERE Salary = (SELECT MAX(Salary) FROM
Employees);


SELECT FirstName FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM
Departments WHERE Location = 'Chennai');


SELECT DepartmentID, AVG(Salary) AS AvgSalary FROM ( SELECT DepartmentID, Salary
FROM Employees) AS Temp GROUP BY DepartmentID;


SELECT FirstName, (SELECT COUNT(*) FROM Projects WHERE Projects.EmployeeID = Employees.EmployeeID) 
AS ProjectCount FROM Employees;


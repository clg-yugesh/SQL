USE SubqueryDemoDB;

-- Students and Colleges (INNER JOIN example)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CollegeID INT
);

CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'John', 100),
(2, 'Sara', 101),
(3, 'Mikel', 102),
(4, 'Anitha', 105);

INSERT INTO Colleges VALUES
(100, 'Harvard University'),
(101, 'Stanford University'),
(102, 'MIT'),
(103, 'Oxford University');

-- 1. INNER JOIN
SELECT Students.StudentID, Students.StudentName, Colleges.CollegeName
FROM Students
INNER JOIN Colleges 
    ON Students.CollegeID = Colleges.CollegeID;

-- Students and Enrollments (LEFT JOIN & RIGHT JOIN examples)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50)
);

INSERT INTO Enrollments VALUES
(201, 1, 'Math'),
(202, 1, 'Science'),
(203, 2, 'History');
-- 2. LEFT JOIN
SELECT Students.StudentID, Students.StudentName, Enrollments.course_name
FROM Students
LEFT JOIN Enrollments 
    ON Students.StudentID = Enrollments.student_id;

-- 3. RIGHT JOIN
SELECT Students.StudentID, Students.StudentName, 
       Enrollments.enrollment_id, Enrollments.course_name
FROM Students
RIGHT JOIN Enrollments 
    ON Students.StudentID = Enrollments.student_id;

-- Employees and Salaries (FULL OUTER JOIN example)
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT NULL
);

CREATE TABLE Salaries (
    emp_id INT PRIMARY KEY,
    salary INT
);

INSERT INTO Employees VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2);

INSERT INTO Salaries VALUES
(2, 60000),
(3, 70000),
(4, 80000);

-- 4. FULL OUTER JOIN
SELECT Employees.emp_id, Employees.emp_name, Salaries.salary
FROM Employees
FULL OUTER JOIN Salaries 
    ON Employees.emp_id = Salaries.emp_id;

-- Colors and Sizes (CROSS JOIN example)
CREATE TABLE Colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);

CREATE TABLE Sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(50)
);

INSERT INTO Colors VALUES
(1, 'Red'),
(2, 'Blue');

INSERT INTO Sizes VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');
-- 5. CROSS JOIN
SELECT * 
FROM Colors
CROSS JOIN Sizes;

-- 6. SELF JOIN
SELECT E.emp_name AS Employee, M.emp_name AS Manager
FROM Employees E
LEFT JOIN Employees M 
    ON E.manager_id = M.emp_id;

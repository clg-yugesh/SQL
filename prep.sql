CREATE DATABASE prep;
use prep;
-- -----------------------------------
-- 1. Student Details Table
-- (Context: Students)
-- -----------------------------------
CREATE TABLE Students (
    StudentID INT PRIMARY KEY, -- PRIMARY KEY Constraint
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    City VARCHAR(50)
);

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, City) VALUES
(101, 'Alice', 'Smith', '2004-05-15', 'New York'),
(102, 'Bob', 'Johnson', '2003-11-20', 'Chicago'),
(103, 'Charlie', 'Brown', '2005-01-01', 'New York'),
(104, 'David', 'Lee', '2004-07-25', 'Houston'),
(105, 'Eve', 'Davis', '2003-03-10', 'Chicago');

-- -----------------------------------
-- 2. Student Marks Table
-- (Context: Marks)
-- -----------------------------------
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID), -- FOREIGN KEY Constraint
    Subject VARCHAR(50) NOT NULL,
    Score INT NOT NULL,
    ExamDate DATE
);

INSERT INTO Marks (MarkID, StudentID, Subject, Score, ExamDate) VALUES
(1, 101, 'Math', 85, '2025-05-01'),
(2, 101, 'Science', 92, '2025-05-05'),
(3, 102, 'Math', 78, '2025-05-01'),
(4, 102, 'English', 88, '2025-05-10'),
(5, 103, 'Science', 95, '2025-05-05'),
(6, 104, 'Math', 65, '2025-05-01'),
(7, 105, 'English', 75, '2025-05-10'),
(8, 101, 'English', 88, '2025-05-10');

-- -----------------------------------
-- 3. Library Books Table
-- (Context: Library)
-- -----------------------------------
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    YearPublished INT
);

INSERT INTO Books (BookID, Title, Author, Genre, YearPublished) VALUES
(501, 'The Great SQL', 'A. Data', 'Education', 2022),
(502, 'Database Design', 'B. Query', 'Education', 2021),
(503, 'Adventure Time', 'C. Code', 'Fiction', 2023),
(504, 'SQL Joins Explained', 'D. Key', 'Education', 2024);

-- -----------------------------------
-- 4. Library Borrowing Table
-- (Context: Library - linking Students and Books)
-- -----------------------------------
CREATE TABLE Borrowing (
    BorrowID INT PRIMARY KEY,
    BookID INT FOREIGN KEY REFERENCES Books(BookID), -- FOREIGN KEY Constraint
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID), -- FOREIGN KEY Constraint
    BorrowDate DATE NOT NULL,
    ReturnDate DATE
);

INSERT INTO Borrowing (BorrowID, BookID, StudentID, BorrowDate, ReturnDate) VALUES
(1001, 501, 101, '2025-10-01', '2025-10-15'),
(1002, 502, 102, '2025-10-05', NULL),
(1003, 503, 101, '2025-10-10', NULL),
(1004, 501, 104, '2025-10-20', NULL);

-- -----------------------------------
-- 5. Employee Details Table
-- (Context: Employee)
-- -----------------------------------
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, EmpName, Department, Salary, HireDate) VALUES
(201, 'Manager Alpha', 'IT', 75000.00, '2020-01-15'),
(202, 'Analyst Beta', 'IT', 55000.00, '2021-06-20'),
(203, 'Specialist Gamma', 'HR', 60000.00, '2019-11-01'),
(204, 'Sales Rep Delta', 'Sales', 50000.00, '2022-03-10'),
(205, 'Sales Lead Epsilon', 'Sales', 70000.00, '2020-08-01');



SELECT * FROM Students;

SELECT FirstName, LastName FROM Students;

SELECT EmpName, Salary from Employees 
where Salary > 60000.00;

SELECT BookID, Title from Books
where Author = 'A. Data';

SELECT * FROM Borrowing
where BorrowDate > '2025-10-10';

SELECT DISTINCT City from Students;

SELECT distinct Subject, Score from Marks;

SELECT * from Students;

INSERT into Students VALUES
(106,'GAYATHRI','PRASAD','2007-04-26','KANIYAKUMARI')


UPDATE Students
SET City = 'Miami'
WHERE StudentID = 104;


SELECT * from Employees;

update Employees
SET Department = 'Junior Staff'
where Salary < 55000.00;


DELETE FROM Students
WHERE StudentID = 106;

SELECT * from Students

SELECT FirstName, LEN(LastName) AS 'Length of second name' 
FROM Students;

SELECT FirstName + LastName as 'fullname' FROM Students;

SELECT * from Employees

SELECT EmpName, DATEDIFF(DAY,HireDate,'2025-11-02') AS DaysWorked from Employees;

SELECT Title, YearPublished FROM Books
WHERE YearPublished = 2022;

INSERT INTO Students
VALUES (101, 'GAYATHRI', 'PRASAD', '2007-04-26', 'KANIYAKUMARI');

SELECT * from Books;

INSERT INTO Books(BookID, Author, Genre, YearPublished)
VALUES (505, 'D. Key', 'Education', 2024);


UPDATE Marks
SET Score = 100
WHERE StudentID = 999; 

SELECT * from Students
select * from Marks 

SELECT COUNT(*)
from Students


SELECT AVG(Score) FROM Marks
where Subject = 'Math';

SELECT MIN(Salary) from Employees;
SELECT MAX(Salary) from Employees;

SELECT * from Students

SELECT SUM(Score) From Marks
WHERE StudentID = 101;

SELECT City, COUNT(StudentID) as 'No of students' from Students
GROUP by City

SELECT Subject, AVG(Score) as 'Average Score' from Marks
GROUP BY Subject

SELECT Department, AVG(Salary) FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 65000;




SELECT * from Marks
SELECT * from Students



SELECT s.FirstName, s.LastName, m.Score
from Students s
inner join Marks m
on s.StudentID = m.StudentID;
create database SQLdemoDB1;

use SQLdemoDB1;

-- 1. Create the Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    Gender CHAR(1),
    Department NVARCHAR(100),
    GPA DECIMAL(3,2)
);

-- 2. Insert sample data
INSERT INTO Student (StudentID, FirstName, LastName, Age, Gender, Department, GPA) VALUES
(1, 'Alice', 'Johnson', 20, 'F', 'CS', 3.80),
(2, 'Bob', 'Smith', 22, 'M', 'Math', 2.90),
(3, 'Carol', 'White', 21, 'F', 'CS', 3.95),
(4, 'David', 'Green', 23, 'M', 'Physics', 2.70);

-- 3. Create Views from examples

-- View for Computer Science Students
CREATE VIEW CS_Students AS
SELECT StudentID, FirstName, LastName, GPA
FROM Student
WHERE Department = 'CS';

-- View for High GPA Students
CREATE VIEW High_GPA_Students AS
SELECT FirstName, LastName, GPA
FROM Student
WHERE GPA >= 3.5;

-- View to Combine Full Name
CREATE VIEW StudentNames AS
SELECT StudentID,
       FirstName + ' ' + LastName AS FullName,
       Department
FROM Student;

-- View for Female Students Only
CREATE VIEW Female_Students AS
SELECT StudentID, FirstName, LastName, Age, Department
FROM Student
WHERE Gender = 'F';

-- View with Aggregated GPA by Department
CREATE VIEW Avg_GPA_By_Department AS
SELECT Department,
       AVG(GPA) AS AverageGPA
FROM Student
GROUP BY Department;

-- 4. Using the Views (queries)
SELECT * FROM CS_Students;
SELECT * FROM High_GPA_Students;
SELECT * FROM StudentNames;
SELECT * FROM Female_Students;
SELECT * FROM Avg_GPA_By_Department;

-- 5. Updating Data Through a View
UPDATE CS_Students
SET GPA = 4.00
WHERE StudentID = 1;

-- 6. Insert data through a proper insertable view
CREATE VIEW Insertable_StudentView AS
SELECT StudentID, FirstName, LastName, Age, Gender, Department, GPA
FROM Student;

INSERT INTO Insertable_StudentView
VALUES (5, 'Emily', 'Brown', 20, 'F', 'CS', 3.75);

INSERT INTO Insertable_StudentView
VALUES (6, 'John', 'Doe', 21, 'M', 'Math', 3.10);

-- 7. Delete through a view
DELETE FROM CS_Students
WHERE StudentID = 3;

-- 8. Dropping a View (example)
DROP VIEW High_GPA_Students;

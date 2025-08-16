CREATE DATABASE UniversityDB;

use UniversityDB;

CREATE table students(
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(50),
    GPA  DECIMAL(3,2)
);

INSERT INTO students VALUES 
(101,'Jake','Johanson','CS',8.1);

INSERT INTO students VALUES
(102, 'Jaya', 'Bala', 'Biology', 8.6),
(103,'Sri','Keerthana','Maths',7.9),
(104, 'Raj', 'Kumar', 'Physics', 7.5);

SELECT * FROM students;

UPDATE students
SET Major = 'Psychology' 
where StudentID = 102;

DELETE FROM students WHERE StudentID = 103;

DROP TABLE students;
USE test;
DROP DATABASE UniversityDB;
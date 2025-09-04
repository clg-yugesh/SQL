USE SubqueryDemoDB;

-- Clean slate
DROP TABLE Students;
DROP TABLE Colleges;

-- Two tables only
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
(3, 'Mikel', 101),
(4, 'Anitha', 105);

INSERT INTO Colleges VALUES
(100, 'Harvard University'),
(101, 'Stanford University'),
(102, 'MIT'),
(103, 'Oxford University');

select * from Students;
-- 1. INNER JOIN (common records)
SELECT S.StudentID, S.StudentName, C.CollegeName
FROM Students S
INNER JOIN Colleges C
    ON S.CollegeID = C.CollegeID;

-- 2. LEFT JOIN (all Students, even if no matching College)
SELECT S.StudentID, S.StudentName, C.CollegeName
FROM Students S
LEFT JOIN Colleges C
    ON S.CollegeID = C.CollegeID;

-- 3. RIGHT JOIN (all Colleges, even if no matching Student)
SELECT S.StudentID, S.StudentName, C.CollegeName
FROM Students S
RIGHT JOIN Colleges C
    ON S.CollegeID = C.CollegeID;

-- 4. FULL OUTER JOIN (all Students + all Colleges)
SELECT S.StudentID, S.StudentName, C.CollegeName
FROM Students S
FULL OUTER JOIN Colleges C
    ON S.CollegeID = C.CollegeID;

-- 5. CROSS JOIN (all combinations)
SELECT S.StudentName, C.CollegeName
FROM Students S
CROSS JOIN Colleges C;

-- 6. SELF JOIN (Students compared to Students)
-- Example: students from the same college
SELECT A.StudentName AS Student1, B.StudentName AS Student2, A.CollegeID
FROM Students A
INNER JOIN Students B
    ON A.CollegeID = B.CollegeID
   AND A.StudentID < B.StudentID;

USE SubqueryDemoDB;

-- Student_A and Student_B (UNION example)
CREATE TABLE Students_A (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Students_B (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Students_A VALUES
(1, 'Arjun'),
(2, 'Meena'),
(3, 'Ravi');

INSERT INTO Students_B VALUES
(2, 'Meena'),
(4, 'Kiran');

-- 1. UNION (removes duplicates)
SELECT Name FROM Students_A
UNION
SELECT Name FROM Students_B;

-- Employees_2023 and Employees_2024 (UNION ALL example)
CREATE TABLE Employees_2023 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Employees_2024 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Employees_2023 VALUES
(1, 'Arjun'),
(2, 'Meena'),
(3, 'Ravi');

INSERT INTO Employees_2024 VALUES
(2, 'Meena'),
(4, 'Kiran');

-- 2. UNION ALL (keeps duplicates)
SELECT Name FROM Employees_2023
UNION ALL
SELECT Name FROM Employees_2024;

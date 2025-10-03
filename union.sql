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

-- 2. UNION ALL (keeps duplicates)
SELECT Name FROM Students_A
UNION ALL
SELECT Name FROM Students_B;


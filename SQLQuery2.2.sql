use employees007;


CREATE TABLE Details (
    ID INT PRIMARY KEY,
    Name VARCHAR(150),
    dept VARCHAR(50),
    RollNumber int
   
);

INSERT INTO Details VALUES (101,'Abi','DSA',242201);
INSERT INTO Details VALUES (234,'Avanthika','DSA',242202);
INSERT INTO Details VALUES (145,'Dhani','DSA',242203);
INSERT INTO Details VALUES (112,'Gayu','DSA',242204);
INSERT INTO Details VALUES (147,'Kani','DSA',242205);

SELECT * FROM Details WHERE RollNumber = 242203;

---to retrieving data

SELECT ID, RollNumber  FROM Details ;

SELECT * FROM Details WHERE dept = 'DSA';

SELECT * FROM Details ORDER BY ID DESC;

SELECT DISTINCT dept FROM Details;

SELECT * FROM Details WHERE Name LIKE 'A%';

SELECT * FROM Details WHERE RollNumber BETWEEN 242203 AND 242205;

SELECT * FROM Details WHERE ID IN (112,147);

SELECT Employees.FirstName, Departments.DepartmentName FROM Employees JOIN Departments ON
Employees.DepartmentID = Departments.DepartmentID;

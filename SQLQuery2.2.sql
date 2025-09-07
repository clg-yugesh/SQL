use employees007;

drop table Details;

CREATE TABLE Details (
    ID INT PRIMARY KEY,
    Name VARCHAR(150),
    dept VARCHAR(50),
    RollNumber int
);

INSERT INTO Details VALUES 
(101,'Arul','DSA',242216),
(102,'Bala','DSA',242217),
(103,'Chandru','DSA',242218),
(145,'Abhinash','DSA',242238),
(156,'Yugesh','SSS',242237);


-- SELECT ALL COLUMNS
SELECT * FROM Details;

-- select spcific row
SELECT * FROM Details WHERE RollNumber = 242237;

--- select specific columns
SELECT ID, RollNumber  FROM Details ;

-- using WHERE clause
SELECT * FROM Details WHERE dept = 'DSA';

-- using ORDER BY clause
SELECT * FROM Details ORDER BY ID DESC;

-- using DISTINCE (Remove Duplicates)
SELECT DISTINCT dept FROM Details;

-- using LIKE (Pattern Matching)
SELECT * FROM Details WHERE Name LIKE 'A%';

-- using BETWEEN (Range Filtering)
SELECT * FROM Details WHERE RollNumber BETWEEN 242236 AND 242238;

-- using in (Multiple Match)
SELECT * FROM Details WHERE ID IN (145,103);

SELECT id as 'Register Number' from Details;


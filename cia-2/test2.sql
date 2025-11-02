-- Create and use the sample database
CREATE DATABASE SampleStuDB;
GO

USE SampleStuDB;
GO

CREATE TABLE student(
    id int PRIMARY KEY,
    name VARCHAR(50),
    mark int,
    age int
);

INSERT into student VALUES
(1,'yuvi',90,19),
(2,'gayu',80,18),
(3,'dhani',70,17),
(4,'prakash',89,17);

--if ELSE

DECLARE @mark int
DECLARE @sid int = 1

SELECT @mark = mark from student where id = @sid;

IF @mark >=70
 PRINT 'pass';
ELSE
 print 'fail';


-- while loop
declare @id int = 1;
declare @name NVARCHAR(max);

while @id <= (SELECT max(id) from student)
BEGIN
    select @name = name from student WHERE id = @id;
    PRINT @name;
    SET @id = @id+1;
END


-- while loop
declare @id int = 1;
declare @name NVARCHAR(max);
declare @mark int;

while @id <= (SELECT max(id) from student)
BEGIN
    select @name = name,@mark = mark from student WHERE id = @id;
    SET @id = @id+1;
    IF @mark < 75 
        CONTINUE
    PRINT CAST(@name AS VARCHAR) + ' : ' + CAST(@mark AS VARCHAR);
    
END

CREATE TABLE bankAcc(
    accNo int PRIMARY KEY,
    holderName VARCHAR(40),
    balance DECIMAL(10,2)
)

INSERT INTO bankAcc VALUES
(101,'Ravi',5000.00),
(102,'Priya',3000.00);

BEGIN TRANSACTION;


IF (SELECT balance FROM bankAcc WHERE accNo=101) < 1000
BEGIN
    PRINT 'not sufficient balance'
    ROLLBACK TRANSACTION;
    RETURN;
END
ELSE
BEGIN
    UPDATE bankAcc
    SET balance = balance - 1000
    WHERE accNo = 101;
END

IF @@error = 0
BEGIN
    UPDATE bankAcc
    set balance = balance+1000
    WHERE accNo = 102;
    commit TRANSACTION;
END
ELSE BEGIN
    PRINT 'error occured'
    ROLLBACK TRANSACTION;
END

SELECT * FROM bankAcc;




CREATE TABLE std (
    id int PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName varchar(40),
    age int,
    gender CHAR(1),
    department VARCHAR(30),
    gpa DECIMAL(3,2)
)
INSERT INTO std VALUES
(1, 'Alice', 'Johnson', 20, 'F', 'CS', 3.80),
(2, 'Bob', 'Smith', 22, 'M', 'Math', 2.90),
(3, 'Carol', 'White', 21, 'F', 'CS', 3.95),
(4, 'David', 'Green', 23, 'M', 'Physics', 2.70);

SELECT * from std;

CREATE VIEW CS_STD AS
SELECT id,FirstName,LastName,gpa FROM std
WHERE department = 'CS'

SELECT * from CS_STD;

CREATE VIEW high_gpa AS
SELECT id,FirstName,LastName,gpa FROM std
WHERE gpa > 3.00;

SELECT * FROM high_gpa;


CREATE VIEW full_name AS
SELECT id,FirstName+' '+LastName as fullName,gpa FROM std;

SELECT * FROM full_name;

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    Marks INT
);
CREATE TABLE AuditLog(
    logID int identity(1,1) PRIMARY KEY,
    StudentID INT,
    ActionType varchar(30),
    ActionDate DATETIME,
    OldMark INT,
    NewMark INT
)

CREATE TRIGGER aft_insertion
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog(StudentID,ActionDate,ActionType) 
    SELECT StudentID, GETDATE(),'INSERT'
    FROM inserted;
END


-- Test it:
INSERT INTO Students (StudentName, Department, Marks)
VALUES ('Priya', 'CSE', 85);

-- when std mark is updated log the old mark and new mark
CREATE TRIGGER mark
ON Students
AFTER UPDATE
AS 
BEGIN
    INSERT INTO AuditLog(StudentID,ActionDate,ActionType,OldMark,NewMark)
    SELECT d.StudentID,GETDATE(),'UPDATE',d.Marks,i.Marks
    FROM deleted d
    JOIN inserted i ON d.StudentID = i.StudentID
END


CREATE TRIGGER Af_delt
AFTER DELETE
AS BEGIN
    INSERT INTO AuditLog(StudentID)



SELECT * FROM AuditLog;





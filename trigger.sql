CREATE DATABASE TriggerDB;

USE TriggerDB;
DROP TABLE Student;
-- Create the main student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Marks INT,
    Age INT
);

-- Insert initial data into the table
INSERT INTO Student (StudentID, Name, Marks, Age) VALUES
(1, 'Arun', 85, 20),
(2, 'Bala', 45, 19),
(3, 'Chitra', 72, 21),
(4, 'Deepa', 30, 18),
(5, 'Elango', 90, 22);

-- DML Triggers (Data Manipulation Language)
CREATE TRIGGER trg_AfterInsert
ON Student
AFTER INSERT AS
BEGIN 
  PRINT 'A new record has been inserted into Students table.'
END;

-- DDL Triggers (Data Definition Language)
CREATE TRIGGER trg_DatabaseChange
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    PRINT 'Table structure changed in the database.'
END;

-- testing the DDL Triggers
CREATE TABLE Student2(
    Name VARCHAR(50),
    id int
);

-- LOGON Triggers
CREATE TRIGGER trg_LogonAudit
ON ALL SERVER
FOR LOGON
AS
BEGIN
    PRINT 'A user has logged in to the SQL Server instance.'
END;

CREATE TABLE Students1 (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    Marks INT
);

CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    ActionType VARCHAR(20),
    ActionDate DATETIME,
    OldMarks INT,
    NewMarks INT
);


CREATE TRIGGER trg_AfterInsert_Students
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate)
    SELECT StudentID, 'INSERT', GETDATE()
    FROM inserted;
END;

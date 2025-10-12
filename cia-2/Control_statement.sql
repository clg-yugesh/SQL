---------------------------------------------------------------------
-- T-SQL CONTROL FLOW STATEMENTS EXAMPLES
-- Based on the provided Word document content.
---------------------------------------------------------------------

-- 1. DATABASE SETUP
---------------------------------------------------------------------
-- Create and use the sample database
CREATE DATABASE SampleStuDB;
GO

USE SampleStuDB;
GO

-- Create the main student table
CREATE TABLE StudentTbl (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Marks INT,
    Age INT
);
GO
SELECT * from StudentTbl;
-- Insert initial data into the table
INSERT INTO StudentTbl (StudentID, Name, Marks, Age) VALUES
(1, 'Arun', 85, 20),
(2, 'Bala', 45, 19),
(3, 'Chitra', 72, 21),
(4, 'Deepa', 30, 18),
(5, 'Elango', 90, 22);
GO


DECLARE @sid INT = 3;
DECLARE @SAge INT;

SELECT @SAge = Age FROM StudentTbl
WHERE StudentID = @sid;

IF @SAge >= 20 
    PRINT 'ELIGIBLE FOR ADVANCED COURSES'
ELSE IF @SAge = 19
    PRINT 'NEEDS ONE MORE YEAR OF EXPERIENCE.'
ELSE
    PRINT 'ONLY ELIGIBLE FOR FUNDATIONAL COURSES'



-- Display the created table data
SELECT * FROM StudentTbl;
GO

---------------------------------------------------------------------
-- 2. IF...ELSE EXAMPLES
---------------------------------------------------------------------

-- Simple IF...ELSE block using a declared variable

-- Checking student's pass/fail status from the table (StudentID = 2, Marks = 45)
DECLARE @sid INT = 2;
DECLARE @studentMarks INT;

SELECT @studentMarks = Marks 
FROM StudentTbl 
WHERE StudentID = @sid;

IF @studentMarks >= 50
    PRINT 'Student Passed';
ELSE
    PRINT 'Student ' + CAST(@sid AS VARCHAR) + ' Failed';
GO

---------------------------------------------------------------------
-- 3. WHILE LOOP EXAMPLES
---------------------------------------------------------------------

-- Simple WHILE loop to print numbers 1 through 5

 -- Loop through all student records and print names one by one
DECLARE @id INT = 1;
DECLARE @studentName NVARCHAR(50);
DECLARE @maxId INT = (SELECT MAX(StudentID) FROM StudentTbl);

WHILE @id <= @maxId
BEGIN
    SELECT @studentName = Name 
    FROM StudentTbl 
    WHERE StudentID = @id;
    
    -- Check if student exists (in case of gaps in IDs)
    IF @studentName IS NOT NULL
        PRINT 'Student Name: ' + @studentName;
        
    SET @id = @id + 1;
END
GO

---------------------------------------------------------------------
-- 4. BREAK and CONTINUE EXAMPLES (Used inside a WHILE loop)
---------------------------------------------------------------------

-- Example 2: Using BREAK/CONTINUE with student marks
DECLARE @studentID_iter INT = 1, @mark_check INT;
DECLARE @maxID_check INT = (SELECT MAX(StudentID) FROM StudentTbl);

PRINT '--- BREAK/CONTINUE Student Logic ---';

WHILE @studentID_iter <= @maxID_check
BEGIN
    SELECT @mark_check = Marks 
    FROM StudentTbl 
    WHERE StudentID = @studentID_iter;
    
    IF @mark_check < 40
    BEGIN
        SET @studentID_iter = @studentID_iter + 1;
        CONTINUE;  -- Skip students who failed (Marks < 40)
    END
    
    IF @mark_check = 90
    BEGIN
        PRINT 'Found Topper! Marks: 90. Stopping loop.';
        BREAK;     -- Stop when the topper (Marks = 90) is found
    END
    
    -- This PRINT statement is skipped for failed students (Marks < 40)
    PRINT 'StudentID ' + CAST(@studentID_iter AS VARCHAR) + ' Marks: ' + CAST(@mark_check AS VARCHAR);
    
    SET @studentID_iter = @studentID_iter + 1;
END
GO

---------------------------------------------------------------------
-- 5. GOTO EXAMPLES
---------------------------------------------------------------------


-- Example 2: Using GOTO for conditional exit based on Age
DECLARE @age INT;
SELECT @age = Age FROM StudentTbl WHERE StudentID = 4; -- Deepa, Age 18

IF @age < 18
    GOTO NotEligible;

-- If age >= 18, this path is followed
PRINT 'Student eligible for college admission (Age >= 18)';
RETURN; -- Exits the batch/script here

NotEligible:
-- This section is only reached if GOTO is executed
PRINT 'Student not eligible (Age < 18)';
GO

---------------------------------------------------------------------
-- 6. RETURN EXAMPLES (Stored Procedures)
---------------------------------------------------------------------

-- Example 1: Simple RETURN to exit a procedure early
CREATE PROCEDURE CheckAge 
    @age INT
AS
BEGIN
    IF @age < 18
    BEGIN
        PRINT 'CheckAge: Not eligible';
        RETURN; -- Exit immediately
    END
    PRINT 'CheckAge: Eligible';
END
GO

EXEC CheckAge @age = 17; -- Prints 'Not eligible' and returns
EXEC CheckAge @age = 25; -- Prints 'Eligible'
GO


---------------------------------------------------------------------
-- 7. TRY...CATCH EXAMPLES (Error Handling)
---------------------------------------------------------------------

-- Example 1: Handling a "divide by zero" runtime error
BEGIN TRY
    PRINT 'Attempting division...';
    SELECT 10 / 0; -- Intentional Error: divide by zero
    PRINT 'This line is skipped because of the error.';
END TRY
BEGIN CATCH
    -- Error handling block
    PRINT 'TRY...CATCH Error occurred: ' + ERROR_MESSAGE();
END CATCH
GO

-- Example 2: Handling a data integrity error (PK violation or NULL violation)
-- StudentID 1 already exists, causing a Primary Key violation.
-- Also, the Name column is defined as NOT NULL.
BEGIN TRY
    PRINT 'Attempting INSERT that violates Primary Key...';
    -- This insert will fail because StudentID 1 already exists.
    INSERT INTO StudentTbl (StudentID, Name, Age, Marks)
    VALUES (1, 'Zoe', 20, 85); 
    
    PRINT 'Insert successful.'; -- This line will not be reached
END TRY
BEGIN CATCH
    -- Output the specific error message
    PRINT 'TRY...CATCH Insert failed: ' + ERROR_MESSAGE();
END CATCH
GO

---------------------------------------------------------------------
-- 8. CLEANUP (Optional)
---------------------------------------------------------------------
-- Clean up the created database and procedures
IF OBJECT_ID('CheckAge') IS NOT NULL DROP PROCEDURE CheckAge;
IF OBJECT_ID('CheckResults1') IS NOT NULL DROP PROCEDURE CheckResults1;
GO

USE master;
GO
-- Ensure no active connections before dropping
-- ALTER DATABASE SampleStuDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- DROP DATABASE SampleStuDB;
-- GO




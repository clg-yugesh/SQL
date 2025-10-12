CREATE DATABASE TransactionDB2;
USE TransactionDB2;

CREATE TABLE Students (
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

-- Step 2: AFTER INSERT Trigger
-- When a new student record is added, the trigger will log it in AuditLog.
CREATE TRIGGER trg_AfterInsert_Students
ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate)
    SELECT StudentID, 'INSERT', GETDATE()
    FROM inserted;
END;

-- Test it:
INSERT INTO Students (StudentName, Department, Marks)
VALUES ('Priya', 'CSE', 85);
------------------------------------------------------------------------------
-- Step 3: AFTER UPDATE Trigger
-- When student marks are updated, log the old and new marks.
CREATE TRIGGER trg_AfterUpdate_Students
ON Students
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate, OldMarks, NewMarks)
    SELECT d.StudentID, 'UPDATE', GETDATE(), d.Marks, i.Marks
    FROM deleted d
    INNER JOIN inserted i ON d.StudentID = i.StudentID;
END;


-- Test it:
UPDATE Students
SET Marks = 92
WHERE StudentID = 1;

--  Output:
-- AuditLog will now show an UPDATE action with old and new marks.



--  Step 4: AFTER DELETE Trigger
-- When a student record is deleted, log the event.
CREATE TRIGGER trg_AfterDelete_Students
ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditLog(StudentID, ActionType, ActionDate)
    SELECT StudentID, 'DELETE', GETDATE()
    FROM deleted;
END;


-- Test it:
DELETE FROM Students
WHERE StudentID = 1;

--  Output:
-- AuditLog will store a record that a student record was deleted.
--  Step 5: Check Logs
SELECT * FROM AuditLog;

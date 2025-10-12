CREATE DATABASE TransactionDB;
USE TransactionDB;

DROP TABLE BankAccounts;

CREATE TABLE BankAccounts (
    AccNo INT PRIMARY KEY,
    HolderName VARCHAR(50),
    Balance DECIMAL(10,2)
);

INSERT INTO BankAccounts VALUES
(101,'Ravi',5000.00),
(102,'Priya',3000.00);


SELECT * FROM BankAccounts;

BEGIN TRANSACTION;

IF (SELECT Balance FROM BankAccounts WHERE AccNo = 101) < 1000
BEGIN
    PRINT 'Insufficient balance! Rolling back...';
    ROLLBACK TRANSACTION;
    RETURN;
END;
ELSE
BEGIN
    UPDATE BankAccounts
    SET Balance = Balance - 1000
    WHERE AccNo = 101;  
END;


-- DECLARE @transactionAmt DECIMAL(10,2) = 1000.00;
IF @@ERROR = 0
BEGIN
    UPDATE BankAccounts
    SET Balance = Balance + 1000
    WHERE AccNo = 102;  
    COMMIT TRANSACTION;
    PRINT 'Transaction Successful: Amount Transferred';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction failed: Changes REverted';
END;

SELECT * FROM BankAccounts;



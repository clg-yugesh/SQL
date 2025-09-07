create database UniversityDB
use UniversityDB

drop database UniversityDB
drop table Students;

create table Students(
    StudentID INT,
    FirstName varchar(50),
    Lastname VARCHAR(50),
    Major VARCHAR(50),
    GPA DECIMAL(3,2)
);

insert into Students values
(1,'Alice','Johnson','CS',8.5);

insert into Students values
(2,'Bala','Hari','SSS',7),
(3,'Keerthana','sri','AI/DS',4)
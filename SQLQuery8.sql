create database student_details00345;

use student_details00345;

create table mark (
    id int,
    name varchar(50),
    subject varchar(30),
    marks int
);

insert into mark VALUES 
(1,'Rahul','Math',85),
(2,'Priya','Science',90),
(3,'Rahul','Science',80),
(4,'Priya','Math',95),
(5,'Anjali','Math',70);


-- print the total mark per student
select name, sum(marks) as total_marks 
from mark 
group by name;

-- average marks per subject
select subject, avg(marks) as avg_marks 
from mark
group by subject;

-- count of students per subject
select subject, count(*) as student_count 
from mark
group by subject;

-- show only students with total marks > 150
select name, sum(marks) as total_marks
from mark 
group by name
having sum(marks) > 150;

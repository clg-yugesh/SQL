CREATE DATABASE IF NOT EXISTS name_details;

USE name_details;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id INT,
  name VARCHAR(50),
  city VARCHAR(60)
);

INSERT INTO students (id, name, city)
VALUES
(1, 'Rahul', 'Chennai'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Chennai'),
(4, 'Anjali', 'Delhi'),
(5, 'Priya', 'Mumbai');

-- Get unique students names
select distinct name from students;

-- Get unique combinations of name and city
select distinct name, city from students;


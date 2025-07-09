-- 1. Insert, Update, Delete rows and Delete tables.

create database fastfood;

use fastfood;
-- drop table sales;
create table sales (
	names varchar(20),
	catagory bit,
	amount float
);

-- insert 
insert into sales
values 
('yugesh',0,100),
('gaayu',1, 89);

-- update
update sales 
set amount = 0
where names = 'yugesh';

-- delete column
alter table sales
drop column catagory;

-- delete table
drop table sales

-- print
select * from sales;




-- 2. Retrieving Data using queries.

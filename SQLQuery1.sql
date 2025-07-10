CREATE DATABASE fast_food;
use fast_food

-- create table
create table sales (
   order_id int,
   item_type VARCHAR(20),
   amount float
);

-- insert elements 
insert into sales(order_id,item_type,amount) 
values
(001, 'beverage', 100.20),
(002, 'fast food', 202.34),
(003, 'fast food',305.34),
(004, 'beverage', 40.35),
(005, 'fast food', 55.00);


-- deleting a row
delete from sales where order_id = 2;

-- change datatype
alter table sales
alter column amount int;


-- update
update sales
set amount = 0
where item_type = 'fast food';

-- change table name
exec sp_rename 'sales','sale';

-- change column name
exec sp_rename 'sale.amount','rate', 'column';

-- deleting a column
alter table sale
drop column rate;

-- delete table 
drop table sale;


select * from sales;

-- print
select * from sale; 

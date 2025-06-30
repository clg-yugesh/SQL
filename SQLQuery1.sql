-- CREATE DATABASE fast_food;
use fast_food
drop table sales

-- create table
create table sales (
   order_id int,
   item_type VARCHAR(20)
   );

-- add column
alter table sales
add amount float;

-- insert elements 
insert into sales(order_id,item_type,amount) 
values
(001, 'beverage', 100.20),
(002, 'fast food', 202.34),
(003, 'fast food',305.34),
(004, 'beverage', 40.35),
(005, 'fast food', 55.00);

-- deleting a column
alter table sales
drop column amount;

-- update
update sales
set amount = 0
where item_type = 'fast food';

-- print
select * from sales where order_id < 4;
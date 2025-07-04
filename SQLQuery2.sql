use fast_food

-- create table
create table sales2 (
   order_id int,
   item_type VARCHAR(20),
   amount float
   );

-- insert elements 
insert into sales2(order_id,item_type,amount) 
values
(001, 'beverage', 100.20),
(002, 'fast food', 202.34),
(003, 'fast food',305.34),
(004, 'beverage', 40.35),
(005, 'fast food', 55.00);
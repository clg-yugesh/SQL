CREATE DATABASE company_details_siva_madhesh;

use company_details_siva_madhesh;

create table sales(
 id int,
 product varchar(30),
 quantity int,
 price float
);

insert into sales values
(1,'Pen',10,5),
(2,'Pencil', 20, 2),
(3, 'Pen', 5, 5),
(4, 'Notebook',7,15);

-- Total quantity sold
select sum(quantity) as total_quantity from sales;

-- Average price
select avg(price) as average_price from sales;

-- total number of transaction
select count(*) as total_transactions from sales;

-- hightest and lowest price
select max(price) as highest_price, min(price) as lowest_price from sales;

-- with group by;
-- total quantity sold per product
select product, sum(quantity) as total_quantity from sales
group by product;


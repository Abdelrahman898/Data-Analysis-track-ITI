
use Abdelrahman;

-- Inner join: returns only rows that have matching values in both tables.

select count(discount) count_of_discount,first_name,last_name,quantity,city
from sales.customers sc
inner join sales.order_items so
on sc.customer_id = so.order_id
where so.quantity = 2
group by so.quantity,sc.city,sc.first_name,sc.last_name
order by count_of_discount desc;


-- new query

select count('list_price')total_price,brand_name,category_name,product_name,store_name
from production.brands pb
inner join production.categories pc
on pb.brand_id = pc.category_id
inner join production.products pp
on pb.brand_id = pp.product_id
inner join sales.stores st
on pb.brand_id = st.store_id
inner join sales.order_items soi
on pb.brand_id = soi.item_id
group by pc.category_name,pp.product_name,pb.brand_name,store_name;



-- Display Customer's(first_name,last_name) pending orders(order-date,requird date) with order's details(product,quantity) 

select first_name,last_name,order_date,required_date,quantity,product_name
from sales.customers sc
inner join sales.orders so
on sc.customer_id = so.order_id
inner join sales.order_items soi
on sc.customer_id = soi.item_id 
inner join production.products pp
on sc.customer_id = pp.product_id


 -- Display customers(first_name,last_name)  with no orders 

 select sales.customers.first_name,sales.customers.last_name
 from sales.customers 
 where sales.customers.customer_id not in (select sales.orders.customer_id from sales.orders);
 

-- List customers(first_name,last_name)with total number of order and total(prices after discount) 

select first_name,last_name,COUNT(quantity) no_of_orders,sum(list_price) total_price
from sales.customers sc
inner join sales.order_items soi
on sc.customer_id = soi.order_id
group by sc.first_name,sc.last_name
order by total_price desc; 

-- Do the Same but with total number of orders higher than 3

select first_name,last_name,COUNT(quantity)as no_of_orders,sum(list_price) total_price
from sales.customers sc
inner join sales.order_items soi
on sc.customer_id = soi.order_id
group by sc.first_name,sc.last_name
having COUNT(quantity) > 3;


-- in one list display all categories and all brands names and with type column in order to determine this is category or brand(hint: use union)

select production.categories.category_name ,'category' as type,0 as ord
from production.categories
union
select production.brands.brand_name,'brand' as type,1 as ord
from production.brands


-- select all customers (first_name,last_name) with their orders (order_date, required_date, shipping_date) even if they not associated with any .(hint use  left outer join)

select required_date,shipped_date,order_date,first_name,last_name
from sales.customers sc
join sales.orders so
on sc.customer_id = so.customer_id

select required_date,shipped_date,order_date,first_name,last_name
from sales.customers sc
left join sales.orders so
on sc.customer_id = so.customer_id


-- Display Staff list with direct manager [ better to use outer join cuz there will be null ]

/*

Left join: returns all rows from the left table, even if there are no matches in the right table.
so below query will return all rows from the left side/table [sales.staffs.first_name,sales.staffs.last_name]
even if there are no matches in the right table/side [sales.staffs.manager_id]
so what im intersted in here is to return full data from left side.

Right join: returns all rows from the right table, even if there are no matches in the left table.
Full join: returns all rows from both tables, even if there are no matches in either table.


NOTE:
    IF you swift this order [sales.staffs.manager_id = parent.staff_id] it will be reverse data in the table crreated

*/

select sales.staffs.first_name,sales.staffs.last_name ,parent.first_name  as parent_first_name, parent.last_name  as parent_last_name 
from sales.staffs 
Left join sales.staffs as parent on
sales.staffs.manager_id = parent.staff_id


select sales.staffs.first_name,sales.staffs.last_name ,sales.staffs.first_name  as parent_first_name, sales.staffs.last_name  as parent_last_name 
from sales.staffs 
left join sales.staffs as parent on
sales.staffs.manager_id = parent.staff_id



-- Display direct manager with Staff list 


/*

Right join: returns all rows from the right table, even if there are no matches in the left table.
so below query will return all rows from the right side/table [parent_first_name, parent_last_name]
so what im intersted in here is to return full data from right side.

*/

select sales.staffs.first_name,sales.staffs.last_name ,parent.first_name  as parent_first_name, parent.last_name  as parent_last_name 
from sales.staffs 
Right join sales.staffs as parent on
sales.staffs.manager_id = parent.staff_id



-- self join 

select ss.first_name ,ss.last_name , sm.first_name as [manager fname] , sm.last_name [manager lname]
from sales.staffs ss, sales.staffs sm
where ss.manager_id = sm.staff_id


select * from sales.staffs

/*
Full join: returns all rows from both tables, even if there are no matches in either table.
*/

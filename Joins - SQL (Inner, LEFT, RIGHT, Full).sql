--1.	Retrieve a list of all customers with their 
--corresponding product names they ordered 
--(use an INNER JOIN between customers and sales tables).
select c.customer_name,p.product_name 
from products p inner join sales s on 
p.product_id=s.product_id join customers c on
c.customer_id=s.customer_id ;

2.--List all products and show the details of customers 
--who have placed orders for them. Include products that have no orders
--(use a LEFT JOIN between products and sales tables).
select p.product_name,c.customer_name
from products p left join sales s
on p.product_id=s.product_id  inner join customers c on
c.customer_id=s.customer_id;

3.--3.	List all orders and their shipping status.
--Include orders that do not have any shipping records 
--(use a LEFT JOINbetween sales and shippings tables).
select p.product_name, s.order_id,s.order_status,sh.delivery_status
from sales s left join shippings sh on 
s.order_id=sh.order_id inner join products p on
p.product_id = s.product_id;

--4.Retrieve all products, including those with no orders, 
--along with their price.
--Use a RIGHT JOIN between the products and sales tables.
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    s.order_id,
    s.order_date,
    s.customer_id,
    s.quantity
from products p right join sales s 
on p.product_id =s.product_id;

select * from sales;

5.--Get a list of all customers who have placed orders,
--including those with no payment records.
--Use a FULL OUTER JOIN between the customers
--and payments tables.
select c.customer_name,ph.payment_status
from customers c full outer join sales s
on c.customer_id=s.customer_id
full outer join payments ph
on s.order_id=ph.order_id;

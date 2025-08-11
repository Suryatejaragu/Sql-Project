--●	Find the total number of completed orders made by customers 
--from the state 'Delhi' (use INNER JOIN between customers and sales and
--apply a WHERE condition).
select c.*,s.*
from customers c join sales s
on c.customer_id=s.customer_id
where state ='Delhi' and order_status='Completed'
Order by c.customer_id asc;


--Retrieve a list of products ordered by customers
--from the state 'Karnataka' 
--with price greater than 10,000 
--(use INNER JOIN between sales, customers, and products)
select p.product_name
from sales s join customers c on 
c.customer_id=s.customer_id join products p
on p.product_id=s.product_id
where state ='Karnataka' and price_per_unit>10000;


--●	List all customers who have placed orders 
--where the product category is 'Accessories' and
--the order status is 'Completed'
--(use INNER JOIN with sales, customers, and products).
select c.customer_name
from sales s join customers c on 
s.customer_id=c.customer_id join products p on
s.product_id=p.product_id
where order_status ='Completed';


--●	Show the order details of customers who have paid for their orders,
--excluding those who have cancelled their orders
--(use INNER JOIN between sales and payments 
--and apply WHERE for order_status).
select s.order_id,s.order_date,s.order_status
from sales s join payments p 
on s.order_id=p.order_id
where order_status='Completed';

--●	Retrieve products ordered by customers who are in the 'Gujarat' state 
--and whose total order price is greater than 15,000 
--(use INNER JOIN between sales, customers, and products).
select p.product_name,s.quantity*price_per_unit total
from sales s join customers c on
s.customer_id=c.customer_id join products p
on s.product_id=p.product_id
where c.state like 'Gujarat' and s.quantity*price_per_unit>15000;



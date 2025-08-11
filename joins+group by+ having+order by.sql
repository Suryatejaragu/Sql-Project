--●	Retrieve the total sales per customer in 'Delhi' 
--where the order status is 'Completed', only 
--include those with total sales greater than 50,000
--, and order the results by total sales 
--(use INNER JOIN between sales and customers).
select sum(s.quantity*s.price_per_unit) as total_sales,c.customer_id
from sales s inner join customers c on 
s.customer_id=c.customer_id
where c.state like 'Delhi' and s.order_status like 'Completed' 
group by c.customer_id
having  sum(s.quantity*s.price_per_unit) >50000
order by  sum(s.quantity*s.price_per_unit) >50000 asc;


--Show the total quantity sold per product in the 
--'Accessories' category where the total quantity
--sold is greater than 50 and order the results by 
--product name (use INNER JOIN between sales and products).
select p.product_id,sum(s.quantity),p.product_name
from sales s inner join  products p on 
p.product_id=s.product_id
where category like 'Accessories'
group by p.product_id
having sum(quantity)>50
order by product_name asc;

--●	Find the total number of orders for customers 
--from 'Maharashtra' who have spent more than 
--1,00,000, and order the results by the total
--amount spent (use INNER JOIN between sales 
--and customers).
select c.customer_id,count(s.order_id),sum(quantity*price_per_unit) as spent
from sales s inner join customers c on 
c.customer_id =s.customer_id
where c.state like 'Maharashtra'
group by c.customer_id
having sum(quantity*price_per_unit)>100000
order by sum(quantity*price_per_unit) asc;

--●	Get the number of orders per product and
--filter to include only products that have 
--been ordered more than 10 times, then
--order the results by the highest number
--of orders (use INNER JOIN between sales and products).
select count(s.order_id)as total_orders,p.product_name
from  sales s inner join products p 
on s.product_id =p.product_id
group by p.product_id,p.product_name
having count(s.order_id)>10
order by count(s.order_id) desc;

--Retrieve the number of payments made per customer 
--where the payment status is 'Payment Successed'
--and group by customer, ordering by payment count 
--(use INNER JOIN between payments and customers).
select c.customer_id,count(p.payment_id)
from payments p join sales s on p.order_id =s.order_id
join customers c on s.customer_id=c.customer_id
where p.payment_status ='Payment Successed'
group by c.customer_id,c.customer_name
order by count(payment_id)asc;

--●	Find the total quantity of each product ordered 
--by customers from 'Delhi' and only include products with 
--a quantity greater than 5
--(use INNER JOIN with sales, customers, and products
--and group by product).
select p.product_name,p.product_id,sum(s.quantity) as total
from sales s inner join customers c on 
s.customer_id=c.customer_id inner join products p on 
s.product_id=p.product_id
where c.state = 'Delhi'
group by p.product_id,p.product_name
having sum(s.quantity) > 5;

--Get the average payment amount per customer
--who has placed more than 3 orders
--(use INNER JOIN between paymentsand sales,
--group by customer, and apply a HAVING clause).
select round(avg(quantity*price_per_unit)) as total ,s.customer_id
from sales s inner join payments py on py.order_id=s.order_id
group by s.customer_id
having count(s.order_id )>3;

--●	Retrieve the total sales for each product category 
--and only include categories where the total sales
--exceed 100,000 (use INNER JOIN between sales and
--products, group by category).
select p.category,SUM(s.quantity * s.price_per_unit)
from sales s inner join  products p 
on p.product_id=s.product_id
group by category
having SUM(s.quantity * s.price_per_unit)>100000;

--●	Show the number of customers in each state 
--who have made purchases with a total spend greater
--than 50,000 (use INNER JOIN between sales and customers).
select c.state, count(distinct(c.customer_id))
from customers c join sales s
on c.customer_id=s.customer_id
group by state
having sum(s.quantity*s.price_per_unit)>50000;

---List the total sales by brand for products that
--have been ordered more than 10 times
--(use INNER JOIN between salesand products, 
--group by brand).
select p.brand,sum(s.quantity*s.price_per_unit),count(s.order_id)
from sales s inner join products p on
s.product_id=p.product_id
group by brand,p.product_id
having  sum(s.quantity)>10;
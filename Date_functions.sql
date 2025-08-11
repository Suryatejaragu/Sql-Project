--●	List all orders that were placed within 
--the year 2023 (use order_date with the 
--EXTRACT function).
select * from sales s
where EXTRACT(YEAR from order_date)=2023;

--●	Retrieve customers who have made purchases
--in the month of January (use order_date and 
--TO_CHAR to extract the month).
SELECT c.* FROM SALES S INNER JOIN CUSTOMERS C ON
C.Customer_id=s.customer_id
WHERE TO_CHAR(S.Order_Date,'MONTH' )='JANUARY  '
;

--●	Calculate the number of days between
--the payment_date and order_date for
--each order (use the AGE function).
SELECT 
    s.order_id,
    s.order_date,
    p.payment_date,
    AGE(p.payment_date, s.order_date) AS duration_between,
    DATE_PART('day', AGE(p.payment_date, s.order_date)) AS days_difference
FROM 
    sales s
INNER JOIN 
    payments p ON s.order_id = p.order_id;
---EXAMPLE
select  age(current_date,'29-03-2004') as diff,
DATE_PART('MON',age(current_date,'29-03-2004'))as day;

--●	Find the total sales for each year 
--(use EXTRACT with order_date to group by year).
select sum(quantity * price_per_unit) as total_sales,TO_CHAR(Order_date,'YYYY')
from sales
GROUP  BY TO_CHAR(Order_date,'YYYY') 
order by TO_CHAR(Order_date,'YYYY') desc;
----or----
select sum(quantity * price_per_unit) as total_sales, 
EXTRACT(YEAR FROM order_date)
from sales
GROUP  BY EXTRACT(YEAR FROM order_date)
order by  EXTRACT(YEAR FROM order_date) desc;

--●	Show all orders where the shipping date 
--is after the payment date (use date comparison).
select s.order_id,s.order_date from shippings sh inner join sales s on 
sh.order_id=s.order_id
join payments p on p.order_id=s.order_id inner join products pr
on pr.product_id=s.product_id
where sh.shipping_date>p.payment_date;
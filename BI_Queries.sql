SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
SUM(amount) OVER (PARTITION BY store_id) as Total_Amount 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
AVG(amount) OVER (PARTITION BY store_id) as Avg_Amount 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
MIN(amount) OVER (PARTITION BY store_id) as Min_Amount 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
MAX(amount) OVER (PARTITION BY store_id) as Max_Amount 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
COUNT(payment_id) OVER (PARTITION BY store_id) as Total_orders 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
RANK() OVER(ORDER BY amount DESC) as Rank 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY time_id) as Row_Number 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, time_id, 
NTILE(4) OVER(ORDER BY amount) as Quartile 
FROM sales_fact;

SELECT payment_id, customer_id, amount, film_id, store_id, 
MIN(c_date) OVER (PARTITION BY store_id) as First_Order 
FROM sales_fact NATURAL JOIN dim_time;

SELECT c_week, c_month, c_qtr, c_year, SUM (amount) 
FROM sales_fact NATURAL JOIN dim_time 
GROUP BY ROLLUP(c_week, c_month, c_qtr, c_year);

SELECT store_id, SUM (amount) 
FROM sales_fact 
GROUP BY CUBE(store_id);


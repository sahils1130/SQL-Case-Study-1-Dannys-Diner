
SQL Case Study 

-- Q1 - What is the total amount each customer spent at the restaurant?
-- select a.customer_id, 
--       sum(b.price) sales
--       from dannys_diner.sales a left join dannys_diner.menu b on a.product_id = b.product_id
--       group by a.customer_id

-- Q2 - How many days has each customer visited the restaurant?
-- select customer_id, 
--       count(distinct order_date) days
--       from dannys_diner.sales
--       group by customer_id

-- Q3 - What was the first item from the menu purchased by each customer?
-- with temp as (select a.customer_id,
--       b.product_name,
--       dense_rank() over(partition by a.customer_id order by order_date) rnk
--       from dannys_diner.sales a left join dannys_diner.menu b on a.product_id = b.product_id)
--       select * from temp where rnk = 1

-- Q4 - What is the most purchased item on the menu and how many times was it purchased by all customers?
-- with temp as (select b.product_name,
--       count(a.product_id) time_purchased
--       from dannys_diner.sales a left join dannys_diner.menu b on a.product_id = b.product_id
--       group by b.product_name)
--       select * from temp

-- Q5 - Which item was the most popular for each customer?
-- with temp as (select a.customer_id,
--       b.product_name,
--       count(*) purchased,
--       dense_rank() over(partition by a.customer_id order by count(*) desc) rnk
--       from dannys_diner.sales a left join dannys_diner.menu b on a.product_id = b.product_id
--       group by a.customer_id,
--       b.product_name)
--       select * from temp where rnk = 1

-- Q6 - Which item was purchased first by the customer after they became a member?
      

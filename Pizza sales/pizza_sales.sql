-- Data
select * from pizza_sales
-- Total revenue
select sum(total_price) as total_revenue from pizza_sales 
--Average order
select sum(total_price) / count(distinct order_id) as average_order_value
from pizza_sales
--Total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales
--Total order
select count(distinct order_id) as total_orders from pizza_sales
--Average pizza ordered per order
select  cast (sum(quantity) as decimal(10,2)) / cast (count(distinct order_id)
as decimal(10,2)) as average_pizza_per_order  from pizza_sales
--Daily trends in orders
select datename(dw,order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales group by datename(dw,order_date)
-- Hour trend
select DATEPART(HOUR,order_time) as order_hr,count(distinct order_id) as total_orders from pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time)
--Percentage of sales by pizza category
select pizza_category , cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2))as percentage_
from pizza_sales 
group by pizza_category
order by  percentage_
--Percentage of sales by pizza size
select pizza_size,cast (sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) as decimal (10,2)) as  percentage_
from pizza_sales 
group by pizza_size
order by  percentage_
--Total pizza sold by pizza category
select pizza_category,sum(quantity) as total from pizza_sales
group by  pizza_category
order by total desc
--Top 5 best seller based on total pizza sold
select top 5 pizza_name,sum(quantity) as total from pizza_sales
group by  pizza_name
order by total desc 
--Bottom 5 best seller based on total pizza sold
select top 5 pizza_name,sum(quantity) as total from pizza_sales
group by  pizza_name
order by total  
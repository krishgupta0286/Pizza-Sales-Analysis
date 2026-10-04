Create database Pizza_Project

use pizza_project

select * from pizza_sales

Select count(*) as Total_rows from pizza_sales

exec sp_help 'pizza_sales'

-------------------Analyze Pizza Data-------------------------------------

--Total Revenue:

select round(sum(Total_price),3) as Total_Revenue from pizza_sales

-- Average Order Value

select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales

-- Total Pizzas Sold

select sum(quantity) as Total_pizzas_sold from pizza_sales

--Total Orders

select count(distinct order_id) as Total_orders from pizza_sales

-- Average Pizzas Per Order

select cast(cast(sum(quantity) as decimal (10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Average_pizza_per_order from pizza_sales

--Daily Trend for Total Orders

select datename(DW, order_date) as Order_Day, count(distinct order_id) as Total_orders from pizza_sales group by datename(DW, order_date)

-- Monthly Trend for Orders

select datename(Month, order_date) as Month_name, count(distinct order_id) as Total_orders from pizza_sales group by datename(Month, order_date) 

-- % of Sales by Pizza Category

select pizza_category, round(Sum(Total_price),2) as Total_revenue, round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as PCT from pizza_sales group by pizza_category

--% of Sales by Pizza Size

select pizza_size, round(sum(total_price),2) as Total_revenue, round(sum(total_price) * 100 / (select sum(Total_price) from pizza_sales),2) as PCT from pizza_sales group by pizza_size order by pizza_size

-- Total Pizzas Sold by Pizza Category

select Pizza_category, sum(quantity) as Total_Pizza_Sold from Pizza_sales group by Pizza_category order by Total_Pizza_Sold desc

--Top 5 Pizzas by Revenue

select top 5 pizza_name, sum(Total_price) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue desc

-- Bottom 5 Pizzas by Revenue

select top 5 pizza_name, round(sum(Total_price),2) as Total_Revenue from pizza_sales group by pizza_name order by Total_Revenue 

-- Top 5 Pizzas by Quantity

select top 5 Pizza_name, sum(Quantity) as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity desc

--Bottom 5 Pizzas by Quantity

select top 5 Pizza_name, sum(Quantity) as Total_Quantity from pizza_sales group by pizza_name order by Total_Quantity 

--Top 5 Pizzas by Total Orders

select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales group by pizza_name order by Total_orders desc

-- Bottom 5 Pizzas by Total Orders

select top 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales group by pizza_name order by Total_orders 



--------------------------------------------------The End----------------------------------------------------------------------------------

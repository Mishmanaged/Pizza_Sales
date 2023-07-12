--Total Revenue:
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;
 

--Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM pizza_sales;


--Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;
 

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales;


--Average Pizzas Per Order
SELECT CAST(SUM (quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS avg_pizzas_per_order
FROM pizza_sales ps;


--NUMBER OF ORDERS EVERYDAY
SELECT order_date, COUNT(DISTINCT order_id)
FROM pizza_sales ps
GROUP BY order_date;


--HOURLY TREND FOR ORDERS
SELECT strftime('%H', order_time) AS order_hours,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_hours
ORDER BY order_hours;


--PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT pizza_category, SUM(total_price) as total_revenue,
(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


--PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size, SUM(total_price) AS total_revenue,
(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


--TOTAL PIZZA SOLD BY CATEGORY
SELECT pizza_category, SUM(quantity)
FROM pizza_sales ps
GROUP BY pizza_category;


--TOP 5 BEST SELLER BY TOTAL  PIZZAS SOLD
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

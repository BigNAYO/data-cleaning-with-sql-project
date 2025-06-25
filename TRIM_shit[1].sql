-- 1. Which products generate the most profit?

SELECT 
	product_name,
	SUM(profit) as total_profit
FROM CleanedSuperStoreOrder
GROUP BY product_name
ORDER BY total_profit DESC

-- 2. Which states or regions are the most profitable?

SELECT 
	region,
	SUM(profit) as total_profit
FROM CleanedSuperStoreOrder
GROUP BY region
ORDER BY total_profit DESC

SELECT 
	state,
	SUM(profit) as total_profit
FROM CleanedSuperStoreOrder
GROUP BY state
ORDER BY total_profit DESC

-- 3. Which customer segments contribute the most to sales and profit?

SELECT
	segment,
	sum(profit) AS total_profit,
	sum(sales) AS total_sales
FROM CleanedSuperStoreOrder
GROUP BY segment 
ORDER BY total_profit desc, total_sales DESC

-- 4. What are the monthly or yearly sales trends?
WITH month_year AS (
SELECT 
	DATENAME(year, order_date) as year,
	DATENAME(month, order_date) as month,
	sales
FROM CleanedSuperStoreOrder)
SELECT year, month, SUM(sales)
FROM month_year
GROUP BY year, month
ORDER BY year ASC, month ASC
	
SELECT 
	year(order_date) as year,
	DATENAME(month, order_date) as month,
	SUM(sales) AS total_sales
FROM CleanedSuperStoreOrder
GROUP BY year(order_date), DATENAME(month, order_date)
ORDER BY year ASC
	
-- 5. What is the average shipping delay per shipping mode?

SELECT
	ship_mode,
	AVG(DATEDIFF(day, order_date, ship_date)) as avg_delay_days
FROM CleanedSuperStoreOrder
GROUP BY ship_mode

-- 6. Which categories or sub-categories are underperforming (losses)?
SELECT 
	category,
	subcategory,
	SUM(profit) AS total_profit
FROM CleanedSuperStoreOrder
GROUP BY category, subcategory 
ORDER BY total_profit ASC

-- 7. What are the most frequently ordered products?

SELECT
	product_name,
	COUNT(quantity) as count_of_quantity
FROM CleanedSuperStoreOrder
GROUP BY product_name
ORDER BY count_of_quantity DESC

-- 8. Who are the top 10 most valuable customers?
SELECT
	customer_name,
	SUM(profit) AS sum_of_profit,
	SUM(sales) as sum_of_sales
FROM CleanedSuperStoreOrder
GROUP BY customer_name
ORDER BY sum_of_profit DESC, sum_of_sales DESC

-- 9. Is there seasonality in orders or sales?
SELECT
	DATENAME(YEAR, order_date) AS year,
	DATENAME(Month,order_date) AS month,
	MONTH(order_date) as month_number,
	SUM(sales) AS sum_of_sales
FROM CleanedSuperStoreOrder
GROUP BY DATENAME(YEAR,order_date), DATENAME(Month,order_date), MONTH(order_date)
ORDER BY year ASC, month_number ASC


-- 10. What are the top 5 most profitable products per category?
WITH cte as (
	SELECT 
		category,
		product_name,
		SUM(profit) AS total_profit
	FROM CleanedSuperStoreOrder
	GROUP BY category, product_name
),
cte2 as (
	SELECT
		*,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY total_profit DESC) AS rank
	FROM cte
)
SELECT
	category,
	product_name,
	total_profit
FROM cte2
WHERE rank in (1, 2, 3, 4, 5)

-- 11. Identify Repeat Customers: Which customers have made more than 3 purchases?
SELECT
	customer_name,
	Count(*) as all_order
FROM CleanedSuperStoreOrder
GROUP BY customer_name
HAVING COUNT(*) > 3
ORDER BY all_order ASC

-- 12. Products with Negative Profit: Which products have caused overall losses?
SELECT
	product_name,
	SUM(profit) as total_profit
FROM CleanedSuperStoreOrder
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC


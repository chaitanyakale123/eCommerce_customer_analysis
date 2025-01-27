USE project;
select * from Ecommerce_customer;
------------------------------------------------------------------
select * from latitude_longitude;

--------------Remove Duplicates--------------------
SELECT DISTINCT *
INTO Ecommerce_customer
FROM Ecommerce_customer;


-------------Handle Null Values-------------------
select * from Ecommerce_customer
WHERE customer_id IS NULL
	AND order_id IS NULL
    AND sales_per_order IS NULL;

------------(update)Correct Date Formats----------
UPDATE ecommerce_customer
SET order_date = REPLACE(order_date, '-', '/')
WHERE order_date LIKE '%-%';

------------Trim Whitespace from Text Fields-------
UPDATE ecommerce_customer
SET customer_first_name = TRIM(customer_first_name),
    customer_last_name = TRIM(customer_last_name);

------------Remove Negative Values for Profit------
DELETE FROM ecommerce_customer
WHERE profit_per_order < 0;

----------Check for Duplicates---no duplicates here--------
DELETE ec
FROM ecommerce_customer ec
JOIN (
    SELECT MIN(customer_id) AS first_customer_id, order_id
    FROM ecommerce_customer
    GROUP BY order_id
    HAVING COUNT(*) > 1
) AS duplicates
ON ec.order_id = duplicates.order_id
AND ec.customer_id != duplicates.first_customer_id;

----------Profit by Customer Region---------------------
SELECT 
    customer_region,
    SUM(profit_per_order) AS total_profit
FROM ecommerce_customer
GROUP BY customer_region
ORDER BY total_profit DESC;

----------Profitability by Product Category------------
SELECT 
    category_name,
    SUM(profit_per_order) AS total_profit,
    SUM(sales_per_order) AS total_sales,
    COUNT(order_id) AS total_orders
FROM ecommerce_customer
GROUP BY category_name
ORDER BY total_profit DESC;

-------------Profitability Heatmap by State and Category-------
SELECT 
    customer_state,
    category_name,
    SUM(profit_per_order) AS total_profit
FROM ecommerce_customer
GROUP BY customer_state, category_name
ORDER BY customer_state, total_profit DESC;


------------Yearly Customer Growth---
SELECT 
    YEAR(order_date) AS year, -- Extracts the year from the date
    COUNT(DISTINCT customer_id) AS new_customers -- Counts distinct customers
FROM 
    Ecommerce_Customer
GROUP BY 
    YEAR(order_date) -- Group by year
ORDER BY 
    year;


----------Return on Investment (ROI) by Category-------
SELECT 
    category_name,
    SUM(profit_per_order) AS total_profit,
    SUM(order_item_discount) AS total_discount,
    ROUND((SUM(profit_per_order) - SUM(order_item_discount)) / SUM(order_item_discount) * 100, 2) AS ROI
FROM ecommerce_customer
GROUP BY category_name
ORDER BY ROI DESC;

------------New vs. Returning Customers-------------M
SELECT 
    COUNT(CASE WHEN total_orders = 1 THEN 1 END) AS new_customers,
    COUNT(CASE WHEN total_orders > 1 THEN 1 END) AS returning_customers
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders
    FROM ecommerce_customer
    GROUP BY customer_id
) AS customer_summary;

-------------Customer city-Wise Customer Growth---------
SELECT 
    customer_city,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(sales_per_order) AS total_sales
FROM ecommerce_customer
GROUP BY customer_city
ORDER BY total_customers DESC;

-----------Revenue with and Without discount------
SELECT 
    category_name,
    order_item_discount,
    COUNT(order_id) AS total_orders,
    SUM(sales_per_order) AS total_revenue
FROM 
    Ecommerce_customer
GROUP BY 
    category_name, 
    order_item_discount
ORDER BY 
    category_name, 
    order_item_discount;
	--------------------------------------------------------------------------------------------------------------













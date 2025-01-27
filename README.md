# eCommerce_customer_analysis
Ecommerce Customer SQL QUERIES
A. KPI’s
1. Profitability Heatmap by State and Category
SELECT 
    customer_state,
    category_name,
    SUM(profit_per_order) AS total_profit
FROM ecommerce_customer
GROUP BY customer_state, category_name
ORDER BY customer_state, total_profit DESC;
 
Here result shows total profit on the basis of customer state and category.
2 Profitability Heatmap by State and Category
SELECT 
    customer_state,
    category_name,
    SUM(profit_per_order) AS total_profit
FROM ecommerce_customer
GROUP BY customer_state, category_name
ORDER BY customer_state, total_profit DESC;
 
Profitability on the basis of state and category of customer
3. Yearly Customer Growth
SELECT 
    YEAR(order_date) AS year, -- Extracts the year from the date
    COUNT(DISTINCT customer_id) AS new_customers -- Counts distinct customers
FROM 
    Ecommerce_Customer
GROUP BY 
    YEAR(order_date) -- Group by year
ORDER BY 
    year;

 
Here shows yearly customer growth here are growth of new customer
4. Return on Investment (ROI) by Category
SELECT 
    category_name,
    SUM(profit_per_order) AS total_profit,
    SUM(order_item_discount) AS total_discount,
    ROUND((SUM(profit_per_order) - SUM(order_item_discount)) / SUM(order_item_discount) * 100, 2) AS ROI
FROM ecommerce_customer
GROUP BY category_name
ORDER BY ROI DESC;
 
Here shows roi by product category basis
5. New vs. Returning Customers
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
 
Here shows new and returning(old)customers.
6.Customer city-Wise Customer Growth
SELECT 
    customer_city,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(sales_per_order) AS total_sales
FROM ecommerce_customer
GROUP BY customer_city
ORDER BY total_customers DESC;
 
Here shows city wise customer growth,
7. Revenue with and Without discount
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
 
Here shows revenue with discount of customer

eCommerce Customer Analysis Report
Current Date: January 27, 2025
Overview
This report analyzes customer behavior and profitability within the eCommerce dataset. The analysis focuses on various aspects such as profitability by product category, customer growth trends, and the impact of discounts on revenue.
Key Findings
1.	Profitability by Customer Region
•	The analysis reveals that certain regions generate significantly higher profits. Identifying these regions can help focus marketing efforts and resource allocation.
2.	Profitability by Product Category
•	The product categories have been ranked based on total profit and total sales. This insight allows for better inventory management and promotional strategies tailored to high-performing categories.
3.	Yearly Customer Growth
•	The yearly growth data indicates trends in new customer acquisition over time. Monitoring these trends can help assess the effectiveness of marketing campaigns and customer engagement strategies.
4.	Return on Investment (ROI) by Category
•	ROI calculations show which categories yield the highest returns relative to discounts offered. Understanding this can guide pricing strategies and discount policies.
5.	New vs. Returning Customers
•	The breakdown of new versus returning customers highlights customer loyalty trends. Strategies can be developed to improve retention rates among new customers.
6.	Customer City-Wise Growth
•	Analysis of customer distribution across cities identifies key areas for potential market expansion or targeted marketing efforts.
7.	Revenue with and Without Discount
•	The impact of discounts on total revenue is analyzed, providing insights into how discount strategies affect overall sales performance.
Insights
•	High-Performing Regions: Focus marketing efforts in regions with the highest profitability.
•	Product Focus: Invest in high-profit categories while considering adjustments for underperforming ones.
•	Customer Retention: Develop targeted campaigns aimed at converting new customers into repeat buyers.
•	Discount Strategy: Reassess discount policies to maximize revenue without compromising profit margins.
Recommendations
1.	Optimize Marketing Strategies:
•	Target high-profit regions with tailored marketing campaigns to boost sales.
2.	Focus on High-Profit Categories:
•	Allocate resources towards inventory and promotions for top-performing product categories.
3.	Enhance Customer Retention Programs:
•	Implement loyalty programs or incentives for new customers to encourage repeat purchases.
4.	Review Discount Policies:
•	Analyze the effectiveness of current discount strategies and adjust them to enhance profitability.
5.	Expand Market Presence:
•	Consider expanding operations in cities with significant customer growth potential.
Conclusion
The eCommerce customer analysis provides valuable insights into customer behavior, profitability, and market dynamics. By leveraging these findings, the company can make informed decisions to enhance its marketing strategies, optimize inventory management, and improve overall customer satisfaction. This report is designed to be clear and concise while providing actionable insights based on your eCommerce customer analysis project using SQL queries. If you need further details or specific sections expanded, feel free to ask!



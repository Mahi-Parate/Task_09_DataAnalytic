use online_sale;
CREATE TABLE realistic_e_commerce_sales_data  (
    customer_id INT PRIMARY KEY,
    gender varchar(50),
    region VARCHAR(50),
    age INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(12, 2),
    shipping_fee DECIMAL(10, 2),
    shipping_status varchar(50),
    order_date DATE 
);

select * from realistic_e_commerce_sales_data
1. Monthly total revenue and order count
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM realistic_e_commerce_sales_data
GROUP BY month_year
ORDER BY month_year;

2. Top 5 months by total revenue
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY month_year
ORDER BY total_revenue DESC
LIMIT 5;

3. Monthly order count
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    COUNT(*) AS total_orders
FROM realistic_e_commerce_sales_data
GROUP BY month_year
ORDER BY month_year;

4. Monthly revenue in 2023
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
WHERE YEAR(order_date) = 2023
GROUP BY month_year
ORDER BY month_year;

5. Revenue by region over time
SELECT 
    region,
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY region, month_year
ORDER BY region, month_year;
6. Monthly revenue by gender
SELECT 
    gender,
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY gender, month_year
ORDER BY month_year;
7. Find months with revenue above 100000
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY month_year
HAVING total_revenue > 100000
ORDER BY total_revenue DESC;
8. Average order value per month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) / COUNT(DISTINCT customer_id) AS avg_order_value
FROM realistic_e_commerce_sales_data
GROUP BY month_year
ORDER BY month_year;
9. Monthly shipped vs pending orders
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    shipping_status,
    COUNT(*) AS total_orders
FROM realistic_e_commerce_sales_data
GROUP BY month_year, shipping_status
ORDER BY month_year;
10. Monthly revenue by category
SELECT 
    category,
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY category, month_year
ORDER BY month_year, category;
11. Top 3 products by quantity sold each month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    product_name,
    SUM(quantity) AS total_quantity
FROM realistic_e_commerce_sales_data
GROUP BY month_year, product_name
ORDER BY month_year, total_quantity DESC;
12. Monthly total amount including shipping fee
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price + shipping_fee) AS total_amount
FROM realistic_e_commerce_sales_data
GROUP BY month_year
ORDER BY month_year;
13. Monthly revenue by age group
SELECT 
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    DATE_FORMAT(order_date, '%Y-%m') AS month_year,
    SUM(total_price) AS total_revenue
FROM realistic_e_commerce_sales_data
GROUP BY age_group, month_year
ORDER BY month_year, age_group;
14. Compare current month revenue with previous month
SELECT 
    month_year,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month_year) AS prev_month_revenue
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month_year,
        SUM(total_price) AS total_revenue
    FROM realistic_e_commerce_sales_data
    GROUP BY month_year
) AS subquery
ORDER BY month_year;
15. Monthly revenue growth percentage
SELECT 
    month_year,
    total_revenue,
    prev_month_revenue,
    ROUND(((total_revenue - prev_month_revenue) / prev_month_revenue) * 100, 2) AS growth_percentage
FROM (
    SELECT 
        month_year,
        total_revenue,
        LAG(total_revenue) OVER (ORDER BY month_year) AS prev_month_revenue
    FROM (
        SELECT 
            DATE_FORMAT(order_date, '%Y-%m') AS month_year,
            SUM(total_price) AS total_revenue
        FROM realistic_e_commerce_sales_data
        GROUP BY month_year
    ) AS inner_query
) AS outer_query
WHERE prev_month_revenue IS NOT NULL
ORDER BY month_year;














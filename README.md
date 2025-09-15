# Task_09_DataAnalytic
# Realistic E-Commerce Sales Data Analysis

## Project Overview
This project focuses on performing **Sales Trend Analysis** using real-world e-commerce data. By leveraging SQL aggregation techniques, we analyze how customer purchases change over time, uncover peak sales periods, and explore patterns across customer demographics and product categories.

The dataset used includes information such as customer details, product purchases, order values, shipping details, and transaction dates.


## Tools Used
- **MySQL** as the database engine
- SQL functions such as:
  - `SUM()`, `COUNT()`, `GROUP BY`
  - `EXTRACT()`, `DATE_FORMAT()`
  - `LAG()`, `ROUND()`
- `LOAD DATA LOCAL INFILE` for importing CSV data
- Data visualization can be extended using Python, Tableau, or other tools if required.



## ✅ SQL Queries Included
The following types of analyses are implemented using SQL queries:

1. Monthly total revenue and order count.
2. Top-performing months by revenue.
3. Monthly order trends.
4. Year-specific analysis (e.g., 2023).
5. Regional sales trends.
6. Gender-based purchasing patterns.
7. High-revenue months.
8. Average order value.
9. Shipping status analysis.
10. Category-wise revenue breakdown.
11. Top-selling products by month.
12. Revenue including shipping costs.
13. Age group-based revenue analysis.
14. Comparing revenue with previous months.
15. Monthly growth percentage calculation.

These queries help to uncover patterns, seasonality, customer behavior, and areas for improvement.

##  Key Insights
- Certain months show peak sales, often around promotional periods or holidays.
- Revenue distribution varies by region and customer demographics.
- The shipping process influences customer satisfaction, with some months having more pending orders.
- Product categories and customer age groups display distinct purchasing behaviors.
- Tracking month-over-month growth helps in forecasting and decision-making.

##  How to Run This Project

1. Install MySQL and create the database.
2. Create the table using the provided schema.
3. Import the dataset using the `LOAD DATA LOCAL INFILE` statement.
4. Execute the SQL queries to explore the data.
5. Optionally, export results and create visual dashboards using tools like Python, Power BI, or Tableau.



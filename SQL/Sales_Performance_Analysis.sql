/*
Project: Sales Performance Analysis
Objective:
- Analyze total revenue by product and region
- Identify top-performing products
- Support business decision-making

Assumed Table: sales_data

Columns:
- order_id
- order_date
- product_name
- region
- quantity
- unit_price
*/

-- Step 1: Calculate revenue for each order
WITH sales_revenue AS (
    SELECT
        order_id,
        product_name,
        region,
        quantity,
        unit_price,
        quantity * unit_price AS revenue
    FROM sales_data
)

-- Step 2: Aggregate revenue by product and region
SELECT
    product_name,
    region,
    SUM(revenue) AS total_revenue
FROM sales_revenue
GROUP BY product_name, region
ORDER BY total_revenue DESC;

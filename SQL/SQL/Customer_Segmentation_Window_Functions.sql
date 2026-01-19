/*
Project: Customer Segmentation
Objective:
- Rank customers based on total spending
- Identify high-value customers

Table: orders
Columns:
- customer_id
- order_id
- order_date
- order_amount
*/

-- Step 1: Calculate total spend per customer
WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)

-- Step 2: Rank customers using window function
SELECT
    customer_id,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM customer_spend
ORDER BY spending_rank;

/*
Project: Customers Without Orders
Objective:
- Identify customers who have never placed an order

Tables:
customers (customer_id, customer_name)
orders (order_id, customer_id, order_date, order_amount)
*/

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/* =========================================================
   Task 1.3 – Business Analytics Queries
   Database: fleximart
   ========================================================= */


/* =========================================================
   Query 1: Customer Purchase History
   Business Question:
   Generate a detailed report showing each customer's name,
   email, total number of orders placed, and total amount spent.
   Include only customers who have placed at least 2 orders
   and spent more than ₹5,000.
   ========================================================= */

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
HAVING
    COUNT(DISTINCT o.order_id) >= 2
    AND SUM(o.total_amount) > 5000
ORDER BY
    total_spent DESC;



/* =========================================================
   Query 2: Category-wise Sales Performance
   Business Question:
   For each product category, show the category name,
   number of different products sold, total quantity sold,
   and total revenue generated.
   Include only categories with revenue > ₹10,000.
   ========================================================= */

SELECT
    p.category AS category,
    COUNT(DISTINCT p.product_id) AS num_products,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.category
HAVING
    SUM(oi.subtotal) > 10000
ORDER BY
    total_revenue DESC;



/* =========================================================
   Query 3: Monthly Sales Trends for 2024
   Business Question:
   Show monthly sales trends for the year 2024, including
   total orders, monthly revenue, and cumulative revenue.
   ========================================================= */

SELECT
    TO_CHAR(order_month, 'Month') AS month_name,
    total_orders,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY order_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM (
    SELECT
        DATE_TRUNC('month', order_date) AS order_month,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE EXTRACT(YEAR FROM order_date) = 2024
    GROUP BY DATE_TRUNC('month', order_date)
) monthly_summary
ORDER BY
    order_month;

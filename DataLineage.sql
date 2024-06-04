-- Scenario:
-- Let's say we have two tables:
-- orders: Contains customer order information (order ID, customer ID, order date, etc.)
-- payments: Records payment details for orders (payment ID, order ID, amount, payment method, etc.)
-- We want to track how data from the orders table flows into the payments table, specifically calculating the total payment amount per order.
-- SQL Code:
-- Create a view to capture the transformation
CREATE OR REPLACE VIEW payment_summary AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    SUM(p.amount) AS total_payment
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.order_id, o.customer_id, o.order_date;

-- Query the view to see the results
SELECT *
FROM payment_summary;

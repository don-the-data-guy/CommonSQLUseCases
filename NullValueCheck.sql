-- This query checks for null values in specified columns of a table, 
-- calculates the percentage of nulls, and alerts if it exceeds a defined threshold (e.g., 10%). 
-- This helps identify potential data completeness issues.
SELECT
    table_name,
    column_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN column_name IS NULL THEN 1 ELSE 0 END) AS null_count,
    (SUM(CASE WHEN column_name IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS null_percentage
FROM information_schema.columns
WHERE table_name = 'your_table_name'  -- Replace with your table name
GROUP BY table_name, column_name
HAVING null_percentage > 10; -- Alert if null percentage exceeds 10%

-- ================================
--  ONLINE SALES — CLEANING & EDA
-- ================================

-- --------------------------------
-- STEP 1: Check table structure
-- --------------------------------
PRAGMA table_info(online_sales);

-- --------------------------------
-- STEP 2: Fix column names (if needed)
-- --------------------------------
ALTER TABLE online_sales RENAME COLUMN "Order ID" TO order_id;
ALTER TABLE online_sales RENAME COLUMN "Order Date" TO order_date;
ALTER TABLE online_sales RENAME COLUMN "Product ID" TO product_id;

-- --------------------------------
-- STEP 3: Convert DD-MM-YYYY → YYYY-MM-DD
-- Example: 11-08-2016 → 2016-08-11
-- --------------------------------
UPDATE online_sales
SET order_date = 
    substr(order_date, 7, 4) || '-' || 
    substr(order_date, 4, 2) || '-' || 
    substr(order_date, 1, 2)
WHERE order_date LIKE '__-__-____';

-- --------------------------------
-- STEP 4: Convert MM/DD/YYYY → YYYY-MM-DD
-- Example: 06/12/2016 → 2016-06-12
-- --------------------------------
UPDATE online_sales
SET order_date = 
    substr(order_date, instr(order_date, '/') + 1, 2) || '-' ||
    substr(order_date, 1, instr(order_date, '/') - 1) || '-' ||
    substr(order_date, length(order_date) - 3, 4)
WHERE order_date LIKE '%/%';

-- --------------------------------
-- STEP 5: Validate clean dates
-- --------------------------------
SELECT
    order_date,
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month
FROM online_sales
LIMIT 5;

-- --------------------------------
-- STEP 6: Extract YEAR + MONTH
-- --------------------------------
SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month
FROM online_sales
LIMIT 5;

-- --------------------------------
-- STEP 7: Monthly Revenue + Order Volume
-- --------------------------------
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

-- --------------------------------
-- STEP 8: Filter by year (example: 2015 only)
-- --------------------------------
SELECT 
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE strftime('%Y', order_date) = '2015'
GROUP BY year, month
ORDER BY month;

-- --------------------------------
-- STEP 9: Top 5 Highest Revenue Months
-- --------------------------------
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(amount) AS revenue
FROM online_sales
GROUP BY month
ORDER BY revenue DESC
LIMIT 5;

-- ================================
-- END OF SCRIPT
-- ================================

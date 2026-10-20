-- Customer Order Count — OnlineRetail dataset
-- Data Analytics Internship task
--
-- Dataset columns (from OnlineRetail.csv):
-- InvoiceNo, StockCode, Description, Quantity, InvoiceDate,
-- UnitPrice, CustomerID, Country
--
-- Assumption: the CSV has been imported into a SQL table named online_retail.
-- If your table has a different name, replace online_retail below.
--
-- Notes:
-- * One invoice can contain many product rows. Use COUNT(DISTINCT InvoiceNo).
-- * CustomerID can be NULL; queries for customer-level results exclude NULL IDs.
-- * In this dataset, invoices beginning with 'C' are cancellations. The main
--   order-count queries exclude them. Remove the cancellation condition if your
--   instructor wants all invoice numbers counted, including cancellations.


-- Query 1: Count completed orders per customer
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM online_retail
WHERE CustomerID IS NOT NULL
  AND CAST(InvoiceNo AS TEXT) NOT LIKE 'C%'
GROUP BY CustomerID
ORDER BY order_count DESC, CustomerID;


-- Query 2: Top 10 customers by completed order count
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM online_retail
WHERE CustomerID IS NOT NULL
  AND CAST(InvoiceNo AS TEXT) NOT LIKE 'C%'
GROUP BY CustomerID
ORDER BY order_count DESC, CustomerID
LIMIT 10;


-- Query 3: Top customers including all ties at the 10th rank
-- This may return more than 10 customers if there is a tie at the cutoff.
WITH customer_orders AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS order_count
    FROM online_retail
    WHERE CustomerID IS NOT NULL
      AND CAST(InvoiceNo AS TEXT) NOT LIKE 'C%'
    GROUP BY CustomerID
),
ranked AS (
    SELECT
        CustomerID,
        order_count,
        DENSE_RANK() OVER (ORDER BY order_count DESC) AS order_rank
    FROM customer_orders
)
SELECT CustomerID, order_count, order_rank
FROM ranked
WHERE order_rank <= 10
ORDER BY order_count DESC, CustomerID;


-- Query 4: Total number of distinct customers with a known CustomerID
SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retail
WHERE CustomerID IS NOT NULL;


-- Query 5: Total distinct completed invoices in the dataset
SELECT COUNT(DISTINCT InvoiceNo) AS total_completed_invoices
FROM online_retail
WHERE CAST(InvoiceNo AS TEXT) NOT LIKE 'C%';


-- Query 6: Check whether any customers share the highest order count
WITH customer_orders AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS order_count
    FROM online_retail
    WHERE CustomerID IS NOT NULL
      AND CAST(InvoiceNo AS TEXT) NOT LIKE 'C%'
    GROUP BY CustomerID
),
ranked AS (
    SELECT
        CustomerID,
        order_count,
        DENSE_RANK() OVER (ORDER BY order_count DESC) AS order_rank
    FROM customer_orders
)
SELECT CustomerID, order_count
FROM ranked
WHERE order_rank = 1
ORDER BY CustomerID;


-- Optional Query 7: Count orders by customer and country
SELECT
    CustomerID,
    Country,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM online_retail
WHERE CustomerID IS NOT NULL
  AND CAST(InvoiceNo AS TEXT) NOT LIKE 'C%'
GROUP BY CustomerID, Country
ORDER BY order_count DESC, CustomerID;

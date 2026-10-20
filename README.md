# Customer Order Count Analysis Using SQL

## 📌 Project Overview

This project analyzes the **Online Retail dataset** to count orders placed by each customer and identify frequent buyers. SQL queries are used to aggregate customer order activity, rank customers by order count, and understand basic purchasing behavior.

This project was completed as part of my Data Analytics Internship at **Veda Technologies**.

## 🎯 Objectives

- Count the number of distinct orders placed by each customer.
- Identify the top 10 customers based on order frequency.
- Avoid overcounting orders caused by multiple product lines in the same invoice.
- Identify customers with the highest order counts.
- Understand customer purchasing behavior through SQL analysis.

## 🛠️ Tools and Technologies

- **SQL** — Data querying and aggregation
- **Online Retail Dataset** — Transactional retail data
- **SQL Database** — To store and query the imported CSV data

## 📂 Dataset Description

The project uses the `OnlineRetail.csv` dataset, which contains retail transaction records.

### Important columns

| Column | Description |
|---|---|
| `InvoiceNo` | Invoice or transaction identifier |
| `StockCode` | Product identifier |
| `Description` | Product description |
| `Quantity` | Number of units purchased |
| `InvoiceDate` | Date and time of the transaction |
| `UnitPrice` | Price per unit |
| `CustomerID` | Customer identifier |
| `Country` | Country associated with the transaction |

## 🔍 Methodology

1. Imported the CSV dataset into a SQL database.
2. Examined the transaction and customer identifier columns.
3. Used `COUNT(DISTINCT InvoiceNo)` to count unique invoices per customer.
4. Grouped records by `CustomerID` to calculate order counts.
5. Sorted customers by order count in descending order.
6. Identified the top 10 frequent buyers.
7. Explored ranking ties and overall customer and invoice counts.

## 💻 SQL Concepts Used

- `SELECT` — Select required columns.
- `COUNT()` — Count records or identifiers.
- `COUNT(DISTINCT ...)` — Count unique invoices or customers.
- `GROUP BY` — Aggregate records by customer.
- `ORDER BY` — Rank customers by order frequency.
- `LIMIT` — Return the top 10 customers.
- Common Table Expressions (CTEs) and window functions — Analyze ranking ties.

## ⚠️ Data Cleaning and Counting Considerations

A single invoice may contain multiple product rows. Therefore, counting rows directly can overestimate the number of orders.

This project uses `COUNT(DISTINCT InvoiceNo)` to count each invoice only once per customer.

Invoice numbers beginning with `C` are treated as cancellations in this dataset and are excluded from the completed-order queries. This is an analytical choice; the results may differ if cancellations are included.

Rows with missing `CustomerID` values are excluded from customer-level analysis because they cannot be assigned reliably to a known customer.

## 📊 Expected Deliverables

- Customer order-count table.
- Top 10 frequent customers.
- Queries for total distinct customers and completed invoices.
- Analysis of ties among highly frequent buyers.
- SQL source file: `Customer_Order_Count_OnlineRetail.sql`.

## 💡 Key Learning Outcomes

- Counting distinct transactions accurately.
- Grouping transaction records by customer.
- Ranking customers using SQL.
- Handling duplicate invoice lines and cancellation records.
- Understanding the difference between customer count and order count.

## 📝 Conclusion

This project demonstrates how SQL can turn transactional retail data into useful customer-level insights. Counting distinct invoices helps identify frequent buyers without double-counting orders that contain multiple products.

The resulting analysis can support further customer segmentation and purchasing-behavior studies.

---

**Internship:** Data Analytics Internship  
**Organization:** Veda Technologies  
**Project:** Customer Order Count  
**Dataset:** Online Retail

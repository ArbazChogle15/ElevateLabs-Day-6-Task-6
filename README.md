📊 Task 6: Sales Trend Analysis Using Aggregations
Course / Internship Task — SQLite
This task focuses on analyzing monthly revenue and order volume using SQL aggregation functions.The dataset used contains online sales data including order dates, order IDs, amounts, and product IDs.

🗂️ Dataset
Table: online_salesColumns used:
•	order_id
•	order_date
•	amount
•	product_id
The dataset includes mixed date formats, requiring cleaning before analysis.

🧹 Step 1: Data Cleaning
To ensure consistent analysis, all dates were converted to the standard format:
YYYY-MM-DD (ISO format)
Two types of formats were identified and transformed:
•	DD-MM-YYYY → YYYY-MM-DD
•	MM/DD/YYYY → YYYY-MM-DD
Column names containing spaces were also renamed using ALTER TABLE for SQLite compatibility.

📅 Step 2: Extracting Year & Month
SQLite does not support EXTRACT(),so date components were extracted using:
strftime('%Y', order_date)  -- Year
strftime('%m', order_date)  -- Month

📈 Step 3: Monthly Revenue & Order Volume
The main objective of the task was achieved by using:
•	SUM(amount) → Total monthly revenue
•	COUNT(DISTINCT order_id) → Monthly order volume
•	GROUP BY year, month to aggregate results
•	Ordered chronologically using ORDER BY

🎯 Step 4: Filtering & Insights
Additional queries include:
•	Filtering results for a specific year
•	Identifying Top 5 highest revenue months
These help uncover trends and gain deeper insights into sales performance.

🧠 Outcome
By completing this task, you learned how to:
•	Clean and standardize date fields
•	Extract time-based features
•	Use aggregation functions (SUM, COUNT)
•	Group data by year/month
•	Analyze sales trends over time
•	Generate insights from real-world datasets
This analysis prepares you for time-series reporting, dashboards, and BI-style data work.


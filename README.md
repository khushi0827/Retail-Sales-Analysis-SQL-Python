# Retail Sales Analysis using Python & SQL

## 📌 Project Overview

This project analyzes retail sales data using **Python (Pandas)** and **MySQL** to identify sales trends, top-performing products, regional performance, and growth patterns.

The project follows a complete data analytics workflow:

**Data Cleaning → Feature Engineering → SQL Analysis → Business Insights**

---

## 🛠️ Tools & Technologies

* Python
* Pandas
* Jupyter Notebook
* MySQL
* MySQL Workbench
* SQL
* CTEs
* Window Functions
* CASE Statements
* Aggregations

---

## 📂 Project Structure

```text
Retail-Sales-Analysis-SQL-Python/
│

│   └── RetailSales.csv
│

│   └── Retail Sales(Data Cleaning).ipynb

│   └── retailsales.sql
│

│   └── sql_results.png
│
└── README.md
```

---

## 🧹 Data Cleaning & Preparation

The dataset was cleaned and prepared using Pandas.

Key steps included:

* Handling missing/unknown values
* Standardizing column names
* Converting column names to lowercase
* Replacing spaces with underscores
* Creating new calculated columns
* Converting date fields to datetime format
* Removing unnecessary columns
* Exporting the cleaned dataset for SQL analysis

### Feature Engineering

Three new business metrics were created:

* `discount`
* `sale_price`
* `profit`

### Formula

```text
Discount = List Price × Discount Percentage

Sale Price = List Price − Discount

Profit = Sale Price − Cost Price
```

---

## 📊 SQL Analysis

The cleaned data was imported into MySQL and analyzed using SQL.

### 1. Top 10 Highest Revenue Products

Identified the top 10 products based on total sales revenue.

```sql
SELECT 
    product_id,
    SUM(sale_price) AS sales
FROM retailsales
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;
```

---

### 2. Top 5 Products in Each Region

Used a CTE and `ROW_NUMBER()` window function to identify the top 5 products within every region.

This demonstrates the use of:

* CTE
* `ROW_NUMBER()`
* `PARTITION BY`
* Ranking

---

### 3. Monthly Sales Comparison: 2022 vs 2023

Compared monthly sales performance between 2022 and 2023 using conditional aggregation.

The analysis helps identify months with higher or lower sales performance year-over-year.

---

### 4. Highest Sales Month by Category

Identified the month in which each product category generated its highest sales using:

* CTE
* `ROW_NUMBER()`
* `PARTITION BY`

---

### 5. Sub-Category Growth Analysis

Compared 2022 and 2023 sales at the sub-category level to identify sub-categories showing the highest increase in sales.

---

## 💡 Key Business Questions

The project answers questions such as:

* Which products generate the highest revenue?
* What are the top-performing products in each region?
* How did monthly sales change between 2022 and 2023?
* Which month generated the highest sales for each category?
* Which sub-categories experienced the highest sales growth?

---

## 📈 Skills Demonstrated

### Python / Pandas

* Data cleaning
* Missing value handling
* Feature engineering
* Data transformation
* CSV export

### SQL

* `GROUP BY`
* `ORDER BY`
* `CASE WHEN`
* CTEs
* Aggregate functions
* Window functions
* `ROW_NUMBER()`
* `PARTITION BY`
* Date functions

---

## 🎯 Project Outcome

This project demonstrates an end-to-end data analytics workflow where raw retail data is cleaned using Python and transformed into actionable business insights using SQL.

It showcases practical skills required for **Data Analyst / Junior Data Analyst** roles.

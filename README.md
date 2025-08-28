📦 Zepto Ecommerce Database & SQL Analysis
📌 Project Overview

This project models a simplified version of Zepto’s ecommerce system using PostgreSQL.
It includes a relational database schema for products, pricing, discounts, stock, and availability.
The project demonstrates SQL skills in data modeling, querying, and analysis.

🗂️ Database Schema

The main table in this project is zepto, with the following fields:

product_id → Unique identifier (Primary Key)

category → Product category

name → Product name

mrp → Maximum Retail Price

discountPercent → Discount applied

availableQuantity → Available stock

discountedSellingPrice → Price after discount

weightInGms → Weight of product

outOfStock → Boolean flag for availability

quantity → Quantity in cart/order

⚡ Features / Queries Implemented

✅ List all products by category

✅ Find top discounted products

✅ Calculate total inventory value

✅ Identify out-of-stock products

✅ Compare MRP vs. discounted selling price

✅ Analyze discounts & margins

📊 Example SQL Queries

1. Check if a table exists:

SELECT EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'public'
      AND table_name = 'zepto'
);


2. Get all available products:

SELECT name, discountedSellingPrice, availableQuantity
FROM zepto
WHERE outOfStock = FALSE;


3. Calculate total stock value:

SELECT SUM(discountedSellingPrice * availableQuantity) AS total_stock_value
FROM zepto;

🚀 How to Run

Clone the repo:

git clone https://github.com/yourusername/zepto-sql-project.git
cd zepto-sql-project


Create the database and table using the provided SQL script.

Load the dataset using COPY or INSERT.

Run the queries from queries.sql.

📌 Future Improvements

Add multiple tables (orders, customers, transactions).

Create views for sales and discount analysis.

Write stored procedures for automated reporting.

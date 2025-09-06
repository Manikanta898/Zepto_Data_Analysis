# Zepto E-Commerce Data Analysis through SQL
This project focuses on performing **data exploration**, **cleaning**, and **analysis** using SQL on a dataset simulating product listings from Zepto, a quick commerce platform. The goal is to derive meaningful business insights from the data to help with inventory, pricing, and sales decisions.

## Data Sources
The Zepto data used in this project was sourced from [Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv).

## File Descriptions
- Zepto_Data_Analysis.sql : SQL script containing the exploratory data analysis.
- zepto_v2.csv : CSV file containing the raw and processed dataset.

## Project Workflow

### Data Exploration
- View dataset overview
- Count total and unique values
- Identify missing/null data
- Explore category and stock distributions
- Analyze discount patterns

### Data Cleaning
- Remove invalid records (e.g., products with MRP = 0)
- Convert prices from paise to rupees for consistency

### Data Analysis
- Top discounted products
- Out-of-stock products with high MRP
- Estimated revenue by category
- Products with low discount but high MRP
- Best value products (price per gram)
- Inventory categorization (Low, Medium, Bulk)
- Total inventory weight per category

## Business Insights

- Categories offering the **highest average discount**
- **Top 10 products** by discount percentage
- Inventory distribution by weight segments (Low, Medium, Bulk)
- **Estimated revenue** generation per category
- Price optimization opportunities by analyzing **MRP vs. discount**

## Technologies Used

- SQL (PostgreSQL)
- pgAdmin

## Getting Started

1. Clone the repository
2. Use pgAdmin or any PostgreSQL-compatible SQL client
3. Create the `zepto` table using the provided schema
4. Insert your dataset (or use mock data)
5. Run the queries in the provided order for full analysis

-- Create the table

CREATE TABLE zepto (
    product_id SERIAL PRIMARY KEY,
    category VARCHAR(100),
    name VARCHAR(100) NOT NULL, 
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);


-- Data Exploration

-- View First Few Rows
SELECT * FROM zepto LIMIT 5;

-- Total Rows and Columns
SELECT COUNT(*) AS total_rows FROM zepto;

-- Columns in table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'zepto';

-- Missing/Null Values Count for Each Column
SELECT 'product_id' AS column_name, COUNT(product_id) AS not_null_count FROM zepto
UNION ALL
SELECT 'category', COUNT(category) FROM zepto
UNION ALL
SELECT 'name', COUNT(name) FROM zepto
UNION ALL
SELECT 'mrp', COUNT(mrp) FROM zepto
UNION ALL
SELECT 'discountpercent', COUNT(discountpercent) FROM zepto
UNION ALL
SELECT 'availablequantity', COUNT(availablequantity) FROM zepto
UNION ALL
SELECT 'discountedsellingprice', COUNT(discountedsellingprice) FROM zepto
UNION ALL
SELECT 'weightingms', COUNT(weightingms) FROM zepto
UNION ALL
SELECT 'outofstock', COUNT(outofstock) FROM zepto
UNION ALL
SELECT 'quantity', COUNT(quantity) FROM zepto;


-- Count Unique Values Per Column
SELECT 
    (SELECT COUNT(DISTINCT product_id) FROM zepto) AS unique_product_id,
    (SELECT COUNT(DISTINCT category) FROM zepto) AS unique_categories,
    (SELECT COUNT(DISTINCT name) FROM zepto) AS unique_names,
    (SELECT COUNT(DISTINCT mrp) FROM zepto) AS unique_mrp,
    (SELECT COUNT(DISTINCT discountpercent) FROM zepto) AS unique_discountpercent,
    (SELECT COUNT(DISTINCT availablequantity) FROM zepto) AS unique_availablequantity,
    (SELECT COUNT(DISTINCT discountedsellingprice) FROM zepto) AS unique_discounted_price,
    (SELECT COUNT(DISTINCT weightingms) FROM zepto) AS unique_weightingms,
    (SELECT COUNT(DISTINCT outofstock) FROM zepto) AS unique_outofstock,
    (SELECT COUNT(DISTINCT quantity) FROM zepto) AS unique_quantity;

-- Distribution of Categories
SELECT category, COUNT(*) AS listing_count
FROM zepto
GROUP BY category
ORDER BY listing_count ASC;

-- Distribution of 'outofstock'
SELECT outofstock, COUNT(*) AS count
FROM zepto
GROUP BY outofstock;

-- Listings with 0 Discount
SELECT COUNT(*) AS no_discount_items
FROM zepto
WHERE discountpercent = 0;

-- Listings with Discount
SELECT COUNT(*) AS discounted_items
FROM zepto
WHERE discountpercent > 0;


-- Data Cleaning

-- Products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;


-- Data analysis

-- Top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Grouping the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;


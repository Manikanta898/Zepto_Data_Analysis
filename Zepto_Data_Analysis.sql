-- Create the table
-- CREATE TABLE zepto (
--     product_id SERIAL PRIMARY KEY,
--     category VARCHAR(100),
--     name VARCHAR(100) NOT NULL, 
--     mrp NUMERIC(8,2),
--     discountPercent NUMERIC(5,2),
--     availableQuantity INTEGER,
--     discountedSellingPrice NUMERIC(8,2),
--     weightInGms INTEGER,
--     outOfStock BOOLEAN,
--     quantity INTEGER
-- );


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
ORDER BY listing_count ASC

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





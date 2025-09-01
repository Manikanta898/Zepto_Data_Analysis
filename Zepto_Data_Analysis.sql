select * from zepto
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


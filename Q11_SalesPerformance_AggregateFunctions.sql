CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    region VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1, 'Laptop', 'North', 2, 55000),
(2, 'Mobile', 'South', 3, 25000),
(3, 'Keyboard', 'East', 5, 1500),
(4, 'Mouse', 'West', 4, 700),
(5, 'Monitor', 'North', 2, 12000),
(6, 'Printer', 'South', 1, 8500),
(7, 'Tablet', 'East', 3, 18000),
(8, 'Speaker', 'West', 6, 3000),
(9, 'Laptop', 'South', 1, 56000),
(10, 'Mobile', 'North', 2, 24000),
(11, 'Keyboard', 'West', 10, 1400),
(12, 'Monitor', 'East', 1, 12500),
(13, 'Printer', 'North', 2, 9000),
(14, 'Tablet', 'South', 2, 17500),
(15, 'Speaker', 'East', 5, 3200);

SELECT * FROM Sales;

SELECT
    product_name,
    SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name;

SELECT
    region,
    AVG(quantity * price) AS average_sales
FROM Sales
GROUP BY region;

SELECT
    MAX(quantity * price) AS highest_sales,
    MIN(quantity * price) AS lowest_sales
FROM Sales;

SELECT
    product_name,
    region,
    SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name, region;

SELECT
    product_name,
    SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name
HAVING SUM(quantity * price) > 5000;

SELECT
    region,
    AVG(quantity * price) AS average_sales
FROM Sales
GROUP BY region
HAVING AVG(quantity * price) < 1000;

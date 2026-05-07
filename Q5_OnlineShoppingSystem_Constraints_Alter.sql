CREATE DATABASE OnlineShoppingSystem;

USE OnlineShoppingSystem;

CREATE TABLE Customer (
    c_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phno BIGINT,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Product (
    p_id INT PRIMARY KEY,
    pname VARCHAR(100) NOT NULL,
    c_id INT,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    qty INT CHECK (qty >= 1),

    FOREIGN KEY (c_id)
    REFERENCES Customer(c_id)
    ON DELETE CASCADE
);

DESC Customer;

DESC Product;

INSERT INTO Customer VALUES
(1, 'Amit Sharma', 'Pune', 9876543210, 'amit@gmail.com'),
(2, 'Priya Patil', 'Mumbai', 9876543211, 'priya@gmail.com'),
(3, 'Rahul Verma', 'Delhi', 9876543212, 'rahul@gmail.com'),
(4, 'Sneha Joshi', 'Nagpur', 9876543213, 'sneha@gmail.com'),
(5, 'Karan Mehta', 'Nashik', 9876543214, 'karan@gmail.com'),
(6, 'Neha Singh', 'Chennai', 9876543215, 'neha@gmail.com'),
(7, 'Rohit Das', 'Kolkata', 9876543216, 'rohit@gmail.com'),
(8, 'Pooja Nair', 'Kerala', 9876543217, 'pooja@gmail.com');

INSERT INTO Product VALUES
(101, 'Laptop', 1, 55000, 2),
(102, 'Mobile', 2, 25000, 3),
(103, 'Keyboard', 3, 1500, 5),
(104, 'Mouse', 4, 700, 4),
(105, 'Monitor', 5, 12000, 2),
(106, 'Printer', 6, 8500, 1),
(107, 'Tablet', 7, 18000, 3),
(108, 'Speaker', 8, 3000, 6);

SELECT * FROM Customer;

SELECT * FROM Product;

ALTER TABLE Customer
ADD age INT;

DESC Customer;

RENAME TABLE Product TO ProductDetails;

SELECT * FROM ProductDetails;

INSERT INTO Customer VALUES
(1, 'Test User', 'Pune', 9999999999, 'test@gmail.com', 25);

INSERT INTO Customer VALUES
(9, NULL, 'Mumbai', 9999999998, 'null@gmail.com', 30);

INSERT INTO Customer VALUES
(10, 'Same Email', 'Delhi', 9999999997, 'amit@gmail.com', 28);

INSERT INTO ProductDetails VALUES
(109, 'Invalid Product', 1, -500, 2);

INSERT INTO ProductDetails VALUES
(110, 'Invalid Quantity', 2, 2000, 0);

INSERT INTO ProductDetails VALUES
(111, 'Unknown Customer', 50, 5000, 2);

DELETE FROM Customer
WHERE c_id = 1;

SELECT * FROM Customer;

SELECT * FROM ProductDetails;

TRUNCATE TABLE ProductDetails;

SELECT * FROM ProductDetails;

DROP TABLE ProductDetails;

DROP TABLE Customer;

DROP DATABASE OnlineShoppingSystem;

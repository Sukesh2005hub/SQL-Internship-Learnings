CREATE DATABASE OBMS_DB;
USE OBMS_DB;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT,
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details1 (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', '9876543210', 'Bengaluru'),
(2, 'Priya Nair', '9812345678', 'Chennai'),
(3, 'Rohan Mehta', '9898989898', 'Mumbai'),
(4, 'Sneha Reddy', '9701234567', 'Hyderabad'),
(5, 'Kiran Patel', '9611122233', 'Pune');

INSERT INTO products VALUES
(1, 'Silk Saree',    2500, 15),
(2, 'Kurti Set',     1200, 8),
(3, 'Lehenga',       4500, 5),
(4, 'Cotton Dupatta', 400, 25),
(5, 'Palazzo Pants',  900, 3);

INSERT INTO orders VALUES
(101, 1, '2024-01-10'),
(102, 2, '2024-01-12'),
(103, 3, '2024-01-15'),
(104, 1, '2024-01-18'),
(105, 4, '2024-01-20');

INSERT INTO order_details VALUES
(101, 1, 2),
(102, 3, 1),
(103, 2, 3),
(104, 4, 5),
(105, 5, 2);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;


UPDATE products
SET price = 2800
WHERE product_id = 1;

SELECT * FROM products WHERE product_id = 1;

DELETE FROM customers
WHERE customer_id = 5;

SELECT 
    o.order_id,
    c.name AS customer_name,
    c.city,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT 
    product_id,
    product_name,
    price,
    stock
FROM products
WHERE stock < 10;

SELECT 
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT 
    SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;

SELECT 
    p.product_name,
    SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;

SELECT 
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 1;


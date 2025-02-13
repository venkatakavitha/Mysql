create database people;
show databases;
USE `people`;
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

select *from Products;

INSERT INTO Products (name, price) VALUES
('Product A', 10.00),
('Product B', 20.00),
('Product C', 15.00),
('Product D', 5.00),
('Product E', 25.00);

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

select *from Sales ;
INSERT INTO Sales (product_id, quantity_sold, sale_date) VALUES
(1, 100, '2025-02-10'),
(2, 200, '2025-02-10'),
(3, 150, '2025-02-10'),
(4, 50, '2025-02-10'),
(5, 250, '2025-02-10'),
(1, 300, '2025-02-12'),
(2, 500, '2025-02-12'),
(3, 100, '2025-02-12');

SELECT p.name AS product_name, 
       SUM(s.quantity_sold) AS total_quantity_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC
LIMIT 5;


SELECT p.name AS product_name, 
       SUM(s.quantity_sold) AS AmountSold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id
ORDER BY AmountSold DESC
LIMIT 5;

SELECT p.product_id, p.name AS product_name, SUM(s.quantity_sold) AS total_quantity_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_id
HAVING SUM(s.quantity_sold) > 100  
ORDER BY total_quantity_sold DESC;





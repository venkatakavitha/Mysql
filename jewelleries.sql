create database jewelleries;
show databases;
use `jewelleries`;

CREATE TABLE products (
    productid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) ,
    description TEXT,
    price DECIMAL(10, 2) ,
    imageurl VARCHAR(255) ,
    category VARCHAR(100)
);

select * from products;
INSERT INTO products (productid,name, description, price, imageurl, category)
VALUES
    (1,'Wireless Mouse', 'Ergonomic wireless mouse with smooth scrolling', 25.99, 'https://example.com/images/mouse.jpg', 'Electronics'),
    (2,'Bluetooth Headphones', 'Over-ear Bluetooth headphones with noise-cancellation', 79.99, 'https://example.com/images/headphones.jpg', 'Electronics'),
    (3,'Coffee Maker', '12-cup programmable coffee maker with auto shut-off feature', 49.99, 'https://example.com/images/coffeemaker.jpg', 'Home Appliances'),
    (4,'Leather Wallet', 'Genuine leather wallet with multiple card slots', 35.50, 'https://example.com/images/wallet.jpg', 'Fashion'),
    (5,'Smartphone Stand', 'Adjustable smartphone stand for desk use', 15.75, 'https://example.com/images/stand.jpg', 'Accessories');
    
    CREATE TABLE categories	 (
    categoryid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);
select * from categories;
INSERT INTO categories (categoryid,name)
VALUES
    (1,'Electronics'),
    (2,'Home Appliances'),
    (3,'Fashion'),
    (4,'Accessories'),
    (5,'Sports & Outdoors');
    
 CREATE TABLE customers (
    customersid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) ,
    email VARCHAR(255) ,
    phone VARCHAR(20),
    address TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from customers;
    
    INSERT INTO customers (customerid,name, email, phone, address)
VALUES
    (1,'John Doe', 'johndoe@example.com', '555-1234', '123 Main St, Springfield, IL'),
    (2,'Jane Smith', 'janesmith@example.com', '555-5678', '456 Oak Ave, Springfield, IL'),
    (3,'Alice Johnson', 'alice.johnson@example.com', '555-8765', '789 Pine Rd, Lincoln, NE'),
    (4,'Bob Brown', 'bobbrown@example.com', '555-4321', '101 Maple Dr, Chicago, IL'),
    (5,'Charlie Davis', 'charliedavis@example.com', '555-6789', '202 Cedar Blvd, Naperville, IL');
    
CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    customersid INT,
    totalprice DECIMAL(10, 2) ,
    orderdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending'
);
select * from orders;
INSERT INTO orders (customersid, totalprice, status)
VALUES
    (1, 99.99, 'Completed'),
    (2, 49.50, 'Pending'),
    (3, 120.75, 'Shipped'),
    (4, 89.99, 'Completed'),
    (5, 45.30, 'Pending');

CREATE TABLE blogposts (
    postid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) ,
    content TEXT ,
    author VARCHAR(255),
    postdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from blogposts;
INSERT INTO blogposts (title, content, author)
VALUES
    ('The Future of Technology', 'In this post, we explore the exciting developments in artificial intelligence and how they will shape our future.', 'John Doe'),
    ('Healthy Living Tips', 'Discover practical tips for maintaining a healthy lifestyle, including exercise routines and diet suggestions.', 'Jane Smith'),
    ('Exploring the World of Travel', 'Travel opens up new experiences and perspectives. Here, we look at some of the most stunning destinations around the world.', 'Alice Johnson'),
    ('Mastering the Art of Cooking', 'Learn the secrets of cooking delicious meals with simple, everyday ingredients.', 'Bob Brown'),
    ('Building a Successful Career', 'A guide to career growth, networking, and achieving professional success in the modern job market.', 'Charlie Davis');

CREATE TABLE discounts (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255),
    percentage_off DECIMAL(5, 2),
    valid_from DATE,
    valid_to DATE
);
select * from discounts;
INSERT INTO discounts (discount_id,description, percentage_off, valid_from, valid_to)
VALUES 
(1,'Summer Sale', 20.00, '2025-06-01', '2025-06-30'),
(2,'Black Friday Deal', 50.00, '2025-11-27', '2025-11-27'),
(3,'Christmas Discount', 15.00, '2025-12-01', '2025-12-25'),
(4,'New Year Offer', 10.00, '2025-12-31', '2026-01-05'),
(5,'Flash Sale', 30.00, '2025-03-10', '2025-03-12');

CREATE TABLE sociallinks (
    linkid INT PRIMARY KEY AUTO_INCREMENT,
    platform VARCHAR(100) ,
    url VARCHAR(255) 
);
select * from sociallinks;
INSERT INTO sociallinks (platform, url)
VALUES
('Facebook', 'https://www.facebook.com/example'),
('Twitter', 'https://www.twitter.com/example'),
('Instagram', 'https://www.instagram.com/example'),
('LinkedIn', 'https://www.linkedin.com/in/example'),
('YouTube', 'https://www.youtube.com/c/example');

CREATE TABLE contactus (
    contactid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    submittedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from contactus;
INSERT INTO contactus (name, email, message)
VALUES 
('John Doe', 'johndoe@example.com', 'I am interested in learning more about your products. Can you provide more information?'),
('Jane Smith', 'janesmith@example.com', 'I have a question about the shipping process. Could you please clarify?'),
('Alice Johnson', 'alicej@example.com', 'I would like to inquire about a bulk order discount. Please get back to me with the details.'),
('Bob Brown', 'bobbrown@example.com', 'I encountered an issue during checkout and would appreciate assistance.'),
('Charlie Davis', 'charliedavis@example.com', 'I would love to join your affiliate program. Let me know how to get started.');

CREATE TABLE newslettersubscribers (
    subscriberid INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255), 
    subscribedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from newslettersubscribers;
INSERT INTO newslettersubscribers (subscriberid,email, subscribedat)
VALUES 
(1,'example4@email.com', '2025-03-07 10:00:00'),
(2,'example5@email.com', '2025-03-07 11:15:00'),
(3,'example6@email.com', '2025-03-07 12:30:00'),
(4,'example7@email.com', '2025-03-07 13:45:00'),
(5,'example8@email.com', '2025-03-07 14:00:00');

CREATE TABLE orderitems (
    orderitemid INT PRIMARY KEY AUTO_INCREMENT,
    orderid INT,
    productid INT,
    quantity INT DEFAULT 1,
    price DECIMAL(10, 2) ,
    FOREIGN KEY (orderid) REFERENCES orders(orderid),
    FOREIGN KEY (productid) REFERENCES products(productid)
);
select * from orderitems;
INSERT INTO orderitems (orderid, productid, quantity, price)
VALUES 
(1, 2, 3, 200), 
(2, 3, 1, 40);

CREATE TABLE login (
    id INT,
    username VARCHAR(50),
    password VARCHAR(50),
    usertype VARCHAR(50),
    loginstatus VARCHAR(50)
);
select * from login;
INSERT INTO login(id, username, password, usertype, loginstatus)
VALUES
(1, 'kavitha', 'kavi09', 'user', 'success'),
(2, 'lahari', 'lahari17', 'user', 'success'),
(3, 'sirisha', 'siri23', 'admin', 'failed'),
(4, 'samreen', 'sam08', 'admin', 'failed');



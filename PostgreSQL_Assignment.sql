-- Active: 1742287443448@@127.0.0.1@5432@bookstore_db

-- create data base 
CREATE DATABASE bookstore_db;

-- Table Creation
-- Create a "books" table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) CHECK (price >= 0) NOT NULL,
    stock INT CHECK (price >= 0) NOT NULL,
    published_year INT CHECK (published_year > 0) NOT NULL
)

-- Create a "customers" table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- Create an "orders" table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- books টেবিলে নতুন বইয়ের তথ্য সংযুক্ত করা হচ্ছে  
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

SELECT * FROM books;

INSERT INTO customers (name, email) VALUES
('Alice', 'alice@email.com'),  
('Bob', 'bob@email.com'),  
('Charlie', 'charlie@email.com');

SELECT * FROM customers;

-- orders টেবিলে নতুন অর্ডারের তথ্য সংযুক্ত করা হচ্ছে  
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 2, 1),  
(2, 1, 1),  
(1, 3, 2);

SELECT * FROM orders;

-- 1️⃣ Find books that are out of stock.
SELECT title FROM books WHERE stock = 0;

-- 2️⃣ Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- 3️⃣ Find the total number of orders placed by each customer.
SELECT name, count(*) as total_orders  FROM customers
JOIN orders on orders.customer_id = customers.id
GROUP BY customers.id

-- 4️⃣ Calculate the total revenue generated from book sales.
SELECT sum(quantity * price) as total_revenue from orders
JOIN books on books.id = orders.book_id

-- 5️⃣ List all customers who have placed more than one order.
SELECT name, count(*) as orders_count  FROM orders
JOIN customers on customers.id = orders.customer_id
GROUP BY name
HAVING count(*) > 1

-- 6️⃣ Find the average price of books in the store.
SELECT round(avg(price), 2) as avg_book_price from books

-- 7️⃣ Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.1
WHERE published_year < 2000;

-- 8️⃣ Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN(
    SELECT DISTINCT customer_id FROM orders
)

SELECT * FROM customers




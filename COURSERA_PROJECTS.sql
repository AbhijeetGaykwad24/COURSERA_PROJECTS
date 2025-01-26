CREATE DATABASE Coursera_Projects;
USE Coursera_Projects;

CREATE TABLE Products (
    product_entry_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    description VARCHAR(255),
    quantity_on_hand INT,
    cost DECIMAL(10, 2),
    purchase_date DATE,
    vendor_id INT,
    price DECIMAL(10, 2),
    item_type VARCHAR(50),
    location VARCHAR(50),
    unit VARCHAR(50)
);

CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(255),
    vendor_address VARCHAR(255)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_entry_id INT,
    date_sold DATE,
    customer_id INT,
    quantity_sold INT,
    FOREIGN KEY (product_entry_id) REFERENCES Products(product_entry_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Vendors (vendor_id, vendor_name, vendor_address)
VALUES
(1, 'Bennet Farms', 'Rt. 17 Evansville, IL 55446'),
(2, 'Freshness, Inc.', '202 E. Maple St., St. Joseph, MO 45678'),
(3, 'Ruby Redd Produce, LLC', '1212 Milam St., Kenosha, AL, 34567');

SELECT * FROM Vendors;

INSERT INTO Customers (customer_id, customer_name)
VALUES
(198765, 'Customer A'),
(202900, 'Customer B'),
(196777, 'Customer C'),
(277177, 'Customer D'),
(111000, 'Customer E'),
(100988, 'Customer F');

SELECT * FROM Customers;

INSERT INTO Products (product_id, description, quantity_on_hand, cost, purchase_date, vendor_id, price, item_type, location, unit)
VALUES
(1000, 'Bennet Farm free-range eggs', 29, 2.35, '2022-02-01', 1, NULL, 'Dairy', 'D12', 'dozen'),
(1000, 'Bennet Farm free-range eggs', 27, NULL, NULL, NULL, 5.49, 'Dairy', 'D12', 'dozen'),
(2000, 'Ruby\'s Kale', 3, NULL, NULL, NULL, 3.99, 'Produce', 'p12', 'bunch'),
(1100, 'Freshness White beans', 13, NULL, NULL, NULL, 1.49, 'Canned', 'a2', '12 ounce can'),
(1100, 'Freshness White beans', 53, 0.69, '2022-02-02', 2, NULL, 'Canned', 'a2', '12 oz can'),
(1000, 'Bennet Farm free-range eggs', 25, NULL, NULL, NULL, 5.99, 'Dairy', 'D12', 'dozen'),
(1100, 'Freshness White beans', 45, NULL, NULL, NULL, 1.49, 'Canned', 'a2', '12-oz can'),
(1222, 'Freshness Green beans', 59, 0.59, '2022-02-10', 2, NULL, 'Canned', 'a3', '12 ounce can'),
(1223, 'Freshness Green beans', 12, 1.75, '2022-02-10', 2, NULL, 'Canned', 'a7', '36 oz can'),
(1224, 'Freshness Wax beans', 31, 0.65, '2022-02-10', 2, NULL, 'Canned', 'a3', '12 ounce can'),
(1000, 'Bennet Farm free-range eggs', 21, NULL, NULL, NULL, 5.49, 'Dairy', 'd12', 'dozen'),
(1100, 'Freshness White beans', 41, NULL, NULL, NULL, 1.49, 'Canned', 'a2', '12 ounce can'),
(1222, 'Freshness Green beans', 47, NULL, NULL, NULL, 1.29, 'Canned', 'a3', '12-oz can'),
(1224, 'Freshness Wax beans', 23, NULL, NULL, NULL, 1.55, 'Canned', 'a3', '12-oz can'),
(2000, 'Ruby\'s Kale', 28, 1.29, '2022-02-12', 3, NULL, 'Produce', 'p12', 'bunch'),
(2001, 'Ruby\'s Organic Kale', 20, 2.19, '2022-02-12', 3, NULL, 'Produce', 'po2', 'bunch'),
(1223, 'Freshness Green beans', 7, NULL, NULL, NULL, 3.49, 'Canned', 'a7', '36 oz can'),
(2001, 'Ruby\'s Organic Kale', 19, NULL, NULL, NULL, 6.99, 'Produce', 'po2', 'bunch'),
(2001, 'Ruby\'s Organic Kale', 7, NULL, NULL, NULL, 6.99, 'Produce', 'po2', 'bunch'),
(1223, 'Freshness Green beans', 17, 1.8, '2022-02-15', 2, NULL, 'Canned', 'a7', '36 oz can'),
(2000, 'Ruby\'s Kale', 26, NULL, NULL, NULL, 3.99, 'Produce', 'p12', 'bunch');

SELECT * FROM Products;

INSERT INTO Sales (product_entry_id, date_sold, customer_id, quantity_sold)
VALUES
(1, '2022-02-02', 198765, 2),
(4, '2022-02-02', 202900, 2),
(5, '2022-02-04', 196777, 2),
(7, '2022-02-07', 198765, 8),
(11, '2022-02-12', 111000, 12),
(17, '2022-02-13', 198765, 5),
(18, '2022-02-13', 100988, 1),
(19, '2022-02-14', 202900, 12),
(21, '2022-02-15', 111000, 2);

SELECT * FROM Sales;

SELECT
    p.description,
    v.vendor_name,
    s.date_sold,
    c.customer_name,
    s.quantity_sold
FROM
    Sales s
JOIN
    Products p ON s.product_entry_id = p.product_entry_id
JOIN
    Vendors v ON p.vendor_id = v.vendor_id
JOIN
    Customers c ON s.customer_id = c.customer_id
WHERE
    p.description = 'Bennet Farm free-range eggs';






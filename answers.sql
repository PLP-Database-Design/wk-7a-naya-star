-- Create Database
CREATE DATABASE CustomerOrders;

-- Use the created database
USE CustomerOrders;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2),
    StockQuantity INT
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Data
INSERT INTO Customers (CustomerName)
VALUES
('John Doe'),
('Jane Smith'),
('Emily Clark');

INSERT INTO Products (ProductName, Price, StockQuantity)
VALUES
('Laptop', 1000.00, 50),
('Mouse', 20.00, 200),
('Tablet', 500.00, 100),
('Keyboard', 40.00, 150),
('Phone', 700.00, 75);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES
(1, '2025-05-01'),
(2, '2025-05-02'),
(3, '2025-05-03');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),   -- John Doe orders 1 Laptop
(1, 2, 2),   -- John Doe orders 2 Mice
(2, 3, 1),   -- Jane Smith orders 1 Tablet
(2, 4, 1),   -- Jane Smith orders 1 Keyboard
(2, 2, 3),   -- Jane Smith orders 3 Mice
(3, 5, 1);   -- Emily Clark orders 1 Phone

-- List all tables in the database
SHOW TABLES;

-- Check the data in the Customers table
SELECT * FROM Customers;

-- Check the data in the Orders table
SELECT * FROM Orders;

-- Check the data in the OrderDetails table
SELECT * FROM OrderDetails;

-- Join tables to retrieve customer orders along with product details
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

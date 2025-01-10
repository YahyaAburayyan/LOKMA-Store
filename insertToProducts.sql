-- Insert Products
INSERT INTO Products (product_id, product_name, price) 
VALUES 
(1, 'Lokma Meal Small', 20.0),
(2, 'Lokma Meal Small', 20.0),
(3, 'Lokma Meal Small', 20.0),
(4, 'Lokma Family Meal', 35.0),
(5, 'Lokma Family Meal', 35.0),
(6, 'Lokma Family Meal', 35.0),
(7, 'Crape', 18.0),
(8, 'Pan Cake', 20.0),
(9, 'Espresso', 6),
(10, 'Latte', 10),
(11, 'Hot Oreo', 10),
(12, 'Mango', 12),
(13, 'Grape and Watermelon', 14),
(14, 'Lemon and Mint', 10),
(15, 'Oreo MilkShake', 12),
(16, 'Corneto MilkShake', 14),
(17, 'Pistachio MilkShake', 15);

-- Insert Sweets
INSERT INTO Sweets (product_id, nuts_type, chocolate_Type) 
VALUES 
(1, 'Pistachio', 'Nutella'),
(2, 'Pistachio', 'White'),
(3, 'Peanut', 'Nutella'),
(4, 'Pistachio', 'Nutella'),
(5, 'Dried Coconut', 'Loutes'),
(6, 'None', 'White'),
(7, 'Peanut', 'Nutella and White'),
(8, 'Pistachio', 'Honey');

-- Insert Drinks
INSERT INTO Drinks (product_id, state, is_Sugar_Free) 
VALUES 
(9, 'Hot', 'Yes'),
(10, 'Hot', 'Yes'),
(11, 'Hot', 'No'),
(12, 'Smothie', 'Yes'),
(13, 'Smothie', 'No'),
(14, 'Smothie', 'Yes'),
(15, 'Milk Shake', 'No'),
(16, 'Milk Shake', 'No'),
(17, 'Milk Shake', 'No');

-- Insert Employees
INSERT INTO Employees (emp_name, manger_id, phone, address, emp_role, salary) 
VALUES 
('Yahya', 1, '05982600008', 'Hebron', 'Manger', 9999),
('David Smith', null, '2233445566', '5678 Oak Street', 'Employee', 3000),
('Emily Davis', null, '3344556677', '9101 Pine Street', 'Employee', 3200),
('James Taylor', null, '4455667788', '3456 Maple Street', 'Employee', 2800);

-- Insert Customers
INSERT INTO Customers (customer_id, customer_name, phone, address) 
VALUES 
(1, 'John Doe', '1234567890', '123 Main St'),
(2, 'Jane Smith', '9876543210', '456 Elm St'),
(3, 'Alice Johnson', '1122334455', '789 Oak St'),
(4, 'Bob Brown', '5566778899', '101 Pine St');

-- Insert EmployeeLogin
INSERT INTO EmployeeLogin (Email, PasswordHash, EmployeeID) 
VALUES 
('yahya@lokma.com', '2004', 1),
('david.smith@lokma.com', '0000', 2),
('emily.davis@lokma.com', '0000', 3),
('james.taylor@lokma.com', '0000', 4);

-- Insert CustomerLogin
INSERT INTO CustomerLogin (Email, PasswordHash, CustomerID) 
VALUES 
('john.doe@example.com', '0000', 1),
('jane.smith@example.com', '0000', 2),
('alice.johnson@example.com', '0000', 3),
('bob.brown@example.com', '0000', 4);

-- Insert PaymentMethod
INSERT INTO PaymentMethod (MethodType, customer_id) 
VALUES 
('Credit Card', 1),
('Credit Card', 2),
('Cash', 3),
('Cash', 4),
('Debit Card', 2);

-- Insert CardDetails
INSERT INTO CardDetails (cardnum, cardcvv, expiryDate, PaymentMethodID) 
VALUES 
('1234567812345678', '123', '2025-01-01', 1),
('9876543210987654', '456', '2024-03-01', 2),
('2233445566778899', '654', '2027-09-01', 5);

-- Insert Orders
INSERT INTO Orders (customer_id, total_amount, rating) 
VALUES 
(1, 5000.00, 5),
(2, 20000.00, 4),
(3, 350.00, 5),
(4, 280.00, 3),
(1, 600.00, 5),
(3, 1500.00, NULL);

-- Insert Payments_order
INSERT INTO Payments_order (OrderID, PaymentMethodID, PaymentDate, Amount) 
VALUES 
(1, 1, '2025-01-01', 5000.00),
(2, 2, '2025-01-02', 20000.00),
(3, 3, '2025-01-03', 350.00),
(4, 4, '2025-01-06', 280.00),
(5, 5, '2025-01-07', 1500.00),
(1, 1, '2025-01-08', 600.00);

-- Insert Suppliers
INSERT INTO Suppliers (SupplierName, Phone, address) 
VALUES 
('Sweet Treats Co', '1234567890', '123 Sweet Street'),
('Nutty Supplier', '0987654321', '456 Nut Lane'),
('Dairy Dreams', '5678901234', '789 Flour Road'),
('Supplier Milk', '6789012345', '321 Milk Avenue');

-- Insert Supplier_Products
INSERT INTO Supplier_Products (supplier_id, product_name, price) 
VALUES 
(1, 'Chocolates', 500),
(2, 'Nuts', 200),
(3, 'Flour', 100),
(4, 'Milk', 150);

-- Insert Suppliers_Buy
INSERT INTO Suppliers_Buy (quantity, buy_date, emp_id, supplier_id) 
VALUES 
(100, '2024-12-09', 1, 1),
(200, '2024-12-20', 2, 2),
(150, '2024-12-29', 3, 3),
(250, '2024-12-15', 4, 4);

SELECT 
    el.Email,
    el.PasswordHash,
    el.EmployeeID,
    e.emp_name,
    e.emp_role
FROM 
    EmployeeLogin el
JOIN 
    Employees e ON el.EmployeeID = e.emp_id
WHERE 
    el.Email = 'yahya@lokma.com' AND e.emp_role = 'Manager';

drop database if exists LOKMA;
create database LOKMA;
use LOKMA;

create Table Employees (
emp_id int primary key AUTO_INCREMENT ,
manger_id int ,
emp_name varchar (20) ,
phone varchar (15) ,
address TEXT ,
emp_role  varchar (32),
salary int );

create Table Customers (
customer_id int primary key AUTO_INCREMENT, 
customer_name varchar (20) ,
phone varchar (15) ,
address TEXT );

-- new 
CREATE TABLE EmployeeLogin (
    LoginID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(emp_id) ON DELETE CASCADE
);
-- new  
CREATE TABLE CustomerLogin (
    LoginID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- new  
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(32),
    price DOUBLE
);
-- new 
CREATE TABLE Product_Employee (
    product_id INT NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (product_id, emp_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id) ON DELETE CASCADE
);


create table Sweets (
product_id int primary key ,
nuts_Type varchar (32) ,
 chocolate_Type varchar (32) ,
foreign key (product_id) references products (product_id) on delete cascade ); 


create table Drinks (
product_id int primary key ,
 state varchar (32) ,
is_Sugar_Free VARCHAR(3) DEFAULT NULL CHECK (is_Sugar_Free IN ('yes', 'no')), 
foreign key (product_id) references products (product_id) on delete cascade );

CREATE TABLE Orders (
order_id INT PRIMARY KEY AUTO_INCREMENT, 
customer_id INT ,
total_amount DOUBLE NOT NULL CHECK (total_amount >= 0), -- * 
rating INT DEFAULT NULL CHECK (rating BETWEEN 1 AND 5),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON UPDATE CASCADE ON DELETE SET NULL
);

create Table Order_Product (
order_id int not null, 
product_id int not null ,
sub_price DOUBLE NOT NULL CHECK (sub_price >= 0),
quantity INT NOT NULL CHECK (quantity > 0),  
primary key (order_id,product_id),
foreign key (order_id) references Orders (order_id) on update cascade on delete cascade ,
foreign key (product_id) references Products (product_id) on update cascade on delete cascade );

CREATE TABLE PaymentMethod (
    PaymentMethodID INT PRIMARY KEY AUTO_INCREMENT,
    MethodType VARCHAR(32) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- new 
CREATE TABLE CardDetails (
    CardID INT PRIMARY KEY AUTO_INCREMENT,
    cardnum VARCHAR(32) NOT NULL,
    cardcvv VARCHAR(16) NOT NULL,
    expiryDate VARCHAR(16) NOT NULL,
    PaymentMethodID INT NOT NULL,
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID) ON DELETE CASCADE
);

CREATE TABLE Payments_order (
PaymentID INT PRIMARY KEY AUTO_INCREMENT,
OrderID INT NOT NULL,
PaymentMethodID INT NOT NULL,
PaymentDate DATE NOT NULL,
Amount DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID) ON DELETE CASCADE
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    address VARCHAR(30)
);

-- new 
CREATE TABLE Suppliers_Buy (
    quantity INT,
    buy_date DATE,
    emp_id INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Supplier_Products (
    supplier_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL, 
    price INT,
    PRIMARY KEY (supplier_id, product_name),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE
);

CREATE DATABASE project_new;

USE project_new;

CREATE TABLE Customer (
    CustomerID VARCHAR(25) PRIMARY KEY,
    CustomerAddress VARCHAR(50),
    CustomerName VARCHAR(50),
    CustomerContact VARCHAR(50)
);

CREATE TABLE Account (
    Account VARCHAR(25) PRIMARY KEY,
    CustomerID VARCHAR(25),
    AccountPlanDetails VARCHAR(50),
    BillingInfo VARCHAR(255),
    AccountType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE Router (
    RouterID VARCHAR(25) PRIMARY KEY,
    CustomerID VARCHAR(25),
    MACAddress VARCHAR(20),
    RouterModel VARCHAR(25),
    RouterInstallationDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE NetworkNodes (
    NodeID INT(25) PRIMARY KEY,
    RouterID VARCHAR(25),
    ConnectionType VARCHAR(25),
    LOCATION VARCHAR(50),
    FOREIGN KEY (RouterID) REFERENCES Router (RouterID)
);

CREATE TABLE Subscription (
    SubscriptionID VARCHAR(25) PRIMARY KEY,
    AccountID VARCHAR(25),
    SubscriptionStartDate DATE,
    SubscriptionEndDate DATE,
    SubscriptionIDataLimit VARCHAR(50),
    SubscriptionCost INT(50),
    FOREIGN KEY (AccountID) REFERENCES Account (Account)
);

CREATE TABLE ServiceRequest (
    ServiceRequestID VARCHAR(25) PRIMARY KEY,
    CustomerID VARCHAR(25),
    ReqDate DATE,
    ServiceStatus VARCHAR(25),
    ServiceDescription VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE Tickets (
    TicketID VARCHAR(25) PRIMARY KEY,
    ServiceRequestID VARCHAR(25),
    TicketStatus VARCHAR(25),
    TicketDescription VARCHAR(25),
    TicketPriority INT(5),
    TicketDate DATE,
    FOREIGN KEY (ServiceRequestID) REFERENCES ServiceRequest (ServiceRequestID)
);

CREATE TABLE Payment (
    PaymentID VARCHAR(25) PRIMARY KEY,
    AccountID VARCHAR(25),
    PaymentDueDate DATE,
    PaymentAmount INT(50),
    FOREIGN KEY (AccountID) REFERENCES Account (Account)
);

CREATE TABLE Invoice (
    InvoiceID VARCHAR(25) PRIMARY KEY,
    AccountID VARCHAR(25),
    InvoiceDate DATE,
    InvoiceTotalAmount INT(50),
    FOREIGN KEY (AccountID) REFERENCES Account (Account)
);

CREATE TABLE Address (
    AddressID VARCHAR(25) PRIMARY KEY,
    CustomerID VARCHAR(25),
    Street VARCHAR(50),
    City VARCHAR(50),
    Location VARCHAR(50),
    PinCode VARCHAR(50),
    Area VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

-- Additional data for the Customer table
INSERT INTO Customer (CustomerID, CustomerAddress, CustomerName, CustomerContact) 
VALUES 
  ('CUST001', '123 Main St', 'John Doe', '123-456-7890'),
  ('CUST002', '456 Oak St', 'Jane Smith', '987-654-3210'),
  ('CUST003', '789 Pine St', 'Alice Johnson', '555-123-4567'),
  ('CUST004', '321 Cedar St', 'Bob Miller', '555-987-6543');

-- Additional data for the Address table
INSERT INTO Address (AddressID, CustomerID, Street, City, Location, PinCode, Area) 
VALUES 
  ('ADDR001', 'CUST001', '123 Main St', 'City1', 'Location1', '12345', 'Downtown'),
  ('ADDR002', 'CUST002', '456 Oak St', 'City2', 'Location2', '54321', 'Suburbia'),
  ('ADDR003', 'CUST003', '789 Pine St', 'City2', 'Location2', '54321', 'Suburbia'),
  ('ADDR004', 'CUST004', '321 Cedar St', 'City1', 'Location1', '12345', 'Downtown');

  -- Additional data for the Account table
INSERT INTO Account (Account, CustomerID, AccountPlanDetails, BillingInfo, AccountType) 
VALUES 
  ('ACC001', 'CUST001', 'Unlimited Data', 'Credit Card', 'Premium'),
  ('ACC002', 'CUST002', 'Basic Plan', 'Bank Transfer', 'Standard'),
  ('ACC003', 'CUST003', 'Premium Plan', 'PayPal', 'Premium'),
  ('ACC004', 'CUST004', 'Family Plan', 'Credit Card', 'Standard');

-- Additional data for the Router table
INSERT INTO Router (RouterID, CustomerID, MACAddress, RouterModel, RouterInstallationDate) 
VALUES 
  ('ROUT001', 'CUST001', '12:34:56:78:90:AB', 'Model X', '2023-05-01'),
  ('ROUT002', 'CUST002', 'AB:CD:EF:12:34:56', 'Model Y', '2023-06-01'),
  ('ROUT003', 'CUST003', 'EF:CD:AB:90:78:56', 'Model Z', '2023-07-01'),
  ('ROUT004', 'CUST004', '56:34:12:AB:EF:CD', 'Model X', '2023-07-15');

-- Additional data for the NetworkNodes table
INSERT INTO NetworkNodes (NodeID, RouterID, ConnectionType, LOCATION) 
VALUES 
  (1, 'ROUT001', 'Wired', 'Living Room'),
  (2, 'ROUT002', 'Wireless', 'Bedroom'),
  (3, 'ROUT003', 'Wireless', 'Office'),
  (4, 'ROUT004', 'Wired', 'Living Room');

-- Additional data for the Subscription table
INSERT INTO Subscription (SubscriptionID, AccountID, SubscriptionStartDate, SubscriptionEndDate, SubscriptionIDataLimit, SubscriptionCost) 
VALUES 
  ('SUBS001', 'ACC001', '2023-05-01', '2024-05-01', 'Unlimited', 1200),
  ('SUBS002', 'ACC002', '2023-06-01', '2024-06-01', 'Basic', 600),  
  ('SUBS003', 'ACC003', '2023-07-01', '2024-07-01', 'Basic', 900),
  ('SUBS004', 'ACC004', '2023-07-15', '2024-07-15', 'Unlimited', 1200);

-- Additional data for the ServiceRequest table
INSERT INTO ServiceRequest (ServiceRequestID, CustomerID, ReqDate, ServiceStatus, ServiceDescription) 
VALUES 
  ('SRVREQ001', 'CUST001', '2023-05-01', 'Open', 'Internet connectivity issue'),
  ('SRVREQ002', 'CUST002', '2023-06-01', 'Closed', 'Router setup'),
  ('SRVREQ003', 'CUST003', '2023-07-01', 'Open', 'Internet speed issue'),
  ('SRVREQ004', 'CUST004', '2023-07-15', 'Closed', 'Router firmware update');

-- Additional data for the Tickets table
INSERT INTO Tickets (TicketID, ServiceRequestID, TicketStatus, TicketDescription, TicketPriority, TicketDate) 
VALUES 
  ('TICK001', 'SRVREQ001', 'Open', 'Issue with connection', 1, '2023-05-01'),
  ('TICK002', 'SRVREQ002', 'Closed', 'Router setup', 2, '2023-06-01'),
  ('TICK003', 'SRVREQ003', 'Open', 'Slow connection', 1, '2023-07-01'),
  ('TICK004', 'SRVREQ004', 'Closed', 'Router upgrade', 2, '2023-07-15');

-- Additional data for the Payment table
INSERT INTO Payment (PaymentID, AccountID, PaymentDueDate, PaymentAmount) 
VALUES 
  ('PAY001', 'ACC001', '2023-05-31', 100),
  ('PAY002', 'ACC002', '2023-06-15', 50),
  ('PAY003', 'ACC003', '2023-07-01', 80),
  ('PAY004', 'ACC004', '2023-07-15', 60);

-- Additional data for the Invoice table
INSERT INTO Invoice (InvoiceID, AccountID, InvoiceDate, InvoiceTotalAmount) 
VALUES 
  ('INV001', 'ACC001', '2023-05-01', 120),
  ('INV002', 'ACC002', '2023-06-01', 60),
  ('INV003', 'ACC003', '2023-07-01', 85),
  ('INV004', 'ACC004', '2023-07-15', 65);

-- Show All Tables
SHOW TABLES;

-- SELECT all records from the Customer Table
SELECT * FROM Customer;

-- SELECT all records from the Account Table
SELECT * FROM Account;

-- SELECT all records from the Router Table
SELECT * FROM Router;

-- SELECT all records from the NetworkNodes Table
SELECT * FROM NetworkNodes;

-- SELECT all records from the Subscription Table
SELECT * FROM Subscription;

-- SELECT all records from the ServiceRequest Table
SELECT * FROM ServiceRequest;

-- SELECT all records from the Tickets Table
SELECT * FROM Tickets;

-- SELECT all records from the Payment Table
SELECT * FROM Payment;

-- SELECT all records from the Invoice Table
SELECT * FROM Invoice;

-- SELECT all records from the Address Table
SELECT * FROM Address;




-- Normalization 

-- 1NF to 3NF 

-- We are moving from the original form (which can be considered a form of 1NF where AccountPlanDetails is a multi-valued attribute) to at least the Third Normal Form (3NF) by splitting the AccountPlanDetails into a separate table.

-- Step 1: Create a new table for account plan details
CREATE TABLE AccountPlanDetails (
    PlanID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID VARCHAR(25),
    PlanName VARCHAR(50),
    PlanDescription VARCHAR(255),
    FOREIGN KEY (AccountID) REFERENCES Account (Account)
);

SELECT * FROM Account;

-- Step 2: Remove AccountPlanDetails column from the Account table
ALTER TABLE Account DROP COLUMN AccountPlanDetails;

-- Step 3: Add foreign key constraint to link AccountPlanDetails with Account
ALTER TABLE AccountPlanDetails ADD CONSTRAINT FK_AccountPlanDetails_Account FOREIGN KEY (AccountID) REFERENCES Account (Account);

-- Insert sample data into the AccountPlanDetails table
INSERT INTO AccountPlanDetails (AccountID, PlanName, PlanDescription) 
VALUES 
  ('ACC001', 'Unlimited Data', 'xyz'),
  ('ACC002', 'Basic Plan', 'abc'),
  ('ACC003', 'Premium Plan', 'ask'),
  ('ACC004', 'Family Plan', 'aws');

SELECT * FROM AccountPlanDetails;

-- Grant Permissions [Level 1 - Tickets, Level 2 - Account Details, Level 3 - Subscription/Pyments, Level 4 - Account Termination, Level 5 - Admin] 


-- Issue a ticket

-- Add a new User hence adding a new Account, Router, Subscription, Payment etc.

--  

-- Data Retrieval Queries
SELECT * FROM Customer WHERE CustomerID = 'CUST001';
SELECT * FROM Account;
SELECT * FROM Router;
SELECT * FROM Subscription;
SELECT * FROM ServiceRequest;

-- Data Analysis Queries
SELECT SUM(SubscriptionCost) AS TotalRevenue FROM Subscription;
SELECT ServiceDescription, COUNT(*) AS RequestCount FROM ServiceRequest GROUP BY ServiceDescription ORDER BY RequestCount DESC;
SELECT YEAR(PaymentDueDate) AS PaymentYear, MONTH(PaymentDueDate) AS PaymentMonth, SUM(PaymentAmount) AS TotalPayments FROM Payment GROUP BY PaymentYear, PaymentMonth;

-- Data Modification Queries
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerContact) VALUES ('CUST005', 'Emily Johnson', '789 Elm St', '555-678-9012');
UPDATE Customer SET CustomerContact = '555-111-2222' WHERE CustomerID = 'CUST002';

START TRANSACTION;

DELETE FROM Tickets WHERE ServiceRequestID = 'SRVREQ004';
DELETE FROM ServiceRequest WHERE ServiceRequestID = 'SRVREQ004';

COMMIT;

-- Join Queries
SELECT c.*, a.* FROM Customer c INNER JOIN Account a ON c.CustomerID = a.Account;
-- SELECT c.*, a.* FROM Customer c INNER JOIN Account a ON c.CustomerID = a.Account WHERE ap.AccountPlanDetails ='Unlimited Data';
SELECT c.*, a.* FROM Customer c INNER JOIN Account a ON c.CustomerID = a.Account WHERE c.CustomerID ='CUST001';
SELECT * FROM Customer NATURAL JOIN Account NATURAL JOIN AccountPlanDetails;

-- Aggregate Queries
SELECT SUM(InvoiceTotalAmount) AS TotalRevenue FROM Invoice;
SELECT AVG(SubscriptionCost) AS AverageSubscriptionCost FROM Subscription;

-- Filtering and Sorting Queries
SELECT * FROM ServiceRequest WHERE ServiceStatus = 'Open';
SELECT * FROM Invoice ORDER BY InvoiceDate DESC;

-- Grouping Queries


-- Subqueries
SELECT * FROM Customer WHERE CustomerID IN (SELECT CustomerID FROM Subscription WHERE SubscriptionCost > (SELECT AVG(SubscriptionCost) FROM Subscription));
-- SELECT DISTINCT s.SubscriptionCost, c.* FROM Subscription s INNER JOIN Account a ON s.AccountID = a.CustomerID INNER JOIN Customer c ON c.CustomerID = a.CustomerID WHERE SubscriptionCost > (SELECT AVG(SubscriptionCost) FROM Subscription);
SELECT DISTINCT s.SubscriptionCost, c.* FROM Subscription s INNER JOIN  Customer c ON c.CustomerID = s.AccountID WHERE SubscriptionCost > (SELECT AVG(SubscriptionCost) FROM Subscription);

SELECT AVG(SubscriptionCost) FROM Subscription;
SELECT * FROM Subscription;

-- Revised Subquery
-- -- SELECT c.*, s.SubscriptionCost FROM Customer c INNER JOIN Subscription s ON c.CustomerID = s.CustomerID WHERE s.SubscriptionCost > (SELECT AVG(SubscriptionCost) FROM Subscription);

-- -- SELECT c.*, s.SubscriptionCost FROM Customer c INNER JOIN Account a ON c.CustomerID = a.CustomerID WHERE a.CustomerID = (SELECT s.AccountID FROM  Subscription s INNER JOIN Account a on s.AccountID = a.CustomerID WHERE s.SubscriptionCost > (SELECT AVG(SubscriptionCost) FROM Subscription);

-- SELECT c.*, s.SubscriptionCost FROM Customer c INNER JOIN Account a ON c.CustomerID = a.CustomerID WHERE a.CustomerID = (SELECT s.AccountID FROM  Subscription s INNER JOIN Account a on s.AccountID = a.Account);

-- SELECT c.*, s.SubscriptionCost FROM Customer c INNER JOIN Account a ON c.CustomerID = a.CustomerID INNER JOIN Subscription s ON a.CustomerID = s.AccountID WHERE s.SubscriptionCost = (SELECT AVG(SubscriptionCost) FROM Subscription);

-- Advanced Join with Aggregation
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(s.SubscriptionID) AS NumSubscriptions,
    SUM(s.SubscriptionCost) AS TotalSubscriptionCost
FROM 
    Customer c
LEFT JOIN 
    Account a ON c.CustomerID = a.CustomerID
LEFT JOIN 
    Subscription s ON a.Account = s.AccountID
GROUP BY 
    c.CustomerID, c.CustomerName
ORDER BY 
    TotalSubscriptionCost DESC;

-- -- Recursive Common Table Expression (CTE)
-- WITH RecursiveHierarchy AS (
--     SELECT 
--         EmployeeID,
--         ManagerID,
--         EmployeeName,
--         0 AS Level
--     FROM 
--         Employee
--     WHERE 
--         ManagerID IS NULL

--     UNION ALL

--     SELECT 
--         e.EmployeeID,
--         e.ManagerID,
--         e.EmployeeName,
--         rh.Level + 1
--     FROM 
--         Employees e
--     INNER JOIN 
--         RecursiveHierarchy rh ON e.ManagerID = rh.EmployeeID
-- )
-- SELECT * FROM RecursiveHierarchy;

-- Window Functions
SELECT 
    c.CustomerID,
    CustomerName,
    CustomerAddress,
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY ServiceRequestID) AS RequestSequence
FROM 
    Customer c
JOIN 
    ServiceRequest sr ON c.CustomerID = sr.CustomerID;


-- ---------------------------------------------------------------------


-- Drop Tables
DROP TABLE Tickets;
DROP TABLE ServiceRequest;
DROP TABLE NetworkNodes;
DROP TABLE Router;
DROP TABLE Subscription;
DROP TABLE Payment;
DROP TABLE Invoice;
DROP TABLE AccountPlanDetails;
DROP TABLE Account;
DROP TABLE Address;
DROP TABLE Customer;

DROP DATABASE project_new;

create database project;

use project;


-- Create Tables

CREATE TABLE ServiceRequest(
ServiceRequest VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID) ,
ReqDate DATE,
ServiceStatus VARCHAR(25),
ServiceDescription VARCHAR(25) 
);

CREATE TABLE Tickets (
TicketID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (ServuceRequestID) REFERENCES ServiceRequest (ServuceRequestID) ,
TicketStatus VARCHAR(25),
TicketDescription INT(5),
TicketPriority INT(5),
TicketDate DATE
);

CREATE TABLE NetworkNodes (
NodeID INT(25) PRIMARY KEY,
FOREIGN KEY (RouterID) REFERENCES Router (RouterID),
ConnectionType VARCHAR(25),
LOCATION VARCHAR(50)
);


CREATE TABLE Router (
RouterID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
MACAddress VARCHAR(12) PRIMARY KEY,
RouterModel VARCHAR(25),
RouterInstallationDate DATE
);


CREATE TABLE Account (
Account VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
AccountPlanDetails VARCHAR(50),
BillingInfo VARCHAR(255),
AccountType VARCHAR(50)
);


CREATE TABLE Subscription (
SubscriptionID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (AccountID) REFERENCES Account (AccountID),
SubscriptionStartDate DATE,
SubscriptionEndDate DATE,
SubscriptionIDataLimit VARCHAR(50) ,
SubscriptionCost INT(50)
);


CREATE TABLE Customer (
CustomerID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (AccountID) REFERENCES Account (AccountID),
CustomerAddress VARCHAR(50), 
CustomerName VARCHAR(50),
CustomerContact VARCHAR(50)
);


CREATE TABLE Address (
FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
Location VARCHAR(50), 
PinCode VARCHAR(50),
Area VARCHAR(50)
);



CREATE TABLE Payment (
PaymentID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (AccountID) REFERENCES Account (AccountID),
PaymentDueDate DATE,
PaymentAmount INT(50)
);


CREATE TABLE Invoice (
InvoiceID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (AccountID) REFERENCES Account (AccountID),
Invoice DATE,
InvoiceTotalAmount INT(50)
);


-- Show Tables
SHOW TABLES;

CREATE TABLE Items (
    code INT PRIMARY KEY,
    Decs VARCHAR(255),
    UnitPrice DECIMAL(25,10),
    Available INT,
    Saved INT,
    Waiting INT,
    Subscript INT,
    Freq INT,
    SuppDate DATE,
    OrderPercnt DECIMAL(25,10)
);


CREATE TABLE Subscription (
    OrderNo INT PRIMARY KEY,
    [Status] VARCHAR(255), 
    CustID INT,
    Code INT,
    Quant INT,
    Freq INT,
    Delivery INT,
    NextOrder DATE,
    Expiration DATE,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (Code) REFERENCES Items(code)
);


CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    CustType VARCHAR(255),
    CustStatus VARCHAR(255),
    FreezCode VARCHAR(255),
    OverCount INT,
    CustName VARCHAR(255),
    DelivAddrss VARCHAR(255),
    MailAddrss VARCHAR(255),
    CreditCard VARCHAR(255) 
);


CREATE TABLE ExOrders (
    [Date] DATE,
    OrderNo INT,
    CustID INT,
    Code INT,
    Quent INT,
    Delivery INT,
    [Address] VARCHAR(255),
    [Status] INT,
    SuppDate DATE,
    PRIMARY KEY (OrderNo, [Date], CustID),
    FOREIGN KEY (Code) REFERENCES Items(code),
    FOREIGN KEY (OrderNo) REFERENCES Subscription(OrderNo),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);


CREATE TABLE Invoices (
    InvNo INT PRIMARY KEY,
    [DATE] DATE,
    OrderNo INT,
    UnitDesc VARCHAR(255),
    NoUnits INT,
    UnitPrice DECIMAL(25,10),
    TotAmount DECIMAL(25,10),
    FOREIGN KEY (OrderNo) REFERENCES Subscription(OrderNo)
);


CREATE TABLE Receipt (
    RecNo INT PRIMARY KEY,
    PymtDate DATE,
    InvNo INT,
    OrderNo INT,
    PaidAmt DECIMAL(25,10),
    FOREIGN KEY (OrderNo) REFERENCES Subscription(OrderNo),
    FOREIGN KEY (InvNo) REFERENCES Invoices(InvNo)
);


CREATE TABLE Accounting (
    ReceiptNo INT PRIMARY KEY,
    [Date] DATE,
    Amount DECIMAL(25,10),
    CrdtDebt DECIMAL(25,10),
    InvNo INT,
    OrderNo INT,
    FOREIGN KEY (OrderNo) REFERENCES Subscription(OrderNo),
    FOREIGN KEY (InvNo) REFERENCES Invoices(InvNo),
    FOREIGN KEY (ReceiptNo) REFERENCES Receipt(RecNo)
);


CREATE TABLE StockOrder (
    OrderNo INT,
    StockDate DATE,
    Code INT,
    Descr VARCHAR(255),
    Quant INT,
    PRIMARY KEY (OrderNo, StockDate, Code), -- Composite PK
    FOREIGN KEY (OrderNo) REFERENCES Subscription(OrderNo),
    FOREIGN KEY (Code) REFERENCES Items(code)
);


CREATE TABLE DeliveryFees (
    Delivery INT PRIMARY KEY,
    [Desc] VARCHAR(255),
    DelFee DECIMAL(25,10)
);


CREATE TABLE Discounts (
    CustType VARCHAR(255) PRIMARY KEY,
    Discnt DECIMAL(25,10)
);


CREATE TABLE Numbers (
    LastOrder INT,
    LastSubsc INT,
    LastStock INT,
    LastReciept INT,
    LastInvoice INT,
    PRIMARY KEY (LastOrder, LastSubsc, LastStock, LastReciept, LastInvoice) -- Composite PK
);


CREATE TABLE Profiles (
    [Profile] VARCHAR(255) PRIMARY KEY,
    Act VARCHAR(255)
);


CREATE TABLE Users (
    UserName VARCHAR(255) PRIMARY KEY,
    [Profile] VARCHAR(255),
    FOREIGN KEY ([Profile]) REFERENCES Profiles([Profile])
);


INSERT INTO Items (code, Decs, UnitPrice, Available, Saved, Waiting, Subscript, Freq, SuppDate, OrderPercnt) VALUES
(1, 'Item A', 19.99, 100, 20, 5, 30, 1, '2024-08-01', 0.05),
(2, 'Item B', 29.5, 50, 10, 2, 20, 2, '2024-08-10', 0.10),
(3, 'Item C', 9.9, 200, 50, 10, 40, 3, '2024-08-15', 0.07);


INSERT INTO Subscription (OrderNo, [Status],Code, Quant, Freq, Delivery, NextOrder, Expiration) VALUES
(1001, 'Sent', 1, 10, 1, 1, '2024-09-01', '2025-01-01'),
(1002, 'NotSent',2, 5, 2, 2, '2024-09-15', '2025-02-01');


INSERT INTO Customers (CustID, CustType, CustStatus, FreezCode, OverCount, CustName, DelivAddrss, MailAddrss, CreditCard) VALUES
(1, 'Regular', 'Active', 'FZ123', 0, 'John Doe', '123 Elm St, Springfield', 'johndoe@example.com', '1234567890123456'),
(2, 'Constant', 'Inactive', 'FZ456', 1, 'Jane Smith', '456 Oak St, Springfield', 'janesmith@example.com', '2345678901234567');


INSERT INTO ExOrders ([Date], OrderNo, CustID, Code, Quent, Delivery, [Address], [Status], SuppDate) VALUES
('2024-08-05', 1001, 1, 1, 10, 1, '123 Elm St, Springfield', 1, '2024-08-01'),
('2024-08-20', 1002, 2, 2, 5, 2, '456 Oak St, Springfield', 0, '2024-08-10');

INSERT INTO Invoices (InvNo, [DATE],UnitDesc, NoUnits, UnitPrice, TotAmount) VALUES
(201, '2024-08-06', 'Item A', 10, 19.9, 199.95),
(202, '2024-08-21', 'Item B', 5, 29.9, 149.97);


INSERT INTO Receipt (RecNo, PymtDate, OrderNo, PaidAmt) VALUES
(3001, '2024-08-07', 1001, 199.95),
(3002, '2024-08-22', 1002, 149.97);

INSERT INTO Accounting (ReceiptNo, [Date], Amount, CrdtDebt) VALUES
(3001, '2024-08-07', 199.9, 0),
(3002, '2024-08-22', 149.97, 0);

INSERT INTO StockOrder (OrderNo, StockDate, Code, Descr, Quant) VALUES
(1001, '2024-08-02', 1, 'Restock of Item A', 50),
(1002, '2024-08-16', 2, 'Restock of Item B', 30);


INSERT INTO DeliveryFees (Delivery, [Desc], DelFee) VALUES
(1, 'Standard Delivery', 5.00),
(2, 'Express Delivery', 15.00);


INSERT INTO Discounts (CustType, Discnt) VALUES
('Regular', 0.05),
('Constant', 0.10);

INSERT INTO Numbers (LastOrder, LastSubsc, LastStock, LastReciept, LastInvoice) VALUES
(1002, 1002, 1002, 3002, 2002);

INSERT INTO Profiles ([Profile], Act) VALUES
('Admin', 'Administrator'),
('User', 'Regular User');

INSERT INTO Users (UserName, [Profile]) VALUES
('adminUser', 'Admin'),
('regularUser', 'User');

--6.1
SELECT
    i.code ,
    i.Decs ,
    i.Available ,
    i.Waiting ,
    i.Saved ,
    i.Subscript,
    i.UnitPrice ,
    s.Freq,
    i.SuppDate ,
    i.OrderPercnt
FROM
    Items i
LEFT JOIN
    Subscription s ON i.code = s.Code
ORDER BY
    i.code;

 --6.2
 SELECT
 e.[Date],
 i.TotAmount,
 e.[status],
 i.NoUnits,
 i.UnitDesc
FROM
    ExOrders e
JOIN
    Subscription s ON e.OrderNo = s.OrderNo
JOIN
    Invoices i ON s.OrderNo = i.OrderNo
ORDER by e.[date]

--6.3
SELECT 
    c.CustID,
    c.CustName ,
    c.CustStatus ,
    s.OrderNo ,
    s.[Status] ,
    i.Decs ,
    eo.Quent ,
    s.Freq
FROM 
    Customers c
JOIN 
    Subscription s ON c.CustID = s.CustID
JOIN 
    ExOrders eo ON s.OrderNo = eo.OrderNo
JOIN 
    Items i ON eo.Code = i.code

	--6.5

	SELECT 
    [Date] ,
    Delivery,
    SUM(Quent * UnitPrice) AS "sumOfOrder",
    [Status] 
FROM 
    ExOrders eo
JOIN 
    Items i ON eo.Code = i.code
WHERE 
    eo.[Status] IN ('NotSent')
GROUP BY 
    [Date], Delivery, eo.[Status]
ORDER BY 
    Delivery


	







CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    SignupDate TEXT
);

CREATE TABLE Stores (
    StoreID INTEGER PRIMARY KEY,
    StoreName TEXT,
    RegionRaw TEXT
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate TEXT,
    CustomerID INTEGER,
    StoreID INTEGER REFERENCES Stores(StoreID),
    OrderStatus TEXT
);

CREATE TABLE OrderItems (
    OrderItemID INTEGER,
    OrderID INTEGER REFERENCES Orders(OrderID),
    ProductID INTEGER REFERENCES Products(ProductID),
    Quantity INTEGER,
    UnitPrice NUMERIC,
    LoadedAt TEXT
);

CREATE TABLE Returns (
    ReturnID INTEGER PRIMARY KEY,
    OrderItemID INTEGER,
    ReturnDate TEXT,
    ReturnQuantity INTEGER
);
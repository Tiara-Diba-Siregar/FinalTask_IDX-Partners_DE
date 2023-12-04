CREATE DATABASE DWH_PROJECT

CREATE TABLE DimProduct(
	ProductID INT NOT NULL,
	ProductName VARCHAR (255) NOT NULL,
	ProductCategory VARCHAR (255) NOT NULL,
	ProductUnitPrice INT NULL,
	CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
	)

CREATE TABLE DimCustomer (
	CustomerID INT NOT NULL,
	CustomerName VARCHAR (50) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR (50) NOT NULL,
	City VARCHAR (50) NOT NULL,
	NoHp VARCHAR (50) NOT NULL,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
)

CREATE TABLE DimStatusOrder (
	StatusID INT NOT NULL,
	StatusOrder VARCHAR (50) NOT NULL,
	StatusOrderDesc VARCHAR (50) NOT NULL,
	CONSTRAINT PK_DimStatusOrder PRIMARY KEY (StatusID)
)

CREATE TABLE FactSalesOrder (
	OrderID INT NOT NULL,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusID INT NOT NULL,
	OrderDate DATE NOT NULL,
	CONSTRAINT PK_FactSalesOrder PRIMARY KEY (OrderID),
	CONSTRAINT FK_FactSalesOrderC FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID),
	CONSTRAINT FK_FactSalesOrderP FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
	CONSTRAINT FK_FactSalesOrderS FOREIGN KEY (StatusID) REFERENCES DimStatusOrder (StatusID)
)

SELECT * FROM DimProduct
SELECT * FROM DimCustomer
SELECT * FROM DimStatusOrder
SELECT * FROM FactSalesOrder

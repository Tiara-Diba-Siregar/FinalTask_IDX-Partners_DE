CREATE PROCEDURE summary_status_order
(@StatusID INT) 
AS
BEGIN
	SELECT
		FSO.OrderID,
		C.CustomerName,
		P.ProductName,
		FSO.Quantity,
		SO.StatusOrder
	FROM FactSalesOrder AS FSO
	JOIN DimCustomer C ON FSO.CustomerID = C.CustomerID
	JOIN DimProduct P ON FSO.ProductID = P.ProductID
	JOIN DimStatusOrder SO ON FSO.StatusID = SO.StatusID
	WHERE SO.StatusID = @StatusID
END

CREATE PROCEDURE GetProductInfo
    @ProductID INT = NULL
AS
BEGIN
    SELECT 
        p.Name AS ProductName,
        p.ProductNumber,
        p.Color,
        p.Name,
        ph.ListPrice,
        CONVERT(VARCHAR(10), ph.ModifiedDate, 104) AS LastPriceDate,
        SUM(soh.TotalDue) AS TotalPayments
    FROM 
        Production.Product p
        INNER JOIN Production.ProductListPriceHistory ph ON p.ProductID = ph.ProductID
        LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
        LEFT JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
    WHERE 
        @ProductID IS NULL OR p.ProductID = @ProductID
    GROUP BY 
        p.Name,
        p.ProductNumber,
        p.Color,
        p.Name,
        ph.ListPrice,
        ph.ModifiedDate
END

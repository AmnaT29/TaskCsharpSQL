CREATE FUNCTION GetProductProfit
    (@ProductID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18, 2)
    DECLARE @TotalCost DECIMAL(18, 2)
    DECLARE @TotalProfit DECIMAL(18, 2)
    
    SELECT 
        @TotalRevenue = SUM(sod.LineTotal),
        @TotalCost = SUM(sod.UnitPrice * sod.OrderQty)
    FROM 
        Sales.SalesOrderDetail sod
    WHERE 
        sod.ProductID = @ProductID
    
    SET @TotalProfit = @TotalRevenue - @TotalCost
    
    RETURN @TotalProfit
END

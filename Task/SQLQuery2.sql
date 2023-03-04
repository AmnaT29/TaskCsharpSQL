CREATE FUNCTION dbo.GetAge (
    @BusinessEntityID INT,
    @Date DATE
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Age VARCHAR(20)
    
    SELECT @Age = 
        CONVERT(VARCHAR(20),DATEDIFF(YEAR, BirthDate, @Date))
        + ' years, '
        + CONVERT(VARCHAR(20),DATEDIFF(MONTH, BirthDate, @Date) % 12)
        + ' months, '
        + CONVERT(VARCHAR(20),DATEDIFF(DAY, DATEADD(MONTH, DATEDIFF(MONTH, BirthDate, @Date), BirthDate), @Date))
        + ' days'
    FROM Person.Person
    WHERE BusinessEntityID = @BusinessEntityID
    
    RETURN @Age
END

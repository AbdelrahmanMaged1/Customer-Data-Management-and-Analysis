-- Functions 

--1
CREATE FUNCTION CustomerDetail(@CustId INT)
RETURNS TABLE
AS
RETURN
(
	SELECT c.Name,o.order_id,o.order_date,i.Type as interaction_Type,p.payment_method
	FROM Customer c
	JOIN Orders o on o.customer_id = c.customer_id
	JOIN Interaction i on i.customer_id = c.customer_id
	JOIN Payment p on p.order_id = o.order_id
	WHERE c.customer_id = @CustId 
);
select * from dbo.CustomerDetail(5)

----------------------------------------------------------------------------------------------------
 --2
CREATE FUNCTION OrderDetail(@OrderID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT order_detail_id,order_id,product_id,Price
	FROM order_detail where
	order_id = @OrderID
);
select * from dbo.OrderDetail(7)


----------------------------------------------------------------------------------------------------
--3
CREATE FUNCTION AverageProductPrice()
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @AveragePrice DECIMAL(5, 2);
    SELECT @AveragePrice = AVG(Price)
    FROM product;

    RETURN @AveragePrice;
END;

select dbo.AverageProductPrice() as AvgPrice
 
 ----------------------------------------------------------------------------------------------------
--4
CREATE FUNCTION CustomerHasOrders(@Cust_Id INT)
RETURNS BIT
AS
BEGIN
    DECLARE @HasOrders BIT;
    IF EXISTS (SELECT 1 FROM Orders WHERE customer_id = @Cust_Id)
    BEGIN
        SET @HasOrders = 1; 
    END
    ELSE
    BEGIN
        SET @HasOrders = 0; 
    END
    
    RETURN @HasOrders;
END;

select dbo.CustomerHasOrders(50) as HasOrders


----------------------------------------------------------------------------------------------------
--5
CREATE FUNCTION GetCustomerOrderCount
(
    @Cust_Id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @OrderCount INT;
    SELECT @OrderCount = COUNT(*)
    FROM Orders
    WHERE customer_id = @Cust_Id;
    
    RETURN @OrderCount;
END;

select dbo.GetCustomerOrderCount(6) as NumOfOrders


----------------------------------------------------------------------------------------------------
--6
CREATE FUNCTION GetLastOrderDate(@CustomerId INT)
RETURNS DATE
AS
BEGIN
    DECLARE @LastOrderDate DATE;
    SELECT @LastOrderDate = MAX(order_date)
    FROM Orders
    WHERE customer_id = @CustomerId;

    RETURN @LastOrderDate;
END;

select dbo.GetLastOrderDate(6) as LastOrderDate


----------------------------------------------------------------------------------------------------
--7
CREATE FUNCTION NumOfProductsPerOrder(@OrderId INT)
RETURNS INT
AS
BEGIN
DECLARE @NumOfProducts INT;
	select @NumOfProducts = COUNT(od.product_id)
	from order_detail od
	JOIN Orders o on o.order_id = od.order_id 
	where od.order_id = @OrderId
	return @NumOfProducts
end;

select dbo.NumOfProductsPerOrder(50) as NumOfProducts


----------------------------------------------------------------------------------------------------
--8
CREATE FUNCTION TotalPricePerCustomer(@CustID INT)
RETURNS INT
AS
BEGIN
DECLARE @TotalSales INT;
	select @TotalSales = Sum(od.Price)
	from order_detail od
	JOIN Orders o on o.order_id = od.order_id 
	JOIN customer c on c.customer_id = o.customer_id
	where c.customer_id = @CustID
	return @TotalSales
end;

select dbo.TotalPricePerCustomer(23) as total_Price


----------------------------------------------------------------------------------------------------
--9
CREATE FUNCTION GetTransactionCount(@CustomerId INT)
RETURNS INT
AS
BEGIN
    DECLARE @TransactionCount INT;

    SELECT @TransactionCount = COUNT(*)
    FROM dbo.transactions
    WHERE customer_id = @CustomerId;

    RETURN @TransactionCount;
END;

select dbo.GetTransactionCount(4) as TransactionCount


----------------------------------------------------------------------------------------------------
--10
CREATE FUNCTION dbo.MostPopularCategory()
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Category VARCHAR(100);
    SELECT TOP 1 @Category = c.name
    FROM dbo.category c
	JOIN subcategory sc on sc.category_id = c.category_id
    JOIN product p ON sc.subcategory_id = p.subcategory_id
    JOIN order_detail od ON p.product_id = od.product_id
    GROUP BY c.name
    ORDER BY COUNT(od.product_id) DESC;

    RETURN @Category;
END;

select dbo.MostPopularCategory() as MostPopularCategory



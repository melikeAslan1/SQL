-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER CAT_Delete
   ON  Categories
   For DELETE
AS 
BEGIN
    SET NOCOUNT ON ;
	--SET NOCOUNT ON ;added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[Categories_HIST](CategoryID,CategoryName,Tarihsaat)
	SELECT CategoryID,CategoryName, GetDate()
	FROM DELETED;

	DECLARE @id INT;
	SELECT @id = CategoryID FROM DELETED;
	DELETE FROM Categories WHERE CategoryID=@id;
	SELECT * FROM Categories Order By CategoryName;
END
GO


--DELETE FROM Categories WHERE CategoryID=10

UPDATE Categories SET CategoryID=10 WHERE CategoryID=15



---------------------------------------------------------------------------------------

USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersDetail]    Script Date: 21.01.2022 09:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CustOrdersDetail] @OrderID int,
@ProductID int
AS
SELECT P.ProductName AS ÜrünAdý,
    Od.UnitPrice AS BirimFiyat,
    Quantity AS Miktar,
    CONVERT(int, Discount * 100) AS Indirim, 
    ToplamFiyat=ROUND(CONVERT(money, (1 - Discount) * Quantity * Od.UnitPrice),2)
FROM Products P, [Order Details] AS Od
WHERE Od.ProductID = P.ProductID and Od.OrderID = @OrderID
AND Od.ProductID =@ProductID

--EXECUTE [CustOrdersDetail] 10248, 11
--select * from Products where ProductName= 'Queso Cabrales'
---------------------------------------------------------------------------------------
USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 21.01.2022 09:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID

--EXEC CustOrdersOrders 'VINET'

--Elimizdeki tüm ürünlerin toplam deðeri nedir? 
SELECT SUM (p.UnitsInStock * p.UnitPrice) AS ToplamTutar
FROM Products p 

-- Hangi þehirden kaç sipariþ geldi? 
--INNER JOIN'li bir de INNER Join'siz.
SELECT c.City ,Count(*) SipariþSayýsý
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.City;

SELECT c.City ,Count(*) SipariþSayýsý
FROM Customers c, Orders o
WHERE c.CustomerID = o.CustomerID
GROUP BY c.City;
-- Müþteri baþýna 10'dan fazla sipariþ olan müþteriler(CompanyName)
-- ve Sipariþ adetleri:
SELECT c.CompanyName, count(*) 
FROM Orders o, Customers c
WHERE o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
HAVING count(o.OrderID) > 10
ORDER BY 2 desc;

--  "Save-a-lot Markets" müþterisinin 31 Order'ýný listeleyin. 
select CustomerID FROM Customers WHERE CompanyName = 'Save-a-lot Markets'
SELECT * FROM Orders where CustomerID = 'SAVEA'

--  Herbir order'ýn kalem sayýlarý 
SELECT o.OrderID, Count(*) AS Sayi 
FROM Orders o, [Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID
--  Tüm orderlar'ýn kalem sayýlarý ortalamasý 
SELECT SUM(Sayi) , 
Count(*), ROUND(SUM(Sayi) / CAST(Count(*) AS float),3) 
FROM 
(
SELECT o.OrderID, Count(*) AS Sayi 
FROM Orders o, [Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID
) k
---------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER CAT_UPDATE 
   ON  Categories
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @NewCat nvarchar(15);
	DECLARE @OldCat nvarchar(15);
	SELECT @OldCat = CategoryName from deleted;
	SELECT @NewCat = CategoryName from inserted;
    
	INSERT INTO Categories_HIST(CategoryId,CategoryName,OldCategoryName,
	NewCategoryName, Tarihsaat)
	SELECT CategoryId,CategoryName,@OldCat,
	@NewCat, GetDate()
	FROM Deleted;

	--UPDATE Categories SET CategoryName = 'Tuzlular'
	where CategoryName = 'Tatlýlar'        

END
GO
---------------------------------------------------------------------------------------


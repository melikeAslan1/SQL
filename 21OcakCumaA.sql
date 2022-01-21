
--Stored procedues





--Almanya'ya (Ship Country) yapýlan satýþlardan 
-- 200 dolardan fazla olanlarý CustomerId, ShipCity, TotalPrice
--bilgilerini yazdýran View:

CREATE OR ALTER VIEW Germany200 AS
SELECT ShipCountry,O.OrderID, 
SUM(od.UnitPrice * od.Quantity) AS Toplam
FROM Orders o, [Order Details] od
WHERE ShipCountry='Germany'
AND O.OrderID = od.OrderID
GROUP BY ShipCountry,O.OrderID
HAVING SUM(od.UnitPrice * od.Quantity) > 200 



-- Her bir category'de  kaç adet sipariþ var ve toplam tutarlarý
--CategoryName, Count of Sipariþ, SUM(UnitPrice and Quantity)
CREATE OR ALTER PROCEDURE [dbo].[CategoryOrders] 
AS
SELECT c.CategoryName, COUNT(o.OrderID) AS SipariþSayýsý, 
SUM(od.Quantity * od.UnitPrice) AS ToplamTutar
FROM Categories c, Orders o, [Order Details] od, Products p
WHERE o.OrderID = od.OrderID AND p.CategoryID = c.CategoryID
AND  od.ProductID = p.ProductID
GROUP BY c.CategoryName


--ProductID, ProductName bazýnda sipariþ adetleri(Quantity)
SELECT p.ProductID, p.ProductName, SUM(Quantity)
from [Order Details] 


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
CREATE TRIGGER CAT_Delete
   ON  Categories
   For DELETE
AS 
BEGIN
    SET NOCOUNT ON ;
	--SET NOCOUNT ON ;added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[Categories_HIST](CategoryID,CategoryName)
	SELECT CategoryID,CategoryName
	FROM DELETED;

	DECLARE @id INT;
	SELECT @id = CategoryID FROM DELETED;
	DELETE FROM Categories WHERE CategoryID=@id;
END
GO







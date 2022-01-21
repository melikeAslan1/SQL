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

SQL'e veri gönder

Private Sub CommandButton1_Click()
Dim baglan As New Connection
Dim rs As New Recordset
baglan.Open "provider= microsoft.ace.oledb.12.0;data source = C:\Users\A_GUNDESLI\Desktop\Duay Proje\proje.accdb;"
sql1 = "select * from Companies where Kimlik"
rs.Open sql1, baglan, adOpenKeyset, adLockPessimistic
son_satýr = Sheets(1).Cells(Rows.Count, "A").End(xlUp).Row
son_sutun = Sheets(1).Cells(2, Columns.Count).End(xlToLeft).Column
For j = 3 To son_satýr
rs.AddNew
For i = 1 To son_sutun
If Sheets(1).Cells(j, i) <> "" Then rs.Fields(i).Value = Sheets(1).Cells(j, i).Value
Next i
Next j
MsgBox "Gönderme Tamamlandý", vbInformation
rs.Update
rs.Close
baglan.Close
End Sub

SQL den veri al
Private Sub CommandButton2_Click()
Dim baglan As New Connection
Dim rs As New Recordset
baglan.Open "provider=microsoft.ace.oledb.12.0;data source =C:\Users\A_GUNDESLI\Desktop\Duay Proje\proje.accdb;"
aranan = Range("C3").Text
sorgu = "select Category,ÖzelID,FirmaAdý,FirmaAdýUzun,FirmaMerkezAdresi,FirmaDepoAdresi,IL,Ülke,WebSitesi,TelOfis,Mobil,Mobil2,Yetkili,YetkiliMobil,Mail,VergiDairesi from [Companies] 
where [FirmaAdý] =  '" & aranan & "'"
rs.Open "select * from Companies where FirmaAdý ='" & aranan & "'", baglan, adOpenKeyset, adLockPessimistic
For i = 1 To 24
If rs.Fields(i) <> "" Then Cells(3, i).Value = rs.Fields(i).Value
Next i
rs.Close
baglan.Close
End Sub

sql baðlantý metni:"provider=
microsoft.ace.oledb.12.0;data source=" & _
yol & ";extended properties=""Excel 12.0;hdr=yes"""


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
Count(*), SUM(Sayi) / CAST(Count(*) AS float) 
FROM 
(
SELECT o.OrderID, Count(*) AS Sayi 
FROM Orders o, [Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID
) k


 
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


USE [Northwind]
GO
/****** Object:  Trigger [dbo].[CAT_Delete]    Script Date: 21.01.2022 14:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[CAT_Delete]
   ON  [dbo].[Categories]
   For DELETE
AS 
BEGIN
    SET NOCOUNT ON ;
	--SET NOCOUNT ON ;added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[Categories_HST](CategoryID,CategoryName,Tarihsaat)
	SELECT CategoryID,CategoryName,GETDATE()
	FROM DELETED;

	DECLARE @id INT;
	SELECT @id = CategoryID FROM DELETED;
	DELETE FROM Categories WHERE CategoryID=@id;
	SELECT * FROM Categories Order By CategoryName;
	
END
GO

delete from Categories where CategoryID =10
select * from Categories_HST


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

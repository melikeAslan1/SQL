select * from View_ilk
select * from View_4

select * from [dbo].[View_8]

select * from View_ogrenci_ogretmen

--vw_weight ve View_ogrenci_ogretmen view leri yapýldý.

--View: Sanal tablo oluþturmamýzý saðlar. Karmaþýk ve uzun sorgularý view olarak tanýmladýðýmýz, detaylý sorgu bir tabloymuþçasýna veri çekilebilir.

select * from vw_weight


order lardan tarihi 1998 olan kayýtlarý calýþanlarýyla birlikte getiren view.

--view siz yapma..:
SELECT dbo.Orders.OrderID, dbo.Orders.CustomerID, dbo.Orders.EmployeeID, dbo.Orders.OrderDate, dbo.Orders.RequiredDate, dbo.Orders.ShippedDate, dbo.Orders.ShipVia, dbo.Orders.Freight, dbo.Orders.ShipName, dbo.Orders.ShipAddress, 
                  dbo.Orders.ShipCity, dbo.Orders.ShipRegion, dbo.Orders.ShipPostalCode, dbo.Orders.ShipCountry, dbo.Employees.LastName + '  ' + dbo.Employees.FirstName AS Çalýþan
FROM     dbo.Orders INNER JOIN
                  dbo.Employees ON dbo.Orders.EmployeeID = dbo.Employees.EmployeeID
				  WHERE OrderDate like '%1998%'
				  ORDER BY 1 desc

--view: USA e gönderilen sipariþler 






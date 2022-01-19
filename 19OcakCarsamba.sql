use Northwind;

-- T SQL
use Northwind;
declare @sayi int;
set @sayi =15;
--print @sayi;
select @sayi;

select sum(UnitPrice*Quantity)from [Order Details] where OrderID=10248

DECLARE @kategorisayisi int;
select @kategorisayisi =count(*)from Categories;
print @kategorisayisi;
select @kategorisayisi;

declare @sayi int;
set @sayi =11111;
print convert(nvarchar(6),@sayi)
select @sayi;

print getdate();


declare @s nvarchar(4);
set @s =try_convert(nvarchar(4),493);
print @s;


declare @sayi int;
select @sayi=cast(@s as int);
print @sayi;

declare @hece nvarchar(20);
select @hece=right('Veysel',3);  --saðdan üçünü al.
print @hece

declare @hece nvarchar(20);
select @hece=left('Veysel',3);
print @hece

select @hece =substring('Kadýköy',0,5);   --?
print @hece;

PRINT REPLICATE ('*', 20);

--DATE FONKSÝYONLARI

PRINT DATEDIFF (DD,'01.01.2022', GETDATE());
PRINT DATEDIFF (MM,'01.01.2022', GETDATE());
PRINT DATEDIFF (YY, '01.01.2020', GETDATE());

PRINT DAY(GETDATE());
PRINT MONTH(GETDATE());
PRINT YEAR(GETDATE());

PRINT EOMONTH(GETDATE());

SELECT 365+19;

PRINT UPPER ('Veysel');
PRINT LOWER ('Veysel');

PRINT ROUND(14.73857,2);
PRINT ROUND (2.5,0);

PRINT ASCII('Z');
PRINT CHAR(90);

PRINT STR(123456.12328,7,4);  --7 karakter sýnýrým var.       --burada kaldým çalýþmaya.

PRINT CHARINDEX('DAN','KADIKÖY MEYDANI');

PRINT LTRIM('                     KADIKÖY     5')  --SOLDAN BOÞLUKLARI SÝL.
PRINT  RTRIM('                    KADIKÖY      ') + '-'    --SAÐDAN BOÞLUKLARI SÝL.

DECLARE @durum nvarchar(10);
SET @durum ='hayýr';
SELECT CASE @durum 
WHEN 'evet' THEN 'Durum Evet' ELSE 'Durum Hayýr' END abc;


select ad,soyad,
CASE cinsiyet
WHEN 1 THEN 'Erkek' ELSE 'KADIN' END abc
from tb_ogrenci

select AD,SOYAD,
IIF (CINSIYET=1,'ERKEK','KADIN')CINSIYET
from  DB_test.dbo.tb_ogrenci;

--- doðum yýlý 1985 ten küçükse orta yaþlý, deðilse genç
select AD+' '+SOYAD,
if(DOGUMYILI<1985,'orta yaþlý','genç')
from  DB_test.dbo.tb_ogrenci;


--Sayý 100 den büyüktür, küçüktür
DECLARE @sayi2 int;
SET @sayi2=122;
if(@sayi2<100)
PRINT 'sayý 100' ' den küçüktür.';
ELSE
PRINT 'Sayý 100' ' den büyüktür.';


--döngüler

declare @sayac int;
set @sayac=10;
WHILE (@sayac>0)
BEGIN 
  PRINT @sayac;
  Set @sayac = @sayac-1;
  END;


  --1'den 10'a kadar saysýn.
  --Sayýnýn karesi 26'dan büyükse kessin.
  --sayýlarý yazdýrsýn.

  DECLARE @sayac int;
  Set @sayac=0;
  WHILE (@sayac<10)
  BEGIN
  SELECT @sayac=@sayac+1;

  IF(@sayac*@sayac>26)
  BEGIN
  PRINT 'Sayýnýn karesi 26' ' yý gecti.';
  BREAK; --
  END;
  PRINT @sayac;
  END;

  IF EXISTS(SELECT* FROM test.dbo.tb_ogrenci WHERE ad='Emine')
  PRINT 'bU ÖÐRENCÝ MEVCUT.'
  ELSE
  PRINT 'böyle bir öðrenci yok.'
  

  USE Northwind;
SELECT COUNT(*) FROM Customers;
SELECT SUM(p.UnitsInStock * p.UnitPrice) AS ToplamTutar FROM Products p;

select count(*) from Products p;
select avg(UnitPrice),min(UnitPrice),max(UnitPrice) from Products;

select UnitPrice from Products order by 1;

--group by
select a.CompanyName, a.Country from Customers a Order by 2;

--hangi ülkede kaç müþteri var.
select Country,count(*) [Müþteri Sayýsý] from Customers Group by Country order by 1;

-- having: sahip olan, gruplar arasýnda {}özelliðe sahip olanlarý getir.

--5ten büyük müþterisi olanlarý getir.
select Country,count(*) [Müþteri Sayýsý] from Customers  Group by Country having count(*)>5 order by 1 ;

--2 ve 11 arasý müþterisi olan ülkeler.
select Country,count(*) [Müþteri Sayýsý] from Customers  Group by Country having count(*) between 2 and 11 order by 1 ;

--hangi kategoriden kaç ürün var.
select a.CategoryID,a.CategoryName,
COUNT(*) as [Ürün Sayýsý],
(select c.Description from Categories c where c.CategoryID=a.CategoryID)AÇIKLAMA
FROM Categories a inner join Products b 
on a.CategoryID=b.CategoryID 
group by a.CategoryID,CategoryName
having COUNT(a.CategoryID)>10--10dan büyük olanlarý

select * from Products where CategoryID=7;
--her kategorideki ürünlerin toplam deðeri
select a.CategoryID,a.CategoryName,
Cast(SUM(b.UnitsInStock*b.UnitPrice) as nvarchar(30))+'$'[ÜRÜN DEÐERÝ]
FROM Categories a inner join Products b
on a.CategoryID=b.CategoryID 
group by a.CategoryID,CategoryName
order by 2


select SUM(b.UnitsInStock * b.UnitPrice) from Products b WHERE CategoryID=1

--Herbir üründen kaç adet sipariþ verilmiþ?
--Product ile Order Details eþleþtirilecek.
--Ürün ID, Ürün ismi,Sipariþ adedi.
SELECT a.ProductID, a.ProductName, SUM(Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   GROUP BY a.ProductID, a.ProductName
   ORDER BY 1 DESC

   -- Yukarýdaki sorguya ek, 1998 5. ay ve sonrasý 
   -- deðerleri bulunuz.
   -- Orders ile Order Details eþleþtirilecek.
   -- CategoryName de olsun. 
   SELECT a.ProductID, a.ProductName, d.CategoryName,
   SUM(b.Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   INNER JOIN [Orders] c
   ON b.OrderID = c.OrderID
   INNER JOIN Categories d
   ON a.CategoryID = d.CategoryID
   WHERE c.OrderDate > '1998-05-01' --'1998-05-01 00:00:00.000'
   GROUP BY a.ProductID, a.ProductName, d.CategoryName
   ORDER BY 1 DESC

   select * from [Order Details] where 
   ProductID = 39 AND
   OrderID IN (
   SELECT OrderID FROM Orders a 
   where a.OrderDate > '1998-05-01 00:00:00.000')








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
select @hece=right('Veysel',3);  --sa�dan ���n� al.
print @hece

declare @hece nvarchar(20);
select @hece=left('Veysel',3);
print @hece

select @hece =substring('Kad�k�y',0,5);   --?
print @hece;

PRINT REPLICATE ('*', 20);

--DATE FONKS�YONLARI

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

PRINT STR(123456.12328,7,4);  --7 karakter s�n�r�m var.       --burada kald�m �al��maya.

PRINT CHARINDEX('DAN','KADIK�Y MEYDANI');

PRINT LTRIM('                     KADIK�Y     5')  --SOLDAN BO�LUKLARI S�L.
PRINT  RTRIM('                    KADIK�Y      ') + '-'    --SA�DAN BO�LUKLARI S�L.

DECLARE @durum nvarchar(10);
SET @durum ='hay�r';
SELECT CASE @durum 
WHEN 'evet' THEN 'Durum Evet' ELSE 'Durum Hay�r' END abc;


select ad,soyad,
CASE cinsiyet
WHEN 1 THEN 'Erkek' ELSE 'KADIN' END abc
from tb_ogrenci

select AD,SOYAD,
IIF (CINSIYET=1,'ERKEK','KADIN')CINSIYET
from  DB_test.dbo.tb_ogrenci;

--- do�um y�l� 1985 ten k���kse orta ya�l�, de�ilse gen�
select AD+' '+SOYAD,
if(DOGUMYILI<1985,'orta ya�l�','gen�')
from  DB_test.dbo.tb_ogrenci;


--Say� 100 den b�y�kt�r, k���kt�r
DECLARE @sayi2 int;
SET @sayi2=122;
if(@sayi2<100)
PRINT 'say� 100' ' den k���kt�r.';
ELSE
PRINT 'Say� 100' ' den b�y�kt�r.';


--d�ng�ler

declare @sayac int;
set @sayac=10;
WHILE (@sayac>0)
BEGIN 
  PRINT @sayac;
  Set @sayac = @sayac-1;
  END;


  --1'den 10'a kadar says�n.
  --Say�n�n karesi 26'dan b�y�kse kessin.
  --say�lar� yazd�rs�n.

  DECLARE @sayac int;
  Set @sayac=0;
  WHILE (@sayac<10)
  BEGIN
  SELECT @sayac=@sayac+1;

  IF(@sayac*@sayac>26)
  BEGIN
  PRINT 'Say�n�n karesi 26' ' y� gecti.';
  BREAK; --
  END;
  PRINT @sayac;
  END;

  IF EXISTS(SELECT* FROM test.dbo.tb_ogrenci WHERE ad='Emine')
  PRINT 'bU ��RENC� MEVCUT.'
  ELSE
  PRINT 'b�yle bir ��renci yok.'
  

  USE Northwind;
SELECT COUNT(*) FROM Customers;
SELECT SUM(p.UnitsInStock * p.UnitPrice) AS ToplamTutar FROM Products p;

select count(*) from Products p;
select avg(UnitPrice),min(UnitPrice),max(UnitPrice) from Products;

select UnitPrice from Products order by 1;

--group by
select a.CompanyName, a.Country from Customers a Order by 2;

--hangi �lkede ka� m��teri var.
select Country,count(*) [M��teri Say�s�] from Customers Group by Country order by 1;

-- having: sahip olan, gruplar aras�nda {}�zelli�e sahip olanlar� getir.

--5ten b�y�k m��terisi olanlar� getir.
select Country,count(*) [M��teri Say�s�] from Customers  Group by Country having count(*)>5 order by 1 ;

--2 ve 11 aras� m��terisi olan �lkeler.
select Country,count(*) [M��teri Say�s�] from Customers  Group by Country having count(*) between 2 and 11 order by 1 ;

--hangi kategoriden ka� �r�n var.
select a.CategoryID,a.CategoryName,
COUNT(*) as [�r�n Say�s�],
(select c.Description from Categories c where c.CategoryID=a.CategoryID)A�IKLAMA
FROM Categories a inner join Products b 
on a.CategoryID=b.CategoryID 
group by a.CategoryID,CategoryName
having COUNT(a.CategoryID)>10--10dan b�y�k olanlar�

select * from Products where CategoryID=7;
--her kategorideki �r�nlerin toplam de�eri
select a.CategoryID,a.CategoryName,
Cast(SUM(b.UnitsInStock*b.UnitPrice) as nvarchar(30))+'$'[�R�N DE�ER�]
FROM Categories a inner join Products b
on a.CategoryID=b.CategoryID 
group by a.CategoryID,CategoryName
order by 2


select SUM(b.UnitsInStock * b.UnitPrice) from Products b WHERE CategoryID=1

--Herbir �r�nden ka� adet sipari� verilmi�?
--Product ile Order Details e�le�tirilecek.
--�r�n ID, �r�n ismi,Sipari� adedi.
SELECT a.ProductID, a.ProductName, SUM(Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   GROUP BY a.ProductID, a.ProductName
   ORDER BY 1 DESC

   -- Yukar�daki sorguya ek, 1998 5. ay ve sonras� 
   -- de�erleri bulunuz.
   -- Orders ile Order Details e�le�tirilecek.
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








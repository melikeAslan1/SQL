
SELECT DISTINCT replacementCost FROM film --distinct farkl� de�erleri getirir.
select distinct City, Country from [Customers] iki s�tun birlikte de�erleri farkl� olan.

select count(*) from actor WHERE firstName='Penelope'     --bu �art� sa�layan durumun say�s�.

select count (firstName) from actor where firstName LIKE 'A%'   --firstName yerine * da konuyor.

select count (distinct firstName) from actor

--uzun sorgular�n tekrar kullan�lmas� durumunda yeniden komut yazma y�k�nden kurtar�r bizi prosed�rler, k�smen nesne tabaml� dillerdeki s�n�f yap�s�n�n kar��l���d�r.
--prosed�r � g�ncelleyip farkl� �ekilde kullanabilirsin.


create procedure Deneme 
as
select * from dbo.kitap where kitapSayfa>150

select * from kitap

-- procedure cal��t�rmak i�in.
execute Deneme  yada exec Deneme

--mevcut prosed�r � d�zenlemek i�in.
Alture procedure Deneme 
as
select * from kitap where kitapSayfa>150

--silmek i�in
drop procedure Deneme

--parametre ile prosed�r tan�mlama.
create procedure Toplam(@sayi1 int, @sayi2 int, @sonuc int output)
as
set @sonuc=@sayi1+@sayi2


--prosed�r� kullanma
declare @t int
exec Toplam 4,7,@t output
print @t


create procedure carpim 
(@s1 int, @s2 int, @s3 int, @sonuc int output)
as
set @sonuc=@s1*@s2*@s3
print 'sonuc: ' + cast(@sonuc as varchar (3))

declare @a int 
exec carpim 4,2,5, @a output


create procedure kitapGetir (@renk varchar(10))
as
select * from kitap2 where KitapRenk=@renk

exec kitapGetir'ye�il'






SELECT DISTINCT replacementCost FROM film --distinct farklý deðerleri getirir.
select distinct City, Country from [Customers] iki sütun birlikte deðerleri farklý olan.

select count(*) from actor WHERE firstName='Penelope'     --bu þartý saðlayan durumun sayýsý.

select count (firstName) from actor where firstName LIKE 'A%'   --firstName yerine * da konuyor.

select count (distinct firstName) from actor

--uzun sorgularýn tekrar kullanýlmasý durumunda yeniden komut yazma yükünden kurtarýr bizi prosedürler, kýsmen nesne tabamlý dillerdeki sýnýf yapýsýnýn karþýlýðýdýr.
--prosedür ü güncelleyip farklý þekilde kullanabilirsin.


create procedure Deneme 
as
select * from dbo.kitap where kitapSayfa>150

select * from kitap

-- procedure calýþtýrmak için.
execute Deneme  yada exec Deneme

--mevcut prosedür ü düzenlemek için.
Alture procedure Deneme 
as
select * from kitap where kitapSayfa>150

--silmek için
drop procedure Deneme

--parametre ile prosedür tanýmlama.
create procedure Toplam(@sayi1 int, @sayi2 int, @sonuc int output)
as
set @sonuc=@sayi1+@sayi2


--prosedürü kullanma
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

exec kitapGetir'yeþil'





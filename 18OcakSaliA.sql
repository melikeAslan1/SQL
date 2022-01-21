

begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad= 'Ezgi'
Rollback

select * from tb_ogretmen

select * from tb_ogrenci

select AD, SOYAD from test.dbo.tb_Ogrenci

/* ID si 1 olan öðretmenin adýný Hasan Can yapýn.   */

Update tb_Ogretmen set ad='Hasan Can' where ID=1

--tb_ogretmen tablosunda, tüm kayýtlarýn alanlarýný 1 artýrýn.

update tb_Ogretmen set alan = alan+1

--çalýþma(myself) ---------------------------------------------------------------
select * from tb_ogrenci
select * from tb_ogrenci where ad like 'N%'
update tb_ogrenci set ad='melike', soyad='aslan', telefon=0531 where ad='Özge'
select * from tb_ogrenci order by 4 desc

select FROM tb_ogrenci a

----------------------------------------------------------------------------------

select * from tb_Ogretmen order by sira DESC     --ORDER BY küçükten büyüðe doðru sýralar.  DESC eklersen büyükten küçüðe doðru sýralar.

--alan=2 olanlarý alan=4 yapýnýz

update tb_Ogretmen set alan=7, sira=sira+1 WHERE alan=4

select * from tb_Alan
insert into tb_Alan (ad) VALUES ('Uzay Bilimleri')  --sor

select*from tb_Ogretmen
INSERT INTO tb_Ogretmen (ad,soyad,telefon,alan)
VALUES ('Þükrü', 'Çil', 506743,7)

select * from tb_ogretmen order by sira

SELECT * FROM tb_sinif2 

insert into tb_sinif2 (ad,kat) VALUES ('303',3)

--delete

begin transaction

delete from tb_ogrenci where sinifID=2;

select * from tb_ogrenci

rollback


------------------------------------------------------- bu kýsmý çalýþ-------------------------------------
select * from tb_ogrenci
ALTER TABLE tb_ogrenci ADD takim nvarchar(50) NULL;   --yeni kolon
--Tip deðiþtirme:
ALTER TABLE tb_ogrenci ALTER COLUMN takim bigint NULL;
-- Drop etme
select * from tb_ogrenci

ALTER TABLE tb_ogrenci DROP Column takim; 

--JOIN
select * from tb_ogretmen b INNER JOIN tb_ogrenci a
ON a.ogretmenID=b.ID;

--ögrenci bilgileri yazacak artý sýnýf adý
select a.ad, b.AD  FROM tb_ogrenci a INNER JOIN tb_sinif2 b
ON a.sinifID=b.ID

--delete
begin transaction
delete from tb_ogrenci
rollback
select * from tb_ogrenci


--Öðrencinin adý soyadý Sýnýf Adý ve Öðretmeninin ad soyadý:
select a.ad AS [Öðrenci Ad], a.soyad [Öðrenci SoyAd],
b.AD [Sýnýf Ad], c.ad [Öðretmen Ad], c.soyad [Öðretmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif2 b
ON a.sinifID = b.ID INNER JOIN tb_Ogretmen c ON a.OgretmenID = c.ID

---------------------------------------------------------------------------------------------------------------

UPDATE tb_Alan SET ad='Elektrik Elektronik' WHERE ID=5
select * from tb_Alan

--alan tablosu en alta mekatronik ekle.
insert into tb_Alan 

--öðrenci tablosunda kac kayýt var
select count(*) as sayi from tb_ogrenci where ad like '_e%' 
select* from tb_ogrenci where ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'

-- boþalan sýnýflarý da birleþtirmeye ekliyor.   INNER JOIN her ikisinde de olucak. öyle getiriyor.   LEFT JOIN null lý olaný da getirir.
select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a LEFT JOIN tb_sinif2 b 
ON a.sinifID= b.ID

--INNER JOIN li
select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a INNER JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a RIGHT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a FULL OUTER JOIN tb_sinif2 b 
ON a.sinifID= b.ID












begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad= 'Ezgi'
Rollback

select * from tb_Ogretmen

select * from tb_ogrenci

select AD, SOYAD from test.dbo.tb_Ogrenci

/* ID si 1 olan öðretmenin adýný Hasan Can yapýn.   */

Update tb_Ogretmen set ad='Hasan Can' where ID=1

--tb_ogretmen tablosunda, tüm kayýtlarýn alanlarýný 1 artýrýn.

update tb_Ogretmen set alan = alan+1

update tb_Ogretmen set alan = alan+1;

select * from tb_Ogretmen order by sira DESC     --ORDER BY küçükten büyüðe doðru sýralar.  DESC eklersen büyükten küçüðe doðru sýralar.

--alan=2 olanlarý alan=4 yapýnýz

update tb_Ogretmen set alan=7, sira=sira+1 WHERE alan=4

select * from tb_Alan
insert into tb_Alan (ad) VALUES ('Uzay Bilimleri')  --sor

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
ALTER TABLE tb_ogrenci ADD takim nvarchar(50) NULL;--yeni kolon
--Tip deðiþtirme:
ALTER TABLE tb_ogrenci ALTER COLUMN takim bigint NULL;
-- Drop etme
ALTER TABLE tb_ogrenci DROP Column takim; 

--JOIN
select * from tb_ogrenci a INNER JOIN tb_ogretmen b
ON a.OGRETMEN=b.ID;
--ögrenci bilgileri yazacak artý sýnýf adý
select a.* , b.ad from tb_ogrenci a INNER JOIN tb_sinif b
ON a.SINIF=b.ID;

--delete
begin transaction
delete from tb_ogrenci
rollback
select * from tb_ogrenci


--Öðrencinin adý soyadý Sýnýf Adý ve Öðretmeninin ad soyadý:
select a.ad [Öðrenci Ad], a.soyad [Öðrenci Ad],
b.ad [Sýnýf Ad], c.ad [Öðretmen Ad], c.soyad [Öðretmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif b
ON a.sinifID = b.ID INNER JOIN DB_Test.[dbo].[tb_Ogretmen] c ON a.ogretmenID = c.ID

---------------------------------------------------------------------------------------------------------------

UPDATE tb_Alan SET ad='Elektrik Elektronik' WHERE ID=5
select * from tb_Alan

--alan tablosu en alta mekatronik ekle.
insert into tb_Alan 

--öðrenci tablosunda kac kayýt var
select count(*) from tb_ogrenci where ad like '_e%'
select* from tb_ogrenci where ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'

-- boþalan sýnýflarý da birleþtirmeye ekliyor.   INNER JOIN her ikisinde de olucak. öyle getiriyor.   LEFT JOIN null lý olaný da getirir.
select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a LEFT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a RIGHT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [Öðrenci Ad], a.soyad [Öðrenci Soyad],
b.ad [Sýnýf Ad]
from tb_ogrenci a FULL OUTER JOIN tb_sinif2 b 
ON a.sinifID= b.ID










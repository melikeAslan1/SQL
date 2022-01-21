

begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad= 'Ezgi'
Rollback

select * from tb_ogretmen

select * from tb_ogrenci

select AD, SOYAD from test.dbo.tb_Ogrenci

/* ID si 1 olan ��retmenin ad�n� Hasan Can yap�n.   */

Update tb_Ogretmen set ad='Hasan Can' where ID=1

--tb_ogretmen tablosunda, t�m kay�tlar�n alanlar�n� 1 art�r�n.

update tb_Ogretmen set alan = alan+1

--�al��ma(myself) ---------------------------------------------------------------
select * from tb_ogrenci
select * from tb_ogrenci where ad like 'N%'
update tb_ogrenci set ad='melike', soyad='aslan', telefon=0531 where ad='�zge'
select * from tb_ogrenci order by 4 desc

select FROM tb_ogrenci a

----------------------------------------------------------------------------------

select * from tb_Ogretmen order by sira DESC     --ORDER BY k���kten b�y��e do�ru s�ralar.  DESC eklersen b�y�kten k����e do�ru s�ralar.

--alan=2 olanlar� alan=4 yap�n�z

update tb_Ogretmen set alan=7, sira=sira+1 WHERE alan=4

select * from tb_Alan
insert into tb_Alan (ad) VALUES ('Uzay Bilimleri')  --sor

select*from tb_Ogretmen
INSERT INTO tb_Ogretmen (ad,soyad,telefon,alan)
VALUES ('��kr�', '�il', 506743,7)

select * from tb_ogretmen order by sira

SELECT * FROM tb_sinif2 

insert into tb_sinif2 (ad,kat) VALUES ('303',3)

--delete

begin transaction

delete from tb_ogrenci where sinifID=2;

select * from tb_ogrenci

rollback


------------------------------------------------------- bu k�sm� �al��-------------------------------------
select * from tb_ogrenci
ALTER TABLE tb_ogrenci ADD takim nvarchar(50) NULL;   --yeni kolon
--Tip de�i�tirme:
ALTER TABLE tb_ogrenci ALTER COLUMN takim bigint NULL;
-- Drop etme
select * from tb_ogrenci

ALTER TABLE tb_ogrenci DROP Column takim; 

--JOIN
select * from tb_ogretmen b INNER JOIN tb_ogrenci a
ON a.ogretmenID=b.ID;

--�grenci bilgileri yazacak art� s�n�f ad�
select a.ad, b.AD  FROM tb_ogrenci a INNER JOIN tb_sinif2 b
ON a.sinifID=b.ID

--delete
begin transaction
delete from tb_ogrenci
rollback
select * from tb_ogrenci


--��rencinin ad� soyad� S�n�f Ad� ve ��retmeninin ad soyad�:
select a.ad AS [��renci Ad], a.soyad [��renci SoyAd],
b.AD [S�n�f Ad], c.ad [��retmen Ad], c.soyad [��retmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif2 b
ON a.sinifID = b.ID INNER JOIN tb_Ogretmen c ON a.OgretmenID = c.ID

---------------------------------------------------------------------------------------------------------------

UPDATE tb_Alan SET ad='Elektrik Elektronik' WHERE ID=5
select * from tb_Alan

--alan tablosu en alta mekatronik ekle.
insert into tb_Alan 

--��renci tablosunda kac kay�t var
select count(*) as sayi from tb_ogrenci where ad like '_e%' 
select* from tb_ogrenci where ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'

-- bo�alan s�n�flar� da birle�tirmeye ekliyor.   INNER JOIN her ikisinde de olucak. �yle getiriyor.   LEFT JOIN null l� olan� da getirir.
select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a LEFT JOIN tb_sinif2 b 
ON a.sinifID= b.ID

--INNER JOIN li
select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a INNER JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a RIGHT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a FULL OUTER JOIN tb_sinif2 b 
ON a.sinifID= b.ID












begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad= 'Ezgi'
Rollback

select * from tb_Ogretmen

select * from tb_ogrenci

select AD, SOYAD from test.dbo.tb_Ogrenci

/* ID si 1 olan ��retmenin ad�n� Hasan Can yap�n.   */

Update tb_Ogretmen set ad='Hasan Can' where ID=1

--tb_ogretmen tablosunda, t�m kay�tlar�n alanlar�n� 1 art�r�n.

update tb_Ogretmen set alan = alan+1

update tb_Ogretmen set alan = alan+1;

select * from tb_Ogretmen order by sira DESC     --ORDER BY k���kten b�y��e do�ru s�ralar.  DESC eklersen b�y�kten k����e do�ru s�ralar.

--alan=2 olanlar� alan=4 yap�n�z

update tb_Ogretmen set alan=7, sira=sira+1 WHERE alan=4

select * from tb_Alan
insert into tb_Alan (ad) VALUES ('Uzay Bilimleri')  --sor

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
ALTER TABLE tb_ogrenci ADD takim nvarchar(50) NULL;--yeni kolon
--Tip de�i�tirme:
ALTER TABLE tb_ogrenci ALTER COLUMN takim bigint NULL;
-- Drop etme
ALTER TABLE tb_ogrenci DROP Column takim; 

--JOIN
select * from tb_ogrenci a INNER JOIN tb_ogretmen b
ON a.OGRETMEN=b.ID;
--�grenci bilgileri yazacak art� s�n�f ad�
select a.* , b.ad from tb_ogrenci a INNER JOIN tb_sinif b
ON a.SINIF=b.ID;

--delete
begin transaction
delete from tb_ogrenci
rollback
select * from tb_ogrenci


--��rencinin ad� soyad� S�n�f Ad� ve ��retmeninin ad soyad�:
select a.ad [��renci Ad], a.soyad [��renci Ad],
b.ad [S�n�f Ad], c.ad [��retmen Ad], c.soyad [��retmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif b
ON a.sinifID = b.ID INNER JOIN DB_Test.[dbo].[tb_Ogretmen] c ON a.ogretmenID = c.ID

---------------------------------------------------------------------------------------------------------------

UPDATE tb_Alan SET ad='Elektrik Elektronik' WHERE ID=5
select * from tb_Alan

--alan tablosu en alta mekatronik ekle.
insert into tb_Alan 

--��renci tablosunda kac kay�t var
select count(*) from tb_ogrenci where ad like '_e%'
select* from tb_ogrenci where ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'

-- bo�alan s�n�flar� da birle�tirmeye ekliyor.   INNER JOIN her ikisinde de olucak. �yle getiriyor.   LEFT JOIN null l� olan� da getirir.
select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a LEFT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a RIGHT JOIN tb_sinif2 b 
ON a.sinifID= b.ID


select a.ad [��renci Ad], a.soyad [��renci Soyad],
b.ad [S�n�f Ad]
from tb_ogrenci a FULL OUTER JOIN tb_sinif2 b 
ON a.sinifID= b.ID










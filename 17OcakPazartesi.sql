select * from tb_Ogrenci;
select SOYAD,AD from test.dbo.tb_ogrenci;
/* Databesead�.dbo.tabload� */
select * from tb_Ogrenci where AD='Ela';
select * from tb_Ogrenci where sinifID=2; /* AND OGRETMEN=2 yaparsak 2 ki�i g�sterir. �u durumda 3 ki�i g�sterir*/
/* Delete from tb_ogrenci where AD='Ela'; Ad� Ela olan b�t�n verileri sat�rlar� siler.*/ -- ve // b�t�n sat�r� a��klama sat�r�na d�n��t�r�r.
select * from tb_Ogrenci order  by AD desc;  /* desc z den a ya s�ralar */
select * from tb_Ogrenci order  by 1 ; /* 1. kolona g�re s�ralama yapar.*/
select * from tb_Ogrenci (NOLOCK) order  by 3; /* NOLOCK kay�d� kilitlemez.*/
select  top 4 * from tb_Ogrenci order by 6 asc; /* 1999 dan ba�layarak ilk 4 � yazar.*//* ASC X DESC */
select * from tb_Ogrenci where ID BETWEEN 5 AND 9 ORDER BY 1
SELECT * FROM tb_Ogrenci WHERE ID>=5 AND ID<=9 ORDER BY 1
SELECT * FROM tb_Ogrenci WHERE ogretmenID IN (2,3)
SELECT * FROM tb_Ogrenci WHERE AD LIKE 'F%' /*AD �LK HARF� F OLANLARI GET�R�R.*/
SELECT * FROM tb_Ogrenci WHERE SOYAD LIKE '____e%' /* 5inci karakteri e olanlar� getirir.*/
SELECT * FROM tb_Ogrenci WHERE AD LIKE '%a%'  /* ad k�s�mda a karakteri bulunan b�t�n verileri getirir.*/

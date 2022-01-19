select * from tb_Ogrenci;
select SOYAD,AD from test.dbo.tb_ogrenci;
/* Databeseadý.dbo.tabloadý */
select * from tb_Ogrenci where AD='Ela';
select * from tb_Ogrenci where sinifID=2; /* AND OGRETMEN=2 yaparsak 2 kiþi gösterir. Þu durumda 3 kiþi gösterir*/
/* Delete from tb_ogrenci where AD='Ela'; Adý Ela olan bütün verileri satýrlarý siler.*/ -- ve // bütün satýrý açýklama satýrýna dönüþtürür.
select * from tb_Ogrenci order  by AD desc;  /* desc z den a ya sýralar */
select * from tb_Ogrenci order  by 1 ; /* 1. kolona göre sýralama yapar.*/
select * from tb_Ogrenci (NOLOCK) order  by 3; /* NOLOCK kayýdý kilitlemez.*/
select  top 4 * from tb_Ogrenci order by 6 asc; /* 1999 dan baþlayarak ilk 4 ü yazar.*//* ASC X DESC */
select * from tb_Ogrenci where ID BETWEEN 5 AND 9 ORDER BY 1
SELECT * FROM tb_Ogrenci WHERE ID>=5 AND ID<=9 ORDER BY 1
SELECT * FROM tb_Ogrenci WHERE ogretmenID IN (2,3)
SELECT * FROM tb_Ogrenci WHERE AD LIKE 'F%' /*AD ÝLK HARFÝ F OLANLARI GETÝRÝR.*/
SELECT * FROM tb_Ogrenci WHERE SOYAD LIKE '____e%' /* 5inci karakteri e olanlarý getirir.*/
SELECT * FROM tb_Ogrenci WHERE AD LIKE '%a%'  /* ad kýsýmda a karakteri bulunan bütün verileri getirir.*/

--Trigger: Bir tabloda gerçekleþen sorgu sonucuna göre baþka bir sorgunun çalýþmasýný saðlayan sql komutu.

--Procedure den farký kullanýcý tarafýndan tetiklenmemesidir.

--Trigger iki þekilde çalýþýr yani tetiklenir: Ýlki ana sorguyu engellemek (instead of), ikincisi birlikte çalýþmak (after-for).

--örneðin kitap tablosuna kitap ekledim stok tablosunun da deðiþmesini isterim bunu trigger la yaparým.

create trigger KitapTrigger
on Kitap2
After insert 
as
Begin
Select 'Yeni bir kitap kaydý yapýldý' 
End

insert into Kitap2 values ('insan ne ile yasar','hikaye','eeee','yesil',8)





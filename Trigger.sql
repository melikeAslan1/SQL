--Trigger: Bir tabloda ger�ekle�en sorgu sonucuna g�re ba�ka bir sorgunun �al��mas�n� sa�layan sql komutu.

--Procedure den fark� kullan�c� taraf�ndan tetiklenmemesidir.

--Trigger iki �ekilde �al���r yani tetiklenir: �lki ana sorguyu engellemek (instead of), ikincisi birlikte �al��mak (after-for).

--�rne�in kitap tablosuna kitap ekledim stok tablosunun da de�i�mesini isterim bunu trigger la yapar�m.

create trigger KitapTrigger
on Kitap2
After insert 
as
Begin
Select 'Yeni bir kitap kayd� yap�ld�' 
End

insert into Kitap2 values ('insan ne ile yasar','hikaye','eeee','yesil',8)





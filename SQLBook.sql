-- Üyeler kütüphaneden belirlenen sayıda kitabı alabilecek , belirlenen zaman da kitabı bırakabicek ve cezaya tabii tutulabilecek

-- her üye 3 kitap alabilir bir kitap 7 gün içerisinde teslim edilmelidir.

Create table Uye(
ID int PRIMARY KEY IDENTITY (1,1),
Ad Nvarchar (max),
Soyad nvarchar (max),
)

select * from Uye
insert into Uye(Ad,Soyad) values('Kaan','YALIN')

Create table Kitap(
ID int PRIMARY KEY IDENTITY (1,1),
Ad nvarchar(max),
YayınlamaTarihi DATE 
)


create table uyekitap(
UyeID int ,
KitapID int,
AlisTarihi date,
TeslimTarihi date
)

create table Ceza(
UyeKitapID int,
CezaUcret money,
)

-- Personel Fabrika 

-- Personel bu ay kaç kez gebze fabrikasına gitmiş

-- Personel bu ay kaç kez gecikmiş

Create Table Personel(
ID int PRIMARY KEY IDENTITY (1,1),
Ad nvarchar (15),
Soyad Nvarchar (15)
)

Create Table Fabrika(
ID int PRIMARY KEY IDENTITY (1,1),
Ad nvarchar (15),
)

create Table Lokasyon (
ID int PRIMARY KEY IDENTITY (1,1),
Ad nvarchar (max),
lokasyon nvarchar (max)
)

create table PersonelLog(
    id int PRIMARY KEY IDENTITY(1,1),
    personelId int
    inDate DATETIME,
    outDate DATETIME,
    fabrikaId INT
)

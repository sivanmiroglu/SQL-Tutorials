-- store proc, trigger, transaction, function, view
--one to many bire bir
--Bir kullanıcının birden fazla adresi olabilir. Bir adres SADECE BİR KULLANICIYA AİTTİR

CREATE TABLE WebUser(
    ID int PRIMARY KEY IDENTITY (1, 1),
    FirstName NVARCHAR(MAX) NOT NULL,
    LastName NVARCHAR(MAX),
    Phone NVARCHAR(MAX) 
)

CREATE TABLE WebUserAddress(
    ID int PRIMARY KEY IDENTITY(1,1),
    Street NVARCHAR(MAX),
    City NVARCHAR(MAX),
    Country NVARCHAR(MAX),
    WebUserID int
)

-- Kullanıcın Adı, Soyadı, Şehri

select 
w.FirstName,
w.LastName,
wua.City
from WebUser w
inner join WebUserAddress wua
on w.ID = wua.WebUserID

--ID si 2 olan kullanıcının kaç adresi var?
select COUNT(*) from WebUserAddress where WebUserID = 2


--Bir yazarın birden fazla kitabı olabilir. Bir kitap birden çok yazar tarafından yazılabilir

CREATE TABLE Author(
    ID int PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(MAX),
    LastName NVARCHAR(MAX),
    BirthDate Date
)

CREATE TABLE Book(
    ID int PRIMARY KEY IDENTITY(1,1), -- ID 1 den başlayacak ve birer birer artacak
    BookName NVARCHAR(MAX),
    PublishDate Date
)
-- Hangi kitabıon hangi yazara ait olduğunu     many to many  bire çok 
CREATE TABLE BookAuthor(
    BookID int,
    AuthorID int
)

--Kitabın Adı, Yazarının Adı, Yazarının Soyadı
select 
b.BookName,
a.FirstName,
a.LastName
from BookAuthor ba
inner join Author a
on ba.AuthorID = a.ID
inner join Book b
on b.ID = ba.BookID





--Category tablosuna insert at

insert into Categories(CategoryName, Description)
values('Electronic', 'Electronic products')

--Store Procedure
--ürün adı, kategori adı ve ürünün fiyatını bana veren sorguyu versin
--create anahatar kelimesi ile oluşturduk. Sadece başlarken oluşturup create kullanırız. Daha sonra yapılan işlemler için alter kullanırız.
--alter veri eklemek veya güncellemek için kullanırız 
--drop anahtar kelimesi SQL objesini silmemizi sağlar. yani drop kullandığımız yerde kayıtlı olan o veriyi sileriz.

alter procedure sp_ProductCatList
as
begin
select 
p.ProductName, 
c.CategoryName, 
p.UnitPrice,
p.UnitsInStock
from Products as p
inner join Categories as c
on p.CategoryID = c.ID
end
exec sp_ProductCatList

-- Dışarıdan bir fiyat alan ve o fiyattan büyük ürünleri tablo olarak veren store procedure

alter procedure sp_ProductListByPrice(@price money)
as
begin
select * from Products where UnitPrice > @price
end
exec sp_ProductListByPrice 20

--Dışarıdan categoryName ve description alan ve aldığı deðerleri büyütüp category tablosuna insert eden store procedure
--Eðer böyle bir kategori varsa insert ETME (name alanından kontrol et)

alter procedure sp_InsertCategory(@name nvarchar(max), @desc nvarchar(max))
as
begin
--kategorinin olup olmadığına bakıyoruz
declare @categoryCount int

set @categoryCount = (select COUNT(*) from Categories where CategoryName = @name)
if(@categoryCount = 0)
begin
insert into Categories(CategoryName,Description) values(@name, @desc)
end
else
begin
print('Böyle bir kategori mevcut')
end

end

exec sp_InsertCategory 'Camp', 'Camp products'


--IF EXISTS ile bir select sonucunun olup olmadığını kontrol edebilirsiniz
IF EXISTS(select * from Categories where ID = 1)
begin
print('Böyle bir kategori mevcut!')
end

insert into Categories(CategoryName, Description) values('Sport', 'Sport products')
select @@IDENTITY
select IDENT_CURRENT('Products')


--Dışarıdan companyName, ProductName ve UnitPrice alan
-- Eðer CompanyName Supplier tablosunda varsa o companyin ID sini (SupplieID) product a verecek yoksa yeni supplier oluþturacak ve onun id sini product a verecek

alter procedure sp_addProductWithCompanyName(@productName nvarchar(MAX), @unitPrice money, @companyName nvarchar(MAX))
as
begin

--bu isimde bir companyName e sahip olan Supplier var mı?

declare @supplierID int

if EXISTS(select * from Suppliers where CompanyName = @companyName)
begin
set @supplierID = (select SupplierID from Suppliers where CompanyName = @companyName)
end
else
begin
insert into Suppliers(CompanyName) values(@companyName)
set @supplierID = @@IDENTITY -- @@ıdentıty ile ıd sini aldık. yani eklenen son ıd yi gösterdik
end

insert into Products(ProductName,UnitPrice,SupplierID) values(@productName, @unitPrice, @supplierID)

end

exec sp_addProductWithCompanyName 'Siemens-2',2000,'DEU Products'


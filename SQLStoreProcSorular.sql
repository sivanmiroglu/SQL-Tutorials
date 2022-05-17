-- 1 -) Dışarıdan CompanyName,ContanctName ve ContactTitle alan ve yeni bir supplier ekleyen store procedure
 
 -- Başlarken create procedure yazıyoruz AMA!
 -- Güncelleme veya ekleme yapacaksak alter yapıp execute yapıp çalıştırıyoruz !!!
create procedure sp_AddNewSupplier(@CompanyName nvarchar(max), @contactName nvarchar(max), @contactTitle nvarchar(max))
as
begin
insert into Suppliers(CompanyName, ContactName, ContactTitle) values(@CompanyName, @contactName, @contactTitle)
end

-- 2-) Dışarıdan stok adedi alan ve o stok adedinin altında ürünleri select olarak yazan store procedure

create procedure sp_ListProducts(@stocks int)
as
begin
select * from Products where UnitsInStock < @stocks
end

execute sp_ListProducts 10

-- 3-) Dışarıdan bir ürün adı alan, ürün varsa 1 yoksa 0 print eden store procedure

create procedure sp_AddProductName(@ProductName nvarchar(MAX))
as 
begin 
IF EXISTS(select * from Products where ProductName = @ProductName)
begin
print ('1')
end
else
begin
print ('0')
end

end

exec sp_AddProductName chang

--4) Ürün ekleyen bir store proc yazacağız. dışarıdan ad, fiyat ve stok alacak.
--Kurallar
--Stok 5 den küçükse ekrana 'Stok adedi 5 den küçük olan ürün EKLENEMEZ' yazsın
--Fiyat 200 den büyükse %10 indirim yapýp eklenecek deðilse ayný ücreti yazsın

create procedure sp_addProductWithRules(@name nvarchar(MAX) ,@price money ,@stock int)
as
begin
if(@stock < 5)
begin
print('Stok adedi 5 den küçük olan ürün EKLENEMEZ')
end
else
begin
declare @newPrice money

if(@price > 200)
begin
set @newPrice = @price * 0.9
end
else
begin
set @newPrice = @price
end

insert into Products(ProductName, UnitPrice, UnitsInStock)
values(@name, @newPrice, @stock)
end
end


exec sp_addProductWithRules 'IPhone',1000,55


select top 1 * from Products order by ProductID desc

--5) Dışarıdan yıl ve ay alan ve buna göre Siparişleri (orderDate) tarihe göre tersten sıralayıp bana veren store procedure

create procedure sp_GetOrdersByDateFilter(@year int, @month int)
as
begin
select * from Orders where YEAR(OrderDate) = @year and MONTH(OrderDate) = @month
order by OrderDate desc
end

exec sp_GetOrdersByDateFilter 1996, 10



--6) 
-- Dışarıdan yıl alan ve aldığı yıla göre OrderID, Customerın companyName i, Customer ın Contact title
-- ve Siparişin TOPLAM TUTARI şeklinde 4 kolonu bana veren store procedure

create procedure sp_GetOrdersDetailByYear(@year int)
as
begin
select
o.OrderID,
c.CompanyName,
c.ContactTitle,
SUM(od.Quantity * od.UnitPrice)
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
where YEAR(o.OrderDate) = @year
group by o.OrderID, c.CompanyName, c.ContactTitle
end
exec sp_GetOrdersDetailByYear 1997

-- Geciken siparişleri bana veren store procedure

create proc sp_DelayOrders
as
begin
select * from Orders where RequiredDate < ShippedDate
end

exec sp_DelayOrders

--Kaç adet geciken sipariş olduğunu print eden store procedure

create proc sp_CountDelayOrders
as
begin
select Count(*) from Orders where RequiredDate < ShippedDate
end

declare @Count int
print (@Count)    -- print ile yazdırma şekli


exec sp_CountDelayOrders

-- Dışarıdan FirstName, LastName, Address ve City alan ona göre employee ekleyen store procedure

create procedure sp_InsertName(@FirstName nvarchar(MAX), @LastName nvarchar(MAX), @Address nvarchar(MAX), @City nvarchar(MAX))
as 
begin
insert into Employees(FirstName, LastName, Address, City)
values(@FirstName, @LastName, @Address, @City)
end

--Dışarıdan Name alan ve aldığı name e göre bulduğu product ı silen store procedure. büyük küçük harf farketmemeli ( hata verecek!)

create procedure sp_DeleteName(@name nvarchar(max))
as
begin
if exists(select * from Products where lower(ProductName) = lower(@name))
begin
delete from Products where lower(ProductName) = lower(@name)
end
end

exec sp_DeleteName 'Aniseed Syrup'
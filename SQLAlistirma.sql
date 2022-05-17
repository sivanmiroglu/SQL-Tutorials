-- ürünün adı ürünün fiyatı ÜRÜNÜN KATEGORİSİNİN ADI

select p.ProductName, p.UnitPrice, c.CategoryName from Products as p
inner join Categories as c
on p.CategoryID = c.ID

--as kullanmazsak tabloların adını yazarız aşağıdaki gibi
--select ProductName, UnitPrice, CategoryName from Products
--inner join Categories
--on Products.CategoryID = Categories.ID


-- Ürünün Adı Fiyatı Tedarikçinin Şehri
select ProductName, UnitPrice, CompanyName, City from Products
inner join Suppliers
on Products.SupplierID = Suppliers.SupplierID


-- London şehrinde  kaç adet ürün tedarik ediyorum.
select COUNT(*) [Toplam Ürün] from Products as p
inner join Suppliers as s
on p.SupplierID = s.SupplierID
where s.City = 'London'


--İspanyadan tedarik ettiğim ürünlerin adını, fiyatını ve tedarikçi firmanın adını yazdır

select p.ProductName, p.UnitPrice, s.CompanyName from Products as p
inner join Suppliers as s
on p.SupplierID=s.SupplierID
where LOWER (s.Country)='spain'  --lowers ile küçük büyük harf duyarlı hale getirdik


-- Almanyadaki müşterilerim kaç adet sipariş vermiş

select COUNT(*) from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
where LOWER( c.Country) = 'germany'

--En çok sipariş veren müşterinin adı
		
select top 3 o.CustomerID, COUNT(o.CustomerID) toplam from Orders o -- top 3 diyerek 3 tanesini al dedik.
group by o.CustomerID
order by toplam desc 


--10248 numaralı siparişin toplam tutarı nedir
select SUM(od.Quantity * od.UnitPrice) from [Order Details] as od
where OrderID = 10248

--10248 numaralı sipaşin ürünlerinin adını bana ver
select p.ProductName from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
where od.OrderID = 10248

-- BUGÜNE KADAR VERİLMİŞ EN YÜKSEK SİPARİŞİN ID si ve toplam tutar

select top 1 SUM(od.Quantity * od.UnitPrice), od.OrderID from [Order Details] as od --top 1 ile en yüksek 1 sipraişi ver 
group by od.OrderID order by od.OrderID desc


select SUM(od.Quantity * od.UnitPrice) ToplamTutar, od.OrderID from [Order Details] as od -- Toplam Tutar ve  en yüksek sipariş ID lerini listele
group by od.OrderID order by ToplamTutar desc



--1996 yılındaki siparişleri getir
select * from Orders where YEAR(OrderDate) = 1996


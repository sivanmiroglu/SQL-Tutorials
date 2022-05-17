-- SQL SORGU KOMUTLARI

-- Suppliers içindeki Tüm verileri getir

select * from Suppliers

select * from Customers order by ContactName desc

-- Suppliers içindeki ContactName ve ContactTitle adındaki verileri getir.

select ContactName, ContactTitle, Region from Suppliers

-- Products içindeki fiyatı 20 den büyük olan verileri getir.

select * from Products where UnitPrice > 20

-- Fiyatı 20 den büyük olan ve stoğu 10 dan büyük olan verilei getir.

select * from Products where UnitPrice > 20 and UnitsInStock > 10

-- Kategori ıd si 3 olan ve fiyatı 100 den küçük olanları getir.

select * from Products where CategoryID = 3 or UnitPrice <=100

-- ilk 10 veriyi getir

select top 10 * from Products

-- fiyatı 20 den büyük olan ilk 5 veriyi getir.

select top 5 * from Products where UnitPrice > 20

-- a harfi ile başlayan verileri getir.

select * from Products where ProductName like 'a%'

-- içerisinde a harfi olan verileri listele

select * from Products where ProductName like '%a%'

-- içerisinde e harfi olanları litele ve kategori ıd si 3 olan veriyi getir.

select ProductName, CategoryID, UnitPrice from Products where ProductName like '%e%' and CategoryID = 3

-- toplam kaç verimiz olduğunu yaz

select COUNT(*) from Products

-- kategori ıd si 3 olan verilerin ortalamsını hesapla 

select AVG(UnitPrice) from Products where CategoryID = 3

-- ınsert metodu yani veri eklemeye yardımcı olur.- categoryname electronic adında veri ekle

insert into Categories(CategoryName, [Description])
values('Electronic', 'Electronic products')

-- Ürünleri ada göre sırala

select * from Products order by ProductName

--ürünleri ada göre tersten sırala

select * from Products order by ProductName desc

--Supplierları ad sırasına göre (A-Z) listele companyName

select * from Suppliers order by CompanyName

--Supplierları ad sırasına göre tersten listele (Z-A) companyName

select * from Suppliers order by CompanyName desc

--Ülkesi si UK olan supplierları listele

select * from Suppliers where Country ='UK'

--Ülkesi si UK olan supplierları listele (A-Z)

select * from Suppliers where Country ='UK' order by CompanyName

--Fiyatı 30 dan büyük kaç ürün var? ( COUNT(*) )

select COUNT(*) from Products where UnitPrice > 30

--Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele

select * from Products where   order by Unitprice 

--CompanyName ‘a’ harfi ile başlayan supplierların sadece adını ekrana yaz

select CompanyName from Suppliers where CompanyName like 'a%'

--İsmi a harfi ile başlayan VE fiyatı 20 den büyük eşit ürünleri isme göre listele

select * from Products where ProductName like 'a%' and UnitPrice >= 20

--Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır ( Employee)

select FirstName +' ' + LastName as Full_Name from Employees 

--Ürünün sadece KDV li fiyatını ekrana yazdır(tek kolon)

select (UnitPrice *1.18) as KdvDahil_Fiyati  from Products

--Region alanı NULL olan kaç tedarikçim var? ( Supplier ) ( İnternetten bakılmalı )

select Count(*)as NullRegionCount from Suppliers  where Region is null

--Null olmayanlar

select Count(*)as NotNullRegionCount from Suppliers  where Region is not null

--İlk 5 tedarikçimi getir - supplier

select top 5 * from Suppliers

--İlk 5 tedarikçimi getir. Sadece ID ve CompanyName yazsın - supplier

select top 5 SupplierID, CompanyName from Suppliers

--CompanyName e göre ilk 5 tedarikçimi getir ve ekrana sadece isimlerini yaz

select top 5 CompanyName from Suppliers order by CompanyName

--en ucuz 5 ürünü getir

select top 5 * from Products order by UnitPrice 

--En ucuz 5 ürünün ortalama fiyatı nedir?

select top 5 AVG(UnitPrice) as AvgPrice from Products

--Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.

select 'TR ' + UPPER(ProductName) from Products

﻿--Ürünleri ada göre sırala

select * from Products order by ProductName

--Ürünleri ada göre tersten sırala

select * from Products order by ProductName desc

--Ürün adı, fiyatı ve kdv ekrana yazdır

select ProductName, UnitPrice, UnitPrice * 0.18 from Products

--Fiyatı 20 den küçük ürünlerin adının başına TR ekle

select 'TR ' + ProductName, UnitPrice from Products where UnitPrice <20


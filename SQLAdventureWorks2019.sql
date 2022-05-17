select * from HumanResources.Employee
select * from HumanResources.Department
select * from HumanResources.EmployeeDepartmentHistory
select * from Person.Person

-- çalışanın adı soyadı doğum tarihi

select 
p.FirstName,
p.LastName,
e.BirthDate
from Person.Person p 
inner join HumanResources.Employee e 
on p.BusinessEntityID  = e.BusinessEntityID

--Çalışanın Adı, Soyadı, Telefon Numarası, Telefon numarasının tipi istiyorum

select 
pr.FirstName,
pr.LastName,
ph.PhoneNumber,
ph.PhoneNumberTypeID
from Person.Person pr 
inner join Person.PersonPhone ph
on pr.BusinessEntityID = ph.BusinessEntityID


--Çalışanın Adı, Soyadı, Telefon Numarası, Telefon numarasının tipi istiyorum
select p.FirstName, p.LastName , pp.PhoneNumber,pp.PhoneNumberTypeID from Person.Person p
inner join person.PersonPhone pp on pp.BusinessEntityID = p.BusinessEntityID
inner join HumanResources.EmployeeDepartmentHistory edh on edh.BusinessEntityID = p.BusinessEntityID
where edh.EndDate is null

-- Çalışanın Adı, Soyadı Departmanının Adı (son çalıştığı departman listelenecek)

select p.FirstName,p.LastName,hd.Name 
from Person.Person p
inner join HumanResources.EmployeeDepartmentHistory edh
on edh.BusinessEntityID = p.BusinessEntityID
inner join HumanResources.Department hd
on hd.DepartmentID = edh.DepartmentID
where edh.EndDate is null

-- Finance departmanında kaç adet çalışan var?

select COUNT(*) from Person.Person as p
inner join HumanResources.EmployeeDepartmentHistory as hed
on hed.BusinessEntityID=p.BusinessEntityID
inner join HumanResources.Department as hdep 
on hdep.DepartmentID=hed.DepartmentID
where hed.EndDate is null and hdep.DepartmentID='10'

--Satış Soruları

-- ADET BAZINDA en çok siparişi veren müşterimin Id si,

select top 1 CustomerID,count(SalesOrderID) SiparisSayisi from Sales.SalesOrderHeader group by CustomerID order by SiparisSayisi  desc


-- Bugüne kadar verilmiş en yüksek cirolu sipariş

select top 1 SUM(sd.OrderQty *(sd.UnitPrice *(1- sd.UnitPriceDiscount))) SiparisTutari,
sd.SalesOrderID from Sales.SalesOrderDetail sd group by sd.SalesOrderID order by SiparisTutari desc 


-- Sipariş cirolarımı TerriorityID ye göre grupla. 8, 564.000

select oh.TerritoryID, sum(oh.TotalDue) BolgeCiro from Sales.SalesOrderHeader oh group by oh.TerritoryID order by BolgeCiro desc 


-- Kaç adet sipariş gecikti?

select COUNT(*) Gecikme from Sales.SalesOrderHeader oh where oh.DueDate < oh.ShipDate

-- En çok siparişim hangi bölgeye gecikti ve kaç adet?

select TerritoryID ,count (*) GecikmeSayisi from Sales.SalesOrderHeader oh
where oh.DueDate < oh.ShipDate group by TerritoryID

-- Vista kredi kartıyla kaç adet sipariş verilmiştir?

select COUNT(*) KartileSiparis from Sales.SalesOrderHeader oh
inner join Sales.CreditCard cc on cc.CreditCardID = oh.CreditCardID
where lower( cc.CardType) = 'vista'

-- Sipariş hesaplamalaırnda discount kolonu da kullanılacak

-- Taşıma Ücreti 50 den düşük siparişlerimi yazdır

select * from Sales.SalesOrderHeader soh where soh.Freight < 50

select * from Sales.Customer
select * from sales.SalesOrderDetail
select * from sales.SalesOrderHeader

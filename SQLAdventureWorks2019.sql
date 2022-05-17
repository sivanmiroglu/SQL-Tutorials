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

-- Çalışanın Adı, Soyadı Departmanının Adı (son çalıştığı departman listelenecek)

select p.FirstName,p.LastName,hd.Name from Person.Person p
inner join HumanResources.EmployeeDepartmentHistory edh on edh.BusinessEntityID = p.BusinessEntityID
inner join HumanResources.Department hd on hd.DepartmentID = edh.DepartmentID
where edh.EndDate is null

-- Finance departmanında kaç adet çalışan var?

select COUNT(*) from HumanResources.Department hd Where hd.Name='Finance'


--Satış Soruları
-- ADET BAZINDA en çok siparişi veren müşterimin Id si,
-- Bugüne kadar verilmiş en yüksek cirolu sipariş
-- Sipariş cirolarımı TerriorityID ye göre grupla. 8, 564.000
-- Kaç adet sipariş gecikti?
-- En çok siparişim hangi bölgeye gecikti ve kaç adet?
-- Vista kredi kartıyla kaç adet sipariş verilmiştir?
-- Sipariş hesaplamalaırnda discount kolonu da kullanılacak
-- Taşıma Ücreti 50 den düşük siparişlerimi yazdır
-- SQL View
-- Bazı select ve inner join  sorgularını hazır hale getiren sanal tablo haline getiren sorgular dır veya komutlar

create View vw_ProductCS
as
select
p.ProductName,
p.UnitPrice,
s.CompanyName,
s.ContactTitle,
c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID =c.ID
inner join Suppliers as s
on s.SupplierID = p.ProductID

-- Yukarıdaki bilgiler istendiğinde view ile basitleştirerek select yardımı ile çağırıyorum.Yaani tabloyu teker teker elle çağırmaktan sa view ile hepsini veya işime yarayacak olanı çağırıyorum.
select * from vw_ProductCS
order by ProductName -- tablo içerisinde istediğim veriyi liste halinde çağırdım
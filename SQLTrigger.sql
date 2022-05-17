-- TRIGGER

-- tetikleyici

-- ürün tablosuna bir veri eklendiğinde x işlemi yap.

-- ürün tablosundan bir veri güncellendğinde y işlemi yap.

-- ürün tablosundan bir veri silindiğinde z işlemini yap.

-- Bir kategori eklendikten sonra ekrana yeni bir kategori eklendi yazsın.
-- Category tablsou üzerinde çalışan AFTER INSERT TRIGGER

create TRIGGER trg_add_Category
on Categories
AFTER INSERT -- DELETE diyerek kategori silebiriliriz.
as
begin
--Buradaki kod bloğu yeni bir kategori eklendikten SONRA ÇALIŞACAK
print('Yeni bir kategori eklendi!')
end
disable TRIGGER dbo.trg_add_Category on Categories -- disable diyerek printe yazdığımız yazının görünmemesini sağlarız. Enable diyererk de görünmesini sağlarız.

 insert into Categories (CategoryName) values ('sport') 

delete from Categories where ID = 27 -- categories tablosunda id si 26 olan veriyi sil



--enable TRIGGER dbo.trg_add_category on Categories
--create TRIGGER trg_delete_category
--on Categories
--AFTER DELETE     categori sildik ve ekrana categori silindi yazdırdık
--AS    
--BEGIN
-- print('Bir kategori silindi')
--END




--Kategori adının karakteri 3 den küçükse eklemesin!!
--Bir kategori eklendikten sonra ekrana yeni bir kategori eklendi yazsın.
--Category tablosu üzerinde çalışan AFTER INSTERT TRIGGER 
DROP TRIGGER trg_add_category
on Categories
AFTER INSERT
as
BEGIN
    if(LEN((select CategoryName
    from inserted)) < 3)
BEGIN
        print('UYARI Böyle Bir kategori eklenemez')
        rollback transaction
    END
END


--Ürün eklerken eğer stok 5 in altındaysa ürünü eklemesin
--inserted sql içerisine gömülü bir tablo! son eklenen insert işlemini bana verir
CREATE TRIGGER trg_add_product
on Products
AFTER INSERT
AS
BEGIN

    declare @newStock INT
    set @newStock = (select UnitsInStock
    from inserted)

    if(@newStock < 5)
BEGIN
        PRINT('Stok adedi 5 den küçük olduğu için eklenemez!')
        ROLLBACK TRANSACTION
    END
END


insert into Products
    (ProductName, UnitPrice, UnitsInStock)
values('IPhone', 333, 112)

select *
from Products
order by ProductID desc

-- Functionlar genel olarak sql development kısmında yardımcı olurlar. 

-- Functionlar istenilen deger tipinde dönüs yapabilir. INT, VARCHAR deger döndürebileceginiz gibi bir tablo da döndürebilirsiniz.

--scalar = adından da anlaşıldığı gibi sayısal değer döndüren bir fonksiyondur.

--Bu fonksiyon tanımlanırken integer tipinde bir değer döndürüleceği düşünülerek tanımlanır.

--Create komutu ile fonksiyonlar tanımlanır. Aynı fonksiyonu düzenlemek istediğimizde ise create kısmını Alter ile değiştirmemiz yeterli olacaktır.

Create FUNCTION kdv_calc(
    @price MONEY
)
RETURNS MONEY
AS
BEGIN
return @price * 1.18
END

select dbo.kdv_calc(100)


-- Yukarıda kdv hesaplama funtion u örnek olarak yapılmıştır
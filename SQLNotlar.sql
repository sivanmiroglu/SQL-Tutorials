
-- SQL İLE İLGİLİ NOTLAR --

-- Max : En büyük değeri verir.

-- Min : En küçük değeri verir.

-- Sum : Seçilen değerlerin toplamını verir.

-- Len : String bir verinin karakter sayısını yani uzunluğunu elde etmek için kullanılan bir fonksiyon.

-- Select : Alanı seçmek veriyi getirmek için kullanılır. select * tüm kolonlarrı getirir.

-- From : Üzerinde işlem yapılacak tabloları belirler.

-- Delete : Veri silmek için kullanılır.

-- First : Belirtilen alandaki ilk kayıt değerini verir.

-- Last : Belirtilen alandaki son kayıt değerini verir.

-- Dıstınct : Birbirinin aynısı olan satırların listelenmesini önlemek için kullanılır.( 20 tane kırmızı araba var ama dıstınct ile 1 tanesini göster diyorum)

-- Group by : komutların aynı değerlere sahip verileri gruplamamızı sağlar.

-- Truncate : Swl de bir tabloyu resetlemeye yarayan komut , içerdeki tüm detayı siler.

-- Havıng : Group by ifadesi ile oluşan grupların belirli şartlara göre sınıflandırılmasında kullanılır. Group by dan sonra yazılır.

-- Create Table : Yeni bir tabo oluşturmamızı sağlar .

-- Not null : İşlemi sınırlayarak bir değer içermesi gerektiğini belirtir. Boş geçilemez 

-- İnner Join : İki veya daha fazla tablodaki ilişkili değerleri seçmek / birleştirmek için kullanılır.

-- Left Join : Soldaki tablonun tamamını alır ve diğer tablodaki ilişkili verileri döndürür.

-- Right Join : Sağdaki tablonun tamamını alır ve diğer tablodaki ilişkili verileri döndürür.

-- Full Join : Sağ ve Soldaki tablo verilerinde bir eşleşme olduğunda tüm verileri çağrır.

-- Foregın key : Tabloları anlamlı bir şekilde birleştirmek için ortak bir sütun belirlemeye denir.

-- Drop : Tablo yada veritabanı silmek için kullanılır.

-- as : Hangi tablonun özelliğini kullancağımızı birldirirz.

-- IN : Belirttiğimiz değerler arasında herhangi bir değer ile eşleşme sağlanırsa kaydın litelenmesini sağlarız.

-- Between : Komutu verilen aralığın içindeki değerleri bulmamızı sağlar aynı zaman da aralık dışındaki verileri de bulmamıza yardımcı olur.

-- Begin End  Bloğu : C# daki süslü parantez gibidir. Sql de her işlem begin end bloğu arasına yapılır.

-- CREATE : İlk seferde işlediğimiz veriyi Kaydeder. 

-- ALTER : İlk seferden sonra üzerinde güncelleme , ekleme yaptığımızda veriyi ekler. Yani ilk seferde create saha sonra çalıştırmak istediğimizde Alter yaparız.

-- CREATE TABEL : Yeni tablo eklemek veya tabloyu kaydetmek.

-- Order By : İstenilen veriyi liste halinde gösterir . Listeleme yapar.

-- Order By Desc : Veriyi Tersen Listeler .

-- Where : İstenilen Veride koşul koyar. ( Ürünler tablosunu içinde a harfi geçeni getir ) demek için where kullanılır

-- And : Şart sağlanmazsa veriyi getirmez 

-- AND OR FARKI : And şart sağlanmazsa veriyi getirmez veya yanlış yazımda bile getirmez. Or ise en az 1 veya daha fazla şart uyuyorsa veriyi getirir. 

-- Select Top : istenilen miktarda listeleme yapar . Çağrılacak verilerin sayısını belirtmek için kullanılır İlk 10 veriyi getir dendiğinde "select top 10 from tablo adı" gibi 

-- like : Bir sütundaki belirli bir veriyi aramak için where komutu ile birlikte kullanılır.

-- Count : Tabloda kaç veri olduğunu yazar. Satır sayısını döndürür.

-- AVG : Ortalamayı alır

-- İnsert İnto : Tabloya veri eklememizi sağlar .

-- CREAT TABLE : Tablo oluşturma

-- PrimaryKey : Bir tablonun id alanını tuttuğumuz yerdir. Tablodaki seçilen değerleri benzersiz şekilde tanımlar.

-- Nvarchar : Sayısal bir işlem yapmayacaksan kolonu nvarchar yap.

-- is NOT NULL : Boş geçilemez

-- İndexlemek : Bir tablo üzerinde sorgu sonucunu daha kısa zamanda getirmek. Yani aradığımız veriyi bulur ve kısa zamanda getirir. aranılan eğer ID se daha hızlı olur. bir nevi Sözlükten bakmak da diyebiliriz.

-- ID int PRIMARY KEY IDENTITY (1, 1), : birden başla bir bir arttır. 2 şer 2 şer de arttırılabilir

-- İNSTERTED : Eklenen Satırı verir.

-- IDENTITY : Birer artan demek. Tc kimlik numarası örnek verilebilir.

-- @@IDENTITY : Veri tabanımıza eklenen son ıd yi verir

-- master : Sistem bütünün izlemeyi sağlar. Sistemdeki tabloları barındırır.

-- model : Oluşturduğumuz herhangi yeni bir db için model veritabanı şablonu oluşturur.

-- tempdb : Anahtar Çalışma alanı diyebiliriz . Karmaşık veya geniş bir sorgulama yaptığımızda sql serverin geçici tablolar oluşturnası gerekirse tempdb ile yapar.

-- STORE PROCEDURE  : C# daki metodlar gibidir ama metod değildir. Yazılan sorguyu çalıştırır ve bir sonuç kümesi döndürür.
-- her seferin de kodu tekrar yazmak yerine store procedure ile sorguyu yazarız ve sonuç gelir.

-- SQL FUNCTION : Functionlar genel olarak sql development kısmında yardımcı olurlar. Functionlar istenilen değer tipine dönüş yapabilir ,
-- Upper, Lower, Sum gibi sql içerisine gömülü functionlar da bulunmaktadır.

-- SQL TRİGGER : Veri Tabanımıza veya ( başka veri tabanı vede tablolara )  bulunan tablolarımıza eklemek silmek veya güncellemek için 
-- bazı işlemler yaptırmak isteyabiliriz bu kısımda devreye trigger girere ve yaptırmak istediğimiz işlemleri trigger yapısını kullanarak Yaparız.

-- SQL VİEW :  select ve inner join  sorgularını hazır hale getiren ve  sanal tablo haline getiren sorgular dır veya komutlardır. Ayrıca ;
-- Sorguları basitleştirmek sorgu süresini kısaltmak gerçekte olmayan select ifadeler ile tanımlanmış sanal tablolardır.

-- SQL TRANSACTİON : Yaptığımız hataya yer olmayan işlemlerimizde , hata varsa işlemi geri alır (ROLLBACK) ile hata yoksa işlemi Kaydeder (COMMİT).

-- SQL COMMİT : Transaction da yapılan işlemleri eğer hata yoksa kaydeder.

-- SQL ROLLBACK : Transaction da yapılan işlemler de eğer hata varsa 
--değişiklik yapmadan verileri aynı şekilde korunmasını sağlayan işlemdir. Yani yapılan işlemleri geri alır

-- TRY CATH : Hata ayıklama kısmıdır. içerisine kodları yazarız herhangi hatada hatayaı fırlatr.
-- hata bulma da daha hızlıdır. direk hatayı yakalar.


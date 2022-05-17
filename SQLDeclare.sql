-- Aşağıdaki ler Gelişmiş halleridir
 --SQL
-- T-SQL => MSSQL
-- PL-SQL => ORACLE
-- P-SQL => POSTGRESQL

-- c# da  int number = 7 gibi declare ile sayı tanımladık ve print ile ekrana yazdırdık.
-- cd int number = 7 = sql declare
declare @number int
set @number = 7       
print(@number)


declare @name nvarchar(13)      -- nvarchar ile ( boşluğu da sayarak ) 13  karakterini ekrana yansıtmasını söyledim               
set @name ='Şivan Miroğlu'
print(@name)

-- ekrana 10 defa Şivan yazdır

declare @counter int
set @counter = 0

while(@counter < 10)
begin
print('Şivan')
 set @counter = @counter + 1
end
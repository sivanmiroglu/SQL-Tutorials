--TRY CATCH

BEGIN TRY
delete from Categories
END TRY
BEGIN CATCH
select ERROR_MESSAGE()
select ERROR_LINE()
END CATCH
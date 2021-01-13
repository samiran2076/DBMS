SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO

BEGIN TRY
BEGIN TRANSACTION
SELECT StudentName from dbo.Student where StudentId=1014
Update dbo.ExamMarks
set marks= marks + 1
SELECT StudentName from dbo.Student where StudentId=1014
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH
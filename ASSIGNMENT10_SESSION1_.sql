SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO

BEGIN TRY
BEGIN TRANSACTION
SELECT StudentName from dbo.Student where StudentId=1014
Update dbo.ExamMarks
set marks= marks + 0
SELECT StudentName from dbo.Student where StudentId=1014

COMMIT TRANSACTION;
END TRY

BEGIN CATCH
SELECT 'Rollback'
ROLLBACK TRANSACTION;
END CATCH
Select StudentName from dbo.Student

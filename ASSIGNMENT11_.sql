/*1.Open two new scripts and connect. Then, set the isolation level as Repeatable Read in both the sessions.*/

--SESSION1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-12T12:10:04.8355893+05:30*/

--SESSION2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
GO

/*OTPUT
Commands completed successfully.
Completion time: 2020-11-12T12:10:04.8355893+05:30*/

/*2.Repeat steps 5,6 and 7 from Assignment 10 and save the output.*/
	/*Q5.In the first session write a transaction (within a try…catch block) to select the name of the student with studentid = 5, then update marks value in ExamMarks table for all the records and then again, the select statement to retrieve the name of the student with studentid = 5.*/
	/*Q6.In the second session, write a transaction (within a try…catch block) to update the name of the student with studentid = 5. */
	/*Q7.Execute the first script and immediately execute the second script. Record the output.*/	

--SESSION1
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

/*OUTPUT
StudentName
Samiran*/

/*StudentName
Samiran*/

--SESSION2
BEGIN TRY
BEGIN TRANSACTION
UPDATE dbo.Student
SET StudentName = 'Samiran' WHERE StudentId=1014
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/*OUTPUT
(1 row affected)
Completion time: 2020-11-12T12:05:16.4045029+05:30
*/

/*3.Create a stored procedure named usp_getStudentData. It should have an input parameter for deptName and output parameter as student count. The ouput parameter should be populated with the number of students in the department as sent as the deptname parameter. Also, retrieve the details of the faculties of CSE department who teaches DBMS.*/

IF OBJECT_ID('usp_getStudentData' ,'P') IS NOT NULL
	DROP PROCEDURE dbo.usp_getStudentData

CREATE PROCEDURE usp_getStudentData @DeptName VARCHAR(20), @studentCount INT 
OUTPUT
AS
BEGIN
    SELECT @studentCount = COUNT(StudentId) FROM dbo.Student s JOIN dbo.Department d on d.DeptId = s.DeptId WHERE d.DeptName = @DeptName;

    SELECT f.facultyId , f. facultyname
    FROM dbo.Faculty f
    JOIN dbo.Subject sub ON f.facultyId = sub.facultyId1 OR f.facultyId = sub.facultyId2
    JOIN dbo.Department d ON d.DeptId = f.deptid
    WHERE d.DeptName = 'CSE' AND sub.subjectname = 'Java';

    RETURN 1
END

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-12T12:36:02.8724438+05:30*/

/*4.Execute the stored procedure and print the output parameter and return value after execution*/

DECLARE @dept VARCHAR(20) = 'CSE'
DECLARE @count INT
DECLARE @ret INT

EXECUTE @ret = dbo.usp_getStudentData @dept , @count OUTPUT

SELECT 'Return Value', @ret
SELECT 'Count of Student' + @dept,@count

/*OUTPUT
facultyId	facultyname
5	UVW

(No column name)	(No column name)
Return Value	1

(No column name)	(No column name)
Count of StudentCSE	2
*/
/*1.	Write a stored procedure named usp_getData to retrieve all the records from the four tables: Student, StudentBkup, ExamMarks, ExamMarksNew. Execute the procedure.*/

IF OBJECT_ID('usp_getData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_getData
GO

CREATE PROCEDURE dbo.usp_getData
AS
BEGIN
	SELECT TOP 10 * FROM dbo.Student
	SELECT TOP 10 * FROM dbo.StudentBkup	
	SELECT TOP 10 * FROM ExamMarks
	SELECT TOP 10 * FROM ExamMarksNew
END

EXECUTE dbo.usp_getData

/*OUTPUT

StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	101	B.Tech	BCS3A	Active	111	202	111	302	402
1023	c	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2018-04-22	CSE	101	B.Tech	BCS3A	Active	55	202	222	303	405
1024	d	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	104	DBMS	BCS3A	Active	8	205	333	304	405
1025	e	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	105	DBMS	BCS3A	Active	5	206	444	303	404

StudentBkupId	StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
1	1015	b	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
2	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
3	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
4	1014	Samiran	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	101	DBMS	BCS3A	Active	88	202	0	301	401
5	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
6	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402

exammarksId	examId	studentId	marks
2	3	1014	450
3	4	1023	470
4	1	1024	460
5	5	1025	490
7	3	1014	450
8	4	1023	470
9	1	1024	460
10	5	1025	490

examMarksNewId	exammarksId	examId	studentId	marks

*/

/*2.Write a stored procedure named usp_setData to update and delete records from Student table. There will be insert and update of records in ExamMarks as well.  Execute the procedure.*/

IF OBJECT_ID('usp_setData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_setData
GO

CREATE PROCEDURE dbo.usp_setData
AS
BEGIN
update dbo.Student
set StudentName='A'
where StudentId=1015

delete from dbo.ExamMarks
where StudentId=1015

delete from dbo.Student
where StudentId=1014

insert into dbo.ExamMarks(ExamId,StudentId,Marks)
	values(9,2019,50)

update dbo.ExamMarks
set Marks=50
where StudentId=1014

RETURN 1
END

DECLARE @ret INT
EXECUTE dbo.usp_setData 

/*
OUTPUT
Commands completed successfully.
Completion time: 2020-11-26T12:17:10.8682230+05:30

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 rows affected)

(1 row affected)

(1 row affected)

(1 rows affected)

(1 rows affected)

(1 row affected)

(1 row affected)

(2 rows affected)

(2 rows affected)


*/

/*3. Execute the procedure named usp_getData again and save the output.*/

DECLARE @ret2 INT
EXECUTE @ret2 = dbo.usp_getData 

/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
1023	c	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2018-04-22	CSE	103	DBMS	BCS3A	Active	55	204	222	303	403
1024	d	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	104	DBMS	BCS3A	Active	8	205	333	304	404
1025	e	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	105	DBMS	BCS3A	Active	5	206	444	303	404

StudentBkupId	StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
1	1015	b	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
2	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
3	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
4	1014	Samiran	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	101	DBMS	BCS3A	Active	88	202	0	301	401
5	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
6	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
7	1024	d	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	104	DBMS	BCS3A	Active	8	205	333	304	404
8	1024	d	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	104	DBMS	BCS3A	Active	8	205	333	304	405
9	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
10	1015	A	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	B.Tech	BCS3A	Active	111	203	111	302	402


exammarksId	examId	studentId	marks
2	3	1014	450
3	4	1023	470
4	1	1024	460
5	5	1025	490
7	3	1014	450
8	4	1023	470
9	1	1024	460
10	5	1025	490

examMarksNewId	exammarksId	examId	studentId	marks
1	0	9	2019	50
2	3	4	1023	50
3	8	4	1023	50
4	13	4	1023	50
5	18	4	1023	50
6	23	4	1023	50
7	28	4	1023	50
8	33	4	1023	50
9	38	4	1023	50
10	43	4	1023	50
*/

/*4.Create a function to retrieve the student details of CSE department in BTech course and BCS3 batch who has obtained more than 50 marks in the DBMS exam held between August 2020 and December 2020.*/

update dbo.Exam
set ExamDate = '2020-09-10'
where ExamId=4

update dbo.Exam
set ExamDate = '2020-08-25'
where ExamId=5

delete from dbo.ExamMarks
where ExamMarksId>10

IF OBJECT_ID('func1' ,'IF') IS NOT NULL
	DROP FUNCTION func1
GO

CREATE FUNCTION dbo.func1 (@cnt INT)
RETURNS TABLE
AS
RETURN
			--Declare @count INT
			SELECT st.StudentId,st.StudentName, dp.DeptName, c.CourseName, Marks  
			from dbo.Student AS st
			JOIN ExamMarks em ON em.StudentId = st.StudentId
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'DBMS' AND c.CourseName = 'B.Tech' AND dp.DeptName='CSE' AND em.Marks>=50 AND e.ExamDate>='2020-08-01' AND e.ExamDate<='2020-09-30'
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-26T13:37:13.1862523+05:30
*/

/*5.	Execute the function to retrieve the student details.*/

SELECT StudentId,StudentName, DeptName, CourseName, Marks FROM dbo.func1(1)

/*OUTPUT

StudentId	StudentName	DeptName	CourseName	Marks
1023	c	CSE	B.Tech	470
1023	c	CSE	B.Tech	470
*/

/*6.Create a function to find the total number of passed out students for a particular department and course. Take department and course as input parameters. */

UPDATE dbo.Student
set StatusId=405
where StudentId=1024

IF OBJECT_ID('func2' ,'FN') IS NOT NULL
	DROP FUNCTION func2
GO

CREATE FUNCTION dbo.func2 (@course VARCHAR(10), @dept VARCHAR(10))
RETURNS INT
AS
BEGIN
	
	DECLARE @count INT

	SELECT @count = COUNT(StudentId) from dbo.Student AS st
			JOIN StudentStatus ss ON ss.StatusId=st.StatusId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
		WHERE c.CourseName = @course AND dp.DeptName=@dept AND ss.StatusDesc='Left'
		
	RETURN @count
END
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-26T13:25:03.6873040+05:30
*/

/*7. Execute the function from a SELECT statement.*/

DECLARE @ret INT
EXECUTE @ret = dbo.func2 'B.Tech','CSE' 
SELECT @ret

SELECT dbo.func2('B.Tech','CSE')

/*OUTPUT

(No column name)
1

*/
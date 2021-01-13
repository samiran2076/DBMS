/*Q1.Increase passmarks value by 10 in Exam table for the Subject DBMS. Then, increase the marks value by 10 in ExamMarks table for the Subject DBMS for all the students whose status is active. Both these statements should be written within a transaction. */

UPDATE dbo.Exam
SET PassMarks = PassMarks + 10
FROM 
Exam e JOIN CourSub cs ON e.CourSubId = cs.courSubId
JOIN Subject sub ON cs.subjectId = sub.SubjectId
WHERE sub.SubjectName = 'DBMS'

/*OUTPUT
(1 row affected)
Completion time: 2020-11-05T12:29:52.8938939+05:30
*/

BEGIN TRY
BEGIN TRANSACTION

UPDATE dbo.Exam
SET PassMarks = PassMarks + 10
FROM 
Exam e JOIN CourSub cs ON e.CourSubId = cs.courSubId
JOIN Subject sub ON cs.subjectId = sub.SubjectId
WHERE sub.SubjectName = 'DBMS';

UPDATE ExamMarks
SET Marks = Marks + 10
FROM 
ExamMarks em JOIN Student s ON em.StudentId = s.StudentId
JOIN Exam e ON e.ExamId = em.examId
JOIN CourSub cs ON e.CourSubId = cs.courSubId
JOIN Subject sub ON cs.subjectId = sub.SubjectId
JOIN StudentStatus ss ON ss.StatusId = s.StatusId
WHERE sub.SubjectName = 'DBMS' AND ss.StatusDesc = 'ACTIVE';

COMMIT TRANSACTION

END TRY
BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH
/*(1 row affected)
(1 rows affected)
Completion time: 2020-11-05T12:34:56.8055516+05:30
*/


/*Q2.Select the relevant records from both the tables before and after the transaction.  */

-- BEFORE TRANSACTION
SELECT examId, CourSubId,passMarks
FROM Exam
/*
examId	CourSubId	passMarks
1	4	420
2	5	420
3	6	420
4	7	420
5	8	420
*/

SELECT examId,StudentId,marks
FROM ExamMarks
/*
examId	StudentId	marks
2	1015	480
3	1014	450
4	1023	470
1	1024	460
5	1025	490
*/

--AFTER TRANSACTION

SELECT examId, CourSubId,passMarks
FROM Exam
/*
examId	CourSubId	passMarks
1	4	420
2	5	430
3	6	420
4	7	420
5	8	420
*/

SELECT examId,StudentId,marks
FROM ExamMarks
/*
examId	StudentId	marks
2	1015	480
3	1014	460
4	1023	470
1	1024	460
5	1025	490
*/

/*Q3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.*/

--SESSION1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-05T19:49:04.7091297+05:30*/

--SESSION2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED 
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-05T19:49:04.7091297+05:30*/

/*Q4.Insert around 80 lacs records ExamMarks table*/

Insert Into dbo.ExamMarks(examId, studentId, marks)
SELECT examId, studentId, marks FROM ExamMarks

truncate table  dbo.ExamMarks

select * from dbo.Exam
/*OUTPUT
(10485760 rows affected)
Completion time: 2020-11-05T18:50:34.8238999+05:30*/

/*Q5.In the first session write a transaction (within a try…catch block) to select the name of the student with studentid = 5, then update marks value in ExamMarks table for all the records and then again, the select statement to retrieve the name of the student with studentid = 5.*/

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
Select * from dbo.Student

/*OUTPUT
StudentName
Samiran
*/

/*Q6.In the second session, write a transaction (within a try…catch block) to update the name of the student with studentid = 5. */

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
Completion time: 2020-11-05T19:07:07.9257692+05:30
*/

/*Q7.Execute the first script and immediately execute the second script. Record the output.*/

/*OUTPUT

StudentName
a
/*

/*
StudentName
Samiran
*/

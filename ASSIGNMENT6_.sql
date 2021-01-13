
/*1.	Truncate data from all the five tables: Student, Department, Course, Batch, StudentStatus.*/
TRUNCATE TABLE dbo.Student
TRUNCATE TABLE dbo.Department
TRUNCATE TABLE dbo.Course
TRUNCATE TABLE dbo.Batch
TRUNCATE TABLE dbo.StudentStatus
/*OUTPUT
Commands completed successfully.

Completion time: 2020-10-01T12:01:07.8217036+05:30*/

/*2.Create foreign key constraints on the following columns of Student table:
a.DeptId -- references to DeptId of Department with ON DELETE CASCADE option
b.CourseId -- references to CourseId of Course with ON UPDATE SET NULL option
c.BatchId -- references to BatchId of Batch
d.StatusId -- references to StatusId of Status*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_DeptId FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId) ON  DELETE CASCADE
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-01T12:12:33.1190313+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_CourseId FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId) ON UPDATE SET NULL;
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-01T12:12:33.1190313+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_BatchId FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId) 
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-01T12:12:33.1190313+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_StatusId FOREIGN KEY(StatusId)
REFERENCES dbo.StudentStatus(StatusId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-01T12:12:33.1190313+05:30*/

/*3.	Insert 4 records in each of the four tables.
a.	DeptId values: 101,102,103,104
b.	CourseId values: 201,202,203,204
c.	BatchId values: 301,302,303,304
d.	StatusId values: 401,402,403,404*/
Insert into dbo.DEPARTMENT
(DeptId, DeptName)
Values
(101,'CS'),
(102,'ME'),
(103,'IT'),
(104,'CE');
/*OUTPUT
(4 rows affected)
Completion time: 2020-10-01T12:19:00.7429376+05:30*/

Insert into dbo.COURSE
(CourseId, CourseName)
Values
(201,'DBMS'),
(202,'OS'),
(203,'DAA'),
(204,'DSA');
/*OUTPUT
(4 rows affected)
Completion time: 2020-10-01T12:19:00.7429376+05:30*/

Insert into dbo.Batch
(BatchId, BatchName)
Values
(301,'BCS3A'),
(307,'BCS3B'),
(300,'BCS3C'),
(309,'BCS3D');
/*OUTPUT
(4 rows affected)
Completion time: 2020-10-01T12:19:00.7429376+05:30*/

Insert into dbo.STUDENTSTATUS
(StatusId,StatusDesc)
Values
(401,'YES'),
(402,'YES'),
(403,'YES'),
(404,'NO');
/*OUTPUT
(4 rows affected)
Completion time: 2020-10-01T12:19:00.7429376+05:30*/

/*4.	Insert 10 records in Student table.*/
insert into dbo.Student(StudentID,	StudentName	,StAddress	,Phone	,Email,	DateOfBirth	,DateOfAdmission,	DateOfPassing	,DeptName,	DeptId	,CourseId,	BatchId	,StatusId,AadharId,	CourseName,	BatchName,	StudentStatus)
values(1021,'a','Dhakuria',9939458499,'shuba@jghi.com','1998/11/27','2018/04/22','2022/08/29','computer',101,202,303,404,8403,'cse','bcs3a','active'),
	(1217,'BCD','kolkata',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',101,202,303,404,8403,'cse','bcs3a','active'),
	(1518,'CDE','durgapur',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',102,201,302,402,8404,'cse','bcs3a','active'),
	(1119,'DEF','bardhaman',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',102,201,302,402,8405,'cse','bcs3a','active'),
	(6120,'EFG','birbhum',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',103,201,301,403,8406,'cse','bcs3a','active'),
	(1171,'FGH','durgapur',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',103,203,301,403,8407,'cse','bcs3a','active'),
	(5122,'GHI','kolkata',8210027998,'qwirk@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',104,204,304,401,8408,'cse','bcs3a','active'),
	(1823,'HIJ','kolakata',8210027998,'anydesk8@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',104,204,304,401,8409,'cse','bcs3a','active'),
	(1424,'IJK','asansol',8210027998,'anydesk9@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',101,201,303,404,8410,'cse','bcs3a','active'),
	(4125,'LMN','cuttack',8210027998,'anydesk710@gmail.com','2000-11-03','2018-06-07','2022-06-07','computer',102,202,302,402,8411,'cse','bcs3a','active');
/*OUTPUT
(10 rows affected)

Completion time: 2020-10-01T12:26:39.0012979+05:30*/
EXECUTE sp_help 'dbo.Student'
EXECUTE sp_help 'dbo.Department'

/*5.Select records from Department and Student where DeptId = 101*/
Select StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,CourseName,BatchName,StudentStatus,AadharId 
From dbo.Student
Where DeptId = 101
(Select DeptId,DeptName From dbo.DEPARTMENT
Where DeptId = 101)
/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	CourseName	BatchName	StudentStatus	AadharId
1217	BCD	kolkata	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	NULL	NULL	NULL	NULL	8403
1424	IJK	asansol	8210027998	anydesk9@gmail.com	2000-11-03	2018-06-07	2022-06-07	NULL	NULL	NULL	NULL	8410
2116	ABC	kolkata	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	NULL	NULL	NULL	NULL	8402

DeptId	DeptName
101	CS*/

/*6.	Delete records from Department where DeptId = 101 and execute Select from Q.5*/
Delete From dbo.DEPARTMENT
Where DeptId=101
Select StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId 
From dbo.Student
Where DeptId = 101
Select DeptId,DeptName 
From dbo.DEPARTMENT
Where DeptId = 101;
/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharId

DeptId	DeptName
*/

/*7.	Select records from Course and Student where CourseId = 201*/
SELECT StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId 
FROM dbo.Student
WHERE CourseId = 201
SELECT CourseId,CourseName FROM dbo.COURSE
WHERE CourseId = 201;
/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharId
1119	DEF	bardhaman	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	102	201	302	402	8405
1518	CDE	durgapur	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	102	201	302	402	8404
6120	EFG	birbhum	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	103	201	301	403	8406

CourseId	CourseName
201	DBMS*/

/*8.Update CourseId from 201 to 210 in Course table and execute Select from Q.7*/
UPDATE dbo.Course
SET CourseId= 210
WHERE CourseId= 201

SELECT StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId FROM dbo.Student
WHERE CourseId = 201
SELECT CourseId,CourseName FROM dbo.COURSE
WHERE CourseId = 201

/*OUTPUT
(1 row affected)
Completion time: 2020-10-01T12:45:54.3115926+05:30

StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharId

CourseId	CourseName*/
/*9.	Select records from Batch and Student where BatchId = 301*/
SELECT StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId FROM dbo.Student
WHERE BatchId = 301
SELECT BatchId,BatchName FROM dbo.Batch
WHERE BatchId = 301;
/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharId
1171	FGH	durgapur	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	103	203	301	403	8407
6120	EFG	birbhum	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	103	NULL	301	403	8406

BatchId	BatchName
301	BCS3A*/

/*10.	Delete records from Batch where BatchId = 301 and execute Select from Q.9*/
DELETE FROM dbo.Batch
WHERE BatchId=301

SELECT StudentId, StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharId FROM dbo.Student
WHERE BatchId = 301
SELECT BatchId,BatchName FROM dbo.Batch
WHERE BatchId = 301

/*OUTPUT
The DELETE statement conflicted with the REFERENCE constraint "FK_Student_Batch". The conflict occurred in database "University", table "dbo.Student", column 'BatchId'.
The statement has been terminated.

StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharId
1171	FGH	durgapur	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	103	203	301	403	8407
6120	EFG	birbhum	8210027998	qwirk@gmail.com	2000-11-03	2018-06-07	2022-06-07	103	NULL	301	403	8406

BatchId	BatchName
301	BCS3A*/
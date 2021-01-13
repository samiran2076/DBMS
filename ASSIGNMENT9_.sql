/*1.Execute sp_helpconstraint on all the 10 tables and retrieve the foreign key details.*/

EXECUTE sp_helpconstraint 'dbo.Student'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Student_BatchId	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 	REFERENCES university.dbo.Batch (BatchId)
FOREIGN KEY	FK_Student_CourseId	No Action	No Action	Enabled	Is_For_Replication	CourseId
 	 	 	 	 	 	REFERENCES university.dbo.Course (CourseId)
FOREIGN KEY	FK_Student_DeptId	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES university.dbo.Department (DeptId)
FOREIGN KEY	FK_Student_StatusId	No Action	No Action	Enabled	Is_For_Replication	StatusId
 	 	 	 	 	 	REFERENCES university.dbo.StudentStatus (StatusId)
PRIMARY KEY (clustered)	PK_Student_StudentId	(n/a)	(n/a)	(n/a)	(n/a)	StudentId */

EXECUTE sp_helpconstraint 'dbo.Course'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Course_DeptId	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES university.dbo.Department (DeptId)
PRIMARY KEY (clustered)	PK_Course_CourseId	(n/a)	(n/a)	(n/a)	(n/a)	CourseId*/

EXECUTE sp_helpconstraint 'dbo.Batch'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_Batch_BatchId	(n/a)	(n/a)	(n/a)	(n/a)	BatchId*/

EXECUTE sp_helpconstraint 'dbo.Department'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_Department_DeptId	(n/a)	(n/a)	(n/a)	(n/a)	DeptId
*/

EXECUTE sp_helpconstraint 'dbo.Coursub'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_CourseSub_Subject	No Action	No Action	Enabled	Is_For_Replication	subjectId
 	 	 	 	 	 	REFERENCES university.dbo.Subject (SubjectId)
FOREIGN KEY	FK_CourSub_Course	No Action	No Action	Enabled	Is_For_Replication	courseId
 	 	 	 	 	 	REFERENCES university.dbo.Course (CourseId)
PRIMARY KEY (clustered)	PK_CourSub_courSubId	(n/a)	(n/a)	(n/a)	(n/a)	courSubId
*/

EXECUTE sp_helpconstraint 'dbo.StudentStatus'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_StudentStatus_StatusId	(n/a)	(n/a)	(n/a)	(n/a)	StatusId
*/

EXECUTE sp_helpconstraint 'dbo.Exam'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Exam_Batch	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 	REFERENCES university.dbo.Batch (BatchId)
FOREIGN KEY	FK_Exam_CourSub	No Action	No Action	Enabled	Is_For_Replication	CourSubId
 	 	 	 	 	 	REFERENCES university.dbo.CourSub (courSubId)
PRIMARY KEY (clustered)	PK_Exam_ExamId	(n/a)	(n/a)	(n/a)	(n/a)	ExamId
*/

EXECUTE sp_helpconstraint 'dbo.ExamMarks'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_ExamMarks_Exam	No Action	No Action	Enabled	Is_For_Replication	examId
 	 	 	 	 	 	REFERENCES university.dbo.Exam (ExamId)
FOREIGN KEY	FK_ExamMarks_Student	No Action	No Action	Enabled	Is_For_Replication	studentId
 	 	 	 	 	 	REFERENCES university.dbo.Student (StudentId)
PRIMARY KEY (clustered)	PK_ExamMarks_exammarksId	(n/a)	(n/a)	(n/a)	(n/a)	exammarksId
*/

EXECUTE sp_helpconstraint 'dbo.Faculty'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Faculty_Department	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES university.dbo.Department (DeptId)
PRIMARY KEY (clustered)	PK_Faculty_FacultyId	(n/a)	(n/a)	(n/a)	(n/a)	FacultyId
*/

EXECUTE sp_helpconstraint 'dbo.Subject'
/*OUTPUT
constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Subject_Facultyid1	No Action	No Action	Enabled	Is_For_Replication	facultyid1
 	 	 	 	 	 	REFERENCES university.dbo.Faculty (FacultyId)
FOREIGN KEY	FK_Subject_Facultyid2	No Action	No Action	Enabled	Is_For_Replication	facultyid2
 	 	 	 	 	 	REFERENCES university.dbo.Faculty (FacultyId)
PRIMARY KEY (clustered)	PK_Subject_SubjectId	(n/a)	(n/a)	(n/a)	(n/a)	SubjectId
*/

/*2.Insert 5 records in each of the following tables: Student, Department, Course, Batch, Studentstatus, Faculty, Subject, CourSub , Exam, ExamMarks.*/

delete from dbo.Course
delete from dbo.Department
delete from dbo.Batch
delete from dbo.Student

INSERT INTO dbo.Department(DeptId, DeptName)
       values(101, 'CSE'),
	   (102, 'ECE'),
	   (103, 'MECH'), 
	   (104, 'BCA'),
	   (105,'CSE')
select * FROM dbo.Department
/*OUTPUT
DeptId	DeptName
101		CSE
102		ECE
103		MECH
104		BCA
105		CSE
*/

INSERT INTO dbo.Course(CourseId, CourseName,DeptId)
       values(202, 'DBMS',101), 
	   (206, 'OS',102), 
	   (203, 'C++',103), 
	   (204, 'DSA',104),
	   (205,'PYT',105)
select * FROM dbo.Course
delete from dbo.Course
/*OUTPUT
CourseId	CourseName	DeptId
202				DBMS	101
203				C++		103
204				DSA		104
205				PYT		105
206				OS		102
*/

INSERT INTO dbo.Batch(BatchId , BatchName)
       values(301, 'BCS3A'),
	   (302, 'BCS3B'),
	   (303,'BCS3C'),
	   (304,'BS3D'),
	   (305,'BCS3E')
select * FROM dbo.Batch
/*OUTPUT
BatchId	BatchName
301		BCS3A
302		BCS3B
303		BCS3C
304		BS3D
305		BCS3E
*/

INSERT INTO dbo.StudentStatus(StatusId , StatusDesc)
       values(401,'Active'),
	  (402, 'Active'),
	   (403,'left'),
	   (404,'Active'),
	   (405,'left')
select * FROM dbo.StudentStatus
/*OUTPUT
StatusId	StatusDesc
401			YES
402			YES
403			YES
404			NO
405			Active
*/

INSERT INTO dbo.Student
   (StudentId,StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,DeptId,CourseName,BatchName,StudentStatus,AadharId,CourseId,StudentStatusId,BatchId,StatusId)
 values(1014,'a','delhi',9939449499,'chand@jdi.com','1998/11/27','2018/04/22','2018/04/22','CSE',101,'DBMS','BCS3A','Active',88,202,000,301,401), 
       (1015,'b','kolkata',08947583904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2018/04/22','CSE',102,'DBMS','BCS3A','Active',111,203,111,302,402), 
       (1023,'c','bihar', 9090890989, 'jdfbs@nf.in',  '2001/09/11','2018/09/23','2018/04/22','CSE',103,'DBMS','BCS3A','Active',55,204,222,303,403), 
       (1024,'d','mumbai',9939449499,'shuba@jdi.com','1998/11/27','2018/04/22','2018/04/22','CSE',104,'DBMS','BCS3A','Active',8,205,333,304,404), 
       (1025,'e','kolkata',08947583904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2018/04/22','CSE',105,'DBMS','BCS3A','Active',5,206,444,303,404)
select * FROM dbo.Student
/*OUTPUT
StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
1014	a	delhi	9939449499	chand@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	101	DBMS	BCS3A	Active	88	202	0	301	401
1015	b	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	102	DBMS	BCS3A	Active	111	203	111	302	402
1023	c	bihar	9090890989	jdfbs@nf.in	2001-09-11	2018-09-23	2018-04-22	CSE	103	DBMS	BCS3A	Active	55	204	222	303	403
1024	d	mumbai	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2018-04-22	CSE	104	DBMS	BCS3A	Active	8	205	333	304	404
1025	e	kolkata	8947583904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2018-04-22	CSE	105	DBMS	BCS3A	Active	5	206	444	303	404
*/

INSERT INTO dbo.Faculty(facultyname, DeptId)
VALUES
( 'ABC', 101),
( 'XYZ', 102),
( 'PQR', 103),
( 'MNO', 104),
( 'UVW', 105)
select * FROM dbo.Faculty
/*
OUTPUT
FacultyId	FacultyName	DeptId
1				ABC		101
2				XYZ		102
3				PQR		103
4				MNO		104
5				UVW		105
*/

INSERT INTO dbo.Subject(subjectname, facultyid1, facultyid2)
VALUES
( 'C', 1, 1),
( 'C#', 2, 2),
( 'C++', 3, 3),
( 'python', 4, 4),
( 'Java', 5, 5)
select * FROM dbo.Subject
/*
OUTPUT
SubjectId	subjectname	facultyid1	facultyid2
21				C			1			1
22				C#			2			2
23				C++			3			3
24				python		4			4
25				Java		5			5
*/

INSERT INTO dbo.CourSub(courseId, subjectId)
VALUES
( 202, 21),
( 203, 22),
( 204, 23),
( 205, 24),
( 206, 25 )
select * FROM dbo.CourSub
/*
OUTPUT
courSubId	courseId	subjectId
4			202			21
5			203			22
6			204			23
7			205			24
8			206			25
*/

INSERT INTO dbo.Exam(courSubId, examdate, batchId, totalmarks, passmarks)
VALUES
( 4, '2020/10/25',301, 500, 420),
( 5, '2020/10/26', 302, 500, 420),
( 6, '2020/10/27', 303, 500, 420),
( 7, '2020/10/28', 304, 500, 420),
(8,'2020/10/29',305,500,420)
select * FROM dbo.Exam
/*OUTPUT
ExamId	CourSubId	BatchId	TotalMarks	PassMarks	ExamDate
1			4			301		500		420			2020-10-25
2			5			302		500		420			2020-10-26
3			6			303		500		420			2020-10-27
4			7			304		500		420			2020-10-28
5			8			305		500		420			2020-10-29
*/

INSERT INTO dbo.ExamMarks(examId, studentId, marks)
VALUES
(2, 1015, 480),
(3, 1014, 450),
(4, 1023, 470),
(1, 1024, 460),
(5,1025,490)
select * FROM dbo.ExamMarks
/*OUTPUT
courSubId	courseId	subjectId
4			202			21
5			203			22
6			204			23
7			205			24
8			206			25
*/

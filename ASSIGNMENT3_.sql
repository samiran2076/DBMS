
insert into dbo.Student (StudentId, StudentName, StudentAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId)
				values(1004, 'A', 'Kolkata', 6290313871, 'abc@gmail.com', '1999-08-01', '2018-04-01', '2021-04-01','ABC',	11, 21, 32, 44),
					  (1005, 'B', 'BArrackpore',6290313872, 'bcb@gmail.com', '1999-07-02','2018-04-01','2021-04-01','ABC',	11, 32, 32, 44),
				      (1023, 'C', 'Kolkata', 6296513873, 'cdf@gmail.com', '1999-06-03', '2018-04-02', '2021-04-01','ABC',	11, 33, 32, 41),
					  (1036, 'D', 'Kolkata', 6299613874, 'dwe@gmail.com', '1999-05-04', '2018-04-03', '2021-04-01','ABC',	11, 24, 34, 44),
					  (1096, 'E', 'Baruipur', 6225313875, 'eft@gmail.com', '1999-04-05', '2018-04-04', '2021-04-01','ABC',	12,35, 93, 41),
					  (1089, 'F', 'Kolkata', 6294513876, 'fji@gmail.com', '1999-03-06', '2018-04-05', '2021-04-01','ABC',	13, 26, 36, 46),
					  (1048, 'G', 'Sonarpur', 6263313877, 'gkj@gmail.com', '1999-02-07', '2018-04-06', '2021-04-01','ABC',	12, 27, 37, 41),
					  (1015, 'H', 'Kolkata', 6291513878, 'hol@gmail.com', '1999-01-08', '2018-04-07', '2021-04-01','ABC',	12, 28, 38, 41),
					  (1078, 'I', 'Ultadanga', 6970313879, 'ity@gmail.com', '1999-11-09', '2018-04-08', '2021-04-01','ABC',	13, 29, 39, 49),
					  (1065, 'J', 'Shyambazar', 3690313880, 'jop@gmail.com', '1999-12-10', '2018-04-09', '2021-04-01','ABC',14, 30, 40, 50)

select * from dbo.Student

truncate table dbo.student

/*StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	StatusId
1004	A	Kolkata	6290313871	abc@gmail.com	1999-08-01	2018-04-01	2021-04-01	ABC	11	21	31	41
1005	B	BArrackpore	6290313872	bcb@gmail.com	1999-07-02	2018-04-01	2021-04-01	ABC	12	22	32	42
1023	C	Kolkata	6296513873	cdf@gmail.com	1999-06-03	2018-04-02	2021-04-01	ABC	13	23	33	43
1036	D	Kolkata	6299613874	dwe@gmail.com	1999-05-04	2018-04-03	2021-04-01	ABC	14	24	34	44
1096	E	Baruipur	6225313875	eft@gmail.com	1999-04-05	2018-04-04	2021-04-01	ABC	15	25	35	45
1089	F	Kolkata	6294513876	fji@gmail.com	1999-03-06	2018-04-05	2021-04-01	ABC	16	26	36	46
1048	G	Sonarpur	6263313877	gkj@gmail.com	1999-02-07	2018-04-06	2021-04-01	ABC	17	27	37	47
1015	H	Kolkata	6291513878	hol@gmail.com	1999-01-08	2018-04-07	2021-04-01	ABC	18	28	38	48
1078	I	Ultadanga	6970313879	ity@gmail.com	1999-11-09	2018-04-08	2021-04-01	ABC	19	29	39	49
1065	J	Shyambazar	3690313880	jop@gmail.com	1999-12-10	2018-04-09	2021-04-01	ABC	20	30	40	50
1004	A	Kolkata	6290313871	abc@gmail.com	1999-08-01	2018-04-01	2021-04-01	ABC	11	21	31	41
1005	B	BArrackpore	6290313872	bcb@gmail.com	1999-07-02	2018-04-01	2021-04-01	ABC	12	22	32	42
1023	C	Kolkata	6296513873	cdf@gmail.com	1999-06-03	2018-04-02	2021-04-01	ABC	13	23	33	43
1036	D	Kolkata	6299613874	dwe@gmail.com	1999-05-04	2018-04-03	2021-04-01	ABC	14	24	34	44
1096	E	Baruipur	6225313875	eft@gmail.com	1999-04-05	2018-04-04	2021-04-01	ABC	15	25	35	45
1089	F	Kolkata	6294513876	fji@gmail.com	1999-03-06	2018-04-05	2021-04-01	ABC	16	26	36	46
1048	G	Sonarpur	6263313877	gkj@gmail.com	1999-02-07	2018-04-06	2021-04-01	ABC	17	27	37	47
1015	H	Kolkata	6291513878	hol@gmail.com	1999-01-08	2018-04-07	2021-04-01	ABC	18	28	38	48
1078	I	Ultadanga	6970313879	ity@gmail.com	1999-11-09	2018-04-08	2021-04-01	ABC	19	29	39	49
1065	J	Shyambazar	3690313880	jop@gmail.com	1999-12-10	2018-04-09	2021-04-01	ABC	20	30	40	50*/

/* 11.	Write an inner join between Student and Department to retrieve the department name for all the students */
SELECT D.DeptName
FROM dbo.Student as S
INNER JOIN dbo.Department as D
ON S.DeptId = D.DeptId
/*DeptName
CSE
ECE
MECH
BCA*/

insert into dbo.Course (CourseId, CourseName)
	VALUES(31, 'EE'),
	(32, 'ECE'),
	(33, 'MECH'),
	(34, 'BIOTECH')

SELECT * from dbo.Course
truncate table dbo.Course

/*ASSIGNMENT 3 STARTS*/

/*1.Write a query to retrieve all the courses where there is no student.*/
insert into dbo.Course (CourseId, CourseName)
	VALUES(31, 'EE'),
	(32, 'ECE'),
	(33, 'MECH'),
	(34, 'BIOTECH')

SELECT * from dbo.Course
truncate table dbo.Course

/*1.Write a query to retrieve all the courses where there is no student.*/
SELECT C.CourseId as CCourseid,C.CourseName as CCourseName,S.CourseId as SCourseId,S.StudentId as SStudentID
FROM  dbo.Course as C
LEFT JOIN dbo.Student as S
ON C.CourseId=S.CourseId
WHERE S.CourseId IS NULL
/*OUTPUT
CCourseid	CCourseName	SCourseId	SStudentID
31	EE	NULL	NULL
34	BIOTECH	NULL	NULL
31	EE	NULL	NULL
34	BIOTECH	NULL	NULL*/

/*2.	Write a query to retrieve all the students having a status value not present in StudentStatus table.*/
SELECT C.BAtchID,C.CourseID,C.DateofAdmission,C.DateofBirth,C.DateofPassing,C.StudentID, C.StudentName, S.StatusDesc,S.StatusId
From dbo.Student as C
left join dbo.StudentStatus as S
on C.StatusId=S.StatusId
where s.StatusDesc is null
/*OUTPUT
CCourseid	CCourseName	SCourseId	SStudentID
22	BBA	NULL	NULL
23	BCA	NULL	NULL
31	EE	NULL	NULL
34	BIOTECH	NULL	NULL/*

*/3.	Select the student records with completed status for CSE Department and BCS3B batch*/
SELECT S.StudentId, S.StudentName,SS.StatusDesc,D.DeptName,B.BatchName
from dbo.Student as S
inner join dbo.StudentStatus as SS
on S.StatusId =SS.StatusId
inner join dbo.Department as D
on S.DeptId=D.DeptId
inner join dbo.Batch as B
on S.BatchId=B.BatchId
where SS.StatusDesc='Completed' AND D.DeptName='CSE' AND B.BatchName='BCS3B'
/*output
StudentId	StudentName	StatusDesc	DeptName	BatchName
1004	A	Completed	CSE	BCS3B
1005	B	Completed	CSE	BCS3B*/




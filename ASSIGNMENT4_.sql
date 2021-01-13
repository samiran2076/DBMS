/*1.Select all the students who are active, sorted by studentid in descending order.*/
select S.StudentId ,S.StudentName, SS.StatusDesc
from dbo.Student as S
inner join dbo.StudentStatus as SS on S.StatusId=SS.StatusId
where S.StatusId='41'
order by StudentId desc
/*output
StudentId	StudentName	StatusDesc
1096	E	active
1048	G	active
1024	K	active
1023	C	active
1015	H	active*/

/*2.Create a copy of the student table named student_copy only having records for CSE department students using SELECT INTO clause*/
select StudentId,StudentName,StudentAddress,Phone, Email,DateOfBirth,DateOfAdmission,DateOfPassing, PresentAddress,D.DeptId as DeptId,CourseId, BatchId, StatusId
into student_copy
from dbo.Student as S
inner join dbo.Department as D on S.DeptId=S.DeptId
where S.DeptId=11
select * from dbo.student_copy
drop table dbo.student_copy
/*output
(5 rows affected)
Completion time: 2020-09-10T18:43:55.6026985+05:30*/

/*3.Select the count of students in each department only when the count is more than 2.*/
select count(S.StudentId) as Total , D.DeptName
from dbo.Student as S
inner join dbo.Department as D on S.DeptId=D.DeptId
group by D.DeptName
having COUNT(S.StudentId)>2;
/*output
Total	DeptName
3		BCA
5		CSE
2		ECE
6		MECH*/

/*4.	Insert two different sets of records in student and student_copy table.*/
insert into dbo.Student (StudentId, StudentName, StudentAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId)
				values(1024, 'K', 'Kolkata',	6290313871, 'QWR@gmail.com', '1998-08-01', '2018-04-01', '2021-04-01','plk', 11, 21, 31, 41),
					  (1035, 'L', 'BArrackpore',6290313872, 'POI@gmail.com', '1999-06-02', '2018-04-06', '2021-04-01','ABC', 12, 22, 32, 42)
SELECT * FROM dbo.Student

insert into dbo.student_copy(StudentId, StudentName, StudentAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId)
				values(1034, 'A', 'Kolkata',	6290313871, 'a4bc@gmail.com', '1999-08-21', '2018-04-04', '2021-04-01','ABC', 13, 21, 31, 41),
					  (1035, 'B', 'BArrackpore',6290313872, 'bc6b@gmail.com', '1999-07-12', '2018-04-31', '2021-04-01','ABC', 12, 22, 32, 42)
select * from dbo.student_copy
/*output*/
/*(2 rows affected)
Completion time: 2020-09-10T18:43:55.6026985+05:30*/
/*(2 rows affected)
Completion time: 2020-09-10T18:43:55.6026985+05:30*/


/*5.Select the records from student table which are not present in student_copy table.*/
SELECT S.Student,S.StName,S.StAddress,S.Phone,S.Email,S.DateOfBirth,S.DateOfAdmission,S.DateOfPassing,S.Deptname,S.CourseName,S.BatchName,S.StudentStatus
FROM dbo.student as S
EXCEPT
SELECT SC.Student,SC.StName,SC.StAddress,SC.Phone,SC.Email,SC.DateOfBirth,SC.DateOfAdmission,SC.DateOfPassing,SC.Deptname,SC.CourseName,SC.BatchName,SC.StudentStatus
FROM dbo.student_copy as SC
/*OUTPUT
Student	StName	StAddress	Phone		Email			DateOfBirth	DateOfAdmission	DateOfPassing	Deptname	CourseName	BatchName	StudentStatus
1015	hg		Kolkata		6290355578	hg@gmail.com	1999-09-29	2018-04-01		2021-04-01		EE			B.Tech		BCS3C		ACTIVE
1035	Shibu	Kolkata		6290313878	shibu@gmail.com	1999-09-28	2018-04-01		2021-04-01		ECE			B.Tech		BCS3B		left
1048	Gobu	Kolkata		6290313878	gobu@gmail.com	1999-09-29	2018-04-01		2021-04-01		BCA			B.Tech		BCS3C		completed
1065	bbb		Kolkata		6269855578	bbb@gmail.com	1999-09-29	2018-04-01		2021-04-01		HNRS		B.Tech		BCS2C		LEFT
1078	aaa		Kolkata		6290857558	aaa@gmail.com	1999-09-28	2018-04-01		2021-04-01		HG			B.Tech		BCS2D		ACTIVE
*/

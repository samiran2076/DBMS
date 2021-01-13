--1.Create a Database "UNIVERSITY"
create database university
/*Commands completed successfully.

Completion time: 2020-08-20T20:15:13.5073275+05:30*/

--2. Create a Table “Student” in Database “UNIVERSITY”

create table dbo.Student
(
	StudentID INT,
	StudentName VARCHAR,
	StAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	DeptName VARCHAR(50),
	CourseName VARCHAR(50),
	BatchName VARCHAR(10),
	StudentStatus VARCHAR(10) -- StudentStatus possible values are: active, left, completed.
)
/*output:
Commands completed successfully
Completion time: 2020-08-20T17:58:37.3629232+05:30 */

--3.Display the content of the table

select * from dbo.Student
/*
StudentID	StudentName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	CourseName	BatchName	StudentStatus
1021	a	Dhakuria	9939458499	shuba@jghi.com	1998-11-27	2018-04-22	2022-08-29	computer	cse	                bcs3a         completed
1023	c	kolkata	9090891089	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                        bcs3a         completed
1024	d	Dhakuria	9939496499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	computer	cse	                bcs3a	                   completed
1025	e	kolkata	8947579904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	biology	cse	                        bcs3b	                              active
1026	f	kolkata	9090892689	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                        bcs3a	                              completed
1027	g	kolkata	9090897889	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	biology	cse	                             bcs3b	                                    active
1028	h	Dhakuria	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	computer 	            cse	                 bcs3a	                       completed
1029	i	kolkata	8947556904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	biology	cse	                         bcs3b	                                active
1030	j	kolkata	9090894568	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                         bcs3a	                               completed
*/

--4.Insert Values into the table 

insert into dbo.Student(StudentId,StudentName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,CourseName,BatchName,StudentStatus)
				 values(1021,'a','Dhakuria',9939458499,'shuba@jghi.com','1998/11/27','2018/04/22','2022/08/29','computer','cse','bcs3a','active'),
					   (1022,'b','kolkata',08947578904,'kfnksd@nfgdg.vn','1999/08/11','2018/04/22','2022/08/29','computer','cse','bcs3c','left'),
					   (1023,'c','kolkata',9090891089,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30','computer','cse','bcs3a','active'),
					   (1024,'d','Dhakuria',9939496499,'shuba@jdi.com','1998/11/27','2018/04/22','2022/08/29','computer','cse','bcs3a','active'),
					   (1025,'e','kolkata',08947579904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2022/08/29','biology','cse','bcs3b','active'),
					   (1026,'f','kolkata',9090892689,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30','computer','cse','bcs3a','active'),
					   (1027,'g','kolkata',9090897889,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30','biology','cse','bcs3b','active'),
					   (1028,'h','Dhakuria',9939449499,'shuba@jdi.com','1998/11/27','2018/04/22','2022/08/29','computer','cse','bcs3a','active'),
					   (1029,'i','kolkata',08947556904,'kfnksd@nfg.vn','1999/08/11','2018/04/22','2022/08/29','biology','cse','bcs3b','active'),
					   (1030,'j','kolkata',9090894568,'jdfbs@nf.in','2001/09/11','2018/09/23','2022/07/30','computer','cse','bcs3a','active')
/*output: 
(10 rows affected)

Completion time: 2020-08-20T18:23:37.7899250+05:30
*/

--5.Update all the records set StudentStatus as completed where BatchName = 'BCS3A'
UPDATE dbo.Student
SET StudentStatus = 'completed'
WHERE BatchName = 'bcs3a'
/*
(6 rows affected)

Completion time: 2020-08-20T18:25:53.2454604+05:30
*/

--6.Delete the records from Student table where StudentId = ' '
delete from dbo.Student
where StudentId=1022
/*(1 row affected)

Completion time: 2020-08-20T18:27:13.5371236+05:30
*/


--7.Select all the records from the Student Table
select * from dbo.Student
/*
StudentID	StudentName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	CourseName	BatchName	StudentStatus
1021	a	Dhakuria	9939458499	shuba@jghi.com	1998-11-27	2018-04-22	2022-08-29	computer	cse	                bcs3a         completed
1023	c	kolkata	9090891089	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                        bcs3a         completed
1024	d	Dhakuria	9939496499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	computer	cse	                bcs3a	                   completed
1025	e	kolkata	8947579904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	biology	cse	                        bcs3b	                              active
1026	f	kolkata	9090892689	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                        bcs3a	                              completed
1027	g	kolkata	9090897889	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	biology	cse	                             bcs3b	                                    active
1028	h	Dhakuria	9939449499	shuba@jdi.com	1998-11-27	2018-04-22	2022-08-29	computer 	            cse	                 bcs3a	                       completed
1029	i	kolkata	8947556904	kfnksd@nfg.vn	1999-08-11	2018-04-22	2022-08-29	biology	cse	                         bcs3b	                                active
1030	j	kolkata	9090894568	jdfbs@nf.in	2001-09-11	2018-09-23	2022-07-30	computer	cse	                         bcs3a	                               completed
*/
--8.Select the records from the student table where StudentStatus is not completed
select StudentId
from dbo.Student
where StudentStatus!= 'completed'
/*
StudentId
1025
1027
1029
*/

--9.	Truncate the table and select all the records from the table.
truncate table dbo.student
select * from dbo.Student
-- StudentID	StudentName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	CourseName	BatchName	StudentStatus

--10. Drop the Student table
drop table dbo.Student
/*Commands completed successfully.

Completion time: 2020-08-20T18:44:25.8930742+05:30
*/


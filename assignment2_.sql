/* 2.	Create the Student table again without the following columns: DeptName, CourseName, CurrentBatchName, StudentStatus */
CREATE TABLE dbo.Student
(
	StudentId INT,
	StudentName VARCHAR(100),
	StudentAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date
)
SELECT * from dbo.Student
/*output:
Commands completed successfully.

Completion time: 2020-08-27T20:27:07.8497696+05:30
 */


/* 3.	Alter the Student table to add a column named PresentAddress VARCHAR(200) */

ALTER TABLE dbo.Student
	ADD PresentAddress VARCHAR(200);
/*output:
Commands completed successfully.

Completion time: 2020-08-27T20:27:07.8497696+05:30*/

/* 4.	Create four master tables:
a.	Department (DeptId INT, DeptName VARCHAR(50))
b.	Course (CourseId INT, CourseName VARCHAR(50))
c.	Batch (BatchId INT, BatchName VARCHAR(50))
d.	StudentStatus (StatusId INT, StatusDesc VARCHAR(50)) */

CREATE TABLE dbo.Department
(
	DeptId INT,
	DeptName VARCHAR(50)
)
/*Commands completed successfully.

Completion time: 2020-08-27T20:28:14.5941252+05:30*/

CREATE TABLE dbo.Course
(
	CourseId INT, 
	CourseName VARCHAR(50)
)
/*Commands completed successfully.

Completion time: 2020-08-27T20:29:13.0199119+05:30*/


CREATE TABLE dbo.Batch
(
	BatchId INT, 
	BatchName VARCHAR(50)
)
/*Commands completed successfully.

Completion time: 2020-08-27T20:29:32.3938171+05:30*/


CREATE TABLE dbo.StudentStatus
(
	StatusId INT, 
	StatusDesc VARCHAR(50)
)
/*Commands completed successfully.

Completion time: 2020-08-27T20:29:49.8399137+05:30*/

/* 5.	Alter the Student table to include four new columns: DeptId, CourseId, BatchId, StatusId.*/
ALTER TABLE dbo.Student
	ADD	DeptId INT,
		CourseId INT,
		BatchId INT,
		StatusId INT;
/*Commands completed successfully.

Completion time: 2020-08-27T20:30:09.6461445+05:30*/
	

/* 6.	Insert 4 records in Department table.*/ 
insert into dbo.Department (DeptId, DeptName)
	VALUES(11, 'CSE'),
	(12, 'ECE'),
	(13, 'MECH'),
	(14, 'BCA')

SELECT * from dbo.Department
/*(4 rows affected)

Completion time: 2020-08-27T20:30:29.5585680+05:30*/


/* 7.	Insert 4 records in Course table. */
insert into dbo.Course (CourseId, CourseName)
	VALUES(21, 'BTECH'),
	(22, 'BBA'),
	(23, 'BCA'),
	(24, 'MBA')

SELECT * from dbo.Course
/*(4 rows affected)

Completion time: 2020-08-27T20:30:49.8968934+05:30*/

/* 8.	Insert 4 records in Batch table. */
insert into dbo.Batch (BatchId, BatchName)
	VALUES(31, 'F1'),
	(32, 'F2'),
	(33, 'F3'),
	(34, 'F4')

SELECT * from dbo.Batch
/*(4 rows affected)

Completion time: 2020-08-27T20:31:09.2830722+05:30*/

/*9.Insert 4 records in StudentStatus table.*/

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(41, 'Freshman'),
	(42, 'Sophomore'),
	(43, 'Junior'),
	(44, 'Senior')

SELECT * from dbo.StudentStatus
/*(4 rows affected)

Completion time: 2020-08-27T20:32:33.7349837+05:30*/


/* 10.	Insert 10 records in the student table. DeptId, CourseId, BatchId, StatusId columns should have some data common with the master table data.
INSERT INTO <schema name.table name> (<column list>) 
VALUES (<value list>) */
insert into dbo.Student (StudentId, StudentName, StudentAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId)
				values(1004, 'A', 'Kolkata', 6290313871, 'abc@gmail.com', '1999-08-01', '2018-04-01', '2021-04-01','ABC', 11, 21, 31, 41),
					  (1005, 'B', 'BArrackpore', 6290313872, 'bcb@gmail.com', '1999-07-02', '2018-04-01', '2021-04-01','ABC', 12, 22, 32, 42),
				      (1023, 'C', 'Kolkata', 6296513873, 'cdf@gmail.com', '1999-06-03', '2018-04-02', '2021-04-01','ABC', 13, 23, 33, 43),
					  (1036, 'D', 'Kolkata', 6299613874, 'dwe@gmail.com', '1999-05-04', '2018-04-03', '2021-04-01','ABC', 14, 24, 34, 44),
					  (1096, 'E', 'Baruipur', 6225313875, 'eft@gmail.com', '1999-04-05', '2018-04-04', '2021-04-01','ABC', 15, 25, 35, 45),
					  (1089, 'F', 'Kolkata', 6294513876, 'fji@gmail.com', '1999-03-06', '2018-04-05', '2021-04-01','ABC', 16, 26, 36, 46),
					  (1048, 'G', 'Sonarpur', 6263313877, 'gkj@gmail.com', '1999-02-07', '2018-04-06', '2021-04-01','ABC', 17, 27, 37, 47),
					  (1015, 'H', 'Kolkata', 6291513878, 'hol@gmail.com', '1999-01-08', '2018-04-07', '2021-04-01','ABC', 18, 28, 38, 48),
					  (1078, 'I', 'Ultadanga', 6970313879, 'ity@gmail.com', '1999-11-09', '2018-04-08', '2021-04-01','ABC', 19, 29, 39, 49),
					  (1065, 'J', 'Shyambazar', 3690313880, 'jop@gmail.com', '1999-12-10', '2018-04-09', '2021-04-01','ABC', 20, 30, 40, 50)

select * from dbo.Student
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
BCA/*

/*drop table dbo.Student
drop table dbo.Batch
drop table dbo.Course
drop table dbo.Department
drop table dbo.StudentStatus*/

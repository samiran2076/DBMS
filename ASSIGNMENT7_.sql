/*1.Drop and create Student and Department tables. Don’t create Primary key, unique key or foreign key constraints on the tables now.*/
DROP TABLE dbo.Student
DROP TABLE dbo.Department
/*Commands completed successfully.
Completion time: 2020-10-06T11:53:39.6535868+05:30*/

CREATE TABLE dbo.Student
(
StudentId INT, 
StudentName VARCHAR(100),
StudentAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
DateOfBirth Date,
DateOfAdmission Date,
DateOfPassing Date,
DeptName VARCHAR(50),
DeptId INT,
CourseName VARCHAR(50),
BatchName VARCHAR(10),
StudentStatus VARCHAR(10),
AadharId NUMERIC(16,0)
)

CREATE TABLE dbo.Department
(
DeptId  INT ,
DeptName VARCHAR(50)
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T11:54:28.9707402+05:30*/

/*2.Create clustered index on studentId column of Student table*/
CREATE CLUSTERED INDEX IX_Student_StudentId ON dbo.Student(StudentId)

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:07:48.1470336+05:30*/

/*3.Create unique clustered index on deptId column of Department table*/
CREATE UNIQUE CLUSTERED INDEX IX_Department_DeptId ON dbo.Department(DeptId)

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:08:43.9185671+05:30*/

/*4.Create a nonclustered index on name, address columns of Student table only for the students whose address is Kolkata.*/
CREATE NONCLUSTERED INDEX IX_Student_StudentName_Address ON dbo.Student(StudentName,StudentAddress)
 WHERE StudentAddress = 'kolkata'

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:15:27.8817988+05:30*/

/*5.Drop and recreate the nonclustered index. Email and phone columns should be added as included columns.*/
DROP INDEX IX_Student_StudentName_Address ON dbo.Student

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:22:33.5532924+05:30*/

CREATE NONCLUSTERED INDEX IX_Student_Sname_Address ON dbo.Student(StudentName,StudentAddress)
INCLUDE (Email,Phone)

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:23:43.5456609+05:30*/

/*6.	Insert 10 records in Student table and 4 records in Department table.*/
INSERT INTO dbo.Student
(StudentId, StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,DeptId,CourseName,BatchName,StudentStatus,AadharId)
VALUES
(1016,'Samiran','Kolkata', 8210027998,'samiran@gmail.com','2000-11-03','2018-06-07','2022-06-07','CSE',101,'BTECH', 'BCS3A','Active',	4402),
(1017,'Rajdeep','Srinagar',8210027997,'xyz@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CSE',101,	'BCA', ' BCS3A','Active',	4403),
(1018,'Bidyut', 'Delhi',  8227998678,'abc@gmail.com','2000-11-03','2018-06-07','2022-06-07','	ECE',105,	'BTECH', 'BCS3A','Active',	4404),
(1019,'Shuvam', 'Kolkata',8210027998,'def@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'ME',108,	'BSC',	'BCS3A','Active',	4405),
(1020,'Pratik', 'Kolkata',8210027898,'ghi@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CE',107,	'BCOM', 'BCS3A','Active',	6406),
(1021,'Hritik','Indore',  8210227998,'jkl@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CIVIL',106,'BTECH','BCS3B','Active',	7407),
(1022,'Sayan',  'Pune',   8210060998,'mno@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CSE',101,	'BCS',	'BCS3A','Active',	9408),
(1023,'Sourav', 'Delhi',  8210022398,'pqr@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'ECE',105,	'BTECH','BCS3A','Completed',2409),
(1024,'Yuvraj', 'Mumbai', 8310027998,'stu@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'IT',103,	'BTECH','BCS3C','Completed',3410),
(1025,'Aritra', 'Delhi',  8210027998,'vxy@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'IT',103,	'BTECH','BCS3B','Active',	7411)
TRUNCATE TABLE dbo.Department
/*OUTPUT
(10 rows affected)
TRUNCATE TABLE dbo.Student
Completion time: 2020-10-06T12:27:36.9936022+05:30*/

INSERT INTO dbo.Department
(DeptId, DeptName)
VALUES
(101,'CSE'),
(102,'ME'),
(103,'IT'),
(104,'CE');

/*OUTPUT
(4 rows affected)
Completion time: 2020-10-06T12:27:51.6487775+05:30*/

/*7.Create a view named vStudentDept to retrieve student id, studentname and departname by joining both the tables. WITH SCHEMABINDING option should be added.*/
CREATE VIEW dbo.vStudentDept
WITH SCHEMABINDING AS
SELECT s.StudentId,s.StudentName,d.DeptName
FROM dbo.Student AS s
INNER JOIN dbo.DEPARTMENT d ON s.DeptId=d.DeptId
GO
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:42:04.1848402+05:30*/

/*8.Retrieve Studentname and departname from vStudentDept view only for CSE department.*/
SELECT StudentName,DeptName
FROM dbo.vStudentDept
WHERE DeptName='CSE'

/*OUTPUT
StudentName	DeptName
Samiran	CSE
Rajdeep	CSE
Sayan	CSE*/

/*9.Create a unique clustered index on student id column of vStudentDept view.*/
CREATE UNIQUE CLUSTERED INDEX IX_vStudentDept_StudentId ON dbo.vStudentDept(StudentId)

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-06T12:50:14.7443923+05:30*/

/*10.Create a nonclustered index on departname column of vStudentDept view.*/
CREATE NONCLUSTERED INDEX IX_vStudentDept_DeptName ON dbo.vStudentDept(DeptName) 

/*OUTPUT
Commands completed successfully.

Completion time: 2020-10-06T12:50:53.0610754+05:30*/
execute sp_help 'dbo.Student'
execute sp_help 'dbo.vStudentDept'

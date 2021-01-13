/*1.	Drop all the five tables created so far ie, Student, Department, Course, Batch, StudentStatus.*/
DROP TABLE dbo.Student
DROP TABLE dbo.Batch
DROP TABLE dbo.Course
DROP TABLE dbo.Department
DROP TABLE dbo.StudentStatus
/*OUTPUT
Commands completed successfully.

Completion time: 2020-09-24T11:58:37.0446461+05*/

/*2.	Create the Student table again with a new column AadharId NUMERIC(16,0). StudentId and AadharId should be declared as NOT NULL. Create Primary key on studentid column and unique key on AadharId column.*/
CREATE TABLE dbo.Student
(
StudentId INT NOT NULL CONSTRAINT PK_STUDENT_StudentId PRIMARY KEY CLUSTERED (StudentId),
StudentName VARCHAR(100),
StudentAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
DateOfBirth Date,
DateOfAdmission Date,
DateOfPassing Date,
DeptName VARCHAR(50),
CourseName VARCHAR(50),
BatchName VARCHAR(10),
StudentStatus VARCHAR(10),
AadharId NUMERIC(16,0) NOT NULL CONSTRAINT UK_Student_AadharId UNIQUE(AadharId)
)
SELECT * FROM dbo.Student
/*OUTPUT
Commands completed successfully.
Completion time: 2020-09-24T12:10:41.8930435+05:30*/

/*3.	Create the below four tables again with primary key constraint on the id columns: 
a.	Department – DeptId
b.	Course – CourseId
c.	Batch -- BatchId 
d.	StudentStatus -- StatusId*/

CREATE TABLE dbo.Department
(
DeptId  INT CONSTRAINT PK_Department_DepartmentId PRIMARY KEY CLUSTERED(DeptId),
DeptName VARCHAR(50)
)

CREATE TABLE dbo.Course
(
CourseId INT CONSTRAINT PK_Course_CourseId PRIMARY KEY CLUSTERED(CourseId),
CourseName VARCHAR(50)
)

CREATE TABLE dbo.Batch
(
BatchId INT CONSTRAINT PK_Batch_BatchId PRIMARY KEY CLUSTERED(BatchId),
BatchName VARCHAR(50)
)

CREATE TABLE dbo.StudentStatus
(
StatusId INT CONSTRAINT PK_StudentStatus_StatusId PRIMARY KEY CLUSTERED(StatusId),
StatusDesc VARCHAR(50)
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-09-24T12:24:46.0648627+05:30*/

/*4.	Insert 4 records in each of the four tables.*/
INSERT INTO dbo.Department
(DeptId, DeptName)
VALUES
(1005,'CSE'),
(1006,'ECE'),
(1007,'CSE'),
(1008,'EE')
/*OUTPUT
4 rows affected
*/
INSERT INTO dbo.Course
(CourseId, CourseName)
VALUES
(1012,'BTECH'),
(1013,'BCA'),
(1014,'BSC'),
(1015,'BCOM')
/*OUTPUT
4 rows affected
*/
INSERT INTO dbo.Batch
(BatchId, BatchName)
VALUES
(10,'BCS3A'),
(11,'BCS3B'),
(12,'BCS3A'),
(13,'BCC3C')
/*OUTPUT
4 rows affected
*/
INSERT INTO dbo.StudentStatus
(StatusId,StatusDesc)
VALUES
(2076,'Active'),
(2075,'Completed'),
(2074,'Active'),
(2073,'Active')
/*OUTPUT
4 rows affected
*/

/*5.	Insert 10 records in Student table.*/
INSERT INTO dbo.Student
(StudentId, StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,CourseName,BatchName,StudentStatus,AadharId)
VALUES
(1016,'Samiran','Kolkata', 8210027998,'samiran@gmail.com','2000-11-03','2018-06-07','2022-06-07','CSE','BTECH', 'BCS3A','Active',	4402),
(1017,'Rajdeep','Srinagar',8210027997,'xyz@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CSE',	'BCA', ' BCS3A','Active',	4403),
(1018,'Bidyut', 'Delhi',  8227998678,'abc@gmail.com','2000-11-03','2018-06-07','2022-06-07','	ECE','	BTECH', 'BCS3A','Active',	4404),
(1019,'Shuvam', 'Kolkata',8210027998,'def@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'ME',	'BSC',	'BCS3A','Active',	4405),
(1020,'Pratik', 'Kolkata',8210027898,'ghi@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CE',	'BCOM', 'BCS3A','Active',	6406),
(1021,'Hritik','Indore',  8210227998,'jkl@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CIVIL','BTECH','BCS3B','Active',	7407),
(1022,'Sayan',  'Pune',   8210060998,'mno@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'CSE',	'BCS',	'BCS3A','Active',	9408),
(1023,'Sourav', 'Delhi',  8210022398,'pqr@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'ECE',	'BTECH','BCS3A','Completed',2409),
(1024,'Yuvraj', 'Mumbai', 8310027998,'stu@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'IT',	'BTECH','BCS3C','Completed',3410),
(1025,'Aritra', 'Delhi',  8210027998,'vxy@gmail.com','2000-11-03','2018-06-07','2022-06-07',	'IT',	'BTECH','BCS3B','Active',	7411)

/*OUTPUT
(10 rows affected)
*/

TRUNCATE TABLE dbo.Student

/*6.	Alter the Student table to add a new column named studenttype CHAR(1). It should be Not NULL and default value is ‘R’. Possible values are ‘R’ , ‘P’ and ‘C’.
7.	Create a Check constraint on studenttype column in Student table to restrict the values only to ‘R’ , ‘P’ and ‘C’. */
ALTER TABLE dbo.Student
ADD StudentType CHAR(1) NOT NULL DEFAULT('R'); 
/*output
Commands completed successfully.

Completion time: 2020-09-24T12:58:07.4146540+05:30*/

/*7.	Create a Check constraint on studenttype column in Student table to restrict the values only to ‘R’ , ‘P’ and ‘C’. */
ALTER TABLE dbo.Student
ADD CONSTRAINT CHK_StudentType_Student
CHECK(StudentType='R' OR StudentType='P' OR StudentType='C');
/*output
Commands completed successfully.

Completion time: 2020-09-24T12:58:07.4146540+05:30*/

INSERT INTO dbo.Student
(StudentId, StudentName,StudentAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptName,CourseName,BatchName,StudentStatus,AadharId)
VALUES
(1016,'Samiran','Kolkata', 8210027998,'samiran@gmail.com','2000-11-03','2018-06-07','2022-06-07','CSE','BTECH', 'BCS3A','Active',	4402)

/*OUTPUT
Violation of PRIMARY KEY constraint 'PK_STUDENT_StudentId'. Cannot insert duplicate key in object 'dbo.Student'. The duplicate key value is (1016).
The statement has been terminated.
*/
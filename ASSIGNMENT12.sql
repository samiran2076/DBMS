/*1.Create a table named StudentBkup having the same structure as Student. One identity primary key column to be added as studentBkupId. No other constraint needs to be created.*/

CREATE TABLE dbo.StudentBkup
(
    StudentBkupId INT IDENTITY (1,1) NOT NULL,    
    StudentId INT,
	StudentName VARCHAR(100),
	StudentAddress VARCHAR(200),
	Phone NUMERIC(10,0),
	Email	VARCHAR(50),
	DateOfBirth Date,
	DateOfAdmission Date,
	DateOfPassing Date,
	DeptName VARCHAR(50),
	DeptId INT,
	CourseName VARCHAR(50),
	BatchName VARCHAR(50),
	StudentStatus VARCHAR(50),
	AadharId INT,
	CourseId INT,
	StudentStatusId INT,
	BatchId INT,
	StatusId INT,
    CONSTRAINT PK_StudentBkup_StudentBkupId PRIMARY KEY CLUSTERED (StudentBkupId)
)
SELECT * FROM dbo.StudentBkup

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-19T12:05:52.4017288+05:30

StudentBkupId	StudentId	StudentName	StudentAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptName	DeptId	CourseName	BatchName	StudentStatus	AadharId	CourseId	StudentStatusId	BatchId	StatusId
*/

/*2.Create a table named ExamMarksNew having the same structure as ExamMarks. One identity primary key column to be added as examMarksNewId. No other constraint needs to be created*/

CREATE TABLE  dbo.ExamMarksNew
(
examMarksNewId INT IDENTITY  NOT NULL ,
exammarksId  INT,
examId INT,
studentId INT,
marks INT,
CONSTRAINT PK_ExamMarks_ExamMarksNewId PRIMARY KEY CLUSTERED (examMarksNewId)
)
SELECT * FROM dbo.ExamMarksNew

/*
examMarksNewId	exammarksId	examId	studentId	marks
*/

/*Commands completed successfully.
Completion time: 2020-11-19T12:18:06.9576551+05:30*/

/*3.	Create a DML after trigger to insert the deleted/modified data from Student table to StudentBkup table every time a delete or update happens on the table. */

IF OBJECT_ID('tr_trigger1' ,'TR') IS NOT NULL
	DROP TRIGGER trigger1
GO

CREATE TRIGGER trigger1
ON dbo.Student 
AFTER  UPDATE, DELETE   
AS 
BEGIN
	SELECT 'Trigger called for student table data change'
	SELECT 'Data from the magic tables'
	INSERT INTO dbo.StudentBkup
	SELECT *FROM deleted
END
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-19T12:58:54.7159035+05:30
*/

/*4.	Create a DML instead of trigger to insert the data to be modified/added in ExamMarks table to ExamMarksNew table every time a update/insert happens on the table. There will be no change to the original table data.*/

IF OBJECT_ID('tr_trigger2' ,'TR') IS NOT NULL
	DROP TRIGGER tr_trigger2
GO

CREATE TRIGGER tr_trigger2
ON dbo.ExamMarks
INSTEAD OF UPDATE, INSERT   
AS 
BEGIN
	INSERT INTO dbo.ExamMarksNew
	SELECT *FROM inserted
END
GO

/*OUTPUT
Commands completed successfully.
Completion time: 2020-11-19T12:59:14.1701168+05:30
*/

sp_help 'dbo.StudentBkup'

/*OUTPUT
Name	Owner	Type	Created_datetime
StudentBkup	dbo	user table	2020-11-19 12:57:55.513

Column_name	Type	Computed	Length	Prec	Scale	Nullable	TrimTrailingBlanks	FixedLenNullInSource	Collation
StudentBkupId	int	no	4	10   	0    	no	(n/a)	(n/a)	NULL
StudentId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
StudentName	varchar	no	100	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
StudentAddress	varchar	no	200	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
Phone	numeric	no	9	10   	0    	yes	(n/a)	(n/a)	NULL
Email	varchar	no	50	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
DateOfBirth	date	no	3	10   	0    	yes	(n/a)	(n/a)	NULL
DateOfAdmission	date	no	3	10   	0    	yes	(n/a)	(n/a)	NULL
DateOfPassing	date	no	3	10   	0    	yes	(n/a)	(n/a)	NULL
DeptName	varchar	no	50	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
DeptId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
CourseName	varchar	no	50	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
BatchName	varchar	no	50	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
StudentStatus	varchar	no	50	     	     	yes	no	yes	SQL_Latin1_General_CP1_CI_AS
AadharId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
CourseId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
StudentStatusId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
BatchId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
StatusId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL

Identity	Seed	Increment	Not For Replication
StudentBkupId	1	1	0

RowGuidCol
No rowguidcol column defined.

Data_located_on_filegroup
PRIMARY

index_name	index_description	index_keys
PK_StudentBkup_StudentBkupId	clustered, unique, primary key located on PRIMARY	StudentBkupId

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_StudentBkup_StudentBkupId	(n/a)	(n/a)	(n/a)	(n/a)	StudentBkupId
*/

sp_help 'dbo.ExamMarksNew'

 /*OUTPUT
 Name	Owner	Type	Created_datetime
ExamMarksNew	dbo	user table	2020-11-19 12:18:06.757

Column_name	Type	Computed	Length	Prec	Scale	Nullable	TrimTrailingBlanks	FixedLenNullInSource	Collation
examMarksNewId	int	no	4	10   	0    	no	(n/a)	(n/a)	NULL
exammarksId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
examId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
studentId	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL
marks	int	no	4	10   	0    	yes	(n/a)	(n/a)	NULL

Identity	Seed	Increment	Not For Replication
examMarksNewId	1	1	0

RowGuidCol
No rowguidcol column defined.

Data_located_on_filegroup
PRIMARY

index_name
PK_ExamMarks_ExamMarksNewId

constraint_type
PRIMARY KEY (clustered)
*/

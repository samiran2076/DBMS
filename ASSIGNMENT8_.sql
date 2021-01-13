/*1.	Drop and create Student and Department tables again. */
DROP VIEW dbo.vStudentDept
DROP TABLE dbo.Student
DROP TABLE dbo.Department

CREATE TABLE dbo.Student
(
StudentId INT NOT NULL, 
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
CourseId INT,
BatchName VARCHAR(10),
BatchId INT,
StudentStatus VARCHAR(10),
StatusId INT,
AadharId NUMERIC(16,0)
)

/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

CREATE TABLE dbo.Department
(
DeptId  INT NOT NULL ,
DeptName VARCHAR(50)
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*2.Create Primary key on deptid column of Department and studentid column of Student table respectively.*/

alter table dbo.Department
add constraint PK_Department_DeptId Primary KEY clustered (DeptId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT PK_Student_StudentId PRIMARY KEY CLUSTERED(StudentId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*3.Create the following tables with PK on the identity columns:
a.	Faculty : facultyId INT IDENTITY, facultyname, deptid*/
CREATE TABLE dbo.Faculty
(
FacultyId  INT NOT NULL IDENTITY CONSTRAINT PK_Faculty_FacultyId PRIMARY KEY CLUSTERED(FacultyId),
FacultyName VARCHAR(50),
DeptId INT
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*b.Subject: subjectId INT IDENTITY, subjectname, facultyid1, facultyid2*/
CREATE TABLE dbo.Subject
(
SubjectId  INT NOT NULL IDENTITY CONSTRAINT PK_Subject_SubjectId PRIMARY KEY CLUSTERED(SubjectId),
subjectname VARCHAR,
facultyid1 INT,
facultyid2 INT
)
ALTER TABLE dbo.Subject 
ALTER COLUMN subjectname VARCHAR(50)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*c.	CourSub: courSubId INT IDENTITY, courseId INT, subjectId INT*/
CREATE TABLE dbo.CourSub
(
courSubId  INT NOT NULL IDENTITY CONSTRAINT PK_CourSub_courSubId PRIMARY KEY CLUSTERED(courSubId),
courseId INT,
subjectId INT
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*d.	Exam: examId INT IDENTITY, courSubId, exam-date, batchId, totalmarks, passmarks*/
create table dbo.Exam
(
ExamId INT IDENTITY NOT NULL,
CourSubId INT,
BatchId INT,
TotalMarks INT,
PassMarks INT,
ExamDate DATE,
CONSTRAINT PK_Exam_ExamId Primary Key CLUSTERED(ExamId)
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*e.	ExamMarks: exammarksId INT IDENTITY, examId, studentId, marks*/

CREATE TABLE dbo.ExamMarks
(
exammarksId  INT NOT NULL IDENTITY CONSTRAINT PK_ExamMarks_exammarksId PRIMARY KEY CLUSTERED(exammarksId),
examId INT,
studentId INT,
marks INT
)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*4.	Add a new column deptId for Course table.*/
 ALTER TABLE dbo.Course
 ADD DeptId INT
 /*OUTPUT
 Commands completed successfully.
Completion time: 2020-10-15T12:35:10.3393350+05:30*/

/*5.	Create the following relationships
a.	Course to Department*/
ALTER TABLE dbo.Course
ADD CONSTRAINT FK_Course_DeptId FOREIGN KEY(DeptId) REFERENCES dbo.Department(DeptId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T12:39:15.4405056+05:30*/

/*b.	Student to Department, Course, Batch, StudentStatus*/
ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_DeptId FOREIGN KEY(DeptId) 
REFERENCES dbo.Department(DeptId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_CourseId FOREIGN KEY(CourseId) REFERENCES dbo.Course(CourseId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_BatchId FOREIGN KEY(BatchId) REFERENCES dbo.Batch(BatchId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_StatusId FOREIGN KEY(StatusId) REFERENCES dbo.StudentStatus(StatusId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*c.Faculty to Department*/
ALTER TABLE dbo.Faculty
ADD CONSTRAINT FK_Faculty_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*d.Subject to Faculty*/

ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid1 FOREIGN KEY(Facultyid1)
REFERENCES dbo.Faculty(FacultyId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid2 FOREIGN KEY(Facultyid2)
REFERENCES dbo.Faculty(FacultyId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*e.    CourSub to Course, Subject*/

ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourSub_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourseSub_Subject FOREIGN KEY(SubjectId)
REFERENCES dbo.Subject(SubjectId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/*f.Exam to CourSub, batch*/

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_CourSub FOREIGN KEY(CourSubId)
REFERENCES dbo.CourSub(CourSubId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

/* g. ExamMarks to Exam, Student*/
ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Exam FOREIGN KEY(ExamId)
REFERENCES dbo.Exam(ExamId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/

ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Student FOREIGN KEY(StudentId)
REFERENCES dbo.Student(StudentId)
/*OUTPUT
Commands completed successfully.
Completion time: 2020-10-15T11:55:22.4310918+05:30*/



1.	Department
2.	StudentStatus
3.	Batch
4.	Course
5.	Student
6.	Faculty
7.	Subject
8.	CourSub
9.	Exam
10.	ExamMarks
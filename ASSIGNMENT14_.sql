
create table dbo.EmployeeDetails(
 EmpId INT,
EmpName VARCHAR(50),
ManagerId INT,
DateOfJoining DATE
)

insert into dbo.EmployeeDetails(EmpId,	EmpName,ManagerId,DateOfJoining)
values(1001,			'Fnm1 Lnm1'	,			1002,			'2019-01-01'),
	   (1002,			'Fnm2 Lnm2'	,			1005,			'2018-01-02'),
	   (1003,			'Fnm3 Lnm3',			1006,			'2019-01-03'),
	   (1004,			'Fnm4 Lnm4'	,			1007	,		'2018-01-04')

select * from dbo.EmployeeDetails

create table dbo.EmployeeSalary(
EmpId INT,
ProjectId CHAR(5),
ProjectLocation VARCHAR(20),
Salary MONEY
)
select * from dbo.EmployeeSalary

insert into dbo.EmployeeSalary(EmpId,	ProjectId,	ProjectLocation,	Salary)
values(1001,	'P1',	'Kolkata',	10000),
(1002,	'P2',	'Kolkata',	10100),
(1003,	'P3',	'Kolkata',	10200),
(1005,	'P1',	'Mumbai',	10300)

/*1.Write a SQL query to fetch the count of employees working in project 'P1'.*/

SELECT COUNT(EmpId) AS CD
FROM dbo.EmployeeSalary
WHERE ProjectId='P1'

/*OUTPUT
CD
2
*/

/*2.Write a SQL query to fetch employee names having salary greater than or equal to 10100 and less than or equal 10200.*/
select ED.EmpName
from dbo.EmployeeDetails as ED
inner join dbo.EmployeeSalary as ES
on ED.EmpId=ES.EmpId
WHERE ES.Salary>=10100 AND ES.Salary<=10200

/*OUTPUT
EmpName
Fnm2 Lnm2
Fnm3 Lnm3
*/

/*3.Write a SQL query to fetch project-wise count of employees sorted by project's employee count in descending order.*/
SELECT ProjectId, count(EmpId) as EmpProjectCount
from dbo.EmployeeSalary
group by ProjectId
order by EmpProjectCount desc

/*
ProjectId	EmpProjectCount
P1   	2
P2   	1
P3   	1
*/

/*4.Write a query to fetch only the first name (string before space) from the FullName column of EmployeeDetails table.*/

SELECT SUBSTRING(EmpName,0,CHARINDEX(' ',EmpName)) AS FirstName FROM EmployeeDetails

/*FirstName
Fnm1
Fnm2
Fnm3
Fnm4*/

/*5.Write a SQL query to fetch all employee records from EmployeeDetails table who have a valid salary value in EmployeeSalary table.*/

select ED.EmpName,Ed.EmpId,ED.ManagerId,ED.DateOfJoining,ES.Salary
from dbo.EmployeeDetails as ED
JOIN dbo.EmployeeSalary as ES 
on ED.EmpId=ES.EmpId
where ES.Salary>0

/*OUTPUT
EmpName	EmpId	ManagerId	DateOfJoining	Salary
Fnm1 Lnm1	1001	1002	2019-01-01	10000.00
Fnm2 Lnm2	1002	1005	2018-01-02	10100.00
Fnm3 Lnm3	1003	1006	2019-01-03	10200.00
*/

/*6.Write a query to fetch employee names and salary records. Return employee details even if the salary record is not present for the employee.*/

select ED.EmpName,ES.Salary
from dbo.EmployeeDetails as ED
LEFT JOIN dbo.EmployeeSalary AS ES
on ED.EmpId=ES.EmpId

/*OUTPUT
EmpName	Salary
Fnm1 Lnm1	10000.00
Fnm2 Lnm2	10100.00
Fnm3 Lnm3	10200.00
Fnm4 Lnm4	NULL
*/
/*7.Write a SQL query to fetch all the Employees who are also managers from EmployeeDetails table.*/
-- NOT PREFFERED SYNTAX
SELECT a.EmpName , a.EmpId
FROM EmployeeDetails a,EmployeeDetails b
WHERE a.EmpId=b.ManagerId

/*OUTPUT
EmpName	EmpId
Fnm2 Lnm2	1002
*/

/*8.Write a SQL query to fetch duplicate records from EmployeeSalary table.*/
insert into dbo.EmployeeSalary
(
EmpId,
ProjectId,
ProjectLocation,
Salary
)
values
(1001,'P1','Kolkata',10000),
(1002,'P2','Kolkata',10100),
(1003,'P3','Kolkata',10200),
(1005,'P1','Mumbai',10300),
(1001,'P1','Kolkata',10000)

SELECT EmpId, ProjectId, Salary, COUNT(EmpId) as EPC
FROM dbo.EmployeeSalary
GROUP BY EmpId, ProjectId, Salary
HAVING COUNT(EmpId) > 1;
/*
EmpId	ProjectId	Salary	EPC
1001	P1   	10000.00	3
1002	P2   	10100.00	2
1003	P3   	10200.00	2
1005	P1   	10300.00	2
*/

--08.12.2020
/*9.	Write a SQL query to remove duplicate Employees from EmployeeSalary table without using temporary table.*/

DELETE FROM dbo.EmployeeSalary
WHERE EmpId IN
(SELECT ES.EmpId
FROM dbo.EmployeeSalary AS ES
GROUP BY ES.EmpId,ES.ProjectId,ES.ProjectLocation,ES.Salary
HAVING COUNT(ES.EmpId)>1
)
SELECT ES.EmpId,
       ES.ProjectId,
       ES.ProjectLocation,
       ES.Salary
FROM dbo.EmployeeSalary AS ES

/*
EmpId    ProjectId    ProjectLocation    Salary
1002    P2       Kolkata    10100.00
1003    P3       Kolkata    10200.00
1005    P1       Mumbai    10300.00
*/

/*10.	Write a SQL query to create an empty table with same structure of EmployeeSalary table.*/
--do by select clause
create table dbo.EmployeeSalary2(
EmpId INT,
ProjectId CHAR(5),
ProjectLocation VARCHAR(20),
Salary MONEY
)
/*Commands completed successfully.
Completion time: 2020-12-08T12:31:15.8354777+05:30*/

/*11.	Write a SQL query to fetch records that are present in EmployeeDetails table but not in EmployeeSalary table.*/

select E.EmpId	--E.EmpName,	E.ManagerId,E.DateOfJoining
from dbo.EmployeeDetails as E
EXCEPT
select ES.EmpId--ES.ProjectId,	ES.ProjectLocation,	ES.Salary
from dbo.EmployeeSalary as ES
/*
EmpId
1004
*/

/*12.	Write a SQL query to fetch all the Employees details from EmployeeDetails table who joined in Year 2018.*/

SELECT ed.EmpId,	ed.EmpName,	ed.ManagerId,	ed.DateOfJoining
 FROM dbo.EmployeeDetails as ed
WHERE ed.DateOfJoining > '2018-01-01' AND ed.DateOfJoining < '2018-12-31'
/*
EmpId	EmpName	ManagerId	DateOfJoining
1002	Fnm2 Lnm2	1005	2018-01-02
1004	Fnm4 Lnm4	1007	2018-01-04
*/

/*13.	Write a SQL query to fetch top 2 employees based on their salary*/

Select top 2
    es.EmpId,
    es.ProjectId,
    es.ProjectLocation,
    es.Salary
from dbo.EmployeeSalary as es
ORDER BY ES.Salary DESC
/*
EmpId	ProjectId	ProjectLocation	Salary
1005	P1   	Mumbai	10300.00
1005	P1   	Mumbai	10300.00
*/

/*14.	Write a SQL query to find the 3rd highest salary from table.*/

SELECT TOP 1
       s.EmpID,
       s.ProjectId,
       s.ProjectLocation,
       s.Salary
FROM
(SELECT TOP 3
        es.EmpID,
        es.ProjectId,
        es.ProjectLocation,
        es.Salary

FROM dbo.EmployeeSalary as es
ORDER BY es.Salary DESC
) as s
ORDER BY s.Salary ASC

/*EmpID	ProjectId	ProjectLocation	Salary
1003	P3   	Kolkata	10200.00*/

15.	Write a SQL query to fetch manager records for the employees that are present in the Employee table.*/

select ed.EmpId,ed.EmpName,ed.DateOfJoining,ed.ManagerId
from dbo.EmployeeDetails as ed
inner join dbo.EmployeeDetails as ed1 on ed.EmpId=ed1.ManagerId

/*EmpId	EmpName	DateOfJoining	ManagerId
1002	Fnm2 Lnm2	2018-01-02	1005
*/
/*16.	Write a SQL query to retrieve the max, min and total salary for the employees in each project only for Kolkata location projects.*/

SELECT MAX(ES.Salary) AS 'Maximum Salary',
       MIN(ES.Salary) AS 'Minimum Salary',
       SUM(ES.Salary) AS 'Total Salary',
	   ES.ProjectId
FROM dbo.EmployeeSalary AS ES
WHERE ES.ProjectLocation = 'Kolkata'
GROUP BY ES.ProjectId

/*
Maximum Salary	Minimum Salary	Total Salary
10000.00	10000.00	40000.00
10100.00	10100.00	20200.00
10200.00	10200.00	20400.00*/
create database HR_Analytics
use HR_Analytics;


--Data Exploration


--All detils about Employee table
SELECT * FROM dbo.Employee;


--Number of rows in Employee table
SELECT COUNT(*) as Total_row FROM Employee;


--Number of columns in employee table
SELECT COUNT(*) AS total_column
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employee';


--Unique departments in Employee table
SELECT Department FROM Employee
GROUP BY Department;


--Unique JobRole
SELECT  DISTINCT JobRole AS Unique_JobRole 
FROM Employee;


--how many male and female employees are working
SELECT
	CASE
		WHEN Gender = 'Male' THEN 'Male'
		WHEN Gender = 'Female'  THEN 'Female'
	END AS Gender,
	COUNT(*) AS  Gender_count
FROM Employee
GROUP BY Gender;

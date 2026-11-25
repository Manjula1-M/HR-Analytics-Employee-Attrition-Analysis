---Data cleaning

--Null value
SELECT *  FROM Employee
WHERE  BusinessTravel IS NULL
OR Attrition IS NULL
OR Age IS NULL
OR DailyRate IS NULL
OR Department IS NULL
OR DistanceFromHome IS NULL
OR  Education IS NULL
OR EducationField IS NULL
OR EmployeeCount IS NULL
OR EmployeeNumber IS NULL
OR EnvironmentSatisfaction IS NULL
OR Gender IS NULL
OR HourlyRate IS NULL
OR JobInvolvement IS NULL
OR JobLevel IS NULL
OR JobRole IS NULL
OR JobSatisfaction IS NULL
OR MaritalStatus IS NULL
OR MonthlyIncome IS NULL
OR MonthlyRate IS NULL
OR NumCompaniesWorked IS NULL
OR Over18 IS NULL
OR OverTime IS NULL
OR PercentSalaryHike IS NULL
OR PerformanceRating IS NULL
OR RelationshipSatisfaction IS NULL
OR StandardHours IS NULL
OR  StockOptionLevel IS NULL
OR TotalWorkingYears IS NULL
OR TrainingTimesLastYear IS NULL
OR WorkLifeBalance IS NULL
OR YearsAtCompany IS NULL
OR YearsInCurrentRole IS NULL
OR YearsSinceLastPromotion IS NULL
OR YearsWithCurrManager is null


--Duplicate records in Employee table
SELECT EmployeeNumber, COUNT(*) AS Duplicate_count FROM Employee
GROUP BY EmployeeNumber
having COUNT(*)>1;


--Invalid age group 
SELECT * FROM Employee
WHERE Age <=0 OR Age >=100;


--who is not over18
SELECT * FROM Employee
WHERE Over18 <> 'Y';

---Invalid monthly income 
SELECT * FROM Employee
WHERE MonthlyIncome <=0;

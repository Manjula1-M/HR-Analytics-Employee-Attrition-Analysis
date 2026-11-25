---business analysis 

--Attrition count in Employee table
SELECT
	CASE
		WHEN Attrition = 0 THEN 'Stayed'
		WHEN Attrition = 1 THEN 'Left'
	END AS Employee_Status,
	COUNT(*) AS Employee_count
FROM Employee
GROUP BY Attrition;



--which department has high attrition
SELECT 
    Department,
	COUNT(CASE
		WHEN Attrition = '1' THEN 'Left' 
		END) AS Employee_Left,
	COUNT(CASE
		WHEN Attrition = '0' THEN 'Stay'
		END) AS Employee_Stay
FROM Employee
GROUP BY Department
ORDER BY Employee_Left DESC;


--salary-wise employee attrition
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Salary'
        WHEN MonthlyIncome < 6000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE
        WHEN Attrition = 1 THEN 1
        ELSE 0
    END) AS Employees_Left

FROM Employee
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Salary'
        WHEN MonthlyIncome < 6000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END;


-- Total monthly salary of each department
SELECT 
	Department,
	SUM(MonthlyIncome) AS Total_monthlySal
FROM Employee
GROUP BY Department
ORDER BY Total_monthlySal;



---Overall attrition percentage
SELECT
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        * 100 / COUNT(*) AS DECIMAL(10,2)
    ) AS Attrition_Percentage

FROM Employee;


---Department-wise attrition percentage
SELECT
    Department,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1.0 ELSE 0 END)
        * 100 / COUNT(*) AS DECIMAL(10,2)
    ) AS Attrition_Percentage

FROM Employee
GROUP BY Department
ORDER BY Attrition_Percentage DESC;


--Gender-wise attrition
SELECT
    Gender,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left,

    SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END)
    AS Employees_Stayed

FROM Employee
GROUP BY Gender;


--Attrition based on overtime
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY OverTime;


--Job role-wise attrition
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY JobRole
ORDER BY Employees_Left DESC;


---Age group-wise attrition
SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE 'Above 55'
    END;


    ---Marital status-wise attrition
    SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY MaritalStatus;



---: Job satisfaction and attrition
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


--Work-life balance and attrition
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;



---Years at company and attrition
SELECT
    YearsAtCompany,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;


--Business travel and attrition
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
    AS Employees_Left

FROM Employee
GROUP BY BusinessTravel;


---Average salary – stayed vs left
SELECT
    CASE
        WHEN Attrition = 1 THEN 'Left'
        WHEN Attrition = 0 THEN 'Stayed'
    END AS Employee_Status,

    AVG(MonthlyIncome) AS Average_Salary

FROM Employee
GROUP BY Attrition;
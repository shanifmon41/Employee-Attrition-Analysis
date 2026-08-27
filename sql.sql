create database main_project;
use main_project;
CREATE TABLE hr_attrition (
    Employee_id int,
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education varchar(20),
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    Salary int,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    NumCompaniesWorked INT,
    OverTime VARCHAR(10),
    Salary_Hike_in_percent int,
    Total_working_years_experience int,
    Work_life_balance int,
    No_of_years_worked_at_current_company int,
    No_of_years_in_current_role int,
    Years_since_last_promotion int
);

ALTER TABLE HR_ATTRITION add primary key(Employee_id);
LOAD DATA LOCAL INFILE 'C:\Users\dell\OneDrive\Desktop\HR_Attrition_dataset.csv'
INTO TABLE hr_attrition
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from hr_attrition;



SELECT *
FROM hr_attrition
WHERE Department IS NULL
   OR Salary IS NULL
   OR Attrition IS NULL;
SELECT 
    COUNT(*) - COUNT(Department) AS Department_nulls,
    COUNT(*) - COUNT(Salary) AS Salary_nulls,
    COUNT(*) - COUNT(Attrition) AS Attrition_nulls,
    COUNT(*) - COUNT(JobRole) AS JobRole_nulls
FROM hr_attrition;
   
SET SQL_SAFE_UPDATES = 0; 
select distinct Department from hr_attrition;
update hr_attrition
set Department = TRIM(Department),
    JobRole = TRIM(JobRole);
    
 UPDATE hr_attrition
SET Department = UPPER(Department);

   


select distinct JobRole from hr_attrition;
UPDATE hr_attrition
SET JobRole = 'HUMAN RESOURCES'
WHERE JobRole = 'HR';

-- ) Compute attrition rates by department and job role
SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM hr_attrition
GROUP BY Department;

-- Job role-wise attrition rate
SELECT 
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM hr_attrition
GROUP BY JobRole
ORDER BY AttritionRate DESC;
  -- Compare salary distribution between stayed and left employees
SELECT 
    Attrition,
    MIN(Salary) AS MinimumSalary,
    MAX(Salary) AS MaximumSalary,
    AVG(Salary) AS AverageSalary
FROM hr_attrition
GROUP BY Attrition;
-- dentify factors affecting attrition
-- Attrition vs tenure
SELECT 
    Attrition,
    AVG(Total_working_years_experience) AS AvgTenure
FROM hr_attrition
GROUP BY Attrition;
-- Attrition vs salary
select attrition,
avg(Salary) as avgSalary
from hr_attrition
group by Attrition;
-- Attrition vsJobSatisfaction
SELECT 
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
FROM hr_attrition
GROUP BY JobSatisfaction;

use main_project;
select * from hr_attrition;
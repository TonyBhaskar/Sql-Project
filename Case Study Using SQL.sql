/*
While converting from pandas dataframe to MySql table it is taken all the object
data type to TEXT data type so I modified the columns with VARCHAR it is totally 
optional, TEXT data type can store variable length String.
*/

ALTER TABLE employee
MODIFY COLUMN Employee_ID VARCHAR(8),
MODIFY COLUMN Full_Name VARCHAR(30),
MODIFY COLUMN Job_Title VARCHAR(30),
MODIFY COLUMN Department VARCHAR(30),
MODIFY COLUMN Business_Unit VARCHAR(30),
MODIFY COLUMN Gender VARCHAR(10),
MODIFY COLUMN Ethnicity VARCHAR(15),
MODIFY COLUMN Age INT,
MODIFY COLUMN Annual_Salary DECIMAL(10, 2),
MODIFY COLUMN Bonus INT,
MODIFY COLUMN Country VARCHAR(20),
MODIFY COLUMN City VARCHAR(30);

-- Renaming the Bonus to Bonus_Percentage to express that the column behaviour
ALTER TABLE employee
RENAME COLUMN Bonus TO Bonus_Percentage;

-- 1.Retrieve full_name, job_title, Department, Annual_Salary information for a specific employee based on their employee ID.
SELECT 
		Full_Name,
		Job_Title,
		Department,
		Annual_Salary
FROM employee 
WHERE Employee_ID = 'E02002';

/*
result:
+-----------+-------------------+-------------+---------------+
| Full_Name | Job_Title         | Department  | Annual_Salary |
+-----------+-------------------+-------------+---------------+
| Kai Le    | Controls Engineer | Engineering |      92368.00 |
+-----------+-------------------+-------------+---------------+
*/

-- 2.Calculate the total salary expenditure for the company.
SELECT
		SUM(Annual_Salary) AS TotalSalaryExpenditure
FROM employee;
/*
result:
+------------------------+
| TotalSalaryExpenditure |
+------------------------+
|           104105182.00 |
+------------------------+
*/

-- 3.Calculate the average salary for each department
SELECT 
		Department, 
		ROUND(AVG(Annual_Salary), 2) AS AverageAnnualSalary
FROM employee
GROUP BY Department;
/*
result:
+-----------------+---------------------+
| Department      | AverageAnnualSalary |
+-----------------+---------------------+
| Engineering     |           107829.73 |
| Sales           |           103334.43 |
| IT              |            91368.55 |
| Accounting      |           122214.34 |
| Finance         |           120900.92 |
| Marketing       |           127627.05 |
| Human Resources |           126051.51 |
| NULL            |           101364.43 |
+-----------------+---------------------+
*/

-- 4.Retrieve the first 5 joined employees
SELECT 
		Full_Name
FROM employee
ORDER BY Hire_Date DESC
LIMIT 5;
/*
result:
+-----------------+
| Full_Name       |
+-----------------+
| Sadie Pham      |
| NULL            |
| Matthew Simmons |
| Lillian Desai   |
| Axel Bailey     |
+-----------------+
*/

-- 5.Count the number of employees in each Department.
SELECT 
		Department,
        COUNT(*) AS EmployeeCount
FROM employee
GROUP BY Department;
/*
result:
+-----------------+---------------+
| Department      | EmployeeCount |
+-----------------+---------------+
| Engineering     |           132 |
| Sales           |           143 |
| IT              |           264 |
| Accounting      |           107 |
| Finance         |            97 |
| Marketing       |           103 |
| Human Resources |           102 |
| NULL            |            37 |
+-----------------+---------------+
*/

-- 6.Retrieve the top 5 earners in the company.
SELECT 
		Full_Name,
        Annual_Salary
FROM employee
ORDER BY Annual_Salary DESC
LIMIT 5;
/*
result:
+-----------------+---------------+
| Full_Name       | Annual_Salary |
+-----------------+---------------+
| Robert Rogers   |     258734.00 |
| Kinsley Huynh   |     258722.00 |
| Christopher Luu |     258700.00 |
| Eloise Williams |     258115.00 |
| Ariana Sharma   |     257725.00 |
+-----------------+---------------+
*/

-- 7.Retrieve the # of Employees who left the company
SELECT 
		COUNT(Full_Name) AS num_empoyees_left
FROM employee
WHERE Exit_Date IS NOT NULL;
/*
result:
+-------------------+
| num_empoyees_left |
+-------------------+
|               101 |
+-------------------+
*/

-- 8.Count the # of employees based on gender
SELECT
		Gender,
        COUNT(*)
FROM employee
WHERE Gender IS NOT NULL
GROUP BY Gender;
/*
result:
+--------+----------+
| Gender | COUNT(*) |
+--------+----------+
| Male   |      462 |
| Female |      486 |
+--------+----------+
*/

-- 9.Retrieve top 5 employees with highest Bonus_Percentage.
SELECT 
		Full_Name, Bonus_Percentage 
FROM employee 
ORDER BY Bonus_Percentage DESC 
LIMIT 5;
/*
result:
+-------------------+------------------+
| Full_Name         | Bonus_Percentage |
+-------------------+------------------+
| Chloe Dixon       |               40 |
| Mia Navarro       |               40 |
| Elijah Washington |               40 |
| Ezra Aguilar      |               40 |
| Hazel Cho         |               40 |
+-------------------+------------------+
*/

-- 10.Retrieve the total # of distinct countries present in the dataset
SELECT 
		DISTINCT(Country), 
        COUNT(*) AS num_countries
FROM employee
WHERE Country IS NOT NULL
GROUP BY Country;
/*result:
+---------------+---------------+
| Country       | num_countries |
+---------------+---------------+
| United States |           585 |
| China         |           215 |
| Brazil        |           131 |
+---------------+---------------+
*/

-- 11.Delete the employee details who left from the company
DELETE FROM employee
WHERE Exit_Date IS NOT NULL;


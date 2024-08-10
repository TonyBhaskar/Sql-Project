Employee Database Case Study
===========================

This case study involves analyzing and querying an employee database to extract insights and answer various questions.

Database Schema
---------------

The employee database consists of a single table `employee` with the following columns:

* `Employee_ID` (VARCHAR(8)): unique identifier for each employee
* `Full_Name` (VARCHAR(30)): full name of the employee
* `Job_Title` (VARCHAR(30)): job title of the employee
* `Department` (VARCHAR(30)): department of the employee
* `Business_Unit` (VARCHAR(30)): business unit of the employee
* `Gender` (VARCHAR(10)): gender of the employee
* `Ethnicity` (VARCHAR(15)): ethnicity of the employee
* `Age` (INT): age of the employee
* `Annual_Salary` (DECIMAL(10, 2)): annual salary of the employee
* `Bonus_Percentage` (INT): bonus percentage of the employee
* `Country` (VARCHAR(20)): country of the employee
* `City` (VARCHAR(30)): city of the employee
* `Hire_Date` (DATE): hire date of the employee
* `Exit_Date` (DATE): exit date of the employee (if applicable)

Queries
-------

The following queries were executed on the database to answer various questions:

1. Retrieve full name, job title, department, and annual salary information for a specific employee based on their employee ID.
2. Calculate the total salary expenditure for the company.
3. Calculate the average salary for each department.
4. Retrieve the first 5 joined employees.
5. Count the number of employees in each department.
6. Retrieve the top 5 earners in the company.
7. Retrieve the number of employees who left the company.
8. Count the number of employees based on gender.
9. Retrieve the top 5 employees with the highest bonus percentage.
10. Retrieve the total number of distinct countries present in the dataset.
11. Delete the employee details who left from the company.

Results
-------

The results of each query are included in the SQL script file.

Note
----

This case study demonstrates various SQL queries and techniques for analyzing and extracting insights from an employee database.

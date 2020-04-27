-- Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
SELECT
	 FIRST_NAME AS "First Name"
	,LAST_NAME AS "Last Name"
FROM EMPLOYEES;

-- Write a query to get unique department ID from employee table
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

-- Write a query to get all employee details from the employee table order by first name, descending.
SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME DESC;

-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
SELECT
	 FIRST_NAME AS "First Name"
	,LAST_NAME AS "Last Name"
    ,SALARY AS "Salary"
    ,CAST((SALARY * 0.15) AS DECIMAL(6,2)) AS "PF"
FROM EMPLOYEES;

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT
	 EMPLOYEE_ID AS "Id"
	,FIRST_NAME AS "First Name"
	,LAST_NAME AS "Last Name"
    ,SALARY AS "Salary"
FROM EMPLOYEES
ORDER BY SALARY;

-- Write a query to get the total salaries payable to employees
SELECT SUM(SALARY) AS "Total Salaries" FROM EMPLOYEES;

-- Write a query to get the maximum and minimum salary from employees table.
SELECT
	 MAX(SALARY) AS "Maximum Salary"
	,MIN(SALARY) AS "Minimum Salary"
FROM EMPLOYEES;

-- Write a query to get the average salary and number of employees in the employees table.
SELECT
	 AVG(SALARY) AS "Average Salary"
	,COUNT(*) AS "Number of Employees"
FROM EMPLOYEES;

-- Write a query to get the number of employees working with the company.
SELECT COUNT(*) AS "Number of Employees" FROM EMPLOYEES;

-- Write a query to get the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JOB_ID) FROM EMPLOYEES;

-- Write a query get all first name from employees table in upper case.
SELECT UPPER(FIRST_NAME) FROM EMPLOYEES;

-- Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTR(FIRST_NAME,1,3) FROM EMPLOYEES;

-- Write a query to calculate 171*214+625.
SELECT 171*214+625;

-- Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS "Name" FROM EMPLOYEES;

-- Write a query to get first name from employees table after removing white spaces from both side.
SELECT TRIM(FIRST_NAME) FROM EMPLOYEES;

-- Write a query to get the length of the employee names (first_name, last_name) from employees table.
SELECT
	 FIRST_NAME
	,LAST_NAME
    ,LENGTH(FIRST_NAME) + LENGTH(LAST_NAME)
FROM EMPLOYEES;

-- Write a query to check if the first_name fields of the employees table contains numbers.
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME REGEXP '[0-9]';

-- Write a query to select first 10 records from a table.
SELECT *
FROM EMPLOYEES
LIMIT 10;

-- Write a query to get monthly salary (round 2 decimal places) of each and every employee.
SELECT
	 EMPLOYEE_ID
	,FIRST_NAME
    ,LAST_NAME
    ,ROUND(SALARY / 12,2)
FROM EMPLOYEES;

-- Write a query to display the name (first_name, last_name) and salary for all employees
-- whose salary is not in the range $10,000 through $15,000.
SELECT
	 FIRST_NAME
    ,LAST_NAME
    ,SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 10000 AND 15000;

-- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
SELECT
	 FIRST_NAME
    ,LAST_NAME
    ,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30,100)
ORDER BY DEPARTMENT_ID;

-- Write a query to display the name (first_name, last_name) and salary for all employees
-- whose salary is not in the range $10,000 through $15,000
-- and are in department 30 or 100.
SELECT
	 FIRST_NAME
    ,LAST_NAME
    ,DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 10000 AND 15000
AND DEPARTMENT_ID IN (30,100);

-- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT
	 FIRST_NAME
    ,LAST_NAME
    ,HIRE_DATE
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = '1987';

-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
SELECT
	 FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%b%'
AND FIRST_NAME LIKE '%c%';

-- Write a query to display the last name, job, and salary for all employees
-- whose job is that of a Programmer or a Shipping Clerk,
-- and whose salary is not equal to $4,500, $10,000, or $15,000.
SELECT
	 LAST_NAME
	,JOB_ID
    ,SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG','SH_CLERK')
AND SALARY NOT IN (4500,10000,15000);

-- Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT
	 LAST_NAME
FROM EMPLOYEES
WHERE LENGTH(LAST_NAME) = 6;

-- Write a query to display the last name of employees having 'e' as the third character.
SELECT
	 LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '__e%';

-- Write a query to display the jobs/designations available in the employees table.
SELECT DISTINCT JOB_ID FROM EMPLOYEES;

-- Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees
SELECT
	 CONCAT(FIRST_NAME,' ',LAST_NAME) AS "Name"
    ,SALARY AS "Salary"
    ,CAST((SALARY * 0.15) AS DECIMAL(6,2)) AS "PF"
FROM EMPLOYEES;

-- Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT *
FROM EMPLOYEES
WHERE LAST_NAME IN ('BLAKE','SCOTT','KING','FORD');
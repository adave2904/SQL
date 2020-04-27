-- Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT JOB_ID) FROM EMPLOYEES;

-- Write a query to get the total salaries payable to employees.
SELECT SUM(SALARY) AS "Total Salaries" FROM EMPLOYEES;

-- Write a query to get the minimum salary from employees table
SELECT MIN(SALARY) AS "Minimum Salary" FROM EMPLOYEES;

-- Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- Write a query to get the average salary and number of employees working the department 90.
SELECT
	 AVG(SALARY)
	,COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-- Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT
	 MAX(SALARY)
	,MIN(SALARY)
    ,SUM(SALARY)
    ,AVG(SALARY)
FROM EMPLOYEES;

-- Write a query to get the number of employees with the same job.
SELECT JOB_ID,COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES;

-- Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT MANAGER_ID,MIN(SALARY)
FROM EMPLOYEES
GROUP BY MANAGER_ID;

-- Write a query to get the department ID and the total salary payable in each department.
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Write a query to get the average salary for each job ID excluding programmer.
SELECT JOB_ID,AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('IT_PROG')
GROUP BY JOB_ID;

-- Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT JOB_ID,SUM(SALARY),MAX(SALARY),MIN(SALARY),AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
GROUP BY JOB_ID;

-- Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JOB_ID,MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING MAX(SALARY) >= 4000;

-- Write a query to get the average salary for all departments employing more than 10 employees.
SELECT DEPARTMENT_ID,AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 10;



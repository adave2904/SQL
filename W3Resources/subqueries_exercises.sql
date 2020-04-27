USE SQL_PRACTICE;
-- Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee
-- whose last_name='Bull'.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME),SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'BULL');

-- Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'IT');

-- Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE MANAGER_ID IN
(SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN
	(SELECT DEPT_ID FROM DEPARTMENTS WHERE LOCATION_ID IN
		(SELECT LOCATION_ID FROM LOCATIONS WHERE COUNTRY_ID = 'US'
        )
	)
);

-- Write a query to find the name (first_name, last_name) of the employees who are managers.
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES);

-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE (JOB_ID,SALARY) IN (SELECT JOB_ID,MIN_SALARY FROM JOBS GROUP BY JOB_ID,MIN_SALARY);

-- Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary
-- and works in any of the IT departments.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
AND DEPARTMENT_ID IN (SELECT DEPT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE '%IT%');

-- Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'BELL');

-- Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK').
-- Sort the results of the salary of the lowest to highest.
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SH_CLERK' GROUP BY SALARY)
ORDER BY SALARY;

-- Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT IN (SELECT MANAGER_ID FROM EMPLOYEES);

-- Write a query to display the employee ID, first name, last name, and department names of all employees.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,(SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPT_ID)
FROM EMPLOYEES E;

-- Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES A
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES B WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID);

-- Write a query to fetch even numbered records from employees table.
SET @i = 0;
SELECT i,EMPLOYEE_ID
FROM (SELECT @i := @i + 1 AS i,EMPLOYEE_ID FROM EMPLOYEES) A
WHERE MOD(A.i,2) = 0;

-- Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT(SALARY)
FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 1 OFFSET 4;

-- Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT(SALARY)
FROM EMPLOYEES
ORDER BY SALARY
LIMIT 1 OFFSET 3;

-- Write a query to select last 10 records from a table.
SELECT *
FROM (SELECT *
	FROM EMPLOYEES
    ORDER BY EMPLOYEE_ID DESC LIMIT 10) A
ORDER BY EMPLOYEE_ID;

-- Write a query to list the department ID and name of all the departments where no employee is working.
SELECT DEPT_ID,DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPT_ID NOT IN (SELECT DISTINCT DEPT_ID FROM EMPLOYEES);

-- Write a query to get 3 maximum salaries.
SELECT DISTINCT(SALARY)
FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 3;

-- Write a query to get 3 minimum salaries.
SELECT DISTINCT(SALARY)
FROM EMPLOYEES
ORDER BY SALARY
LIMIT 3;

-- Write a query to get nth max salaries of employees
SELECT DISTINCT(SALARY)
FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 1 OFFSET n - 1;
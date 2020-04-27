-- Write a SQL statement to change the email column of employees table with 'not available' for all employees.
UPDATE EMPLOYEES SET EMAIL = 'NOT AVAILABLE';

-- Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for all employees.
UPDATE EMPLOYEES SET EMAIL = 'NOT AVAILABLE',COMMISSION_PCT = 0.10;

-- Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for those employees
-- whose department_id is 110.
UPDATE EMPLOYEES
SET EMAIL = 'NOT AVAILABLE',COMMISSION_PCT = 0.10
WHERE DEPARTMENT_ID = 110;

-- Write a SQL statement to change the email column of employees table with 'not available' for those employees
-- whose department_id is 80 and gets a commission is less than .20%
UPDATE EMPLOYEES
SET EMAIL = 'NOT AVAILABLE'
WHERE DEPARTMENT_ID = 110
AND COMMISSION_PCT < 0.20;

-- Write a SQL statement to change the email column of employees table with 'not available'
-- for those employees who belongs to the 'Accounting' department.
UPDATE EMPLOYEES
SET EMAIL = 'NOT AVAILABLE'
WHERE DEPARTMENT_ID IN (SELECT DEPT_ID FROM DEPARTMENTS WHERE DEPT_NAME = 'Accounting');

-- Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE EMPLOYEES
SET SALARY = 8000
WHERE EMPLOYEE_ID = 105
AND SALARY < 5000;

-- Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK
-- if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
UPDATE EMPLOYEES
SET JOB_ID = 'SH_CLERK'
WHERE EMPLOYEE_ID = 118
AND DEPARTMENT_ID = 30
AND JOB_ID NOT LIKE 'SH%';

-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that
-- , salary will be increased by 25% for the department 40
-- , 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE EMPLOYEES
SET SALARY = CASE
				WHEN DEPARTMENT_ID = 40 THEN SALARY + (SALARY * 0.25)
                WHEN DEPARTMENT_ID = 90 THEN SALARY + (SALARY * 0.15)
                WHEN DEPARTMENT_ID = 110 THEN SALARY + (SALARY * 0.10)
                ELSE SALARY
			 END;

-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000
-- as well as the salary for those employees by 20% and commission percent by .10.
UPDATE JOBS,EMPLOYEES
SET
	 JOBS.MIN_SALARY = JOBS.MIN_SALARY + 2000
	,JOBS.MAX_SALARY = JOBS.MAX_SALARY + 2000
    ,EMPLOYEES.SALARY = EMPLOYEES.SALARY + (EMPLOYEES.SALARY*0.20)
    ,EMPLOYEES.COMMISSION_PCT = EMPLOYEES.COMMISSION_PCT + (EMPLOYEES.COMMISSION_PCT*0.10)
WHERE JOBS.JOB_ID = 'PU_CLERK'
AND EMPLOYEES.JOB_ID = 'PU_CLERK';
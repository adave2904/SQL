-- Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
-- Hint : Use NATURAL JOIN.
SELECT L.LOCATION_ID,L.STREET_ADDRESS,L.CITY,C.COUNTRY_NAME
FROM LOCATIONS L
NATURAL JOIN COUNTRY_NEW C;

-- Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT E.FIRST_NAME,E.LAST_NAME,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPT_ID;

-- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT E.FIRST_NAME,E.LAST_NAME,E.DEPARTMENT_ID,D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPT_ID
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'LONDON';

-- Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT E1.EMPLOYEE_ID,E1.LAST_NAME,E1.MANAGER_ID,E2.LAST_NAME
FROM EMPLOYEES E1
INNER JOIN EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID;

-- Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
SELECT E.FIRST_NAME,E.LAST_NAME,E.HIRE_DATE
FROM EMPLOYEES E
INNER JOIN (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Jones') J
WHERE E.HIRE_DATE > J.HIRE_DATE;

-- Write a query to get the department name and number of employees in the department.
SELECT D.DEPARTMENT_NAME,COUNT(E.EMPLOYEE_ID)
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPT_ID
GROUP BY D.DEPARTMENT_NAME;

-- Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
SELECT JH.EMPLOYEE_ID,J.JOB_TITLE,(JH.END_DATE - JH.START_DATE)
FROM JOBS J
INNER JOIN JOB_HISTORY JH
ON J.JOB_ID = JH.JOB_ID
WHERE JH.DEPARTMENT_ID = 90;

-- Write a query to display the department ID and name and first name of manager.
SELECT D.DEPT_ID,D.DEPARTMENT_NAME,E.FIRST_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.MANAGER_ID = E.EMPLOYEE_ID;

-- Write a query to display the department name, manager name, and city.
SELECT D.DEPARTMENT_NAME,CONCAT(E.FIRST_NAME,' ',E.LAST_NAME) AS "Manager Name",L.CITY
FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

-- Write a query to display the job title and average salary of employees.
SELECT J.JOB_TITLE,AVG(E.SALARY)
FROM EMPLOYEES E
INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
GROUP BY J.JOB_TITLE;

-- Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT J.JOB_TITLE,CONCAT(E.FIRST_NAME,' ',E.LAST_NAME),(E.SALARY - J.MIN_SALARY)
FROM EMPLOYEES E
INNER JOIN JOBS J
ON E.JOB_ID = J.JOB_ID;

-- Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT JH.*
FROM JOB_HISTORY JH
INNER JOIN EMPLOYEES E
ON JH.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE E.SALARY > 10000;

-- Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT D.DEPARTMENT_NAME,CONCAT(E.FIRST_NAME,' ',E.LAST_NAME),E.HIRE_DATE,E.SALARY
FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID
AND DATEDIFF(NOW(),E.HIRE_DATE) / 365 > 15;

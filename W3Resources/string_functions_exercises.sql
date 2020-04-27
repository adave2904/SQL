USE SQL_PRACTICE;
 -- Write a query to get the job_id and related employee's id.
 SELECT JOB_ID,GROUP_CONCAT(EMPLOYEE_ID,' ')
 FROM EMPLOYEES
 GROUP BY JOB_ID;
 
 -- Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
 UPDATE EMPLOYEES
 SET PHONE_NUMBER = REPLACE(PHONE_NUMBER,'124','999')
 WHERE PHONE_NUMBER LIKE '%124%';
 
 -- Write a query to get the details of the employees where the length of the first name greater than or equal to 8.
 SELECT *
 FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 8;
 
 -- Write a query to display leading zeros before maximum and minimum salary.
 SELECT JOB_ID,LPAD(MAX_SALARY,7,'0'),LPAD(MIN_SALARY,7,'0')
 FROM JOBS;
 
 -- Write a query to append '@example.com' to email field.
 SELECT CONCAT(EMAIL,'@example.com')
 FROM EMPLOYEES;
 
 -- Write a query to get the employee id, first name and hire month.
 SELECT EMPLOYEE_ID,FIRST_NAME,EXTRACT(MONTH FROM HIRE_DATE)
 FROM EMPLOYEES;
 
 -- Write a query to get the employee id, email id (discard the last three characters).
 SELECT EMPLOYEE_ID,SUBSTR(EMAIL,1,LENGTH(EMAIL) - 3)
 FROM EMPLOYEES;
 
 -- Write a query to find all employees where first names are in upper case.
 SELECT *
 FROM EMPLOYEES
 WHERE FIRST_NAME = BINARY UPPER(FIRST_NAME);
 
 -- Write a query to extract the last 4 character of phone numbers.
 SELECT PHONE_NUMBER,SUBSTR(PHONE_NUMBER,LENGTH(PHONE_NUMBER) - 3)
 FROM EMPLOYEES;
 
 -- Write a query to get the locations that have minimum street length
 SELECT *
 FROM LOCATIONS
 WHERE LENGTH(STREET_ADDRESS) = (SELECT MIN(LENGTH(STREET_ADDRESS)) FROM LOCATIONS);
 
 -- Write a query to display the first word from those job titles which contains more than one words.
 SELECT JOB_TITLE,SUBSTR(JOB_TITLE,1,INSTR(JOB_TITLE,' ') - 1)
 FROM JOBS;
 
 -- Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position.
 SELECT FIRST_NAME,LENGTH(FIRST_NAME)
 FROM EMPLOYEES
 WHERE INSTR(FIRST_NAME,'c') > 2;
 
 -- Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'.
 -- Give each column an appropriate label.
 -- Sort the results by the employees' first names.
 SELECT FIRST_NAME AS "FIRST NAME",LENGTH(FIRST_NAME) AS "LENGTH OF FIRST NAME"
 FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%' OR FIRST_NAME LIKE 'J%'
 ORDER BY FIRST_NAME;
 
 -- Write a query to display the first name and salary for all employees.
 -- Format the salary to be 10 characters long, left-padded with the $ symbol.
 -- Label the column SALARY.
SELECT FIRST_NAME,LPAD(SALARY,10,'$') AS SALARY
FROM EMPLOYEES;

-- Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign.
-- Each '$' sign signifies a thousand dollars.
-- Sort the data in descending order of salary.
SELECT SUBSTR(FIRST_NAME,1,8),REPEAT('$',FLOOR(SALARY/1000))
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- Write a query to display the employees with their code, first name, last name and hire date
-- who hired either on seventh day of any month or seventh month in any year.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE EXTRACT(DAY FROM HIRE_DATE) = 7
OR EXTRACT(MONTH FROM HIRE_DATE) = 7;

USE sql_practice;
--  Write a SQL statement to insert a record with your own value into the table countries against each columns.
DESC countries;

INSERT INTO COUNTRIES
(
	 COUNTRY_ID
	,COUNTRY_NAME
    ,REGION_ID
)VALUES
(
	 1
	,'INDIA'
    ,1
);

-- Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
DESC countries;

INSERT INTO COUNTRIES
(
	 COUNTRY_ID
	,COUNTRY_NAME
)VALUES
(
	 2
	,'USA'
);

-- Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
CREATE TABLE IF NOT EXISTS COUNTRY_NEW
AS SELECT * FROM COUNTRIES;

-- Write a SQL statement to insert NULL values against region_id column for a row of countries table.
INSERT INTO COUNTRIES
(
	 COUNTRY_ID
	,COUNTRY_NAME
    ,REGION_ID
)VALUES
(
	 3
	,'CHINA'
    ,NULL
);

-- Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO COUNTRIES
(
	 COUNTRY_ID
	,COUNTRY_NAME
    ,REGION_ID
)VALUES
(
	 4
	,'CANADA'
    ,NULL
)
,(
	 5
	,'AUSTRALIA'
    ,NULL
)
,(
	 6
	,'UK'
    ,NULL
);

-- Write a SQL statement insert rows from country_new table to countries table. Assume that, the countries table is empty.
DELETE FROM COUNTRY_NEW;
INSERT INTO COUNTRY_NEW
(
	 COUNTRY_ID
	,COUNTRY_NAME
    ,REGION_ID
)
VALUES
(
	 1
	,'India'
    ,1001
)
,(
	 2
	,'USA'
    ,1007
)
,(
	 3
	,'UK'
    ,1003
);

DELETE FROM countries;
INSERT INTO COUNTRIES
SELECT * FROM COUNTRY_NEW;

-- Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
desc jobs;

INSERT INTO JOBS
(
	 job_id
	,job_title
    ,min_salary
    ,max_salary
)VALUES
(
	 1
	,'Data Engineer'
    ,8000
    ,50000
);

-- Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
INSERT INTO JOBS
(
	 job_id
	,job_title
    ,min_salary
    ,max_salary
)VALUES
(
	 1
	,'Data Engineer'
    ,8000
    ,50000
);

-- Error Code: 1062. Duplicate entry '1' for key 'jobs.job_id'

-- Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int NOT NULL
    ,PRIMARY KEY(country_id,region_id)
);

INSERT INTO COUNTRIES
(
	 country_id
	,country_name
    ,region_id
)VALUES
(
	 1
	,'INDIA'
    ,1
);

INSERT INTO COUNTRIES
(
	 country_id
	,country_name
    ,region_id
)VALUES
(
	 1
	,'ITALY'
    ,1
);

-- Error Code: 1062. Duplicate entry '1-1' for key 'countries.PRIMARY'

-- Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
	,country_name varchar(100)
    ,region_id int NOT NULL
);

INSERT INTO COUNTRIES(country_name,region_id)VALUES('INDIA',1);
INSERT INTO COUNTRIES(country_name,region_id)VALUES('USA',2);

-- Write a SQL statement to insert records into the table countries to ensure that
-- the country_id column will not contain any duplicate data and this will be automatically incremented
-- and the column country_name will be filled up by 'N/A' if no value assigned for that column.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY
	,country_name varchar(100) DEFAULT 'NA'
    ,region_id int NOT NULL
);
INSERT INTO COUNTRIES(region_id)VALUES(1);
SELECT * FROM COUNTRIES;

-- Write a SQL statement to insert rows in the job_history table in which
-- one column job_id is containing those values which are exists in job_id column of jobs table.
DROP TABLE JOBS;
CREATE TABLE IF NOT EXISTS JOBS
(
	 JOB_ID INT NOT NULL UNIQUE PRIMARY KEY
	,JOB_TITLE VARCHAR(100) NOT NULL DEFAULT ''
    ,MIN_SALARY DECIMAL(6,0) DEFAULT 8000
    ,MAX_SALARY DECIMAL(6,0) DEFAULT 20000
);
INSERT INTO JOBS(JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES(1001,'OFFICER',8000,20000);
INSERT INTO JOBS(JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES(1002,'CLERK',8000,20000);
SELECT * FROM JOBS;

DROP TABLE JOB_HISTORY;
CREATE TABLE IF NOT EXISTS JOB_HISTORY
(
	 EMP_ID INT NOT NULL UNIQUE PRIMARY KEY
	,JOB_ID INT NOT NULL
    ,DEPT_ID INT DEFAULT NULL
    ,FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID)
);

INSERT INTO JOB_HISTORY(EMP_ID,JOB_ID,DEPT_ID) VALUES(1,1003,200);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sql_practice`.`job_history`, CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`))
INSERT INTO JOB_HISTORY(EMP_ID,JOB_ID,DEPT_ID) VALUES(1,1001,200);

-- Write a SQL statement to insert rows into the table employees in which
-- a set of columns department_id and manager_id contains a unique value
-- and that combined values must have exists into the table departments.
DROP TABLE DEPARTMENTS;
CREATE TABLE DEPARTMENTS
(
	 DEPT_ID DECIMAL(4,0) NOT NULL DEFAULT 0
	,DEPT_NAME VARCHAR(30) NOT NULL DEFAULT ''
    ,MANAGER_ID DECIMAL(6,0) NOT NULL DEFAULT 0
    ,LOCATION_ID DECIMAL(4,0) DEFAULT NULL,
  PRIMARY KEY (DEPT_ID,MANAGER_ID)
);
INSERT INTO departments VALUES(60,'SALES',201,89);
INSERT INTO departments VALUES(61,'ACCOUNTS',201,89);
INSERT INTO departments VALUES(80,'FINANCE',211,90);

CREATE TABLE EMPLOYEES
(
	 EMP_ID INT NOT NULL UNIQUE PRIMARY KEY
	,FIRST_NAME VARCHAR(100) DEFAULT NULL
    ,LAST_NAME VARCHAR(100) DEFAULT NULL
    ,JOB_ID INT NOT NULL
    ,SALARY DECIMAL(6,0)
    ,DEPT_ID DECIMAL(4,0) NOT NULL DEFAULT 0
    ,MANAGER_ID DECIMAL(6,0) NOT NULL DEFAULT 0
    ,FOREIGN KEY (DEPT_ID,MANAGER_ID) REFERENCES DEPARTMENTS(DEPT_ID,MANAGER_ID)
);

INSERT INTO EMPLOYEES(EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPT_ID,MANAGER_ID)
VALUES(1,'AARSH','DAVE',1001,20000,60,201); -- 1 ROW INSERTED.

INSERT INTO EMPLOYEES(EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPT_ID,MANAGER_ID)
VALUES(2,'JOHN','DOE',1001,20000,100,100);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sql_practice`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DEPT_ID`, `MANAGER_ID`) REFERENCES `departments` (`DEPT_ID`, `MANAGER_ID`))

-- Write a SQL statement to insert rows into the table employees in which
-- a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
DROP TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES
(
	 EMP_ID INT NOT NULL UNIQUE PRIMARY KEY
	,FIRST_NAME VARCHAR(100) DEFAULT NULL
    ,LAST_NAME VARCHAR(100) DEFAULT NULL
    ,JOB_ID INT NOT NULL
    ,SALARY DECIMAL(6,0)
    ,DEPT_ID DECIMAL(4,0) NOT NULL DEFAULT 0
    ,MANAGER_ID DECIMAL(6,0) NOT NULL DEFAULT 0
    ,FOREIGN KEY(DEPT_ID,MANAGER_ID) REFERENCES DEPARTMENTS(DEPT_ID,MANAGER_ID)
    ,FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID)
);
SELECT * FROM JOBS;
SELECT * FROM DEPARTMENTS;
INSERT INTO EMPLOYEES(EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPT_ID,MANAGER_ID)
VALUES(1,'AARSH','DAVE',1001,20000,60,201); -- 1 ROW INSERTED.

INSERT INTO EMPLOYEES(EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEPT_ID,MANAGER_ID)
VALUES(2,'JOHN','DOE',2001,20000,60,201);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sql_practice`.`employees`, CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`))








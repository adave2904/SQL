use sql_practice;

-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
CREATE TABLE countries
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int
);

desc countries;

-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int
);

-- Write a SQL statement to create the structure of a table dup_countries similar to countries.
CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries;

DESC dup_countries;

-- Create a duplicate copy of countries table including structure and data by name dup_countries
CREATE TABLE IF NOT EXISTS dup_countries
AS SELECT * FROM countries;

-- Write a SQL statement to create a table countries set a constraint NULL.
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int
);

-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
DROP TABLE JOBS;
CREATE TABLE IF NOT EXISTS jobs
(
	 job_id int NOT NULL PRIMARY KEY
	,job_title varchar(100) NOT NULL DEFAULT ''
    ,min_salary decimal(6,0) DEFAULT 8000 
    ,max_salary decimal(6,0) DEFAULT NULL
    CHECK(max_salary <= 25000)
);

-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,CHECK(country_name IN ('INDIA','ITALY','CHINA'))
    ,region_id int
);

-- Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id
-- and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE IF NOT EXISTS job_history
(
	 employee_id INT NOT NULL
	,start_date DATE
    ,end_date DATE
    ,CHECK(end_date LIKE '----/--/--')
    ,job_id INT NOT NULL
    ,department_id INT NOT NULL
);

-- Write a SQL statement to create a table named countries including columns country_id,country_name and region_id
-- and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int
    ,UNIQUE(country_id)
);

-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary,
-- and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL
-- will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE IF NOT EXISTS jobs
(
	 job_id int NOT NULL UNIQUE
	,job_title varchar(100) DEFAULT ''
    ,min_salary decimal(10,2) DEFAULT 8000.00
    ,max_salary decimal(10,2) DEFAULT NULL
);

-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id
-- and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL PRIMARY KEY
	,country_name varchar(100)
    ,region_id int
);

-- Write a SQL statement to create a table countries including columns country_id, country_name and region_id
-- and make sure that the column country_id will be unique and store an auto incremented value.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY
	,country_name varchar(100)
    ,region_id int
);

-- Write a SQL statement to create a table countries including columns country_id, country_name and region_id
-- and make sure that the combination of columns country_id and region_id will be unique.
DROP TABLE COUNTRIES;
CREATE TABLE IF NOT EXISTS COUNTRIES
(
	 country_id int NOT NULL
	,country_name varchar(100)
    ,region_id int NOT NULL
    ,PRIMARY KEY(country_id,region_id)
);

-- Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion
-- and the foreign key column job_id contain only those values which are exists in the jobs table.
DROP TABLE job_history;
CREATE TABLE IF NOT EXISTS job_history
(
	 employee_id INT NOT NULL PRIMARY KEY
	,start_date DATE
    ,end_date DATE
    ,CHECK(end_date LIKE '----/--/--')
    ,job_id INT NOT NULL
    ,department_id INT NOT NULL
    ,FOREIGN KEY(job_id)REFERENCES jobs(job_id)
);

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email,phone_number hire_date, job_id, salary, commission, manager_id and department_id
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion
-- and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values,
-- which combinations are exists in the departments table.
CREATE TABLE IF NOT EXISTS departments
(
	 department_id DECIMAL(4,0) NOT NULL DEFAULT 0
	,department_name VARCHAR(30) NOT NULL DEFAULT ''
    ,manager_id DECIMAL(6,0) NOT NULL DEFAULT 0
    ,location_id DECIMAL(4,0) DEFAULT NULL
    ,PRIMARY KEY(department_id,manager_id)
);

CREATE TABLE IF NOT EXISTS employees
(
	 employee_id INT NOT NULL PRIMARY KEY
	,first_name VARCHAR(100)
    ,last_name VARCHAR(100)
    ,email VARCHAR(100)
    ,phone_number DECIMAL(10,0)
    ,hire_date DATE
    ,job_id INT NOT NULL
    ,salary DECIMAL(6,2)
    ,commission DECIMAL(6,2)
    ,manager_id DECIMAL(6,0) NOT NULL
    ,department_id DECIMAL(4,0) NOT NULL
    ,FOREIGN KEY(department_id,manager_id) REFERENCES departments(department_id,manager_id)
);

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion,
-- and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table
-- and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
-- The InnoDB Engine have been used to create the tables.
DROP TABLE employees;

CREATE TABLE IF NOT EXISTS employees
(
	 employee_id INT NOT NULL PRIMARY KEY
	,first_name VARCHAR(100)
    ,last_name VARCHAR(100)
    ,email VARCHAR(100)
    ,phone_number DECIMAL(10,0)
    ,hire_date DATE
    ,job_id INT NOT NULL
    ,salary DECIMAL(6,2)
    ,commission DECIMAL(6,2)
    ,manager_id DECIMAL(6,0) NOT NULL
    ,department_id DECIMAL(4,0) NOT NULL
    ,FOREIGN KEY(department_id,manager_id) REFERENCES departments(department_id,manager_id)
    ,FOREIGN KEY(job_id) REFERENCES jobs(job_id)
)ENGINE = InnoDB;

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion,
-- and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
-- The InnoDB Engine have been used to create the tables.
-- The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.
DROP TABLE employees;

CREATE TABLE IF NOT EXISTS employees
(
	 employee_id INT NOT NULL PRIMARY KEY
	,first_name VARCHAR(100)
    ,last_name VARCHAR(100)
    ,job_id INT NOT NULL
    ,salary DECIMAL(6,2)
    ,FOREIGN KEY(job_id) REFERENCES jobs(job_id)
    ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE = InnoDB;

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion,
-- and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
-- The InnoDB Engine have been used to create the tables.
-- The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values
-- and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.
DROP TABLE employees;

CREATE TABLE IF NOT EXISTS employees
(
	 employee_id INT NOT NULL PRIMARY KEY
	,first_name VARCHAR(100)
    ,last_name VARCHAR(100)
    ,job_id INT
    ,salary DECIMAL(6,2)
    ,FOREIGN KEY(job_id) REFERENCES jobs(job_id)
    ON DELETE SET NULL
    ON UPDATE SET NULL
)ENGINE = InnoDB;

-- Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary
-- and make sure that, the employee_id column does not contain any duplicate value at the time of insertion,
-- and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.
-- The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.
DROP TABLE employees;

CREATE TABLE IF NOT EXISTS employees
(
	 employee_id INT NOT NULL PRIMARY KEY
	,first_name VARCHAR(100)
    ,last_name VARCHAR(100)
    ,job_id INT NOT NULL
    ,salary DECIMAL(6,2)
    ,FOREIGN KEY(job_id) REFERENCES jobs(job_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;
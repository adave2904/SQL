-- Write a SQL statement to rename the table countries to country_new.
ALTER TABLE COUNTRIES RENAME COUNTRY_NEW;
DESC COUNTRY_NEW;

-- Write a SQL statement to add a column region_id to the table locations.
ALTER TABLE LOCATIONS ADD REGION_ID INT;
DESC LOCATIONS;

-- Write a SQL statement to add a columns ID as the first column of the table locations.
ALTER TABLE LOCATIONS ADD ID INT FIRST;
DESC LOCATIONS;

-- Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE LOCATIONS DROP REGION_ID;
ALTER TABLE LOCATIONS ADD REGION_ID INT AFTER STATE_PROVINCE;
DESC LOCATIONS;

-- Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE LOCATIONS MODIFY COUNTRY_ID INT;
DESC LOCATIONS;

-- Write a SQL statement to drop the column city from the table locations.
ALTER TABLE LOCATIONS DROP COLUMN CITY;

-- Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
ALTER TABLE LOCATIONS DROP STATE_PROVINCE, ADD STATE VARCHAR(25);

-- Write a SQL statement to add a primary key for the columns location_id in the locations table.
ALTER TABLE LOCATIONS ADD PRIMARY KEY(LOCATION_ID);

-- Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
ALTER TABLE LOCATIONS DROP PRIMARY KEY,ADD PRIMARY KEY(LOCATION_ID,COUNTRY_ID);

-- Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
ALTER TABLE LOCATIONS DROP PRIMARY KEY;

-- Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE JOB_HISTORY ADD FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID);

-- Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE JOB_HISTORY ADD CONSTRAINT `fk_job_id` FOREIGN KEY (`JOB_ID`) REFERENCES `JOBS` (`JOB_ID`);

-- Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
ALTER TABLE JOB_HISTORY DROP FOREIGN KEY `fk_job_id`;

-- Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
ALTER TABLE JOB_HISTORY ADD INDEX indx_job_id(JOB_ID);

-- Write a SQL statement to drop the index indx_job_id from job_history table.
ALTER TABLE JOB_HISTORY DROP INDEX indx_job_id;
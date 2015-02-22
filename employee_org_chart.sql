--Drop the tables
DROP TABLE IF EXISTS employee_supervisor;
DROP TABLE IF EXISTS supervisor;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS employee_manager1;
DROP TABLE IF EXISTS employee_manager2;

--Create the employee table
CREATE TABLE employee_supervisor
(
employee_id INT NOT NULL,
employee_name VARCHAR(50) NOT NULL,
employee_title VARCHAR(100) NOT NULL,
supervisor_id INT NULL,
PRIMARY KEY ( employee_id )
);

--Load the employee table
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (1,'Brian Peters','President & CEO',null);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (2,'William Horton','Chief Investment Officer',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (3,'John Riviere','Chief Financial Officer',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (4,'Francois Durocher','Executive Vice President, Member Experience',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (5,'Paul Mason','Executive Vice President, Technology & Operations',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (6,'Michael Gassewitz','Executive Vice President, Member Solutions',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (7,'Michelle Masson','Executive Vice President, Organization Experience',1);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (8,'Desiree De Waal','Division Services Specialist',2);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (9,'Craig Maddock','Senior PM and VP, Investment Management',2);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (10,'Marija Majdoub','Senior PM and VP, Investment Management',2);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (11,'Fred Wang','Quantitative Invesetment Analyst',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (12,'Wesley Blight','Portfolio Manager',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (13,'Brent Bertin','Senior Manager, Portfolio Operations',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (14,'Richard Schmidt','Investment Analyst',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (15,'Edward Golding','Portfolio Manager',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (16,'Mark Fairbairn','Senior Investment Analyst',9);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (17,'Jasbir Oberoi','Portfolio Operations Manager',13);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (18,'J Ryan Forbes','Senior Manager, Portfolio Operations',10);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (19,'Ian Taylor','Portfolio Manager',10);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (20,'Sean Follis','VP, Insight',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (21,'Jeff Coughlan','VP, Strategic Planning, Products & Services',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (22,'Steven Herzog','VP, Online Client Experience',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (23,'Jeffrey Ray','VP, Financial Product Management',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (24,'Kim Peters','Marketing Manager',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (25,'Ann Vachon','Membership Marketing Lead',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (26,'Mary Hickey','Membership Marketing Lead',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (27,'Susan Maddock','VP, Marketing',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (28,'Sheila Beehler','AVP, Corporate Marketing',6);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (29,'Kristin Petrachuk','Database Specialist',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (30,'Michael Jewer','Data Mining Analyst',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (31,'Brian Harrington','Research Manager',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (32,'Priya Sreeraman','Data Solutions Specialist',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (33,'Andrew Clapson','Data Mining Analyst',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (34,'Sarah Palframan','Data Mining Analyst',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (35,'Robert Calder','Research Manager',20);
INSERT INTO employee_supervisor ( employee_id,employee_name,employee_title,supervisor_id ) VALUES (36,'Jakeline G Celis Rangel','Co-op Student',20);


--Create the employee_manager table
CREATE TABLE employee_manager1
(
employee_id INT NOT NULL,
employee_name VARCHAR(50) NOT NULL,
employee_title VARCHAR(100) NOT NULL,
supervisor_name VARCHAR(50) NOT NULL,
supervisor_title VARCHAR(100) NOT NULL,
PRIMARY KEY ( employee_id )
);

--Create the organization chart (exclude the CEO who reports to know one)
INSERT INTO employee_manager1 (employee_id,employee_name,employee_title,supervisor_name,supervisor_title)
SELECT s.employee_id,s.employee_name,s.employee_title,es.employee_name as supervisor_name,es.employee_title as supervisor_title 
FROM employee_supervisor es
INNER JOIN (SELECT * FROM employee_supervisor) s ON es.employee_id = s.supervisor_id;

--We can also do this using multiple tables, although the assignment does not require it.

--Create the supervisor table
CREATE TABLE supervisor
(
employee_id INT NOT NULL,
supervisor_id INT NULL,
PRIMARY KEY ( employee_id )
);

--Load the supervisor  table
INSERT INTO supervisor (employee_id,supervisor_id)
SELECT employee_id,supervisor_id FROM employee_supervisor;

--Create the employee table
CREATE TABLE employee
(
employee_id INT NOT NULL,
employee_name VARCHAR(50) NOT NULL,
employee_title VARCHAR(100) NOT NULL,
PRIMARY KEY ( employee_id )
);

--Load the employee table
INSERT INTO employee (employee_id,employee_name,employee_title)
SELECT employee_id,employee_name,employee_title FROM employee_supervisor;

--Create the employee_manager table
CREATE TABLE employee_manager2
(
employee_id INT NOT NULL,
employee_name VARCHAR(50) NOT NULL,
employee_title VARCHAR(100) NOT NULL,
supervisor_name VARCHAR(50) NOT NULL,
supervisor_title VARCHAR(100) NOT NULL,
PRIMARY KEY ( employee_id )
);

--Join the employee and supervisor tables to create and insert the values into the employee_manager table
INSERT INTO employee_manager2 (employee_id,employee_name,employee_title,supervisor_name,supervisor_title)
SELECT s.employee_id,e.employee_name,e.employee_title,es.employee_name as supervisor_name,es.employee_title as supervisor_title 
FROM supervisor s
INNER JOIN (SELECT * FROM employee) e ON s.employee_id = e.employee_id
INNER JOIN (SELECT * FROM employee) es ON s.supervisor_id = es.employee_id;

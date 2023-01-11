-- RunCommand 
-- @C:\csy1026\scripts\CSY1026.sql
-- CREATE TABLE COMMANDS


-- CREATE TABLE COMMANDS


CREATE TABLE staff(
staff_id 		NUMBER(9),
staff_firstname VARCHAR(20),
staff_lastname 	VARCHAR(20),
address_line1	VARCHAR(30),
town 	VARCHAR(30) DEFAULT 'NORTHAMPTON',
county 	VARCHAR(30),
postcode 	VARCHAR(9),
country 	VARCHAR(30) DEFAULT 'UK',
contact_number 	VARCHAR(13) NOT NULL,
email 	VARCHAR(320),
department 	VARCHAR(8) DEFAULT 'FAST',
gender 	CHAR(1) NOT NULL,
enrolled 	CHAR(1) DEFAULT 'Y',
dob 	DATE);

CREATE TABLE roles(
role_id 	NUMBER(9),
role_name 	VARCHAR(30));

CREATE TABLE resources(
resource_id 	NUMBER(9),
service_name 	VARCHAR(15),
description 	VARCHAR(100),
cost 	NUMBER(4,2));

CREATE TABLE activities(
activity_id 	NUMBER(9),
time 	VARCHAR(5),
aim 	VARCHAR(50));

CREATE TABLE stages(
stage_id 	NUMBER(9),
stage_name 	VARCHAR(15));

CREATE TABLE staff_roles(
staff_role_id 	NUMBER(9),
staff_id 	NUMBER(9),
role_id 	NUMBER(9));

CREATE TABLE groups(
group_id 	NUMBER(9),
staff_role_id 	NUMBER(9),
activity_id 	NUMBER(9),
group_size 	VARCHAR(2),
group_name 	VARCHAR(15) DEFAULT 'NONE');

CREATE TABLE reviews(
review_id 	NUMBER(9),
group_id 	NUMBER(9),
staff_id 	NUMBER(9),
date_registered 	DATE);

CREATE TABLE plans(
plan_id  	NUMBER(9),
stage_id 	NUMBER(9),
activity_id 	NUMBER(9),
start_date 	DATE);

CREATE TABLE actions(
action_id	NUMBER(9),
review_id	NUMBER(9),
Deadline	DATE);

CREATE TABLE costs(
cost_id 	NUMBER(9),
price 	NUMBER(4,2),
payment_method 	VARCHAR(2),
activity_id 	NUMBER(9));

CREATE TABLE activity_resources(
activity_id 	NUMBER(9),
resource_id 	NUMBER(9));




/*
SELECT TNAME FROM TAB

to veiw all TABLE NAMES

*/

-- CONSTRAINT COMMANDS

--PRIMARY KEYS
ALTER TABLE staff
ADD CONSTRAINT pk_staff
PRIMARY KEY (staff_id);

ALTER TABLE roles
ADD CONSTRAINT pk_roles
PRIMARY KEY (role_id);

ALTER TABLE resources
ADD CONSTRAINT pk_resources
PRIMARY KEY (resource_id);

ALTER TABLE activities
ADD CONSTRAINT pk_activities
PRIMARY KEY (activity_id);

ALTER TABLE stages
ADD CONSTRAINT pk_stages
PRIMARY KEY (stage_id);

ALTER TABLE staff_roles
ADD CONSTRAINT pk_staff_roles
PRIMARY KEY (staff_role_id);

ALTER TABLE groups
ADD CONSTRAINT pk_groups
PRIMARY KEY (group_id);

ALTER TABLE reviews
ADD CONSTRAINT pk_reviews
PRIMARY KEY (review_id);

ALTER TABLE plans
ADD CONSTRAINT pk_plans
PRIMARY KEY (plan_id);

ALTER TABLE actions
ADD CONSTRAINT pk_actions
PRIMARY KEY (action_id);

ALTER TABLE costs
ADD CONSTRAINT pk_costs
PRIMARY KEY (cost_id);


ALTER TABLE activity_resources
ADD CONSTRAINT pk_activity_resources
PRIMARY KEY (activity_id, resource_id);


--FOREIGN KEYS
ALTER TABLE staff_roles
ADD CONSTRAINT fk_sr_staff
FOREIGN KEY (staff_id)
REFERENCES staff (staff_id);

ALTER TABLE groups
ADD CONSTRAINT fk_g_staff_roles
FOREIGN KEY (staff_role_id)
REFERENCES staff_roles (staff_role_id);

ALTER TABLE groups
ADD CONSTRAINT fk_g_activities
FOREIGN KEY (activity_id)
REFERENCES activities (activity_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_r_groups
FOREIGN KEY (group_id)
REFERENCES groups (group_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_r_staff
FOREIGN KEY (staff_id)
REFERENCES staff (staff_id);

ALTER TABLE plans
ADD CONSTRAINT fk_p_stages
FOREIGN KEY (stage_id)
REFERENCES stages (stage_id);

ALTER TABLE plans
ADD CONSTRAINT fk_p_activities
FOREIGN KEY (activity_id)
REFERENCES activities (activity_id);

ALTER TABLE actions
ADD CONSTRAINT fk_a_reviews
FOREIGN KEY (review_id)
REFERENCES reviews (review_id);

ALTER TABLE costs
ADD CONSTRAINT fk_c_activities
FOREIGN KEY (activity_id)
REFERENCES activities (activity_id);



--CHECK CONSTRAINTS

ALTER TABLE staff
ADD CONSTRAINT ck_staff_firstname
CHECK (staff_firstname = UPPER(staff_firstname));

ALTER TABLE staff
ADD CONSTRAINT ck_staff_lastname
CHECK (staff_lastname = UPPER(staff_lastname));

ALTER TABLE staff
ADD CONSTRAINT ck_gender
CHECK (GENDER IN ('F','M'));

ALTER TABLE staff
ADD CONSTRAINT ck_enrolled
CHECK (ENROLLED IN ('Y','N'));

ALTER TABLE groups
ADD CONSTRAINT ck_group_size
CHECK (GROUP_SIZE IN ('4','5','6','7','8','9','10'));

ALTER TABLE costs
ADD CONSTRAINT ck_payment_method
CHECK (PAYMENT_METHOD IN ('CS','CR'));

ALTER TABLE staff
ADD CONSTRAINT ck_gender_nn
CHECK (GENDER IS NOT NULL);

ALTER TABLE staff
ADD CONSTRAINT ck_contact_number_nn
CHECK (CONTACT_NUMBER IS NOT NULL);

ALTER TABLE staff
ADD CONSTRAINT uk_email
UNIQUE (email);


/*
CS stands for cash and CR stands for card
*/

--DEFAULTS

ALTER TABLE staff
MODIFY  (town
DEFAULT 'NORTHAMPTON');

ALTER TABLE staff
MODIFY  (country
DEFAULT 'UK');

ALTER TABLE staff
MODIFY  (department
DEFAULT 'FAST');

ALTER TABLE staff
MODIFY  (enrolled
DEFAULT 'Y');

ALTER TABLE groups
MODIFY  (group_name
DEFAULT 'NONE');



/*
SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;

to veiw all constraint
*/


 -- INSERT COMMANDS



-- INSERT STAFFS

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056789,'EMMANUEL','NWOKORO','18 FULHAM','SURREY','SS8 2QR','07237745238','KENECHI78@GMAIL.COM','M','Y','31-DEC-2001');

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,town,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056790,'JOHN','WILLIAMS','30 KANE ST','LONDON','GREATER LONDON','SW8 2HR','07700900675','JWILLIAMS@GMAIL.COM','M','Y','17-MAY-2001');

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,town,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056791,'PETER','JONES','6 HAMILTON WAY','LONDON','GREATER LONDON','LD2 3RE','07700900403','PJONES@GMAIL.COM','M','Y','18-DEC-2001');

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,town,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056792,'LEVI','THOMSON','2 MIDDLE STREET','OXFORD','OXFORDSHIRE','TW19 5BX','07700900764','LTHOMSON@GMAIL.COM','M','Y','29-FEB-2000');

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,town,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056793,'SAMSON','SMITH','1 CHESTERFIELD ROAD','LONDON','GREATER LONDON','TS13 4SG','07700900766','SSMITH@GMAIL.COM','M','Y','30-OCT-2000');

INSERT INTO staff (staff_id,staff_firstname,staff_lastname,address_line1,town,county,postcode,contact_number,email,gender,enrolled,dob)
VALUES(200056794,'LEAH','ROSE','3 OLD STOCKBRIDGE','LONDON','GREATER LONDON','SO20 8QJ','07700900242','LROSE@GMAIL.COM','F','Y','16-SEP-2001');



/*
2000 IS FOR THE STAFF
 
THE WITH COLUMN METHOD

*/

-- INSERT ROLES

INSERT INTO roles (role_id,role_name)
VALUES(300056789,'PROJECT MANAGEMENT');

INSERT INTO roles (role_id,role_name)
VALUES(300056790,'PROGRAMMING');

INSERT INTO roles (role_id,role_name)
VALUES(300056791,'ADMIN');

INSERT INTO roles (role_id,role_name)
VALUES(300056792,'GROUP LEADER');

INSERT INTO roles (role_id,role_name)
VALUES(300056793,'SUPERVISOR');

INSERT INTO roles (role_id,role_name)
VALUES(300056794,'MANAGER');



/*
3000 IS FOR THE ROLES
*/

-- INSERT RESOURCES



INSERT INTO resources VALUES(400056794,'SOFTWARE','BASIC SOFTWARE','10.50');

INSERT INTO resources VALUES(400056795,'TRAINING','BASIC TRAINING','10.50');

INSERT INTO resources VALUES(400056796,'SOFTWARE PART 2','ADVANCE SOFTWARE PARTS','10.50');

INSERT INTO resources VALUES(400056797,'TRAINING PART 2','ADVANCE TRAINING PARTS','10.50');

INSERT INTO resources VALUES(400056798,'INSPECTION','CHECKING EVERYTHING BEFORE AND AFTER','10.50');

/*
4000 IS FOR THE RESOURCES

THE WITHOUT COLUMN METHOD
*/

-- INSERT ACTIVITIES

INSERT INTO activities VALUES(500056794,'13:30','BREAK');

INSERT INTO activities VALUES(500056795,'16:00','PEER MARKING');

INSERT INTO activities VALUES(500056796,'12:15','BE IN GROUPS AND DO PLANNING');

INSERT INTO activities VALUES(500056797,'15:30','FINISHING THE GROUP WORK');

INSERT INTO activities VALUES(500056798,'14:45','GROUP LEADER CAN HELP YOU');

INSERT INTO activities VALUES(500056799,'16:30','FINAL MAKRKING FOR THE PROJECT');

/*
5000 IS FOR THE ACTIVITIES
*/

-- INSERT STAGES

INSERT INTO stages (stage_id,stage_name)
VALUES(600056794,'DEVELOPMENT');

INSERT INTO stages (stage_id,stage_name)
VALUES(600056795,'DESIGN');

INSERT INTO stages (stage_id,stage_name)
VALUES(600056796,'TESTING');

INSERT INTO stages (stage_id,stage_name)
VALUES(600056797,'PLANNING');

INSERT INTO stages (stage_id,stage_name)
VALUES(600056798,'REPORTING');

INSERT INTO stages (stage_id,stage_name)
VALUES(600056799,'FEEDBACK');

/*
6000 IS FOR THE STAGES
*/

-- INSERT STAFF_ROLES

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056794,200056789,300056794);

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056795,200056792,300056790);

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056796,200056793,300056792);

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056797,200056794,300056789);

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056798,200056791,300056791);

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(700056799,200056790,300056793);


/*
7000 IS FOR THE STAFF_ROLES
*/

-- INSERT GROUPS


INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056794,700056794,500056794,'7','ALL STARS');

INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056795,700056795,500056795,'8','BALLERS');

INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056796,700056796,500056796,'6','THE BEST');

INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056797,700056797,500056797,'7','JOB DONE');

INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056798,700056798,500056798,'9','WINNERS');

INSERT INTO groups (group_id,staff_role_id,activity_id,group_size,group_name)
VALUES(800056799,700056799,500056799,'5','ELITES');


/*
8000 IS FOR THE GROUPS
*/

-- INSERT REVIEWS

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056794,800056794,200056789,'10-APR-2021');

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056795,800056795,200056790,'02-APR-2021');

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056796,800056796,200056791,'09-APR-2021');

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056797,800056797,200056792,'05-APR-2021');

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056798,800056798,200056793,'08-APR-2021');

INSERT INTO reviews (review_id,group_id,staff_id,date_registered)
VALUES(900056799,800056799,200056794,'11-APR-2021');


/*
9000 IS FOR THE REVIEWS
*/

-- INSERT PLANS

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056794,600056797,500056796,'20-APR-2021');

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056795,600056795,500056794,'21-APR-2021');

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056796,600056794,500056798,'22-APR-2021');

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056797,600056796,500056797,'23-APR-2021');

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056798,600056798,500056795,'24-APR-2021');

INSERT INTO plans (plan_id,stage_id,activity_id,start_date)
VALUES(100056799,600056799,500056799,'24-APR-2021');



/*
1000 IS FOR THE PLANS
*/

-- INSERT ACTIONS

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056794,900056794,'08-MAY-2021');

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056795,900056795,'02-MAY-2021');

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056796,900056796,'15-MAY-2021');

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056797,900056797,'04-MAY-2021');

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056798,900056798,'13-MAY-2021');

INSERT INTO actions (action_id,review_id,deadline)
VALUES(210056799,900056799,'07-MAY-2021');




/*
2100 IS FOR THE ACTIONS
*/

-- INSERT COSTS
INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056794,'30.50','CR',500056794);

INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056795,'40.00','CR',500056795);

INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056796,'10.50','CS',500056796);

INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056797,'05.00','CS',500056797);

INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056798,'10.00','CS',500056798);

INSERT INTO costs (cost_id,price,payment_method,activity_id)
VALUES(220056799,'30.00','CR',500056799);


/*
2200 IS FOR THE COSTS
*/

-- INSERT ACTIVITY_RESOURCES

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056794,400056794);

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056795,400056798);

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056796,400056795);

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056797,400056796);

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056798,400056797);

INSERT INTO activity_resources (activity_id,resource_id)
VALUES(500056799,400056798);


--sequence for staff

CREATE SEQUENCE seq_staff_id
INCREMENT BY 1
START WITH 200056795
NOCYCLE;

INSERT INTO staff(staff_id,staff_firstname,staff_lastname,address_line1,county,postcode,contact_number,email,gender,dob)
VALUES (seq_staff_id.NEXTVAL,'TOM','SMITH','LAMBETH','NORTHAMPTONSHIRE','NN3 2PQ','07823765369','TSMITH@GMAIL.COM','M','29-AUG-1999');



CREATE SEQUENCE seq_staff_role_id
INCREMENT BY 1
START WITH 700056800
NOCYCLE;

INSERT INTO staff_roles (staff_role_id,staff_id,role_id)
VALUES(seq_staff_role_id.NEXTVAL,200056795,300056793);


 -- QUERY COMMANDS

 
 
 --SELECT STATEMENT
 SELECT * 
 FROM staff;
 /*
 show all column from the staff table
 */
 
 SELECT staff_firstname, staff_lastname, contact_number,email
 FROM staff;

/*
show staff firstname, lastname, contact_number and email from the staff table
*/

 SELECT staff_firstname, staff_lastname, address_line1, town, county, postcode
 FROM staff;
 
/*
show staff firstname, lastname and their full address from the staff table
*/




--WHERE CLAUSE

 SELECT staff_firstname, staff_lastname, address_line1, town, county, postcode
 FROM staff
 WHERE town = 'LONDON';
 
/*
show staff firstname, lastname and their full address who are from london in the staff table
*/
 
 SELECT cost_id,price,payment_method,activity_id
 FROM costs
 WHERE payment_method = 'CR';
/*
show cost_id, price, payment_method, activity_id that is paid in CR payment_method in the costs table
*/
 
 
--ALIAS

 SELECT staff_firstname "firstname", staff_lastname "lastname", dob "date of birth"
 FROM staff;
 
 /*
shows staff firstname, lastname and their date of birth in the staff table it remove the staff part on the firstname and lastname, also change the name for dob to date of birth. 
*/
 
--IN COMPARISON OPERATOR
SELECT s.staff_id, town
FROM staff s
WHERE s.town IN ('OXFORD');

 /*
 shows the staff id who live in oxford
*/

 
-- LIKE OPERATOR

SELECT s.staff_firstname, staff_lastname
FROM staff s
WHERE s.town LIKE 'N%';

 /*
 shows the staff firstname and lastname who live in a town that start with a N
*/
 
 
 -- OR Operator
 SELECT s.staff_firstname
 FROM staff s
 WHERE s.gender = 'M'
 OR s.town = 'OXFORD';
 
 /*
 shows the staff firstname who is a male or from oxford
 */
 
 SELECT staff_firstname,staff_lastname
 FROM staff
 WHERE dob >'31-DEC-2001'
 OR dob < '16-SEP-2001';
 
  /*
 shows the staff firstname and lastname who dob is between 16-SEP-2001 and 31-DEC-2001
 */
 
 
 --NOT Operator
 SELECT c.staff_id, address_line1, town, county, postcode
 FROM staff c
 WHERE NOT (town='LONDON');

  /*
 shows the staff and their full address who don't live in london
 */
 
 --JOIN
 SELECT aim, group_name
 FROM activities JOIN groups
 ON activities.activity_id = groups.activity_id;
 
 /*
 show what group is doing in the activity
 */ 
 
 SELECT staff_firstname, staff_lastname, role_id
 FROM staff JOIN staff_roles
 ON staff.staff_id = staff_roles.staff_id;
 
 /*
 show the staff firstname and lastname with their role_id
 */ 
 
 SELECT staff_id 
 FROM reviews
 WHERE review_id BETWEEN 900056794 AND 900056796;
 
 /*
 show the staff ID with their review_id between 900056794 and 900056796
 */

 


 -- DROP COMMANDS
 
 --DROP FOREIGN KEY
ALTER TABLE costs
DROP CONSTRAINT fk_c_activities;

ALTER TABLE actions
DROP CONSTRAINT fk_a_reviews;

ALTER TABLE plans
DROP CONSTRAINT fk_p_activities;

ALTER TABLE plans
DROP CONSTRAINT fk_p_stages;

ALTER TABLE reviews
DROP CONSTRAINT fk_r_staff;

ALTER TABLE reviews
DROP CONSTRAINT fk_r_groups;

ALTER TABLE groups
DROP CONSTRAINT fk_g_activities;

ALTER TABLE groups
DROP CONSTRAINT fk_g_staff_roles;

ALTER TABLE staff_roles
DROP CONSTRAINT fk_sr_staff;
 
 --DROP PRIMARY KEY
ALTER TABLE staff
DROP CONSTRAINT pk_staff;

ALTER TABLE roles
DROP CONSTRAINT pk_roles;

ALTER TABLE resources
DROP CONSTRAINT pk_resources;

ALTER TABLE activities
DROP CONSTRAINT pk_activities;

ALTER TABLE stages
DROP CONSTRAINT pk_stages;

ALTER TABLE staff_roles
DROP CONSTRAINT pk_staff_roles;

ALTER TABLE groups
DROP CONSTRAINT pk_groups;

ALTER TABLE reviews
DROP CONSTRAINT pk_reviews;

ALTER TABLE plans
DROP CONSTRAINT pk_plans;

ALTER TABLE actions
DROP CONSTRAINT pk_actions;

ALTER TABLE costs
DROP CONSTRAINT pk_costs;

ALTER TABLE activity_resources
DROP CONSTRAINT pk_activity_resources;

 --DROP CHECK CONSTRAINTS
ALTER TABLE staff
DROP CONSTRAINT ck_staff_firstname;

ALTER TABLE staff
DROP CONSTRAINT ck_staff_lastname;

ALTER TABLE staff
DROP CONSTRAINT ck_gender;

ALTER TABLE staff
DROP CONSTRAINT ck_enrolled;

ALTER TABLE groups
DROP CONSTRAINT ck_group_size;

ALTER TABLE costs
DROP CONSTRAINT ck_payment_method;

ALTER TABLE staff
DROP CONSTRAINT ck_gender_nn;

ALTER TABLE staff
DROP CONSTRAINT ck_contact_number_nn;

ALTER TABLE staff
DROP CONSTRAINT uk_email;

 
 --DROP TABLE
DROP TABLE activity_resources;
DROP TABLE costs;
DROP TABLE actions;
DROP TABLE plans;
DROP TABLE reviews;
DROP TABLE groups;
DROP TABLE staff_roles;
DROP TABLE stages;
DROP TABLE activities;
DROP TABLE resources;
DROP TABLE roles;
DROP TABLE staff;

 --DROP SEQUENCES
 
 DROP SEQUENCE seq_staff_role_id;
 
 DROP SEQUENCE seq_staff_id;

 PURGE RECYCLEBIN;
 
 

 
 /*
 use SELECT TNAME FROM TAB; to see if the tables are dropped
 
 use SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS; to see if the CONSTRAINTS are dropped
 
 the result of it is you will see no data
 
 */




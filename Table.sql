drop table if exists ROSTER, ENROLMENT, COURSE, STAFF, STUDENT;

CREATE TABLE STUDENT(
STUDENTID CHAR(8),
STUDENTNAME VARCHAR(45),
STUDENTGPA FLOAT(3,2),
CONSTRAINT STUDENT_PK PRIMARY KEY(STUDENTID));   

CREATE TABLE STAFF(
STAFFID CHAR(10) NOT NULL,
STAFFNAME VARCHAR(45),
STAFFPAYRATE FLOAT(5,2),
STAFFPOSITION VARCHAR(25),
CONSTRAINT STAFF_PK PRIMARY KEY(STAFFID));

CREATE TABLE COURSE(
COURSEID CHAR(7) NOT NULL,
COURSENAME VARCHAR(60),
CREDITPOINTS TINYINT,
CONSTRAINT COURSE_PK PRIMARY KEY(COURSEID));

CREATE TABLE ROSTER(
COURSEID CHAR(7),
STAFFID CHAR(10),
HOURSPERWEEK INT,
CONSTRAINT ROSTER_PK PRIMARY KEY(COURSEID,STAFFID),
CONSTRAINT ROSTER_FK1 FOREIGN KEY(COURSEID) REFERENCES COURSE(COURSEID),
CONSTRAINT ROSTER_FK2 FOREIGN KEY(STAFFID) REFERENCES STAFF(STAFFID));

CREATE TABLE ENROLMENT(
STUDENTID CHAR(8) NOT NULL,
COURSEID CHAR(7) NOT NULL,
ENROLDATE DATE,
CONSTRAINT ENROL_PK PRIMARY KEY(COURSEID,STUDENTID),
CONSTRAINT ENROL_FK1 FOREIGN KEY(COURSEID) REFERENCES COURSE(COURSEID),
CONSTRAINT ENROL_FK2 FOREIGN KEY(STUDENTID) REFERENCES STUDENT(STUDENTID));

/* INSERT TABLE STATEMENTS*/

INSERT INTO STUDENT VALUES ('48659003','Walter White',3.75);
INSERT INTO STUDENT VALUES ('43567721','Jesse Pinkman',1.25);
INSERT INTO STUDENT VALUES ('40098799','Sherlock Holmes',4.00);
INSERT INTO STUDENT VALUES ('43228896','Piper Chapman',2.25);
INSERT INTO STUDENT VALUES ('45331111','Harvey Specter',3.5);
INSERT INTO STUDENT VALUES ('48866574','Mike Ross',3.00);
INSERT INTO STUDENT VALUES ('44522965','Rosie Larsen',0.75);

INSERT INTO STAFF VALUES ('MQ20113456','Ned Stark',123.87,'Convenor');
INSERT INTO STAFF VALUES ('MQ23415671','Jon Snow',78.56,'Tutor');
INSERT INTO STAFF VALUES ('MQ20673411','Tyrion Lannister',95.23,'Tutor');
INSERT INTO STAFF VALUES ('MQ20134112','Petyr Baelish',43.45,'Tutor');
INSERT INTO STAFF VALUES ('MQ20139899','Khal Drogo',129.52,'Convenor');

INSERT INTO COURSE VALUES ('COMP115','Introduction to Game of Thrones',3);
INSERT INTO COURSE VALUES ('COMP125','Advanced Game of Thrones Studies',3);
INSERT INTO COURSE VALUES ('ISYS114','Learn about House of Cards',3);
INSERT INTO COURSE VALUES ('ISYS254','Ethics around Breaking Bad',3);
INSERT INTO COURSE VALUES ('ITEC800','Project TV shows',6);

INSERT INTO ROSTER VALUES('ISYS114','MQ20113456',10);
INSERT INTO ROSTER VALUES('ISYS254','MQ20113456',10);
INSERT INTO ROSTER VALUES('ITEC800','MQ20113456',10);
INSERT INTO ROSTER VALUES('COMP115','MQ20139899',15);
INSERT INTO ROSTER VALUES('COMP125','MQ20139899',15);
INSERT INTO ROSTER VALUES('ISYS114','MQ23415671',8);
INSERT INTO ROSTER VALUES('COMP125','MQ23415671',13);
INSERT INTO ROSTER VALUES('ITEC800','MQ23415671',7);
INSERT INTO ROSTER VALUES('COMP115','MQ20673411',15);
INSERT INTO ROSTER VALUES('ISYS114','MQ20673411',6);
INSERT INTO ROSTER VALUES('COMP125','MQ20673411',9);
INSERT INTO ROSTER VALUES('COMP115','MQ20134112',9);
INSERT INTO ROSTER VALUES('COMP125','MQ20134112',2);
INSERT INTO ROSTER VALUES('ITEC800','MQ20134112',7);
INSERT INTO ROSTER VALUES('ISYS254','MQ20134112',17);

INSERT INTO ENROLMENT VALUES('48659003','ISYS114','19-8-1');
INSERT INTO ENROLMENT VALUES('48659003','ISYS254','19-8-2');
INSERT INTO ENROLMENT VALUES('48659003','ITEC800','19-8-1');
INSERT INTO ENROLMENT VALUES('43567721','ISYS114','19-8-5');
INSERT INTO ENROLMENT VALUES('43567721','COMP115','19-8-8');
INSERT INTO ENROLMENT VALUES('43567721','COMP125','19-8-3');
INSERT INTO ENROLMENT VALUES('40098799','ITEC800','19-8-6');
INSERT INTO ENROLMENT VALUES('40098799','COMP115','19-8-19');
INSERT INTO ENROLMENT VALUES('40098799','COMP125','19-8-7');
INSERT INTO ENROLMENT VALUES('40098799','ISYS254','19-8-2');
INSERT INTO ENROLMENT VALUES('43228896','ISYS114','19-8-5');
INSERT INTO ENROLMENT VALUES('43228896','ITEC800','19-8-8');
INSERT INTO ENROLMENT VALUES('43228896','COMP125','19-8-3');
INSERT INTO ENROLMENT VALUES('45331111','COMP125','19-8-3');
INSERT INTO ENROLMENT VALUES('45331111','COMP115','19-8-13');
INSERT INTO ENROLMENT VALUES('48866574','COMP125','19-8-9');
INSERT INTO ENROLMENT VALUES('48866574','COMP115','19-8-5');
INSERT INTO ENROLMENT VALUES('48866574','ISYS114','19-8-14');
INSERT INTO ENROLMENT VALUES('48866574','ISYS254','19-8-22');
INSERT INTO ENROLMENT VALUES('48866574','ITEC800','19-8-19');
INSERT INTO ENROLMENT VALUES('44522965','ISYS114','19-8-12');
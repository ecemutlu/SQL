SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS universityreg ;
USE universityreg ;

DROP TABLE if exists Student;
create table Student(
	id bigint not null primary key,
    name varchar(100) not null,
    surname varchar(100) not null,
    dateOfBirth date not null,
    gender char(10) not null, -- MALE, FEMALE
    advisorId int,
    departmentId int not null,
    nationalId varchar(20) not null,
    nationalityId int not null,
    telephoneNumber varchar(20) not null,
    address varchar(100) not null,
    registrationDate date not null,
    graduationDate date,
    isDeleted bool not null default false,
    FOREIGN KEY (nationalityId) REFERENCES Nationality (id) on delete restrict,
    FOREIGN KEY (departmentId) REFERENCES Department (id) on delete restrict,
    FOREIGN KEY (advisorId) REFERENCES Proffessor (id) on delete restrict
    );
    
DROP TABLE if exists Proffessor;
 create table Proffessor(
	id int not null auto_increment primary key,
    degree varchar(50) not null,
    name varchar(100) not null,
    surname varchar(100) not null,
    gender char(10) not null, -- MALE, FEMALE
    departmentId int not null,
    nationalId varchar(20) not null,
    nationalityId int not null,
    telephoneNumber varchar(20) not null,
    address varchar(100) not null,
    startDate date not null,
    endDate date,
    FOREIGN KEY (nationalityId) REFERENCES Nationality (id),
    isDeleted bool not null default false,
    FOREIGN KEY (nationalityId) REFERENCES Nationality (id) on delete restrict,
    FOREIGN KEY (departmentId) REFERENCES Department (id) on delete restrict
    );
 
DROP TABLE if exists Faculty;
create table Faculty(
	id int not null auto_increment primary key,
    name varchar(100) not null,
    deanId int not null,
    isDeleted bool not null default false,
	FOREIGN KEY (deanId) REFERENCES Proffessor (id) on delete restrict
    );
 
DROP TABLE if exists Department;
create table Department(
	id int not null auto_increment primary key,
    facultyId int not null,
    name varchar(100) not null,
    departmentHeadId int not null,
    isDeleted bool not null default false,
    FOREIGN KEY (facultyId) REFERENCES Faculty (id),
    FOREIGN KEY (departmentHeadId) REFERENCES Proffessor (id) on delete restrict
    );

DROP TABLE if exists Nationality;
create table Nationality(
	id int not null auto_increment primary key,
    name varchar(100) not null,
    isDeleted bool not null default false
    );
  
DROP TABLE if exists Scholarship;
create table Scholarship(
	id int not null auto_increment primary key,
    name varchar(100) not null,
    isDeleted bool not null default false
    );
    
DROP TABLE if exists Club;   
create table Club(
	id int not null auto_increment primary key,
    name varchar(100) not null,
    isDeleted bool not null default false
    );
  
DROP TABLE if exists Course;   
create table Course(
	code varchar(10) not null primary key,
    name varchar(30) not null,
    departmentId int not null,
    isDeleted bool not null default false,
    FOREIGN KEY (departmentId) REFERENCES Department (id) on delete restrict
    );
    
DROP TABLE if exists StudentClub;  
create table StudentClub(
	studentId bigint not null,
    clubId int not null,
    startYear int not null,
	endYear int,
    FOREIGN KEY (studentId) REFERENCES Student (id) on delete restrict,
    FOREIGN KEY (clubId) REFERENCES Club (id) on delete restrict,
    primary key(studentId,clubId)
    );

DROP TABLE if exists StudentScholarship;      
create table StudentScholarship(
	studentId bigint not null,
    scholarshipId int not null,
    startYear int not null,
	endYear int,
    FOREIGN KEY (studentId) REFERENCES Student (id) on delete restrict,
    FOREIGN KEY (scholarshipId) REFERENCES Scholarship (id) on delete restrict,
    primary key(studentId,scholarshipId)
    );
 
DROP TABLE if exists CourseProffessor; 
create table CourseProffessor(
	courseCode varchar(10) not null,
	proffessorId int not null,
    year int not null,
    semester varchar(20) not null, -- FALL, SPRING, SUMMER
	FOREIGN KEY (courseCode) REFERENCES Course (code) on delete restrict,
    FOREIGN KEY (proffessorId) REFERENCES Proffessor (id) on delete restrict,
	primary key(courseCode, proffessorId, year, semester)
    );

DROP TABLE if exists StudentCourse;     
create table StudentCourse(
	studentId bigint not null,
    year int not null,
    semester varchar(20) not null, -- FALL, SPRING, SUMMER
    courseCode varchar(10) not null,
    proffessorId int not null,
    isMandatory bool not null,
    ects int not null,
    passed bool,
    averageGrade double,
    FOREIGN KEY (courseCode) REFERENCES Course (code) on delete restrict,
    FOREIGN KEY (proffessorId) REFERENCES Proffessor (id) on delete restrict,
    FOREIGN KEY (studentId) REFERENCES Student (id) on delete restrict,
	primary key(studentId, year , semester, courseCode)
    );
    
    
  


    
    


    
    
    


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS registrationdb ;
USE registrationdb ;

DROP TABLE IF EXISTS Class ;

CREATE TABLE Class (
  classID INT primary key NOT NULL,
  classNumber VARCHAR(10) NOT NULL
 );


DROP TABLE IF EXISTS CourseRegistration;

CREATE TABLE CourseRegistration (
  courseRegID INT primary key NOT NULL,
  semester VARCHAR(10) NOT NULL,
  grade INT NOT NULL
 );

DROP TABLE Course;

CREATE TABLE Course(
  courseID INT primary key NOT NULL,
  courseCode VARCHAR(10) NOT NULL,
  courseName VARCHAR(100) NOT NULL,
  courseLecturer VARCHAR(100) NOT NULL,
  courseSize VARCHAR(45) NOT NULL,
  courseDayTime DATETIME NOT NULL,
  courseECTS INT NOT NULL,
  classID INT NOT NULL,
  courseReg INT NOT NULL,
 FOREIGN KEY (classID) REFERENCES Class (classID),
 FOREIGN KEY (courseReg) REFERENCES CourseRegistration (courseRegID));

DROP TABLE ContactInformation ;

CREATE TABLE ContactInformation (
  `contactInfoID` INT primary key NOT NULL,
  `telephoneNumber` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `roomNumber` VARCHAR(10) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `country` VARCHAR(30) NOT NULL
 );

DROP TABLE aculty ;

CREATE TABLE Faculty (
  facultyID INT primary key NOT NULL,
  facultyName VARCHAR(100) NOT NULL,
  facultyDeanName VARCHAR(100) NOT NULL);


DROP TABLE Department;

CREATE TABLE Department (
  departmentID INT primary key NOT NULL,
  departmentName VARCHAR(100) NOT NULL,
  headOfDepartmentName VARCHAR(45) NOT NULL,
  departmentCourseID INT NOT NULL,
  facultyID INT NOT NULL,
  FOREIGN KEY (facultyID) REFERENCES Faculty (facultyID),
  FOREIGN KEY (departmentCourseID) REFERENCES Course (courseID));
   
DROP TABLE IF EXISTS `mydb`.`Login` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `loginID` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `authorizationType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`loginID`))
ENGINE = InnoDB;

DROP TABLE Professor ;

CREATE TABLE Professor (
  professorID INT primary key NOT NULL,
  professorName VARCHAR(100) NOT NULL,
  professorBirthdate DATE NOT NULL,
  professorDepartment VARCHAR(100) NOT NULL,
  givedCourseID INT NOT NULL,
  contactInfoID INT NOT NULL,
  departmentID INT NOT NULL,
  loginID INT NOT NULL,
  FOREIGN KEY (`givedCourseID`) REFERENCES `mydb`.`Course` (`courseID`),
  FOREIGN KEY (`contactInfoID`) REFERENCES `mydb`.`Contact Information` (`contactInfoID`),
  FOREIGN KEY (`departmentID`) REFERENCES `mydb`.`Department` (`departmentID`),
  FOREIGN KEY (`loginID`) REFERENCES `mydb`.`Login` (`loginID`));
    
DROP TABLE Club ;

CREATE TABLE Club (
  clubID INT primary key NOT NULL,
  clubName VARCHAR(100) NOT NULL,
  headOfClubName VARCHAR(100) NOT NULL,
  descriptionOfClub VARCHAR(200) NOT NULL);

DROP TABLE Student;

CREATE TABLE Student (
  studentID INT primary key NOT NULL,
  studentName VARCHAR(100) NOT NULL,
  studentBirthdate DATE NOT NULL,
  studentScholarship INT NULL,
  studentDepartment VARCHAR(100) NOT NULL,
  registeredCourseID INT primary key NOT NULL,
  academicAdvisorID INT primary key NOT NULL,
  registeredClubID INT primary key NOT NULL,
  contactInfoID INT primary key NOT NULL,
  departmentID INT primary key NOT NULL,
  loginID INT primary key NOT NULL,
    FOREIGN KEY (registeredCourseID) REFERENCES Course (courseID),
    FOREIGN KEY (academicAdvisorID) REFERENCES Professor (professorID),
    FOREIGN KEY (registeredClubID) REFERENCES StudentClub (studentClubID),
    FOREIGN KEY (`contactInfoID`) REFERENCES `mydb`.`Contact Information` (`contactInfoID`),-- ?
    FOREIGN KEY (departmentID) REFERENCES Department (departmentID),
    FOREIGN KEY (`loginID`) REFERENCES Login (`loginID`));-- ?

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

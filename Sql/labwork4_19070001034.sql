
USE `Week11Lab`;

-- Apply an inner join to find Midterm Student Roster for Geology course from 2015 then find 
-- the average grade for that exam. 

select student.Name, student.Surname, course.CourseName, exam.Grade, exam.ExamType 
from student inner join exam on student.StdID=exam.StudentID join course on course.CID=exam.CID and course.Year=exam.Year
where exam.ExamType="Midterm" and exam.Year=2015 and course.CourseName="Geology";

select avg(exam.Grade) as Average 
from student inner join exam on student.StdID=exam.StudentID join course on course.CID=exam.CID 
where exam.ExamType="Midterm" and exam.Year=2015 and course.Year=2015 and course.CourseName="Geology";

-- Can we do the same thing using a Natural Join? If we can show the query? If we cannot 
-- properly explain the reason?

-- We cannot reach the same result using natural join because natural join refers to columns that have the same name.
-- Despite the exam and course have the same column name(CID),student doesn't have the same column name.

-- Apply a join to find all the courses taught in semester Fall (Fall = 1) in year 2015 both have exam
-- information and not have exam information with their Professors. (Exam table must be joined!)

select course.CID, course.CourseCode, course.CourseName, professor.ProfName, professor.ProfLastname 
from course join professor on course.InstructorID=professor.ProfessorID left join exam on course.CID=exam.ExamID
where course.Semester=1 and course.Year=2015 order by course.CID;


--  Apply a join to find all the students with clubs they are registered to. Including students without
-- registration.

select* from club right join student on student.ClubMembership=club.ClubID order by StdID;

-- Insert a new Club called Butterfly Catchers with no chairman and 622,000 usd annual budget. 
-- Then perform a join between student and club tables which shows both students without club 
-- membership and clubs without members.

insert into club values(26,"Butterfly Catchers",null,622000);

select *
from student left join club on club.ClubID=student.ClubMembership
where club.ClubID is null
union all 
select * from student right join club on club.ClubID=student.ClubMembership 
where student.StdID is null;

-- Denormalize the database into a single table using consecutive join statements and save the 
-- output as university_denormalized csv file. You can ignore the records with missing values

create table university_denormalized as
(select club.*,department.DeptName, department.DeptDean, department.DeptBudget, 
student.StdID,student.Name,student.Surname,student.Gender,student.`Date of Birth`,
exam.ExamID,exam.ExamType, exam.Grade,course.*,
professor.ProfName, professor.ProfLastname, professor.NumberOfPublications
from club join student on club.ClubID=student.ClubMembership
join exam on exam.StudentID=student.StdID 
join course on course.CID=exam.CID 
join professor on course.InstructorID=professor.ProfessorID
join department on department.DeptID=professor.Department);



set @degisken = (select count(*) from classroom natural join department);

set @degisken2 = (select count(*) from classroom inner join department on classroom.DeptID=department.DepartmentID);

select  @degisken as "NaturalJoinCount", @degisken2 as "InnerJoinCount";

select classroom_name,DepartmentName from classroom natural join department; 

create table department_new as (select* from department where DepartmentID not in(1,3,5,7,9,11,13,15,17,19,21,23,25));
select* from department_new;
drop table department_new; 
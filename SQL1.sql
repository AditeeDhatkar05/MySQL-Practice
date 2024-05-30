show databases;
create database demodb;
use demodb;
show tables;

create table students(
sid integer,
sname varchar(20),
age integer,
course varchar(20)); 

select * from students;
desc students;
insert into students values(1,"Gorge",23,"Data Analytics");
insert into students values(2,"Kim",22,"MySQL");

create table mytab(id integer,
 name varchar(10) );
 insert into mytab values(1,"Ram");
 insert into mytab values(2,"Sham");
 select * from mytab;

#DDL
#alter, drop, change, rename, modify

# 1. Create
# create: to create table

create table patients(pid integer, pname varchar(30), DOB date, TOA datetime);
insert into patients values(1,"Tom","1990-09-19","2023-01-23 07:30:23");
insert into patients values(2,"Patrick","1987-07-14","2023-01-23 19:20:45");
select * from patients;

#2- Alter
#1. Alter : Add Clouse- to add columns
select * from students;
alter table students add column marks integer;
alter table students add column s_no integer first;
alter table students add column DOB date after sname;

#2. Alter : Drop Clouse- to delete columns
alter table students drop column DOB;

#3. Alter : Change Clouse- to change column name
alter table students change column sid std_id integer;

#4. Alter : Modify Clouse- to change datatype of column
alter table students modify column course varchar(15);

#5. Alter : Rename Clouse- to rename table name
alter table students rename mystudents;
desc students;
show tables;

#3. Rename
# rename : to rename table name
rename table mystudents to students;

#4. Drop
#drop: to remove entire data object (table) from database
show tables;
drop table mytab;

#5. Truncate
show tables;
select * from patients;
truncate patients;
desc patients;
select * from patients;

#DML
# Insert, Update, Delete

#1- insert: to insert records in table
select * from students;
insert into students values(3,3,"Jo",25,"Tableau",87);
insert into students values(4,4,"Marry",22,"Data Analytics",90);
insert into students(s_no, std_id, sname, age) values(5,5,"Ana",26);

insert into students values(6,6,"Harry",28,"MySQL",88),(7,7,"Lara",25,"MySQL",72),(8,8,"Pottor",27,"Data Analytics",92);

#2- Update: to update records in table
update students
set marks=69
where std_id=1;
#SET SQL_SAFE_UPDATES = 0;
select * from students;
update students set marks=89 where sname="Ana";
update students set s_no=1 where std_id=1;
update students set s_no=2 where std_id=2;
update students set sname="Anna" where std_id=5;
update students set marks=95 where sname="Harry";
update students set marks=0 where course is null;

update students set 
course="Power BI",
marks=77,
sname="Ana"
where std_id=5;

update students set 
marks=0
where marks is null;

#3- Delete: to delete records in table

delete from students
where std_id=8;
select * from students;

delete from students
where sname="Lara";

delete from students;
desc students;
select * from students;


#DQL
#select
select * from myemp;
select * from myemp limit 5;
desc myemp;
select first_name, last_name,job_id, salary from myemp limit 10;
select emp_id, first_name, last_name, salary, salary*0.2 as Bonus from myemp;
select emp_id, first_name, last_name, salary, salary*0.2 as Bonus, salary+(salary*0.2) as Total_salary from myemp;

# Distinct

# Unique values from column
select distinct dep_id from myemp;

select * from myemp limit 2;
select distinct job_id from myemp;

select * from person;
select distinct fname from person;
select distinct lname from person;
select distinct fname, lname from person;

# Order by : Sorting

select * from myemp limit 10;
select * from myemp order by dep_id; #numbers
select * from myemp order by dep_id desc;

select * from myemp order by first_name; # Characters
select * from myemp order by first_name desc;

select * from myemp order by hire_date;  # Dates
select * from myemp order by hire_date desc;

# department wise senior and junior people
select first_name , last_name, dep_id,hire_date from myemp order by dep_id, hire_date desc;

# where clouse to select specific record

select * from myemp where dep_id=30;
select * from myemp where dep_id>30;
select * from myemp where dep_id<30;
select * from myemp where dep_id<>30;

# Find all employees whi joined after 2000
select * from myemp where hire_date>"2000-12-31";

# Like Operator( pattern matching(% and _ operators))

# Name starting fro "a"
select * from myemp where first_name like "a%";

# Name that end with "a"
select * from myemp where first_name like "%a";

# Name which contain "c"
select * from myemp where first_name like "%c%";

# first name contains 2 words
select * from myemp where first_name like "% %";

# Find 6 letter word which starts from J
select * from myemp where first_name like "J_____";

# Find 5 letter word which starts from J
select * from myemp where first_name like "j____";
select distinct first_name from myemp where first_name like "J____";  #unique names

select * from mytab where address like "%Indira nagar% %Chennai%";


# Functions
## Row level functions and group/ aggrigate functions

#1.data
select * from myemp limit 10;
select hire_date, year(hire_date) from myemp limit 5;

#2. average
select avg(salary) from myemp;

#3. count
select count(salary) from myemp;
select count(*) from myemp;

#4. min and max
select min(salary), max(salary) from myemp;

#5. current date, time
select curdate(), curtime();
select now();

#6. Concate function
select * from myemp limit 10;
select first_name, last_name, concat(first_name," ",last_name) from myemp;

#7 Upper and lower
select first_name, upper(first_name) from myemp;
select first_name , lower(first_name) from myemp;

#8 Left and right
select last_name, left(last_name,2) from myemp;
select first_name , left(first_name,5) from myemp;

select first_name, right(first_name,3) from myemp;

# Department wise average salary
select * from myemp limit 5;
select * from myemp order by dep_id, salary;
select dep_id, avg(salary) from myemp group by dep_id;

# department wise and manager wise average salary
select dep_id,mgr_id, avg(salary) from myemp group by dep_id,mgr_id;

#Each department under each manager how many people are working
select dep_id,mgr_id, count(*) from myemp group by dep_id, mgr_id order by dep_id;

# manager wise average salary but only from dep 100 and 70 
select dep_id,mgr_id,avg(salary) from myemp group by dep_id,mgr_id having dep_id in (100,70);

# average salary of department 30 amd 50
select dep_id, avg(salary) from myemp group by dep_id having dep_id in (30,50);

# Joins
# Inner, outer, left, right

select * from members;
select * from movies;

# inner join
select * from members inner join movies on movieid=id;
select * from movies inner join members on movieid=id where category="Animations"; # Category filter

#Left join
select * from movies left join members on movieid=id;  # 10 records as movies is left table
select * from members left join movies on movieid=id;  # 8 records as members in left table

# Right join
select * from movies right join members on movieid=id; # All rows from right sided table(members) and common from movies table
select * from members right join movies on movieid=id;

# Cross join / cartessian product

select * from meals;
select * from drinks;
select * from meals cross join drinks;

select mealname,meals.rate,drinkname,drinks.rate, meals.rate+drinks.rate as Total from meals cross join drinks;
# using table aliaces
select m.mealname, m.rate,d.drinkname,d.rate,m.rate+d.rate as Total from meals as m cross join drinks as d;

# Constraints
#1. Domain constraints (Unique, not null, check, default)
#2. Key constraints
#3. Referential integrity constraints

#1. Domain constraints (Unique, not null, check, default)
create table students_info(
sid int unique,
sname varchar(15) not null,
age int check(age>18),
Course varchar(15) default "MySQL");

insert into students_info values (1,"Marry",16,"MySQL");
insert into students_info values(1,"Marry", 26,"MySQL");
insert into students_info values(2, "Harry",30,null);
insert into students_info (sid,sname,age) values(3,"Tom",23);
insert into students_info (sid,sname,age) values(4,"Potter",22),(5,"Ana",24);
desc students_info;

update students_info set Course="MySQL";

alter table students_info modify column course varchar(15) not null default "MySQL";
select * from students_info;

show create table authors; # To show query of the cammand.


# Primary and foreign key constraints

select * from authors;
desc authors;
select * from books;
desc books;

# Drop thables and recreate it again
drop table books;
drop table authors;

create table authors(authorid int PRIMARY KEY,
name varchar(30));

select * from authors;
desc authors;

create table books(bookid int PRIMARY KEY,
Title varchar(255),
aid int,
FOREIGN KEY(aid) REFERENCES authors(authorid)
on delete cascade 
on update cascade);

desc books;

create table T1(
student_id int PRIMARY KEY,
student_name varchar(25),
student_age int);

create table T2(
course_id int PRIMARY KEY,
course_name varchar(20),
std_id int,
FOREIGN KEY(std_id) REFERENCES T1(student_id)
on delete cascade
on update cascade);

desc T1;
desc T2;

# 2. Sequence:  Object of database
# auto_increment

create table mytab(
id int PRIMARY KEY AUTO_INCREMENT,
name varchar(20));
desc mytab;

insert into mytab(name) values ('Tom');
insert into mytab(name) values ("Jim"),("Tim"),("Harry");
select * from mytab;

#3. View: Object of the database
select * from movies;
select * from members;

select mv.title, mv.category,
ifnull(mm.first_name,"-") as fname, ifnull(mm.last_name,"-") as lname from movies as mv
left join members as mm on mm.movieid=mv.id;

# instead of writting this entire cmd again and again, we can create one view of this cmd
create view rentals as
select mv.title, mv.category,
ifnull(mm.first_name,"-") as fname, ifnull(mm.last_name,"-") as lname from movies as mv
left join members as mm on mm.movieid=mv.id;

select * from rentals;
use demodb;
select * from authors;
select * from books;

create view aview as select * from authors where authorid<15;
update aview set authorid=80 where authorid=8;
select * from aview;

select * from myemp;
create view the_view as select * from myemp where dep_id=60 with check option;
select * from the_view;

# View: with check option:

create table my_table(
id int UNIQUE NOT NULL AUTO_INCREMENT,
name varchar(15),
age int CHECK(age>18),
course varchar(30) NOT NULL);
desc my_table;

insert into my_table(name,age,course) 
values("Ram",22,"SQL"),("Sham",25,"Analytics"),("Ajay",21,"SQL"),("Abhay",28,"DS");

select * from my_table;

create view view_table as select * from my_table where course="SQL";
select * from view_table;
insert into view_table (name, age, course)values("madhav",29,"DS");
insert into view_table (name, age, course) values("Ajay",28,"SQL");

#Transaction: Commit and rollback

create table tt(id varchar(15));
insert into tt(id) values ("a"),("b"),("c");
select * from tt;
delete from tt;


start transaction;
insert into tt(id) values ("a"),("b"),("c");
rollback;

start transaction;
insert into tt(id) values ("a"),("b"),("c");
commit;
select * from tt;

delete from tt;

start transaction;
insert into tt(id) values ("a"),("b");
savepoint sp;
insert into tt(id) values ("c"),("d");
savepoint sb;
insert into tt(id) values ("e"),("f");
select * from tt;
rollback to sb;
rollback to sp;
select * from tt;
commit;

insert into tt values("g");
select * from tt;
rollback;

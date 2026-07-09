-- Student Name: Sarah Mubarak
-- Assignment: SQL Fundamentals Assignment
-- Task 1
drop database if exists training_center_db;
create database training_center_db;
use training_center_db;
create table students (
	student_id int AUTO_INCREMENT primary key ,
    fullName varchar(50) not null ,
    gender varchar(15),
    age int not null,
    constraint age_invalid check(age >= 18),
    email varchar(50) unique not null ,
    city varchar(20) default "Riyadh",
    created_at timestamp default current_timestamp
);
create table instructors (
	instructor_id int auto_increment primary key,
    fullName varchar(50) not null ,
    specialty varchar(50) not null,
    email varchar(50) unique not null,
    city varchar(50) default "Riyadh"
);
create table courses (
	course_id int auto_increment primary key ,
    course_name varchar(50) not null ,
    instructor_id int not null  ,
    price decimal(8,2) not null ,
    constraint valid_price check(price>=0),
    start_date timestamp default current_timestamp, 
    duration_hours int not null ,
    category varchar(20),
    foreign key (instructor_id)  REFERENCES  Instructors(instructor_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);
create table enrollments (
	enrollment_id int auto_increment primary key ,
    student_id int not null,
    foreign key (student_id) references students(student_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
    course_id int not null ,
    foreign key (course_id) references courses(course_id)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
    status varchar(30) not null,
    grade decimal(5,2),
    enrollment_date timestamp default current_timestamp
);
-- task 2
 insert into students (fullName,gender,age,email,created_at) values 
	("Sarah Alotaibi","female",21,"sarah019@gmail.com","2026-07-08 15:30:00"),
    ("Nourah Eisa","female",23,"Nourahii0@gmail.com","2026-07-11 20:00:00"),
    ("Talal Alotaibi","male",24,"Talal2480@gmail.com","2026-07-28 19:30:00"),
    ("Abdullah Alotaibi","male",19,"Abdullah2345@gmail.com","2026-06-08 15:25:00"),
    ("Nourah Tariq","female",22,"Nourah877@gmail.com","2026-07-08 15:30:00"),
    ("Rahaf Alslemi","female",22,"Rahaf789@gmail.com","2026-07-08 19:40:00"),
    ("Maram Alyusef","female",22,"Maram56@gmail.com","2026-07-08 12:20:00"),
    ("Yara Alammar","female",21,"Yara480@gmail.com","2026-07-08 18:19:00"),
    ("Nouf Aldahaam","female",23,"Nouf369@gmail.com","2026-07-10 15:10:00"),
    ("Alathob Aljofan","female",21,"Alathob669@gmail.com","2026-05-08 21:30:00"),
    ("Lama Alghamdi","female",24,"Lama741@gmail.com","2026-07-09 10:15:00"),
    ("Faisal Alqahtani","male",26,"Faisal852@gmail.com","2026-07-09 11:45:00");

insert into instructors (fullName,email,city,specialty) values
	("Abdullah Alsehani","Abdullahinst@gmail.com","jeddah",'Databases'),
    ("Amal Alkhaldi","Amalinst@gmail.com","dammam",'Web Development'),
    ("Amani Alzhrani","Amaniinst@gmail.com","Abha", 'Data Science'),
    ("Sarah Alamri","Sarahinst@gmail.com","Taif",'Networking');

insert into courses (course_name, category, price, duration_hours, start_date, instructor_id) VALUES
('SQL Fundamentals', 'Databases', 799.00, 30, '2026-02-01', 1),
('Advanced Database Design', 'Databases', 1299.00, 40, '2026-03-01', 1),
('Frontend Web Development', 'Web Development', 999.00, 45, '2026-02-15', 2),
('Backend Development with Node.js', 'Web Development', 1099.00, 40, '2026-03-10', 2),
('Python for Data Science', 'Data Science', 1499.00, 50, '2026-02-20', 3),
('Machine Learning Basics', 'Data Science', 1799.00, 55, '2026-04-01', 3),
('Network Security Essentials', 'Networking', 899.00, 35, '2026-03-05', 4);

INSERT INTO enrollments (student_id, course_id, enrollment_date, status, grade) VALUES
(1, 1, '2026-02-02', 'Completed', 92.5),
(1, 3, '2026-02-16', 'Active', NULL),
(2, 1, '2026-02-03', 'Completed', 88.0),
(3, 2, '2026-03-02', 'Active', NULL),
(4, 1, '2026-02-02', 'Completed', 76.0),
(5, 3, '2026-02-17', 'Completed', 95.0),
(6, 4, '2026-03-11', 'Active', NULL),
(7, 5, '2026-02-21', 'Completed', 60.0),
(8, 5, '2026-02-22', 'Canceled', NULL),
(9, 6, '2026-04-02', 'Active', NULL),
(10, 1, '2026-02-04', 'Completed', 99.0),
(10, 2, '2026-03-03', 'Active', NULL),
(11, 4, '2026-03-12', 'Completed', 55.0),
(12, 6, '2026-04-03', 'Active', NULL),
(2, 5, '2026-02-23', 'Completed', 81.0),
(3, 1, '2026-02-05', 'Completed', 70.0),
(4, 3, '2026-02-18', 'Active', NULL),
(6, 6, '2026-04-04', 'Completed', 85.0),
(7, 1, '2026-02-06', 'Completed', 91.0),
(11, 2, '2026-03-04', 'Active', NULL),
(12, 4, '2026-03-13', 'Completed', 68.0);
-- task 3
select * from students where student_id=2;
update students set email="Nourah990@gmail.com" where student_id=2;
select * from students where student_id=2;
select * from instructors;
select * from enrollments;
select * from enrollments where enrollment_id=7;
delete from enrollments where enrollment_id=7;
select * from enrollments;
select * from courses where course_id=5;
delete from courses where course_id=5;
select * from courses;
-- task 4
select concat(fullName,'-',city) from students;
select upper(fullName) from  instructors;
select lower(fullName) from  students where student_id=2; 
select email, substring(email,1,locate('@',email)-1) as username from students;
select replace (city,'Riyadh','RYD') from students;
select fullName, char_length(fullName) as name_length from students;
-- task 5
select distinct category from courses;
select * from courses order by price desc;
select * from courses order by price desc limit 3;
select fullName from students where fullName like "%ah%";
select course_name from courses where course_name like '%\_%' escape '\\';
-- task 6
select count(*) from students;
select count(*) from enrollments;
select sum(price) from courses;
select avg(price) from courses;
select min(price) from courses;
select max(price) from courses;
select category, count(*) as total_courses, avg(price) as avg_price from courses group by category;
select courses.course_name, count(enrollments.student_id) AS total_students
from courses join enrollments on courses.course_id = enrollments.course_id
group by courses.course_id, courses.course_name
having count(enrollments.student_id) > 1;
-- task 7
select * from courses where price between 500 and 1700;
select * from courses where category in ('Databases','Networking');
select * from students where gender="female" and (age=22 or age =23);
select * from enrollments where grade is null;
select * ,
	case 
		when grade is null then "Not graded"
		when grade between 90 and 100 then "Excellent"
		when grade >= 60 then "Passed"
		else "Failed"
	end as grade_status
from enrollments;
-- task 8
desc students;
desc courses;
alter table students add phone_number char(10);
alter table students add notes char(10);
alter table students modify gender varchar(10);
alter table courses add constraint chk_duration check(duration_hours > 0);
alter table students drop column notes;
desc students;
desc courses;
-- task 9
select s.fullName ,c.course_name from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id ;
select s.fullName ,c.course_name from courses c left join enrollments e on c.course_id= e.course_id left join students s on e.student_id=s.student_id; -- we join here three tables 
-- right join is rarely used because left join is easier to read.
-- Most developers simply switch the table order and use left join instead.
select s.fullName , i.fullName ,c.course_name from students s join enrollments e on s.student_id=e.student_id 
join courses c on e.course_id=c.course_id join instructors i on c.instructor_id= i.instructor_id;  -- we join here four tables 
select count(*),i.fullName from students s join enrollments e on s.student_id=e.student_id 
join courses c on e.course_id=c.course_id join instructors i on c.instructor_id= i.instructor_id group by i.instructor_id,i.fullName; 
-- task 10
create view vw_student_course_summary as select s.fullName as student_name, i.fullName as instructor_name, s.email ,c.course_name,e.status,e.grade 
from students s join enrollments e on s.student_id=e.student_id join courses c on e.course_id=c.course_id 
join instructors i on c.instructor_id= i.instructor_id;
select * from vw_student_course_summary ;
select * from vw_student_course_summary where grade >=90 order by grade;
CREATE OR REPLACE VIEW vw_student_course_summary AS
SELECT
    s.fullName AS student_name,
    i.fullName AS instructor_name,
    s.email,
    c.course_name,
    e.status,
    e.grade,
    CASE
        WHEN grade IS NULL THEN 'Not graded'
        WHEN grade BETWEEN 90 AND 100 THEN 'Excellent'
        WHEN grade >= 60 THEN 'Passed'
        ELSE 'Failed'
    END AS grade_status
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN instructors i ON c.instructor_id = i.instructor_id;
select * from vw_student_course_summary;
select category, COUNT(*) as total_courses from courses
group by category WITH ROLLUP;
select * from students;
-- bouns 

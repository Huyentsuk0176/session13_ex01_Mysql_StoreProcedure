create database module3_session13_ex01;
use  module3_session13_ex01;

create table students(
student_id  int auto_increment primary key,
full_name varchar(100) not null,
date_of_birth date not null,
email varchar(100)not null unique);
//goi tat ca sinh vien
delimiter $$
create procedure get_all_students()
begin
select*from students;
end $$
delimiter ;
drop procedure if exists get_all_student;
// them sinh vien
delimiter $$
create procedure add_student(
in in_full_name varchar(100),
in in_date_of_birth date,
in in_email varchar(100)
)
begin 
insert into students(full_name,date_of_birth,email)
value(in_full_name,in_date_of_birth,in_email);
end $$
delimiter ;
drop procedure if exists add_student;

//cap nhat sinh vien
delimiter $$
create procedure update_student(
in in_id int,
in in_full_name varchar(100),
in in_date_of_birth date,
in in_email varchar(100)
)
begin
update students
set full_name=in_full_name,
date_of_birth=in_date_of_birth,
email=in_email
where student_id=in_id;
end $$

delimiter ;
//tim sinh vien theo id
delimiter $$
create procedure find_student_by_id(
in in_id int
)
begin
select*from students
where student_id=in_id;
end $$
delimiter ;
//xoa sinh vien
delimiter $$
create procedure delete_student(
in in_id int
)
begin
delete from students
where student_id=in_id;
end$$
delimiter ;
//tim sinh vien theo ten
delimiter $$
create procedure search_student_by_name(
in in_name varchar(100)
)
begin
select*from students
where full_name like concat('%',in_name,'%');
end $$
delimiter ;

call add_student('pham thi huyen','1991-02-03','huyen@gmail.com');
call add_student('do gia huy','2020-11-03','huy@gmail.com');
call get_all_student();
call update_student(1,'nguyen van d','2020-12-30','d@gmail.com');
call find_student_by_id(1);
call search_student_by_name('pham');
call delete_student(1);




---1.a
create database university_db;

create table KBTU
(
    id char(10) primary key,
    name varchar(20),
    dept_name varchar(20),
    salary numeric(8,2) check(salary > 0)
);

alter database university_db rename to KBTU_DB;

drop database KBTU_DB;

---1.b
create database university_db;

create table students(
    id char(10) primary key ,
    name varchar(20),
    birthday date,
    GPA numeric(2,1) default 3.0
);

insert into students values('20B030320', 'Rauan', '13.10.2002', 3.03);

insert into students(id, name, birthday, GPA) values('20B030320', 'Rauan', '13.10.2002', 3.03);

update students set GPA = 2.9 where GPA = 3.5;
update students set GPA = 2.8;

delete from students where GPA > 2.0;

---2
create database Company;

create table customers(
    customer_id integer primary key ,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
create table products(
    product_id varchar primary key ,
    name varchar unique not null ,
    description text not null,
    price double precision not null check ( price > 0 )
);
create table orders(
    order_code integer,
    customer_id integer,
    total_sum double precision not null check ( total_sum > 0 ),
    is_paid boolean not null,
    primary key (order_code),
    foreign key (customer_id) references customers(customer_id);
);
create table order_items(
    order_code integer references orders(order_code),
    product_id varchar references products(product_id),
    quantity integer not null check ( quantity>0 ),
    constraint order_items_pkey primary key (order_code, product_id)
);

---3
create database Task_3;

create table student (
    student_id varchar(15) primary key,
    full_name varchar(50) not null,
    age int not null check ( age > 10),
    birth_date date not null check ( birth_date > date '2011-01-01'),
    gender char(1) not null check (gender = 'm' or gender = 'f'),
    need_for_dormitory boolean,
    info_about_yourself text
);
create table instructors (
    instructor_id varchar(15) primary key,
    full_name varchar(50) not null,
    speaking_language varchar(40),
    work_experience integer not null check ( work_experience > 0 ),
    able_to_have_remote_lessons boolean not null
);

create table lesson (
    lesson_title varchar(50) not null ,
    teaching_instructor varchar(50),
    foreign key (teaching_instructor) references instructors(full_name),
    study_student varchar(50),
    foreign key(study_student) references student(full_name),
    room_number integer not null check ( room_number > 0 )

);

---4
create database Company;

create table customers(
    customer_id integer primary key ,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
create table products(
    product_id varchar primary key ,
    name varchar unique not null ,
    description text not null,
    price double precision not null check ( price > 0 )
);
create table orders(
    order_code integer,
    customer_id integer not null ,
    total_sum double precision not null check ( total_sum > 0 ),
    is_paid boolean not null,
    primary key (order_code),
    foreign key (customer_id) references customers(customer_id)
);
create table order_items(
    order_code integer references orders(order_code),
    product_id varchar references products(product_id),
    quantity integer not null check ( quantity>0 ),
    constraint order_items_pkey primary key (order_code, product_id)
);

insert into customers values (150678, 'Jack Abilence', '2021-09-23', 'almaty auezov distict');
insert into products values ('7452','iPhone', 'smartphone', '700000');
insert into orders values (124611, 150678, 700000.0, true);
insert into order_items values (124611, 7452, 1);

update products set name = 'Samsung' where product_id = '7452';

delete from order_items where quantity = 1;



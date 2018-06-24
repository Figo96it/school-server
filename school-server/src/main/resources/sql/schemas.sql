CREATE DATABASE IF NOT EXISTS School;

CREATE TABLE if not exists school (
  id int not null AUTO_INCREMENT,
  name varchar(255) not null,
  address varchar(255) not null,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS class (
  id_class INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_school INT NOT NULL,
  class_name VARCHAR(45) NOT NULL,
  class_year YEAR,
  form_tutor_id INT NOT NULL
);


alter table class add foreign key (id_school) references school(id)
  on delete no action;

CREATE TABLE if not exists employee (
  id_employee int NOT NULL AUTO_INCREMENT,
  first_name varchar(45) DEFAULT NULL,
  last_name varchar(45) DEFAULT NULL,
  position varchar(45) DEFAULT NULL,
  id_class varchar(45) DEFAULT NULL,
  PRIMARY KEY (id_employee)
);

alter table class add foreign key (form_tutor_id) references employee(id_employee)
  on delete no action;

CREATE TABLE IF NOT EXISTS plan(
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  class_id int NOT NULL);

alter table plan add foreign key (class_id) references class(id_class)
  on delete no action;

CREATE TABLE school_subject (
  id_subject INT NOT NULL AUTO_INCREMENT,
  subject_name VARCHAR(45) NOT NULL,
  id_plan INT NOT NULL,
  PRIMARY KEY (id_subject));

alter table school_subject add foreign key (id_plan) references plan(id)
  on delete no action;

CREATE TABLE IF NOT EXISTS grade(
  id int PRIMARY KEY AUTO_INCREMENT,
  subject_id int NOT NULL,
  student_grade_id INT NOT NULL,
  grade int(1) );


alter table grade add foreign key (subject_id) references school_subject(id_subject)
  on delete no action;

CREATE TABLE IF NOT EXISTS student_grade (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_student int not null,
  id_grade int not null
);

alter table grade add foreign key (student_grade_id) references student_grade(id)
  on delete no action;

create table student (
  id int auto_increment not null,
  class_id int not null,
  first_name varchar(20) not null,
  last_name varchar(20) not null,
  primary key (id)
);

alter table student_grade add foreign key (id_student) references student(id)
  on delete no action;

CREATE TABLE IF NOT EXISTS parent(
  id           INT AUTO_INCREMENT PRIMARY KEY,
  first_name   VARCHAR(20),
  surname      VARCHAR(20) NOT NULL,
  student_id   INT         NOT NULL,
  tell_number  VARCHAR(9),
  mobile_phone VARCHAR(9),
  mail         VARCHAR(30)
);

alter table parent add foreign key (student_id) references student(id)
  on delete no action;

alter table student add foreign key (class_id) references class(id_class)
  on delete no action;


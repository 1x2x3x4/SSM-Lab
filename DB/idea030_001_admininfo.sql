create database idea030_001_admininfo;

use idea030_001_admininfo;

create table u_admin(
id int primary key auto_increment,
username varchar(25),
password varchar(50),
sex varchar(50),
age int(11),
jobs varchar(50),
phone varchar(50),
id_namber varchar(50),
address varchar(16)
);

insert into u_admin(username,password,sex,age,jobs,phone,id_namber,address) values ('tom','tom','男','20','teacher','13667899901','tom','tom');
insert into u_admin(username,password,sex,age,jobs,phone,id_namber,address) values ('jake','jake','男','20','doctor','18190208877','jake','jake');
insert into u_admin(username,password,sex,age,jobs,phone,id_namber,address) values ('joy','joy','男','20','worker','16788663456','joy','joy');



insert into u_admin values (null,'tom','tom','男','20','teacher','13667899901','tom','tom');
insert into u_admin values (null,'jake','jake','男','20','doctor','18190208877','jake','jake');
insert into u_admin values (null,'joy','joy','男','20','worker','16788663456','joy','joy');

-- create database-- 
create database bank;
use bank;
-- create table "BRANCH"-- 
create table branch(
name 	varchar 	(20) 	primary key not null,
city 	varchar 	(20) 	not null ,
assests bigint 		(255),
liabilities  bigint (255));

-- create table "CUSTOMER"-- 
create table customer (
cus_id 		varchar (20) check  (cus_id like "c_____") not null primary key,
cus_name 	varchar(50) not null,
address 	varchar(50) not null,
contect 	bigint(10) not null,
dob 		date not null,
age 		INT(2) not null);

-- create table "EMPLOYEE"-- 
create table employee (
emp_id 		varchar (20) check  (emp_id like "e_____") not null primary key,
emp_name 	varchar(50) not null,
address 	varchar(50) not null,
contect 	bigint(10) not null,
department 	varchar(25) not null,
years_of_service int(10) ,
start_date 	date );

-- create table "SAVING_ACC"-- 
create table saving_acc(
acc_no 		varchar(10) check (acc_no like "xxxxxx____" )not null primary key,
balance 	int not null ,
intrest_rate int not null,
daily_withdrawal_limit int not null
);

-- create table "CURRENT_ACC"-- 
create table current_acc(
acc_no 		varchar(10) check (acc_no like "xxxxxx____" )not null primary key,
balance 	int not null ,
pratramaction_charge int not null,
overdraf_amount int not null
);

-- create table "GENERALIZED"-- 
create table generalized(
acc_no varchar(10) check (acc_no like "xxxxxx____" )not null primary key,
balance int not null);

-- create table "LOAN"-- 
create table loan( 
loan_no varchar(10) check (loan_no like "xxxxxx____" )not null primary key,
amount int not null 
);

-- create table "PAYMENT"-- 
create table payment(
pay_no varchar(5) check (pay_no like "p____") primary key not null,
date date not null,
amount int not null
);

-- INSERT DATA INTO TABLE "BRANCH"--
insert into branch(name,city,assests,liabilities) values
("PATNA","PATNA",1000000,250000),
("HAJIPUR","HAJIPUR",2000000,258000),
("SIWAN","SIWAN",1000000,250000),
("BHAGWANPUR","BHAGWANPUR",1000000,250000),
("MAHRAJGANJ","MAHRAJGANJ",1000000,250000)
;

-- INSERT DATA INTO TABLE "CUSTOMER"--
insert INTO customer(cus_id ,cus_name,address ,contect ,dob ,age) values 
("c00002","rounak singh","siwan",9631202008,'2011-6-27',15),
("c00003","khushi kumari","siwan",9661202008,'2007-6-27',19),
("c00004","anisha kumari","bhagwanpur",9631582008,'2004-6-27',22),
("c00005","ruchi kumari","mahrajgang",9631258908,'2011-6-27',15)
;

-- add column account_no--
ALTER TABLE customer
ADD COLUMN acc_no VARCHAR(10);

alter table customer add constraint chk_acc_no check (acc_no like "xxxxxx____");
UPDATE customer
SET acc_no = 'xxxxxx2009'
WHERE cus_id = 'c00001';

-- INSERT DATA INTO TABLE "EMPLOYEE"--
insert INTO employee(emp_id ,emp_name ,address 	,contect ,department,years_of_service,start_date) values
("e00001","anisha singh","siwan",9632145800,"manager",3,'2023-5-5'),
("e00002","neha singh","hajipur",9638145800,"clerk",3,'2023-5-5'),
("e00003","manisha singh","siwan",9632148800,"accounter",2,'2024-5-5'),
("e00004","nisha singh","siwan",9632145800,"cashiar",4,'2022-5-5'),
("e00005","sandeep kumar","nawada",9632135800,"gard",6,'2020-5-5')
;

-- INSERT DATA INTO TABLE "SAVING ACCOUNT"--
insert INTO saving_acc(acc_no ,balance ,intrest_rate,daily_withdrawal_limit) values
("xxxxxx2003",500000,4,10000),
("xxxxxx2007",45000,4,10000),
("xxxxxx2009",500,4,10000),
("xxxxxx2006",70000,4,10000),
("xxxxxx2004",65000,4,10000);

-- INSERT DATA INTO TABLE "CURRENT ACCOUNT"--
insert into current_acc(acc_no ,balance ,pratramaction_charge,overdraf_amount) values
("xxxxxx2010",400000,5000,1000),
("xxxxxx2011",450000,4000,1500),
("xxxxxx2012",259000,2000,1560),
("xxxxxx2013",892200,7000,1400),
("xxxxxx2014",589335,6000,1000);

-- INSERT DATA INTO TABLE "GENERALIZED"--
insert into generalized(acc_no ,balance) values
("xxxxxx2010",400000),
("xxxxxx2011",450000),
("xxxxxx2012",259000),
("xxxxxx2013",892200),
("xxxxxx2014",589335),
("xxxxxx2003",500000),
("xxxxxx2007",45000),
("xxxxxx2009",500),
("xxxxxx2006",70000),
("xxxxxx2004",65000);

-- INSERT DATA INTO TABLE "LOAN"--
insert into loan(loan_no,amount) values
("xxxxxx0001",40000),
("xxxxxx0002",50000),
("xxxxxx0003",59000),
("xxxxxx0004",892200),
("xxxxxx0005",989335),
("xxxxxx0006",200000),
("xxxxxx0007",5000),
("xxxxxx0009",6500),
("xxxxxx0008",50000),
("xxxxxx0000",655000);

-- INSERT DATA INTO TABLE "PAYMENT"--
alter table payment add constraint chk_pay_no check (pay_no like "p____");
alter table payment modify column pay_no varchar(5);
insert into payment(pay_no,date,amount) values
("p0001",'2025-5-4',50000),
("p0002",'2026-8-14',50000),
("p0003",'2025-6-15',50000),
("p0004",'2026-4-3',50000),
("p0005",'2026-3-2',50000);



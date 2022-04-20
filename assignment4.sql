---1

create table dept3_aritra
(
dcode varchar(10) primary key,
dname varchar(30)
);

create table emp3_aritra
(
ecode varchar(10) primary key,
dcode varchar(10),
name varchar(30),
grade varchar(1),
basic number(8,2),
jn_dt date default sysdate,
address varchar(50),
city varchar(20),
foreign key (dcode) references dept3_aritra(dcode) ,
constraint c1 check (basic>=5000 and basic<=9000),
constraint c2 check(grade in ('A','B','C')),
constraint c3 check (name=upper(name))
);

create table leave3_aritra
(
ecode varchar(10),
leave varchar(2),
from_dt date,
to_dt date,
foreign key (ecode) references emp3_aritra(ecode) on delete cascade,
constraint c4 check(leave in ('CL', 'EL', 'ML'))
);

---2

insert into dept3_aritra values('D1', 'Colonel');
insert into emp3_aritra values('E1', 'D1', 'Adam', 'A', '2000', '2-JAN-2020', '5 Downing Street', 'Delhi');
insert into emp3_aritra values('E1', 'D2', 'ADAM', 'A', '5000', '2-JAN-2020', '5 Downing Street', 'Delhi');
insert into emp3_aritra values('E1', 'D1', 'ADAM', 'A', '5000', '2-JAN-2020', '5 Downing Street', 'Delhi');
delete from dept3_aritra where dcode='D1';
insert into leave3_aritra values('E1', 'CL', '20-JAN-2021', '22-JAN-2021');
insert into leave3_aritra values ('E2' , 'EL', '20-FEB-2021', '22-FEB-2021');
insert into leave3_aritra values ('E3' , 'CL', '20-JUN-2021', '22-JUN-2021');
insert into leave3_aritra values ('E4' , 'EL', '20-AUG-2021', '22-AUG-2021');
delete from emp3_aritra where ecode='E2';
---3

insert into emp3_aritra values('E1', 'D1', 'ADAM', 'A', '5000', '2-JAN-2020', '5 Downing Street', 'Delhi');
insert into emp3_aritra values('E2', 'D1', 'MARK', 'A', '7000', '3-JAN-2020', '5 Downing Street', 'Delhi');
insert into emp3_aritra values('E3', 'D1', 'SUNIL', 'A', '7000', '4-JAN-2020', '5 Downing Street', 'Delhi');
insert into emp3_aritra values('E4', 'D1', 'JOHN', 'A', '9000', '6-JAN-2020', '5 Downing Street', 'Delhi');

---a

create table temp3_aritra as
(
select ecode, name, dname, basic from emp3_aritra join dept3_aritra on emp3_aritra.dcode=dept3_aritra.dcode where basic=7000 and emp3_aritra.dcode='D1'
);

---b

insert into temp3_aritra 
select ecode, name, dname, basic from emp3_aritra join dept3_aritra on emp3_aritra.dcode=dept3_aritra.dcode where basic>7000;

---c

alter table temp3_aritra add net_pay number(8,2);

---d

update temp3_aritra set net_pay = 1.5*basic;

---e

alter table temp3_aritra drop column net_pay;

---4

drop table leave3_aritra;
drop table emp3_aritra;
drop table dept3_aritra;


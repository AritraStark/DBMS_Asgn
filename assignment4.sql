---1

create table emp_temp_aritra
(
ecode number(3,0) primary key,
enamae varchar(30),
dcode number(3,0),
basic number(8,2),
foreign key (dcode) references dept_temp_aritra(dcode)
);

insert into emp_temp_aritra values(1, 'A', 1, 20000);
insert into emp_temp_aritra values(2, 'B', 2, 30000);
insert into emp_temp_aritra values(3, 'C', 1, 40000);
insert into emp_temp_aritra values(5, 'D' ,3 ,25000);

DECLARE
r emp_temp_aritra%rowtype;
BEGIN
select * into r from emp_temp_aritra where ecode = &ecode;
dbms_output.put_line(r.enamae);
EXCEPTION
WHEN no_data_found THEN
dbms_output.put_line('No such employee found.');
END;
/

---2

create table dept_temp_aritra
(
dcode number(3,0) primary key,
dname varchar(30)
);

insert into dept_temp_aritra values (1, 'Finance');
insert into dept_temp_aritra values (2, 'Technology');
insert into dept_temp_aritra values (3, 'Management');

DECLARE
ecodei emp_temp_aritra.ecode%type;
enamei emp_temp_aritra.enamae%type;
dcodei emp_temp_aritra.dcode%type;
basici emp_temp_aritra.basic%type;
cnte number(3,0);
cntd number(3,0);
BEGIN
ecodei := &ecodei;
enamei := '&enamei';
dcodei := &dcodei;
basici := &basici;
select count(*) into cnte from emp_temp_aritra where ecode = ecodei;
select count(*) into cntd from dept_temp_aritra where dcode = dcodei;
IF cnte = 0 and cntd = 1 THEN
	insert into emp_temp_aritra values(ecodei, enamei, dcodei, basici);
ELSE
	dbms_output.put_line('Invalid Data.');
END IF;
END;
/

---3

select * from 
(
select * from emp_temp_aritra order by basic desc
)
where rownum <= 5;

---4

DECLARE
cnt number(3,0);
dcodei emp_temp_aritra.dcode%type;
BEGIN
dcodei:=&dcodei;
select count(*) into cnt from emp_temp_aritra where dcode=dcodei;
delete from emp_temp_aritra where dcode = dcodei;
dbms_output.put_line('Deleted number of users is ');
dbms_output.put_line(TO_CHAR(cnt));
END;
/


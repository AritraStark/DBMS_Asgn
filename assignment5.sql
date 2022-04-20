create table results(
    roll varchar(5),
    scode varchar(5),
    marks number(3),
    primary key(roll, scode)
);

create backpaper(
    roll varchar(5),
    scode varchar(5),
    primary key(roll, scode)
);


create or replace trigger filter_results
before insert
on results
for each row
declare 
m_ number(3);
r result.roll%type;
s result.scode%type;
count_ number(1);
begin
m_ := :new.marks;
r := :new.roll;
s := :new.scode;
select count(*) into count_ from backpaper where scode=s and roll=r;

if m_ >= 50 and count_>0 then
delete from backpaper where scode=s and roll=r;
end if;

if m_ < 50 and count_<1 then
insert into backpaper values(r,s);
end if;

end;
/


insert into backpaper values('R2','S2');

insert into results values('R1', 'S1', 33);
insert into results values('R2', 'S2', 73);


--2

create table request(
    req_no varchar(5) primary key,
    req_dt date;
);

create table service_log(
    entry_no number(5) primary key,
    req_no varchar(5),
    service_dt date default sysdate
);


create or replace trigger auto_incr
before insert
on service_log 
for each row
declare
c number;
begin
select nvl(max(entry_no),0) into c from service_log;
c := c+1;
:new.entry_no := c ;
end;
/ 

create or replace trigger process_req
after delete
on request
for each row
declare
r request.req_no%type;
begin
r := :old.req_no;
insert into service_log values(0, r, default);
end;
/

insert into request values('R1', current_date);

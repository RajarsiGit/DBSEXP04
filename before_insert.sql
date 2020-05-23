create table marks(
s_id varchar(6) not null,
name varchar(20) not null,
subj1 number(5),
subj2 number(5),
subj3 number(5),
total number(5),
per number(5),
constraint marks_pk primary key (s_id)
);

create trigger marks
before INSERT on marks 
for each row 
begin
:new.total := :new.subj1 + :new.subj2 + :new.subj3;
:new.per := :new.total / 300*100;
end;
/

insert into marks values('S01','Sawon',84,92,76,0,0);
insert into marks values('S02','Virat',51,82,46,0,0);
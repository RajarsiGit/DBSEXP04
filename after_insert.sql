create table books(
bid number(3),
btitle varchar(20),
copies number(3),
constraint books_pk primary key(bid)
);

create table issue(
bid number(3),
sid number(3),
btitle varchar(20),
constraint issue_pk primary key(bid)
);

set verify off;
create or replace trigger book_issue
after insert on issue
for each row
enable
begin
update books
set copies = copies - 1
where books.bid =: new.bid;
end;
 /

insert into books values(1,'PL/SQL',15);
insert into books values(2,'SQL',5);
insert into books values(3,'PHP',10);
insert into books values(4,'PYTHON',11);
insert into books values(5,'JAVA',21);

insert into issue values(5,4,'JAVA');
--CREATE A DATABASE FOR TOUR AND TRAVEL SYSTEM
create database tour_travel01;

--CREATING TABLES USING CREATE TABLE COMMAND:
create table dept01(dept_no int primary key, dept_name varchar(20), dept_loc varchar(20));
select * from dept01;

create table emp01(emp_id int primary key, f_name varchar(20), m_name varchar(20), l_name varchar(20), dept_no int foreign key references dept01);
select*from emp01;
 

create table cust01(adhar int primary key,c_fname varchar(20),c_mname varchar(20),c_lname varchar(20),phone int,c_id int foreign key
references emp01,dept_no int foreign key references dept01);
select*from cust01;

create table pack01(p_id int not null primary key,pname varchar(20),pbudget varchar(20),total_people varchar(25),pdiscount varchar(20),semp_id int foreign key references emp01,ssemp_id int foreign key references cust01);
select*from pack01;

create table hotel01(h_id int primary key,hname varchar(20),cost money,ph_id int foreign key references pack01);
create table airfare01(ticket_no int primary key,price  money,duration time,a_id int foreign key references pack01);

create table duration01(dur int foreign key references pack01(p_id),slot_id int,sdate date,edate date, stime time, etime time,primary key(dur,slot_id));

select*from dept01;
insert into dept01 values(123,'Tours','Mumbai');
insert into dept01 values(113,'Travels','Mumabi');
insert into dept01 values(100,'Tours','Pune');
insert into dept01 values(121,'Travels','Pune');

select*from emp01;
--INSERTING VALUES INTO THE DEPARTMENT TABLE USING INSERT AND THE UPDATING THE NULL LEFT VALUES REFERENCING CHILD TABLES USING UPDATE COMMAND
insert into emp01 values(444,'Dixita','B','Patil',null);
insert into emp01 values(222,'priyanka','D','Pathak',null);
insert into emp01 values(333,'Shazia','I','Shaikh',null);
insert into emp01 values(111,'Alhad','S','velhal',null);


update emp01 set dept_no=123 where emp_id=222;
update emp01 set dept_no=123 where emp_id=444;
update emp01 set dept_no=100 where emp_id=333;
update emp01 set dept_no=121 where emp_id=111;

select*from cust01;
insert into cust01 values(12345,'Mike','G','Will',90876421,null,null);
insert into cust01 values(23411,'Liya','R','Kirt',90876421,null,null);
insert into cust01 values(23412,'Bell','G','Bert',90876421,null,null);
insert into cust01 values(56778,'Josh','L','Loius',90876421,null,null);
insert into cust01 values(90099,'Sadia','K','Hortan',90876421,null,null);
insert into cust01 values(34562,'Nathan','T','Simton',90876421,null,null);
insert into cust01 values(13425,'Samira','Y','Bond',90876421,null,null);

update cust01 set c_id=222 where adhar=56778;
update cust01 set c_id=444 where adhar=13425;
update cust01 set c_id=333 where adhar=90099;
update cust01 set c_id=111 where adhar=23411;
update cust01 set c_id=444 where adhar=34562;
update cust01 set c_id=222 where adhar=23412;
update cust01 set c_id=333 where adhar=12345;

update cust01 set dept_no=113 where adhar=56778;
update cust01 set dept_no=123 where adhar=13425;
update cust01 set dept_no=121 where adhar=90099;
update cust01 set dept_no=100 where adhar=23411;
update cust01 set dept_no=100 where adhar=34562;
update cust01 set dept_no=121 where adhar=23412;
update cust01 set dept_no=113 where adhar=12345;

select*from pack01;
insert into pack01 values(1,'American Heritage','400000','50','10%',null,null);
insert into pack01 values(2,'Europe Tour','560000','100','25%',null,null);
insert into pack01 values(3,'Aussie Vacay','300000','150','30%',null,null);

update pack01 set semp_id=444 where p_id=2;
update pack01 set semp_id=111 where p_id=1;
update pack01 set semp_id=222 where p_id=3;

update pack01 set ssemp_id=12345 where p_id=2;
update pack01 set ssemp_id=23412 where p_id=1;
update pack01 set ssemp_id=90099 where p_id=3;

select*from hotel01;
insert into hotel01 values(10,'Mariot',125500,null);
insert into hotel01 values(11,'Rome',225500,null);
insert into hotel01 values(12,'Tiffny',425500,null);

update hotel01 set ph_id=1 where h_id=10; 
update hotel01 set ph_id=2 where h_id=11; 
update hotel01 set ph_id=3 where h_id=12; 

delete from airfare01;
select*from airfare01;
insert into airfare01 values(34,110000,'10:10:10',null);
insert into airfare01 values(44,120000,'10:11:11',null);
insert into airfare01 values(54,130000,'10:12:11',null);

update airfare01 set a_id=1 where ticket_no=44;
update airfare01 set a_id=3 where ticket_no=54;
update airfare01 set a_id=2 where ticket_no=34;


select*from duration01;
delete from duration01;
insert into duration01 values(1,44,'2021-04-12','2021-04-18','13:00:00','13:00:12');
insert into duration01 values(2,55,'2021-09-01','2021-09-07','14:10:10','14:11:12');
insert into duration01 values(3,66,'2021-03-08','2021-03-15','15:10:10','15:11:12');

--DISPLAY DETAILS OF CUSTOMERS WHO ARE ADVICED BY EMPLOYEES HAVING EMPLOYEE ID=444;
select * from cust01 where c_id=444;
--DISPLAY DISTINCT MIDDLE NAMES OF CUSTOMERS
select distinct c_mname from cust01;

--DISPLAY DETAILS OF PACKAGE DURATION BASED ON START DATE BETWEEN 01/04/2021 AND 15/04/2021;
select  * from duration01 where sdate between '2021-04-01' and '2021-04-15';

--DISPLAY DETAILS OF PACKAGES WHOSE NAME STARTS WITH LETTER A
select * from pack01 where pname like 'A%';

--DISPLAY DETAILS OF PACKAGES HAVING LAST CHARACTER IS NOT A LETTER BETWEEN E TO R
select * from pack01 where pname not like '%[e-r]';

select*from pack01;
select*from hotel01;
--DISPLAY DETAILS OF HOTEL WHOSE COST IS LESS THAN ALL WHEN COMPARED TO THE PACKAGE BUDGET;
select * from hotel01 where cost < all (select pbudget from pack01);

--DISPLAY HOTEL DETAILS WHERE COST IS GREATER THAN MAX COST OF ALL AND SHOULD HAVE PACKAGE ID AS 1
select* from hotel01 where cost> (select max(cost) from hotel01 where ph_id=1);

select* from hotel01 where cost>= some (select cost from emp01 where dept_no in(select dept_no from dept01 where dept_name in ('Travel')));
--complex queries
--Calculate average, minimum, maximum total cost grouped by their hotel id from hotel table
select h_id,avg(cost) as avg_cost,min(cost) as min_cost,max(cost)as max_cost,sum(cost) as total_cost from hotel01 group by h_id;

--Display hotel id and number of hotel id those having cost more than 400K
select h_id,count(*) as no_of_hotel_id from hotel01 where cost>400000 group by h_id;

--Display hotel id and avg cost of each hotel where avg cost of hotel is greater or equal to 400K
select h_id,avg(cost) as avg_cost from hotel01 group by h_id having avg(cost)>=400000;

--Corelated query
select * from hotel01 where cost in(select max(cost) from hotel01 group by h_id);

--Display the details of those dept which have emp working for them
select * from dept01 as d where exists(select*from emp01  as e where d.dept_no=e.dept_no);
--views
create view hotel_avg(h_id,avg_cost) as select h_id,avg(cost) from hotel01 group by h_id;
select * from hotel_avg;

create view emp_info2(emp_id,dept_no) as select emp_id,dept_no from emp01;
select * from emp_info2;
--Equi join
select e.f_name,e.dept_no from emp01 as e ,dept01 as d where e.dept_no=d.dept_no;
--left outer join
select e.f_name,e.dept_no,dept_name from(emp01 as e left outer join dept01 as d on e.dept_no=d.dept_no);
--right outer join
select e.f_name,e.dept_no,dept_name from(emp01 as e right outer join dept01 as d on e.dept_no=d.dept_no);
--full outer join
select e.f_name,e.dept_no,dept_name from(emp01 as e full outer join dept01 as d on e.dept_no=d.dept_no);


--Trigger
create trigger costcheck01 on hotel01 for update 
as
begin
if((select cost from inserted) <450000)
begin
 print 'Successful updation'
        commit
        end
        else begin
          print 'cost should be less than 450000'
             rollback;   
          end
          end
update hotel01 set cost =470000 where h_id=10;
update hotel01 set cost =370000 where h_id=10;

---procedure
CREATE PROCEDURE EmpSelect75 @fname varchar(30)
AS
SELECT * FROM emp01 WHERE (f_name=@fname)
GO
EXEC EmpSelect75 @fname='Shazia';



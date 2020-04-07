create table SCHEDULE(
Schedule_Id varchar(3) Primary Key,
Travel_Date date,
Source varchar(20),
Destination varchar(20),
Duration number(11),
Bus_No number(11) References Buses(bus_no)
);

1 CREATE TABLE SCHEDULE
    2 (
    3     Schedule_id VARCHAR2(3),
    4     Travel_date date,
    5     Source VARCHAR2(20),
    6     Destination VARCHAR2(20),
    7     Bus_no number(11),
    8     Duration number(11),
    9     CONSTRAINT PK_SCHEDULE PRIMARY KEY(Schedule_id),
   10     CONSTRAINT FK_SCHEDULE_BUSES FOREIGN KEY(Bus_no) REFERENCES Buses (Bus_no)
   11 );


create table USERS(
User_Id number(11),
Name varchar(20),
Address varchar(100),
Phno number(11),
Emailid varchar(30),
CONSTRAINT PK_USERS PRIMARY KEY(User_id)
);



*********************************************************************************************************************
DDL

Q1 - "A country can be added without a region and can also be added with a region which is not there in the regions table" ADD FOREIGN KEY

alter table countries
modify region_id number NOT NULL;

alter table countries
add foreign key(region_id) references regions(region_id);


Q2 - RENAME
alter table payments
rename column BD_ID to BOOKING_ID;

Q3 - ADD
alter table buses
add Ac_Available varchar2(10); 

Q4 - CHANGE TYPE
alter table buses
modify Ac_Available varchar(5);

Q5 - REMOVE COLUMN
alter table buses
drop column Ac_Available;

Q6 - DROP TABLE
drop table branch cascade constraints;



*********************************************************************************************************************
DML
1- UPDATING A ROW
update schedule SET destination = 'Coimbatore'
where schedule_id = 'S4';

2- DELETING PARTICULAR ROWS
delete from payments where Discount_Id = 'D1';


*********************************************************************************************************************
SELECT STATEMENTS
3 - DESCENDING ORDER
select * 
from schedule
order by schedule_id DESC;

4 - REMOVE DUPLICATES
select distinct bus_no
from schedule 
order by bus_no DESC;

5 - SELECT NOT NULL
select first_name, phone_number
from employees
where manager_id is not null
order by first_name DESC;

6- LIKE OPERATOR
select student_name
from student
where student_name like 'A%a'
order by student_name;

7- NOT LIKE OPERATOR
select first_name, last_name, job_id
from employees
where job_id NOT LIKE '%CLERK'
order by first_name DESC;

*********************************************************************************************************************
SQL FUNCTIONS
1. Character FUNCTION
2. Number FUNCTION
3. Date FUNCTION
4. Conversion FUNCTION
5. Nesting FUNCTION
6. General FUNCTION
7. NULL FUNCTION

https://www.tutorialspoint.com/sql_certificate/using_single_row_functions.htm

1. CHANGE NULL VALUE TO SOMETHING
select location_id, postal_code, city, 
NVL(state_province,'NA') as STATE_PROVINCE
from locations
order by location_id;

2. CONCAT
select CONCAT(first_name, last_name) as EMPLOYEE_NAME
from employees
order by EMPLOYEE_NAME;

3. CASE FUNCTION
select employee_id, first_name, last_name,
case  
    when commission_pct <= 0.15
    then 0.2*salary
    when commission_pct > 0.15
    then 0.25*salary
    else 0
end "INCENTIVE_AMT"
from employees
order by employee_id;

->
select employee_id, salary,
case
    when salary is NOT NULL
    then ROUND(1.2*salary,2)
    else NULL
end "NEW SALARY"
from employees
order by employee_id;

4. NESTED FUNCTION
select CONCAT(CONCAT(address,', '),city) as Address
from student
order by Address DESC;

-> CONCAT, SUBSTR
select name, CONCAT(SUBSTR(name,1,3),SUBSTR(phno,1,3)) as password
from users order by name;

-> SUBSTRING
select CONCAT(staff_id,SUBSTR(staff_name,1,3)) as official_mail
from staff
order by official_mail;

6. LENGTH OF A DATA
select student_name from student
where length(student_name) = 6
order by student_name;

7. DATE FORMATTING | CONVERT DATE
select schedule_id, TO_CHAR(travel_date,'YYYY-MM-DD') as FormattedDate
from schedule
order by schedule_id;

->EXTRACT PART OF A DATE
select employee_id, start_date
from job_history
where TO_CHAR(start_date,'MM') = 1;

********************************************************************************************************************* 
GROUP BY - AGGREGATE FUNCTIONS
1. GROUP FUNCTIONS
2. MAX, MIN, SUM, AVG
3. GROUP BY CLAUSE
4. HAVING CLAUSE
5. NESTING GROUP FUNCTIONS


1. GROUP BY
->Write a query to get the maximum salary earned by the employees whose job id is ‘IT_PROG’. Give alias name as MAX_SALARY.
select max(salary) as MAX_SALARY
from employees
where JOB_ID = 'IT_PROG';

->Write a query to display the number of departments which don’t have manager. Give alias name as NUMBER_OF_DEPARTMENTS
select count(department_id) as NUMBER_OF_DEPARTMENTS
from departments
where manager_id is NULL;

->Write a query to display department id, minimum salary and maximum salary of each department.
select department_id, min(salary) as MIN_SALARY, max(salary) as MAX_SALARY
from employees
group by department_id
order by department_id;

->COUNT CONSTRAINTS
select city, count(location_id) as LOCATION_COUNT
from locations
group by city
having count(location_id)>1
order by city;

->COUNTING
select count(student_id) as STUD_COUNT
from student;

->Find highest average marks obtained by a student in his subjects and round it off to 2 places.
select ROUND(max(avg(value)),2) as avg_mark
from mark
group by student_id;


*********************************************************************************************************************
JOINS
1. Joins 
2. Cartesian Product
3. Types of Join
4. Equi Join
5. Non Equi Join
6. Self Join
7. Outer Join
8. Natural Join


->JOIN, CONSTRAINT
select student.student_name, department.department_name
from student, department
where student.department_id = department.department_id
and student.city = 'Coimbatore'
order by student.student_name;

->
select acnumber, bname, bcity
from account a, branch b
where a.bid = b.bid;

->JOIN 4 tables
select c.fname, a.acnumber, t.dot
from customer c, account a, trandetails t, branch b
where c.custid=a.custid and a.acnumber=t.acnumber
and a.bid=b.bid
and b.bcity = 'Chennai'
order by c.fname, a.acnumber, t.dot;

->GROUP, JOIN, ORDER
select s.student_name, max(m.value) as max_mark
from student s, mark m
where m.student_id = s.student_id
group by s.student_name
order by s.student_name;


1.->Write a query to display list of bus number and names where source and destination of a bus is the destination and source of another bus. 
Display unique records in ascending order by bus_no.
select distinct b.bus_no, b.bus_name
from buses b 
JOIN
( select s1.bus_no from schedule s1
JOIN schedule s2 on s1.source = s2.destination
and s1.destination = s2.source) s
on b.bus_no = s.bus_no
order by 1;

2.->Write a query to display list of staff name, subject name handled, maximum mark scored in that subject.
select distinct staff_name,
subject_name, 
value as max_mark
from subject s
JOIN staff using(staff_id)
JOIN mark using(subject_id)
where (subject_id, value)
IN
    (
    select subject_id, max(value)
    from mark
    group by subject_id
    )
order by 3 DESC;

3.->JOIN 4 tables and perform column arithemetic
select user_id as User_Id,
name as user_name,
ticket_id as Ticket_Id,
(fare * no_seats) as Total_amount,
(fare * no_seats - discount_amount) as Paid_amount
from users
JOIN tickets using(user_id)
JOIN payments using(ticket_id)
JOIN discounts using(discount_id)
order by User_Id DESC;

4.->LEFT JOINS, COUNT, GROUP
select department_name,
count(staff_id) as staff_count
from department
left JOIN staff using(department_id)
group by department_name
order by department_name;

5.->Write a query to display the name of the departments that has the least student count
select department_name
from department
where department_id in
(
    select department_id
    from student
    having count(department_id) in
    (
        select min(count(department_id))
        from student
        group by department_id
    )
    group by department_id
)
order by department_name;

*********************************************************************************************************************
SUB QUERY
1. Single Row
2. Multi Row
3. Correlated

->Write a query to display the block number in which the maximum number of departments is located.
select department_block_number
from department
where 
department_id = (
    select max(count(department_id))
    from department
    group by department_id
    );

->
select staff_name
from staff
where staff_id NOT IN (select staff_id from subject)
order by 1;

->Write a query to display the names of the staff handling more than 1 subject
select staff_name
from staff
where 
staff_id = any(
            select staff_id from 
                (select staff_id,count(subject_id) as cc
                from subject
                group by staff_id)
            where cc> 1)
order by 1;

->
display the names of the staff who are handling atleast 1 subject
select staff_name
from staff
where staff_id = any(select staff_id from 
    (
    select count(subject_id) as sc, staff_id
    from subject
    group by staff_id
    )
    where sc >= 1)
order by 1;

->display user id and user name where number of seats booked by the user in individual booking is greater than 1. 
select distinct user_id, name
from users
join tickets using(user_id)
where no_seats IN (select no_seats from tickets
where no_seats >1)
order by 2;

->Display user name and their city who have booked their tickets using other than HDFC bank. 
select distinct name, address
from users
NATURAL JOIN tickets
where user_id
IN (select user_id
    from bookingdetails)
and user_id NOT IN
    (
    select user_id
    from bookingdetails
    where name = 'HDFC'
    )
order by 1;


->Find the name of the student(s) who has scored maximum mark in Software Engineering. 
select DISTINCT student_name from student
join mark using(student_id)
where value IN (
    select max(value)
    from mark
    where subject_id in (
        select subject_id
        from subject
        where subject_name = 'Software Engineering'
        )
    )
order by 1;

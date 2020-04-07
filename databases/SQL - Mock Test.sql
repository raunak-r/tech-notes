create table writer(
   pubname varchar(10),
   city varchar(10),
   category char(1)
   );

insert into writer values('PHI','Delhi','B');
insert into writer values('TATA','Mumbai','A');
insert into writer values('PEARSON','Delhi','C');
insert into writer values('CROWN','Hyderabad','C');

select * from writer;
PUBNAME    CITY       C
---------- ---------- -
PHI 		Delhi      B
TATA 		Mumbai     A
PEARSON    Delhi      C
CROWN	   Hyderabad  C


*****************************
create table book
(
  bid int,
  btitle varchar(20) unique,
  publisher varchar(10),
  price int,
  no_pages int,
  primary key(bid),
  Foreign key(publisher) references writer(pubname)
);

insert into book values(1101,'Operating System','PHI',990,685);
insert into book values(1108,'Database','TATA',670,500);
insert into book values(1202,'Networks','TATA',480,360);
insert into book values(1211,'Architecture','PHI',350,392);
insert into book values(1240,'DataMining','PEARSON',850,600);
insert into book values(1288,'Physics','PHI',800,250);
insert into book values(1291,'Cryptography','TATA',760,400);
insert into book values(1310,'WebDesign','PEARSON',400,218);
insert into book values(1314,'NanoTechnology','TATA',300,260);

select * from book;
 BID 		BTITLE		PUBLISHER		  PRICE   NO_PAGES
---------- -------------------- -------------------- ---------- ----------
      1101 Operating System	PHI			    990        685
      1108 Database			TATA			670        500
      1202 Networks			TATA			480        360
      1211 Architecture 	PHI			    350        392
      1240 DataMining		PEARSON 		850        600
      1288 Physics			PHI			    800        250
      1291 Cryptography 	TATA			760        400
      1310 WebDesign		PEARSON 		400        218
      1314 NanoTechnology	TATA			300        260


*****************************
create table author
(
aid int,
aname varchar(10),
city varchar(10),
primary key(aid)
);

insert into author values(10,'Thomas','Delhi');
insert into author values(12,'Mishra','Kolkata');
insert into author values(14,'Mahesh','Delhi');
insert into author values(17,'Lalitha','Mumbai');
insert into author values(18,'Saxena','Nagpur');
insert into author values(20,'Chawla','Nagpur');

select * from author;
       AID ANAME      CITY
---------- ---------- ----------
	10 Thomas     Delhi
	12 Mishra     Kolkata
	14 Mahesh     Delhi
	17 Lalitha    Mumbai
	18 Saxena     Nagpur
	20 Chawla     Nagpur


*****************************
create table book_author
  (
    bookID int,
    authorID int,
    primary key(bookID,authorID),
    Foreign key(bookID) references book(bid),
    Foreign key(authorID) references author(aid)
  );

insert into book_author values(1101,10);
insert into book_author values(1101,14);
insert into book_author values(1108,17);
insert into book_author values(1202,12);
insert into book_author values(1202,17);
insert into book_author values(1211,18);
insert into book_author values(1211,14);
insert into book_author values(1288,18);
insert into book_author values(1310,10);
insert into book_author values(1310,14);
insert into book_author values(1310,18);
insert into book_author values(1310,20);

select * from book_author;
    BOOKID   AUTHORID
---------- ----------
      1101	   10
      1101	   14
      1108	   17
      1202	   12
      1202	   17
      1211	   18
      1211	   14
      1288	   18
      1310	   10
      1310	   14
      1310	   18
      1310	   20

*****************************

<<<<<<<QUERIES>>>>>>>
1. Get book id and title for those which are not authored by any author.


2. Get the publisher name who hasnt published any book.
(select pubname from publisher)
MINUS
(select publisher from book,publisher where publisher=pubname);
PUBNAME
--------------------
CROWN
***********2. DONE******

3. GET BOOKID, NAME AND PRICE WHOS PRICE IS GREATER THAN AVERGAE PRICE.
>select bid,btitle,price
from book
where price>(select avg(price)from book);
       BID BTITLE		     PRICE
---------- -------------------- ----------
      1101 Operating System	       990
      1108 Database		       670
      1240 DataMining		       850
      1288 Physics		       800
      1291 Cryptography 	       760
***********3. DONE******

4. GET BOOKID, TITLE FOR THOSE BOOKS AUTHORED BY ALL AUTHORS FROM DELHI.
select distinct(bid),btitle
from book,book_author,author
where bid=bookID and authorID=aid and city='Delhi';
       BID BTITLE
---------- --------------------
      1310 WebDesign
      1211 Architecture
      1101 Operating System
***********4. DONE******

5. FOR EACH PUBLISHER, GIVE PUBLISHER NAME,CITY AND NO. OF BOOKS PUBLISHED.
>select publisher,city,count(publisher)
from book,publisher
where publisher=pubname
group by publisher,city;
PUBLISHER	     CITY	COUNT(PUBLISHER)
-------------------- ---------- ----------------
PHI		     Delhi		       3
TATA		     Mumbai		       4
PEARSON 	     Delhi		       2
***********5. DONE******

6. GET BOOKID, BOOKTITLE FOR THOSE PUBLISHED BY 'A' CATEGORY PUBLISHERS.
select bid,btitle
from book,publisher
where publisher=pubname and category='A';
       BID BTITLE
---------- --------------------
      1108 Database
      1202 Networks
      1291 Cryptography
      1314 NanoTechnology
***********6. DONE******

7. GET AUTHORID, NAME FOR THOSE WHO HAVE AUTHORED AT LEAST ONE BOOK
 FOR 'B' CATEGORY PUBLISHERS.
select distinct(aid),aname
from author,book_author,book,publisher
where authorID=aid and bookID=bid and publisher=pubname
and category='B';
       AID ANAME
---------- ----------
	14 Mahesh
	18 Saxena
	10 Thomas
***********7. DONE******

8. GET BOOKID, TITLE WHICH ARE AUTHORED BY ATLEAST ONE AUTHOR WHO BELONGS
 TO THE SAME CITY AS THAT OF THE PUBLISHER.
select distinct(bid),btitle
from book,book_author,author,writer
where bookID=bid and authorID=aid and publisher=pubname
and author.city=writer.city;

1101|OperatingSystem                                             
1108|Database
1202|Networks
1211|Architecture
1310|WebDesign

***********8. DONE******

9. GET BOOKID,TITLE FOR THOSE BOOKS AUTHORED BY ALL AUTHORS FROM NAGPUR.
select distinct(bid),btitle
from book,book_author,author

1211|Architecture                                                           
1288|Physics                                                                
1310|WebDesign 
***********9. DONE******

10. FOR EACH AUTHOR GIVE AUTHORID,NAME AND NO. OF BOOKS AUTHORED BY THEM WITH PRICE>300.
select aid,aname,count(bid)
from author,book_author,book
where authorID=aid and bookID=bid and price>300
group by aid;

10|Thomas|2
12|Mishra|1
14|Mahesh|3
17|Lalitha|2
18|Saxena|3
20|Chawla|1

***********10. DONE******

*****************PL/SQL QUERIES************************
1. WRITE A FUNCTION THAT TAKES BOOKID AS INPUT PARAMETER AND PRINTS THE PRICE.
2. DO THE ABOVE QUESTION BY INVOKING THE FUNCTION WITH AN ANONYMOUS CODE BLOCK.
3. WRITE A TRIGGER TO UPDATE BOOK TABLES AFTER WE UPDATE THE PRICE.

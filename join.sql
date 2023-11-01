CREATE DATABASE join_test;

use join_test;

CREATE TABLE people (

	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(64),
	age INT

);

CREATE TABLE card_company(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(64),
	amount_of_payment INT,
	payment_location VARCHAR(64),
	paymentdate DATETIME,
	people_id INT 
);

INSERT INTO people VALUES(1,'김사원',24);

INSERT INTO people (NAME,age) VALUES('구대리',28);

INSERT INTO people (NAME,age) VALUES('허차장',42);

INSERT INTO people (NAME,age) VALUES('차부장',45);

INSERT INTO people (NAME,age) VALUES('홍임원',54);

INSERT INTO people VALUES(6,'김고원',24);
INSERT INTO people VALUES(8,'김고은',24);
SELECT * FROM people;
delete from people where id = 6 or id = 8;

SELECT * FROM card_company;
insert into card_company VALUES(1,'NH',30000,'배달서비스','2019-11-09 23:02',1);

insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('shinhan',7700,'편의점','2019-11-09 10:10',1);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('KB',4500,'편의점','2019-11-09 15:21',1);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('KB',8550,'당구장','2019-11-09 19:35',1);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('shinhan',330000,'명품신발','2019-11-09 05:00',2);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('shinhan',4500000,'명품옷','2019-11-09 07:00',2);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('NH',400000,'돈 인출','2019-11-09 11:00',3);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('NH',1300000,'사성냉장고','2019-11-09 15:00',3);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('NH',10000000,'골프','2019-11-09 17:00',4);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('NH',15000000,'유흥','2019-11-09 03:00',4);
insert into card_company (name,amount_of_payment,payment_location,paymentdate,people_id) VALUES('NH',500,'문방구','2019-11-09 04:00',6);



#inner join
SELECT * 
FROM people 
	JOIN card_company 
	ON people.id = card_company.people_id;

#LEFT OUTER join
SELECT * 
FROM people 
	LEFT OUTER JOIN card_company 
    ON people.id = card_company.people_id;    
 
#RIGHT OUTER JOIN
SELECT * 
FROM people 
	RIGHT OUTER JOIN card_company 
    ON people.id = card_company.people_id;

#CROSS JOIN
SELECT * 
FROM people 
	CROSS JOIN card_company;
    
    
CREATE table ugaga_tribes (
id INT AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(64),
classes_id INT
);

insert into ugaga_tribes VALUES(1,'족장_우가콜라',null);

insert into ugaga_tribes (name,classes_id) VALUES('부족장_우가펩시',1);
insert into ugaga_tribes (name,classes_id) VALUES('부하1_우가팔일오',2);
insert into ugaga_tribes (name,classes_id) VALUES('부하2_우가우간다',3);
insert into ugaga_tribes (name,classes_id) VALUES('부하3_우가막내',4);

select * from ugaga_tribes;

#Self join-Inner join
SELECT a.id, a.name AS 부하, b.name AS 상관
FROM ugaga_tribes a 
	JOIN ugaga_tribes b 
	ON a.classes_id = b.id;
    
#Self join-Left join
SELECT a.id, a.name, b.name 
FROM ugaga_tribes a 
	LEFT JOIN ugaga_tribes b 
	ON a.classes_id = b.id;   
    
#조건달기1  ut_b에 id가 2초과인 데이터만 출력하기  
SELECT a.id, a.name, b.name 
FROM ugaga_tribes a 
	LEFT JOIN ugaga_tribes b 
	ON a.classes_id = b.id and b.id > 2;

#조건달기2  ut_b에 name이 '부족'이 포함된 데이터만 출력하기
SELECT ut_a.id,ut_a.name,ut_b.name 
FROM ugaga_tribes ut_a 
	LEFT JOIN ugaga_tribes ut_b 
	ON ut_a.classes_id = ut_b.id AND ut_b.name LIKE '%부족%';
		
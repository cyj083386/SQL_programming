create database function_test;

-- [SQL] 서브쿼리로 휴일을 제외한 근무일수 계산하기 : https://pbj0812.tistory.com/464
CREATE TABLE function_test.procedure_test
(
	id int,
    date1 datetime,
    date2 datetime
);

 CREATE TABLE function_test.holiday
(
	holiday datetime
);

INSERT INTO procedure_test(id, date1, date2) VALUES(1, '2021-01-01 11:11:11', '2021-01-20 11:11:11');
INSERT INTO procedure_test(id, date1, date2) VALUES(2, '2021-01-10 11:11:11', '2021-01-20 11:11:11');

INSERT INTO holiday(holiday) VALUES('2021-01-02');
INSERT INTO holiday(holiday) VALUES('2021-01-08');
INSERT INTO holiday(holiday) VALUES('2021-01-12');
INSERT INTO holiday(holiday) VALUES('2021-01-15');
INSERT INTO holiday(holiday) VALUES('2021-01-18');

SELECT * from procedure_test;
SELECT * from holiday;


SELECT 
	id, 
    DATEDIFF(date2, date1) AS CNT1, 
	(SELECT COUNT(holiday) FROM holiday WHERE holiday >= date1 AND holiday < date2) AS CNT2
FROM procedure_test;


WITH A AS (
	SELECT 
		id, 
		DATEDIFF(date2, date1) AS CNT1, 
		(SELECT COUNT(holiday) FROM holiday WHERE holiday >= date1 AND holiday < date2) AS CNT2
	FROM procedure_test
) 

SELECT
	id,
    CNT1 - CNT2 AS result
FROM A;
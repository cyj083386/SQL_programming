use hr; -- 스키마 지정

select * from employees; 

-- employees 테이블에서 employee_id, first_name, last_name만 출력
select employee_id, first_name, last_name from employees;

-- employee_id 기준 내림차순 출력
select employee_id, first_name, last_name 
from employees 
order by employee_id desc;

-- job의 종류를 알고자하면?
-- 1. 그룹화 <- 해당방법은 시간이 오래걸린다.
/*
select job_id
from employees
group by job_id; 
*/
-- 2. 중복제거 <- 효율적
select distinct job_id
from employees; 

-- 필드명을 바꾸어 출력. alias의 줄임말인 as로 쓴다.
select employee_id as 사원번호, first_name as 이름, last_name as 성 
from employees;

-- 실제로는 생략해서 많이 쓴다.
select employee_id 사원번호, first_name 이름, last_name 성 
from employees;

-- 필드 합쳐서 표시. 표준 함수 concat() 사용--
/*
오라클에서는? 
select employee_id 사원번호, first_name||last_name 이름
from employees;
*/ 
select employee_id 사원번호, concat(first_name, " " ,last_name ) 이름
from employees;

-- 사원번호, 전체이름, 그리고 각사원의 email(이름@comapany.com) 
select employee_id 사원번호, 
		concat(first_name, " ", last_name ) 이름, 
		concat(email, "@company.com") 이메일
from employees;

-- employees 테이블에서 employee_id, salary, salary에 500을 더한값, 100을 뺀값, 10% 추가해서 2로 나눈값 출력
-- 산술연산자 사용
select employee_id 사원번호, 
		salary 급여, 
        salary+500 추가급여, 
        salary-100 인하급여, 
        salary*1.1/2 조정급여
from employees;
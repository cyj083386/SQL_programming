
-- employees 테이블에서 salary의 합계와 평균을 구함(또한 avg 함수를 사용하지 말고 salary의 평균을 구함)
select sum(SALARY) 합계,
		avg(SALARY) 평균,
        sum(SALARY) /count(SALARY)
from employees;

--  employees 테이블에서 salary의 최대, 최소값, FIRST_NAME의 최대, 최소값 (Z최대 A가 최소)
select max(SALARY) 최대,
		min(SALARY) 최소,
        max(FIRST_NAME) 최대이름,
        min(FIRST_NAME) 최소이름
from employees;

-- employees 테이블에서 employee_id가 10 이상인 직원에 대해 job_id별로 그룹화하여 job_id별 총 급여와 job_id별 평균급여를 구하고 job_id별로 내림차순 정렬
select job_id,
	sum(salary) 직무별_총급여,
    avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id
order by JOB_ID desc;

-- 직무별_총급여 alias로 정렬
select job_id,
	sum(salary) 직무별_총급여,
    avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id
order by 직무별_총급여 desc;

--  employees 테이블에서 employee_id가 10 이상인 직원에 대해 job_id별로 그룹화하여 job_id별 총 급여와 job_id별 평균급여를 구하되, 총 급여가 30000보다 큰값만 출력. job_id별로 총급여 기준으로 내림차순 정렬

select job_id,
	sum(salary) 직무별_총급여,
    avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id
having  직무별_총급여 > 30000
order by 직무별_총급여 desc;

-- employees와 department 테이블 DEPARTMENT_ID기준으로 조인
select *
from employees A, departments B
where A.DEPARTMENT_ID = B.department_id;

-- employees 테이블과 department 테이블과 location 테이블을 조인하여 각 직원이 어느부서에 속하는지, 부

select A.EMPLOYEE_ID, A.DEPARTMENT_ID, B.department_id, C.location_id, C.city
from employees A, departments B, locations C
where A.DEPARTMENT_ID = B.department_id
	and B.location_id = C.location_id;

-- employees와 departments 테이블 outer join
-- oracle은 (+) 로 outer join 가능
select count(*) 조건된_건수
from employees A, departments B
where A.DEPARTMENT_ID = B.department_id;

-- employees와 테이블을 자체 조인하여 직원별 담당매니저가 누구인지 조회
select A.EMPLOYEE_ID, A.FIRST_NAME, A.LAST_NAME, A.MANAGER_ID,
		concat(A.FIRST_NAME, ' ', B.LAST_NAME) manager_name
from employees A, employees B
where A.MANAGER_ID = B.EMPLOYEE_ID
order by A.EMPLOYEE_ID;

--  employees와 테이블 department_id집합과  employees와 테이블 department_id집합을 UNION 문법을 이용하여 합쳐서 표시.(중복되는 행은 한번만 출력)
select department_id
from employees
union
select department_id
from departments;

-- UNION all 문법을 이용하여 표시(중복도 그대로 표시)
select department_id
from employees
union all
select department_id
from departments;

-- employees와 테이블 department_id집합과  employees와 테이블 department_id집합의 교집합을 INTERSET 문법을 이용하여 표시
-- mysql, maridb는 INTERSET문이 존재하지 않으므로 INNER JOIN으로 해결
SELECT t1.department_id, t1.department_id
FROM employees t1 INNER JOIN departments t2 
	ON t1.department_id = t2.department_id AND t1.department_id = t2.department_id
    
-- employees와 테이블 department_id집합과  employees와 테이블 department_id집합의 차집합을 MINUS 문법을 이용하여 표시
-- mysql, maridb는 MINUS 존재하지 않으므로 JOIN으로 해결

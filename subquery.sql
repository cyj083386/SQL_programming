-- employees 테이블의 last_name이 'De Haan'인 직원과 salary가 동일한 직원에는 누가 있는지 단일행 서브쿼리를 이용해 출력해보세요.

select *
from employees A 
where A.SALARY = ( 
	select SALARY
    from employees
    where LAST_NAME = 'De Haan'
); -- A.SALARY = 17000 조건과 같다

select SALARY
from employees
where LAST_NAME = 'De Haan';

-- employees 테이블에서 department_id별로 가장 낮은 salary가 얼마인지 찾고, 그 salary에 해당하는 직원이 누구인지 다중행 서브쿼리이용해 찾기
-- In을 사용했으므로 여러 행이 결과로 나오면 조건으로 사용할 수 있다. 이게 다중행
select *
from employees A 
where A.SALARY in ( 
	select min(SALARY)
    from employees
	group by DEPARTMENT_ID
)
order by A.SALARY;

select min(SALARY)
from employees
group by DEPARTMENT_ID;

-- employees 테이블에서 JOB_ID 별로 가장 낮은 SALARY가 얼마인지 찾아보고 
-- 찾아낸 job_id 별 salary 에 해당하는 직원이 누구인지 다중열 서브쿼리를 사용해서 찾을것
-- 서브쿼리 결과 값이 열이 2개이다. 이게 다중열. 비교시에는 마찬가지로 2개 인자를 소괄호 안에 콤마로 구분하여 나열
select *
from employees A 
where (A.JOB_ID, A.SALARY) in ( 
	select JOB_ID, min(SALARY) 그룹별_급여
    from employees
	group by JOB_ID
)
order by A.SALARY desc;

select JOB_ID, min(SALARY) 그룹별_급여
from employees
group by JOB_ID;

-- 직원 중에서 DEPARTMENT_name이 IT인 직원을 뷰를 이용해 출력
select *
from employees A, (
	select DEPARTMENT_ID 
	from departments
    where department_name = 'IT') B
where A.DEPARTMENT_ID = B.DEPARTMENT_ID
order by A.SALARY desc;

select DEPARTMENT_ID 
from departments
where department_name = 'IT'


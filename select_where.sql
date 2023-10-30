/* select from where */

-- employees 테이블 employee_id가 100인 사원정보를 출력
select * 
from employees
where employee_id = 100; 

-- employees 테이블에서 first_name 이 David인 직원 정보를 출력. 
select * 
from employees
where first_name = 'David'; -- 작은 따옴표 쓰기. 큰따옴표도 가능하나 작은따옴표가 암묵적으로 사용됨.

-- employees 테이블에서 employee_id 가 105 이상인 직원 정보를 출력. 
select * 
from employees
where employee_id >= 105; -- 이상, 초과, 미만등을 주의해서 비교연산자 사용

-- employees 테이블에서 salary가 10000 이상이고 17000 이하인 직원 정보 출력
select * 
from employees
where salary between 10000 AND 17000; -- mybatis에서는 요 부분만 동적쿼리로 바꿔줌

-- employees 테이블에서 salary가 10000, 17000, 24000 인 직원 정보 출력
select * 
from employees
where salary in(10000, 17000, 24000); -- 10,000으로 표기하면 문자로 취급

-- employees 테이블에서 salary가 job_id의 값이 AD로 시작하는 모든 데이터를 조회
-- 여러글자를 대신 %, 한글자를 대신 _ , mybatis에서는 #
-- escape는 설정. like %9#% escape '#' -> 9%로 끝나는 퍼센트 검색
-- 데이터는 대소문자를 구분한다. 
select * 
from employees
where job_id like 'AD%';

-- employees 테이블에서 salary가 job_id의 값이 AD로 시작하면서 뒤에 따라오는 문자열이 3자리인 모든 데이터를 조회
select * 
from employees
where job_id like 'AD___';

-- employees 테이블에서 manager_id가 0값인 직원 정보
-- null, ''과는 다르다. is null로 검색해보기t_address
select * 
from employees
where manager_id = 0;

-- employees 테이블에서 salary가  4000 을 초과하면서 job_id가 IT_PROG 인 값을 조회
-- employees 테이블에서 salary가  4000 을 초과하면서 job_id가 IT_PROG 이거나 ACCOUNT로 끝나는 값을 조회
select * 
from employees
where salary > 4000 AND job_id = 'IT_PROG';

select *
from employees
where salary > 8400 AND (job_id = 'IT_PROG' OR job_id = 'AC_ACCOUNT');

-- 같지 않다 <>
-- employees 테이블에서 employee_id 가 105가 아닌 직원을 조회
select * 
from employees
where employee_id = 105; -- employee_id가 105인 직원 존재 확인

select * 
from employees
where employee_id <> 105;


use hr;


-- last_name을 소문자와 대문자로 각각 출력하고, email의 첫번째 문자는 대문자로 출력

select last_name,
		lower(last_name) lower적용,
		upper(last_name) lower적용,
		email,
--      initcap(email) > mariadb에서는 다른 함수 조합하여 사용
		CONCAT(
			UPPER(SUBSTRING(last_name, 1, 1)),
			LOWER(SUBSTRING(last_name, 2)) ) AS 첫글자_대문자
from employees;


SELECT
    CONCAT(
        SUBSTRING(first_name, 1, 1),
        LOWER(SUBSTRING(first_name, 2))
    ) AS 첫글자_대문자
FROM employees;




-- emplyees 테이블에서 job_id 데이터 값의 첫째 자리부터 시작해서 두개의 문자를 출력
select job_id,
		substr(job_id, 1, 2)
from employees;

-- emplyees 테이블에서 job_id 문자열이 ACCOUNT면 ACCNT로 출력
select job_id,
		replace(job_id, 'ACCOUNT', 'ACCNT')
from employees;

-- employees 테이블에서 first_name에 대해 12자리의 문자열 자리를 만들되 first_name의 데이터값이 12자리보다 작으면 왼쪽부터 *를 채워서 출력
select  first_name,
		lpad(first_name, 12, '*') -- SELECT LPAD(str, len, padstr); str 에 len길이 만큼 padstr 로 왼쪽부터 채운 str를 반환, 단, str 이 len 보다 길면 len길이만큼 str 를 반환합니다. RPAD는 오른쪽부터 채움
from employees;

-- employees 테이블에서 job_id의 데이터 값에 대해 왼쪽 방향으로 'F' 문자를 만나면 삭제하고 오른쪽 방향으로 'T' 문자를 만나면 삭제 
select job_id,
		TRIM(LEADING 'F' FROM job_id),
        TRIM(TRAILING 'T' FROM job_id)
from employees;

--  employees 테이블에서 salary를 30일로 나눈 후 나눈값의 소수점 첫째자리, 소수점 둘째자리, 정수 첫째자리에서 반올림한 값을 출력
--  round() 반올림, trunc 버림
select salary,
		salary/30 일급,
        round(salary/30, 0),
        round(salary/30, -1),
		round(salary/30, -2)
from employees;

-- employees 테이블에서  first_name, last_name, department_id, salary를 출력하되 department_id 가 60인 경우에는 급여를 10% 인상한 값을 계산하여 출력하고 나머지 경우에는 원래의 값을 출력. 
-- 그리고 department_id 가 60인 경우에는 '10%인상' 나머지는 '미인상'출력 salary*1.1, salary
-- 1) 필드 출력  2) 조건 3) 출력
-- oracle/ mysql 제어문 비교: https://cafe.naver.com/hamminglab/21533
select first_name,
		last_name,
        department_id, 
        salary,
        -- oracle 사용시,
        -- decode(department_id = 60, salary*1.1, salary) 조정된급여,
        -- decode(department_id = 60, '10%인상', '미인상') 인상여부
		if(department_id = 60, salary*1.1, salary) 조정된급여,
        if(department_id = 60, '10%인상', '미인상') 인상여부
from employees;

-- employees 테이블에서 job_id가 IT_PROG라면 employee_id, first_name, last_name, slary를 출력하되 
-- salary가 90 이상이면 '상위급여' 6000과 8999 사이이면 '중위급여', 그 외는 '하위급여'라고 출력
select employee_id, first_name, last_name, salary,
	case
		when salary >= 9000 then '상위급여'
        when salary between 6000 and 8999 then '중위급여'
        else '하위급여'
	end as 급여등급
from employees;

-- RANK, DENSE_RANK, ROW_NUMBER 함수를 각각 이용해 employees 테이블의 salary값이 높은 순서대로 순위를 매겨출력
select employee_id, salary,
	 RANK() OVER (ORDER BY salary desc) rank_급여, -- 공동 순위만큼 건너뜀 (ex: 1,2,2,4 ...)
	 DENSE_RANK() OVER (ORDER BY salary desc) DENSE_rank_급여, -- 공동 순위를 뛰어넘지 않음 (ex: 1,2,2,3 ...)
	 ROW_NUMBER() OVER (ORDER BY salary desc) ROW_NUMBER_급여 -- 공동 순위를 무시함 (ex: 1,2,3,4 ...)
from employees;

-- employees 테이블에서 salary 행의 개수를 구하시오.
select count(salary) salary_행수 -- 컬럼명을 지정하는 경우 NULL 값은 제외하고 COUNT 빈문자열은 포함, *로 지정하는 경우 NULL포함.
from employees;


select * from employees
where SALARY is null;

-- https://cafe.naver.com/hamminglab/21534



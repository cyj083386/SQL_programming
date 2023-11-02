-- https://pbj0812.tistory.com/465

-- 관리자 에서 하지 않으면? Error Code: 1418. This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)
-- 위와 같은 에러 발생 시 쿼리 실행 SHOW GLOBAL variables like 'log_bin_trust_function_creators';
-- 이때 OFF 로 되어 있다면 아래의 쿼리를 실행하여 ON 으로 변경 SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$ 
DROP FUNCTION IF EXISTS FUNCTION_TEST$$ 
CREATE FUNCTION FUNCTION_TEST() 
	RETURNS VARCHAR(20) 
BEGIN 
	DECLARE Result VARCHAR(10); 
	SET Result = 'OK'; 
	RETURN Result; 
END $$ 
DELIMITER ;

-- 매개변수가 없는 함수
SELECT FUNCTION_TEST();

-- 매개변수가 있는 함수
DELIMITER $$
DROP FUNCTION IF EXISTS HOLIDAY_COUNT$$ 
CREATE FUNCTION HOLIDAY_COUNT(StartDate datetime, FinishDate datetime) 
	RETURNS VARCHAR(20) 
BEGIN 
	DECLARE Result VARCHAR(10);
    SET Result = 0; -- 변수선언
    SELECT COUNT(*) INTO Result
    FROM holiday
    WHERE
		holiday >= StartDate
        AND holiday < FinishDate;
	RETURN Result; 
END $$ 
DELIMITER ;

SELECT  HOLIDAY_COUNT('2021-01-01', '2021-01-10');

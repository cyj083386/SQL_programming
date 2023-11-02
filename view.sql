
select *
from members;

-- 데이터를 조회하는 쿼리문
select memid, memname, addr, birthday
from members;

-- 위와 동일한 조회문으로 뷰 생성
create view bir_mem as
select memid, memname, addr, birthday
from members;

-- 데이터를 조회하는 쿼리문을 단순화. 뷰를사용
select * from bir_mem;

-- 마일리지가 1000 이상인 사람 데이터를 조회하는 쿼리문
select memid, memname, addr, birthday, mileage
from members
WHERE mileage >= 1000;

-- 위와 동일한 조회문으로 뷰 생성
create view vip_mem as
select memid, memname, addr, birthday, mileage
from members
WHERE mileage >= 1000;

-- 데이터를 조회하는 쿼리문을 단순화. 뷰를사용
select * from vip_mem;


-- 가상뷰 삭제
drop view vip_mem;
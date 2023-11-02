use index_test;
-- 인덱스 동작하지 않는 검색쿼리 
select * from members; 

-- 테이블 내 인덱스 파일 확인
show index from members;

-- 인덱스 동작하는 검색쿼리. memid 필드에 인덱스 파일이 있음
select * 
from members
where memid = 'kim1'; 

-- 인덱스 동작하지 않는 검색쿼리. memname 필드에 인덱스 파일이 없음
select * 
from members
where memname = '서갑돌'; 

create unique index idx_memname on members(memname);

create index idx_memname on members(memname);

drop index idx_memname on members;










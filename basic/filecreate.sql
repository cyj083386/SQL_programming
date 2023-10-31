select memid, memname from members
	order by memname limit 3 offset 2;
 -- 연산열 출력   
select memid, memname, mileage, mileage+10 연산열 
from members;
    
-- 검색결과를 파일로 출력 
select * from members;

select * 
	into outfile 'E:\\tmp\\member.dat'
    fields terminated by ', ' enclosed by '"'
from members;

select * 
	into outfile 'E:\\tmp\\member.csv'
    fields terminated by ', ' enclosed by '"'
from members;

select * from order_h;


use mysql;  -- mysql database 선택

select host, user, password from user;


create user 'myone'@'%' identified by '123';
create user 'mytwo'@'%' identified by '321';

create database book_db3;


GRANT ALL privileges ON book_db1.* TO myone;

GRANT ALL privileges ON book_db3.* TO mytwo;


revoke all on book_db3.* from mytwo; 
SHOW GRANTS FOR mytwo@'%';
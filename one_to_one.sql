create database rela_test;

use rela_test;

drop table users;
  /*Error Code: 1005. Can't create table `rela_test`.`addresses` (errno: 150 "Foreign key constraint is incorrectly formed")
	테이블간의 관계설정시 속성이 불일치하면 에러(serial)*/
CREATE TABLE users (
  id serial,
  username VARCHAR(25) NOT NULL,
  enabled boolean DEFAULT TRUE,
  last_login timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id int NOT NULL,
  username VARCHAR(25) NOT NULL,
  enabled boolean DEFAULT TRUE,
  last_login timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);

/*
 one to one: User has one address
*/
drop table addresses;
CREATE TABLE addresses (
  user_id int NOT NULL,
  street VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
  /*Error Code: 1005. Can't create table `rela_test`.`addresses` (errno: 150 "Foreign key constraint is incorrectly formed")
	테이블간의 관계설정시 속성이 불일치하면 에러
*/
);
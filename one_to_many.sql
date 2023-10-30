DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id serial,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn int,
  PRIMARY KEY (id), -- 인덱스파일도 자동생성된다.
  UNIQUE (isbn) -- 중복을 불허하겠다.
);
CREATE TABLE books (
  id int NOT NULL,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn int,
  PRIMARY KEY (id), -- 인덱스파일도 자동생성된다.
  UNIQUE (isbn) -- 중복을 불허하겠다.
);

/*
 one to many: Book has many reviews
*/

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  id serial,
  book_id int NOT NULL,
  user_id int NOT NULL,
  review_content VARCHAR(255),
  rating int,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
  /* Error Code: 1005. Can't create table `rela_test`.`reviews` (errno: 150 "Foreign key constraint is incorrectly formed")
*/ 
);

CREATE TABLE reviews (
  id int NOT NULL,
  book_id int NOT NULL,
  user_id int NOT NULL,
  review_content VARCHAR(255),
  rating int,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
  /* Error Code: 1005. Can't create table `rela_test`.`reviews` (errno: 150 "Foreign key constraint is incorrectly formed")
*/ 
);

-- Error Code: 1005. Can't create table `rela_test`.`reviews` (errno: 150 "Foreign key constraint is incorrectly formed")
 
 
 -- 관계를 무시하고 테이블 강제삭제. fk만 갖고있는 최하단 테이블은 삭제 가능하나, 참조한 원본 테이블은 삭제 불가다. reviews는 그래서 강제삭제로만 삭제 가능하다.
 drop table reviews cascade;
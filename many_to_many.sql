DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int NOT NULL,
  username VARCHAR(25) NOT NULL,
  enabled boolean DEFAULT TRUE,
  last_login timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id int NOT NULL,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn int,
  PRIMARY KEY (id), -- 인덱스파일도 자동생성된다.
  UNIQUE (isbn) -- 중복을 불허하겠다.
);

/* 다대다: 위 테이블에서 주의해야할점은 primary key가 user_id, book_id 두 개의 컬럼으로 이루어진 복합키라는 점이다.
 따라서 두 개의 조합은 uniue해야 한다. */
DROP TABLE IF EXISTS users_books;
CREATE TABLE users_books (
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (user_id, book_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE
);
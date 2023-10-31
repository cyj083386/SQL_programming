
CREATE TABLE user_auth (
    id BIGINT(20) NOT NULL,
    auth VARCHAR(255),
    PRIMARY KEY (id)
);

drop table user cascade;

CREATE TABLE user (
    id BIGINT(20) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255),
    nick_name VARCHAR(30),
    phone_number BIGINT(11),
    user_name VARCHAR(15),
    user_address VARCHAR(255),
    enabled BIT(1),
    create_ip VARCHAR(255),
    user_auth BIGINT(20),
    user_image_path VARCHAR(255),
    date_created DATETIME,
    last_updated DATETIME,
    PRIMARY KEY (id),
    UNIQUE (password),
    UNIQUE (email),
    unique(nick_name),
    FOREIGN KEY (user_auth)
        REFERENCES user_auth (id)
        ON DELETE CASCADE
);

CREATE TABLE category (
  id BIGINT(20),
  category_name VARCHAR(255),
  PRIMARY KEY (id)
  );
  
  CREATE TABLE board_list (
  id BIGINT(20),
  board_name VARCHAR(255),
  category_id BIGINT(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES category(id) ON UPDATE CASCADE
  );
  
  CREATE TABLE board (
  id BIGINT(20) NOT NULL,
  board_list_id BIGINT(20) NOT NULL,
  nick_name VARCHAR(255),
  anonymity BIT(1) NOT NULL,
  create_ip VARCHAR(255),
  enabled BIT(1) NOT NULL,
  refer INT(11) NOT NULL,
  depth INT(11) NOT NULL,
  step INT(11) NOT NULL,
  date_created datetime NOT NULL,
  last_updated datetime NOT NULL,
  view_count INT(11) NOT NULL,
  vote_count INT(11) NOT NULL,
  title VARCHAR(255) NOT NULL,
  content longtext NOT NULL,
  file_path VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (board_list_id) REFERENCES board_list(id) ON UPDATE CASCADE,
  FOREIGN KEY (nick_name) REFERENCES user(nick_name) ON UPDATE CASCADE
);

CREATE TABLE content_vote (
  id BIGINT(20) NOT NULL,
  c_vote_id BIGINT(20),
  content_voter VARCHAR(255),
  date_created datetime NOT NULL,
  counta BIGINT(20) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (c_vote_id) REFERENCES board(id) ON UPDATE CASCADE,
  FOREIGN KEY (content_voter) REFERENCES user(email) ON UPDATE CASCADE
);



CREATE TABLE reply (
	id BIGINT(20) not null,
    reply_id BIGINT(20) not null,
    date_created DATETIME not null,
    last_updated DATETIME not null,
    reply_content VARCHAR(255) not null,
    r_nick_name VARCHAR(255) not null,
    vote_count INT(11) not null,
    refer INT(11) not null,
    depth INT(11) not null,
    step INT(11) not null,
    enabled BIT(1) not null,
    primary key (id),
    UNIQUE (reply_content),
    FOREIGN KEY (reply_id) REFERENCES board(id) ON UPDATE CASCADE,
    FOREIGN KEY (r_nick_name) REFERENCES user(password) ON UPDATE CASCADE
);


CREATE TABLE reply_vote (
	id BIGINT(20) not null,
    vote_id BIGINT(20) not null,
    reply_voter VARCHAR(255) not null,
    date_created DATETIME not null,
    primary key (id),
    FOREIGN KEY (reply_voter) REFERENCES reply(reply_content) ON UPDATE CASCADE,
    FOREIGN KEY (vote_id) REFERENCES user(id) ON UPDATE CASCADE
    );
    

CREATE TABLE spam_word (
id BIGINT(20),
word VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE visit (
id BIGINT(20),
visit_day DATETIME NOT NULL,
visit_ip VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

  
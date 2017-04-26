CREATE DATABASE zhier
CHARACTER SET 'utf8';
USE zhier;

CREATE TABLE users(
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` VARCHAR(40) NOT NULL COMMENT '用户名',
  `password` VARCHAR(40) NOT NULL COMMENT '用户密码',
  `user_email` VARCHAR(30) NOT NULL COMMENT '用户email地址',
  `sex` TINYINT NOT NULL  COMMENT '用户性别',
  `user_authority` TINYINT NOT NULL DEFAULT '1' COMMENT '用户权限',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '用户创建时间',
  PRIMARY KEY(user_id),
  KEY idx_user_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户信息表';

CREATE TABLE questions(
  `question_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '问题创建时间',
  `latest_update_time` TIMESTAMP DEFAULT current_timestamp COMMENT '问题最近的修改时间',
  `create_user_id` INT(10) NOT NULL COMMENT '创建问题的用户id',
  `create_user_name`VARCHAR(40) NOT NULL  COMMENT '创建问题的用户名字',
  `question_tag` VARCHAR(10) NOT NULL COMMENT '问题标签',
  `question_text` TEXT NOT NULL COMMENT '问题内容',
  PRIMARY KEY (question_id),
  KEY idx_ques_create_time(create_time),
  KEY idx_ques_create_user_id(create_user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '问题表';

create TABLE tags(
  `question_tag` VARCHAR(10) NOT NULL COMMENT '问题标签',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '标签创建时间',
  PRIMARY KEY (question_tag),
  KEY idx_tag_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '问题标签表';

CREATE TABLE answers(
  `answer_id`INT(10) NOT NULL AUTO_INCREMENT COMMENT '问题回答id',
  `question_id`INT(10) NOT NULL COMMENT '问题id',
  `user_id`INT(10) NOT NULL COMMENT '回答问题用户id',
  `user_name`VARCHAR(40) NOT NULL COMMENT '回答问题用户名字',
  `answer_text`TEXT NOT NULL COMMENT '问题回答内容',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '回答时间',
  `latest_update_time` TIMESTAMP DEFAULT current_timestamp COMMENT '回答最近的修改时间',
  PRIMARY KEY (answer_id),
  KEY idx_question_id(question_id),
  KEY idx_user_id(user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '回答表'
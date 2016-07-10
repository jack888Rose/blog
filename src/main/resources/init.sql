CREATE DATABASE db_blog;

ALTER TABLE db_blog.comment DROP FOREIGN KEY article_id_FK;
ALTER TABLE db_blog.article DROP FOREIGN KEY category_id_FK;
ALTER TABLE db_blog.article DROP FOREIGN KEY user_id_FK;
ALTER TABLE db_blog.user DROP FOREIGN KEY role_id_FK;
drop table if exists user;
drop table if exists role;
drop table if exists comment;
drop table if exists article;
drop table if exists category;

drop table if exists user;
drop table if exists role;
drop table if exists comment;
drop table if exists article;
drop table if exists category;

CREATE TABLE role(
  roleId INT PRIMARY KEY AUTO_INCREMENT,
  roleName VARCHAR(50)
);

CREATE TABLE user(
  userId INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50),
  password VARCHAR(125),
  email VARCHAR(125),
  role_id INT,
  constraint role_id_FK foreign key(role_id) references role(roleId)
);

CREATE TABLE category(
  categoryId INT PRIMARY KEY AUTO_INCREMENT,
  categoryName VARCHAR(50)
);

CREATE TABLE article(
  articleId INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(125),
  summary VARCHAR(256),
  articleContent TEXT,
  status INT,
  articleCreateTime BIGINT(20),
  articleDeleted BIT(1),
  category_id INT,
  user_id INT,
  constraint category_id_FK foreign key(category_id) references category(categoryId),
  constraint user_id_FK foreign key(user_id) references user(userId)
);

CREATE TABLE comment(
  commentId INT PRIMARY KEY AUTO_INCREMENT,
  commentContent TEXT,
  ip VARCHAR(64),
  username VARCHAR(50),
  email VARCHAR(125),
  commentCreateTime BIGINT(20),
  commentDeleted BIT(1),
  article_id INT,
  constraint article_id_FK foreign key(article_id) references article(articleId)
);

insert into role (roleName) values ('admin');
insert into role (roleName) values ('guest');

insert into user (username, password, email, role_id) values ('admin', md5('admin'), '123@qq.com', 1);

INSERT INTO category (categoryName) VALUES ('技术');
INSERT INTO category (categoryName) VALUES ('生活');

INSERT INTO article (title, articleContent, status, articleCreateTime, articleDeleted, category_id, user_id)
VALUES ('Springboot的使用','Springboot快速构建微服务，具有极大的优势，免去诸多繁琐的配置','Draft', 1467368721000 , 0 , 1, 1);
INSERT INTO article (title, articleContent, status, articleCreateTime, articleDeleted, category_id, user_id)
VALUES ('ELK数据分析','ELK由三个开源组件构建，天生支持分布式扩展','Publish', 1467368721000 , 0 , 1, 1);

INSERT INTO comment (commentContent, ip, username, email, commentCreateTime, commentDeleted, article_id)
VALUES ('写的很不错', '192.168.1.1', 'woshitest', '1111@qq.com', 1467368721000, 0, 1);


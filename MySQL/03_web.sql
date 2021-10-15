#丢弃数据库tedu，如果存在；
DROP DATABASE IF EXISTS web;
#创建新的数据库web；
CREATE DATABASE web;
SHOW DATABASES;
#进入数据库web
USE web;
#创建数据表
CREATE TABLE student(
id INT(10),#int意思是整型，也就是整数
name VARCHAR(16),#varchar是代表字符的意思，可变的字符，括号内的是字符数数量
sex VARCHAR(1),
score VARCHAR(10)#最后一行不需要写","号
);
#插入数据 字符单引号 字符串双引号
INSERT INIO student VALUES('1','tao','M','85');
INSERT INTO student VALUES('2','华','M','90');
/* 

练习：编写脚本文件01_tedu.sql,先丢弃再创建数据库tedu，
设置编码为utf-8，进入数据库，创建保存部门的数据的表dept，
包含did（主键、自增），部门的名称dname（唯一），插入以下
数据10 研发部 、20市场部、 30 运营部 、40 测试部；

创建保存员工数据的表emp，包含eid（主键、自增），姓名ename
（非空），性别sex（默认值），生日birthday，工资salary，所属
部门编号deptid（外键约束）;插入若干条数据
*/

#设置连接的数据库为UTF-8
SET NAMES UTF8;

#先丢弃再创建数据库tedu
DROP DATABASE IF EXISTS tedu;

#创建数据库tedu
CREATE DATABASE tedu CHARSET = UTF8;

#进入数据库
USE tedu;

#创建保存部门的数据表dept
CREATE TABLE dept(
did INT PRIMARY KEY AUTO_INCREMENT,
dename VARCHAR(32) UNIQUE
);

#插入数据
INSERT INTO dept VALUES(10,'研发部');
INSERT INTO dept VALUES(20,'市场部');
INSERT INTO dept VALUES(30,'运营部');
INSERT INTO dept VALUES(40,'测试部');

#创建保存员工数据的表emp
CREATE TABLE emp(
eid INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(32) NOT NULL,
sex BOOL DEFAULT TRUE,#0代表女，1代表男
birthday DATE,
salary DECIMAL(7,2),
deptid INT,
FOREIGN KEY(deptid) REFERENCES dept(did)
);

#插入数据
INSERT INTO emp VALUES(1,'小明',TRUE,'1998-12-02','46466.23','10');
INSERT INTO emp VALUES(NULL,'小鸿',TRUE,'1999-11-23','12365.22','10');
INSERT INTO emp VALUES(NULL,'小红',FALSE,'2000-10-14','9999.99','40');
INSERT INTO emp VALUES(NULL,'小张',TRUE,'2002-11-02','12345.99','20');
INSERT INTO emp VALUES(NULL,'小佳',FALSE,'2000-01-01','14000.55','30');
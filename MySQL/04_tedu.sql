#删除数据库tedu，如果存在
DROP DATABASE IF EXISTS tedu;
#创建数据库tedu
CREATE DATABASE tedu;
#进入tedu数据库
USE tedu;
/*创建保存员工数据的表emp，包含有编号eid、
姓名ename、手机号phone、地址addr*/

CREATE table emp(
eid INT, #编号肯定是整数，不可能是小数，所以使用int数据类型
ename varchar(16),
phone INT(11),#手机号不可能是小数或者字符，所以使用整数类型INT，其实我觉得用varchar也行
addr varchar(20)
);
#先设置mysql客户端的编码格式为utf8格式
SET NAMES UTF8;

#丢弃数据库，如果存在xz
DROP DATABASE IF EXISTS xz;

#新建数据库xz
CREATE DATABASE xz CHARSET = UTF8;

#进入数据库
USE xz;

#创建表
CREATE TABLE family(
fid INT PRIMARY KEY,
fname VARCHAR(16) UNIQUE DEFAULT '未知'
) CHARSET = UTF8;

#插入数据
INSERT INTO family VALUES('10','联想');
INSERT INTO family VALUES('20','戴尔');
INSERT INTO family VALUES('30','小米');
INSERT INTO family VALUES('40','Apple');
INSERT INTO family VALUES('50',NULl);
INSERT INTO family VALUES('60','华为');

#创建表laptop
CREATE TABLE laptop(
lid INT PRIMARY KEY AUTO_INCREMENT,#添加自增
titile VARCHAR(64) UNIQUE NOT NUll,
price DECIMAL(7,2) default 3000,
spec  VARCHAR(64),
shelfTime DATETIME,
isOnesale bool,#1 代表在售，0代表不在出售
detail VARCHAR(128),
familyid INT,
#外键约束：将familyid设置为外键，其取值范围会到另一个表family表的fid中
FOREIGN KEY(familyid)  REFERENCES family(fid)
);

#插入数据
INSERT INTO laptop VALUES('20145021','联想拯救者','9999.99','R75800H 16GB RTX3070laptop','2021-5-31 19:00:00',1,'第三代zen架构AMD，30系光追显卡，满血3070 165W','10');
INSERT INTO laptop VALUES('23542521','戴尔外星人','46999.99','i7-11750K 64GB RTX3080laptop','2021-7-15 18:00:12',0,'12代全新intel skylack架构，30系满血3080RTX显卡 185W功耗供给，4K144刷新，支持上门换新','20');
INSERT INTO laptop VALUES('21526352','小米游戏本','7699.99','R55600HQ 16GB 1650Ti','2020-11-12 19:00:24',1,'雷电4接口，zen3架构处理器 GDDR6 GTX1650ti','30');
INSERT INTO laptop VALUES('23532565','Macbook Pro','9999.99','M1 16GB 512GB','2020-11-12 19:00:24',1,'超低功耗ARM架构处理器，万精油的屏幕，100%p3色域，macos bigsur','40');
INSERT INTO laptop VALUES('23526565','Macbook Air',DEFAULT,'M1 16GB 512GB','2020-11-12 19:00:24',0,'超低功耗ARM架构处理器，万精油的屏幕，100%p3色域，macos bigsur','40');
INSERT INTO laptop(lid,titile) VALUES('1241521','ThinkPad');
INSERT INTO laptop(lid,titile) VALUES(NULL,'燃7000');
INSERT INTO laptop(lid,titile) VALUES(NULL,'燃8000');
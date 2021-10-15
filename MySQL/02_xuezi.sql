#设置数据库服务器端为utf-8
SET NAMES UTF8;

#先丢弃再创建数据库xuezi
DROP DATABASE IF EXISTS xuezi;

#设置新创建的数据库xuezi的编码为utf-8
CREATE DATABASE xuezi CHARSET = utf8;

#进入xuezi数据库
USE xuezi;

/*创建保存笔记本数据的表laptop包含的列有编号lid，标题title，
价格price，库存量stockCount，上架时间shelfTime，是否为首页推荐isindex；*/
CREATE TABLE laptop(
lid INT PRIMARY KEY,
title VARCHAR(32),
price DECIMAL(7,2),
stockCount SMALLINT NOT NULL,
shelfTime DATETIME(2) NOT NULL,
isindex BOOL #true 代表为首页推荐，false 代表不为首页推荐
);

#插入若干数据
INSERT INTO laptop VALUES('20210902','商品2','568.52','566','19:31:22',0);
INSERT INTO laptop VALUES('20210903','商品3','565656.25','777','23:10:21',1);
INSERT INTO laptop VALUES('20210904','商品4','45423.99','888','22:25:23',0);
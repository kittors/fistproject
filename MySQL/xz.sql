#设置连接客户端为utf-8
SET NAMES UTF8;

#drop xz if exists
DROP DATABASE IF EXISTS xz;

#create database xz
CREATE DATABASE xz CHARSET = UTF8;

#into xz
USE xz;

#create table xz_laptop_family 1.4.6.商品类别表 （xz_laptop_family）
CREATE TABLE xz_laptop_family(
fid INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(32)   #类别名称

);

#create table xz_laptop  1.4.7.商品表 （xz_laptop）
CREATE TABLE xz_laptop(
lid INT PRIMARY KEY AUTO_INCREMENT,
family_id INT, #所属型号家族编号
product_id INT, #产品编号
title VARCHAR(128), #主标题
subtitle VARCHAR(128), #副标题
price DECIMAL(10,2), #价格
promise VARCHAR(64), #服务承诺
spec VARCHAR(64), #规格/颜色
name VARCHAR(32), #商品名称
os VARCHAR(32), #操作系统
memory VARCHAR(32), #内存容量
resolution VARCHAR(32), #分辨率
video_card VARCHAR(32), #显卡型号
cpu VARCHAR(32), #处理器
video_memory VARCHAR(32), #显存容量
category VARCHAR(32), #所属分类
disk VARCHAR(32), #硬盘容量及类型
details VARCHAR(1024), #产品详细说明
shelf_time BIGINT, #上架时间
sold_count INT, #已售出的数量
is_onsale BOOLEAN, #是否促销中

FOREIGN KEY (family_id) REFERENCES xz_laptop_family(fid)

);

#create table xz_user 1.用户信息表（xz_user）
CREATE TABLE xz_user (
uid INT PRIMARY KEY AUTO_INCREMENT, #用户的ID，为用户的唯一标识，由系统自动生成
uname VARCHAR(32),
upwd VARCHAR(32),
email VARCHAR(64),
phone VARCHAR(16), #手机号码
avatar VARCHAR(128), #头像图片路径
user_name VARCHAR(32), #用户名，如王小明
gender INT #性别  0-女  1-男
);

#create table xz_receiver_address 2.用户地址表 （xz_receiver_address）
CREATE TABLE xz_receiver_address(
aid INT PRIMARY KEY AUTO_INCREMENT,
user_id INT, #用户编号
receiver VARCHAR(16), #接收人姓名
province VARCHAR(16), #省
city VARCHAR(16), #市
county VARCHAR(16), #县
address VARCHAR(128), #详细地址
cellphone VARCHAR(16), #手机
fixdphone VARCHAR(16), #固定电话
postcode CHAR(6), #邮编
tag VARCHAR(16), #标签名
is_default BOOLEAN, #是否为当前用户的默认收货地址
FOREIGN KEY(user_id) REFERENCES xz_user(uid)

);

#create table xz_shopping_cart 1.4.3.用户购物车表（xz_shopping_cart）
CREATE TABLE xz_shopping_cart(
cid INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,#用户编号
product_id INT,#商品编号
count INT, #购买数量
FOREIGN KEY(user_id) REFERENCES xz_user(uid)
);

#create table xz_order 1.4.4.用户订单表 （xz_order）
CREATE TABLE xz_order(
aid INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,#用户编号
address_id INT,
status INT, #订单状态  1-等待付款  2-等待发货
order_time BIGINT, #下单时间 
pay_time BIGINT, #付款时间
deliver_time BIGINT, #发货时间 
received_time BIGINT, #签收时间
FOREIGN KEY(user_id) REFERENCES xz_user(uid)
);

#create table xz_order_detail 1.4.5.用户订单详情表 （xz_order_detail）
CREATE TABLE xz_order_detail(
did INT PRIMARY KEY AUTO_INCREMENT,
order_id INT, #订单编号
product_id INT, #产品编号
count INT, #购买数量  
FOREIGN KEY(order_id) REFERENCES xz_order(aid),
FOREIGN KEY(product_id) REFERENCES xz_laptop(lid)
);


#create xz_laptop_pic 1.4.8.商品详情图表 （xz_laptop_pic）

CREATE TABLE xz_laptop_pic(
pid INT PRIMARY KEY AUTO_INCREMENT,
laptop_id INT, #笔记本电脑编号
sm VARCHAR(128), #小图片路径
md VARCHAR(128), #中图片路径
lg VARCHAR(128), #大图片路径
cid INT,
img VARCHAR(128), #图片路径
title VARCHAR(64), #图片描述
href VARCHAR(128), #图片链接
FOREIGN KEY(laptop_id) REFERENCES xz_laptop(lid)
);

#create table xz_index_carousel 1.4.9.首页轮播图表 （xz_index_carousel）
CREATE TABLE xz_index_carousel(
cid INT PRIMARY KEY AUTO_INCREMENT,
img VARCHAR(128), #图片路径
title VARCHAR(64), #图片描述
href VARCHAR(128) #图片链接

);


#create xz_index_product
CREATE  TABLE xz_index_product(
pid INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(64),#商品标题
details VARCHAR(128),#详细描述
pic VARCHAR(128),#图片
price DECIMAL(10,2),#商品价格
href VARCHAR(128),
seq_recommended TINYINT,
seq_new_arrival TINYINT 

); 

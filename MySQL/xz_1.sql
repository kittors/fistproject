#设置客户端连接服务器端的编码为编码为utf8，不要加-，在程序中为减去符号
set names utf8;
#丢弃数据库，如果存在xz
DROP DATABASE IF EXISTS xz;
#创建数据库,设置存储的编码为utf8
CREATE DATABASE xz character set utf8;#还可以写成CREATE DATABASE xz charset = utf8;
#进入数据库xz
USE xz;
/*创建保存用户数据的表user，包含的列有编号uid，
用户名uname，密码upwd，邮箱email，手机号phone，
真实姓名userName，注册时间regTime,是否在线isOnline；*/
CREATE TABLE user (
uid INT,
uname varchar(10),
upwd varchar(16),
email varchar(30),
phone BIGINT(13),	#INT 默认最大为11，INT最多只能存储4个字节的数值，手机号11位数后5个字节，出现精度缺失，所以使用bigint或者直接用char来存
userName varchar(16),
regTime DATETIME(2),	#因为我要存入毫秒，所以要给DATETIME提高精度到毫秒所以DATETIME(2),使用默认只能存储到秒
isOnline varchar(3)	#定义YES表示在线，NO表示不在线
)CHARSET = UTF8;	#避免中文乱码
#插入若干数据
INSERT INTO user VALUES('202101','Anty','Anty_user01','Anty_user01@gmail.com','13125262312','小红','2021-09-01 01:53:55.63','NO');
INSERT INTO user VALUES('202102','Boyt','Boyt_user02','Boyt_user02@gmail.com','13422632312','小军','2020-10-01 12:46:55.64','YES');
INSERT INTO user VALUES('202103','Tom','Tom_user03','Tom_user03@gmail.com','18925453312','小名','2019-09-01 07:47:58.65','YES');
INSERT INTO user VALUES('202104','Kittors','Kittors_user04','Kittors_user04@gmail.com','11022532312','小明','2011-09-01 06:53:26.66','NO');
INSERT INTO user VALUES('202105','Bill','Bill_user05','Bill_user05@gmail.com','19925262312','小彩','2020-07-24 17:25:55.67','YES');
INSERT INTO user VALUES('202106','Master','Master_user06','Master_user06@gmail.com','13525265352','小李','2019-02-11 23:53:55.61','NO');
INSERT INTO user VALUES('202107','Mascet','Mascet_user07','Mascet_user07@gmail.com','13625542312','小白','2021-09-01 01:53:55.23','YES');
INSERT INTO user VALUES('202108','Vue','Vue_user08','Vue_user08@gmail.com','19625262312','小张','2021-09-01 01:53:55.15','YES');
INSERT INTO user VALUES('202109','Read','Read_user09','Read_user09@gmail.com','15225262312','小杨','2021-09-01 01:53:55.43','YES');
INSERT INTO user VALUES('202110','book','book_user10','book_user10@gmail.com','15325262312','小袁','2021-09-01 01:53:55.10','NO');
INSERT INTO user VALUES('202111','yaoming','yaoming_user11','yaoming_user11@gmail.com','11225262312','小花','2021-09-01 01:53:55.12','NO');
INSERT INTO user VALUES('202112','yuanwei','yuanwei_user12','yuanwei_user12@gmail.com','15625262312','小洪','2021-09-01 01:53:55.25','YES');
INSERT INTO user VALUES('202113','Number','Number_user13','Number_user13@gmail.com','13425262456','小甲','2021-09-01 01:53:55.32','NO');
INSERT INTO user VALUES('202114','candle','candle_user14','candle_user14@gmail.com','13425265352','小丙','2021-09-01 01:53:55.42','NO');
#修改数据
UPDATE user SET phone = '13358264856',email = 'yuanayun@gmail.com' WHERE uid = '202106';
UPDATE user SET uname = 'Bockentch' WHERE uid ='202103';
#删除数据
DELETE FROM user WHERE uid ='202102';
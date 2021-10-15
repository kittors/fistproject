/*练习：

编写一个脚本文件01_sina.sql, 先丢弃再创建数据库sina，设置编码为utf-8，进入数据库，
创建保存新闻数据的表news，包含编号为nid，标题title，发表时间ctime，来源origin，详情内容detail；
插入若干条数据，删除一条，修改一条。
在交互模式下查询数据

*/

#设置客户端连接服务器端的编码为编码为utf8，不要加-，在程序中为减去符号,如果这里不设置，依然会导致乱码
set names utf8;

#丢弃数据库，如果存在sina数据库
DROP DATABASE IF EXISTS sina;
#创建数据库sina，设置编码格式为utf-8
CREATE DATABASE sina CHARSET = utf8;
#进入数据库
USE sina;
#创建新闻数据表news
/*
创建保存新闻数据的表news，包含编号为nid，标题title，发表时间ctime，来源origin，详情内容detail；
*/
CREATE TABLE news(
nid INT PRIMARY KEY,
title VARCHAR(32),
ctime VARCHAR(32),
origin VARCHAR(64),
detail VARCHAR(2048)
)charset =utf8;
#插入若干条数据
INSERT INTO news VALUES('2021090201','|英雄回家|第八批在韩志愿军烈士遗骸归国纪实直播','2021年09月02日 10:02','https://zhibo.sina.com.cn/news/179205','“一条大河波浪宽，风吹稻花香两岸”');
INSERT INTO news VALUES('2021090202','严厉整治教培产业，能否消除教育内卷','2021年09月02日 07:27','https://news.sina.com.cn/c/2021-09-02/doc-iktzqtyt3546280.shtml','近日，中共中央办公厅、国务院办公厅印发了《关于进一步减轻义务教育阶段学生作业负担和校外培训负担的意见》');
INSERT INTO news VALUES('2021090203','这种毒株被世卫列为“待观察变种”，或具免疫逃逸性','2021年09月02日 08:16','https://news.sina.com.cn/w/2021-09-02/doc-iktzscyx1787095.shtml','中新网9月2日电 综合报道');
#删除一条
DELETE FROM news WHERE nid ='2021090202';
#修改一条
UPDATE news SET origin = 'www.baidu.com' WHERE nid ='2021090201';
drop database mydb5;

create database mydb5 character set utf8;

use mydb5;

create table hero (
id int,
name varchar(10),
type varchar(10)
);

insert into hero values(1,"李白","刺客"),(2,"诸葛亮","法师"),(3,"刘备","刺客"),(4,"孙尚香","射手"),(5,"刘婵","辅助"),(6,"蔡文姬","辅助"),(7,"小乔","法师");

update hero set type = "诗人" where name = "李白";

alter table hero add money int;

update hero set money = 6888 where id <=5;

update hero set type = "打野" where name = "李白";

update hero set name ="阿斗",money =13888 where name ="刘婵";

rename table hero to heros;

delete from heros;

drop table heros;


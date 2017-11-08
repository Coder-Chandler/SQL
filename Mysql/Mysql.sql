--创建表格 id为自增主键
create table emp (
id int not null auto_increment PRIMARY KEY,
name VARCHAR (255)
) DEFAULT CHARSET 'UTF8';

插入多条数据进入emp
insert into emp (name) VALUE
('dsads'),('ddqwdwqd'),('wqvva'),('ppqp');

--一共会输出50行数据
select * from DEPT, emp;

--交换NEW YORK和C，
UPDATE DEPT SET LOC = CASE LOC WHEN 'C' THEN 'NEW YORK' ELSE 'C' END;

--求DEPT和emp在规定条件下的并集
SELECT * FROM DEPT WHERE LOC='C' UNION ALL SELECT * FROM emp WHERE id>21 AND LOC!='C';

--测试join语句
create table test_a(id numeric);

create table test_b(id numeric);
insert into test_a(id) values (10);
insert into test_a(id) values (20);
insert into test_a(id) values (30);
insert into test_a(id) values (40);
insert into test_a(id) values (50);
insert into test_b(id) values (10);
insert into test_b(id) values (30);
insert into test_b(id) values (50);

--查询test_a里面有的但test_b里面没有的数据
select a.id
from test_a a
left join test_b b on a.id = b.id
where b.id is null;

--查询test_a中第三大的id数字
SELECT DISTINCT id FROM test_a ORDER BY id DESC LIMIT 3,1;

--测试替换语句
create table tbl(Nmbr numeric);

insert into tbl(Nmbr) values (1);
insert into tbl(Nmbr) values (0);
insert into tbl(Nmbr) values (0);
insert into tbl(Nmbr) values (1);
insert into tbl(Nmbr) values (1);
insert into tbl(Nmbr) values (0);
insert into tbl(Nmbr) values (0);
insert into tbl(Nmbr) values (1);
insert into tbl(Nmbr) values (1);

--数据为0就加2否则就加3
update tbl set Nmbr = case when Nmbr = 0 then Nmbr+2 else Nmbr+3 end;
--查询前3个奇数，按照数字大小排序
SELECT Nmbr FROM tbl WHERE Nmbr % 2 = 1 ORDER BY Nmbr desc limit 3;

--复杂查询
create table users (
user_id int not null auto_increment PRIMARY KEY,
username VARCHAR (255)
) DEFAULT CHARSET 'UTF8';
                                                                                                 
insert into users (username) VALUE
('John Doe '),('Jane Don'),('Alice Jones'),('Lisa Romero');
      
create table training_details (
user_training_id int not null auto_increment PRIMARY KEY,
user_id int (10),
training_id int (10),
training_date VARCHAR (200)
) DEFAULT CHARSET 'UTF8';

insert into training_details (user_id,training_id,training_date) VALUE
(1,1,"2015-08-02"),
(3,1,"2015-08-03"),
(2,3,"2015-08-04"),
(2,1,"2015-08-03"),
(5,2,"2015-08-04"),
(4,1,"2015-08-02"),
(2,4,"2015-08-05"),
(2,1,"2015-08-02"),
(3,3,"2015-08-03"),
(1,2,"2015-08-02"),
(1,1,"2015-08-02");
--从users和training_details选取user_id,username,training_id,training_date并且对用户training次数计数，列名取为count，
--按照training_date降序组成新的表以查看user的training情况
SELECT
      u.user_id,
      username,
      training_id,
      training_date,
      count( user_training_id ) AS count
  FROM users u JOIN training_details t ON t.user_id = u.user_id
  GROUP BY u.user_id,
           username,
           training_id,
           training_date
  HAVING count( user_training_id ) > 0
  ORDER BY training_date DESC;


create table Customer (
CustomerID int not null auto_increment PRIMARY KEY,
CustomerName VARCHAR (200)
) DEFAULT CHARSET 'UTF8';

insert into Customer (CustomerName) VALUE
('John Doe '),('Jane Don'),('Alice Jones'),('Lisa Romero');
--查询 Customer的CustomerName字段并且用分号链接成一行输出
SELECT group_concat(CustomerName separator ';') From Customer;
--把体重按照小数点分割为kg和g
select weight, floor(weight) as kg, substr(floor(weight) - TRUNCATE(weight,3), 4) as gms 
from Customer;

--复杂查询
create table Employee (
Emp_Id int not null PRIMARY KEY,
Emp_name VARCHAR (200),
Salary int (10),
Manager_Id int (10)
) DEFAULT CHARSET 'UTF8';

insert into Employee (Emp_Id,Emp_name,Salary,Manager_Id) VALUE
(10,'Anil',50000,18),
(11,'Vikas',75000,16),
(12,'Nisha',40000,18),
(13,'Nidhi',60000,17),
(14,'Priya',80000,18),
(15,'Mohit',45000,18),
(16,'Rajesh',90000,null),
(17,'Raman',55000,16),
(18,'Santosh',65000,17);

--计算Emp_Id和Manager_Id相等的数据的平均值，再按照emp_id和emp_name分组
select b.emp_id as "Manager_Id",
          b.emp_name as "Manager", 
          avg(a.salary) as "Average_Salary_Under_Manager"
from Employee a, 
     Employee b
where a.manager_id = b.emp_id
group by b.emp_id, b.emp_name
order by b.emp_id;

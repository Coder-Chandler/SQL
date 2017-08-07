-- 插入单条数据
-- 1.只能插入一次
INSERT INTO `student` VALUE (2, '李鬼', '狗剩', '男', now());
-- 2.插入多次，id自增长
INSERT INTO `student`(`name`, `nickname`, `gender`, `in_time`) VALUE ('李鬼2', '狗剩2', '男', now());
-- 3.插入多条数据
INSERT INTO `student`(`name`, `nickname`, `gender`, `in_time`) VALUES 
	('李鬼rq', '狗剩tt', '女', now()),
	('李鬼as', '狗剩pj', '女', now()),
	('李鬼bh', '狗剩ek', '女', now()),
	('李鬼ad', '狗剩pl', '女', now()),
	('李鬼cc', '狗剩ec', '女', now())
;

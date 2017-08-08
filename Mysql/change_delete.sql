-- 数据的更改/删除
UPDATE `student` SET `gender` = '男'  WHERE `name` = '李鬼';
UPDATE `student` SET `gender` = '男',  `name`='张三丰' WHERE `id` > 6;
DELETE	FROM `student` WHERE `gender` = '女';

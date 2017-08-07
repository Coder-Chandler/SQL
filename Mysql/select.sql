-- 数据查询
-- 查询student表中的id、name、nickname，筛选条件为女，并且按倒序排序，并且分页从第零项数据开始只展示两条数据（偏移2）（ LIMIT 0, 2）
SELECT `id`, `name`, `nickname` FROM `student` WHERE `gender` = '女' ORDER BY `id` DESC LIMIT 0, 2;

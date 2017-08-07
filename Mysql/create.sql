-- 新建数据库
CREATE DATABASE `school`;
-- 使用数据库
USE `school`;
-- 创建表
CREATE TABLE `student`( 
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NULL,
    `nickname` VARCHAR(20) NULL,
    `gender` CHAR(1) NULL,
    `in_time` DATETIME NULL
);

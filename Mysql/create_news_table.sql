-- 创建新闻数据表
CREATE TABLE `news`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(200) NOT NULL,
	`content` VARCHAR(2000) NOT NULL,
	`types` VARCHAR(10) NOT NULL,
	`image` VARCHAR(300) NULL,
	`author` VARCHAR(20) NULL,
	`view_count` INT DEFAULT 0,
	`create_time` DATETIME NULL,
	`is_valid` SMALLINT DEFAULT 1, 
	PRIMARY KEY(`id`)
) DEFAULT CHARSET = 'UTF8';

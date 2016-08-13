CREATE TABLE IF NOT EXISTS `user_info`(
	`id` INT NOT NULL,
	`name` varchar(255),
	`password` varchar(255),
	`created_at` INT,
	PRIMARY KEY (`id`),
	UNIQUE KEY (`name`)
)ENGINE=InnoDB;
INSERT INTO user_info VALUES(0,"hoge","hoge",111); #ダミー用

CREATE TABLE IF NOT EXISTS `seq_user`(
	`id` INT NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=MyISAM;
INSERT INTO seq_user VALUES(0);


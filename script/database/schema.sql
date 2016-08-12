CREATE TABLE IF NOT EXISTS `user`(
	`id` INT NOT NULL,
	`name` varchar(255),
	`password` varchar(255),
	`created_at` INT,
	PRIMARY KEY (`id`),
	UNIQUE KEY (`name`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `userhoge`(
	`id` INT NOT NULL,
	`name` varchar(255),
	`created_at` INT,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB;

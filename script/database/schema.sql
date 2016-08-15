CREATE TABLE IF NOT EXISTS `user_info`(
	`id`           INT NOT NULL,
	`name`         varchar(255),
	`pass`         varchar(255),
	`challenge_id` INT NOT NULL,
	`created_at`   INT,
	PRIMARY KEY (`id`),
	UNIQUE KEY (`name`)
)ENGINE=InnoDB;

# 挑戦中のユーザーレコードを管理する
CREATE TABLE IF NOT EXISTS `user_challenge`(
	`challenge_id` INT NOT NULL,
	`user_id`      INT NOT NULL,
	`lv`           INT NOT NULL,
	`exp`          INT NOT NULL,
	`hp`           INT NOT NULL,
	`max_hp`       INT NOT NULL,
	`power`        INT NOT NULL,
	`max_power`    INT NOT NULL,
	`created_at`   INT NOT NULL,
	`updated_at`   INT NOT NULL,
	PRIMARY KEY (`challenge_id`)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `seq_user_info`(
	`id` INT NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=MyISAM;
INSERT INTO seq_user_info VALUES(0);

CREATE TABLE IF NOT EXISTS `seq_user_challenge`(
	`id` INT NOT NULL,
	PRIMARY KEY (`id`)
)ENGINE=MyISAM;
INSERT INTO seq_user_challenge VALUES(0);

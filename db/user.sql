CREATE DATABASE water_scheduler;
use water_scheduler;

CREATE TABLE `scheduler` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `scheduler_id` int  UNIQUE,
  `scheduler_name` varchar(255),
  `motor_id` varchar(255),
  `motor_state` varchar(255),
  `scheduled_at` datetime,
  `scheduled_to` datetime,
  `scheduler_state` boolean,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `motor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `motor_name` varchar(255)  UNIQUE,
  `motor_state` boolean,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `tab` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tab_id` varchar(255)  UNIQUE,
  `tab_state` boolean,
  `motor_id` int,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `tab` ADD FOREIGN KEY (`motor_id`) REFERENCES `motor` (`id`);

-- INITIAL DATA INSERT
insert  into `scheduler`(`scheduler_id`,`scheduler_name`,`motor_id`,`motor_state`,`scheduled_at`,`scheduled_to`,`scheduler_state`) values
('1','scheduler001','[motor1,motor2]','[t,f]',curdate(),curdate(),true);
insert into motor(`motor_name`,`motor_state`) values('motor_1',true);
insert into motor(`motor_name`,`motor_state`) values('motor_2',true);
insert into motor(`motor_name`,`motor_state`) values('motor_3',true);
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_1',true,'1');
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_2',true,'1');
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_3',true,'2');
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_4',true,'2');
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_5',true,'3');
insert into tab(`tab_id`,`tab_state`,`motor_id`) values('tab_6',true,'3');
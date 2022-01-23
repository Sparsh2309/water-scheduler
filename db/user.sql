CREATE DATABASE water_scheduler;
use water_scheduler;

CREATE TABLE `scheduler` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `scheduler_id` int,
  `scheduler_name` varchar(255),
  `motor_id` varchar(255),
  `motor_state` varchar(255),
  `scheduled_at` datetime,
  `scheduled_to` datetime,
  `scheduler_state` boolean,
  `created_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `motor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `motor_id` varchar(255),
  `motor_state` boolean,
  `tab_id` int,
  `created_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `tab` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tab_id` varchar(255),
  `tab_state` boolean,
  `created_date` datetime,
  `updated_date` datetime
);

CREATE TABLE `state` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `state_name` varchar(255),
  `motor_id` int,
  `tab_id` int,
  `created_date` datetime
)ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ALTER TABLE `motor` ADD FOREIGN KEY (`id`) REFERENCES `state` (`motor_id`);

-- ALTER TABLE `tab` ADD FOREIGN KEY (`id`) REFERENCES `motor` (`tab_id`);

-- ALTER TABLE `tab` ADD FOREIGN KEY (`id`) REFERENCES `state` (`tab_id`);

insert  into `scheduler`(`id`,`scheduler_id`,`scheduler_name`,`motor_id`,`motor_state`,`scheduled_at`,`scheduled_to`,`scheduler_state`,`created_date`,`updated_date`) values
(1,'001','scheduler001','[motor1,motor2]','[t,f]',curdate(),curdate(),false,curdate(),curdate());
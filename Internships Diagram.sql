CREATE TABLE `internships` (
  `id` integer PRIMARY KEY,
  `company` varchar(255) COMMENT 'Agoda',
  `position` varchar(255) COMMENT 'Backend, Frontend, Fullstack',
  `skill_required` varchar(255) COMMENT 'scala, sql, docker'
);

CREATE TABLE `roles` (
  `id` integer PRIMARY KEY COMMENT '1 for students',
  `role` varchar(255) COMMENT 'student, admin, professor, recuiter'
);

CREATE TABLE `users` (
  `id` integer,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `username` varchar(255),
  `password` varchar(255) COMMENT 'hashed password',
  `role_id` integer DEFAULT 0,
  `intern_accepted` integer DEFAULT null COMMENT 'eg. 12 as company id',
  PRIMARY KEY (`id`, `username`)
);

CREATE TABLE `profile_pages` (
  `user_id` integer PRIMARY KEY,
  `gpa` float,
  `start` date,
  `end` date
);

ALTER TABLE `profile_pages` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

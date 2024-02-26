CREATE TABLE internships (
  `id` integer NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'internship id',
  `company` varchar(255) COMMENT 'Agoda',
  `position` varchar(255) COMMENT 'Backend, Frontend, Fullstack',
  `skill_required` varchar(255) COMMENT 'scala, sql, docker'
  'website' varchar(255) COMMENT 'www.agoda.com',
  'deadline' date COMMENT '2024-03-31 or NULL for no deadline',
  'start' date COMMENT '2024-03-31',
  'end' date COMMENT '2024-03-31',
  'author_id' integer FOREIGN KEY REFERENCES users(`id`)
);


CREATE TABLE roles (
  `id` integer PRIMARY KEY COMMENT '1 for students',
  `role` varchar(255) COMMENT 'student, admin, professor, recuiter'
);

CREATE TABLE users (
  `id` integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `username` varchar(255),
  `password` varchar(255) COMMENT 'hashed password',
  `role_id` integer DEFAULT 0 FOREIGN KEY REFERENCES roles(`id`),
  `intern_accepted` integer DEFAULT null COMMENT 'eg. 12 as company id',
  'gpa' float DEFAULT null,
  'start' date DEFAULT null,
  'end' date DEFAULT null
);
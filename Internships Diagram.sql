CREATE TABLE internships
(
    id                 integer NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'internship id',
    company            varchar(255) COMMENT 'Agoda',
    position           varchar(255) COMMENT 'Backend, Frontend, Fullstack',
    website            varchar(255) COMMENT 'www.agoda.com',
    deadline           date COMMENT '2024-03-31 or NULL for no deadline',
    time_period_id     integer FOREIGN KEY REFERENCES time_periods(id),
    author_id          integer FOREIGN KEY REFERENCES users(id),
    company_photo_link varchar(255),
    flagged            boolean   DEFAULT false COMMENT 'whether or not internship flagged',
    created_at         timestamp DEFAULT CURRENT_TIMESTAMP COMMENT 'when internship object was created',
);

CREATE TABLE time_periods
(
    id         integer      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name       varchar(255) NOT NULL COMMENT 'eg. T1_2024-2024',
    start_date date         NOT NULL,
    end_date   date         NOT NULL
);

CREATE TABLE roles
(
    id   integer PRIMARY KEY COMMENT '1 for students',
    role varchar(255) COMMENT 'student, admin, professor, recruiter'
);

CREATE TABLE users
(
    id                        integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name                varchar(255),
    last_name                 varchar(255),
    username                  varchar(255),
    password                  varchar(255) COMMENT 'hashed password',
    role_id                   integer DEFAULT 0 FOREIGN KEY REFERENCES roles(id),
    gpa                       float   DEFAULT null,
    academic_year             integer DEFAULT null,
    github_link               varchar(255),
    linkedin_link             varchar(255),
    website_link              varchar(255),
    phone_number              varchar(255),
    profile_picture_link      varchar(255),
    email                     varchar(255),
    description               varchar(500),
    internship_time_period_id integer FOREIGN KEY REFERENCES time_periods(id),
);

CREATE TABLE favorites
(
    user_id       integer FOREIGN KEY REFERENCES users(id),
    internship_id integer FOREIGN KEY REFERENCES internships(id),
    PRIMARY KEY (user_id, internship_id)
);

CREATE TABLE flags
(
    user_id       integer FOREIGN KEY REFERENCES users(id),
    internship_id integer FOREIGN KEY REFERENCES internships(id),
    PRIMARY KEY (user_id, internship_id)
);
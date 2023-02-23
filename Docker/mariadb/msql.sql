#scriptsql.sql
CREATE DATABASE moodle;
CREATE USER 'moodlehomie'@localhost IDENTIFIED BY 'moodle';
GRANT ALL ON moodledb.* TO 'moodlehomie'@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;

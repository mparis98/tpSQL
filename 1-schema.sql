CREATE DATABASE `tpstudent`;

USE `tpstudent`;

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `year`;

CREATE TABLE `year` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `enrolment`;

CREATE TABLE `enrolment` (
  `id_student` int(10) unsigned NOT NULL,
  `id_year` int(10) unsigned NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime DEFAULT NULL,
  PRIMARY KEY (`id_student`,`id_year`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_year_id` FOREIGN KEY (`id_year`) REFERENCES `year` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_year_id_module` FOREIGN KEY (`year`) REFERENCES `year` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `assessment`;

CREATE TABLE `assessment` (
  `id_student` int(10) unsigned NOT NULL,
  `id_module` int(10) unsigned NOT NULL,
  `attempted` datetime NOT NULL,
  `passed` datetime DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  PRIMARY KEY (`attempted`),
  CONSTRAINT `fk_student_id_assessment` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_module_id_assessment` FOREIGN KEY (`id_module`) REFERENCES `module` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.9)
# Database: phonebook
# Generation Time: 2016-05-07 23:21:29 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`migration`, `batch`)
VALUES
	('2014_10_12_000000_create_users_table',1),
	('2014_10_12_100000_create_password_resets_table',1),
	('2016_05_07_151836_create_phone_Book',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table phone_books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone_books`;

CREATE TABLE `phone_books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `additional_notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `phone_books` WRITE;
/*!40000 ALTER TABLE `phone_books` DISABLE KEYS */;

INSERT INTO `phone_books` (`id`, `user_id`, `name`, `phone_number`, `additional_notes`, `created_at`, `updated_at`)
VALUES
	(1,1,'Mrs. Camila Kulas DDS','+1-770-420-2522','Automated logistical superstructure','2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(2,1,'Chris Considine','+1-376-461-1461','Diverse context-sensitive array','2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(3,1,'Mr. Waino White','+1.974.915.1532','Reverse-engineered exuding implementation','2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(4,1,'Tod Lubowitz','+1-878-941-5270','Organic upward-trending moderator','2016-05-07 23:16:34','2016-05-07 23:16:34'),
	(5,1,'Merritt Borer','(589) 387-4418','Exclusive 24/7 flexibility','2016-05-07 23:16:34','2016-05-07 23:16:34');

/*!40000 ALTER TABLE `phone_books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'manshoor','phonebook@mailinator.com','$2y$10$b7RZeIBNBeVuILzXTmCMCOgO1fvhPgx/inRTEK1W3Ymi/Fq2Birya',NULL,'2016-05-07 23:16:17','2016-05-07 23:16:17'),
	(2,'Wilford Langosh','octavia.gutmann@hahn.biz','$2y$10$jfRdwKtmlwJn4jcOfnIBLunsERMtpxPo7.GfjAEoIAVYBR9fvsZMK',NULL,'2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(3,'Gennaro Simonis','kovacek.joany@yahoo.com','$2y$10$pzwvJBfsMSe9w/u7IgWofuFuMmsGHd7SISIaMzCOp/LISucAtZOTm',NULL,'2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(4,'Tod Rath','agustin.becker@frami.com','$2y$10$usg5Hy0bY3TQOnLwp9.lEe257W0ZrCncIjIORzojQ6t0Ja.YJoiY2',NULL,'2016-05-07 23:16:33','2016-05-07 23:16:33'),
	(5,'Candida Hackett','qfritsch@thiel.com','$2y$10$eAQAKLCGElIRUec/yXj6muKQqsz6P/45mbDgz2kdtyqCvsFvYYL6q',NULL,'2016-05-07 23:16:34','2016-05-07 23:16:34');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

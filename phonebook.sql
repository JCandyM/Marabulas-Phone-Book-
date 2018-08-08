-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2018 at 03:57 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phonebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

CREATE TABLE IF NOT EXISTS `agendas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `completed` enum('Sim','Não') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Não',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendas_user_id_foreign` (`user_id`),
  KEY `agendas_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `agendas`
--

INSERT INTO `agendas` (`id`, `user_id`, `contact_id`, `description`, `date`, `completed`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'teste', '2017-05-12', 'Não', '2017-05-12 13:07:00', '2017-05-12 13:07:02'),
(3, 2, 2, 'teste teste teste', '2017-06-05', 'Não', '2017-05-13 04:10:43', '2017-05-13 04:10:43'),
(5, 1, 1, 'trwetrwetwert', '2017-10-20', 'Não', '2017-05-13 06:23:57', '2017-05-13 06:23:57'),
(6, 1, 6, 'werqwreqwer qwe qwer qwer', '2017-11-11', 'Sim', '2017-05-13 08:52:06', '2017-05-13 08:52:21'),
(7, 1, 1, 'ertwertwert wrtwetwe t', '2017-04-20', 'Não', '2017-05-13 08:56:09', '2017-05-13 08:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonebooks_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_05_07_151836_create_phone_Book', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_books`
--

CREATE TABLE IF NOT EXISTS `phone_books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `additional_notes` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `phone_books`
--

INSERT INTO `phone_books` (`id`, `user_id`, `name`, `email`, `phone_number`, `additional_notes`, `created_at`, `updated_at`) VALUES
(1, 6, 'Ariel Butuan Ganzon', 'abganzon@dmc.edu.ph', '0910-695-7487', 'Mediatrix Hills Blck. 2 Lot 7 ,Upper Turno, Dipolog City', '2018-08-08 02:50:19', '2018-08-08 05:42:05'),
(2, 6, 'Jeo Anthony Atido', 'jaatido@dmc.edu.ph', '0920-796-8488', 'Patangan Rd. Sta. Filomena Dipolog City', '2018-08-08 02:51:42', '2018-08-08 03:44:52'),
(3, 6, 'John Carlo Ramoga', 'jcramoga@dmc.edu.ph', '0960-090-1481', 'Patangan Rd. Sta. Filomena Dipolog City', '2018-08-08 02:52:31', '2018-08-08 03:45:07'),
(4, 6, 'Phillip Bryan Padao', 'pbpadao@dmc.edu.ph', '0930-896-9489', 'Patangan Rd. Sta. Isabel Dipolog CIty', '2018-08-08 02:53:41', '2018-08-08 03:45:22'),
(5, 6, 'Mark Dancy Roda', 'mdroda@dmc.edu.ph', '0940-896-9489', 'Patangan Rd. Sta. Isabel Dipolog City', '2018-08-08 02:54:17', '2018-08-08 03:45:35'),
(7, 6, 'Joara Candy Marabulas', 'jamarabulas@gmail.com', '0930-896-9637', 'Piao, Roxas, ZN', '2018-08-08 05:39:43', '2018-08-08 05:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'manshoor', 'phonebook@mailinator.com', '$2y$10$b7RZeIBNBeVuILzXTmCMCOgO1fvhPgx/inRTEK1W3Ymi/Fq2Birya', NULL, '2016-05-07 15:16:17', '2016-05-07 15:16:17'),
(2, 'Wilford Langosh', 'octavia.gutmann@hahn.biz', '$2y$10$jfRdwKtmlwJn4jcOfnIBLunsERMtpxPo7.GfjAEoIAVYBR9fvsZMK', NULL, '2016-05-07 15:16:33', '2016-05-07 15:16:33'),
(3, 'Gennaro Simonis', 'kovacek.joany@yahoo.com', '$2y$10$pzwvJBfsMSe9w/u7IgWofuFuMmsGHd7SISIaMzCOp/LISucAtZOTm', NULL, '2016-05-07 15:16:33', '2016-05-07 15:16:33'),
(4, 'Tod Rath', 'agustin.becker@frami.com', '$2y$10$usg5Hy0bY3TQOnLwp9.lEe257W0ZrCncIjIORzojQ6t0Ja.YJoiY2', NULL, '2016-05-07 15:16:33', '2016-05-07 15:16:33'),
(5, 'Candida Hackett', 'qfritsch@thiel.com', '$2y$10$eAQAKLCGElIRUec/yXj6muKQqsz6P/45mbDgz2kdtyqCvsFvYYL6q', NULL, '2016-05-07 15:16:34', '2016-05-07 15:16:34'),
(6, 'Influenzah Ganzon', 'abganzon@dmc.edu.ph', '$2y$10$Q4upttOmrOM1kdItv2csdu4nbohbsTcEw70VrBb8nKteGizQIQWSS', '1AenSBEQ5YSCK28CFnHE7RazRYJw61JyYKdY9Ycd56M2J4eliePcwPqgMK24', '2018-08-08 01:52:24', '2018-08-08 02:47:18');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

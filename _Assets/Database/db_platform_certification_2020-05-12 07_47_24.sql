-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_platform_certification.tbl_certifications
CREATE TABLE IF NOT EXISTS `tbl_certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `certification_template_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `client_certification` (`client_id`,`certification_template_id`),
  KEY `FK_tbl_certifications_tbl_certifications_templates` (`certification_template_id`),
  KEY `FK_tbl_certifications_tbl_users` (`user_id`),
  CONSTRAINT `FK_tbl_certifications_tbl_certifications_templates` FOREIGN KEY (`certification_template_id`) REFERENCES `tbl_certifications_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_certifications_tbl_clients` FOREIGN KEY (`client_id`) REFERENCES `tbl_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_certifications_tbl_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=972 DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_certifications: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_certifications` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_certifications` (`id`, `client_id`, `certification_template_id`, `user_id`, `creation`) VALUES
	(971, 541, 1, 1, '2020-05-12 07:33:46');
/*!40000 ALTER TABLE `tbl_certifications` ENABLE KEYS */;

-- Dumping structure for table db_platform_certification.tbl_certifications_downloaded
CREATE TABLE IF NOT EXISTS `tbl_certifications_downloaded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certification_id` int(11) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tbl_certifications_downloaded_tbl_certifications` (`certification_id`),
  CONSTRAINT `FK_tbl_certifications_downloaded_tbl_certifications` FOREIGN KEY (`certification_id`) REFERENCES `tbl_certifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_certifications_downloaded: ~4 rows (approximately)
/*!40000 ALTER TABLE `tbl_certifications_downloaded` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_certifications_downloaded` (`id`, `certification_id`, `creation`) VALUES
	(704, 971, '2020-05-12 07:34:36'),
	(705, 971, '2020-05-12 07:35:30'),
	(706, 971, '2020-05-12 07:35:52'),
	(707, 971, '2020-05-12 07:36:50'),
	(708, 971, '2020-05-12 07:36:58'),
	(709, 971, '2020-05-12 07:39:16'),
	(710, 971, '2020-05-12 07:39:56'),
	(711, 971, '2020-05-12 07:40:15'),
	(712, 971, '2020-05-12 07:40:30'),
	(713, 971, '2020-05-12 07:40:35'),
	(714, 971, '2020-05-12 07:41:01'),
	(715, 971, '2020-05-12 07:41:03'),
	(716, 971, '2020-05-12 07:41:11'),
	(717, 971, '2020-05-12 07:43:11'),
	(718, 971, '2020-05-12 07:43:55'),
	(719, 971, '2020-05-12 07:44:02'),
	(720, 971, '2020-05-12 07:44:38'),
	(721, 971, '2020-05-12 07:45:39'),
	(722, 971, '2020-05-12 07:46:08');
/*!40000 ALTER TABLE `tbl_certifications_downloaded` ENABLE KEYS */;

-- Dumping structure for table db_platform_certification.tbl_certifications_templates
CREATE TABLE IF NOT EXISTS `tbl_certifications_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `description` text,
  `provider` varchar(255) DEFAULT NULL,
  `image_en` varchar(255) NOT NULL DEFAULT 'certification_image.png',
  `image_ar` varchar(255) NOT NULL DEFAULT 'certification_image.png',
  `background` varchar(255) NOT NULL DEFAULT 'certification_image.png',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code_x` int(11) NOT NULL DEFAULT '0',
  `code_y` int(11) NOT NULL DEFAULT '0',
  `name_en_x` int(11) NOT NULL DEFAULT '0',
  `name_en_y` int(11) NOT NULL DEFAULT '0',
  `name_en_width` int(11) NOT NULL DEFAULT '0',
  `creation_x` int(11) NOT NULL DEFAULT '0',
  `creation_y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `Index 5` (`code`),
  KEY `FK_tbl_certifications_templates_tbl_users` (`user_id`),
  CONSTRAINT `FK_tbl_certifications_templates_tbl_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_certifications_templates: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_certifications_templates` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_certifications_templates` (`id`, `name`, `code`, `description`, `provider`, `image_en`, `image_ar`, `background`, `user_id`, `creation`, `code_x`, `code_y`, `name_en_x`, `name_en_y`, `name_en_width`, `creation_x`, `creation_y`) VALUES
	(1, 'التعليم الإلكتروني في زمن جائحة كورونا - تحديات و نجاحات', 'PLA01SCI', 'الملتقى العلمي الدولي الاول  بمشاركة استاذة أعلام في اختصاصاتهم من العراق والجزائر وتونس وفلسطين  ', 'منصة الاكاديمية الدولية للقيادة والتنمية', 'PLA01SCI.png', 'PLA01SCI.png', 'PLA01SCI.png', 1, '2020-05-12 21:55:33', 520, 445, 90, 240, 420, 340, 460);
/*!40000 ALTER TABLE `tbl_certifications_templates` ENABLE KEYS */;

-- Dumping structure for table db_platform_certification.tbl_clients
CREATE TABLE IF NOT EXISTS `tbl_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL DEFAULT 'none',
  `name_ar` varchar(255) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_clients` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_clients` (`id`, `email`, `name_en`, `name_ar`, `birthday`, `creation`, `user_id`) VALUES
	(541, 'haithamtalhaji@yahoo.com', 'Haitham Alhaji', 'Haitham Alhaji', '1994-06-04 00:00:00', '2020-05-12 06:47:06', 1);
/*!40000 ALTER TABLE `tbl_clients` ENABLE KEYS */;

-- Dumping structure for table db_platform_certification.tbl_clients_missing
CREATE TABLE IF NOT EXISTS `tbl_clients_missing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `certifications` varbinary(50) DEFAULT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_clients_missing: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_clients_missing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_clients_missing` ENABLE KEYS */;

-- Dumping structure for table db_platform_certification.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table db_platform_certification.tbl_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_users` (`id`, `email`, `password`, `creation`) VALUES
	(1, 'haithamtalhaji@yahoo.com', '601f1889667efaebb33b8c12572835da3f027f78', '2019-09-02 21:53:45');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

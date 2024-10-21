-- Adminer 4.8.1 MySQL 10.11.3-MariaDB-1:10.11.3+maria~ubu2004 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(255) NOT NULL,
  `licence_number` smallint(6) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `club_tournament`;
CREATE TABLE `club_tournament` (
  `club_id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  PRIMARY KEY (`club_id`,`tournament_id`),
  KEY `IDX_F499F63461190A32` (`club_id`),
  KEY `IDX_F499F63433D1A3E7` (`tournament_id`),
  CONSTRAINT `FK_F499F63433D1A3E7` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F499F63461190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_club_id` int(11) DEFAULT NULL,
  `second_club_id` int(11) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `tournament_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_232B318C729566CE` (`first_club_id`),
  KEY `IDX_232B318C765B8A5F` (`second_club_id`),
  KEY `IDX_232B318C5DFCD4B8` (`winner_id`),
  KEY `IDX_232B318C33D1A3E7` (`tournament_id`),
  CONSTRAINT `FK_232B318C33D1A3E7` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`),
  CONSTRAINT `FK_232B318C5DFCD4B8` FOREIGN KEY (`winner_id`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_232B318C729566CE` FOREIGN KEY (`first_club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `FK_232B318C765B8A5F` FOREIGN KEY (`second_club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tournament`;
CREATE TABLE `tournament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `tournament_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `price` smallint(6) NOT NULL,
  `rewards` varchar(255) NOT NULL,
  `team_count` smallint(6) NOT NULL,
  `player_team_count` smallint(6) NOT NULL,
  `location` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_BD5FB8D961220EA6` (`creator_id`),
  CONSTRAINT `FK_BD5FB8D961220EA6` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`),
  KEY `IDX_8D93D64961190A32` (`club_id`),
  CONSTRAINT `FK_8D93D64961190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2024-10-21 10:35:13
-- --------------------------------------------------------
-- Hôte:                         cvktne7b4wbj4ks1.chr7pe7iynqr.eu-west-1.rds.amazonaws.com
-- Version du serveur:           8.0.35 - Source distribution
-- SE du serveur:                Linux
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table jy7xdu5i1ragp28q.club : ~19 rows (environ)
INSERT INTO `club` (`id`, `club_name`, `licence_number`, `adress`, `logo`, `created_at`, `updated_at`) VALUES
	(1, 'Les Tigres de l\'Est', 12345, '10 Rue des Châtaigniers', 'https://logos-marques.com/wp-content/uploads/2020/04/Real-Madrid-logo.png', '2024-07-16 15:45:10', NULL),
	(2, 'FC Étoile du Matin', 12456, '25 Avenue des Peupliers', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5M08d2KsKbeouRHIHXcNzQfpwakz2Uk4DPw&s', '2024-07-17 11:25:23', NULL),
	(3, 'Sporting Club du Soleil', 10064, '5 Chemin des Lauriers', 'https://varaschin.it/wp-content/uploads/varaschin-sponsorship-venezia.jpg', '2024-07-17 11:27:59', NULL),
	(4, 'AS Rivière-Verte', 10045, '8 Rue des Mûriers', 'https://logos-world.net/wp-content/uploads/2020/06/Liverpool-emblem.png', '2024-07-17 11:30:10', NULL),
	(5, 'Olympique de la Vallée', 12054, '15 Avenue des Pins', 'https://logowik.com/content/uploads/images/ssc-napoli3874.logowik.com.webp', '2024-07-17 21:37:44', NULL),
	(6, 'FC Montagnard', 10034, '20 Rue des Bouleaux', 'https://sticker-foot.com/cdn/shop/products/sticker-logo-club-football-monaco-autocollant-foot-486_800x800.png', '2024-07-17 21:38:53', NULL),
	(7, 'Union Sportive des Collines', 19852, '12 Chemin des Cèdres', 'https://www.grapheine.com/wp-content/uploads/manchester-united-logo-800x493.jpg', '2024-07-17 21:40:00', NULL),
	(8, 'AC Horizon Bleu', 16895, '30 Avenue des Champs', 'https://logowik.com/content/uploads/images/857_fcbayernmunich.jpg', '2024-07-17 21:41:19', NULL),
	(9, 'Sporting Club des Vignes', 15582, '18 Rue des Vignes', 'https://logo-marque.com/wp-content/uploads/2020/11/Valencia-04-Logo-2012-present.png', '2024-07-17 21:42:34', NULL),
	(10, 'FC Éclair des Bois', 11485, '22 Chemin des Érables', 'https://logos-marques.com/wp-content/uploads/2020/07/Porto-Logo-1922.jpg', '2024-07-17 21:43:39', NULL),
	(11, 'Les Aigles de l\'Ouest', 13365, '5 Rue des Acacias', 'https://www.socholet.fr/wp-content/uploads/2022/10/1_1-lemansfc-quadri.png', '2024-07-17 21:46:11', NULL),
	(12, 'FC Lumière du Nord', 18894, '17 Avenue des Lilas', 'https://upload.wikimedia.org/wikipedia/commons/7/74/Borussia_Dortmund.png', '2024-07-17 21:47:56', NULL),
	(13, 'Athlétique du Sud', 18888, '3 Chemin des Roses', 'https://logos-marques.com/wp-content/uploads/2020/04/Chelsea-Logo-2005.jpg', '2024-07-17 21:49:08', NULL),
	(14, 'Sporting Club du Centre', 11187, '7 Rue des Tulipes', 'https://logo-marque.com/wp-content/uploads/2020/11/Milan-Logo.png', '2024-07-17 21:51:03', NULL),
	(15, 'Olympique de l\'Estuaire', 15888, '9 Avenue des Magnolias', 'https://i.pinimg.com/originals/8e/8b/9d/8e8b9d0de6910189f57f6a49a3a9be32.png', '2024-07-17 21:52:52', NULL),
	(16, 'FC Horizon Rouge', 14458, '14 Chemin des Orchidées', 'https://i.bleacherreport.net/images/team_logos/328x328/west_ham_united.png?canvas=492,328', '2024-07-17 21:56:53', NULL),
	(17, 'Les Étoiles de la Plaine', 12345, '123 Rue des Acacias', 'https://i.pinimg.com/originals/8e/8b/9d/8e8b9d0de6910189f57f6a49a3a9be32.png', '2024-08-14 14:14:27', NULL),
	(18, 'Olympique de Bourges', 32767, '10 rue de la grande ourse', 'https://img.freepik.com/vecteurs-libre/modele-logo-football-design-plat-dessine-main_23-2149373252.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1725408000&semt=ais_hybrid', '2024-09-09 03:49:13', NULL),
	(19, 'Olympique de Bourges', 32767, '10 rue de la grande ourse', 'https://img.freepik.com/vecteurs-libre/modele-logo-football-design-plat-dessine-main_23-2149373252.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1725408000&semt=ais_hybrid', '2024-09-09 03:50:09', NULL);

-- Listage des données de la table jy7xdu5i1ragp28q.club_tournament : ~36 rows (environ)
INSERT INTO `club_tournament` (`club_id`, `tournament_id`) VALUES
	(1, 1),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 3),
	(2, 4),
	(2, 5),
	(3, 1),
	(3, 3),
	(3, 4),
	(3, 5),
	(4, 1),
	(4, 3),
	(4, 4),
	(5, 1),
	(5, 3),
	(5, 4),
	(5, 5),
	(6, 1),
	(6, 3),
	(6, 4),
	(7, 1),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 4),
	(14, 4),
	(15, 4),
	(16, 4),
	(17, 3),
	(17, 5),
	(18, 4);

-- Listage des données de la table jy7xdu5i1ragp28q.doctrine_migration_versions : ~3 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20240716130353', '2024-07-16 13:04:42', 417),
	('DoctrineMigrations\\Version20240717112534', '2024-07-17 11:26:06', 91),
	('DoctrineMigrations\\Version20240717112908', '2024-07-17 11:29:12', 54);

-- Listage des données de la table jy7xdu5i1ragp28q.game : ~25 rows (environ)
INSERT INTO `game` (`id`, `first_club_id`, `second_club_id`, `winner_id`, `tournament_id`, `date`, `time`, `location`, `description`, `score`, `name`) VALUES
	(1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '1-0', 'Quart match 1'),
	(2, 11, 1, NULL, 1, NULL, NULL, NULL, NULL, '3-2', 'Huitiemes match 1'),
	(3, 1, 11, NULL, 1, NULL, NULL, NULL, NULL, '6-1', 'Huitiemes match 2'),
	(4, 11, 1, NULL, 1, NULL, NULL, NULL, NULL, '3-0', 'Huitiemes match 3'),
	(5, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Huitiemes match 4'),
	(6, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Huitiemes match 5'),
	(7, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Huitiemes match 6'),
	(8, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Huitiemes match 7'),
	(9, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Huitiemes match 8'),
	(10, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Quart match 2'),
	(11, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Quart match 3'),
	(12, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Quart match 4'),
	(13, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Demi match 1'),
	(14, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Demi match 2'),
	(15, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Petite finale'),
	(16, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Grande Finale'),
	(21, 1, 3, NULL, 3, NULL, NULL, NULL, NULL, '1-0', 'Finale'),
	(23, 3, 5, NULL, 3, NULL, NULL, NULL, NULL, '1-1', 'Huitiemes'),
	(25, 6, 6, NULL, 3, NULL, NULL, NULL, NULL, '2-4', 'Quart'),
	(26, 1, 5, NULL, 3, NULL, NULL, NULL, NULL, '6-0', 'Match'),
	(27, 1, 5, NULL, 3, NULL, NULL, NULL, NULL, '', 'Match'),
	(28, 17, 4, NULL, 3, NULL, NULL, NULL, NULL, '6-0', 'Quart'),
	(29, 2, 6, NULL, 3, NULL, NULL, NULL, NULL, '', 'Quart'),
	(30, 1, 2, NULL, 3, NULL, NULL, NULL, NULL, '', 'Quart'),
	(31, 1, 5, NULL, 5, NULL, NULL, NULL, NULL, '2-0', 'Huitiemes');

-- Listage des données de la table jy7xdu5i1ragp28q.reset_password_request : ~0 rows (environ)

-- Listage des données de la table jy7xdu5i1ragp28q.tournament : ~4 rows (environ)
INSERT INTO `tournament` (`id`, `creator_id`, `tournament_name`, `date`, `price`, `rewards`, `team_count`, `player_team_count`, `location`, `poster`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Tournoi du FC Paris', '2024-09-20', 1, '300€', 16, 12, 'Paris', 'https://i.goopics.net/os7fdn.png', '2024-07-16 13:18:17', NULL),
	(3, 3, 'Tournoi de Marseille', '2024-09-21', 12, '150€', 16, 16, 'Marseille', 'https://i.goopics.net/mzen8e.png', '2024-07-16 13:48:47', NULL),
	(4, 1, 'Tournoi de Lens', '2024-09-18', 12, '250€', 16, 12, 'Lens', 'https://i.goopics.net/yruk1v.png', '2024-07-18 09:39:02', NULL),
	(5, 7, 'Tournoi du Nord', '2024-10-28', 25, '200€', 16, 12, 'Halluin', 'https://i.goopics.net/sajnde.png', '2024-07-18 09:39:02', NULL);

-- Listage des données de la table jy7xdu5i1ragp28q.user : ~12 rows (environ)
INSERT INTO `user` (`id`, `club_id`, `email`, `roles`, `password`, `lastname`, `firstname`, `is_verified`) VALUES
	(1, 1, 'testofoot@gmail.com', '["ROLE_ADMIN"]', '$2y$13$qfHFNqpkhxfTs8blvmoZxO7I1Za6ZSrWQdKroGFCjAuMfcPhxEeKe', 'Qassem', 'Qassem', 0),
	(2, 2, 'moi@gmail.com', '[]', '$2y$13$oDYSDhBPzwn7PIz5VdOHAOOth2VNBAWOKu2Yry.9XiTmku30ruWqK', 'Moi', 'moi', 0),
	(3, 3, 'teamofoot@gmail.com', '[]', '$2y$13$674CrveRjrf7W.bmKFRZXOlft1GBrKftB7QMPWzUnP8qKQrOAUVYy', 'Ofoot', 'Team', 0),
	(4, 1, 'ofott@gmail.com', '[]', '$2y$13$4nSTqsP9hvQejm/lE5zfweJiKlVK1L6bQ/8ZdbTewYvK1GERYo1hC', 'ofott', 'ofott', 0),
	(5, 5, 'qassemofoot@gmail.com', '[]', '$2y$13$PPpGyCxkiu07ub5v7/6fmOreZ9p6AMJwOMiqAiXENYgtkaukluZR2', 'qassemofoot', 'qassemofoot', 1),
	(6, 1, 'darkqassem@gmail.com', '[]', '$2y$13$92dhRZHd8HT7eAD.A6DpW.ac1P/dC5gyHi7N4FzT5mFhMAmgqKwUS', 'Dark', 'Qassem', 0),
	(7, 17, 'virtual@gmail.com', '[]', '$2y$13$OjFfOkevJ4S8Fu6co151me0B2AJ6iHpsdiMNVXH2WNbxp54xdkTfi', 'virtualbox', 'virtual', 0),
	(29, 2, 'userdiag@gmail.com', '[]', '$2y$13$cS30BNFLSvVxQP6HYIKv3OQnJWPiCtlxF43Aqqropk8aSJfsp6czq', 'dgvkujhdfghuvcb', 'dfgdfjkgdfg', 1),
	(30, 6, 'jeanphilippe.mayoute@gmail.com', '[]', '$2y$13$JNNNeBbC5RXAK3N8lXebaePFGxoD3UXd4jlHI/gM7CyVFLGcGEEyu', 'test', 'test', 1),
	(33, NULL, 'clement.hennebelle@gmail.com', '[]', '$2y$13$FLKCgsMECxU5RPBqpWx36.6OwVNvd27wDUCj3fPkH3dq3nlVHoI1m', 'Hennebelle', 'Clément', 0),
	(34, 18, 'jpmayoute@comundi.fr', '[]', '$2y$13$VnkO9OHROuGhGMMGKXGPde/csWj/VSLt6Jw.ziYwoooyHtJ1C3102', 'mayoute', 'jean-philippe', 1),
	(35, NULL, 'tp@', '[]', '$2y$13$99YSLtV61oHzvT79Ms/PQezImco9Zh8GHG8JoCzOND3gAk4M0R5b6', 'TP', 'tp', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

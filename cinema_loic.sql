-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema_loic
CREATE DATABASE IF NOT EXISTS `cinema_loic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema_loic`;

-- Listage de la structure de table cinema_loic. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_acteur`),
  KEY `FK__personne` (`id_personne`),
  CONSTRAINT `FK__personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.acteur : ~0 rows (environ)
INSERT IGNORE INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(4, 1),
	(1, 2),
	(2, 3),
	(3, 4),
	(6, 5),
	(7, 6),
	(8, 7),
	(11, 8),
	(12, 9),
	(13, 10),
	(14, 11),
	(15, 12),
	(9, 13),
	(10, 14),
	(26, 14),
	(16, 15),
	(17, 16),
	(18, 17),
	(19, 18),
	(21, 19),
	(22, 20),
	(23, 21),
	(24, 22),
	(25, 23),
	(29, 24),
	(30, 25),
	(31, 26),
	(32, 27),
	(33, 28),
	(27, 29),
	(5, 60),
	(20, 61),
	(28, 62);

-- Listage de la structure de table cinema_loic. appartenir
CREATE TABLE IF NOT EXISTS `appartenir` (
  `id_film` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `FK__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.appartenir : ~0 rows (environ)

-- Listage de la structure de table cinema_loic. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre_film` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `sortie_film` date DEFAULT NULL,
  `duree_film` int NOT NULL DEFAULT '0',
  `resume_film` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `note_film` int NOT NULL DEFAULT '0',
  `url_affiche_film` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `id_realisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.film : ~40 rows (environ)
INSERT IGNORE INTO `film` (`id_film`, `titre_film`, `sortie_film`, `duree_film`, `resume_film`, `note_film`, `url_affiche_film`, `id_realisateur`) VALUES
	(1, 'Dune', '2021-10-22', 155, NULL, 82, '0', NULL),
	(2, 'The Batman', '2022-03-04', 176, NULL, 85, '0', NULL),
	(3, 'Avengers: Endgame', '2019-04-26', 182, NULL, 94, '0', NULL),
	(4, 'Le Loup de Wall Street', '2013-12-25', 179, NULL, 79, '0', NULL),
	(5, 'The Irishman', '2019-11-01', 209, NULL, 95, '0', NULL),
	(6, 'Interstellar', '2014-11-07', 169, NULL, 86, '0', NULL),
	(7, 'Les Misérables', '2012-12-25', 158, NULL, 70, '0', NULL),
	(8, 'Once Upon a Time in Hollywood', '2019-07-26', 160, NULL, 85, '0', NULL),
	(9, 'The Revenant', '2015-12-25', 156, '', 78, '0', NULL),
	(10, 'Zodiac', '2007-03-02', 157, NULL, 89, '0', NULL),
	(11, 'Parasite', '2019-05-30', 132, NULL, 96, '0', NULL),
	(12, 'Get Out', '2017-02-24', 104, NULL, 98, '0', NULL),
	(13, 'A Quiet Place', '2018-04-06', 90, NULL, 95, '0', NULL),
	(14, 'Whiplash', '2014-10-10', 107, NULL, 94, '0', NULL),
	(15, 'Uncut Gems', '2019-12-13', 135, NULL, 92, '0', NULL),
	(16, 'Joker', '2019-10-04', 122, NULL, 68, '0', NULL),
	(17, 'Mad Max: Fury Road', '2015-05-15', 120, NULL, 97, '0', NULL),
	(18, 'Her', '2013-12-18', 126, NULL, 94, '0', NULL),
	(19, 'The Lighthouse', '2019-10-18', 110, NULL, 90, '0', NULL),
	(20, 'Jojo Rabbit', '2019-10-18', 108, NULL, 80, '0', NULL),
	(21, 'Oppenheimer', '2023-07-21', 180, NULL, 94, '0', NULL),
	(22, 'Spider-Man: No Way Home', '2021-12-17', 148, NULL, 93, '0', NULL),
	(23, 'Barbie', '2023-07-21', 114, NULL, 88, '0', NULL),
	(24, 'Top Gun: Maverick', '2022-05-27', 131, NULL, 96, '0', NULL),
	(25, 'Everything Everywhere All at Once', '2022-03-11', 139, NULL, 95, '0', NULL),
	(26, 'Black Panther: Wakanda Forever', '2022-11-11', 161, NULL, 84, '0', NULL),
	(27, 'The Whale', '2022-12-09', 117, NULL, 74, '0', NULL),
	(28, 'Glass Onion: A Knives Out Mystery', '2022-04-22', 139, NULL, 82, '0', NULL),
	(29, 'The Northman', '2022-04-22', 137, NULL, 89, '0', NULL),
	(30, 'Nope', '2022-07-22', 130, NULL, 83, '0', NULL),
	(31, 'Inception', '2010-07-16', 148, NULL, 86, '0', NULL),
	(32, 'Fight Club', '1999-10-15', 139, NULL, 79, '0', NULL),
	(33, 'Inglourious Basterds', '2009-08-21', 153, NULL, 89, '0', NULL),
	(34, 'Shutter Island', '2010-02-19', 138, NULL, 84, '0', NULL),
	(35, 'The Dark Knight', '2008-07-18', 152, NULL, 94, '0', NULL),
	(36, 'The Matrix', '1999-03-31', 136, NULL, 87, '0', NULL),
	(37, 'Pulp Fiction', '1994-10-14', 154, NULL, 89, '0', NULL),
	(38, '12 Years a Slave', '2013-10-18', 134, NULL, 96, '0', NULL),
	(39, 'Memento', '2000-10-11', 113, NULL, 92, '0', NULL),
	(40, 'The Social Network', '2010-10-01', 120, NULL, 96, '0', NULL);

-- Listage de la structure de table cinema_loic. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `libelle_genre` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.genre : ~0 rows (environ)
INSERT IGNORE INTO `genre` (`id_genre`, `libelle_genre`) VALUES
	(1, 'Science-fiction'),
	(2, 'Action'),
	(3, 'Drame'),
	(4, 'Thriller'),
	(5, 'Horreur'),
	(6, 'Comédie');

-- Listage de la structure de table cinema_loic. jouer
CREATE TABLE IF NOT EXISTS `jouer` (
  `id_film` int DEFAULT NULL,
  `id_acteur` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `FK__acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `FK__film2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.jouer : ~0 rows (environ)

-- Listage de la structure de table cinema_loic. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `prenom_personne` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `nom_personne` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `sexe_personne` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `date_naissance_personne` date DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.personne : ~0 rows (environ)
INSERT IGNORE INTO `personne` (`id_personne`, `prenom_personne`, `nom_personne`, `sexe_personne`, `date_naissance_personne`) VALUES
	(1, 'Leonardo', 'DiCaprio', 'Male', '1974-11-11'),
	(2, 'Timothée', 'Chalamet', 'Male', '1995-12-27'),
	(3, 'Robert', 'Pattinson', 'Male', '1986-05-13'),
	(4, 'Robert', 'Downey Jr.', 'Male', '1965-04-04'),
	(5, 'Matthew', 'McConaughey', 'Male', '1969-11-04'),
	(6, 'Hugh', 'Jackman', 'Male', '1968-10-12'),
	(7, 'Jake', 'Gyllenhaal', 'Male', '1980-12-19'),
	(8, 'Emily', 'Blunt', 'Female', '1983-02-23'),
	(9, 'Miles', 'Teller', 'Male', '1987-02-20'),
	(10, 'Adam', 'Sandler', 'Male', '1966-09-09'),
	(11, 'Joaquin', 'Phoenix', 'Male', '1974-10-28'),
	(12, 'Tom', 'Hardy', 'Male', '1977-09-15'),
	(13, 'Song', 'Hang-ho', 'Male', '1967-01-17'),
	(14, 'Daniel', 'Kaluuya', 'Male', '1989-02-24'),
	(15, 'Roman', 'Griffin Davis', 'Male', '2007-03-05'),
	(16, 'Cillian', 'Murphy', 'Male', '1976-05-25'),
	(17, 'Tom', 'Holland', 'Male', '1996-06-01'),
	(18, 'Margot', 'Robbie', 'Female', '1990-07-02'),
	(19, 'Michelle', 'Yeoh', 'Female', '1962-08-06'),
	(20, 'Letitia', 'Wright', 'Female', '1993-10-31'),
	(21, 'Brendan', 'Fraser', 'Male', '1968-12-03'),
	(22, 'Daniel', 'Craig', 'Male', '1968-03-02'),
	(23, 'Alexander', 'Skarsgård', 'Male', '1976-08-25'),
	(24, 'Keanu', 'Reeves', 'Male', '1964-09-02'),
	(25, 'John', 'Travolta', 'Male', '1954-02-18'),
	(26, 'Chiwetel', 'Ejiofor', 'Male', '1977-07-10'),
	(27, 'Guy', 'Pearce', 'Male', '1967-10-05'),
	(28, 'Jesse', 'Eisenberg', 'Male', '1983-10-05'),
	(29, 'Brad', 'Pitt', 'Male', '1963-12-18'),
	(30, 'Dennis', 'Villeneuve', 'Male', '1967-10-03'),
	(31, 'Matt', 'Reeves', 'Male', '1966-04-27'),
	(32, 'Russos', '', 'Male', '1970-02-03'),
	(33, 'Martin', 'Scorsese', 'Male', '1942-11-17'),
	(34, 'Christopher', 'Nolan', 'Male', '1970-07-30'),
	(35, 'Tom', 'Hooper', 'Male', '1972-10-05'),
	(36, 'Quentin', 'Tarantino', 'Male', '1963-03-27'),
	(37, 'Alejandro', 'González Iñárritu', 'Male', '1963-08-15'),
	(38, 'David', 'Fincher', 'Male', '1962-08-28'),
	(39, 'Jordan', 'Peele', 'Male', '1979-02-21'),
	(40, 'John', 'Krasisnki', 'Male', '1979-10-20'),
	(41, 'Josh', 'Safdie', 'Male', '1984-04-03'),
	(42, 'Todd', 'Phillips', 'Male', '1970-12-20'),
	(43, 'George', 'Miller', 'Male', '1945-03-03'),
	(44, 'Spike', 'Jonze', 'Male', '1969-10-22'),
	(45, 'Robert', 'Eggers', 'Male', '1983-07-07'),
	(46, 'Taika', 'Waititi', 'Male', '1975-08-16'),
	(47, 'Greta', 'Gerwig', 'Female', '1983-08-04'),
	(48, 'Joseph', 'Kosinski', 'Male', '1974-05-03'),
	(49, 'Daniels', '', 'Male', '1988-02-10'),
	(51, 'Ryan', 'Coogler', 'Male', '1986-05-23'),
	(52, 'Darren', 'Aronofsky', 'Male', '1969-02-12'),
	(53, 'Rian', 'Johnson', 'Male', '1973-12-17'),
	(54, 'Lily', 'Wachowski', 'Female', '1967-12-29'),
	(55, 'Bong', 'Joon-Ho', 'Male', '1969-09-14'),
	(56, 'Damien', 'Chazelle', 'Male', '1985-01-19'),
	(57, 'Safdies', '', 'Male', '1986-02-24'),
	(58, 'Jon', 'Watts', 'Male', '1981-06-28'),
	(59, 'Steve', 'McQueen', 'Male', '1969-10-09'),
	(60, 'Robert', 'De Niro', 'Male', '1943-08-17'),
	(61, 'Tom', 'Cruise', 'Male', '1962-07-03'),
	(62, 'Christian', 'Bale', 'Male', '1974-01-30');

-- Listage de la structure de table cinema_loic. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.realisateur : ~0 rows (environ)
INSERT IGNORE INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 30),
	(2, 31),
	(3, 32),
	(4, 33),
	(5, 34),
	(22, 34),
	(6, 35),
	(7, 36),
	(8, 37),
	(9, 38),
	(13, 39),
	(14, 40),
	(17, 42),
	(18, 43),
	(19, 44),
	(20, 45),
	(30, 45),
	(21, 46),
	(24, 47),
	(25, 48),
	(26, 49),
	(27, 51),
	(28, 52),
	(29, 53),
	(31, 54),
	(10, 55),
	(15, 56),
	(16, 57),
	(23, 58),
	(32, 59);

-- Listage de la structure de table cinema_loic. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.role : ~0 rows (environ)
INSERT IGNORE INTO `role` (`id_role`, `nom_role`) VALUES
	(1, 'Paul Atreides'),
	(2, 'Bruce Wayne/Batman'),
	(3, 'Tony Stark/Iron Man'),
	(4, 'Jordan Belfort'),
	(5, 'Frank Sheeran'),
	(6, 'Cooper'),
	(7, 'Jean Valjean'),
	(8, 'Rick Dalton'),
	(9, 'Hugh Glass'),
	(10, 'Robert Graysmith'),
	(11, 'Kim Ki-taek'),
	(12, 'Chris Washington'),
	(13, 'Evelyn Abbott'),
	(14, 'Andrew Neiman'),
	(15, 'Howard Ratner'),
	(16, 'Arthur Fleck/Joker'),
	(17, 'Max Rockatansky'),
	(18, 'Theodore Twombly'),
	(19, 'Ephraim Winslow'),
	(20, 'Jojo'),
	(21, 'J. Robert Oppenheimer'),
	(22, 'Peter Parker/Spider-Man'),
	(23, 'Barbie'),
	(24, 'Pete "Maverick" Mitchell'),
	(25, 'Evelyn Wang'),
	(26, 'Shuri'),
	(27, 'Charlie'),
	(28, 'Benoit Blanc'),
	(29, 'Amleth'),
	(30, 'OJ Haywood'),
	(31, 'Dom Cobb'),
	(32, 'Tyler Durden'),
	(33, 'Lt. Aldo Raine'),
	(34, 'Teddy Daniels'),
	(35, 'Neo'),
	(36, 'Vincent Vega'),
	(37, 'Solomon Northup'),
	(38, 'Leonard Shelby'),
	(39, 'Mark Zuckerberg');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

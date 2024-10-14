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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.acteur : ~20 rows (environ)
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
	(16, 15),
	(17, 16),
	(18, 17),
	(19, 18),
	(5, 60),
	(20, 61);

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
  `resume_film` text COLLATE utf8mb4_bin NOT NULL,
  `note_film` int NOT NULL DEFAULT '0',
  `url_affiche_film` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `id_realisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.film : ~0 rows (environ)

-- Listage de la structure de table cinema_loic. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `libelle_genre` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.genre : ~6 rows (environ)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.personne : ~60 rows (environ)
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
	(20, 'Laetitia', 'Wright', 'Female', '1993-10-31'),
	(21, 'Brendan', 'Fraser', 'Male', '1968-12-03'),
	(22, 'Daniel', 'Craig', 'Male', '1968-03-02'),
	(23, 'Alexandre', 'Skarsgård', 'Male', '1976-08-25'),
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
	(61, 'Tom', 'Cruise', 'Male', '1962-07-03');

-- Listage de la structure de table cinema_loic. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.realisateur : ~30 rows (environ)
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

-- Listage des données de la table cinema_loic.role : ~39 rows (environ)
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

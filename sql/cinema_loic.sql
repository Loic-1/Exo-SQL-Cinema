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

-- Listage des données de la table cinema_loic.acteur : ~32 rows (environ)
REPLACE INTO `acteur` (`id_acteur`, `id_personne`) VALUES
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

-- Listage des données de la table cinema_loic.appartenir : ~40 rows (environ)
REPLACE INTO `appartenir` (`id_film`, `id_genre`) VALUES
	(1, 1),
	(2, 2),
	(3, 2),
	(4, 3),
	(5, 3),
	(6, 1),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 5),
	(13, 5),
	(14, 3),
	(15, 4),
	(16, 3),
	(17, 2),
	(18, 3),
	(19, 5),
	(20, 6),
	(21, 3),
	(22, 2),
	(23, 6),
	(24, 2),
	(25, 1),
	(26, 2),
	(27, 3),
	(28, 6),
	(29, 3),
	(30, 5),
	(31, 1),
	(32, 3),
	(33, 3),
	(34, 4),
	(35, 2),
	(36, 1),
	(37, 4),
	(38, 3),
	(39, 4),
	(40, 3);

-- Listage de la structure de table cinema_loic. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre_film` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `sortie_film` date DEFAULT NULL,
  `duree_film` int NOT NULL DEFAULT '0',
  `resume_film` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `note_film` int NOT NULL DEFAULT '0',
  `url_affiche_film` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `id_realisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.film : ~40 rows (environ)
REPLACE INTO `film` (`id_film`, `titre_film`, `sortie_film`, `duree_film`, `resume_film`, `note_film`, `url_affiche_film`, `id_realisateur`) VALUES
	(1, 'Dune', '2021-10-22', 155, 'In a distant future, young Paul Atreides must navigate treachery and power struggles to protect his family\'s control over the desert planet Arrakis, home to the most valuable resource in the universe.', 82, 'https://fr.web.img5.acsta.net/c_310_420/pictures/21/08/10/12/20/4633954.jpg', 1),
	(2, 'The Batman', '2022-03-04', 176, 'Bruce Wayne, as Batman, uncovers corruption in Gotham City while hunting down the Riddler, a sadistic killer targeting high-profile figures.', 85, 'https://fr.web.img3.acsta.net/c_310_420/pictures/22/02/16/17/42/3125788.jpg', 2),
	(3, 'Avengers: Endgame', '2019-04-26', 182, 'The Avengers assemble one final time to undo the catastrophic damage caused by Thanos, risking their lives to restore balance to the universe.', 94, 'https://fr.web.img6.acsta.net/c_310_420/pictures/19/04/04/09/04/0472053.jpg', 3),
	(4, 'Le Loup de Wall Street', '2013-12-25', 179, 'Jordan Belfort rises to wealth and excess through stock market manipulation and fraud, but his greed leads to a dramatic fall from grace.', 79, 'https://fr.web.img5.acsta.net/c_310_420/pictures/210/604/21060483_20131125114549726.jpg', 4),
	(5, 'The Irishman', '2019-11-01', 209, 'Hitman Frank Sheeran reflects on his life of crime, his involvement with notorious figures, and his part in the disappearance of union leader Jimmy Hoffa.', 95, 'https://fr.web.img3.acsta.net/c_310_420/pictures/19/09/18/09/17/1349272.jpg', 4),
	(6, 'Interstellar', '2014-11-07', 169, 'A team of astronauts embarks on a perilous journey through a wormhole in search of a new home for humanity as Earth faces ecological collapse.', 86, 'https://fr.web.img5.acsta.net/c_310_420/pictures/14/09/24/12/08/158828.jpg', 5),
	(7, 'Les Misérables', '2012-12-25', 158, 'The story of Jean Valjean, an ex-convict seeking redemption in post-revolutionary France, set against the backdrop of rising political unrest.', 70, 'https://fr.web.img3.acsta.net/c_310_420/medias/nmedia/18/91/00/76/20364091.jpg', 6),
	(8, 'Once Upon a Time in Hollywood', '2019-07-26', 160, 'In 1969 Los Angeles, fading actor Rick Dalton and his stunt double Cliff Booth navigate the changing film industry, intersecting with the infamous Manson Family.', 85, 'https://fr.web.img6.acsta.net/c_310_420/pictures/19/07/22/08/51/0719990.jpg', 7),
	(9, 'The Revenant', '2015-12-25', 156, 'After being left for dead by his crew, frontiersman Hugh Glass embarks on a grueling quest for survival and revenge against the man who betrayed him.', 78, 'https://fr.web.img3.acsta.net/c_310_420/o_club-allocine-2024-310x420.png_0_se/pictures/15/11/10/09/30/165611.jpg', 8),
	(10, 'Zodiac', '2007-03-02', 157, 'A cartoonist and journalist become obsessed with tracking down the elusive Zodiac killer, whose cryptic letters terrorized the San Francisco Bay Area in the 1960s.', 89, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/35/96/38/18761684.jpg', 9),
	(11, 'Parasite', '2019-05-30', 132, 'A poor family infiltrates the life of a wealthy household by taking on various servant roles, but their ruse spirals into tragedy as class tensions escalate.', 96, 'https://fr.web.img5.acsta.net/c_310_420/pictures/20/02/12/13/58/3992754.jpg', 10),
	(12, 'Get Out', '2017-02-24', 104, 'Chris, a Black man, visits his white girlfriend\'s family for the weekend, but strange events reveal a horrifying secret about their intentions.\n\n', 98, 'https://fr.web.img2.acsta.net/c_310_420/pictures/17/03/16/13/25/487327.jpg', 13),
	(13, 'A Quiet Place', '2018-04-06', 90, 'In a post-apocalyptic world overrun by creatures that hunt by sound, a family struggles to survive in silence, communicating only through sign language.', 95, 'https://fr.web.img6.acsta.net/c_310_420/pictures/18/03/22/16/48/2454348.jpg', 14),
	(14, 'Whiplash', '2014-10-10', 107, 'A young jazz drummer endures psychological and physical torment from his abusive instructor as he strives to achieve greatness in a prestigious music school.', 94, 'https://fr.web.img6.acsta.net/c_310_420/pictures/14/09/26/17/53/345974.jpg', 15),
	(15, 'Uncut Gems', '2019-12-13', 135, ' New York jeweler with a gambling addiction risks everything on a high-stakes bet while juggling debts and dangerous consequences.', 92, 'https://fr.web.img3.acsta.net/c_310_420/pictures/20/01/08/16/54/5502811.jpg', 16),
	(16, 'Joker', '2019-10-04', 122, 'Arthur Fleck, a mentally ill clown, descends into madness and transforms into the iconic villain Joker after enduring a lifetime of isolation and abuse.', 68, 'https://fr.web.img4.acsta.net/c_310_420/pictures/19/09/03/12/02/4765874.jpg', 17),
	(17, 'Mad Max: Fury Road', '2015-05-15', 120, 'In a post-apocalyptic wasteland, Max teams up with the rebellious Furiosa to escape from a tyrannical warlord in a high-octane chase through the desert.', 97, 'https://fr.web.img6.acsta.net/c_310_420/pictures/15/04/14/18/30/215297.jpg', 18),
	(18, 'Her', '2013-12-18', 126, 'In a near-future world, a lonely writer forms an intimate relationship with his advanced AI operating system, blurring the lines between love and technology.\n\n', 94, 'https://fr.web.img3.acsta.net/c_310_420/pictures/14/03/10/10/26/014107.jpg', 19),
	(19, 'The Lighthouse', '2019-10-18', 110, 'Two lighthouse keepers descend into madness while isolated on a remote island, with their sanity fraying under the weight of loneliness and superstition.', 90, 'https://fr.web.img4.acsta.net/c_310_420/pictures/19/10/24/12/33/4915869.jpg', 20),
	(20, 'Jojo Rabbit', '2019-10-18', 108, 'A young boy in Nazi Germany discovers that his mother is hiding a Jewish girl in their home, causing him to question his blind allegiance to Hitler.\n\n', 80, 'https://fr.web.img6.acsta.net/c_310_420/img/6f/72/6f725c95122212be9fc120a18648b8f9.jpg', 21),
	(21, 'Oppenheimer', '2023-07-21', 180, 'The story of J. Robert Oppenheimer, the brilliant physicist who led the development of the atomic bomb during World War II, and the ethical dilemmas he faced.', 94, 'https://fr.web.img3.acsta.net/c_310_420/pictures/23/05/26/16/52/2793170.jpg', 5),
	(22, 'Spider-Man: No Way Home', '2021-12-17', 148, 'After his identity is revealed, Peter Parker seeks help from Doctor Strange, but the spell goes wrong, bringing villains from other dimensions into his world.', 93, 'https://fr.web.img2.acsta.net/c_310_420/pictures/21/11/16/10/01/4860598.jpg', 23),
	(23, 'Barbie', '2023-07-21', 114, 'Barbie and Ken embark on a journey from the perfect world of Barbieland to the real world, learning profound truths about identity and self-worth along the way.', 88, 'https://fr.web.img2.acsta.net/c_310_420/pictures/23/06/16/12/04/4590179.jpg', 24),
	(24, 'Top Gun: Maverick', '2022-05-27', 131, 'Maverick, now a seasoned pilot, returns to Top Gun to train a new generation of aviators, including the son of his late friend, Goose.', 96, 'https://fr.web.img6.acsta.net/c_310_420/pictures/22/03/29/15/12/0827894.jpg', 25),
	(25, 'Everything Everywhere All at Once', '2022-03-11', 139, 'A woman discovers she can access alternate versions of herself across the multiverse, leading her on a mind-bending journey to save reality itself.\n\n', 95, 'https://fr.web.img5.acsta.net/c_310_420/pictures/22/06/14/16/36/2606624.jpg', 26),
	(26, 'Black Panther: Wakanda Forever', '2022-11-11', 161, 'After the death of King T\'Challa, Wakanda faces threats from both outside forces and internal strife, leading to a new Black Panther rising.', 84, 'https://fr.web.img6.acsta.net/c_310_420/pictures/22/10/17/10/28/5232325.jpg', 27),
	(27, 'The Whale', '2022-12-09', 117, 'A reclusive and morbidly obese teacher attempts to reconnect with his estranged daughter while grappling with guilt and the weight of his own mortality.\n\n', 74, 'https://fr.web.img6.acsta.net/c_310_420/pictures/23/02/01/12/52/0897859.jpg', 28),
	(28, 'Glass Onion: A Knives Out Mystery', '2022-04-22', 139, 'Detective Benoit Blanc investigates a murder at a tech billionaire\'s private island, where deception and secrets lead to a complex and twisted mystery.', 82, 'https://fr.web.img5.acsta.net/c_310_420/pictures/22/10/28/08/43/0906480.jpg', 29),
	(29, 'The Northman', '2022-04-22', 137, 'A Viking prince sets out on a bloody quest for revenge against the man who murdered his father and usurped his kingdom.', 89, 'https://fr.web.img4.acsta.net/c_310_420/pictures/22/03/31/13/56/3329070.jpg', 20),
	(30, 'Nope', '2022-07-22', 130, 'Siblings running a California horse ranch discover a mysterious object in the sky, and their quest to capture footage of it reveals horrifying truths.', 83, 'https://fr.web.img4.acsta.net/c_310_420/pictures/22/03/07/12/13/4369919.jpg', 13),
	(31, 'Inception', '2010-07-16', 148, 'A skilled thief, specialized in stealing secrets from within dreams, is given a chance to erase his criminal record by planting an idea in someone\'s subconscious.', 86, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/72/34/14/19476654.jpg', 5),
	(32, 'Fight Club', '1999-10-15', 139, 'An unnamed narrator forms an underground fight club as an outlet for his frustrations with modern consumerism, but it spirals into anarchistic chaos.\n\n', 79, 'https://fr.web.img6.acsta.net/c_310_420/pictures/19/04/08/14/11/0688770.jpg', 9),
	(33, 'Inglourious Basterds', '2009-08-21', 153, 'During World War II, a group of Jewish-American soldiers plots to assassinate Nazi leaders, intersecting with a French theater owner\'s revenge against the Nazis.', 89, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/70/45/22/19123474.jpg', 7),
	(34, 'Shutter Island', '2010-02-19', 138, 'A U.S. Marshal investigates a mysterious disappearance at a mental institution, only to uncover dark secrets that challenge his own perception of reality.', 84, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/69/96/84/19151192.jpg', 4),
	(35, 'The Dark Knight', '2008-07-18', 152, 'Batman faces his greatest nemesis, the Joker, whose chaotic schemes threaten Gotham City, pushing Batman to his moral limits.', 94, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/63/97/89/18949761.jpg', 5),
	(36, 'The Matrix', '1999-03-31', 136, 'A hacker learns that his world is a simulated reality controlled by machines, leading him to join a rebellion against their oppressive rule.', 87, 'https://fr.web.img4.acsta.net/c_310_420/medias/04/34/49/043449_af.jpg', 31),
	(37, 'Pulp Fiction', '1994-10-14', 154, 'A series of intertwining stories involving hitmen, a boxer, a gangster, and his wife unfolds in a stylish and nonlinear narrative of crime and redemption.', 89, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/36/02/52/18846059.jpg', 7),
	(38, '12 Years a Slave', '2013-10-18', 134, 'The true story of Solomon Northup, a free Black man who is kidnapped and sold into slavery in the South, enduring years of unimaginable hardship.\n\n', 96, 'https://fr.web.img4.acsta.net/c_310_420/pictures/210/415/21041568_2013091910085449.jpg', 32),
	(39, 'Memento', '2000-10-11', 113, 'A man with short-term memory loss uses notes and tattoos to track down the man he believes murdered his wife, while the narrative unfolds in reverse.', 92, 'https://fr.web.img3.acsta.net/c_310_420/pictures/23/06/08/11/42/1463419.jpg', 5),
	(40, 'The Social Network', '2010-10-01', 120, 'The rise of Facebook is chronicled through the legal battles and betrayals surrounding its creator, Mark Zuckerberg, and the co-founders of the social media giant.', 96, 'https://fr.web.img2.acsta.net/c_310_420/o_club-allocine-2024-310x420.png_0_se/medias/nmedia/18/78/52/54/19534550.jpg', 9);

-- Listage de la structure de table cinema_loic. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `libelle_genre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.genre : ~6 rows (environ)
REPLACE INTO `genre` (`id_genre`, `libelle_genre`) VALUES
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

-- Listage des données de la table cinema_loic.jouer : ~40 rows (environ)
REPLACE INTO `jouer` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6),
	(7, 7, 7),
	(8, 4, 8),
	(9, 4, 9),
	(10, 8, 10),
	(11, 9, 11),
	(12, 10, 12),
	(13, 11, 13),
	(14, 12, 14),
	(15, 13, 15),
	(16, 14, 16),
	(17, 15, 17),
	(18, 14, 18),
	(19, 2, 19),
	(20, 16, 20),
	(21, 17, 21),
	(22, 18, 22),
	(23, 19, 23),
	(24, 20, 24),
	(25, 21, 25),
	(26, 22, 26),
	(27, 23, 27),
	(28, 24, 28),
	(29, 25, 29),
	(30, 10, 30),
	(31, 4, 31),
	(32, 27, 32),
	(33, 27, 33),
	(34, 4, 34),
	(35, 28, 2),
	(36, 29, 35),
	(37, 30, 36),
	(38, 31, 37),
	(39, 32, 38),
	(40, 33, 39);

-- Listage de la structure de table cinema_loic. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `prenom_personne` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `nom_personne` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `sexe_personne` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `date_naissance_personne` date DEFAULT NULL,
  `url_affiche_personne` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bio_personne` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.personne : ~61 rows (environ)
REPLACE INTO `personne` (`id_personne`, `prenom_personne`, `nom_personne`, `sexe_personne`, `date_naissance_personne`, `url_affiche_personne`, `bio_personne`) VALUES
	(1, 'Leonardo', 'DiCaprio', 'Male', '1974-11-11', 'https://fr.web.img3.acsta.net/c_310_420/pictures/15/06/24/14/36/054680.jpg', 'Né d\'un père italien et d\'une mère allemande favorisant au mieux ses aptitudes artistiques, Leonardo DiCaprio suit des cours de comédie dès l\'école primaire. Auditionnant pour la première fois en 1988, il commence par tourner des spots publicitaires, puis obtient très vite quelques petits rôles à la télévision (Les nouvelles aventures de Lassie, Santa Barbara), avant de se faire remarquer dans la série Quoi de neuf, docteur ? en 1991. Mais il est surtout intéressé par le cinéma, et après un premier film d\'horreur (Critters 3), Leonardo DiCaprio est choisi parmi quatre cents candidats pour jouer le beau-fils maltraité de Robert De Niro dans Blessures secrètes (1993).\r\n\r\nPar la suite, il étonne en interprétant un attardé mental dans Gilbert Grape (1993), où il vole la vedette à Johnny Depp. Sa composition lui vaut une double nomination comme Meilleur second rôle aux Golden Globes et aux Oscars 1994. A l\'aise dans tous les registres, ce surdoué enchaîne au cours de l\'année 1995 un western (Mort ou vif), une évocation de la vie d\'Arthur Rimbaud (Rimbaud Verlaine) et l\'histoire d\'un junkie (Basketball diaries). Choisissant ses films davantage sur des critères artistiques qu\'économiques, Leonardo, relégué au rang d\'acteur secondaire, accède au statut de star en 1996 lorsque sort sur les écrans Romeo + Juliette, une version contemporaine et déjantée de l’œuvre de William Shakespeare réalisée par l\'Australien Baz Luhrmann. Pari risqué, le film est un succès international.\r\n\r\nMais le meilleur reste à venir avec Titanic (1997), la fresque inoubliable de James Cameron, dont les recettes engendrées aux Etats-Unis s\'élèvent à plus de 600 millions de dollars. Amant de Claire Danes puis de Kate Winslet à l\'écran, il fait figure de nouveau héros romantique et devient l\'objet d\'une véritable "DiCaprio mania". Les sorties des films Celebrity de Woody Allen et L\'Homme au masque de fer, tournés avant le phénomène Titanic, bénéficient de cette déferlante. De 2,5 millions de dollars, son cachet passe à 20 millions pour le voyage initiatique de La Plage (2000) du Britannique Danny Boyle. Les grands réalisateurs de ce monde se l\'arrachent et lui confient des personnages plus matures à l\'image de Steven Spielberg qui lui permet de camper un escroc dans Arrête-moi si tu peux.\r\n\r\nSa collaboration avec Martin Scorsese, entamée avec Gangs of New York (2003), se poursuit avec brio au fil des années, et donne lieu à plusieurs films de qualité comme Aviator (2004), Les Infiltrés (2006), Shutter Island (2010) et Le Loup de Wall Street (2013). Le succès est constamment au rendez-vous.\r\n\r\nLe plus souvent, les personnages qu\'il incarne sont en proie à des tensions permanentes. En témoignent ses prestations d\'un mercenaire dans Blood Diamond (2006), d\'un espion dans Mensonges d\'Etat (2008) et d\'un mari faisant face à la crise que traverse son couple dans Les Noces rebelles (2009) où il retrouve Kate Winslet. Tournant sans cesse avec les plus grands metteurs en scène et s\'investissant pleinement dans ses rôles, Leonardo DiCaprio collabore ainsi successivement avec Christopher Nolan (Inception), Clint Eastwood (J. Edgar), Quentin Tarantino (Django Unchained), Baz Luhrmann (Gatsby le Magnifique) et Alejandro González Iñárritu (The Revenant). Le western de ce dernier, dans lequel l\'acteur livre une prestation anthologique, lui permet enfin de décrocher l\'oscar du meilleur premier rôle.\r\n\r\nSuite à cette consécration, le Californien se fait plus rare. En 2019, il trouve un autre rôle culte dans Once Upon a Time... in Hollywood réalisé par Quentin Tarantino. Dans ce film se déroulant dans le Hollywood de 1969, Leonardo campe un acteur sur le déclin, pouvant compter sur la fidélité de son cascadeur joué par un Brad Pitt en très grande forme. En plus d\'un succès critique considérable, le long métrage récolte 377 millions de dollars de recettes mondiales. On le voit ensuite dans la comédie déjantée Netflix Don\'t Look Up : Déni cosmique, aux côtés de Jennifer Lawrence. En 2023, il retrouve une nouvelle fois Scorsese pour Killers of the Flower Moon, une fresque historique qui met en lumière une part sombre de l\'Histoire américaine : la série de meurtres de la tribu native Osage, en Oklahoma, dans les années 1920.'),
	(2, 'Timothée', 'Chalamet', 'Male', '1995-12-27', 'https://fr.web.img6.acsta.net/c_310_420/pictures/23/12/12/10/42/2152936.jpg', NULL),
	(3, 'Robert', 'Pattinson', 'Male', '1986-05-13', 'https://fr.web.img6.acsta.net/c_310_420/pictures/17/05/29/13/41/530000.jpg', NULL),
	(4, 'Robert', 'Downey Jr.', 'Male', '1965-04-04', 'https://fr.web.img3.acsta.net/c_310_420/pictures/15/08/12/12/24/179903.jpg', NULL),
	(5, 'Matthew', 'McConaughey', 'Male', '1969-11-04', 'https://fr.web.img2.acsta.net/c_310_420/pictures/16/03/02/17/16/573123.jpg', NULL),
	(6, 'Hugh', 'Jackman', 'Male', '1968-10-12', 'https://fr.web.img2.acsta.net/c_310_420/pictures/15/09/21/15/14/169867.jpg', NULL),
	(7, 'Jake', 'Gyllenhaal', 'Male', '1980-12-19', 'https://fr.web.img6.acsta.net/c_310_420/pictures/17/04/18/16/41/286790.jpg', NULL),
	(8, 'Emily', 'Blunt', 'Female', '1983-02-23', 'https://fr.web.img5.acsta.net/c_310_420/pictures/15/05/19/14/51/233236.jpg', NULL),
	(9, 'Miles', 'Teller', 'Male', '1987-02-20', 'https://fr.web.img6.acsta.net/c_310_420/pictures/16/02/16/11/44/354195.jpg', NULL),
	(10, 'Adam', 'Sandler', 'Male', '1966-09-09', 'https://fr.web.img5.acsta.net/c_310_420/pictures/17/05/24/15/44/241968.jpg', NULL),
	(11, 'Joaquin', 'Phoenix', 'Male', '1974-10-28', 'https://fr.web.img3.acsta.net/c_310_420/pictures/19/10/23/11/18/1649761.jpg', NULL),
	(12, 'Tom', 'Hardy', 'Male', '1977-09-15', 'https://fr.web.img6.acsta.net/c_310_420/pictures/16/01/19/11/06/274206.jpg', NULL),
	(13, 'Song', 'Hang-ho', 'Male', '1967-01-17', 'https://fr.web.img5.acsta.net/c_310_420/pictures/19/07/30/15/50/3527900.jpg', NULL),
	(14, 'Daniel', 'Kaluuya', 'Male', '1989-02-24', 'https://fr.web.img4.acsta.net/c_310_420/pictures/17/03/15/11/47/209180.jpg', NULL),
	(15, 'Roman', 'Griffin Davis', 'Male', '2007-03-05', 'https://fr.web.img2.acsta.net/c_310_420/pictures/19/10/16/16/37/1274506.jpg', NULL),
	(16, 'Cillian', 'Murphy', 'Male', '1976-05-25', 'https://fr.web.img3.acsta.net/c_310_420/pictures/20/01/07/12/28/4858526.jpg', NULL),
	(17, 'Tom', 'Holland', 'Male', '1996-06-01', 'https://fr.web.img3.acsta.net/c_310_420/pictures/23/05/30/13/16/0004762.jpg', NULL),
	(18, 'Margot', 'Robbie', 'Female', '1990-07-02', 'https://fr.web.img5.acsta.net/c_310_420/pictures/20/01/31/14/13/5661728.jpg', NULL),
	(19, 'Michelle', 'Yeoh', 'Female', '1962-08-06', 'https://fr.web.img3.acsta.net/c_310_420/pictures/17/09/20/10/22/2250952.jpg', NULL),
	(20, 'Letitia', 'Wright', 'Female', '1993-10-31', 'https://fr.web.img5.acsta.net/c_310_420/pictures/22/10/28/11/38/4489619.jpg', NULL),
	(21, 'Brendan', 'Fraser', 'Male', '1968-12-03', 'https://fr.web.img3.acsta.net/c_310_420/pictures/17/02/10/15/24/015314.jpg', NULL),
	(22, 'Daniel', 'Craig', 'Male', '1968-03-02', 'https://fr.web.img6.acsta.net/c_310_420/pictures/15/10/05/10/01/037461.jpg', NULL),
	(23, 'Alexander', 'Skarsgård', 'Male', '1976-08-25', 'https://fr.web.img2.acsta.net/c_310_420/pictures/16/09/09/12/03/131099.jpg', NULL),
	(24, 'Keanu', 'Reeves', 'Male', '1964-09-02', 'https://fr.web.img5.acsta.net/c_310_420/pictures/17/02/06/17/01/343859.jpg', NULL),
	(25, 'John', 'Travolta', 'Male', '1954-02-18', 'https://fr.web.img6.acsta.net/c_310_420/pictures/18/05/15/15/20/5209194.jpg', NULL),
	(26, 'Chiwetel', 'Ejiofor', 'Male', '1977-07-10', 'https://fr.web.img4.acsta.net/c_310_420/pictures/15/09/28/11/12/007562.jpg', NULL),
	(27, 'Guy', 'Pearce', 'Male', '1967-10-05', 'https://fr.web.img2.acsta.net/c_310_420/pictures/15/07/22/12/52/040647.jpg', NULL),
	(28, 'Jesse', 'Eisenberg', 'Male', '1983-10-05', 'https://fr.web.img3.acsta.net/c_310_420/pictures/16/05/12/11/03/498134.jpg', NULL),
	(29, 'Brad', 'Pitt', 'Male', '1963-12-18', 'https://fr.web.img6.acsta.net/c_310_420/pictures/20/02/10/10/37/1374948.jpg', NULL),
	(30, 'Dennis', 'Villeneuve', 'Male', '1967-10-03', NULL, NULL),
	(31, 'Matt', 'Reeves', 'Male', '1966-04-27', NULL, NULL),
	(32, 'Russos', '', 'Male', '1970-02-03', NULL, NULL),
	(33, 'Martin', 'Scorsese', 'Male', '1942-11-17', NULL, NULL),
	(34, 'Christopher', 'Nolan', 'Male', '1970-07-30', NULL, NULL),
	(35, 'Tom', 'Hooper', 'Male', '1972-10-05', NULL, NULL),
	(36, 'Quentin', 'Tarantino', 'Male', '1963-03-27', NULL, NULL),
	(37, 'Alejandro', 'González Iñárritu', 'Male', '1963-08-15', NULL, NULL),
	(38, 'David', 'Fincher', 'Male', '1962-08-28', NULL, NULL),
	(39, 'Jordan', 'Peele', 'Male', '1979-02-21', NULL, NULL),
	(40, 'John', 'Krasisnki', 'Male', '1979-10-20', NULL, NULL),
	(41, 'Josh', 'Safdie', 'Male', '1984-04-03', NULL, NULL),
	(42, 'Todd', 'Phillips', 'Male', '1970-12-20', NULL, NULL),
	(43, 'George', 'Miller', 'Male', '1945-03-03', NULL, NULL),
	(44, 'Spike', 'Jonze', 'Male', '1969-10-22', NULL, NULL),
	(45, 'Robert', 'Eggers', 'Male', '1983-07-07', NULL, NULL),
	(46, 'Taika', 'Waititi', 'Male', '1975-08-16', NULL, NULL),
	(47, 'Greta', 'Gerwig', 'Female', '1983-08-04', NULL, NULL),
	(48, 'Joseph', 'Kosinski', 'Male', '1974-05-03', NULL, NULL),
	(49, 'Daniels', '', 'Male', '1988-02-10', NULL, NULL),
	(51, 'Ryan', 'Coogler', 'Male', '1986-05-23', NULL, NULL),
	(52, 'Darren', 'Aronofsky', 'Male', '1969-02-12', NULL, NULL),
	(53, 'Rian', 'Johnson', 'Male', '1973-12-17', NULL, NULL),
	(54, 'Lily', 'Wachowski', 'Female', '1967-12-29', NULL, NULL),
	(55, 'Bong', 'Joon-Ho', 'Male', '1969-09-14', NULL, NULL),
	(56, 'Damien', 'Chazelle', 'Male', '1985-01-19', NULL, NULL),
	(57, 'Safdies', '', 'Male', '1986-02-24', NULL, NULL),
	(58, 'Jon', 'Watts', 'Male', '1981-06-28', NULL, NULL),
	(59, 'Steve', 'McQueen', 'Male', '1969-10-09', NULL, NULL),
	(60, 'Robert', 'De Niro', 'Male', '1943-08-17', 'https://fr.web.img6.acsta.net/c_310_420/pictures/16/05/17/11/58/561836.jpg', NULL),
	(61, 'Tom', 'Cruise', 'Male', '1962-07-03', 'https://fr.web.img4.acsta.net/c_310_420/pictures/18/07/13/09/57/3777492.jpg', NULL),
	(62, 'Christian', 'Bale', 'Male', '1974-01-30', 'https://fr.web.img6.acsta.net/c_310_420/pictures/19/01/22/16/22/0699464.jpg', NULL);

-- Listage de la structure de table cinema_loic. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.realisateur : ~28 rows (environ)
REPLACE INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 30),
	(2, 31),
	(3, 32),
	(4, 33),
	(5, 34),
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
  `nom_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table cinema_loic.role : ~39 rows (environ)
REPLACE INTO `role` (`id_role`, `nom_role`) VALUES
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

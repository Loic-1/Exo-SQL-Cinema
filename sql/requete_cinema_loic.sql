-- a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 

-- SELECT f.titre_film, YEAR(f.sortie_film), CONCAT(FLOOR(f.duree_film / 60), ":", LPAD(f.duree_film % 60, 2, 00)), p.prenom_personne, p.nom_personne
-- FROM film f
-- INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
-- INNER JOIN personne p ON r.id_personne = p.id_personne
-- WHERE f.id_film = 1
-- GROUP BY f.id_film;

-- b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

-- SELECT f.titre_film, CONCAT(FLOOR(f.duree_film / 60), ":", LPAD(f.duree_film % 60, 2, 00))
-- FROM film f
-- WHERE f.duree_film > 135
-- ORDER BY f.duree_film DESC;

-- c. Liste des films d’un réalisateur (en précisant l’année de sortie) 

-- SELECT f.titre_film, YEAR(f.sortie_film)
-- FROM film f
-- WHERE f.id_realisateur = 1;

-- d. Nombre de films par genre (classés dans l’ordre décroissant)

-- SELECT g.libelle_genre, COUNT(f.id_film) AS nbFilms
-- FROM film f
-- INNER JOIN appartenir a ON f.id_film = a.id_film
-- INNER JOIN genre g ON a.id_genre = g.id_genre
-- GROUP BY g.id_genre
-- ORDER BY nbFilms DESC;

-- e. Nombre de films par réalisateur (classés dans l’ordre décroissant)

-- SELECT p.prenom_personne, p.nom_personne, COUNT(f.id_film) AS nbFilms
-- FROM film f
-- INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
-- INNER JOIN personne p ON r.id_personne = p.id_personne
-- GROUP BY r.id_realisateur
-- ORDER BY nbFilms DESC;

-- f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe + role

-- SELECT p.prenom_personne, p.nom_personne, p.sexe_personne, r.nom_role
-- FROM film f
-- INNER JOIN jouer j ON f.id_film = j.id_film
-- INNER JOIN role r ON j.id_role = r.id_role
-- INNER JOIN acteur ac ON j.id_acteur = ac.id_acteur
-- INNER JOIN personne p ON ac.id_personne = p.id_personne
-- WHERE f.id_film = 1
-- GROUP BY p.id_personne, r.id_role;

-- g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

-- SELECT p.prenom_personne, p.nom_personne, f.titre_film, r.nom_role, YEAR(f.sortie_film)
-- FROM film f
-- INNER JOIN jouer j ON f.id_film = j.id_film
-- INNER JOIN role r ON j.id_role = r.id_role
-- INNER JOIN acteur ac ON j.id_acteur = ac.id_acteur
-- INNER JOIN personne p ON ac.id_personne = p.id_personne
-- WHERE ac.id_acteur = 4
-- GROUP BY f.id_film, r.id_role
-- ORDER BY  f.sortie_film DESC;


-- h. Liste des personnes qui sont à la fois acteurs et réalisateurs

-- SELECT p.prenom_personne, p.nom_personne
-- FROM personne p
-- INNER JOIN realisateur r ON p.id_personne = r.id_personne
-- INNER JOIN acteur ac ON p.id_personne = ac.id_personne
-- GROUP BY p.id_personne;

-- i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

-- SELECT f.titre_film, YEAR(f.sortie_film)
-- FROM film f
-- WHERE f.sortie_film >  CURRENT_DATE - INTERVAL 5 YEAR;

-- j. Nombre d’hommes et de femmes parmi les acteurs

-- SELECT p.sexe_personne, COUNT(p.sexe_personne) AS sumGender
-- FROM personne p
-- INNER JOIN acteur ac ON p.id_personne = ac.id_personne
-- GROUP BY p.sexe_personne
-- ORDER BY sumGender DESC;

-- k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu) + âge

-- SELECT p.prenom_personne, p.nom_personne, FLOOR(DATEDIFF(CURRENT_DATE, p.date_naissance_personne) / 365)
-- FROM personne p
-- INNER JOIN acteur ac ON p.id_personne = ac.id_personne
-- WHERE p.date_naissance_personne < CURRENT_DATE - INTERVAL 50 YEAR
-- GROUP BY p.id_personne;

-- l. Acteurs ayant joué dans 3 films ou plus

-- SELECT p.prenom_personne, p.nom_personne, COUNT(f.id_film) AS sumFilms
-- FROM film f
-- INNER JOIN jouer j ON f.id_film = j.id_film
-- INNER JOIN acteur ac ON j.id_acteur = ac.id_acteur
-- INNER JOIN personne p ON ac.id_personne = p.id_personne
-- GROUP BY ac.id_acteur
-- HAVING sumFilms >= 3;

-- listFilms()

SELECT f.url_affiche_film, g.id_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film
FROM film f
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
GROUP BY f.id_film, g.id_genre
ORDER BY f.note_film DESC, sortie_film DESC;

-- detailFilm()

SELECT g.id_genre, f.titre_film, YEAR(f.sortie_film) AS sortie_film, f.sortie_film AS date_sortie_film, f.note_film, g.libelle_genre, CONCAT(FLOOR(f.duree_film / 60), ":", LPAD(f.duree_film % 60, 2, 00)) AS duree_film, p.prenom_personne, p.nom_personne, r.id_realisateur, f.resume_film, f.url_affiche_film, p.url_affiche_personne
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
WHERE f.id_film = 1
GROUP BY f.id_film, p.id_personne, g.id_genre;

-- detailReal()

SELECT g.id_genre, p.prenom_personne, p.nom_personne, p.bio_personne, p.url_affiche_personne
FROM personne p
INNER JOIN realisateur r ON p.id_personne = r.id_personne
WHERE r.id_realisateur = 1
GROUP BY p.id_personne;

-- listFilmsReal()

SELECT g.id_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, f.url_affiche_film
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
WHERE r.id_realisateur = 5
GROUP BY r.id_realisateur, f.id_film, g.id_genre
ORDER BY f.note_film DESC, sortie_film DESC;

-- listActeursFilm()

SELECT ac.id_acteur, p.prenom_personne, p.nom_personne, p.url_affiche_personne
FROM personne p
INNER JOIN acteur ac ON p.id_personne = ac.id_personne
INNER JOIN jouer j ON ac.id_acteur = j.id_acteur
INNER JOIN film f ON j.id_film = f.id_film
WHERE f.id_film = 1
GROUP BY p.id_personne, ac.id_acteur, f.id_film
ORDER BY p.nom_personne ASC;

-- listFilmsGenre()

SELECT g.libelle_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, f.note_film, f.url_affiche_film
FROM film f
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
WHERE g.id_genre = 1
ORDER BY f.note_film DESC, sortie_film DESC;

-- detailActeur()

SELECT ac.id_acteur, p.prenom_personne, p.nom_personne, FLOOR(DATEDIFF(CURRENT_DATE, p.date_naissance_personne) / 365) AS age_personne, p.url_affiche_personne, p.bio_personne
FROM personne p
INNER JOIN acteur ac ON p.id_personne = ac.id_personne
WHERE ac.id_acteur = 1
GROUP BY p.id_personne, ac.id_acteur;

-- listActeurs()

SELECT ac.id_acteur, p.prenom_personne, p.nom_personne, p.url_affiche_personne
FROM personne p
INNER JOIN acteur ac ON p.id_personne = ac.id_personne
ORDER BY p.nom_personne ASC;

-- listFilmsActeur()

SELECT g.id_genre, f.url_affiche_film, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, r.nom_role
FROM acteur ac
INNER JOIN jouer j ON ac.id_acteur = j.id_acteur
INNER JOIN role r ON j.id_role = r.id_role
INNER JOIN film f ON j.id_film = f.id_film
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
WHERE ac.id_acteur = 1
GROUP BY f.id_film, g.id_genre, r.id_role
ORDER BY f.note_film DESC, sortie_film DESC;

-- fin

SELECT g.id_genre, g.libelle_genre
FROM genre g
INNER JOIN appartenir a ON g.id_genre = a.id_genre
INNER JOIN film f ON a.id_film = f.id_film
WHERE f.id_film = 1
GROUP BY g.id_genre;
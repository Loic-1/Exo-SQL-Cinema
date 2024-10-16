-- a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 

SELECT f.titre_film, f.sortie_film, f.duree_film, p.prenom_personne, p.nom_personne
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
WHERE f.id_film = 1
GROUP BY p.prenom_personne, p.nom_personne;

-- b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

SELECT f.titre_film, f.duree_film
FROM film f
WHERE f.duree_film > 135
ORDER BY f.duree_film DESC;

-- c. Liste des films d’un réalisateur (en précisant l’année de sortie) 

SELECT f.titre_film, f.sortie_film
FROM film f
WHERE f.id_realisateur = 1;

-- d. Nombre de films par genre (classés dans l’ordre décroissant)

SELECT g.libelle_genre, COUNT(f.id_film) AS nbFilms
FROM film f
INNER JOIN appartenir a ON f.id_film = a.id_film
INNER JOIN genre g ON a.id_genre = g.id_genre
GROUP BY g.libelle_genre
ORDER BY nbFilms DESC;

-- e. Nombre de films par réalisateur (classés dans l’ordre décroissant)



-- f. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe



-- g. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)



-- h. Liste des personnes qui sont à la fois acteurs et réalisateurs



-- i. Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)



-- j. Nombre d’hommes et de femmes parmi les acteurs



-- k. Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)



-- l. Acteurs ayant joué dans 3 films ou plus



-- fin

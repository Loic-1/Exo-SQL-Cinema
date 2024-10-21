<?php

namespace Controller;

use Model\Connect;

class CinemaController
{
    public function listFilms()
    {
        // Se connecte à la BDD
        $pdo = Connect::seConnecter();
        // Effectue la requête spécifique
        $requeteListFilms = $pdo->query(
            "SELECT g.id_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film
            FROM film f
            INNER JOIN appartenir a ON f.id_film = a.id_film
            INNER JOIN genre g ON a.id_genre = g.id_genre
            GROUP BY f.id_film, g.id_genre
            ORDER BY f.note_film DESC, sortie_film DESC;"
        );

        // Renvoie vers listFilms.php
        require "view/listFilms.php";
    }

    public function listActeurs()
    {
        $pdo = Connect::seConnecter();
        $requeteListActeurs = $pdo->query(
            "SELECT ac.id_acteur, p.prenom_personne, p.nom_personne
            FROM personne p
            INNER JOIN acteur ac ON p.id_personne = ac.id_personne
            ORDER BY p.nom_personne ASC;"
        );

        require "view/listActeurs.php";
    }

    public function detailActeur($id)
    {
        $pdo = Connect::seConnecter();
        $requeteDetailActeur = $pdo->query(
            "SELECT ac.id_acteur, p.prenom_personne, p.nom_personne, FLOOR(DATEDIFF(CURRENT_DATE, p.date_naissance_personne) / 365) AS age_personne
            FROM personne p
            INNER JOIN acteur ac ON p.id_personne = ac.id_personne
            WHERE ac.id_acteur = $id
            GROUP BY p.id_personne, ac.id_acteur;"
        );

        $filmographie = $pdo->query(
            "SELECT f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, r.nom_role
            FROM acteur ac
            INNER JOIN jouer j ON ac.id_acteur = j.id_acteur
            INNER JOIN role r ON j.id_role = r.id_role
            INNER JOIN film f ON j.id_film = f.id_film
            INNER JOIN appartenir a ON f.id_film = a.id_film
            INNER JOIN genre g ON a.id_genre = g.id_genre
            WHERE ac.id_acteur = $id
            GROUP BY f.id_film, g.id_genre, r.id_role
            ORDER BY f.note_film DESC, sortie_film DESC;"
        );

        require "view/detailActeur.php";
    }

    public function detailFilm($id)
    {
        $pdo = Connect::seConnecter();
        $requeteDetailFilm = $pdo->query(
            "SELECT g.id_genre, r.id_realisateur, f.titre_film, YEAR(f.sortie_film) AS sortie_film, f.note_film, g.libelle_genre, p.prenom_personne, p.nom_personne, f.resume_film
        FROM film f
        INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
        INNER JOIN personne p ON r.id_personne = p.id_personne
        INNER JOIN appartenir a ON f.id_film = a.id_film
        INNER JOIN genre g ON a.id_genre = g.id_genre
        WHERE f.id_film = $id
        GROUP BY f.id_film, p.id_personne, g.id_genre;"
        );

        $casting = $pdo->query(
            "SELECT ac.id_acteur, p.prenom_personne, p.nom_personne
            FROM personne p
            INNER JOIN acteur ac ON p.id_personne = ac.id_personne
            INNER JOIN jouer j ON ac.id_acteur = j.id_acteur
            INNER JOIN film f ON j.id_film = f.id_film
            WHERE f.id_film = $id
            GROUP BY p.id_personne, ac.id_acteur, f.id_film
            ORDER BY p.nom_personne ASC;"
        );

        require "view/detailFilm.php";
    }

    public function detailReal($id)
    {
        $pdo = Connect::seConnecter();
        $requeteDetailReal = $pdo->query(
            "SELECT p.prenom_personne, p.nom_personne
            FROM personne p
            INNER JOIN realisateur r ON p.id_personne = r.id_personne
            WHERE r.id_realisateur = $id
            GROUP BY p.id_personne;"
        );

        $filmographie = $pdo->query(
            "SELECT g.id_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film
            FROM film f
            INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
            INNER JOIN appartenir a ON f.id_film = a.id_film
            INNER JOIN genre g ON a.id_genre = g.id_genre
            WHERE r.id_realisateur = $id
            GROUP BY r.id_realisateur, f.id_film, g.id_genre
            ORDER BY f.note_film DESC, sortie_film DESC;"
        );

        require "view/detailReal.php";
    }

    public function listFilmsGenre($id)
    {
        $pdo = Connect::seConnecter();
        $requeteListFilmsGenre = $pdo->query(
            "SELECT g.libelle_genre, f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, f.note_film
            FROM film f
            INNER JOIN appartenir a ON f.id_film = a.id_film
            INNER JOIN genre g ON a.id_genre = g.id_genre
            WHERE g.id_genre = $id
            ORDER BY f.note_film DESC, sortie_film DESC;"
        );

        require "view/listFilmsGenre.php";
    }

    public function default () {
        require "view/default.php";
    }
}

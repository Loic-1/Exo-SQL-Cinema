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
            "SELECT f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film
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

        require "view/detailActeur.php";
    }

    public function listFilmsActeur($id)
    {
        $pdo = Connect::seConnecter();
        $requeteListFilmsActeur = $pdo->query(
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
}

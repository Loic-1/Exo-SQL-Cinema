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
            "SELECT f.titre_film, YEAR(f.sortie_film) AS anneeSortie
            FROM film f
            ORDER BY f.sortie_film DESC;"
        );

        // Renvoie vers listFilms.php
        require "view/listFilms.php";
    }

    public function listActeurs()
    {
        $pdo = Connect::seConnecter();
        $requeteListActeurs = $pdo->query(
            "SELECT f.titre_film, YEAR(f.sortie_film)
            FROM film f
            ORDER BY f.sortie_film DESC;"
        );

        require "view/listActeurs.php";
    }
}

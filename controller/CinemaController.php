<?php

namespace Controller;

use Model\Connect;

class CinemaController
{
    public function listFilms()
    {
        $pdo = Connect::seConnecter();
        $requete = $pdo->query("
        SELECT titre_film, sortie_film
        FROM film");

        require "view/listFilms.php";
    }
}

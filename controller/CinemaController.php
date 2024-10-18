<?php

namespace Controller;

use Model\Connect;

class CinemaController
{
    public function listFilms()
    {
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT titre_film, YEAR(sortie_film)
            FROM film;"
        );

        require "view/listFilms.php";
    }

    public function listActeurs()
    {
        $pdo = Connect::seConnecter();
        $requete = $pdo->query(
            "SELECT p.prenom_personne, p.nom_personne
            FROM personne p
            INNER JOIN acteur ac ON p.id_personne = ac.id_personne
            GROUP BY ac.id_acteur;"
        );

        require "view/listActeurs.php";
    }
}

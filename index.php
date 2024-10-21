<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});


$ctrlCinema = new CinemaController();

// vérifie si le paramètre action existe
if (isset($_GET["action"])) {
    switch ($_GET["action"]) {
        case "listFilms":
            // appelle listFilms() dans CinemaController.php
            $ctrlCinema->listFilms(); // redirect ??
            break;
        case "listActeurs":
            // appelle listActeurs() dans CinemaController.php
            $ctrlCinema->listActeurs();
            break;
        case "detailActeur":
            $ctrlCinema->detailActeur($_GET["id"]);
            break;
        case "detailFilm":
            $ctrlCinema->detailFilm($_GET["id"]);
            break;
        case "detailReal":
            $ctrlCinema->detailReal($_GET["id"]);
            break;
        case "listFilmsGenre":
            $ctrlCinema->listFilmsGenre($_GET["id"]);
            break;
        
    }
}

$ctrlCinema->listFilms();

<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

if (isset($_GET["action"])) {
    switch ($_GET["action"]) {
        case "listFilms":
            $ctrlCinema->listFilms(); // définir listFilms
            break;
        case "listActeurs":
            $ctrlCinema->listActeurs(); // définir listActeurs
            break;
    }
}

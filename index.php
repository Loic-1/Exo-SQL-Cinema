<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exo-SQL-Cinema</title>
</head>

<body>

    <a href="view/template.php&action=listFilms">Liste Films</a>
    <a href="view/listFilms.php">Liste Films ($contenu)</a>
    <a href="view/template.php&action=listActeurs">Liste Acteurs</a>

</body>

</html>

<?php

use Controller\CinemaController;

spl_autoload_register(function ($class_name) {
    include $class_name . '.php';
});

// vérifie si le paramètre action existe
if (isset($_GET["action"])) {
    switch ($_GET["action"]) {
        case "listFilms":
            // appelle listFilms() dans CinemaController.php
            $ctrlCinema->listFilms();
            break;
        case "listActeurs":
            // appelle listActeurs() dans CinemaController.php
            $ctrlCinema->listActeurs();
            break;
    }
}

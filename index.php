<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

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

    ?>

    <a href="index.php&action=listFilms">Liste Films</a>
    <a href="index.php&action=listActeurs">Liste Acteurs</a>

</body>

</html>
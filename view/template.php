<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $titre ?></title>
</head>

<body>



    <a href="index.php?action=listFilms">Liste Films</a>
    <a href="index.php?action=listActeurs">Liste Acteurs</a>
    <div id="contenu">
        <?=
        // Héberge le contenu qu'il faut (ex: listFilms.php)
        $contenu
        ?>
    </div>
</body>

</html>
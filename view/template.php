<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $titre ?></title>
    <link rel="stylesheet" href="public/css/style.css">
</head>

<body>


    <a href="index.php">Home</a>
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
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $titre ?></title>
    <link rel="stylesheet" href="public/css/style.css">
</head>

<body>
    <div class="body">
        <header class="main_header">
            <nav class="main_header_nav">
                <ul>
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="index.php?action=listFilms">Liste Films</a>
                    </li>
                    <li>
                        <a href="index.php?action=listActeurs">Liste Acteurs</a>
                    </li>
                </ul>
            </nav>
        </header>
        <div id="contenu">
            <?=
            // Héberge le contenu qu'il faut (ex: listFilms.php)
            $contenu
            ?>
        </div>
    </div>
</body>

</html>
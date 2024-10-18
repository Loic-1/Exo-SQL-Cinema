<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <title><?= $titre ?></title>
</head>
<body>
    <div id="contenu">
        <?= $contenu ?>
    </div>
</body>
</html>

<?php ob_start() ?>

<p class="uk-label uk-label-warning">Il y a <?= $requete->rowCount() ?></p>

<table class="uk-table uk-table-striped">
    <thead>
        <tr>
            <th>TITRE</th>
            <th>ANNEE SORTIE</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requete->fetchAll() as $film) { ?>
            <tr>
                <td><?= $film["titre_film"] ?></td>
                <td><?= $film["sortie_film"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = "Liste des acteurs";
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";
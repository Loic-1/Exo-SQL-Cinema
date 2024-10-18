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
            <th>NOM</th>
            <th>PRÉNOM</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requete->fetchAll() as $film) { ?>
            <tr>
                <td><?= $film["prenom_personnage"] ?></td>
                <td><?= $film["nom_personnage"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = "Liste des films";
$titre_secondaire = "Liste des films";
$contenu = ob_get_clean();
require "view/template.php";
<?php ob_start() ?>

<p class="uk-label uk-label-warning">Il y a <?= $requeteDetailActeur->rowCount() ?> acteurs</p>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">ACTEUR</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requeteDetailActeur->fetchAll() as $acteur) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $acteur["id_acteur"] ?></td>
                <td style="border: 1px solid black;"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></td>
            </tr>
        <?php } ?>
        <?php
        foreach ($requeteDetailActeur->fetchAll() as $acteur) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $acteur["id_acteur"] ?></td>
                <td style="border: 1px solid black;"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = $acteur["prenom_personne"] . " " . $acteur["nom_personne"];
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";
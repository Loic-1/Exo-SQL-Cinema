<?php ob_start() ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">ACTEUR</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requeteListActeurs->fetchAll() as $acteur) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $acteur["id_acteur"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></a></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = "Liste des acteurs";
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";

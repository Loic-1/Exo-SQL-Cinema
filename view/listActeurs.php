<?php ob_start() ?>

<p class="uk-label uk-label-warning">Il y a <?= $requeteListActeurs->rowCount() ?> acteurs</p>

<table class="uk-table uk-table-striped">
    <thead>
        <tr>
            <th>NOM</th>
            <th>PRÉNOM</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requeteListActeurs->fetchAll() as $acteur) { ?>
            <tr>
                <td><?= $acteur["prenom_personne"] ?></td>
                <td><?= $acteur["nom_personne"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = "Liste des acteurs";
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";
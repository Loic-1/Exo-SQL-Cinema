<?php ob_start() ?>

<p class="uk-label uk-label-warning">Il y a <?= $requeteListFilms->rowCount() ?> films</p>

<table class="uk-table uk-table-striped">
    <thead>
        <tr>
            <th>TITRE</th>
            <th>ANNEE SORTIE</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Met toutes les lignes dans un array
        foreach ($requeteListFilms->fetchAll() as $film) { ?>
            <tr>
                <td><?= $film["titre_film"] ?></td>
                <td><?= $film["anneeSortie"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

// Définit les paramètres qui serviront dans template.php
$titre = "Liste des films";
$titre_secondaire = "Liste des films";
$contenu = ob_get_clean();
require "view/template.php";
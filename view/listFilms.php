<?php ob_start() ?>

<p class="uk-label uk-label-warning">Il y a <?= $requeteListFilms->rowCount() ?> films</p>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">TITRE</th>
            <th style="border: 1px solid black;">ANNEE SORTIE</th>
            <th style="border: 1px solid black;">GENRE</th>
            <th style="border: 1px solid black;">NOTE</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Met toutes les lignes dans un array
        foreach ($requeteListFilms->fetchAll() as $film) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $film["id_film"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
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

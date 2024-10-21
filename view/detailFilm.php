<?php ob_start(); ?>

<?php $film = $requeteDetailFilm->fetch(); ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">TITRE</th>
            <th style="border: 1px solid black;">SORTIE</th>
            <th style="border: 1px solid black;">NOTE</th>
            <th style="border: 1px solid black;">GENRE</th>
            <th style="border: 1px solid black;">REALISATEUR</th>
            <th style="border: 1px solid black;">RESUME</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid black;"><?= $film["id_film"] ?></td>
            <td style="border: 1px solid black;"><?= $film["titre_film"] ?></td>
            <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
            <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
            <td style="border: 1px solid black;"><?= $film["libelle_genre"] ?></td>
            <td style="border: 1px solid black;"><?= $film["prenom_personne"] ?> <?= $film["nom_personne"] ?></td>
            <td style="border: 1px solid black;"><?= $film["resume_film"] ?></td>
        </tr>
    </tbody>
</table>

<?php
$titre = $film["titre_film"];
$contenu = ob_get_clean();
require "view/template.php";

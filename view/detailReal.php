<?php ob_start(); ?>

<?php $real = $requeteDetailReal->fetch(); ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">REALISATEUR</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid black;"><?= $real["prenom_personne"] ?> <?= $real["nom_personne"] ?></td>
        </tr>
    </tbody>
</table>

<?php $films = $filmographie->fetchAll() ?>

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
        <?php foreach ($films as $film) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $film["id_film"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
                <td style="border: 1px solid black;"><?= $film["libelle_genre"] ?></td>
                <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php
$titre = $real["prenom_personne"] . " " . $real["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";

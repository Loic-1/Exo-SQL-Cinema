<?php ob_start(); ?>

<?php $acteur = $requeteDetailActeur->fetch(); ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">ACTEUR</th>
            <th style="border: 1px solid black;">AGE</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid black;"><?= $acteur["id_acteur"] ?></td>
            <td style="border: 1px solid black;"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></td>
            <td style="border: 1px solid black;"><?= $acteur["age_personne"] ?> ans</td>
        </tr>
    </tbody>
</table>

<?php $films = $filmographie->fetchAll(); ?>


<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">TITRE</th>
            <th style="border: 1px solid black;">ANNEE SORTIE</th>
            <th style="border: 1px solid black;">GENRE</th>
            <th style="border: 1px solid black;">NOTE</th>
            <th style="border: 1px solid black;">ROLE</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($films as $film) { /*f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, r.nom_role*/ ?>
            <tr>
                <td style="border: 1px solid black;"><?= $film["id_film"] ?></td>
                <td style="border: 1px solid black;"><?= $film["titre_film"] ?></td>
                <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
                <td style="border: 1px solid black;"><?= $film["libelle_genre"] ?></td>
                <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
                <td style="border: 1px solid black;"><?= $film["nom_role"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php
$titre = $acteur["prenom_personne"] . " " . $acteur["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";

<?php ob_start(); ?>

<?php $film = $requeteDetailFilm->fetch(); ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">TITRE</th>
            <th style="border: 1px solid black;">SORTIE</th>
            <th style="border: 1px solid black;">GENRE</th>
            <th style="border: 1px solid black;">NOTE</th>
            <th style="border: 1px solid black;">REALISATEUR</th>
            <th style="border: 1px solid black;">RESUME</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid black;"><?= $film["titre_film"] ?></td>
            <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
            <td style="border: 1px solid black;"><a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a></td>
            <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
            <td style="border: 1px solid black;"><a href="index.php?action=detailReal&id=<?= $film["id_realisateur"] ?>"><?= $film["prenom_personne"] ?> <?= $film["nom_personne"] ?></a></td>
            <td style="border: 1px solid black;"><?= $film["resume_film"] ?></td>
        </tr>
    </tbody>
</table>

<?php $acteurs = $casting->fetchAll() ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ACTEUR</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($acteurs as $acteur) { /*f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, r.nom_role*/ ?>
            <tr>
                <td style="border: 1px solid black;"><a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></a></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php
$titre = $film["titre_film"];
$contenu = ob_get_clean();
require "view/template.php";

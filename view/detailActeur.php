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
            <td style="border: 1px solid black;"><?= $acteur["age_personne"] ?></td>
        </tr>
    </tbody>
</table>

<div class="film_container">
    <?php
    foreach ($filmographie->fetchAll() as $film) { ?>
        <div class="film">
            <div class="film_affiche">
                <figure>
                    <a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><img src="<?= $film["url_affiche_film"] ?>" alt=""></a>
                </figure>
                <div class="note_film">
                    <?= $film["note_film"] ?>
                </div>
            </div>
            <p class="film_infos">
                <a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a> <br>
                <?= $film["sortie_film"] ?>, <a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a>
            </p>
        </div>
    <?php } ?>

</div>

<?php
$titre = $acteur["prenom_personne"] . " " . $acteur["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";

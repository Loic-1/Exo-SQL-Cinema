<?php ob_start(); ?>

<div class="film_cont">
    <?php $film = $requeteDetailFilm->fetch(); ?>

    <div class="main_film">
        <h2><?= $film["titre_film"] ?></h2>

        <div class="affiche_film">
            <figure>
                <img src="<?= $film["url_affiche_film"] ?>" alt="">
            </figure>
        </div>
    </div>
    <div class="desc_film">
        <h3>Résumé</h3>
        <p><?= $film["resume_film"] == NULL ? "Ce film n'a pas de résumé." : $film["resume_film"] ?>
        </p>
    </div>
</div>

<h2 class="enonce_film">Détails <?= $film["titre_film"] ?></h2>

<div class="detail_cont">
    <table>
        <tr>
            <td>Date de sortie: </td>
            <td><?= date("d/m/Y", strtotime($film["date_sortie_film"]))   ?></p>
        </tr>
        </tr>
        <tr>
            <td>Genre: </td>
            <td><a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a></p>
        </tr>
        </tr>
        <tr>
            <td>Note des spectateurs: </td>
            <td><?= $film["note_film"] ?>/100</p>
        </tr>
        </tr>
    </table>
</div>

<h2 class="enonce_film">Production <?= $film["titre_film"] ?></h2>

<div class="acteur_container">
    <div class="acteur">
        <div class="acteur_affiche">
            <figure>
                <a href="index.php?action=detailReal&id=<?= $film["id_realisateur"] ?>"><img src="<?= $film["url_affiche_personne"] ?>" alt=""></a>
            </figure>
        </div>
        <p class="acteur_infos">
            <a href="index.php?action=detailReal&id=<?= $film["id_realisateur"] ?>"><?= $film["prenom_personne"] ?> <?= $film["nom_personne"] ?></a><br>
        </p>
    </div>

</div>

<h2 class="enonce_film">Casting <?= $film["titre_film"] ?></h2>

<div class="acteur_container">
    <?php
    foreach ($casting->fetchAll() as $acteur) { ?>
        <div class="acteur">
            <div class="acteur_affiche">
                <figure>
                    <a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><img src="<?= $acteur["url_affiche_personne"] ?>" alt=""></a>
                </figure>
            </div>
            <p class="acteur_infos">
                <a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></a><br>
            </p>
        </div>
    <?php } ?>

</div>

<?php
$titre = $film["titre_film"];
$contenu = ob_get_clean();
require "view/template.php";

<?php ob_start(); ?>

<div class="acteur_cont">
    <?php $real = $requeteDetailReal->fetch(); ?>

    <div class="main_acteur">
        <h2><?= $real["prenom_personne"] ?> <?= $real["nom_personne"] ?></h2>

        <div class="photo_acteur">
            <figure>
                <img src="<?= $real["url_affiche_personne"] ?>" alt="">
            </figure>
        </div>
    </div>
    <div class="desc_acteur">
        <h3>Biographie</h3>
        <p><?= $real["bio_personne"] == NULL ? "Cette personne n'a pas encore de biographie." : $real["bio_personne"] ?>
        </p>
    </div>
</div>

<h2 class="filmographie_acteur"> Filmographie de <?= $real["prenom_personne"] . " " . $real["nom_personne"] ?></h2>

<div class="film_container">
    <?php
    foreach ($filmographie->fetchAll() as $film) { ?>
        <div class="film">
            <div class="film_affiche">
                <figure>
                    <a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><img
                            src="<?= $film["url_affiche_film"] ?>" alt=""></a>
                </figure>
                <div class="note_film">
                    <?= $film["note_film"] ?>
                </div>
            </div>
            <p class="film_infos">
                <a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a> <br>
                <?= $film["sortie_film"] ?>, <a
                    href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a>
            </p>
        </div>
    <?php } ?>

</div>

<?php
$titre = $real["prenom_personne"] . " " . $real["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";

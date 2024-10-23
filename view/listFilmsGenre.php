<?php ob_start(); ?>

<div class="film_container">
    <?php
    foreach ($requeteListFilmsGenre->fetchAll() as $film) { ?>
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
                <?= $film["sortie_film"] ?>, <?= $film["libelle_genre"] ?>
            </p>
        </div>
    <?php } ?>

</div>

<?php
$titre = $film["libelle_genre"];
$contenu = ob_get_clean();
require "view/template.php";

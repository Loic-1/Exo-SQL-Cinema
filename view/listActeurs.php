<?php ob_start() ?>

<div class="acteur_container">
    <?php
    foreach ($requeteListActeurs->fetchAll() as $acteur) { ?>
        <div class="acteur">
            <div class="acteur_affiche">
                <figure>
                <a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><img src="<?= $acteur["url_affiche_personne"] ?>" alt=""></a>
                </figure>
            </div>
            <p class="acteur_infos">
                <a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><?= $acteur["prenom_personne"] ?> <?=$acteur["nom_personne"]?></a><br>
            </p>
        </div>
    <?php } ?>

</div>

<?php

$titre = "Liste des acteurs";
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";

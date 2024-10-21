<?php ob_start(); ?>

<?php $films = $requeteListFilmsGenre->fetchAll(); ?>


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
        <?php foreach ($films as $film) { /*f.id_film, f.titre_film, YEAR(f.sortie_film) AS sortie_film, g.libelle_genre, f.note_film, r.nom_role*/ ?>
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
$titre = $film["libelle_genre"];
$contenu = ob_get_clean();
require "view/template.php";

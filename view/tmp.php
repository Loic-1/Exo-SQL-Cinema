<!-- listFilms.php -->
<?php ob_start() ?>

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
        <?php
        // Met toutes les lignes dans un array
        foreach ($requeteListFilms->fetchAll() as $film) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $film["id_film"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["sortie_film"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

// Définit les paramètres qui serviront dans template.php
$titre = "Liste des films";
$titre_secondaire = "Liste des films";
$contenu = ob_get_clean();
require "view/template.php";

?>

<!-- listActeurs.php -->
<?php ob_start() ?>

<table class="uk-table uk-table-striped" style="border: 1px solid black; border-collapse: collapse;">
    <thead>
        <tr>
            <th style="border: 1px solid black;">ID (tmp)</th>
            <th style="border: 1px solid black;">ACTEUR</th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach ($requeteListActeurs->fetchAll() as $acteur) { ?>
            <tr>
                <td style="border: 1px solid black;"><?= $acteur["id_acteur"] ?></td>
                <td style="border: 1px solid black;"><a href="index.php?action=detailActeur&id=<?= $acteur["id_acteur"] ?>"><?= $acteur["prenom_personne"] ?> <?= $acteur["nom_personne"] ?></a></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php

$titre = "Liste des acteurs";
$titre_secondaire = "Liste des acteurs";
$contenu = ob_get_clean();
require "view/template.php";

?>

<!-- listFilmsGenre.php -->
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
?>

<!-- detailActeur.php -->
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
                <td style="border: 1px solid black;"><a href="index.php?action=detailFilm&id=<?= $film["id_film"] ?>"><?= $film["titre_film"] ?></a></td>
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
?>

<!-- detailFilm.php -->

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
?>

<!-- detailReal.php -->

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
                <td style="border: 1px solid black;"><a href="index.php?action=listFilmsGenre&id=<?= $film["id_genre"] ?>"><?= $film["libelle_genre"] ?></a></td>
                <td style="border: 1px solid black;"><?= $film["note_film"] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php
$titre = $real["prenom_personne"] . " " . $real["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";
?>
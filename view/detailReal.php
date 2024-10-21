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

<?php
$titre = $real["prenom_personne"] . " " . $real["nom_personne"];
$contenu = ob_get_clean();
require "view/template.php";

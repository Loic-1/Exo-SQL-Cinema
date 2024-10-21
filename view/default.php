<?php ob_start(); ?>

<section>
    <h2>À propos de nous</h2>
    <p>
        Le Cinéma XYZ est plus qu'une simple salle de projection. Situé au cœur de la ville, notre cinéma est le lieu
        idéal pour vivre une expérience cinématographique unique. Avec nos salles équipées des dernières technologies
        de projection et de son, vous plongerez dans l'univers des films comme jamais auparavant.
    </p>
    <p>
        Nous proposons une large sélection de films, allant des blockbusters hollywoodiens aux films indépendants et
        internationaux. Que vous soyez amateur de comédies, de drames, de films d'action ou de documentaires, vous
        trouverez toujours quelque chose qui vous captivera chez nous.
    </p>
</section>

<section>
    <h2>Événements à venir</h2>
    <p>
        Ne manquez pas nos événements spéciaux ! Au Cinéma XYZ, nous aimons célébrer le cinéma à travers des avant-premières exclusives,
        des festivals de films et des projections en plein air. Voici quelques événements à venir :
    </p>
    <ul>
        <li><strong>Festival du film indépendant</strong> - Du 10 au 15 novembre 2024. Une sélection des meilleurs films indépendants du monde entier.</li>
        <li><strong>Projection spéciale : Le Seigneur des Anneaux</strong> - Le 20 novembre 2024. Venez redécouvrir cette trilogie culte sur grand écran.</li>
        <li><strong>Soirée Halloween</strong> - Le 31 octobre 2024. Films d'horreur toute la nuit pour les amateurs de frissons !</li>
    </ul>
</section>

<section>
    <h2>Rejoignez notre communauté</h2>
    <p>
        Vous êtes passionné de cinéma ? Rejoignez notre communauté et profitez d'avantages exclusifs ! En devenant membre,
        vous bénéficierez de tarifs réduits sur toutes les séances, de la possibilité de réserver vos places à l'avance
        et de participer à des événements réservés aux membres.
    </p>
    <p>
        Inscrivez-vous dès aujourd'hui et recevez notre newsletter mensuelle pour ne rien manquer de l'actualité de notre cinéma et des films à venir.
    </p>
    <a href="#">S'inscrire</a>
</section>

<?php
$titre = "Home";
$contenu = ob_get_clean();
require "view/template.php";

<?php ob_start(); ?>
<p>Placeholder</p>
<?php
$titre = "Home";
$contenu = ob_get_clean();
require "view/template.php";

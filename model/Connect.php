<?php

namespace Model;

abstract class Connect
{
    // Constantes plus faciles à changer
    const HOST = "localhost";
    const DB = "cinema_loic";
    const USER = "root";
    const PASS = "";

    public static function seConnecter()
    {
        try {
            // Connexion entre un serveur BDD et PHP
            return new \PDO("mysql:host=" . self::HOST . ";dbname=" . self::DB . ";charset=utf8", self::USER, self::PASS);
        } catch (\PDOException $error) {
            return $error->getMessage();
        }
    }
}

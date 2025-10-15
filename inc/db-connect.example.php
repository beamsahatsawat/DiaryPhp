<?php

try {
    $pdo = new PDO('mysql:host=localhost;dbname=diary;charset=utf8mb4', 'your_username', 'your_password', [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
}
catch (PDOException $e) {
    echo 'A problem occurred with the database connection...';
    die();
}
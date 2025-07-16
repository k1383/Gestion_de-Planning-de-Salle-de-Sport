<?php
    
    // On recup les éléments du formulaire 

    $firstname = $_POST["firstname"];
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    echo"Bienvenue $firstname $name <br>";

    //  hashé le mot de passe de l'utilisateur 

    $hash = password_hash($password, PASSWORD_DEFAULT);
    // echo "$hash";

    require_once('../config/config.php');

    // Ajouts de l'utilisateur à la BDD

    function addUser($email, $hash, $firstname, $name){
        $stmt=$pdo->prepare('INSERT INTO users(email, password_hash, prenom, nom) VALUES(:email, :password_hash, :prenom, :nom)');
        $stmt->execute(array(
            'email' => $email,
            'password_hash' => $hash,
            'prenom' => $firstname,
            'nom' => $name
        ));
        
    }  // verif mon erreur

    // ($email, $hash, $firstname, $name);

    
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <br>
    <br>
    <a href="#">Voir votre planning</a>
    <br>
    <br>
    <a href="#">Réserver une séance</a>
    <br>
    <br>
    <a href="#">Annuler une réservation</a>
</body>
</html>
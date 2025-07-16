-- Création de la BDD `salle_de_sport` 

CREATE DATABASE IF NOT EXISTS `salle_de_sport`;
USE `salle_de_sport`;

-- Création de la table `users`

CREATE TABLE users (
id_user INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255),
password_hash VARCHAR(255),
prenom VARCHAR(20),
nom VARCHAR(20),
role ENUM('client', 'coach', 'gestionnaire'),
created_at TIME
) ENGINE = INNODB

-- Création de la table `activities`

CREATE TABLE activities (
id_activitie INT PRIMARY KEY AUTO_INCREMENT, 
label ENUM ('Yoga', 'Cardio', 'Zumba'),
description TEXT
) ENGINE = INNODB

-- Création de la table `sessions`

CREATE TABLE sessions (
id_session INT PRIMARY KEY AUTO_INCREMENT,
activity_id INT,
coach_id INT,
datetime DATETIME,
capacity INT,
created_at TIME,
CONSTRAINT fk_activity
FOREIGN KEY (activity_id)
REFERENCES activities (id_activitie),
CONSTRAINT fk_coach
FOREIGN KEY (coach_id)
REFERENCES users (id_user)
ON DELETE SET NULL
ON UPDATE CASCADE
) ENGINE = INNODB;

-- Création de la table `bookings`

CREATE TABLE bookings (
id_booking INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
session_id INT,
created_at TIME,
CONSTRAINT fk_user_id 
FOREIGN KEY (user_id) 
REFERENCES users(id_user),
CONSTRAINT fk_session_id 
FOREIGN KEY (session_id) 
REFERENCES sessions(id_session)
) ENGINE = InnoDB;
# **Gestion de Planning de Salle de Sport**

## Objectifs Pédagogiques

Ce mini-projet a pour but de vous entraîner à manipuler PHP et PDO pour créer un back-end d’application web. L’objectif est de développer les composants serveur permettant de gérer la réservation et la planification d’activités sportives en salle.

Ce projet vous permettra de pratiquer :

- La création d’un modèle relationnel cohérent
- La manipulation sécurisée de données via PDO
- L’écriture de requêtes SQL avec jointures, agrégations et conditions
- La gestion de rôles utilisateurs (client, coach, gestionnaire)
- La structuration d’un projet PHP avec séparation claire des responsabilités

## Contexte du Projet

Une salle de sport souhaite développer une application interne pour gérer les cours collectifs qu’elle propose à ses adhérents. Les utilisateurs pourront consulter les séances disponibles et réserver leur place. Les coachs, eux, peuvent proposer des séances et suivre les participants. Un gestionnaire aura une vue d’ensemble pour suivre les réservations et gérer les plannings.

Vous devez concevoir le back-end de ce système : gestion des utilisateurs, des séances sportives, des réservations et du rôle de chacun.

## User Stories

### US1 : Inscription d’un utilisateur

En tant que nouvel utilisateur, je veux pouvoir m’inscrire en ligne avec mes informations personnelles, afin de pouvoir réserver des séances.

### US2 : Connexion

En tant qu’utilisateur inscrit, je veux pouvoir me connecter pour accéder à mes réservations et consulter le planning.

### US3 : Consulter le planning des séances à venir

En tant qu’utilisateur connecté, je veux pouvoir voir les prochaines séances disponibles avec leur date, activité, coach et nombre de places restantes.

### US4 : Réserver une place à une séance

En tant qu’utilisateur connecté, je veux pouvoir réserver une place à une séance, tant qu’il reste de la disponibilité.

### US5 : Annuler une réservation

En tant qu’utilisateur connecté, je veux pouvoir annuler une de mes réservations, au plus tard 24h avant la séance.

### US6 : Proposer une nouvelle séance (coach)

En tant que coach, je veux pouvoir proposer une nouvelle séance (activité, date, heure, capacité), afin d’organiser un cours.

### US7 : Voir les participants à mes séances (coach)

En tant que coach, je veux voir la liste des inscrits à chacune de mes séances, afin de les accueillir correctement.

### US8 : Voir toutes les séances à venir (gestionnaire)

En tant que gestionnaire, je veux consulter toutes les séances planifiées, avec le nombre d’inscrits et le coach assigné.

### US9 : Supprimer une séance (gestionnaire)

En tant que gestionnaire, je veux pouvoir supprimer une séance prévue, afin de l’annuler et prévenir les utilisateurs concernés.

## Structure de la Base de Données

### Table `users`

- `id` : Clé primaire
- `email`
- `password_hash`
- `prenom`
- `nom`
- `role` (client, coach, gestionnaire)
- `created_at`

### Table `activities`

- `id` : Clé primaire
- `label` : Nom de l’activité (Yoga, Cardio, Zumba, etc.)
- `description` (facultatif)

### Table `sessions`

- `id` : Clé primaire
- `activity_id` : FK vers `activities`
- `coach_id` : FK vers `users`
- `datetime` : Date et heure de la séance
- `capacity` : Nombre de places disponibles
- `created_at`

### Table `bookings`

- `id` : Clé primaire
- `user_id` : FK vers `users`
- `session_id` : FK vers `sessions`
- `created_at`

**Contraintes importantes :**

- Un utilisateur ne peut pas réserver deux fois la même séance.
- Une séance ne peut pas dépasser sa capacité maximale.
- Une réservation ne peut pas être annulée à moins de 24h de la séance (niveau logique métier).

## Technologies Requises

- **PHP 7.4+** : Composants backend
- **PDO** : Accès à la base de données
- **MySQL** : Stockage des données
- **Requêtes préparées** : Obligatoires
- **Hashage des mots de passe** : `password_hash()` / `password_verify()`

## Fonctionnalités Obligatoires à Implémenter

- US1 : Inscription
- US2 : Connexion
- US3 : Voir le planning
- US4 : Réserver une séance
- US5 : Annuler une réservation

## Fonctionnalités Recommandées

- US6 : Proposer une séance (coach)
- US7 : Voir les participants (coach)
- US8 : Voir toutes les séances (gestionnaire)

## Fonctionnalités Bonus

- US9 : Supprimer une séance (gestionnaire)

## Livrables Attendus

- Fichier `README.md`
    - Description du projet
    - Instructions d’installation
    - Structure BDD + script SQL fourni
    - Fonctionnalités implémentées
- Code source PHP (backend)
    - Fichiers organisés par entité (User.php, Session.php, Booking.php)
    - `config.php` pour la connexion à la BDD
- Script `database.sql`
    - Création des tables
    - Données de test : 3 coaches, 5 clients, 3 activités, 6 séances

## Conseils de Travail

- Commencez par la BDD et les fichiers de base
- Implémentez les fonctionnalités obligatoires d’abord
- Utilisez `try/catch` et `password_hash()` systématiquement
- Testez chaque fonction dans un petit script à part

## Conclusion

Ce mini-projet est une très bonne préparation pour vous familiariser avec la logique métier, la structuration du code PHP, l’accès aux données via PDO et la gestion de rôles utilisateurs dans une application web dynamique.

Prenez le temps de faire proprement les fonctionnalités de base. Documentez bien votre travail, organisez votre code, et testez tout ce que vous produisez.
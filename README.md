###Blog créé à l'aide du Framework Symfony dans le cadre du M2 AIGLE de l'université de Montpellier

####Objectif

Afin de mettre en pratique l'utilisation du framework Symfony2, nous avions pour objectif de réaliser un blog

####Les membres du groupe

Brice Vico
Eymard Mamene-Mokosson
Théo Chambon

####Notre blog 

Le blog est en en HTLM5 (sémantique et valide) et utilise le framework CSS Bootstrap.

Le blog implémente FosUserBundle pour se connecter.

Les fonctionnalités du blog: 
* Connexion
* Gestion d'un post (création /modification / suppression) 
* Ajout de catégorie
* Ajout de commentaires sur les posts

Nous nous sommes concentrés que sur la réalisation de ces fonctionnalités car pour nous elles sont les fonctionnalités de base que doivent avoir d'un blog. 


####Utilisation

Pour les tests du blog :
* Utilisateurs : admin/admin (compte administrateur) ou testuser/azerty (compte classique)
* Deux "dump sql" sont disponibles pour remplir la base avec quelques exemples et mettre en evidence la pagination et les catégories :
    * blog-full-structure.sql, permettant de créer la structure et de remplir les tables.
    * blog-insert-only.sql, permet de remplir les tables précédemment créée avec la commande Doctrine.


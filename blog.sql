-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 04 Décembre 2015 à 18:07
-- Version du serveur :  5.6.24
-- Version de PHP :  5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

CREATE TABLE IF NOT EXISTS `cat` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descr` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `cat`
--

INSERT INTO `cat` (`id`, `nom`, `descr`) VALUES
(1, 'Informatique', 'Tout les posts traitant des nouvelles technologies'),
(2, 'Autres', 'Sans catégories'),
(3, 'Programmation', 'Toutes les news des langages de programmation'),
(4, 'Jeux vidéo', 'Posts traitant de jeux vidéos');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `published` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `author_id`, `post_id`, `content`, `published`) VALUES
(1, 1, 10, 'Très bien, mais beaucoup trop chers !', '2015-12-04 18:01:50'),
(2, 1, 9, 'Il était temps !', '2015-12-04 18:02:07'),
(3, 2, 10, 'Bien d''accord...', '2015-12-04 18:04:38');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `published` datetime NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `titre`, `slug`, `content`, `published`, `cat_id`, `author_id`) VALUES
(1, 'Sortie de PHP 7 !', 'sortie-php-7', 'Avec PHP 7, c’est une grande partie des sites web qui va profiter de performances doublées. Une avancée majeur pour Internet et le monde des CMS.\r\n\r\nC’est aujourd’hui que PHP 7 devrait faire son entrée. Au menu, des performances en nette hausse. Un point que nous avions évoqué en septembre dans l’article « PHP 7 promet de doubler les performances de PHP 5 ».\r\n\r\nEn résumé, PHP 7 devrait proposer des performances plus que doublées par rapport à PHP 5.6. Il constituera alors une alternative crédible à HHVM (développé par Facebook). Moins rapide, PHP 7 consomme toutefois beaucoup moins de mémoire vive que HHVM.\r\n\r\nUne révolution pour le web\r\n\r\nPeu de nouveautés fonctionnelles sont de la partie (une liste est proposée sur le site du projet). Cependant, le gain en performances devrait à lui seul révolutionner le monde PHP… et l’ensemble de la Toile.\r\n\r\nDeux fois plus rapide, et demandant un tiers de mémoire vive de moins, PHP 7 va en effet permettre de réduire fortement les besoins en ressources des serveurs, et donc leur taille, nombre et consommation électrique globale. En pleine Cop21, voilà qui est intéressant.\r\n\r\nCette évolution va booster globalement le monde du web. Rappelons en effet que 43 % des sites web utilisent aujourd’hui un CMS, avec comme leader WordPress, employé sur plus de 25 % des sites (voir l’article « WordPress anime 25 % du web ») et écrit en PHP. Une puissance doublée sur ¼ des sites de la Toile, voilà qui devrait se ressentir sur la charge globale appliquée aux serveurs.', '2015-12-03 14:33:33', 3, 1),
(8, 'Arrêt de Dorkbot, un botnet d''un million de PC', 'arret-darkbot-botnet', 'Microsoft a annoncé récemment avoir mené à bien une opération coordonnée contre un important botnet, créé via le malware Dorkbot. Ce n''est pas le premier réseau que le groupe démantèle - avec le concours des forces de l''ordre - mais Dorkbot était particulièrement important, avec plus d’un million de PC infectés.\r\n\r\nUn botnet est un réseau de machines zombies. Il s’agit d’un maillage constitué de PC qui ont été infectés par un malware bien particulier qui, en plus de voler des informations, peut être piloté à distance. Plus il y a de machines infectées par le même malware, plus le botnet grandit et plus le pirate qui le contrôle gagne en puissance. Car l’aspect spécifique d’un botnet est qu’une seule personne peut faire effectuer à des centaines de milliers de machines une action particulière, comme générer du spam ou déclencher des attaques distribuées par déni de service (DDoS).\r\n\r\nLa lutte contre les botnets demande des efforts coordonnés, comme l’indiquait récemment le spécialiste Éric Freyssinet dans nos colonnes. De nombreux aspects doivent être pris en compte, outre le simple fait d’intervenir pour couper les liens entre les machines et le serveur utilisé pour les contrôler. Au-delà de la technique, il prendre en compte l''intérêt financier : il est possible de payer pour générer du spam ou pour s’en prendre à une cible particulière.\r\n\r\n100 000 nouvelles machines infectées par mois\r\n\r\nPour Dorkbot, Microsoft s’est associée à plusieurs partenaires : la société de sécurité ESET (éditrice de l’antivirus NOD32), le Département américain de la sécurité intérieure, Europol, le FBI, Interpol ou encore le Computer Emergency Response Team (CERT) de Pologne. Les techniques utilisées pour démembrer ce puissant botnet, qui comptait plus d’un million de machines, n’ont pas été révélées. Pas question d''indiquer publiquement les moyens et outils mis en œuvre. Mais le rythme de croissance du botnet Dorkbot était devenu inquiétant, avec 100 000 nouvelles machines contaminées environ par mois sur les six derniers mois.\r\n\r\nPour autant, ce botnet n’était pas nouveau, les premières traces de son existence remontant à 2011. L’opération pour s’y attaquer a nécessité une coordination internationale qui a visiblement mis un certain temps à se mettre en place. Le Microsoft Malware Protection Center avait en effet publié dès 2012 une analyse de Dorkbot en deux parties, dans lesquelles l’entreprise présentait les dangers d’un réseau qui grandissait.\r\n\r\nUne prédilection pour les vieux PC sans protection\r\n\r\nL’éditeur indique que Windows Defender et l’ensemble des antivirus sont capables de détecter Dorkbot depuis un moment. Les machines infectées sont donc celles qui ne sont pas protégées par une telle barrière et qui ont un Windows trop ancien pour inclure l’antivirus maison. On pense tout de suite aux dizaines de millions de PC encore sous Windows XP, alors même que le support technique du vieux système s’est terminé le 8 avril de l’an dernier. Nous avions alors souligné les dangers inhérents de laisser en fonctionnement des machines où les failles de sécurité ne pouvaient que s’accumuler avec le temps.\r\n\r\nDe fait, la répartition des PC contaminés sur les six derniers mois n’est pas étonnant. 21 % des infections ont eu lieu en Inde, 17 % en Indonésie, 16 % en Russie, 14 % en Argentine. La Chine, elle, comptait seulement pour 4 % des contaminations.\r\n\r\nLa coordination, décidément l''élément clé\r\n\r\nMicrosoft affiche finalement un discours qui ressemble largement à celui d’Éric Freyssinet en amont de la conférence Botconf 2015 : les efforts doivent être concertés pour détruire les botnets de manière efficace et durable. La firme indique par exemple que les éditeurs de solutions de sécurité doivent s’échanger leur savoir-faire, que les institutions financières doivent mieux identifier les flux frauduleux pour tarir les flux d’argent, et que les forces de l’ordre allient leurs efforts pour trouver finalement les auteurs. \r\n\r\nNotez enfin que si Dorkbot et son million de machines infectées est une prise importante, il ne s''agit pas du plus gros botnet auquel se soit attaqué l''entreprise. En décembre 2013, aidée par le FBI et Europol, elle avait ainsi coupé l''accès à un botnet de deux millions de machines nommé ZeroAccess.', '2015-12-01 15:28:19', 1, 1),
(9, 'Steam : il est enfin possible de supprimer un jeu de son compte', 'steam-:-il-est-enfin-possible-de-supprimer-un-jeu-de-son-compte', 'Certains attendaient cette fonctionnalité depuis longtemps, elle est désormais là. Valve permet de supprimer définitivement un jeu de son compte Steam. Un excellent moyen pour certains de se débarrasser des preuves d''un achat un peu trop impulsif. \r\n\r\nSteam permet à tout un chacun de centraliser une grande partie de sa ludothèque au sein d''une seule interface. Si cela a bien des côtés pratiques, au fil des années et des jeux qui s''entassent, il est possible de se retrouver face à des erreurs de parcours que l''on n''assume pas forcément, des titres issus de bundles qui même d''ici trois ans n''auront aucune chance de sortir du fameux « backlog ».\r\n\r\nPour y voir un peu plus clair dans la liste de ses jeux, Valve propose déjà d''en masquer certains dans la liste du client Steam. Il suffit pour cela de faire un clic droit sur le titre concerné et de choisir « définir des catégories » puis de cocher la case « cacher ce jeu de ma bibliothèque ». \r\n\r\nCette manipulation ne fait par contre que masquer le jeu localement. Votre temps de jeu et sa présence dans votre bibliothèque sont toujours signalés sur votre profil public Steam, et tout le monde n''assume pas forcément d''avoir passé une vingtaine d''heures sur un Visual Novel nippon un peu fripon. Oui, Valve propose ce type de contenus depuis maintenant quelques mois.\r\n\r\nL''éditeur permet désormais de supprimer définitivement un titre de la bibliothèque du joueur. Il suffit pour cela d''aller sur cette page, de taper le nom du jeu concerné et de choisir « Je veux supprimer définitivement ce jeu de mon compte ». Un écran de confirmation apparait alors, et vous pouvez confirmer la manipulation. La suppression d''un jeu est définitive et ne donne droit à aucune forme de remboursement. \r\n\r\nIl est important de prendre le temps de regarder l''écran de confirmation avant de supprimer un jeu. Dans le cas où un titre a été obtenu en utilisant un code regroupant plusieurs jeux (comme lors des premiers Humble Bundle), l''ensemble des jeux partageant la même clé sont supprimés dans la foulée. Prudence donc.', '2015-12-04 17:58:02', 4, 1),
(10, 'Apple fabriquerait les ordinateurs portables les plus fiables', 'apple-fabriquerait-les-ordinateurs-portables-les-plus-fiables', 'Selon une récente étude, Apple fabriquerait les ordinateurs portables les plus fiables du marché.\r\n\r\nLe magazine américain Consumer Report, géré par une association de consommateurs, a publié un nouveau rapport qui ne manquera certainement pas de raviver l''éternel débat entre Mac et PC. Cette fois, ils se sont intéressés à la fiabilité des ordinateurs portables actuellement disponibles sur le marché.\r\n\r\nPour mener à bien son enquête, Consumer Report a effectué une étude auprès de 58 000 personnes ayant acheté un ordinateur portable entre 2010 et 2015. Les produits d''Apple sont ainsi positionnés en tête.\r\n\r\nPlus précisément, le MacBook Air aurait obtenu un taux de panne de 7%. Il s''agirait ainsi de la machine la plus fiable du marché. Mais la firme de Cupertino domine également ce classement avec un ordinateur : le MacBook Pro, avec un taux de 9%.', '2015-12-04 17:59:22', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'admin', 'admin', 'theo.chambon1@gmail.com', 'theo.chambon1@gmail.com', 1, 'jmsy4bdmk68gcwwggckcoo4wowwosoo', '$2y$13$jmsy4bdmk68gcwwggckcoey1rvXGrhGPa7A1Q/NmZcAehqYgb3xZ6', '2015-12-04 17:57:17', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(2, 'testuser', 'testuser', 'testuser@testuser.com', 'testuser@testuser.com', 1, 'f5arslvd714c4oooo84ggswk4ck84sk', '$2y$13$f5arslvd714c4oooo84ggeHjJYzwXnol5LE694G7Q7MajOhLABg/i', '2015-12-04 18:04:25', 0, 0, NULL, '9HNyGiBscK-3e6OufJ77ygje4RJ4oXncy12LrNtkNM4', '2015-12-04 18:04:18', 'a:0:{}', 0, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CF675F31B` (`author_id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DE6ADA943` (`cat_id`),
  ADD KEY `IDX_5A8A6C8DF675F31B` (`author_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DE6ADA943` FOREIGN KEY (`cat_id`) REFERENCES `cat` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

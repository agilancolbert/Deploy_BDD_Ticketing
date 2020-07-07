-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 16 juil. 2019 à 08:59
-- Version du serveur :  5.7.26
-- Version de PHP :  5.6.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ticketing`
--

CREATE DATABASE ticketing;
use ticketing;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`) VALUES
(6, 'Renault'),
(5, 'Paris 13e'),
(4, 'Client Test'),
(7, 'TaxiCom'),
(8, 'Amazon'),
(9, 'Peugeot');

-- --------------------------------------------------------

--
-- Structure de la table `interventions`
--

DROP TABLE IF EXISTS `interventions`;
CREATE TABLE IF NOT EXISTS `interventions` (
  `id` int(6) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `technicien` varchar(20) NOT NULL,
  `intervention` text NOT NULL,
  PRIMARY KEY (`id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interventions`
--

INSERT INTO `interventions` (`id`, `date`, `technicien`, `intervention`) VALUES
(2, '2019-07-08 10:10:30', 'acarnez', 'test'),
(2, '2019-07-08 10:11:03', 'acarnez', 'czeczecze'),
(3, '2019-07-08 10:15:31', 'acarnez', 'Ticket affecté à avilledieu par acarnez'),
(3, '2019-07-08 10:16:35', 'acarnez', 'fzefzef'),
(3, '2019-07-08 10:16:42', 'acarnez', 'Ticket clôturé le 08/07/2019 10:16:42 par acarnez'),
(4, '2019-07-15 08:42:37', 'acarnez', 'Ticket affecté à olariviere par acarnez'),
(4, '2019-07-15 08:46:04', 'olariviere', 'Bonjour'),
(5, '2019-07-15 09:05:18', 'bkarim', 'Ticket affecté à bkarim par bkarim'),
(5, '2019-07-15 09:05:24', 'bkarim', 'fermer'),
(5, '2019-07-15 09:05:26', 'bkarim', 'Ticket clôturé le 15/07/2019 09:05:26 par bkarim'),
(4, '2019-07-15 10:48:02', 'acarnez', 'Ticket clôturé le 15/07/2019 10:48:02 par acarnez'),
(6, '2019-07-15 10:55:01', 'acarnez', 'szdsaz'),
(6, '2019-07-15 10:55:06', 'acarnez', 'Ticket clôturé le 15/07/2019 10:55:06 par acarnez'),
(2, '2019-07-15 10:56:55', 'acarnez', 'Ticket clôturé le 15/07/2019 10:56:55 par acarnez'),
(7, '2019-07-15 11:21:43', 'acarnez', 'dzadaz'),
(7, '2019-07-15 11:21:46', 'acarnez', 'Ticket clôturé le 15/07/2019 11:21:46 par acarnez'),
(8, '2019-07-15 22:57:10', 'acarnez', 'Intervention prévu le 16/09'),
(12, '2019-07-16 09:03:37', 'tajout', 'Nouvelle intervention'),
(12, '2019-07-16 09:03:42', 'tajout', 'Ticket clôturé le 16/07/2019 09:03:42 par tajout'),
(9, '2019-07-16 10:24:09', 'acarnez', 'Ticket affecté à acarnez par acarnez'),
(13, '2019-07-16 10:29:50', 'mjean', 'Ticket affecté à alahlou par mjean'),
(13, '2019-07-16 10:29:54', 'mjean', 'gegezgezgez'),
(13, '2019-07-16 10:29:57', 'mjean', 'dazdaz'),
(13, '2019-07-16 10:30:36', 'mjean', 'Ticket clôturé le 16/07/2019 10:30:36 par mjean');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `Id_ticket` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Destinataire` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`Id_ticket`, `Description`, `Destinataire`) VALUES
(12, 'Une intervention a été ajoutée par tajout', 'alahlou'),
(12, 'Le ticket a été clôturé par tajout', 'alahlou'),
(13, 'Le ticket a été assigné à alahlou', 'alahlou'),
(13, 'Une intervention a été ajoutée par mjean', 'alahlou'),
(13, 'Une intervention a été ajoutée par mjean', 'alahlou'),
(13, 'Le ticket a été clôturé par mjean', 'alahlou');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `client` text NOT NULL,
  `description` text,
  `titre` varchar(100) NOT NULL DEFAULT '',
  `importance` int(1) NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL,
  `createur` varchar(25) NOT NULL,
  `technicien` varchar(30) NOT NULL,
  `technicienCloture` varchar(4) NOT NULL,
  `dateCloture` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `client`, `description`, `titre`, `importance`, `date`, `createur`, `technicien`, `technicienCloture`, `dateCloture`) VALUES
(3, 'Paris 13e', 'dzadazdazdazdazdzedd\r\nzfzadzf\r\nzef\r\nerg\r\nergerz', 'TEst', 0, '2019-07-08 08:14:32', 'acarnez', 'avilledieu', '', NULL),
(2, 'Client Test', 'daz', 'dza', 0, '2019-07-08 08:04:10', 'acarnez', 'acarnez', '', NULL),
(4, 'Client Test', 'sza', 'sza', 0, '2019-07-15 06:42:29', 'acarnez', 'olariviere', '', NULL),
(5, 'Paris 13e', 'za', 'za', 0, '2019-07-15 07:05:08', 'bkarim', 'bkarim', '', NULL),
(6, 'Paris 13e', 'dza', 'dza', 0, '2019-07-15 08:48:23', 'acarnez', 'acarnez', '', NULL),
(7, 'Paris 13e', 'azda', 'dzad', 0, '2019-07-15 09:21:38', 'acarnez', 'acarnez', '', NULL),
(8, 'Amazon', 'Amazon en galère', 'Test modifié', 1, '2019-07-15 16:53:02', 'acarnez', 'acarnez', '', NULL),
(9, 'Amazon', 'prblm de connexion à la base de donénes', 'Problème de connexion', 1, '2019-07-15 20:46:10', 'acarnez', 'acarnez', '', NULL),
(10, 'Renault', 'Message d\'erreur à l\'ouverture du ticket', 'Message d\'erreur', 1, '2019-07-15 20:47:02', 'alahlou', 'alahlou', '', NULL),
(11, 'TaxiCom', 'Création de compte demandé dans le nouveau logiciel ', 'Création d\'utilisateur', 1, '2019-07-15 20:47:39', 'alahlou', 'olariviere', '', NULL),
(12, 'TaxiCom', 'Le module de recette est désactivé', 'Module de recette', 0, '2019-07-16 06:57:00', 'acarnez', 'alahlou', '', NULL),
(13, 'Renault', 'Chaine de montage défectueuse', 'Problème dans la chaine', 0, '2019-07-16 07:00:36', 'acarnez', 'alahlou', '', NULL),
(14, 'Renault', 'problème', 'titre du ticket', 2, '2019-07-16 08:27:38', 'mjean', 'alahlou', '', NULL),
(15, 'Peugeot', 'problème', 'titre', 2, '2019-07-16 08:28:13', 'acarnez', 'acarnez', '', NULL),
(16, 'Peugeot', 'dazdzad', 'nouveaux titre', 2, '2019-07-16 08:28:45', 'mjean', 'mjean', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  `Prenom` varchar(30) NOT NULL,
  `Pseudo` varchar(30) NOT NULL,
  `Mdp` varchar(80) NOT NULL DEFAULT '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',
  `Admin` tinyint(1) NOT NULL,
  `Actif` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `Nom`, `Prenom`, `Pseudo`, `Mdp`, `Admin`, `Actif`) VALUES
(2, 'LARIVIERE', 'Odran', 'olariviere', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 1, 1),
(8, 'LAHLOU', 'Abdelkrim', 'alahlou', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 1, 1),
(9, 'CARNEZ', 'Axel', 'acarnez', '1503b284ad39ec51e57a1ed8cf4ed4e802f9a93d', 1, 1),
(10, 'BAZIZI', 'Karim', 'bkarim', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 0),
(11, 'AJOUT', 'Test', 'tajout', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 0),
(12, 'JEAN', 'michel', 'mjean', '9cf95dacd226dcf43da376cdb6cbba7035218921', 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client` ADD FULLTEXT KEY `nom` (`nom`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets` ADD FULLTEXT KEY `cds` (`client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

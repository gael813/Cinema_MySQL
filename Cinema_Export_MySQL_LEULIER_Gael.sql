-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 18 fév. 2022 à 15:02
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinéma`
--

-- --------------------------------------------------------

--
-- Structure de la table `cinémas`
--

DROP TABLE IF EXISTS `cinémas`;
CREATE TABLE IF NOT EXISTS `cinémas` (
  `id_cinema` char(36) NOT NULL,
  `nom_cinema` varchar(50) NOT NULL,
  `contient` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_cinema`),
  KEY `contient` (`contient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cinémas`
--

INSERT INTO `cinémas` (`id_cinema`, `nom_cinema`, `contient`) VALUES
('98348826-9001-11ec-9fe4-00090ffe0001', 'Ymax', '0f1a878d-8fce-11ec-9fe4-00090ffe0001'),
('92d3bfb4-8ff6-11ec-9fe4-00090ffe0001', 'paté', '0f1a878d-8fce-11ec-9fe4-00090ffe0001'),
('ce63fc67-8fff-11ec-9fe4-00090ffe0001', 'gromont', '0f1a878d-8fce-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` char(36) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `etudiant` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `age`, `etudiant`) VALUES
('ec24c88f-9005-11ec-9fe4-00090ffe0001', 'John Doe', 25, 1),
('19ab1ad3-9006-11ec-9fe4-00090ffe0001', 'Jim Square', 39, 0),
('577f82f5-9006-11ec-9fe4-00090ffe0001', 'Kevin Lamouche', 13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `complexe`
--

DROP TABLE IF EXISTS `complexe`;
CREATE TABLE IF NOT EXISTS `complexe` (
  `id_complexe` char(36) NOT NULL,
  PRIMARY KEY (`id_complexe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `complexe`
--

INSERT INTO `complexe` (`id_complexe`) VALUES
('0f1a878d-8fce-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` char(36) NOT NULL,
  `nom_film` varchar(50) NOT NULL,
  `passe` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `passe` (`passe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `nom_film`, `passe`) VALUES
('75fee042-8ffa-11ec-9fe4-00090ffe0001', 'Avator', 'c58489c4-8ff8-11ec-9fe4-00090ffe0001'),
('ffa38866-9000-11ec-9fe4-00090ffe0001', 'Retour vers le présent', 'c4150448-9000-11ec-9fe4-00090ffe0001'),
('2d93e6cb-9002-11ec-9fe4-00090ffe0001', 'Indiana fonce', 'f7d46489-9001-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `paiement_en_ligne`
--

DROP TABLE IF EXISTS `paiement_en_ligne`;
CREATE TABLE IF NOT EXISTS `paiement_en_ligne` (
  `id_enligne` char(36) NOT NULL,
  `tarif` float DEFAULT NULL,
  `enligne` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_enligne`),
  KEY `enligne` (`enligne`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiement_en_ligne`
--

INSERT INTO `paiement_en_ligne` (`id_enligne`, `tarif`, `enligne`) VALUES
('2f8054d9-8fff-11ec-9fe4-00090ffe0001', NULL, '8ce37861-8ffd-11ec-9fe4-00090ffe0001'),
('38eebc92-9001-11ec-9fe4-00090ffe0001', NULL, '19327f8c-9001-11ec-9fe4-00090ffe0001'),
('58ec6244-9002-11ec-9fe4-00090ffe0001', NULL, '4296ff2f-9002-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `paiement_sur_place`
--

DROP TABLE IF EXISTS `paiement_sur_place`;
CREATE TABLE IF NOT EXISTS `paiement_sur_place` (
  `id_surplace` char(36) NOT NULL,
  `tarif` float DEFAULT NULL,
  `surplace` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_surplace`),
  KEY `surplace` (`surplace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiement_sur_place`
--

INSERT INTO `paiement_sur_place` (`id_surplace`, `tarif`, `surplace`) VALUES
('6a5ac590-8fff-11ec-9fe4-00090ffe0001', NULL, '8ce37861-8ffd-11ec-9fe4-00090ffe0001'),
('5c9906b1-9001-11ec-9fe4-00090ffe0001', NULL, '19327f8c-9001-11ec-9fe4-00090ffe0001'),
('668468e5-9002-11ec-9fe4-00090ffe0001', NULL, '4296ff2f-9002-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` varchar(36) NOT NULL,
  `numero_salle` int(3) NOT NULL,
  `nombre_places` int(3) NOT NULL,
  `salle_pleine` tinyint(1) NOT NULL,
  `comporte` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id_salle`),
  UNIQUE KEY `numéro_salle` (`numero_salle`),
  KEY `comporte` (`comporte`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `numero_salle`, `nombre_places`, `salle_pleine`, `comporte`) VALUES
('6a098098-8ff7-11ec-9fe4-00090ffe0001', 1, 30, 0, '92d3bfb4-8ff6-11ec-9fe4-00090ffe0001'),
('5df9ffca-9000-11ec-9fe4-00090ffe0001', 2, 28, 0, 'ce63fc67-8fff-11ec-9fe4-00090ffe0001'),
('b440ba2a-9001-11ec-9fe4-00090ffe0001', 3, 20, 0, '98348826-9001-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `séance`
--

DROP TABLE IF EXISTS `séance`;
CREATE TABLE IF NOT EXISTS `séance` (
  `id_seance` char(36) NOT NULL,
  `horaire_debut` time NOT NULL,
  `horaire_fin` time NOT NULL,
  `date` date NOT NULL,
  `propose` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `propose` (`propose`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `séance`
--

INSERT INTO `séance` (`id_seance`, `horaire_debut`, `horaire_fin`, `date`, `propose`) VALUES
('c58489c4-8ff8-11ec-9fe4-00090ffe0001', '21:00:00', '22:30:00', '2022-02-05', '6a098098-8ff7-11ec-9fe4-00090ffe0001'),
('c4150448-9000-11ec-9fe4-00090ffe0001', '18:00:00', '19:30:00', '2022-02-06', '5df9ffca-9000-11ec-9fe4-00090ffe0001'),
('f7d46489-9001-11ec-9fe4-00090ffe0001', '10:00:00', '13:30:00', '2022-02-04', 'b440ba2a-9001-11ec-9fe4-00090ffe0001');

-- --------------------------------------------------------

--
-- Structure de la table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
CREATE TABLE IF NOT EXISTS `tarifs` (
  `id_tarif` char(36) NOT NULL,
  `plein_tarif` float(2,2) DEFAULT NULL,
  `étudiant` float(2,2) DEFAULT NULL,
  `enfant` float(2,2) DEFAULT NULL,
  `prix` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_tarif`),
  KEY `prix` (`prix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tarifs`
--

INSERT INTO `tarifs` (`id_tarif`, `plein_tarif`, `étudiant`, `enfant`, `prix`) VALUES
('8ce37861-8ffd-11ec-9fe4-00090ffe0001', NULL, NULL, NULL, 'c58489c4-8ff8-11ec-9fe4-00090ffe0001'),
('19327f8c-9001-11ec-9fe4-00090ffe0001', NULL, NULL, NULL, 'c4150448-9000-11ec-9fe4-00090ffe0001'),
('4296ff2f-9002-11ec-9fe4-00090ffe0001', NULL, NULL, NULL, 'f7d46489-9001-11ec-9fe4-00090ffe0001');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

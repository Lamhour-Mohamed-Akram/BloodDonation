-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 05 Août 2020 à 19:39
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `appblooddonation`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

CREATE TABLE IF NOT EXISTS `affectation` (
  `id_affectation` int(11) NOT NULL AUTO_INCREMENT,
  `id_donation` int(11) NOT NULL,
  `id_beneficiation` int(11) NOT NULL,
  `id_expert` int(11) NOT NULL,
  `date_affectation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_affectation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `affectation`
--

INSERT INTO `affectation` (`id_affectation`, `id_donation`, `id_beneficiation`, `id_expert`, `date_affectation`) VALUES
(1, 1, 1, 1, '2020-07-29 13:03:08'),
(4, 2, 2, 2, '2020-08-05 15:42:10');

-- --------------------------------------------------------

--
-- Structure de la table `beneficiation`
--

CREATE TABLE IF NOT EXISTS `beneficiation` (
  `id_beneficiation` int(11) NOT NULL AUTO_INCREMENT,
  `groupe_sangaire` varchar(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_beneficier` int(11) NOT NULL,
  `etat_beneficiation` int(11) NOT NULL,
  `date_beneficiation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_beneficiation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `beneficiation`
--

INSERT INTO `beneficiation` (`id_beneficiation`, `groupe_sangaire`, `quantite`, `id_beneficier`, `etat_beneficiation`, `date_beneficiation`) VALUES
(1, 'O+', 250, 4, 2, '2020-07-26 16:30:46'),
(2, 'A+', 250, 3, 2, '2020-07-28 09:06:33'),
(3, 'A+', 250, 3, -1, '2020-07-28 11:40:48');

-- --------------------------------------------------------

--
-- Structure de la table `donation`
--

CREATE TABLE IF NOT EXISTS `donation` (
  `id_donation` int(11) NOT NULL AUTO_INCREMENT,
  `poids_donneur` float NOT NULL,
  `taille_donneur` float NOT NULL,
  `groupe_sangaire` varchar(11) NOT NULL,
  `id_donneur` int(11) NOT NULL,
  `etat_donation` int(11) NOT NULL,
  `date_donation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_donation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `donation`
--

INSERT INTO `donation` (`id_donation`, `poids_donneur`, `taille_donneur`, `groupe_sangaire`, `id_donneur`, `etat_donation`, `date_donation`) VALUES
(1, 75.1, 1.7, 'O+', 4, 2, '2020-07-26 16:27:14'),
(2, 62, 1.7, 'A+', 5, 2, '2020-07-28 09:28:37'),
(3, 87, 1.75, 'O+', 4, 0, '2020-07-28 11:40:25');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(255) NOT NULL AUTO_INCREMENT,
  `sujet_message` varchar(100) NOT NULL,
  `contenu_message` text NOT NULL,
  `date_envoie` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `etat_message` int(10) DEFAULT NULL,
  `id_envoyer` int(255) NOT NULL,
  `id_recevoir` int(255) NOT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id_message`, `sujet_message`, `contenu_message`, `date_envoie`, `etat_message`, `id_envoyer`, `id_recevoir`) VALUES
(1, 'sujet', 'contenu du mon message ... ', '2020-07-26 00:21:37', -1, 3, 1),
(2, 'sujet du deuxieme message', 'contenu du deuxieme messages ...', '2020-07-26 00:21:37', -1, 2, 1),
(4, 'sujet', 'contenu du deuxieme messages ...', '2020-07-26 00:21:44', -1, 2, 1),
(5, 'test sujet ', '                                Contenu.\n                            ', '2020-07-28 11:39:00', -1, 3, 1),
(6, 'sujet ...', '                                Contenu.\n                            ', '2020-07-28 11:47:39', -1, 1, 3),
(8, 'mon sujet ..', 'contenu du mon message ...', '2020-08-05 15:18:35', -1, 9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(225) NOT NULL,
  `prenom_personne` varchar(225) NOT NULL,
  `login_personne` varchar(225) NOT NULL,
  `password_personne` varchar(225) NOT NULL,
  `cin_personne` varchar(225) NOT NULL,
  `tel_personne` varchar(225) NOT NULL,
  `adresse_personne` varchar(1000) NOT NULL,
  `date_naissance` date NOT NULL,
  `id_profil` int(11) DEFAULT NULL,
  `role_personne` varchar(255) NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sex` varchar(100) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom_personne`, `prenom_personne`, `login_personne`, `password_personne`, `cin_personne`, `tel_personne`, `adresse_personne`, `date_naissance`, `id_profil`, `role_personne`, `date_inscription`, `sex`) VALUES
(1, 'Azzouazi', 'Mohamed ', 'admin@gmail.com', '1234567890', 'bb1234', '0668778355', 'hay moulay rechide', '1998-02-25', 1, 'admin', '2020-07-21 15:40:24', 'homme'),
(2, 'Lamhour', 'Mohamed akram', 'expert@gmail.com', '1234567890', 'bb1234', '0668778355', 'hay moulay rechide', '1990-07-09', 2, 'expert', '2020-07-21 15:48:52', 'homme'),
(3, 'Msalek', 'Mohamed', 'utilisateur@gmail.com', '1234567890', 'bb1234', '0668778355', 'hay moulay rechide', '1998-07-04', 3, 'utilisateur', '2020-07-21 15:57:57', 'homme'),
(4, 'Karafi', 'Youssef', 'utilisateur2@gmail.com', '1234567890', 'bb1234', '0668778355', 'hay moulay rechide', '1999-11-06', 4, 'utilisateur', '2020-07-21 16:38:07', 'homme'),
(5, 'mohamed akram', 'lamhour', 'utilisateur3@gmail.com', '1234567890', 'bb1234', '0668778355', 'hay moulay rechide', '1999-02-25', 5, 'utilisateur', '2020-07-21 16:45:11', 'homme'),
(6, 'PRENOM', 'NOM', 'utilisateur4@gmail.com', '1234567890', 'BH4567', '0666889900', 'TEST TEST 2020', '1999-02-25', 8, 'utilisateur', '2020-08-05 08:40:44', 'homme'),
(7, 'mohamed', 'akram', 'akram@gmail.com', '1234567890', 'BJ3456', '0650354220', 'Hay molay rachide massira 3', '1998-01-10', 9, 'utilisateur', '2020-08-05 10:20:55', 'homme'),
(8, 'youssef', 'karafi', 'youssef@gmail.com', '1234567890', 'BE4567', '0655443312', 'Hay moulay rachide ', '1999-01-02', 10, 'utilisateur', '2020-08-05 10:46:51', 'homme'),
(9, 'youssef', 'karafi', 'youssefkarafi@gmail.com', '1234567890', 'BJ1234', '0644223311', 'Hay moulay rachide ', '1999-02-01', 11, 'utilisateur', '2020-08-05 12:11:02', 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `id_profil` int(11) NOT NULL AUTO_INCREMENT,
  `statut` int(11) NOT NULL,
  `url_image` varchar(225) NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`id_profil`, `statut`, `url_image`) VALUES
(1, 1, 'Azzouazi.png'),
(2, 1, 'akram.jfif'),
(3, 1, 'msalek.jpg'),
(4, 1, 'karafi.jpeg'),
(5, 1, 'profil_defaut.png'),
(6, 1, 'profil_defaut.png'),
(7, 1, 'profil_defaut.png'),
(8, 1, 'profil_defaut.png'),
(9, 1, 'profil_defaut.png'),
(10, 1, 'profil_defaut.png'),
(11, 1, 'profil_defaut.png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

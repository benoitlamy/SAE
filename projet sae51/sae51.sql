-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
-- Hôte : 127.0.0.1
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sae51`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`) VALUES
(1, 'BOB'),
(2, 'BILL'),
(3, 'BANANE');

-- --------------------------------------------------------

--
-- Structure de la table `install`
--

CREATE TABLE `install` (
  `machineId` int(11) DEFAULT NULL,
  `logicielId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `install`
--

INSERT INTO `install` (`machineId`, `logicielId`) VALUES
(3, 2),
(3, 2),
(3, 2),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `logiciel`
--

CREATE TABLE `logiciel` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `logiciel`
--

INSERT INTO `logiciel` (`id`, `nom`) VALUES
(1, 'vscode'),
(2, 'vscode'),
(3, 'paint');

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `marque` varchar(255) DEFAULT NULL,
  `anne` year(4) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `employeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `machine`
--

INSERT INTO `machine` (`id`, `marque`, `anne`, `ram`, `os`, `employeId`) VALUES
(1, 'BOB', 2012, 4, 'linux', 1),
(2, 'HP', 2012, 4, 'linux', 1),
(3, 'Dell', 2019, 8, 'Windows 10', 2),
(4, 'HP', 2020, 16, 'Windows 10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE `maintenance` (
  `interventionDate` datetime DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `machineId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `maintenance`
--

INSERT INTO `maintenance` (`interventionDate`, `nom`, `machineId`) VALUES
('2021-12-03 00:00:00', 'Jean Naymare', 3),
('2021-12-03 00:00:00', 'Jean Naymare', 3),
('2021-11-24 00:00:00', 'Jean Naymare', 3),
('2021-11-24 00:00:00', 'Jean Naymare', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `install`
--
ALTER TABLE `install`
  ADD KEY `machineId` (`machineId`),
  ADD KEY `logicielId` (`logicielId`);

--
-- Index pour la table `logiciel`
--
ALTER TABLE `logiciel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeId` (`employeId`);

--
-- Index pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD KEY `machineId` (`machineId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `logiciel`
--
ALTER TABLE `logiciel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `install`
--
ALTER TABLE `install`
  ADD CONSTRAINT `install_ibfk_1` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`),
  ADD CONSTRAINT `install_ibfk_2` FOREIGN KEY (`logicielId`) REFERENCES `logiciel` (`id`);

--
-- Contraintes pour la table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`employeId`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

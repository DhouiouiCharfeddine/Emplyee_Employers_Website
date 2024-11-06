-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 02:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bureau_emploi`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidature`
--

CREATE TABLE `candidature` (
  `CIN` varchar(10) NOT NULL,
  `code_offre_emploi` int(11) NOT NULL,
  `etat_candidature` int(11) NOT NULL,
  `date_candidature` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `competence`
--

CREATE TABLE `competence` (
  `code_competence` int(11) NOT NULL,
  `libelle_competence` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competence`
--

INSERT INTO `competence` (`code_competence`, `libelle_competence`) VALUES
(1, 'JavaScript'),
(2, 'Python'),
(3, 'HTML'),
(4, 'CSS'),
(5, 'C#'),
(6, 'C++'),
(7, 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `competence_demandeur`
--

CREATE TABLE `competence_demandeur` (
  `CIN` varchar(10) NOT NULL,
  `code_competence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `demandeur_cv`
--

CREATE TABLE `demandeur_cv` (
  `CIN` varchar(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `pseudo` varchar(30) NOT NULL,
  `email` varchar(35) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `etat_civil` int(11) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `numero_telephone` int(11) NOT NULL,
  `nombre_annee_experience` int(11) NOT NULL,
  `code_universite` int(11) NOT NULL,
  `cv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diplome`
--

CREATE TABLE `diplome` (
  `code_diplome` int(11) NOT NULL,
  `libelle_diplome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diplome`
--

INSERT INTO `diplome` (`code_diplome`, `libelle_diplome`) VALUES
(1, 'Baccalaureat'),
(2, 'License'),
(3, 'Mastere'),
(4, 'Ingenieure'),
(5, 'Doctorat');

-- --------------------------------------------------------

--
-- Table structure for table `diplome_demandeur`
--

CREATE TABLE `diplome_demandeur` (
  `CIN` varchar(10) NOT NULL,
  `code_diplome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employeur`
--

CREATE TABLE `employeur` (
  `code_registre_commerce` varchar(20) NOT NULL,
  `nom_entreprise` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nom_gerant` varchar(30) NOT NULL,
  `prenom_gerant` varchar(30) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `pass_word` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employeur_offre`
--

CREATE TABLE `employeur_offre` (
  `code_registre_commerce` varchar(20) NOT NULL,
  `code_offre_emploi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offre_competence`
--

CREATE TABLE `offre_competence` (
  `code_offre_emploi` int(11) NOT NULL,
  `code_competence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offre_emploi`
--

CREATE TABLE `offre_emploi` (
  `code_offre_emploi` int(11) NOT NULL,
  `Titre` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code_diplome` int(11) NOT NULL,
  `nombre_annees_experience` int(11) NOT NULL,
  `salaire_propose` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `universite`
--

CREATE TABLE `universite` (
  `code_universite` int(11) NOT NULL,
  `libelle_universite` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `universite`
--

INSERT INTO `universite` (`code_universite`, `libelle_universite`) VALUES
(1, 'ISG'),
(2, 'FST');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidature`
--
ALTER TABLE `candidature`
  ADD KEY `CIN` (`CIN`),
  ADD KEY `code_offre_emploi` (`code_offre_emploi`);

--
-- Indexes for table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`code_competence`);

--
-- Indexes for table `competence_demandeur`
--
ALTER TABLE `competence_demandeur`
  ADD KEY `CIN` (`CIN`),
  ADD KEY `code_competence` (`code_competence`);

--
-- Indexes for table `demandeur_cv`
--
ALTER TABLE `demandeur_cv`
  ADD PRIMARY KEY (`CIN`),
  ADD KEY `code_universite` (`code_universite`);

--
-- Indexes for table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`code_diplome`);

--
-- Indexes for table `diplome_demandeur`
--
ALTER TABLE `diplome_demandeur`
  ADD KEY `CIN` (`CIN`),
  ADD KEY `code_diplome` (`code_diplome`);

--
-- Indexes for table `employeur`
--
ALTER TABLE `employeur`
  ADD PRIMARY KEY (`code_registre_commerce`);

--
-- Indexes for table `employeur_offre`
--
ALTER TABLE `employeur_offre`
  ADD KEY `code_registre_commerce` (`code_registre_commerce`),
  ADD KEY `code_offre_emploi` (`code_offre_emploi`),
  ADD KEY `code_offre_emploi_2` (`code_offre_emploi`);

--
-- Indexes for table `offre_competence`
--
ALTER TABLE `offre_competence`
  ADD KEY `code_offre_emploi` (`code_offre_emploi`),
  ADD KEY `code_competence` (`code_competence`);

--
-- Indexes for table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  ADD PRIMARY KEY (`code_offre_emploi`),
  ADD KEY `code_diplome` (`code_diplome`);

--
-- Indexes for table `universite`
--
ALTER TABLE `universite`
  ADD PRIMARY KEY (`code_universite`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  MODIFY `code_offre_emploi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `demandeur_cv` (`CIN`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidature_ibfk_2` FOREIGN KEY (`code_offre_emploi`) REFERENCES `offre_emploi` (`code_offre_emploi`) ON DELETE CASCADE;

--
-- Constraints for table `competence_demandeur`
--
ALTER TABLE `competence_demandeur`
  ADD CONSTRAINT `competence_demandeur_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `demandeur_cv` (`CIN`) ON DELETE CASCADE,
  ADD CONSTRAINT `competence_demandeur_ibfk_2` FOREIGN KEY (`code_competence`) REFERENCES `competence` (`code_competence`) ON DELETE CASCADE;

--
-- Constraints for table `demandeur_cv`
--
ALTER TABLE `demandeur_cv`
  ADD CONSTRAINT `demandeur_cv_ibfk_1` FOREIGN KEY (`code_universite`) REFERENCES `universite` (`code_universite`);

--
-- Constraints for table `diplome_demandeur`
--
ALTER TABLE `diplome_demandeur`
  ADD CONSTRAINT `diplome_demandeur_ibfk_1` FOREIGN KEY (`CIN`) REFERENCES `demandeur_cv` (`CIN`) ON DELETE CASCADE,
  ADD CONSTRAINT `diplome_demandeur_ibfk_2` FOREIGN KEY (`code_diplome`) REFERENCES `diplome` (`code_diplome`) ON DELETE CASCADE;

--
-- Constraints for table `employeur_offre`
--
ALTER TABLE `employeur_offre`
  ADD CONSTRAINT `employeur_offre_ibfk_1` FOREIGN KEY (`code_offre_emploi`) REFERENCES `offre_emploi` (`code_offre_emploi`) ON DELETE CASCADE,
  ADD CONSTRAINT `employeur_offre_ibfk_2` FOREIGN KEY (`code_registre_commerce`) REFERENCES `employeur` (`code_registre_commerce`) ON DELETE CASCADE;

--
-- Constraints for table `offre_competence`
--
ALTER TABLE `offre_competence`
  ADD CONSTRAINT `offre_competence_ibfk_1` FOREIGN KEY (`code_competence`) REFERENCES `competence` (`code_competence`) ON DELETE CASCADE,
  ADD CONSTRAINT `offre_competence_ibfk_2` FOREIGN KEY (`code_offre_emploi`) REFERENCES `offre_emploi` (`code_offre_emploi`) ON DELETE CASCADE;

--
-- Constraints for table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  ADD CONSTRAINT `offre_emploi_ibfk_1` FOREIGN KEY (`code_diplome`) REFERENCES `diplome` (`code_diplome`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: May 20, 2019 at 11:52 AM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_wyckoffk`
--

-- --------------------------------------------------------

--
-- Table structure for table `collecting_event`
--

DROP TABLE IF EXISTS `collecting_event`;
CREATE TABLE `collecting_event` (
  `id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collecting_event`
--

INSERT INTO `collecting_event` (`id`, `locality_id`, `method`, `date`) VALUES
(1, 4, 'CAP-883, Malaise Trap #3', '2000-10-02'),
(2, 1, 'Yellow Pan Traps', '1997-01-01'),
(3, 2, 'Malaise Trap', '1997-11-30'),
(4, 3, 'injured millipede', '2011-08-15'),
(5, 5, 'Malaise Trap', '1995-05-01'),
(6, 6, 'Malaise Trap', '1997-07-22'),
(7, 7, 'Malaise Trap', '1994-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `coll_event_people`
--

DROP TABLE IF EXISTS `coll_event_people`;
CREATE TABLE `coll_event_people` (
  `coll_event_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coll_event_people`
--

INSERT INTO `coll_event_people` (`coll_event_id`, `people_id`) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 6),
(5, 7),
(6, 8),
(6, 10),
(7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
CREATE TABLE `locality` (
  `id` int(11) NOT NULL,
  `country` varchar(64) NOT NULL,
  `region` varchar(64) NOT NULL,
  `place` varchar(64) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `elevation` smallint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locality`
--

INSERT INTO `locality` (`id`, `country`, `region`, `place`, `longitude`, `latitude`, `elevation`) VALUES
(1, 'Brazil', 'Minas Gerais', 'Belo Horizonte, Est. Ecol. UFMG', -43.97, -19.92, 800),
(2, 'Venezuela', 'Aragua', 'Rancho Grande, PN Henri Pittier', -67.59, 10.35, 1150),
(3, 'Costa Rica', 'Alajuela', 'Villa Blanca', -84.48, 10.2, 1067),
(4, 'Colombia', 'Amazonas', 'San Martin, PNN Amacayacu', -70.3, -3.77, NULL),
(5, 'Honduras', 'Olancho', 'PN La Muralla, 15km NW La Union', -86.75, 15.12, 1450),
(6, 'Mexico', 'Chiapas', 'Reserva El Triunfo, Sendero Cerro Triunfo', -92.8, 15.66, 1982),
(7, 'Nicaragua', 'Matagalpa', 'Fuente Pura', -85.92, 13.02, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `first_name`, `last_name`) VALUES
(1, 'D', 'Yanega'),
(2, 'T', 'Pape'),
(3, 'B', 'Amado'),
(4, 'Brian', 'Brown'),
(5, 'Thomas', 'Borgmeier'),
(6, 'John', 'Hash'),
(7, 'R', 'Cordero'),
(8, 'Jim', 'Woolley'),
(9, 'J', 'Maes'),
(10, 'unknown', 'Gonzalez');

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE `species` (
  `id` int(11) NOT NULL,
  `family` varchar(128) NOT NULL,
  `genus` varchar(128) NOT NULL,
  `specific_epithet` varchar(128) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`id`, `family`, `genus`, `specific_epithet`, `year`) VALUES
(1, 'Phoridae', 'Myriophora', 'angustifascia', 2015),
(2, 'Phoridae', 'Myriophora', 'fuscidorsum', 2015),
(3, 'Phoridae', 'Myriophora', 'uruguaniensis', 2015),
(4, 'Phoridae', 'Myriophora', 'diversa', 2015),
(5, 'Phoridae', 'Myriophora', 'lucigaster', 1961),
(6, 'Phoridae', 'Myriophora', 'borealis', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `species_people`
--

DROP TABLE IF EXISTS `species_people`;
CREATE TABLE `species_people` (
  `species_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `species_people`
--

INSERT INTO `species_people` (`species_id`, `people_id`) VALUES
(1, 4),
(1, 6),
(2, 4),
(2, 6),
(3, 4),
(3, 6),
(4, 4),
(4, 6),
(5, 5),
(6, 4),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `specimen`
--

DROP TABLE IF EXISTS `specimen`;
CREATE TABLE `specimen` (
  `id` int(11) NOT NULL,
  `institution_code` varchar(8) NOT NULL,
  `collection_code` varchar(8) NOT NULL,
  `catalog_number` int(11) NOT NULL,
  `species_id` int(11) DEFAULT NULL,
  `collecting_event_id` int(11) NOT NULL,
  `type_status` varchar(16) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specimen`
--

INSERT INTO `specimen` (`id`, `institution_code`, `collection_code`, `catalog_number`, `species_id`, `collecting_event_id`, `type_status`, `sex`, `image_name`) VALUES
(1, 'LACM', 'ENT', 72635, 1, 1, NULL, 'f', NULL),
(2, 'LACM', 'ENT', 134384, 3, 2, NULL, 'f', NULL),
(3, 'LACM', 'ENT', 134389, 5, 2, NULL, 'f', NULL),
(7, 'LACM', 'ENT', 307175, 4, 4, NULL, 'f', NULL),
(8, 'LACM', 'ENT', 67243, 2, 3, NULL, 'f', NULL),
(9, 'LACM', 'ENT', 32184, 6, 5, NULL, 'f', NULL),
(10, 'LACM', 'ENT', 147021, 6, 6, NULL, 'f', NULL),
(11, 'LACM', 'ENT', 147025, 6, 6, NULL, 'f', NULL),
(12, 'LACM', 'ENT', 206440, 6, 7, NULL, 'f', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collecting_event`
--
ALTER TABLE `collecting_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locality_id` (`locality_id`);

--
-- Indexes for table `coll_event_people`
--
ALTER TABLE `coll_event_people`
  ADD KEY `coll_event_id` (`coll_event_id`,`people_id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indexes for table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `species_people`
--
ALTER TABLE `species_people`
  ADD KEY `species_id` (`species_id`,`people_id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indexes for table `specimen`
--
ALTER TABLE `specimen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `species_id` (`species_id`,`collecting_event_id`),
  ADD KEY `species_id_2` (`species_id`),
  ADD KEY `collecting_event_id` (`collecting_event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collecting_event`
--
ALTER TABLE `collecting_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specimen`
--
ALTER TABLE `specimen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collecting_event`
--
ALTER TABLE `collecting_event`
  ADD CONSTRAINT `collecting_event_ibfk_1` FOREIGN KEY (`locality_id`) REFERENCES `locality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coll_event_people`
--
ALTER TABLE `coll_event_people`
  ADD CONSTRAINT `coll_event_people_ibfk_3` FOREIGN KEY (`coll_event_id`) REFERENCES `collecting_event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coll_event_people_ibfk_4` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `species_people`
--
ALTER TABLE `species_people`
  ADD CONSTRAINT `species_people_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `species_people_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specimen`
--
ALTER TABLE `specimen`
  ADD CONSTRAINT `specimen_ibfk_3` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specimen_ibfk_4` FOREIGN KEY (`collecting_event_id`) REFERENCES `collecting_event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 08:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itdc`
--
CREATE DATABASE IF NOT EXISTS `itdc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `itdc`;

-- --------------------------------------------------------

--
-- Table structure for table `jumlah_area`
--

CREATE TABLE IF NOT EXISTS `jumlah_area` (
  `ID_Area` int(11) NOT NULL,
  `Tahun` int(11) DEFAULT NULL,
  `Bulan` int(11) DEFAULT NULL,
  `Kunjungan_Area` int(11) DEFAULT NULL,
  KEY `fk_area_id` (`ID_Area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE IF NOT EXISTS `kunjungan` (
  `Tahun` int(11) DEFAULT NULL,
  `Bulan` int(11) DEFAULT NULL,
  `ID_Negara_Wisatawan` varchar(10) DEFAULT NULL,
  `ID_Kawasan` int(11) DEFAULT NULL,
  `Total_Kunjungan` int(11) DEFAULT NULL,
  KEY `fk_negara_wisatawan_id` (`ID_Negara_Wisatawan`),
  KEY `fk_kawasan_id` (`ID_Kawasan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_area`
--

CREATE TABLE IF NOT EXISTS `master_area` (
  `ID_Area` int(11) NOT NULL,
  `Area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_kawasan`
--

CREATE TABLE IF NOT EXISTS `master_kawasan` (
  `ID_Kawasan` int(11) NOT NULL,
  `Kawasan` varchar(100) DEFAULT NULL,
  `ID_Area` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Kawasan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_negara`
--

CREATE TABLE IF NOT EXISTS `master_negara` (
  `ID` varchar(10) NOT NULL,
  `ID_2` varchar(10) DEFAULT NULL,
  `Negara` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_unit`
--

CREATE TABLE IF NOT EXISTS `master_unit` (
  `ID_Unit` varchar(100) NOT NULL,
  `Unit` varchar(200) DEFAULT NULL,
  `Keterangan` text DEFAULT NULL,
  PRIMARY KEY (`ID_Unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menginap`
--

CREATE TABLE IF NOT EXISTS `menginap` (
  `Tahun` int(11) DEFAULT NULL,
  `Bulan` int(11) DEFAULT NULL,
  `ID_Unit` varchar(100) DEFAULT NULL,
  `ID_Kawasan` int(11) DEFAULT NULL,
  `Occupancy` float DEFAULT NULL,
  `Jumlah_Kamar` int(11) DEFAULT NULL,
  `Jumlah_Menginap` int(11) DEFAULT NULL,
  `Total_Rate` float DEFAULT NULL,
  KEY `fk_unit_id` (`ID_Unit`),
  KEY `fk_kawasan_menginap_id` (`ID_Kawasan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jumlah_area`
--
ALTER TABLE `jumlah_area`
  ADD CONSTRAINT `fk_area_id` FOREIGN KEY (`ID_Area`) REFERENCES `master_area` (`ID_Area`);

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `fk_kawasan_id` FOREIGN KEY (`ID_Kawasan`) REFERENCES `master_kawasan` (`ID_Kawasan`),
  ADD CONSTRAINT `fk_negara_wisatawan_id` FOREIGN KEY (`ID_Negara_Wisatawan`) REFERENCES `master_negara` (`ID`);

--
-- Constraints for table `menginap`
--
ALTER TABLE `menginap`
  ADD CONSTRAINT `fk_kawasan_menginap_id` FOREIGN KEY (`ID_Kawasan`) REFERENCES `master_kawasan` (`ID_Kawasan`),
  ADD CONSTRAINT `fk_unit_id` FOREIGN KEY (`ID_Unit`) REFERENCES `master_unit` (`ID_Unit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

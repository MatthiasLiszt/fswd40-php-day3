-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 21, 2018 at 09:29 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_matthias_liszt_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalCharges`
--

CREATE TABLE `additionalCharges` (
  `aChargeId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `carType` varchar(32) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `prodYear` year(4) DEFAULT NULL,
  `tankCapacity` int(11) DEFAULT NULL,
  `img` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carId`, `carType`, `capacity`, `power`, `seats`, `prodYear`, `tankCapacity`, `img`) VALUES
(1, 'Fiat', 2, 50, 6, 1991, 50, 'image1.jpg'),
(2, 'Mercedes', 4, 100, 6, 1997, 90, 'image2.jpg'),
(3, 'VW', 3, 70, 6, 1993, 60, 'image3.jpg'),
(4, 'Opel', 3, 80, 6, 1996, 70, 'image4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carDamage`
--

CREATE TABLE `carDamage` (
  `reportId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `damageId` int(11) DEFAULT NULL,
  `transactionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carDamage`
--

INSERT INTO `carDamage` (`reportId`, `carId`, `damageId`, `transactionId`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carPrice`
--

CREATE TABLE `carPrice` (
  `carPriceId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `carPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carPrice`
--

INSERT INTO `carPrice` (`carPriceId`, `carId`, `carPrice`) VALUES
(1, 1, 50),
(2, 2, 100),
(3, 3, 50),
(4, 4, 50);

-- --------------------------------------------------------

--
-- Table structure for table `carRent`
--

CREATE TABLE `carRent` (
  `transactionId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carRent`
--

INSERT INTO `carRent` (`transactionId`, `userId`, `carId`) VALUES
(1, 1, 1),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `carTank`
--

CREATE TABLE `carTank` (
  `tankId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `transactionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carTank`
--

INSERT INTO `carTank` (`tankId`, `carId`, `volume`, `transactionId`) VALUES
(1, 1, 20, 1),
(2, 4, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `damageCalculation`
--

CREATE TABLE `damageCalculation` (
  `calculationId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `carType` varchar(32) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `damageCalculation`
--

INSERT INTO `damageCalculation` (`calculationId`, `transactionId`, `carType`, `price`) VALUES
(1, 1, 'Fiat', 1800);

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `damageId` int(11) NOT NULL,
  `name` varchar(21) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `damages`
--

INSERT INTO `damages` (`damageId`, `name`, `description`) VALUES
(1, 'parking accident', 'damaged right front light');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `transactionId`, `userId`, `price`, `paid`, `serviceId`) VALUES
(1, 1, 1, 2000, 0, 1),
(2, 2, 1, 1000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paymentService`
--

CREATE TABLE `paymentService` (
  `serviceId` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `cardNumber` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentService`
--

INSERT INTO `paymentService` (`serviceId`, `name`, `cardNumber`, `userId`) VALUES
(1, 'Visa', 123456345, 1),
(2, 'Visa', 523456445, 2),
(3, 'Visa', 923456543, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `surname` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`, `surname`, `birthday`) VALUES
(1, 'Max', 'Boehm', '1981-11-11'),
(2, 'Stefan', 'Czerny', '1981-12-11'),
(3, 'Andrzej', 'Pettyn', '1979-10-21');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `userId` int(11) DEFAULT NULL,
  `documentNumber` int(11) NOT NULL,
  `document` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`userId`, `documentNumber`, `document`) VALUES
(1, 34523462, 'passport'),
(2, 65435567, 'passport'),
(3, 97834566, 'passport');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalCharges`
--
ALTER TABLE `additionalCharges`
  ADD PRIMARY KEY (`aChargeId`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carId`);

--
-- Indexes for table `carDamage`
--
ALTER TABLE `carDamage`
  ADD PRIMARY KEY (`reportId`);

--
-- Indexes for table `carPrice`
--
ALTER TABLE `carPrice`
  ADD PRIMARY KEY (`carPriceId`);

--
-- Indexes for table `carRent`
--
ALTER TABLE `carRent`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `carTank`
--
ALTER TABLE `carTank`
  ADD PRIMARY KEY (`tankId`);

--
-- Indexes for table `damageCalculation`
--
ALTER TABLE `damageCalculation`
  ADD PRIMARY KEY (`calculationId`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`damageId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `paymentService`
--
ALTER TABLE `paymentService`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`documentNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `carId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carRent`
--
ALTER TABLE `carRent`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

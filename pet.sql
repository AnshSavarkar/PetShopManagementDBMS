-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 15, 2024 at 06:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `name` varchar(20) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `name` varchar(20) NOT NULL,
  `amt` int(20) NOT NULL,
  `date` date NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `PET_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`name`, `amt`, `date`, `purpose`, `PET_ID`) VALUES
('ass', 788, '2024-08-11', 'bhh', 234),
('VGG', 233, '2024-08-11', 'BGG', 234);

--
-- Triggers `donation`
--
DELIMITER $$
CREATE TRIGGER `purpose` BEFORE INSERT ON `donation` FOR EACH ROW BEGIN
  IF NEW.PURPOSE IS NULL THEN
  SET NEW.PURPOSE='CHARITY';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `name` varchar(20) NOT NULL,
  `id` int(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `salary` int(20) NOT NULL,
  `age` int(20) NOT NULL,
  `contact` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`name`, `id`, `role`, `salary`, `age`, `contact`) VALUES
('qw', 22, 'sdf', 234, 12, 34687);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(20) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `product` int(20) NOT NULL,
  `odate` date NOT NULL,
  `amt` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PET`
--

CREATE TABLE `PET` (
  `NAME` varchar(20) NOT NULL,
  `PET_ID` int(20) NOT NULL,
  `SPECIES` varchar(20) NOT NULL,
  `PRICE` int(20) NOT NULL,
  `AGE` int(20) NOT NULL,
  `GENDER` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PET`
--

INSERT INTO `PET` (`NAME`, `PET_ID`, `SPECIES`, `PRICE`, `AGE`, `GENDER`) VALUES
('aryan', 234, 'abc', 900, 12, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `name` varchar(20) NOT NULL,
  `productid` int(30) NOT NULL,
  `qty` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`name`, `productid`, `qty`, `price`, `description`) VALUES
('abc', 12, 24, 300, 'axz');

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `QUANTITY` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
  IF 
   NEW.QTY<0 THEN
   SET NEW.QTY=0;
   END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `order_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `amt` int(20) NOT NULL,
  `reason` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `name` varchar(20) NOT NULL,
  `id` int(20) NOT NULL,
  `contact person` varchar(20) NOT NULL,
  `contact info` int(20) NOT NULL,
  `products` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`name`, `id`, `contact person`, `contact info`, `products`) VALUES
('AV', 12, 'AVC', 23567, 'ASD'),
('ansh', 12, 'dhruv', 9867, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `vaccineid` int(11) NOT NULL,
  `PET_ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `nextdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet`
--

CREATE TABLE `vet` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `specialisation` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `purpose` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vet`
--

INSERT INTO `vet` (`id`, `name`, `specialisation`, `phone`, `purpose`) VALUES
(12, 'asd', 'bvc', 89887, 'ghf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD KEY `fk6` (`PET_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk1` (`customer_id`);

--
-- Indexes for table `PET`
--
ALTER TABLE `PET`
  ADD PRIMARY KEY (`PET_ID`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD KEY `fk4` (`order_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`vaccineid`),
  ADD KEY `fk2` (`PET_ID`);

--
-- Indexes for table `vet`
--
ALTER TABLE `vet`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`PET_ID`) REFERENCES `PET` (`PET_ID`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`PET_ID`) REFERENCES `PET` (`PET_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`PET_ID`) REFERENCES `PET` (`PET_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2024 at 02:33 PM
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

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`name`, `customer_id`, `phone`, `email`, `city`) VALUES
('virat', 1, 12345, 'abc@gmail.com', 'mumbai'),
('rohit', 2, 34567, 'xyz@g,ail.com', 'delhi');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_order_summary`
-- (See below for the actual view)
--
CREATE TABLE `customer_order_summary` (
`customer_id` int(20)
,`customer_name` varchar(20)
,`city` varchar(20)
,`total_orders` bigint(21)
,`total_spent` decimal(41,0)
);

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
  `ename` varchar(20) NOT NULL,
  `id` int(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `salary` int(20) NOT NULL,
  `age` int(20) NOT NULL,
  `contact` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ename`, `id`, `role`, `salary`, `age`, `contact`) VALUES
('mohit', 1, 'asd', 2313, 13, 12324),
('virat', 3, 'ads', 2132, 15, 34235),
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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `product`, `odate`, `amt`) VALUES
(1, 1, 12, '2024-11-16', 20000),
(2, 1, 12, '2024-11-16', 10000),
(3, 2, 12, '2024-11-15', 30000);

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
('ansh', 1, 'xyz', 2000, 13, 'male'),
('aryan', 234, 'abc', 900, 12, 'male');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pet_vaccination_details`
-- (See below for the actual view)
--
CREATE TABLE `pet_vaccination_details` (
`PET_ID` int(20)
,`pet_name` varchar(20)
,`SPECIES` varchar(20)
,`pet_age` int(20)
,`vaccineid` int(11)
,`vaccination_date` date
,`next_vaccination_date` date
);

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
  `contact_person` varchar(20) NOT NULL,
  `contact_info` int(20) NOT NULL,
  `products` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`name`, `id`, `contact_person`, `contact_info`, `products`) VALUES
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

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`vaccineid`, `PET_ID`, `date`, `nextdate`) VALUES
(1, 1, '2023-10-26', '2024-10-26'),
(2, 1, '2023-05-07', '2024-05-07');

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

-- --------------------------------------------------------

--
-- Structure for view `customer_order_summary`
--
DROP TABLE IF EXISTS `customer_order_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_order_summary`  AS SELECT `c`.`customer_id` AS `customer_id`, `c`.`name` AS `customer_name`, `c`.`city` AS `city`, count(`o`.`order_id`) AS `total_orders`, sum(`o`.`amt`) AS `total_spent` FROM (`customers` `c` left join `orders` `o` on(`c`.`customer_id` = `o`.`customer_id`)) GROUP BY `c`.`customer_id`, `c`.`name`, `c`.`city` ;

-- --------------------------------------------------------

--
-- Structure for view `pet_vaccination_details`
--
DROP TABLE IF EXISTS `pet_vaccination_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pet_vaccination_details`  AS SELECT `p`.`PET_ID` AS `PET_ID`, `p`.`NAME` AS `pet_name`, `p`.`SPECIES` AS `SPECIES`, `p`.`AGE` AS `pet_age`, `v`.`vaccineid` AS `vaccineid`, `v`.`date` AS `vaccination_date`, `v`.`nextdate` AS `next_vaccination_date` FROM (`pet` `p` join `vaccine` `v` on(`p`.`PET_ID` = `v`.`PET_ID`)) ;

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

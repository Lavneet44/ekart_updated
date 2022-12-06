-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 06, 2022 at 01:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubix`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` int(11) NOT NULL,
  `discount_master_id` int(11) NOT NULL,
  `category_ids` varchar(191) DEFAULT NULL,
  `brands` varchar(191) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `discount` double NOT NULL,
  `base_price` double DEFAULT NULL,
  `total_qty` int(11) DEFAULT 0,
  `type` varchar(255) NOT NULL DEFAULT 'flat',
  `startDuration` datetime NOT NULL,
  `endDuration` datetime NOT NULL,
  `start_date` date DEFAULT NULL COMMENT 'not use',
  `start_time` time DEFAULT NULL COMMENT 'not use',
  `end_date` date DEFAULT NULL COMMENT 'not use',
  `end_time` time DEFAULT NULL COMMENT 'not use',
  `quantity` int(11) DEFAULT NULL,
  `buy` int(11) DEFAULT NULL,
  `free_qty` text DEFAULT NULL,
  `Item` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `is_hide` int(11) NOT NULL DEFAULT 0,
  `seller_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `discount_master_id`, `category_ids`, `brands`, `product_id`, `variant_id`, `discount_percent`, `discount`, `base_price`, `total_qty`, `type`, `startDuration`, `endDuration`, `start_date`, `start_time`, `end_date`, `end_time`, `quantity`, `buy`, `free_qty`, `Item`, `status`, `is_hide`, `seller_id`, `is_deleted`, `updated_at`, `created_at`) VALUES
(34, 7, '104', '14', 104, 1, 9, 9000, 100000, 100, 'Each', '2023-01-01 05:30:00', '2023-01-10 05:30:00', '2023-01-01', '05:30:00', '2023-01-10', '05:30:00', 100, 10, '1,2', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06'),
(35, 7, '104', '14', 104, 2, 9, 9900, 100000, 100, 'Each', '2023-01-01 05:30:00', '2023-01-10 05:30:00', '2023-01-01', '05:30:00', '2023-01-10', '05:30:00', 100, 10, '1,2', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06'),
(38, 8, '104', '14', 104, 1, 10, 10000, 100000, 100, 'Open', '2022-12-08 16:50:00', '2022-12-15 16:50:00', '2022-12-08', '16:50:00', '2022-12-15', '16:50:00', 100, 12, '1,4', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06'),
(39, 8, '104', '14', 104, 2, 10, 11000, 100000, 100, 'Open', '2022-12-08 16:50:00', '2022-12-15 16:50:00', '2022-12-08', '16:50:00', '2022-12-15', '16:50:00', 100, 12, '1,4', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06'),
(50, 12, '104', '14', 104, 1, 10, 10000, 100000, 100, 'Open', '2022-12-08 16:50:00', '2022-12-15 16:50:00', '2022-12-08', '16:50:00', '2022-12-15', '16:50:00', 100, 12, '1,4', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06'),
(51, 12, '104', '14', 104, 2, 10, 11000, 100000, 100, 'Open', '2022-12-08 16:50:00', '2022-12-15 16:50:00', '2022-12-08', '16:50:00', '2022-12-15', '16:50:00', 100, 12, '1,4', '99,100', 1, 0, 5, 0, '2022-12-06', '2022-12-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

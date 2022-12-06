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
-- Table structure for table `discount_masters`
--

CREATE TABLE `discount_masters` (
  `id` int(11) NOT NULL,
  `discount_label` text DEFAULT NULL,
  `category_ids` varchar(191) DEFAULT NULL,
  `brands` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variants` varchar(191) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `apply_for_all` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `is_hide` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount_masters`
--

INSERT INTO `discount_masters` (`id`, `discount_label`, `category_ids`, `brands`, `product_id`, `variants`, `seller_id`, `apply_for_all`, `status`, `is_deleted`, `is_hide`, `created_at`, `updated_at`) VALUES
(7, 'sadfasdfasd', '104', 14, 104, '1,2', 5, 1, 1, 0, 1, '2022-12-06 11:03:59', '2022-12-06 17:09:37'),
(8, 'Checknsadfafdsafas asdf asdf', '104', 14, 104, '1,2', 5, 1, 1, 0, 0, '2022-12-06 17:26:10', '2022-12-06 17:26:10'),
(12, 'Checking Copy', '104', 14, 104, '1,2', 5, 1, 1, 0, 1, '2022-12-06 17:44:37', '2022-12-06 17:45:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discount_masters`
--
ALTER TABLE `discount_masters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discount_masters`
--
ALTER TABLE `discount_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 12, 2022 at 03:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

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
-- Table structure for table `balance_sheet`
--

CREATE TABLE `balance_sheet` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `opening_balance` int(11) DEFAULT NULL,
  `in_qty` int(11) NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `in_qty_ref` varchar(191) DEFAULT NULL,
  `out_qty` int(11) NOT NULL DEFAULT 0,
  `out_qty_ref` varchar(191) DEFAULT NULL,
  `balance_qty` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `balance_sheet`
--

INSERT INTO `balance_sheet` (`id`, `product_id`, `opening_balance`, `in_qty`, `purchase_price`, `in_qty_ref`, `out_qty`, `out_qty_ref`, `balance_qty`, `date`, `created_at`, `updated_at`) VALUES
(9, 115, 100, 100, 10000, 'Opening Balance', 0, '', 100, '2022-12-09', '2022-12-12 19:15:04', NULL),
(10, 115, 100, 100, 10000, 'Stock Update', 0, '', 200, '2022-12-09', '2022-12-12 19:15:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

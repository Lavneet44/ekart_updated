-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2022 at 05:53 PM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '9876543210', 1, 'def.png', 'admin@gmail.com', NULL, '$2y$10$TXcMlQ4wWIjli6fO1F9KM.Hk/zaJo9AITFEcLlyL4utGqYCYCf8YW', 'UOSi9lRhRoAHsHm8hLfE6xaQvYeVkMCO2ISDLvKxGHEfV5FRBzhrZ3iCEkuz', '2022-02-09 17:31:07', '2022-02-09 17:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 0, 0, NULL, '2022-04-19 09:17:33', 0.00, 25.00, 0.00, 0.00),
(2, 1, 0, 0, '2022-02-09 17:31:07', '2022-02-09 17:31:07', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_by` text DEFAULT NULL,
  `selected_seller` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_by`, `selected_seller`, `created_at`, `updated_at`) VALUES
(1, 'Size', '5', '[5]', '2022-12-13 17:22:23', '2022-12-13 17:22:23'),
(2, 'RAM', '5', '[5]', '2022-12-13 17:22:41', '2022-12-13 17:23:48'),
(3, 'SSD', '5', '[5]', '2022-12-13 17:22:57', '2022-12-13 17:22:57'),
(4, 'Occasion', '5', '[5]', '2022-12-13 17:24:29', '2022-12-13 17:24:29');

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
(10, 115, 100, 100, 10000, 'Stock Update', 0, '', 200, '2022-12-09', '2022-12-12 19:15:28', NULL),
(11, 2, 100, 100, 10000, 'Opening Balance', 0, '', 100, '2022-12-23', '2022-12-14 23:18:45', NULL),
(12, 3, 100, 100, 10000, 'Opening Balance', 0, '', 100, '2022-12-17', '2022-12-15 12:26:02', NULL),
(13, 3, 100, 100, 10000, 'Stock Update', 0, '', 200, '2022-12-17', '2022-12-15 13:15:48', NULL),
(14, 3, 100, 100, 10000, 'Stock Update', 0, '', 300, '2022-12-17', '2022-12-15 13:18:11', NULL),
(15, 3, 100, 40, 10000, 'Stock Update', 0, '', 340, '2022-12-17', '2022-12-15 13:24:57', NULL),
(16, 4, 50, 50, 10000, 'Opening Balance', 0, '', 50, '2022-12-09', '2022-12-15 13:33:14', NULL),
(17, 4, 50, 100, 10000, 'Stock Update', 0, '', 150, '2022-12-09', '2022-12-15 13:36:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(1, '2022-12-19-63a07349006d0.png', 'Main Banner', 1, '2022-02-15 11:23:37', '2022-12-19 14:20:57', '#', 'product', 10),
(2, '2022-02-15-620b402540311.png', 'Main Banner', 0, '2022-02-15 11:24:45', '2022-02-15 11:24:45', '#', 'product', 1),
(3, '2022-02-15-620b4040016cd.png', 'Main Banner', 0, '2022-02-15 11:25:12', '2022-02-15 11:25:12', '#', 'product', 1),
(4, '2022-02-15-620b40631129d.png', 'Main Banner', 0, '2022-02-15 11:25:47', '2022-02-15 11:25:47', '#', 'product', 1),
(5, '2022-02-15-620b4427e558d.png', 'Footer Banner', 1, '2022-02-15 11:41:51', '2022-02-15 11:42:20', '#', 'shop', 1),
(6, '2022-02-15-620b44e419802.png', 'Footer Banner', 1, '2022-02-15 11:45:00', '2022-02-15 11:45:29', '#', 'product', 1),
(7, '2022-02-15-620b44f94f2b2.png', 'Footer Banner', 1, '2022-02-15 11:45:21', '2022-02-15 11:45:27', '#', 'product', 1),
(8, '2022-02-15-620b5edc6e6dc.png', 'Popup Banner', 1, '2022-02-15 12:27:37', '2022-02-15 13:35:48', '#', 'product', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` text DEFAULT NULL,
  `selected_seller` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_by`, `selected_seller`, `created_at`, `updated_at`) VALUES
(1, 'Dell', '2022-12-13-6398b3c25caa0.png', 1, '5', '[5]', '2022-12-13 17:15:46', '2022-12-13 17:17:54'),
(2, 'HP', '2022-12-13-6398b37e64be8.png', 1, '5', '[5]', '2022-12-13 17:16:46', '2022-12-13 17:16:46'),
(3, 'Lee', '2022-12-13-6398b41537244.png', 1, '5', '[5]', '2022-12-13 17:19:17', '2022-12-13 17:19:17'),
(4, 'Pepe Jeans', '2022-12-13-6398b44ba8aba.png', 1, '5', '[5]', '2022-12-13 17:20:11', '2022-12-13 17:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `brand_allowes`
--

CREATE TABLE `brand_allowes` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT 0,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `brand_id` int(11) DEFAULT NULL,
  `delete_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=notdeleted,1=deleted',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_allowes`
--

INSERT INTO `brand_allowes` (`id`, `seller_id`, `admin_id`, `brand_id`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 5, 0, '2022-07-19 11:15:43', '2022-07-19 11:15:43'),
(2, 0, 1, 4, 0, '2022-07-19 11:50:23', '2022-07-19 11:50:23'),
(3, 2, 0, 6, 0, '2022-07-21 11:41:42', '2022-07-21 11:41:42'),
(4, 0, 1, 7, 0, '2022-07-21 12:24:35', '2022-07-21 12:24:35'),
(5, 2, 0, 8, 0, '2022-07-22 17:11:20', '2022-07-22 17:11:20'),
(6, 6, 0, 6, 0, '2022-08-06 17:17:31', '2022-08-06 17:17:31'),
(7, 6, 0, 7, 0, '2022-08-06 17:17:31', '2022-08-06 17:17:31'),
(8, 9, 0, 9, 0, '2022-10-14 15:17:03', '2022-10-14 15:17:03'),
(9, 9, 0, 10, 0, '2022-10-14 15:22:08', '2022-10-14 15:22:08'),
(10, 5, 0, 6, 0, '2022-11-09 13:12:29', '2022-11-09 13:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '9', '2020-10-11 07:43:44', '2022-07-23 17:45:22'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"name\":\"webbasaar\",\"host\":\"premium245.web-hosting.com\",\"driver\":\"SMTP\",\"port\":\"465\",\"username\":\"Response@webbasaar.com\",\"email_id\":\"response@webbassar.com\",\"encryption\":\"ssl\",\"password\":\"Response@2022\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2020-11-09 08:36:51', '2021-07-06 12:29:46'),
(7, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2020-11-09 08:51:39', '2021-07-06 12:29:57'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(9, 'paytm', '{\"status\":\"0\",\"paytm_merchant_id\":\"dbzfb\",\"paytm_merchant_key\":\"sdfbsdfb\",\"paytm_merchant_website\":\"dsfbsdf\",\"paytm_channel\":\"sdfbsdf\",\"paytm_industry_type\":\"sdfb\"}', '2020-11-09 09:19:08', '2020-11-09 09:19:56'),
(10, 'company_phone', '000000000', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'MultiVendor eCom', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-02-15-620b5fbcd31a8.png', NULL, '2022-02-15 13:39:32'),
(13, 'company_mobile_logo', '2022-02-16-620ccd55927bc.png', NULL, '2022-02-16 15:39:25'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Copy@6amtech.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1b7fed\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2022-02-16 15:45:13'),
(19, 'company_footer_logo', '2022-02-15-620b60e16a4d4.png', NULL, '2022-02-15 13:44:25'),
(20, 'company_copyright_text', 'CopyRight @2021', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/ecom.sparedeveloper.tk\\/\"}', NULL, '2022-02-15 23:27:30'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2022-02-16-620ccdeb8ab83.png', '2020-10-11 13:53:02', '2022-02-16 15:41:55'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'multi_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, NULL),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"1\",\"color\":\"#000000\",\"text_color\":\"#ffffff\",\"announcement\":\"Big Deal!\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'timezone', 'Asia/Calcutta', NULL, NULL),
(68, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(69, 'credit_permission', '{\"status\":\"1\"}', '2022-04-07 06:13:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings_old`
--

CREATE TABLE `business_settings_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings_old`
--

INSERT INTO `business_settings_old` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '116', '2020-10-11 07:43:44', '2022-04-06 09:58:50'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2020-11-09 08:36:51', '2021-07-06 12:29:46'),
(7, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2020-11-09 08:51:39', '2021-07-06 12:29:57'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(9, 'paytm', '{\"status\":\"0\",\"paytm_merchant_id\":\"dbzfb\",\"paytm_merchant_key\":\"sdfbsdfb\",\"paytm_merchant_website\":\"dsfbsdf\",\"paytm_channel\":\"sdfbsdf\",\"paytm_industry_type\":\"sdfb\"}', '2020-11-09 09:19:08', '2020-11-09 09:19:56'),
(10, 'company_phone', '000000000', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'MultiVendor eCom', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-02-15-620b5fbcd31a8.png', NULL, '2022-02-15 13:39:32'),
(13, 'company_mobile_logo', '2022-02-16-620ccd55927bc.png', NULL, '2022-02-16 15:39:25'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'Copy@6amtech.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1b7fed\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2022-02-16 15:45:13'),
(19, 'company_footer_logo', '2022-02-15-620b60e16a4d4.png', NULL, '2022-02-15 13:44:25'),
(20, 'company_copyright_text', 'CopyRight @2021', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/ecom.sparedeveloper.tk\\/\"}', NULL, '2022-02-15 23:27:30'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2022-02-16-620ccdeb8ab83.png', '2020-10-11 13:53:02', '2022-02-16 15:41:55'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'multi_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, NULL),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"1\",\"color\":\"#000000\",\"text_color\":\"#ffffff\",\"announcement\":\"Big Deal!\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'timezone', 'Asia/Calcutta', NULL, NULL),
(68, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double(8,2) NOT NULL DEFAULT 1.00,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '1-wl8YY-1656505349', 2, 5.00, '2022-06-29 12:24:49', '2022-06-29 12:24:49'),
(2, '1-OgEv6-1656573683', 2, 5.00, '2022-06-30 07:21:40', '2022-06-30 07:21:40'),
(3, '2-JjxOL-1657021243', 2, 5.00, '2022-07-05 14:28:24', '2022-07-05 14:28:24'),
(4, '1-YGoIu-1657624582', 2, 5.00, '2022-07-12 11:17:28', '2022-07-12 11:17:28'),
(7, '1-wxKZu-1658146140', 2, 5.00, '2022-07-18 12:09:13', '2022-07-18 12:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `id_of_creater` text DEFAULT NULL,
  `selected_cat` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `id_of_creater`, `selected_cat`, `created_at`, `updated_at`, `home_status`) VALUES
(46, 'Laptop', 'laptop', NULL, 0, 0, NULL, '[5]', '2022-12-15 14:19:31', '2022-12-15 16:30:05', 1),
(47, 'Business', 'business', NULL, 46, 0, NULL, NULL, '2022-12-15 14:19:31', '2022-12-15 14:19:31', 1),
(48, ' Dell', 'dell', NULL, 47, 0, NULL, NULL, '2022-12-15 14:19:31', '2022-12-15 14:19:31', 1),
(49, ' Dell Latitute', 'dell-latitute', NULL, 48, 0, NULL, NULL, '2022-12-15 14:19:31', '2022-12-15 14:19:31', 1),
(50, ' Dell Demo', 'dell-demo', NULL, 48, 0, NULL, NULL, '2022-12-15 14:19:31', '2022-12-15 14:19:31', 1),
(51, 'Desktop', 'desktop', NULL, 0, 0, NULL, '[5]', '2022-12-15 16:06:18', '2022-12-15 16:30:05', 1),
(52, 'Business', 'business', NULL, 51, 0, NULL, NULL, '2022-12-15 16:06:18', '2022-12-15 16:06:18', 1),
(53, ' Gaming', 'gaming', NULL, 52, 0, NULL, NULL, '2022-12-15 16:06:18', '2022-12-15 16:06:18', 1),
(54, ' Home Based', 'home-based', NULL, 52, 0, NULL, NULL, '2022-12-15 16:06:18', '2022-12-15 16:06:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_blocks`
--

CREATE TABLE `category_blocks` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT 0,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `level0_id` int(11) DEFAULT NULL,
  `level1_id` varchar(255) DEFAULT NULL,
  `level2_id` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `delete_status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_blocks`
--

INSERT INTO `category_blocks` (`id`, `seller_id`, `admin_id`, `level0_id`, `level1_id`, `level2_id`, `parent_id`, `position`, `delete_status`, `updated_at`, `created_at`) VALUES
(1, 2, 0, 1, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:13:39'),
(2, 2, 0, 2, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:13:39'),
(3, 2, 0, 60, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:13:59'),
(4, 2, 0, 60, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:14:51'),
(5, 2, 0, 61, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:14:51'),
(6, 2, 0, 1, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:23:13'),
(7, 2, 0, 2, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:23:13'),
(8, 2, 0, 59, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:23:13'),
(9, 2, 0, 60, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:23:13'),
(10, 2, 0, 61, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:23:13'),
(11, 2, 0, 1, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:38:39'),
(12, 2, 0, 59, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-19 11:38:39'),
(13, 0, 1, 2, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-19 11:49:08'),
(14, 0, 1, 62, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-19 11:49:28'),
(15, 0, 1, 62, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-19 11:50:01'),
(16, 0, 1, 63, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-19 11:50:01'),
(17, 2, 0, 64, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:22:12'),
(18, 2, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:23:04'),
(19, 2, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:23:27'),
(20, 2, 0, 67, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:23:27'),
(21, 2, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:24:37'),
(22, 2, 0, 68, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-21 11:24:37'),
(23, 0, 1, 65, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-21 12:21:43'),
(24, 0, 1, 69, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-21 12:22:04'),
(25, 0, 1, 69, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-21 12:22:26'),
(26, 0, 1, 70, NULL, NULL, NULL, NULL, 1, '2022-07-28 16:59:23', '2022-07-21 12:22:26'),
(27, 2, 0, 64, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-22 12:01:26'),
(28, 2, 0, 71, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-22 12:01:26'),
(29, 2, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-22 12:01:26'),
(30, 2, 0, 67, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-22 12:01:26'),
(31, 2, 0, 68, NULL, NULL, NULL, NULL, 1, '2022-07-22 17:08:20', '2022-07-22 12:01:26'),
(32, 2, 0, 64, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:20', '2022-07-22 17:08:20'),
(33, 2, 0, 72, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:20', '2022-07-22 17:08:20'),
(34, 2, 0, 66, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:20', '2022-07-22 17:08:20'),
(35, 2, 0, 67, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:20', '2022-07-22 17:08:20'),
(36, 2, 0, 68, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:20', '2022-07-22 17:08:20'),
(37, 2, 0, 73, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:08:42', '2022-07-22 17:08:42'),
(38, 2, 0, 73, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:09:00', '2022-07-22 17:09:00'),
(39, 2, 0, 74, NULL, NULL, NULL, NULL, 0, '2022-07-22 17:09:00', '2022-07-22 17:09:00'),
(40, 4, 0, 64, NULL, NULL, NULL, NULL, 0, '2022-07-27 13:34:47', '2022-07-27 13:34:47'),
(41, 4, 0, 66, NULL, NULL, NULL, NULL, 0, '2022-07-27 13:34:47', '2022-07-27 13:34:47'),
(42, 0, 1, 64, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(43, 0, 1, 65, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(44, 0, 1, 71, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(45, 0, 1, 72, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(46, 0, 1, 66, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(47, 0, 1, 69, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(48, 0, 1, 73, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(49, 0, 1, 67, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(50, 0, 1, 68, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(51, 0, 1, 70, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(52, 0, 1, 74, NULL, NULL, NULL, NULL, 0, '2022-07-28 16:59:23', '2022-07-28 16:59:23'),
(53, 6, 0, 64, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(54, 6, 0, 65, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(55, 6, 0, 66, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(56, 6, 0, 69, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(57, 6, 0, 67, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(58, 6, 0, 68, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(59, 6, 0, 70, NULL, NULL, NULL, NULL, 0, '2022-08-06 17:17:19', '2022-08-06 17:17:19'),
(60, 7, 0, 64, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(61, 7, 0, 65, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(62, 7, 0, 71, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(63, 7, 0, 72, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(64, 7, 0, 66, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(65, 7, 0, 69, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(66, 7, 0, 67, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(67, 7, 0, 68, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(68, 7, 0, 70, NULL, NULL, NULL, NULL, 0, '2022-08-12 16:54:23', '2022-08-12 16:54:23'),
(69, 5, 0, 64, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-08-16 18:09:48'),
(70, 5, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-08-16 18:09:48'),
(71, 5, 0, 67, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-08-16 18:09:48'),
(72, 5, 0, 64, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(73, 5, 0, 65, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(74, 5, 0, 71, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(75, 5, 0, 72, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(76, 5, 0, 66, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(77, 5, 0, 73, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(78, 5, 0, 67, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(79, 5, 0, 74, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-23 11:14:02'),
(80, 5, 0, 75, NULL, NULL, NULL, NULL, 1, '2022-09-24 12:54:38', '2022-09-24 12:52:59'),
(81, 5, 0, 64, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(82, 5, 0, 65, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(83, 5, 0, 71, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(84, 5, 0, 72, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(85, 5, 0, 73, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(86, 5, 0, 66, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(87, 5, 0, 75, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(88, 5, 0, 74, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:54:38', '2022-09-24 12:54:38'),
(89, 5, 0, 75, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:55:25', '2022-09-24 12:55:25'),
(90, 5, 0, 76, NULL, NULL, NULL, NULL, 0, '2022-09-24 12:55:25', '2022-09-24 12:55:25'),
(91, 9, 0, 71, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:14:21', '2022-10-14 15:14:21'),
(92, 9, 0, 77, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:14:48', '2022-10-14 15:14:48'),
(93, 9, 0, 77, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:15:15', '2022-10-14 15:15:15'),
(94, 9, 0, 78, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:15:15', '2022-10-14 15:15:15'),
(95, 9, 0, 79, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:15:42', '2022-10-14 15:15:42'),
(96, 9, 0, 79, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:16:10', '2022-10-14 15:16:10'),
(97, 9, 0, 80, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:16:10', '2022-10-14 15:16:10'),
(98, 9, 0, 81, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:32:26', '2022-10-14 15:32:26'),
(99, 9, 0, 82, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:55:07', '2022-10-14 15:55:07'),
(100, 9, 0, 82, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:55:35', '2022-10-14 15:55:35'),
(101, 9, 0, 83, NULL, NULL, NULL, NULL, 0, '2022-10-14 15:55:35', '2022-10-14 15:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `company_types`
--

CREATE TABLE `company_types` (
  `id` int(11) NOT NULL,
  `company_type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_types`
--

INSERT INTO `company_types` (`id`, `company_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'jewelry', 1, '2022-08-10 18:35:06', '2022-08-12 12:21:27'),
(2, 'Electronics', 1, '2022-08-12 12:34:26', '2022-08-12 12:34:26'),
(3, 'Sports', 1, '2022-08-12 12:36:31', '2022-08-12 12:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `country_code`
--

CREATE TABLE `country_code` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_code`
--

INSERT INTO `country_code` (`id`, `country_name`, `code`) VALUES
(1, NULL, 100),
(2, NULL, 200);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_permission`
--

CREATE TABLE `credit_permission` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `credit_permission` tinyint(4) DEFAULT NULL COMMENT 'yes=1,no=0',
  `delete_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'delete=1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credit_permission`
--

INSERT INTO `credit_permission` (`id`, `seller_id`, `customer_id`, `credit_permission`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 2, 8, 1, 0, '2022-04-05 14:53:49', '2022-04-06 15:41:23'),
(6, 2, 6, 1, 0, '2022-04-06 15:29:59', '2022-04-06 15:41:04'),
(7, 2, 7, 0, 0, '2022-04-06 15:41:46', '2022-04-06 15:41:56'),
(8, 24, 9, 1, 0, '2022-04-08 13:54:14', '2022-04-08 13:57:53'),
(9, 24, 10, 1, 0, '2022-04-08 16:09:25', NULL),
(10, 24, 11, 0, 0, '2022-04-08 17:01:43', '2022-04-08 17:02:30'),
(11, 2, 15, 1, 0, '2022-04-15 13:11:56', NULL),
(12, 2, 18, 0, 0, '2022-04-19 11:51:02', '2022-04-19 11:51:40'),
(13, 2, 19, 1, 0, '2022-04-19 13:51:57', '2022-04-19 13:52:02'),
(14, 5, 7, 0, 0, '2022-12-13 17:49:20', '2022-12-13 17:49:27'),
(15, 5, 4, 0, 0, '2022-12-13 17:49:22', '2022-12-13 17:49:30'),
(16, 5, 8, 0, 0, '2022-12-13 17:49:25', NULL),
(17, 5, 9, 0, 0, '2022-12-13 17:49:27', NULL),
(18, 5, 10, 0, 0, '2022-12-13 17:49:27', NULL),
(19, 5, 6, 0, 0, '2022-12-13 17:49:28', '2022-12-13 17:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `default_currency` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_formate` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `default_currency`, `created_at`, `updated_at`, `currency_formate`) VALUES
(9, 'Bahrain', 'BHD', 'BHD', '1', 1, 1, '2022-03-07 04:43:48', '2022-07-23 17:45:22', 3),
(49, 'India', 'INR', 'INR', '207.9575596817', 1, 0, '2022-03-07 04:43:48', '2022-07-23 17:45:22', 2),
(116, 'United States', '$', 'USD', '2.6525198938992', 1, 0, '2022-03-07 04:43:48', '2022-07-23 17:45:22', 2),
(124, 'BRITAIN', 'GBP', 'GBP', '2.1929177718833', 1, 0, NULL, '2022-07-23 17:45:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13, 'December offer - IT', '106', 13, 103, '19,20,21,22,25', 5, 1, 1, 0, 1, '2022-12-06 19:20:20', '2022-12-13 17:48:08'),
(14, 'December offer - IT', '106', 13, 103, '19,20,21,22,25', 5, 1, 1, 0, 0, '2022-12-06 19:23:22', '2022-12-06 19:23:22'),
(15, 'December offer - IT', '106', 13, 103, '19,20,21,22,25', 5, 1, 1, 0, 0, '2022-12-09 14:56:20', '2022-12-09 14:56:20'),
(16, 'December offer - new copy', '106', 13, 103, '19,20,21,22,25', 5, 1, 1, 0, 0, '2022-12-09 19:50:28', '2022-12-09 19:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'Flash Deal', '2022-02-01', '2023-12-15', 1, 0, NULL, NULL, '2022-02-15-620b45b4d92aa.png', 'flash-deal', '2022-02-15 11:48:28', '2022-02-15 11:48:36', NULL, 'flash_deal'),
(2, 'Buy Now', '2022-12-07', '2022-12-24', 0, 0, NULL, NULL, '2022-12-19-63a061a3a3fbb.png', 'buy-now', '2022-12-19 13:05:39', '2022-12-19 13:05:39', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '0.00', NULL, '2022-02-15 13:24:26', '2022-02-15 13:24:26'),
(4, 1, 10, '0.00', NULL, '2022-12-19 13:06:14', '2022-12-19 13:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60);

-- --------------------------------------------------------

--
-- Table structure for table `newproduct_discounts`
--

CREATE TABLE `newproduct_discounts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newproduct_discounts`
--

INSERT INTO `newproduct_discounts` (`id`, `product_id`, `discount`, `type`, `start_date`, `end_date`, `status`, `updated_at`, `created_at`) VALUES
(5, 50, 80, 'flat', '2022-05-19 16:52:58', '2022-05-29 16:52:58', 0, '0000-00-00', '0000-00-00'),
(7, 50, 10, 'flat', '2022-05-19 17:02:43', NULL, 0, '0000-00-00', '0000-00-00'),
(8, 55, 50, 'percent', '2022-05-04 10:09:21', NULL, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_dates`
--

CREATE TABLE `offer_dates` (
  `id` int(11) NOT NULL,
  `plan_offer_id` int(11) NOT NULL,
  `offer_dates` date NOT NULL,
  `disable` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`) VALUES
(100001, '1', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 5310.0318302387, '19', '2022-07-18 08:20:49', '2022-07-18 08:20:49', 0, NULL, '0', 2, 5.00, '6543-GrryE-1658132449', '171312', 2, 'seller', '{\"id\":19,\"customer_id\":0,\"contact_person_name\":\"dipesh\",\"address_type\":\"home\",\"address\":\"xyz\",\"city\":\"ujjain\",\"zip\":\"456010\",\"phone\":\"9009359677\",\"created_at\":\"2022-07-18T07:29:05.000000Z\",\"updated_at\":\"2022-07-18T07:29:05.000000Z\",\"state\":null,\"country\":\"india\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL),
(100002, '1', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1095, '1', '2022-07-18 11:54:01', '2022-07-18 11:54:01', 0, NULL, '0', 2, 5.00, '9705-IvFgf-1658145241', '575073', 1, 'admin', '{\"id\":1,\"customer_id\":1,\"contact_person_name\":\"Test1\",\"address_type\":\"permanent\",\"address\":\"UJJAIN\",\"city\":\"Ujjain\",\"zip\":\"456010\",\"phone\":\"8888888888\",\"created_at\":\"2022-02-15T13:52:45.000000Z\",\"updated_at\":\"2022-02-15T13:52:45.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 1, '{\"id\":1,\"customer_id\":1,\"contact_person_name\":\"Test1\",\"address_type\":\"permanent\",\"address\":\"UJJAIN\",\"city\":\"Ujjain\",\"zip\":\"456010\",\"phone\":\"8888888888\",\"created_at\":\"2022-02-15T13:52:45.000000Z\",\"updated_at\":\"2022-02-15T13:52:45.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}'),
(100003, '1', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 270.25679045093, '1', '2022-07-18 12:31:05', '2022-07-18 12:31:05', 0, NULL, '0', 2, 5.00, '8055-wenLn-1658147465', '104461', 2, 'seller', '{\"id\":1,\"customer_id\":1,\"contact_person_name\":\"Test1\",\"address_type\":\"permanent\",\"address\":\"UJJAIN\",\"city\":\"Ujjain\",\"zip\":\"456010\",\"phone\":\"8888888888\",\"created_at\":\"2022-02-15T13:52:45.000000Z\",\"updated_at\":\"2022-02-15T13:52:45.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 1, '{\"id\":1,\"customer_id\":1,\"contact_person_name\":\"Test1\",\"address_type\":\"permanent\",\"address\":\"UJJAIN\",\"city\":\"Ujjain\",\"zip\":\"456010\",\"phone\":\"8888888888\",\"created_at\":\"2022-02-15T13:52:45.000000Z\",\"updated_at\":\"2022-02-15T13:52:45.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}'),
(100004, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 747.7099734748, '20', '2022-07-19 08:00:12', '2022-07-19 08:00:12', 0, NULL, '0', 2, 5.00, '2947-bslYP-1658217612', '926487', 2, 'seller', '{\"id\":20,\"customer_id\":0,\"contact_person_name\":\"babu cycle\",\"address_type\":\"home\",\"address\":\"ghfghfghdfgf\",\"city\":\"ujjain\",\"zip\":\"564000\",\"phone\":\"5825825821\",\"created_at\":\"2022-07-19T08:00:06.000000Z\",\"updated_at\":\"2022-07-19T08:00:06.000000Z\",\"state\":null,\"country\":\"india\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL),
(100005, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1105, '21', '2022-07-20 12:03:04', '2022-07-20 12:03:04', 0, NULL, '0', 2, 5.00, '1124-9tMvj-1658309584', '947908', 1, 'admin', '{\"id\":21,\"customer_id\":0,\"contact_person_name\":\"baba bahi\",\"address_type\":\"home\",\"address\":\"asfasf\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"5829637417\",\"created_at\":\"2022-07-20T09:32:55.000000Z\",\"updated_at\":\"2022-07-20T09:32:55.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL),
(100006, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 95, '22', '2022-07-20 12:18:58', '2022-07-20 12:18:58', 0, NULL, '0', 2, 5.00, '1467-v2zYI-1658310538', '431073', 1, 'admin', '{\"id\":22,\"customer_id\":3,\"contact_person_name\":\"monu\",\"address_type\":\"home\",\"address\":\"fgfgygyygykg\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7418529637\",\"created_at\":\"2022-07-20T09:48:48.000000Z\",\"updated_at\":\"2022-07-20T09:48:48.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL),
(100007, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 275, '24', '2022-07-20 12:33:32', '2022-07-20 12:33:32', 0, NULL, '0', 2, 5.00, '5004-dzYeB-1658311412', '546102', 1, 'admin', '{\"id\":24,\"customer_id\":7,\"contact_person_name\":\"customer Ganga narang\",\"address_type\":\"home\",\"address\":\"edghjkkl\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"00973 33929629\",\"created_at\":\"2022-07-20T10:03:23.000000Z\",\"updated_at\":\"2022-07-20T10:03:23.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, NULL, NULL),
(100008, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 244.39045092838, '22', '2022-07-21 11:54:57', '2022-07-21 11:54:57', 0, NULL, '0', 2, 5.00, '3904-LktbD-1658384697', '943750', 2, 'seller', '{\"id\":22,\"customer_id\":3,\"contact_person_name\":\"monu\",\"address_type\":\"home\",\"address\":\"fgfgygyygykg\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7418529637\",\"created_at\":\"2022-07-20T06:48:48.000000Z\",\"updated_at\":\"2022-07-20T06:48:48.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 22, '{\"id\":22,\"customer_id\":3,\"contact_person_name\":\"monu\",\"address_type\":\"home\",\"address\":\"fgfgygyygykg\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7418529637\",\"created_at\":\"2022-07-20T06:48:48.000000Z\",\"updated_at\":\"2022-07-20T06:48:48.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}'),
(100009, '8', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 90, '3', '2022-07-27 13:46:11', '2022-07-27 13:46:11', 0, NULL, '0', 2, 5.00, '7832-08TLE-1658909771', '109456', 4, 'seller', '{\"id\":3,\"customer_id\":8,\"contact_person_name\":\"Gopal venu\",\"address_type\":\"home\",\"address\":\"89, paratha gali Indore M.P. India\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7539514068\",\"created_at\":\"2022-04-07T02:50:16.000000Z\",\"updated_at\":\"2022-04-07T02:50:16.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 3, '{\"id\":3,\"customer_id\":8,\"contact_person_name\":\"Gopal venu\",\"address_type\":\"home\",\"address\":\"89, paratha gali Indore M.P. India\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7539514068\",\"created_at\":\"2022-04-07T02:50:16.000000Z\",\"updated_at\":\"2022-04-07T02:50:16.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}'),
(100010, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 3305, '22', '2022-08-06 18:42:03', '2022-08-06 18:42:03', 0, NULL, '0', 2, 5.00, '3533-9fmbp-1659791523', '763694', 1, 'admin', '{\"id\":22,\"customer_id\":3,\"contact_person_name\":\"monu\",\"address_type\":\"home\",\"address\":\"fgfgygyygykg\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7418529637\",\"created_at\":\"2022-07-20T06:48:48.000000Z\",\"updated_at\":\"2022-07-20T06:48:48.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 22, '{\"id\":22,\"customer_id\":3,\"contact_person_name\":\"monu\",\"address_type\":\"home\",\"address\":\"fgfgygyygykg\",\"city\":\"Indore\",\"zip\":\"485001\",\"phone\":\"7418529637\",\"created_at\":\"2022-07-20T06:48:48.000000Z\",\"updated_at\":\"2022-07-20T06:48:48.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `on_credit` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `on_credit`) VALUES
(1, 100001, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T07:45:51.000000Z\",\"updated_at\":\"2022-02-15T06:20:33.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 0, 0, 'pending', 'unpaid', '2022-02-15 13:53:01', '2022-02-15 13:53:01', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(2, 100002, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T07:36:32.000000Z\",\"updated_at\":\"2022-02-15T06:20:34.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-02-18 17:22:06', '2022-02-18 17:22:06', NULL, 'OrangeRed', '{\"color\":\"OrangeRed\"}', 'discount_on_product', 1, NULL),
(3, 100007, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":810,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":3,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:45:51.000000Z\",\"updated_at\":\"2022-02-18T12:23:02.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 1, 810, 0, 0, 'pending', 'unpaid', '2022-04-08 09:55:08', '2022-04-08 09:55:08', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, 1),
(4, 100007, 4, 2, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Dual alarm clock with bed shaker\",\"slug\":\"dual-alarm-clock-with-bed-shaker-v4Ibfa\",\"category_ids\":\"[{\\\"id\\\":\\\"14\\\",\\\"position\\\":1}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c94b77955.png\\\",\\\"2022-02-10-6204c94b780b1.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c94b78423.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":35,\"purchase_price\":40,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":7,\"details\":\"<h1>About this item<\\/h1>\\r\\n\\r\\n<ul>\\r\\n\\t<li>SMALL BUT MIGHTY - If it takes an earthquake or siren to wake you up, this classically designed clock is exactly what you are looking for. The 3-level adjustable shaker is perfect for heavy sleeper or those with hearing loss. You also have the option to combine the vibration with the built-in alarm sound (buzzer, bird or music).<\\/li>\\r\\n\\t<li>EASY TO SETUP - Turning the two &ldquo;ears&rdquo; to set the time and alarm is extremely intuitive and straightforward. With all buttons clearly labeled and almost no two functions sharing the same button, it is a breeze to use right out of the box and change settings.<\\/li>\\r\\n\\t<li>CUSTOMIZABLE ALARM&nbsp;- The brightness of the classic is dial-controlled and adjustable from 0 to 100%. Dual alarms satisfy the need of anyone who shares the bed with a partner on a different morning schedule. Snooze allows extra 9 minutes of slumber.<\\/li>\\r\\n\\t<li>USB PORTS AND BATTERY BACKUP&nbsp;- 1 USB port located at the back will&nbsp;charge your mobile device while you sleep. AC-powered, but you have the option to back it up with 2 AAA batteries (NOT included) in case of power outage. Not only time and settings are restored, but alarms are also supported (vibration and USB will not work).<\\/li>\\r\\n\\t<li>If you have any questions or comments, please don&rsquo;t hesitate to contact us - we are always here to help.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T11:14:03.000000Z\",\"updated_at\":\"2022-04-08T07:10:50.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 35, 0, 0, 'pending', 'unpaid', '2022-04-08 09:55:08', '2022-04-08 09:55:08', NULL, '', '[]', 'discount_on_product', 1, 1),
(5, 100008, 3, 2, '{\"id\":3,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Ledger nano s - the best crypto hardware wallet\",\"slug\":\"ledger-nano-s-the-best-crypto-hardware-wallet-u9I8wR\",\"category_ids\":\"[{\\\"id\\\":\\\"13\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c806ae54f.png\\\",\\\"2022-02-10-6204c806af439.png\\\",\\\"2022-02-10-6204c806afa55.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c806b025e.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Black\\\",\\\"price\\\":25,\\\"sku\\\":\\\"Lns-tbchw-Black\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":25,\"purchase_price\":30,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>Cryptocurrency Hardware Wallet: allows you to send and receive crypto assets, securely and conveniently. Your Ledger hardware wallet can easily be connected into a computer and managed through the Ledger Live companion app. The Ledger Nano S keeps your private keys protected<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Secure: Your confidential data is never exposed: it is stored inside a strongly isolated Secure Chip and locked by an 8 digit PIN code<\\/li>\\r\\n\\t<li>Multicurrency: enables you to manage multiple assets on the same device, and supports over 30 cryptocurrencies and all ERC20 tokens<\\/li>\\r\\n\\t<li>Easy to use: designed around an intuitive user experience. check and confirm transactions on the built-in display and confirm with using the two physical buttons (anti-malware second factor verification)<\\/li>\\r\\n\\t<li>Backup &amp; restore: Your accounts are backed up on a recovery sheet, and can easily be restored on any Ledger device or compatible wallet (BIP39\\/BIP44)<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h3>Ledger Live: You&#39;re go-to for managing crypto<\\/h3>\\r\\n\\r\\n<p>- Check your balance in real-time<\\/p>\\r\\n\\r\\n<p>- Easy send &amp; receive your coins<\\/p>\\r\\n\\r\\n<p>- Earn crypto rewards while holding<\\/p>\\r\\n\\r\\n<p>- Support 23 coins and more than 1250 ERC-20 tokens<\\/p>\\r\\n\\r\\n<p>For coins not supported in Ledger Live, you can manage them using other compatible wallets.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T11:08:38.000000Z\",\"updated_at\":\"2022-02-15T09:20:12.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 25, 0, 0, 'pending', 'unpaid', '2022-04-08 10:00:54', '2022-04-08 10:00:54', NULL, 'Black', '{\"color\":\"Black\"}', 'discount_on_product', 1, NULL),
(6, 100009, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":20,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-08T08:02:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 65.01, 13, 0, 'pending', 'unpaid', '2022-04-08 11:01:29', '2022-04-08 11:01:29', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, 1),
(7, 100010, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":20,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-08T09:37:02.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-08 13:09:38', '2022-04-08 13:09:38', NULL, '', '[]', 'discount_on_product', 1, 1),
(8, 100011, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":10}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-08T11:25:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 0, 0, 'pending', 'unpaid', '2022-04-08 14:02:38', '2022-04-08 14:02:38', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(9, 100012, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-02-18T14:52:06.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:13', '2022-04-14 09:34:13', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(10, 100013, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":0}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":0,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-04-14T07:04:13.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:19', '2022-04-14 09:34:19', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(11, 100014, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":-1}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":-1,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-04-14T07:04:19.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:30', '2022-04-14 09:34:30', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(12, 100015, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":-2}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":-2,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-04-14T07:04:30.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:30', '2022-04-14 09:34:30', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(13, 100016, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":810,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:45:51.000000Z\",\"updated_at\":\"2022-04-08T07:25:08.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 1, 810, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:35', '2022-04-14 09:34:35', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(14, 100017, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":810,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:45:51.000000Z\",\"updated_at\":\"2022-04-14T07:04:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 1, 810, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:41', '2022-04-14 09:34:41', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(15, 100018, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":-3}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":-3,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-04-14T07:04:30.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:44', '2022-04-14 09:34:44', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(16, 100019, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Women\'s long-sleeve lightweight french terry fleece quarter-zip top\",\"slug\":\"womens-long-sleeve-lightweight-french-terry-fleece-quarter-zip-top-EGD2mP\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"4\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c08016017.png\\\",\\\"2022-02-10-6204c08016b3d.png\\\",\\\"2022-02-10-6204c08016e69.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c0801721b.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF4500\\\",\\\"#FF0000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"OrangeRed\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-OrangeRed\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Red\\\",\\\"price\\\":18,\\\"sku\\\":\\\"Wllftfqt-Red\\\",\\\"qty\\\":-4}]\",\"published\":0,\"unit_price\":18,\"purchase_price\":20,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":-4,\"details\":\"<p>60% Cotton, 40% Polyester<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>This quarter-zip up top in incredibly soft and comfortable French terry fleece is a go-to for an easy, casual look<\\/li>\\r\\n\\t<li>Features long-sleeves, patch front kangaroo pocket, high collar, and ribbing at the neck, cuffs and hem<\\/li>\\r\\n\\t<li>Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>Product details<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Package Dimensions :&nbsp;12.44 x 11.89 x 1.89 inches; 10.58 Ounces<\\/li>\\r\\n\\t<li>Item model number :&nbsp;AE18111988<\\/li>\\r\\n\\t<li>Department :&nbsp;Womens<\\/li>\\r\\n\\t<li>Date First Available :&nbsp;February 6, 2020<\\/li>\\r\\n\\t<li>Manufacturer :&nbsp;Amazon Essentials<\\/li>\\r\\n\\t<li>ASIN :&nbsp;B07W6NPBVV<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:36:32.000000Z\",\"updated_at\":\"2022-04-14T07:04:44.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 18, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:46', '2022-04-14 09:34:46', NULL, 'Red', '{\"color\":\"Red\"}', 'discount_on_product', 1, NULL),
(17, 100020, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":810,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":-1},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":0,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:45:51.000000Z\",\"updated_at\":\"2022-04-14T07:04:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 1, 810, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:51', '2022-04-14 09:34:51', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(18, 100021, 2, 2, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Boys\' Saltwater 1\\/4-zip Pullover Sweatshirt\",\"slug\":\"boys-saltwater-14-zip-pullover-sweatshirt-eyN94S\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2},{\\\"id\\\":\\\"8\\\",\\\"position\\\":3}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-10-6204c2afc86de.png\\\",\\\"2022-02-10-6204c2afca065.png\\\"]\",\"thumbnail\":\"2022-02-10-6204c2afca567.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#A9A9A9\\\",\\\"#E0FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DarkGray-L\\\",\\\"price\\\":810,\\\"sku\\\":\\\"BS1PS-DarkGray-L\\\",\\\"qty\\\":-2},{\\\"type\\\":\\\"LightCyan-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"BS1PS-LightCyan-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":-1,\"details\":\"<p><strong>About This Item:<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>100% Cotton<\\/li>\\r\\n\\t<li>Imported<\\/li>\\r\\n\\t<li>Zipper closure<\\/li>\\r\\n\\t<li>Machine Wash<\\/li>\\r\\n\\t<li>BOY&rsquo;S 1\\/4-ZIP PULLOVER SWEATSHIRT &ndash; Dad&rsquo;s favorite vineyard vines men&rsquo;s pullover sweater, in the perfect size for his little guy. This must-have boys quarter zip pullover has our signature whale embroidered logo on the chest.<\\/li>\\r\\n\\t<li>INCREDIBLY SOFT FABRIC &ndash; The best just got better. This boys pullover sweater features our incredibly soft fabric that is comfy, strong and breathable, perfect for any adventure.<\\/li>\\r\\n\\t<li>EASY WEAR 1\\/4-ZIP UP &ndash; Cool and comfortable, just like Dad. This pullover sweatshirt for boys features all the polished details of Dad&rsquo;s go-to pullover, in a soft 100% Pima cotton that is perfect for little guys. Fits true to size.<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<ul>\\r\\n\\t<li>STYLISH AND COMFORTABLE &ndash; This boys 1\\/4 zip pullover has long sleeves, a self-collar, open seam cuffs and an open hem. It&rsquo;s perfect for chilly evenings, special occasions and everyday wear, too.<\\/li>\\r\\n\\t<li>LIVE THE GOOD LIFE &ndash; At vineyard vines, we think Every Day Should Feel This Good! We are family owned and operated since 1998. For over 20 years, we&rsquo;ve been sharing the gift of the Vineyard with everyone we can.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-10T10:45:51.000000Z\",\"updated_at\":\"2022-04-14T07:04:51.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 1, 810, 0, 0, 'pending', 'unpaid', '2022-04-14 09:34:52', '2022-04-14 09:34:52', NULL, 'DarkGray-L', '{\"color\":\"DarkGray\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `on_credit`) VALUES
(19, 100022, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":18,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-08T08:31:29.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 65.01, 13, 0, 'pending', 'unpaid', '2022-04-14 09:50:15', '2022-04-14 09:50:15', NULL, 'Aqua-90', '{\"color\":\"Aqua\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(20, 100023, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":19,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-08T10:39:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-14 09:50:38', '2022-04-14 09:50:38', NULL, '', '[]', 'discount_on_product', 1, NULL),
(21, 100024, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":17,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-14T07:20:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-14 10:04:10', '2022-04-14 10:04:10', NULL, '', '[]', 'discount_on_product', 1, NULL),
(22, 100025, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":9}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-08T11:32:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 0, 0, 'pending', 'unpaid', '2022-04-14 10:04:32', '2022-04-14 10:04:32', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(23, 100026, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":16,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T07:20:15.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:00', '2022-04-14 13:04:00', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(24, 100026, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":8}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T09:23:36.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:00', '2022-04-14 13:04:00', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(25, 100027, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":15,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:04', '2022-04-14 13:04:04', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(26, 100027, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":7}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:04', '2022-04-14 13:04:04', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(27, 100028, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":14,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:10', '2022-04-14 13:04:10', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(28, 100028, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":6}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":6,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:10', '2022-04-14 13:04:10', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(29, 100029, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":13,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:16', '2022-04-14 13:04:16', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(30, 100029, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:16', '2022-04-14 13:04:16', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(31, 100030, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-1},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":12,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:18', '2022-04-14 13:04:18', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(32, 100030, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":4,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:18', '2022-04-14 13:04:18', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(33, 100031, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-2},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":11,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:20', '2022-04-14 13:04:20', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(34, 100031, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:20', '2022-04-14 13:04:20', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(35, 100032, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-3},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 65.01, 6.5, 0, 'pending', 'unpaid', '2022-04-14 13:04:20', '2022-04-14 13:04:20', NULL, 'AliceBlue-90', '{\"color\":\"AliceBlue\",\"Size\":\"90\"}', 'discount_on_product', 1, NULL),
(36, 100032, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":2}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 13:04:20', '2022-04-14 13:04:20', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(37, 100033, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":16,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-14T07:34:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-14 14:20:22', '2022-04-14 14:20:22', NULL, '', '[]', 'discount_on_product', 1, NULL),
(38, 100034, 9, 24, '{\"id\":9,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Chair\",\"slug\":\"chair-eNytB1\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-62501b872e9b0.png\\\"]\",\"thumbnail\":\"2022-04-08-62501b873105a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-AliceBlue\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":450,\"purchase_price\":480,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>Best Chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T11:24:55.000000Z\",\"updated_at\":\"2022-04-14T10:34:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Chair\",\"meta_description\":\"Best chair for you\",\"meta_image\":\"2022-04-08-62501b87319b6.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 45, 0, 'pending', 'unpaid', '2022-04-14 14:20:44', '2022-04-14 14:20:44', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(39, 100035, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":15,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-14T11:50:22.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:47:57', '2022-04-15 09:51:35', NULL, '', '[]', 'discount_on_product', 0, NULL),
(40, 100036, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":13,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:17:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:02', '2022-04-15 09:51:01', NULL, '', '[]', 'discount_on_product', 0, NULL),
(41, 100037, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-14T10:34:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-15 09:48:19', '2022-04-15 09:51:16', NULL, 'Aqua-120', '{\"color\":\"Aqua\",\"Size\":\"120\"}', 'discount_on_product', 0, NULL),
(42, 100038, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-15T07:18:19.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-15 09:48:24', '2022-04-15 09:51:49', NULL, 'Aqua-120', '{\"color\":\"Aqua\",\"Size\":\"120\"}', 'discount_on_product', 0, NULL),
(43, 100039, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":11,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:02.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:36', '2022-04-15 09:51:58', NULL, '', '[]', 'discount_on_product', 0, NULL),
(44, 100040, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-15T07:18:24.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-15 09:48:41', '2022-04-15 09:52:06', NULL, 'AliceBlue-120', '{\"color\":\"AliceBlue\",\"Size\":\"120\"}', 'discount_on_product', 0, NULL),
(45, 100041, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:36.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:42', '2022-04-15 09:52:13', NULL, '', '[]', 'discount_on_product', 0, NULL),
(46, 100042, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":6,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-15T07:18:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-15 09:48:46', '2022-04-15 09:52:21', NULL, 'AliceBlue-120', '{\"color\":\"AliceBlue\",\"Size\":\"120\"}', 'discount_on_product', 0, NULL),
(47, 100043, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:42.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:55', '2022-04-19 09:16:20', NULL, '', '[]', 'discount_on_product', 0, NULL),
(48, 100044, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:55.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:55', '2022-04-15 09:48:55', NULL, '', '[]', 'discount_on_product', 1, NULL),
(49, 100045, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":3,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:55.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:57', '2022-04-15 09:48:57', NULL, '', '[]', 'discount_on_product', 1, NULL);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `on_credit`) VALUES
(50, 100046, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:18:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-15 09:48:57', '2022-04-15 09:48:57', NULL, '', '[]', 'discount_on_product', 1, NULL),
(51, 100047, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-15T07:18:46.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-15 09:48:58', '2022-04-15 09:48:58', NULL, 'Aqua-120', '{\"color\":\"Aqua\",\"Size\":\"120\"}', 'discount_on_product', 1, NULL),
(52, 100048, 10, 2, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Cooler-box1\",\"slug\":\"cooler-box1-SeTx3o\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-6259445065213.png\\\",\\\"2022-04-15-625944506f72e.png\\\",\\\"2022-04-15-625944506ff2b.png\\\"]\",\"thumbnail\":\"2022-04-15-6259445070839.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"M\\\",\\\"SM\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"C-Amethyst-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":750,\\\"sku\\\":\\\"C-Amethyst-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-SM\\\",\\\"price\\\":700,\\\"sku\\\":\\\"C-Amethyst-SM\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":780,\\\"sku\\\":\\\"C-Aqua-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":730,\\\"sku\\\":\\\"C-Aqua-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-SM\\\",\\\"price\\\":680,\\\"sku\\\":\\\"C-Aqua-SM\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":1,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":6,\"details\":\"<p>my New Coller box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:09:20.000000Z\",\"updated_at\":\"2022-04-15T10:13:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 8, 16, 'pending', 'unpaid', '2022-04-15 13:02:21', '2022-04-15 13:02:21', NULL, 'Amethyst-L', '{\"color\":\"Amethyst\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(53, 100049, 11, 2, '{\"id\":11,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Tv 2\",\"slug\":\"tv-2-27RcnQ\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594776f144e.png\\\"]\",\"thumbnail\":\"2022-04-15-62594776f3bdc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"Md\\\",\\\"s\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":500,\\\"sku\\\":\\\"C-Amethyst-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-Md\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-Amethyst-Md\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-s\\\",\\\"price\\\":400,\\\"sku\\\":\\\"C-Amethyst-s\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-L\\\",\\\"price\\\":500,\\\"sku\\\":\\\"C-Aquamarine-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-Md\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-Aquamarine-Md\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-s\\\",\\\"price\\\":400,\\\"sku\\\":\\\"C-Aquamarine-s\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":500,\"purchase_price\":550,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":6,\"details\":\"<p>my new T.V<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:22:47.000000Z\",\"updated_at\":\"2022-04-15T10:23:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 500, 5, 5, 'pending', 'unpaid', '2022-04-15 13:02:43', '2022-04-15 13:02:43', NULL, 'Amethyst-L', '{\"color\":\"Amethyst\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(54, 100050, 10, 2, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Cooler-box1\",\"slug\":\"cooler-box1-SeTx3o\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-6259445065213.png\\\",\\\"2022-04-15-625944506f72e.png\\\",\\\"2022-04-15-625944506ff2b.png\\\"]\",\"thumbnail\":\"2022-04-15-6259445070839.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"M\\\",\\\"SM\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"C-Amethyst-L\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":750,\\\"sku\\\":\\\"C-Amethyst-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-SM\\\",\\\"price\\\":700,\\\"sku\\\":\\\"C-Amethyst-SM\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":780,\\\"sku\\\":\\\"C-Aqua-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":730,\\\"sku\\\":\\\"C-Aqua-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-SM\\\",\\\"price\\\":680,\\\"sku\\\":\\\"C-Aqua-SM\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":1,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":5,\"details\":\"<p>my New Coller box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:09:20.000000Z\",\"updated_at\":\"2022-04-15T10:32:21.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 8, 16, 'pending', 'unpaid', '2022-04-15 13:03:00', '2022-04-15 13:03:00', NULL, 'Amethyst-L', '{\"color\":\"Amethyst\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(55, 100051, 10, 2, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Cooler-box1\",\"slug\":\"cooler-box1-SeTx3o\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-6259445065213.png\\\",\\\"2022-04-15-625944506f72e.png\\\",\\\"2022-04-15-625944506ff2b.png\\\"]\",\"thumbnail\":\"2022-04-15-6259445070839.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"M\\\",\\\"SM\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"C-Amethyst-L\\\",\\\"qty\\\":-1},{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":750,\\\"sku\\\":\\\"C-Amethyst-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-SM\\\",\\\"price\\\":700,\\\"sku\\\":\\\"C-Amethyst-SM\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":780,\\\"sku\\\":\\\"C-Aqua-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":730,\\\"sku\\\":\\\"C-Aqua-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-SM\\\",\\\"price\\\":680,\\\"sku\\\":\\\"C-Aqua-SM\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":1,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":4,\"details\":\"<p>my New Coller box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:09:20.000000Z\",\"updated_at\":\"2022-04-15T10:33:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 8, 16, 'pending', 'unpaid', '2022-04-15 13:03:04', '2022-04-15 13:03:04', NULL, 'Amethyst-L', '{\"color\":\"Amethyst\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(56, 100052, 13, 2, '{\"id\":13,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"new Bike\",\"slug\":\"new-bike-ypqYYS\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594e1602534.png\\\"]\",\"thumbnail\":\"2022-04-15-62594e160602c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst\\\",\\\"price\\\":40000,\\\"sku\\\":\\\"nB-Amethyst\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":40000,\\\"sku\\\":\\\"nB-Aqua\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40000,\"purchase_price\":45000,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p>my new bike<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:51:02.000000Z\",\"updated_at\":\"2022-04-15T10:51:28.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 40000, 400, 0, 'pending', 'unpaid', '2022-04-15 13:24:47', '2022-04-15 13:24:47', NULL, 'Amethyst', '{\"color\":\"Amethyst\"}', 'discount_on_product', 1, NULL),
(57, 100052, 12, 2, '{\"id\":12,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"coller New\",\"slug\":\"coller-new-tBaYfU\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594d3335dd1.png\\\"]\",\"thumbnail\":\"2022-04-15-62594d3339717.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"cN-AntiqueWhite-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"cN-Aqua-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p>best new coller<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:47:15.000000Z\",\"updated_at\":\"2022-04-15T10:48:24.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 8, 0, 'pending', 'unpaid', '2022-04-15 13:24:47', '2022-04-15 13:24:47', NULL, 'AntiqueWhite-L', '{\"color\":\"AntiqueWhite\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(58, 100053, 13, 2, '{\"id\":13,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"new Bike\",\"slug\":\"new-bike-ypqYYS\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594e1602534.png\\\"]\",\"thumbnail\":\"2022-04-15-62594e160602c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst\\\",\\\"price\\\":40000,\\\"sku\\\":\\\"nB-Amethyst\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Aqua\\\",\\\"price\\\":40000,\\\"sku\\\":\\\"nB-Aqua\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":40000,\"purchase_price\":45000,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>my new bike<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:51:02.000000Z\",\"updated_at\":\"2022-04-15T10:54:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 40000, 400, 0, 'pending', 'unpaid', '2022-04-15 13:25:08', '2022-04-15 13:25:08', NULL, 'Amethyst', '{\"color\":\"Amethyst\"}', 'discount_on_product', 1, NULL),
(59, 100053, 12, 2, '{\"id\":12,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"coller New\",\"slug\":\"coller-new-tBaYfU\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":6,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594d3335dd1.png\\\"]\",\"thumbnail\":\"2022-04-15-62594d3339717.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"cN-AntiqueWhite-L\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":800,\\\"sku\\\":\\\"cN-Aqua-L\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":850,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>best new coller<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:47:15.000000Z\",\"updated_at\":\"2022-04-15T10:54:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 8, 0, 'pending', 'unpaid', '2022-04-15 13:25:08', '2022-04-15 13:25:08', NULL, 'AntiqueWhite-L', '{\"color\":\"AntiqueWhite\",\"Size\":\"L\"}', 'discount_on_product', 1, NULL),
(60, 100054, 11, 2, '{\"id\":11,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Tv 2\",\"slug\":\"tv-2-27RcnQ\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-15-62594776f144e.png\\\"]\",\"thumbnail\":\"2022-04-15-62594776f3bdc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#7FFFD4\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"Md\\\",\\\"s\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":500,\\\"sku\\\":\\\"C-Amethyst-L\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Amethyst-Md\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-Amethyst-Md\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-s\\\",\\\"price\\\":400,\\\"sku\\\":\\\"C-Amethyst-s\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-L\\\",\\\"price\\\":500,\\\"sku\\\":\\\"C-Aquamarine-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-Md\\\",\\\"price\\\":450,\\\"sku\\\":\\\"C-Aquamarine-Md\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aquamarine-s\\\",\\\"price\\\":400,\\\"sku\\\":\\\"C-Aquamarine-s\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":500,\"purchase_price\":550,\"tax\":1,\"tax_type\":\"percent\",\"discount\":1,\"discount_type\":\"percent\",\"current_stock\":5,\"details\":\"<p>my new T.V<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-15T10:22:47.000000Z\",\"updated_at\":\"2022-04-15T10:32:43.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 450, 4.5, 4.5, 'pending', 'unpaid', '2022-04-15 14:04:17', '2022-04-15 14:04:17', NULL, 'Amethyst-Md', '{\"color\":\"Amethyst\",\"Size\":\"Md\"}', 'discount_on_product', 1, NULL),
(61, 100055, 8, 24, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"Era Wine\",\"slug\":\"era-wine-GvqOVp\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-625001fc8eba5.png\\\"]\",\"thumbnail\":\"2022-04-08-625001fc91346.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1.3002210375764,\"purchase_price\":2.6004420751528,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>This era wine<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T09:35:56.000000Z\",\"updated_at\":\"2022-04-15T07:22:32.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Era Wine\",\"meta_description\":\"Era Wine for you\",\"meta_image\":\"2022-04-08-625001fc91e64.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1.3, 0, 0, 'pending', 'unpaid', '2022-04-19 08:24:12', '2022-04-19 09:17:33', NULL, '', '[]', 'discount_on_product', 1, NULL),
(62, 100055, 7, 24, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":24,\"name\":\"volts cooler\",\"slug\":\"volts-cooler-YTRJ0V\",\"category_ids\":\"[{\\\"id\\\":\\\"15\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-08-624feb8e796c8.png\\\"]\",\"thumbnail\":\"2022-04-08-624feb8e7cd86.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"90\\\",\\\"120\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-AliceBlue-90\\\",\\\"qty\\\":-4},{\\\"type\\\":\\\"AliceBlue-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-AliceBlue-120\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-90\\\",\\\"price\\\":65.01105187882,\\\"sku\\\":\\\"vc-Aqua-90\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Aqua-120\\\",\\\"price\\\":130.02210375764,\\\"sku\\\":\\\"vc-Aqua-120\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":65.01105187882,\"purchase_price\":65.01105187882,\"tax\":10,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"details\":\"<p>This is best cooler<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-08T08:00:14.000000Z\",\"updated_at\":\"2022-04-15T07:22:21.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"MeGa Cooler\",\"meta_description\":\"Our Cooler are best\",\"meta_image\":\"2022-04-08-624feb8e7d790.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 130.02, 13, 0, 'pending', 'unpaid', '2022-04-19 08:24:12', '2022-04-19 09:17:33', NULL, 'Aqua-120', '{\"color\":\"Aqua\",\"Size\":\"120\"}', 'discount_on_product', 1, NULL),
(63, 100056, 15, 2, '{\"id\":15,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"best mobile\",\"slug\":\"best-mobile-CuWqC5\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"23\\\",\\\"position\\\":2},{\\\"id\\\":\\\"25\\\",\\\"position\\\":3}]\",\"brand_id\":6,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-19-625e6d83c4186.png\\\"]\",\"thumbnail\":\"2022-04-19-625e6d83c6f1a.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"23\\\\\\/23\\\",\\\"13\\\\\\/13\\\",\\\"33\\\\\\/33\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-23\\\\\\/23\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"bm-Amethyst-23\\\\\\/23\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Amethyst-13\\\\\\/13\\\",\\\"price\\\":4500,\\\"sku\\\":\\\"bm-Amethyst-13\\\\\\/13\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Amethyst-33\\\\\\/33\\\",\\\"price\\\":5000,\\\"sku\\\":\\\"bm-Amethyst-33\\\\\\/33\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"AntiqueWhite-23\\\\\\/23\\\",\\\"price\\\":4800,\\\"sku\\\":\\\"bm-AntiqueWhite-23\\\\\\/23\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-13\\\\\\/13\\\",\\\"price\\\":4500,\\\"sku\\\":\\\"bm-AntiqueWhite-13\\\\\\/13\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-33\\\\\\/33\\\",\\\"price\\\":5000,\\\"sku\\\":\\\"bm-AntiqueWhite-33\\\\\\/33\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":5000,\"purchase_price\":5400,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":12,\"details\":\"<p>best price mobile<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-19T08:06:27.000000Z\",\"updated_at\":\"2022-04-19T08:07:30.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 5000, 50, 0, 'pending', 'unpaid', '2022-04-19 10:48:12', '2022-04-19 10:48:12', NULL, 'Amethyst-33/33', '{\"color\":\"Amethyst\",\"Size\":\"33\\/33\"}', 'discount_on_product', 1, NULL),
(64, 100057, 14, 2, '{\"id\":14,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"best mobile\",\"slug\":\"best-mobile-1ngpOL\",\"category_ids\":\"[{\\\"id\\\":\\\"9\\\",\\\"position\\\":1},{\\\"id\\\":\\\"23\\\",\\\"position\\\":2},{\\\"id\\\":\\\"25\\\",\\\"position\\\":3}]\",\"brand_id\":4,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-04-19-625e695411fee.png\\\",\\\"2022-04-19-625e69541b166.png\\\"]\",\"thumbnail\":\"2022-04-19-625e69541b86c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"20\\\\\\/20\\\",\\\"10\\\\\\/10\\\",\\\"15\\\\\\/15\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-20\\\\\\/20\\\",\\\"price\\\":4000,\\\"sku\\\":\\\"-Amethyst-20\\\\\\/20\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-10\\\\\\/10\\\",\\\"price\\\":3500,\\\"sku\\\":\\\"-Amethyst-10\\\\\\/10\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-15\\\\\\/15\\\",\\\"price\\\":3800,\\\"sku\\\":\\\"-Amethyst-15\\\\\\/15\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-20\\\\\\/20\\\",\\\"price\\\":4000,\\\"sku\\\":\\\"-Aqua-20\\\\\\/20\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-10\\\\\\/10\\\",\\\"price\\\":3500,\\\"sku\\\":\\\"-Aqua-10\\\\\\/10\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Aqua-15\\\\\\/15\\\",\\\"price\\\":3800,\\\"sku\\\":\\\"-Aqua-15\\\\\\/15\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":4000,\"purchase_price\":4200,\"tax\":1,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":6,\"details\":\"<p>best new mobile<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-04-19T07:48:36.000000Z\",\"updated_at\":\"2022-04-19T07:56:29.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 4000, 40, 0, 'pending', 'unpaid', '2022-04-19 10:48:34', '2022-04-19 10:48:34', NULL, 'Amethyst-20/20', '{\"color\":\"Amethyst\",\"Size\":\"20\\/20\"}', 'discount_on_product', 1, NULL),
(65, 100001, 3, 2, '{\"id\":3,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"hulk\",\"item_code\":\"h876\",\"part_no\":null,\"serial_no\":null,\"slug\":\"hulk-qI4Sc1\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":0},{\\\"id\\\":\\\"31\\\",\\\"position\\\":1},{\\\"id\\\":\\\"32\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-18-62d50acc42503.png\\\"]\",\"thumbnail\":\"2022-07-18-62d50acc46f3c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":2652.5198938992,\"purchase_price\":1061.0079575597,\"tax\":20,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":20,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-18T07:25:00.000000Z\",\"updated_at\":\"2022-07-18T07:25:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-18-62d50acc47324.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 2652.5198938992, 1061, 1061.0079575597, 'pending', 'unpaid', '2022-07-18 08:20:49', '2022-07-18 08:20:49', NULL, '', '[]', 'discount_on_product', 1, NULL),
(66, 100002, 6, 1, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"HotWheel\",\"item_code\":\"HW121\",\"part_no\":null,\"serial_no\":null,\"slug\":\"hotwheel-R900eh\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":0},{\\\"id\\\":\\\"3\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-18-62d53f9b99892.png\\\"]\",\"thumbnail\":\"2022-07-18-62d53f9b9c38a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":200,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":10,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-18T11:10:19.000000Z\",\"updated_at\":\"2022-07-18T11:51:45.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-18-62d53f9b9cb5b.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1000, 100, 10, 'pending', 'unpaid', '2022-07-18 11:54:01', '2022-07-18 11:54:01', NULL, '', '[]', 'discount_on_product', 1, NULL),
(67, 100003, 8, 2, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Taj Mahal\",\"item_code\":\"tm12\",\"part_no\":null,\"serial_no\":null,\"slug\":\"taj-mahal-IzMgJS\",\"category_ids\":\"[{\\\"id\\\":\\\"56\\\",\\\"position\\\":0},{\\\"id\\\":\\\"57\\\",\\\"position\\\":1},{\\\"id\\\":\\\"58\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-18-62d54f8a10653.png\\\"]\",\"thumbnail\":\"2022-07-18-62d54f8a12d64.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":265.25198938992,\"purchase_price\":53.050397877984,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":10,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-18T12:18:18.000000Z\",\"updated_at\":\"2022-07-18T12:19:31.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-18-62d54f8a13534.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 265.25198938992, 26.53, 26.525198938992, 'pending', 'unpaid', '2022-07-18 12:31:05', '2022-07-18 12:31:05', NULL, '', '[]', 'discount_on_product', 1, NULL),
(68, 100004, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Type One\",\"item_code\":\"TYPEONE\",\"part_no\":\"SDM\",\"serial_no\":null,\"slug\":\"type-one-vqkusL\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":0},{\\\"id\\\":\\\"59\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":null,\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-19-62d64675c8c7f.png\\\"]\",\"thumbnail\":\"2022-07-19-62d64675cea41.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"10\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-10\\\",\\\"price\\\":795.7559681697613,\\\"sku\\\":\\\"TO-Amethyst-10\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":795.75596816976,\"purchase_price\":397.87798408488,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":1,\"details\":\"<p>best type one<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-19T05:51:49.000000Z\",\"updated_at\":\"2022-07-19T06:14:37.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Best Type\",\"meta_description\":\"Best Type One\",\"meta_image\":\"2022-07-19-62d64675cf5f9.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 795.75596816976, 79.58, 132.62599469496, 'pending', 'unpaid', '2022-07-19 08:00:12', '2022-07-19 08:00:12', NULL, 'Amethyst-10', '{\"color\":\"Amethyst\",\"Size\":\"10\"}', 'discount_on_product', 1, NULL),
(69, 100005, 2, 1, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Type Two admin\",\"item_code\":\"TYPETWO\",\"part_no\":null,\"serial_no\":null,\"slug\":\"type-two-admin-KYJpAQ\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":0},{\\\"id\\\":\\\"62\\\",\\\"position\\\":1},{\\\"id\\\":\\\"63\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":null,\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-19-62d6511211468.png\\\"]\",\"thumbnail\":\"2022-07-19-62d6511213b78.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#9966CC\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Color\\\",\\\"options\\\":[\\\"RRED\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Amethyst-RRED\\\",\\\"price\\\":500,\\\"sku\\\":\\\"TTa-Amethyst-RRED\\\",\\\"qty\\\":60}]\",\"published\":0,\"unit_price\":500,\"purchase_price\":400,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":60,\"details\":\"<p>best Type Two<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-19T04:07:06.000000Z\",\"updated_at\":\"2022-07-19T04:07:06.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Type Two admin\",\"meta_description\":\"Type Two admin\",\"meta_image\":\"2022-07-19-62d6511214349.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":2,\"customer_id\":1,\"comment\":\"Very good product, I am loving it.\",\"attachment\":\"[]\",\"rating\":5,\"status\":1,\"created_at\":\"2022-02-16T13:20:01.000000Z\",\"updated_at\":\"2022-02-16T13:20:01.000000Z\"}]}', 2, 500, 100, 0, 'pending', 'unpaid', '2022-07-20 12:03:04', '2022-07-20 12:03:04', NULL, 'Amethyst-RRED', '{\"color\":\"Amethyst\",\"Color\":\"RRED\"}', 'discount_on_product', 1, NULL),
(70, 100006, 3, 1, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"last_test\",\"item_code\":\"lt1\",\"part_no\":null,\"serial_no\":null,\"slug\":\"last-test-OetkVh\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":0},{\\\"id\\\":\\\"62\\\",\\\"position\\\":1},{\\\"id\\\":\\\"63\\\",\\\"position\\\":2}]\",\"brand_id\":4,\"unit\":\"3\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-20-62d7ce6e4fabb.png\\\"]\",\"thumbnail\":\"2022-07-20-62d7ce6e5abac.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":100,\\\"sku\\\":\\\"l-AliceBlue\\\",\\\"qty\\\":10}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":20,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":10,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-20T09:44:14.000000Z\",\"updated_at\":\"2022-07-20T09:44:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-20-62d7ce6e5c5dc.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 10, 20, 'pending', 'unpaid', '2022-07-20 12:18:58', '2022-07-20 12:18:58', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(71, 100007, 3, 1, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"last_test\",\"item_code\":\"lt1\",\"part_no\":null,\"serial_no\":null,\"slug\":\"last-test-OetkVh\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":0},{\\\"id\\\":\\\"62\\\",\\\"position\\\":1},{\\\"id\\\":\\\"63\\\",\\\"position\\\":2}]\",\"brand_id\":4,\"unit\":\"3\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-20-62d7ce6e4fabb.png\\\"]\",\"thumbnail\":\"2022-07-20-62d7ce6e5abac.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":100,\\\"sku\\\":\\\"l-AliceBlue\\\",\\\"qty\\\":9}]\",\"published\":0,\"unit_price\":100,\"purchase_price\":20,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":9,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-20T09:44:14.000000Z\",\"updated_at\":\"2022-07-20T09:48:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-20-62d7ce6e5c5dc.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 3, 100, 30, 60, 'pending', 'unpaid', '2022-07-20 12:33:32', '2022-07-20 12:33:32', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL),
(72, 100008, 1, 2, '{\"id\":1,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Galaxy 2X4\",\"item_code\":\"G1\",\"part_no\":null,\"serial_no\":null,\"slug\":\"galaxy-2x4-eFjyp1\",\"category_ids\":\"[{\\\"id\\\":\\\"64\\\",\\\"position\\\":0},{\\\"id\\\":\\\"66\\\",\\\"position\\\":1},{\\\"id\\\":\\\"67\\\",\\\"position\\\":2}]\",\"brand_id\":6,\"unit\":\"1\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-07-21-62d8ee91191f4.png\\\"]\",\"thumbnail\":\"2022-07-21-62d8ee9119649.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":252,\"purchase_price\":106,\"tax\":5,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":100,\"details\":\"<p>AFFORDABLE SHOES<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-07-21T06:13:37.000000Z\",\"updated_at\":\"2022-07-21T06:20:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-21-62d8ee9119733.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 251.98938992042, 12.6, 25.198938992042, 'pending', 'unpaid', '2022-07-21 11:54:57', '2022-07-21 11:54:57', NULL, '', '[]', 'discount_on_product', 1, NULL),
(73, 100009, 7, 4, '{\"id\":7,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"football\",\"item_code\":\"101678\",\"part_no\":\"5454\",\"serial_no\":\"5656\",\"slug\":\"football-K1EFpg\",\"category_ids\":\"[{\\\"id\\\":\\\"64\\\",\\\"position\\\":0},{\\\"id\\\":\\\"66\\\",\\\"position\\\":1}]\",\"brand_id\":null,\"unit\":\"1\",\"min_qty\":23,\"refundable\":0,\"images\":\"[\\\"def.png\\\",\\\"2022-07-27-62e0f21cca1d4.png\\\"]\",\"thumbnail\":\"2022-07-27-62e0f21cca42d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=2D-rr4gv3fk\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":20,\"tax\":5,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":100,\"details\":\"<p>hhhhh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2022-07-27T08:08:13.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-07-27-62e0f21cca4fd.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 100, 5, 20, 'pending', 'unpaid', '2022-07-27 13:46:11', '2022-07-27 13:46:11', NULL, '', '[]', 'discount_on_product', 1, NULL),
(74, 100010, 9, 1, '{\"id\":9,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"black berry\",\"item_code\":\"1231\",\"part_no\":null,\"serial_no\":null,\"slug\":\"black-berry-KKH0ht\",\"category_ids\":\"[{\\\"id\\\":\\\"65\\\",\\\"position\\\":0},{\\\"id\\\":\\\"69\\\",\\\"position\\\":1}]\",\"brand_id\":null,\"unit\":null,\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-06-62ee6783a5cf8.png\\\"]\",\"thumbnail\":\"2022-08-06-62ee6783a5f68.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":3000,\\\"sku\\\":\\\"bb-AliceBlue\\\",\\\"qty\\\":20}]\",\"published\":0,\"unit_price\":4000,\"purchase_price\":1000,\"tax\":10,\"tax_type\":\"percent\",\"discount\":null,\"discount_type\":null,\"current_stock\":20,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-06T13:07:15.000000Z\",\"updated_at\":\"2022-08-06T13:07:15.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-08-06-62ee6783a603f.png\",\"request_status\":1,\"denied_note\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 3000, 300, 0, 'pending', 'unpaid', '2022-08-06 18:42:03', '2022-08-06 18:42:03', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(2, 100001, '800.00', '800.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2022-02-16 15:49:13', '2022-02-16 15:49:13', 1, 'seller', 'admin', 'cash_on_delivery', '5293-qIS98-1645006753', 1),
(24, 100011, '450.00', '450.00', '0.00', 'admin', 'disburse', '5.00', '0.00', '2022-04-08 14:36:18', '2022-04-08 14:36:18', 11, 'seller', 'admin', 'cash_on_delivery', '7246-cmEyK-1649419578', 2),
(2, 100053, '40800.00', '40800.00', '0.00', 'admin', 'disburse', '5.00', '408.00', '2022-04-15 13:46:46', '2022-04-15 13:46:46', 17, 'seller', 'admin', 'cash_on_delivery', '6529-rb7fD-1650021406', 3),
(2, 100054, '445.50', '445.50', '0.00', 'admin', 'disburse', '5.00', '4.50', '2022-04-15 14:09:00', '2022-04-15 14:09:00', 17, 'seller', 'admin', 'cash_on_delivery', '8050-eitwy-1650022740', 4),
(24, 100055, '131.32', '131.32', '0.00', 'admin', 'disburse', '5.00', '13.00', '2022-04-19 09:17:33', '2022-04-19 09:17:33', 18, 'seller', 'admin', 'cash_on_delivery', '7942-2B19D-1650350853', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plantabs_invoices`
--

CREATE TABLE `plantabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plantabs_invoices`
--

INSERT INTO `plantabs_invoices` (`id`, `seller_id`, `plan_id`, `result`, `amount`, `currency`, `transaction_id`, `card_brand`, `card_first_six_digits`, `card_last_four_digits`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'success', 200.00, '9', 0, NULL, NULL, NULL, '2022-05-11 07:34:55', NULL),
(2, 2, 2, 'success', 200.00, '9', 0, NULL, NULL, NULL, '2022-05-11 09:58:54', NULL),
(3, 3, 1, 'success', 80.00, '9', 0, NULL, NULL, NULL, '2022-07-23 17:39:32', NULL),
(4, 4, 2, 'success', 200.00, '9', 0, NULL, NULL, NULL, '2022-07-27 13:19:08', NULL),
(5, 5, 2, 'success', 200.00, '9', 0, NULL, NULL, NULL, '2022-07-29 13:33:40', NULL),
(6, 6, 1, 'success', 100.00, '9', 0, NULL, NULL, NULL, '2022-08-06 17:15:06', NULL),
(7, 7, 3, 'success', 500.00, '9', 0, NULL, NULL, NULL, '2022-08-12 16:49:59', NULL),
(8, 8, 2, 'success', 200.00, '9', 0, NULL, NULL, NULL, '2022-10-14 13:37:51', NULL),
(9, 9, 3, 'success', 500.00, '9', 0, NULL, NULL, NULL, '2022-10-14 15:11:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan_offers`
--

CREATE TABLE `plan_offers` (
  `id` int(11) NOT NULL,
  `offer_title` varchar(250) DEFAULT NULL,
  `plan_id` int(11) NOT NULL,
  `new_ammount` int(11) NOT NULL,
  `offer_startdate` date NOT NULL,
  `offer_enddate` date DEFAULT NULL,
  `hold` tinyint(4) NOT NULL DEFAULT 0,
  `offer_delete` tinyint(4) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_offers`
--

INSERT INTO `plan_offers` (`id`, `offer_title`, `plan_id`, `new_ammount`, `offer_startdate`, `offer_enddate`, `hold`, `offer_delete`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Get best prices', 1, 80, '2022-03-15', '2022-03-20', 0, 0, NULL, '2022-03-15 14:16:07', '2022-03-15 14:20:44'),
(2, 'Yearly offer', 1, 700, '2022-03-15', '2022-03-20', 0, 0, 'Best offer for this season', '2022-03-15 18:37:48', '2022-03-17 17:45:18'),
(8, 'Sankaranti Offer', 3, 450, '2022-03-21', '2022-03-31', 0, 0, 'get this offer and save upto 100 bugs', '2022-03-21 10:58:47', '2022-03-21 10:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `possible_combination_elements`
--

CREATE TABLE `possible_combination_elements` (
  `id` int(11) NOT NULL,
  `combination_string` longtext NOT NULL,
  `seller_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `possible_combination_elements`
--

INSERT INTO `possible_combination_elements` (`id`, `combination_string`, `seller_id`, `created_at`, `updated_at`) VALUES
(448, '[[\"color\",\"#F0F8FF\"],[\"Size\",\"12\"],[\"RAM\",\"128\",\"125\"]]', 5, '2022-12-17 14:45:42', '2022-12-17 14:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `possible_variant`
--

CREATE TABLE `possible_variant` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `str` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `possible_variant`
--

INSERT INTO `possible_variant` (`id`, `seller_id`, `str`, `sku`, `status`, `updated_at`, `created_at`) VALUES
(4244, 5, '#F0F8FF-12-128', NULL, 1, '2022-12-17 14:45:42', '2022-12-17 14:45:42'),
(4245, 5, '#F0F8FF-12-125', NULL, 1, '2022-12-17 14:45:42', '2022-12-17 14:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `system_item_code` varchar(255) DEFAULT NULL COMMENT 'System generated item code (seller-prduct))',
  `item_code` varchar(255) DEFAULT NULL,
  `part_no` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` varchar(255) DEFAULT '',
  `thumbnail` varchar(255) NOT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'flag on(1):-variant present\r\n',
  `discount_flag` tinyint(4) DEFAULT 0 COMMENT 'On(1),if any discount',
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double(8,3) NOT NULL DEFAULT 0.000,
  `purchase_price` double(8,3) NOT NULL DEFAULT 0.000,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) DEFAULT NULL COMMENT 'not in use',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `system_item_code`, `item_code`, `part_no`, `serial_no`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `discount_flag`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`) VALUES
(10, 'seller', 5, 'Dell', '0005-00001', 'sdlf-sdfsdf', 'ssadfasdf', NULL, 'dell-GHl5Xf', '[\"46\"]', 1, '1', 1, 1, '[\"2022-12-17-639d88df627ae.png\"]', '2022-12-17-639d88df691ef.png', NULL, NULL, 'youtube', NULL, '[\"#F0F8FF\"]', 1, 0, '[\"1\",\"2\"]', '[{\"name\":\"choice_1\",\"title\":\"Size\",\"options\":[\"12\"]},{\"name\":\"choice_2\",\"title\":\"RAM\",\"options\":[\"128\",\"125\"]}]', '[]', 0, 1000.000, 0.000, '0', 'percent', NULL, NULL, 150, '<p>sdfklasdjklf</p>', 0, NULL, '2022-12-17 09:16:15', '2022-12-17 09:16:15', 1, 1, NULL, NULL, 'def.png', 1, NULL);

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
  `not_applied` int(11) DEFAULT 0,
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

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `orignalstr` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `discount_percent` double(16,2) DEFAULT 0.00,
  `startDuration` datetime NOT NULL,
  `endDuration` datetime NOT NULL,
  `buyquantity` int(11) DEFAULT NULL,
  `freequantity` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `verify_status` int(11) NOT NULL DEFAULT 0 COMMENT 'all possible variants',
  `isEnable` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'used while edit enable=1,disable=0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `type`, `orignalstr`, `price`, `sku`, `qty`, `discount`, `discount_percent`, `startDuration`, `endDuration`, `buyquantity`, `freequantity`, `item`, `verify_status`, `isEnable`, `created_at`, `updated_at`) VALUES
(1, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Dell Business Model-Black-15-4GB-256GB', 5, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(2, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Dell Business Model-Black-15-4GB-512GB', 5, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(3, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Dell Business Model-Black-15-4GB-1TB', 10, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(4, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Dell Business Model-Black-15-8GB-256GB', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(5, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Dell Business Model-Black-15-8GB-512GB', 25, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(6, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Dell Business Model-Black-15-8GB-1TB', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(7, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Dell Business Model-Black-15-16GB-256GB', 10, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-13 23:54:36', '2022-12-14 23:16:08'),
(8, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(9, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(10, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(11, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(12, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 25, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(13, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(14, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:04:50', '2022-12-14 23:16:08'),
(15, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-14 23:16:08'),
(16, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:05:36', '2022-12-14 23:16:08'),
(17, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-14 23:16:08'),
(18, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-14 23:16:08'),
(19, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 1000, 'Black-15-8GB-512GB', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-15 15:28:18'),
(20, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 1000, 'Black-15-8GB-1TB', 230, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-15 15:28:18'),
(21, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 1000, 'Black-15-16GB-256GB', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:36', '2022-12-15 15:28:18'),
(22, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 100, 'Black-15-4GB-256GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(23, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 400, 'Black-15-4GB-512GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(24, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 375, 'Black-15-4GB-1TB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(25, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 325, 'Black-15-8GB-256GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(26, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 325, 'Black-15-8GB-512GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(27, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 325, 'Black-15-8GB-1TB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(28, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 360, 'Black-15-16GB-256GB', 5, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:05:51', '2022-12-15 15:28:18'),
(29, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 400, 'Black-15-4GB-256GB', 2, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(30, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 350, 'Black-15-4GB-512GB', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(31, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(32, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 5220, 'Black-15-8GB-256GB', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(33, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(34, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(35, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:07:35', '2022-12-15 15:28:18'),
(36, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 5566, 'Black-15-4GB-256GB', 42, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(37, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(38, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(39, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(40, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(41, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(42, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 55884, 'Black-15-16GB-256GB', 78, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:06', '2022-12-15 15:28:18'),
(43, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(44, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(45, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(46, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(47, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(48, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(49, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:19', '2022-12-15 15:28:18'),
(50, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(51, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(52, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(53, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(54, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(55, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(56, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:12:34', '2022-12-15 15:28:18'),
(57, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(58, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(59, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(60, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(61, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(62, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 350, 'Black-15-8GB-1TB', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(63, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:14:37', '2022-12-15 15:28:18'),
(64, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 5220, 'Black-15-4GB-256GB', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(65, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(66, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(67, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(68, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 5566, 'Black-15-8GB-512GB', 42, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(69, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 2500, 'Black-15-8GB-1TB', 250, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(70, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:11', '2022-12-15 15:28:18'),
(71, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(72, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(73, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(74, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 55884, 'Black-15-8GB-256GB', 78, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(75, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(76, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(77, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-14 23:15:52', '2022-12-15 15:28:18'),
(78, 1, '#000000-15-4GB-256GB', '#000000-15-4GB-256GB', 0, 'Black-15-4GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(79, 1, '#000000-15-4GB-512GB', '#000000-15-4GB-512GB', 0, 'Black-15-4GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(80, 1, '#000000-15-4GB-1TB', '#000000-15-4GB-1TB', 0, 'Black-15-4GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(81, 1, '#000000-15-8GB-256GB', '#000000-15-8GB-256GB', 0, 'Black-15-8GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(82, 1, '#000000-15-8GB-512GB', '#000000-15-8GB-512GB', 0, 'Black-15-8GB-512GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(83, 1, '#000000-15-8GB-1TB', '#000000-15-8GB-1TB', 0, 'Black-15-8GB-1TB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(84, 1, '#000000-15-16GB-256GB', '#000000-15-16GB-256GB', 0, 'Black-15-16GB-256GB', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:16:08', '2022-12-15 15:28:18'),
(85, 2, '#F0F8FF-10-12', '#F0F8FF-10-12', 0, 'AliceBlue-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-14 23:37:31', '2022-12-15 15:28:18'),
(86, 2, '#F0F8FF-11-12', '#F0F8FF-11-12', 0, 'AliceBlue-11-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-14 23:37:31', '2022-12-15 15:28:18'),
(87, 2, '#9966CC-10-12', '#9966CC-10-12', 0, 'Amethyst-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:37:31', '2022-12-15 15:28:18'),
(88, 2, '#9966CC-11-12', '#9966CC-11-12', 0, 'Amethyst-11-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-14 23:37:31', '2022-12-15 15:28:18'),
(89, 3, '#F0F8FF-10-12', '#F0F8FF-10-12', 0, 'AliceBlue-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(90, 3, '#F0F8FF-10-23', '#F0F8FF-10-23', 0, 'AliceBlue-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(91, 3, '#F0F8FF-12-12', '#F0F8FF-12-12', 0, 'AliceBlue-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(92, 3, '#F0F8FF-12-23', '#F0F8FF-12-23', 0, 'AliceBlue-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(93, 3, '#9966CC-10-12', '#9966CC-10-12', 0, 'Amethyst-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(94, 3, '#9966CC-10-23', '#9966CC-10-23', 350, 'Amethyst-10-23', 10, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(95, 3, '#9966CC-12-12', '#9966CC-12-12', 0, 'Amethyst-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(96, 3, '#9966CC-12-23', '#9966CC-12-23', 5220, 'Amethyst-12-23', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:32', '2022-12-15 15:28:18'),
(97, 3, '#F0F8FF-10-12', '#F0F8FF-10-12', 0, 'AliceBlue-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(98, 3, '#F0F8FF-10-23', '#F0F8FF-10-23', 0, 'AliceBlue-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(99, 3, '#F0F8FF-12-12', '#F0F8FF-12-12', 0, 'AliceBlue-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(100, 3, '#F0F8FF-12-23', '#F0F8FF-12-23', 5566, 'AliceBlue-12-23', 42, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(101, 3, '#9966CC-10-12', '#9966CC-10-12', 2500, 'Amethyst-10-12', 250, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(102, 3, '#9966CC-10-23', '#9966CC-10-23', 0, 'Amethyst-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(103, 3, '#9966CC-12-12', '#9966CC-12-12', 0, 'Amethyst-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(104, 3, '#9966CC-12-23', '#9966CC-12-23', 0, 'Amethyst-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:14:50', '2022-12-15 15:28:18'),
(105, 3, '#F0F8FF-10-12', '#F0F8FF-10-12', 0, '#F0F8FF-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(106, 3, '#F0F8FF-10-23', '#F0F8FF-10-23', 55884, '#F0F8FF-10-23', 78, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(107, 3, '#F0F8FF-12-12', '#F0F8FF-12-12', 0, '#F0F8FF-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(108, 3, '#F0F8FF-12-23', '#F0F8FF-12-23', 0, '#F0F8FF-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(109, 3, '#9966CC-10-12', '#9966CC-10-12', 0, '#9966CC-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(110, 3, '#9966CC-10-23', '#9966CC-10-23', 0, '#9966CC-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(111, 3, '#9966CC-12-12', '#9966CC-12-12', 0, '#9966CC-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(112, 3, '#9966CC-12-23', '#9966CC-12-23', 0, '#9966CC-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:19:24', '2022-12-15 15:28:18'),
(113, 3, '#F0F8FF-10-12', '#F0F8FF-10-12', 0, '#F0F8FF-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(114, 3, '#F0F8FF-10-23', '#F0F8FF-10-23', 0, '#F0F8FF-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(115, 3, '#F0F8FF-12-12', '#F0F8FF-12-12', 0, '#F0F8FF-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(116, 3, '#F0F8FF-12-23', '#F0F8FF-12-23', 0, '#F0F8FF-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(117, 3, '#9966CC-10-12', '#9966CC-10-12', 0, '#9966CC-10-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(118, 3, '#9966CC-10-23', '#9966CC-10-23', 0, '#9966CC-10-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(119, 3, '#9966CC-12-12', '#9966CC-12-12', 0, '#9966CC-12-12', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(120, 3, '#9966CC-12-23', '#9966CC-12-23', 0, '#9966CC-12-23', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 0, '2022-12-15 13:19:45', '2022-12-15 15:28:18'),
(121, 3, '#F0F8FF-12-125', '#F0F8FF-12-125', 0, 'AliceBlue-12-125', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:23:06', '2022-12-15 15:28:18'),
(122, 3, '#F0F8FF-25-125', '#F0F8FF-25-125', 0, 'AliceBlue-25-125', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:23:06', '2022-12-15 15:28:18'),
(123, 3, '#9966CC-12-125', '#9966CC-12-125', 0, 'Amethyst-12-125', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:23:06', '2022-12-15 15:28:18'),
(124, 3, '#9966CC-25-125', '#9966CC-25-125', 0, 'Amethyst-25-125', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:23:06', '2022-12-15 15:28:18'),
(125, 3, '#F0F8FF-12-125', '#F0F8FF-12-125', 100, 'AliceBlue-12-125', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:25:50', '2022-12-15 15:28:18'),
(126, 3, '#F0F8FF-25-125', '#F0F8FF-25-125', 350, 'AliceBlue-25-125', 12, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:25:50', '2022-12-15 15:28:18'),
(127, 3, '#9966CC-12-125', '#9966CC-12-125', 555, 'Amethyst-12-125', 23, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:25:50', '2022-12-15 15:28:18'),
(128, 3, '#9966CC-25-125', '#9966CC-25-125', 5220, 'Amethyst-25-125', 20, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:25:50', '2022-12-15 15:28:18'),
(129, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:35:15', '2022-12-15 15:28:18'),
(130, 4, '#9966CC-15-2', '#9966CC-15-2', 0, 'Amethyst-15-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:35:15', '2022-12-15 15:28:18'),
(131, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:35:15', '2022-12-15 15:28:18'),
(132, 4, '#9966CC-12-2', '#9966CC-12-2', 5566, 'Amethyst-12-2', 42, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:35:15', '2022-12-15 15:28:18'),
(133, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:39:29', '2022-12-15 15:28:18'),
(134, 4, '#9966CC-15-2', '#9966CC-15-2', 0, 'Amethyst-15-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:39:29', '2022-12-15 15:28:18'),
(135, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:39:29', '2022-12-15 15:28:18'),
(136, 4, '#9966CC-12-2', '#9966CC-12-2', 0, 'Amethyst-12-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:39:29', '2022-12-15 15:28:18'),
(137, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:45:50', '2022-12-15 15:28:18'),
(138, 4, '#9966CC-15-2', '#9966CC-15-2', 55884, 'Amethyst-15-2', 78, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:45:50', '2022-12-15 15:28:18'),
(139, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:45:50', '2022-12-15 15:28:18'),
(140, 4, '#9966CC-12-2', '#9966CC-12-2', 0, 'Amethyst-12-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:45:50', '2022-12-15 15:28:18'),
(141, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:48:45', '2022-12-15 15:28:18'),
(142, 4, '#9966CC-15-2', '#9966CC-15-2', 0, 'Amethyst-15-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:48:46', '2022-12-15 15:28:18'),
(143, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:48:46', '2022-12-15 15:28:18'),
(144, 4, '#9966CC-12-2', '#9966CC-12-2', 0, 'Amethyst-12-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:48:46', '2022-12-15 15:28:18'),
(145, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:49:28', '2022-12-15 15:28:18'),
(146, 4, '#9966CC-15-2', '#9966CC-15-2', 0, 'Amethyst-15-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:49:28', '2022-12-15 15:28:18'),
(147, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:49:28', '2022-12-15 15:28:18'),
(148, 4, '#9966CC-12-2', '#9966CC-12-2', 0, 'Amethyst-12-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 0, '2022-12-15 13:49:28', '2022-12-15 15:28:18'),
(149, 4, '#9966CC-15-15', '#9966CC-15-15', 0, 'Amethyst-15-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:50:13', '2022-12-15 15:28:18'),
(150, 4, '#9966CC-15-2', '#9966CC-15-2', 0, 'Amethyst-15-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:50:13', '2022-12-15 15:28:18'),
(151, 4, '#9966CC-12-15', '#9966CC-12-15', 0, 'Amethyst-12-15', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:50:13', '2022-12-15 15:28:18'),
(152, 4, '#9966CC-12-2', '#9966CC-12-2', 0, 'Amethyst-12-2', 0, NULL, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-15 13:50:13', '2022-12-15 15:28:18'),
(153, 5, '#F0F8FF-256-256', '#F0F8FF-256-256', 0, 'New Product-AliceBlue-256-256', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:32:42', '2022-12-16 20:32:42'),
(154, 5, '#F0F8FF-256-512', '#F0F8FF-256-512', 0, 'New Product-AliceBlue-256-512', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:32:42', '2022-12-16 20:32:42'),
(155, 5, '#F0F8FF-128-256', '#F0F8FF-128-256', 0, 'New Product-AliceBlue-128-256', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:32:42', '2022-12-16 20:32:42'),
(156, 6, '#000000-128-256', '#000000-128-256', 1000, 'New Product Checkig-Black-128-256', 40, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(157, 6, '#000000-128-512', '#000000-128-512', 1000, 'New Product Checkig-Black-128-512', 40, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(158, 6, '#000000-256-256', '#000000-256-256', 1000, 'New Product Checkig-Black-256-256', 20, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(159, 6, '#000000-256-512', '#000000-256-512', 0, 'New Product Checkig-Black-256-512', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(160, 6, '#A0522D-128-256', '#A0522D-128-256', 0, 'New Product Checkig-Sienna-128-256', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(161, 6, '#A0522D-128-512', '#A0522D-128-512', 0, 'New Product Checkig-Sienna-128-512', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(162, 6, '#A0522D-256-256', '#A0522D-256-256', 0, 'New Product Checkig-Sienna-256-256', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(163, 6, '#A0522D-256-512', '#A0522D-256-512', 0, 'New Product Checkig-Sienna-256-512', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:39:44', '2022-12-16 20:39:44'),
(164, 7, '#F0F8FF-128-125', '#F0F8FF-128-125', 1000, 'New Produ-AliceBlue-128-125', 100, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:46:16', '2022-12-16 20:46:16'),
(165, 7, '#9966CC-128-125', '#9966CC-128-125', 0, 'New Produ-Amethyst-128-125', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:46:16', '2022-12-16 20:46:16'),
(166, 8, '#F0F8FF-128-1215', '#F0F8FF-128-1215', 1000, 'New klsdjfklasjklfkl-AliceBlue-128-1215', 50, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:49:28', '2022-12-16 20:49:28'),
(167, 8, '#F0F8FF-125-1215', '#F0F8FF-125-1215', 1000, 'New klsdjfklasjklfkl-AliceBlue-125-1215', 25, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:49:28', '2022-12-16 20:49:28'),
(168, 8, '#9966CC-128-1215', '#9966CC-128-1215', 1000, 'New klsdjfklasjklfkl-Amethyst-128-1215', 25, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:49:28', '2022-12-16 20:49:28'),
(169, 8, '#9966CC-125-1215', '#9966CC-125-1215', 0, 'New klsdjfklasjklfkl-Amethyst-125-1215', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:49:28', '2022-12-16 20:49:28'),
(170, 9, '#00FFFF-125', '#00FFFF-125', 1000, 'Cheigin-Aqua-125', 100, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-16 20:54:34', '2022-12-16 20:54:34'),
(171, 9, '#7FFFD4-125', '#7FFFD4-125', 0, 'Cheigin-Aquamarine-125', 0, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 0, 1, '2022-12-16 20:54:34', '2022-12-16 20:54:34'),
(172, 10, '#F0F8FF-12-128', '#F0F8FF-12-128', 1000, 'Dell-AliceBlue-12-128', 100, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-17 14:46:15', '2022-12-17 14:46:15'),
(173, 10, '#F0F8FF-12-125', '#F0F8FF-12-125', 1000, 'Dell-AliceBlue-12-125', 50, 0, 0.00, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, 1, 1, '2022-12-17 14:46:15', '2022-12-17 14:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Very good product, I am loving it.', '[]', 5, 1, '2022-02-16 15:50:01', '2022-02-16 15:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `country_code` int(11) NOT NULL,
  `seller_currency` int(11) DEFAULT NULL COMMENT 'not in use as shift to shop table',
  `seller_plan_request` int(11) DEFAULT NULL,
  `plan_offer_id` int(11) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `new_seller_status` varchar(100) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `one_time_login_status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `country_code`, `seller_currency`, `seller_plan_request`, `plan_offer_id`, `image`, `email`, `password`, `status`, `new_seller_status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `one_time_login_status`) VALUES
(1, 'rambo', 'amazon', '7999928743', 1, 49, 2, NULL, '2022-05-11-627b6620c49b9.png', 'rambo@gmail.com', '$2y$10$TXcMlQ4wWIjli6fO1F9KM.Hk/zaJo9AITFEcLlyL4utGqYCYCf8YW', 'approved', 'active', NULL, '2022-05-11 07:30:40', '2022-05-11 07:36:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 'rinku', 'singh', '9009359677', 1, 9, 2, NULL, '2022-05-11-627b881400585.png', 'rinku@gmail.com', '$2y$10$TXcMlQ4wWIjli6fO1F9KM.Hk/zaJo9AITFEcLlyL4utGqYCYCf8YW', 'approved', 'active', NULL, '2022-05-11 09:55:32', '2022-05-12 12:26:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'sivdas', 'sir', '8855446611', 1, 9, 1, 1, '2022-07-23-62dbe483230ea.png', 'sivdas@tallybahrain.com', '$2y$10$BOqiECqU282tLI0Ie4EPqem1txKaGayn6ca4vQg.mMQvPmiOG41Vi', 'approved', 'active', NULL, '2022-07-23 17:37:31', '2022-07-23 17:41:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 'jack', 'roy', '9981977945', 99, 9, 2, NULL, '2022-07-27-62e0ed42ea867.png', 'jackroy@gmail.com', '$2y$10$BvbER4gVSx1bWoGPuQUrYeLMX.VsbGGbfdg2KAc/FgIuhBBlaSX6S', 'approved', 'active', NULL, '2022-07-27 13:16:11', '2022-07-27 13:22:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 'Chetan', 'Sharma', '8855224477', 99, 9, 2, NULL, '2022-07-29-62e3935362173.png', 'chetan@gmail.com', '$2y$10$TXcMlQ4wWIjli6fO1F9KM.Hk/zaJo9AITFEcLlyL4utGqYCYCf8YW', 'approved', 'active', 'pL3ixTxeWmWtqtqqmqiF1o4FZyIAvSVRLmCkA2Q9u1Jr84FupvQqqhiDcKb8', '2022-07-29 13:29:15', '2022-09-24 12:51:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 'Govinda', 'Dada', '8585858585', 99, 9, 1, NULL, '2022-08-06-62ee52e2def99.png', 'govinda@gmail.com', '$2y$10$O35EOKQopRJpF9wjEdbKeuGEPknZnSxyMITJMuQXG/y/IBObevP0e', 'approved', 'active', NULL, '2022-08-06 17:09:14', '2022-08-06 17:15:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'Roma', 'Sharma', '7418529637', 39, 9, 3, NULL, '2022-08-12-62f63363edac4.png', 'roma@gmail.com', '$2y$10$YPaNpFx1WKfsMk0MXvJEnOvb1HeOX3rcKuCAsu81hJiNxvZWVk0dq', 'approved', 'active', NULL, '2022-08-12 16:33:00', '2022-08-12 16:51:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 'Mangal', 'Dada', '8899556622', 17, 9, 2, NULL, 'def.png', 'mangal@gmail.com', '$2y$10$ng2N9gZmsNpGaAjsblpWN.qvxvTLiEiqj7.iN9u3lkDc1llM0UCFe', 'approved', 'active', NULL, '2022-10-14 13:35:49', '2022-10-14 14:06:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 'Gimy', 'gopal', '8527419631', 17, 9, 3, NULL, 'def.png', 'gimy@gmail.com', '$2y$10$TXcMlQ4wWIjli6fO1F9KM.Hk/zaJo9AITFEcLlyL4utGqYCYCf8YW', 'approved', 'active', NULL, '2022-10-14 15:09:52', '2022-10-14 15:12:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seller_plans`
--

CREATE TABLE `seller_plans` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_plans`
--

INSERT INTO `seller_plans` (`id`, `seller_id`, `subscription_plan_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, '2022-02-25 14:26:00', '2022-02-25 14:26:00'),
(7, 11, 2, 1, '2022-03-11 16:47:06', '2022-03-11 16:47:06'),
(8, 11, 2, 1, '2022-03-11 17:45:51', '2022-03-11 17:45:51'),
(9, 12, 2, 1, '2022-03-12 15:02:59', '2022-03-12 15:02:59'),
(10, 18, 3, 1, '2022-03-21 11:06:35', '2022-03-21 11:06:35'),
(11, 19, 3, 1, '2022-03-21 11:13:49', '2022-03-21 11:13:49'),
(12, 2, 1, 1, '2022-03-24 15:41:34', '2022-03-24 15:41:34'),
(13, 20, 1, 1, '2022-03-28 17:20:25', '2022-03-28 17:20:25'),
(14, 20, 1, 1, '2022-03-28 17:58:28', '2022-03-28 17:58:28'),
(15, 20, 1, 1, '2022-03-29 14:16:22', '2022-03-29 14:16:22'),
(16, 20, 1, 1, '2022-03-29 15:01:30', '2022-03-29 15:01:30'),
(17, 20, 1, 1, '2022-03-29 15:03:08', '2022-03-29 15:03:08'),
(18, 20, 1, 1, '2022-03-29 15:08:54', '2022-03-29 15:08:54'),
(19, 20, 1, 1, '2022-03-29 15:20:18', '2022-03-29 15:20:18'),
(20, 20, 1, 1, '2022-03-29 18:09:20', '2022-03-29 18:09:20'),
(21, 20, 1, 1, '2022-03-29 18:54:02', '2022-03-29 18:54:02'),
(22, 20, 1, 1, '2022-03-29 18:56:57', '2022-03-29 18:56:57'),
(23, 20, 1, 1, '2022-03-30 11:28:04', '2022-03-30 11:28:04'),
(24, 20, 1, 1, '2022-03-30 13:00:54', '2022-03-30 13:00:54'),
(25, 20, 1, 1, '2022-03-30 13:34:13', '2022-03-30 13:34:13'),
(26, 20, 1, 1, '2022-03-30 13:54:05', '2022-03-30 13:54:05'),
(27, 20, 1, 1, '2022-03-30 15:46:47', '2022-03-30 15:46:47'),
(28, 20, 1, 1, '2022-03-30 17:03:35', '2022-03-30 17:03:35'),
(29, 21, 3, 1, '2022-03-30 18:09:07', '2022-03-30 18:09:07'),
(30, 21, 3, 1, '2022-03-30 18:11:39', '2022-03-30 18:11:39'),
(31, 21, 3, 1, '2022-03-30 18:17:40', '2022-03-30 18:17:40'),
(32, 21, 3, 1, '2022-03-30 18:44:15', '2022-03-30 18:44:15'),
(33, 21, 3, 1, '2022-04-01 10:57:39', '2022-04-01 10:57:39'),
(34, 21, 3, 1, '2022-04-01 12:23:38', '2022-04-01 12:23:38'),
(35, 21, 3, 1, '2022-04-01 12:51:19', '2022-04-01 12:51:19'),
(36, 21, 3, 1, '2022-04-01 17:30:30', '2022-04-01 17:30:30'),
(37, 21, 3, 1, '2022-04-01 17:44:20', '2022-04-01 17:44:20'),
(38, 2, 1, 1, '2022-04-01 18:19:41', '2022-04-01 18:19:41'),
(39, 22, 2, 1, '2022-04-02 17:21:51', '2022-04-02 17:21:51'),
(40, 23, 2, 1, '2022-04-04 14:55:31', '2022-04-04 14:55:31'),
(41, 24, 1, 1, '2022-04-08 13:13:29', '2022-04-08 13:13:29'),
(42, 25, 1, 1, '2022-05-04 15:35:43', '2022-05-04 15:35:43'),
(43, 27, 1, 1, '2022-05-06 13:13:13', '2022-05-06 13:13:13'),
(44, 29, 2, 1, '2022-05-10 11:47:13', '2022-05-10 11:47:13'),
(45, 1, 2, 1, '2022-05-11 13:04:55', '2022-05-11 13:04:55'),
(46, 2, 2, 1, '2022-05-11 15:28:54', '2022-05-11 15:28:54'),
(47, 3, 1, 1, '2022-07-23 17:39:32', '2022-07-23 17:39:32'),
(48, 4, 2, 1, '2022-07-27 13:19:08', '2022-07-27 13:19:08'),
(49, 5, 2, 1, '2022-07-29 13:33:40', '2022-07-29 13:33:40'),
(50, 6, 1, 1, '2022-08-06 17:15:06', '2022-08-06 17:15:06'),
(51, 7, 3, 1, '2022-08-12 16:49:59', '2022-08-12 16:49:59'),
(52, 8, 2, 1, '2022-10-14 13:37:51', '2022-10-14 13:37:51'),
(53, 9, 3, 1, '2022-10-14 15:11:17', '2022-10-14 15:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2022-05-11 07:30:40', '2022-05-11 07:30:40', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2022-05-11 09:55:32', '2022-05-11 09:55:32', 0.00, 0.00, 0.00, 0.00, 0.00),
(3, 3, 0, 0, '2022-07-23 17:37:31', '2022-07-23 17:37:31', 0.00, 0.00, 0.00, 0.00, 0.00),
(4, 4, 0, 0, '2022-07-27 13:16:11', '2022-07-27 13:16:11', 0.00, 0.00, 0.00, 0.00, 0.00),
(5, 5, 0, 0, '2022-07-29 13:29:15', '2022-07-29 13:29:15', 0.00, 0.00, 0.00, 0.00, 0.00),
(6, 6, 0, 0, '2022-08-06 17:09:14', '2022-08-06 17:09:14', 0.00, 0.00, 0.00, 0.00, 0.00),
(7, 7, 0, 0, '2022-08-12 16:33:00', '2022-08-12 16:33:00', 0.00, 0.00, 0.00, 0.00, 0.00),
(8, 8, 0, 0, '2022-10-14 13:35:49', '2022-10-14 13:35:49', 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 9, 0, 0, '2022-10-14 15:09:52', '2022-10-14 15:09:52', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '1', 'Test1', 'permanent', 'UJJAIN', 'Ujjain', '456010', '8888888888', '2022-02-15 13:52:45', '2022-02-15 13:52:45', NULL, 'India', '', '', 0),
(2, '0', 'ramcharanteja', 'home', '45, Gopal mandir Indore M.P. India', 'INdore', '456006', '8794561234', '2022-04-06 10:25:54', '2022-04-06 10:25:54', NULL, 'India', '', '', 0),
(3, '8', 'Gopal venu', 'home', '89, paratha gali Indore M.P. India', 'Indore', '485001', '7539514068', '2022-04-07 08:20:16', '2022-04-07 08:20:16', NULL, 'India', '', '', 0),
(4, '0', 'customer Ganga chopra', 'home', '45, hari nagar, Indore, m.p., India', 'Indore', '456006', '7894561231', '2022-04-08 10:46:00', '2022-04-08 10:46:00', NULL, 'India', '', '', 0),
(5, '0', 'customer Ganga narang', 'home', '78,hari nagar, indore, M.P. India', 'Indore', '456001', '8794561231', '2022-04-08 13:09:11', '2022-04-08 13:09:11', NULL, 'India', '', '', 0),
(6, '0', 'mohit rana', 'home', '89, rani pura, Indore, M.P. India', 'Indore', '486001', '8527419631', '2022-04-08 14:01:18', '2022-04-08 14:01:18', NULL, 'India', '', '', 0),
(7, '0', 'mohit', 'home', 'ujjain in m.p', 'ujjain (M.P)', '', '9179891812', '2022-04-14 09:33:59', '2022-04-14 09:33:59', NULL, 'india', '', '', 0),
(8, '13', 'monu', 'others', 'Indore in M.P  (India)', 'Indore in  M.P', '485001', '9009359645', '2022-04-14 09:50:02', '2022-04-14 09:50:02', NULL, 'India', '', '', 0),
(9, '0', 'monu', 'others', 'Indore in M.P (India)', 'Indore in M.P (India)', '4850012', '9009359645', '2022-04-14 10:04:03', '2022-04-14 10:04:03', NULL, 'India', '', '', 0),
(10, '15', 'mohit', 'others', 'Indore in m.p', 'indore', '334234', '9009359655', '2022-04-14 13:03:05', '2022-04-14 13:03:05', NULL, 'India', '', '', 0),
(11, '0', 'punit', 'others', 'Indore in m.p', 'Indore in  M.P', '485001', '9045234568', '2022-04-14 14:20:16', '2022-04-14 14:20:16', NULL, 'India', '', '', 0),
(12, '0', 'pooja', 'others', 'ujjain in m.p', 'Indore', '345567', '9009359655', '2022-04-15 09:47:32', '2022-04-15 09:47:32', NULL, 'India', '', '', 0),
(13, '0', 'vijay', 'others', 'Indore in M.P ', 'Indore', '345345', '9009359645', '2022-04-15 13:02:12', '2022-04-15 13:02:12', NULL, 'India', '', '', 0),
(14, '0', 'vijay', 'others', 'indore', 'Indore', '345456', '9009359645', '2022-04-15 13:24:40', '2022-04-15 13:24:40', NULL, 'India', '', '', 0),
(15, '0', 'vijay', 'others', 'Indore in M.P', 'indore', '345678', '9009359645', '2022-04-15 14:04:07', '2022-04-15 14:04:07', NULL, 'India', '', '', 0),
(16, '0', 'vinay jaiswal', 'others', 'Ujjain in M.P ', 'Ujjain', '345789', '9009359749', '2022-04-19 08:23:28', '2022-04-19 08:23:28', NULL, 'India', '', '', 0),
(17, '0', 'Niraj', 'home', 'Indore in M.P', 'Indore', '456897', '9009578456', '2022-04-19 10:48:05', '2022-04-19 10:48:05', NULL, 'India', '', '', 0),
(18, '0', 'Mohan Babu', 'home', '12, gfghffgfhg', 'ujjain', '485001', '55568488865', '2022-07-02 12:15:32', '2022-07-02 12:15:32', NULL, 'India', '', '', 0),
(19, '0', 'dipesh', 'home', 'xyz', 'ujjain', '456010', '9009359677', '2022-07-18 07:29:05', '2022-07-18 07:29:05', NULL, 'india', '', '', 0),
(20, '0', 'babu cycle', 'home', 'ghfghfghdfgf', 'ujjain', '564000', '5825825821', '2022-07-19 08:00:06', '2022-07-19 08:00:06', NULL, 'india', '', '', 0),
(21, '0', 'baba bahi', 'home', 'asfasf', 'Indore', '485001', '5829637417', '2022-07-20 12:02:55', '2022-07-20 12:02:55', NULL, 'India', '', '', 0),
(22, '3', 'monu', 'home', 'fgfgygyygykg', 'Indore', '485001', '7418529637', '2022-07-20 12:18:48', '2022-07-20 12:18:48', NULL, 'India', '', '', 0),
(23, '7', 'customer Ganga narang', 'home', 'edghjkkl', 'Indore', '485001', '00973 33929629', '2022-07-20 12:33:06', '2022-07-20 12:33:06', NULL, 'India', '', '', 0),
(24, '7', 'customer Ganga narang', 'home', 'edghjkkl', 'Indore', '485001', '00973 33929629', '2022-07-20 12:33:23', '2022-07-20 12:33:23', NULL, 'India', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', '5.00', '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `address3` varchar(250) DEFAULT NULL,
  `address4` varchar(250) DEFAULT NULL,
  `address5` varchar(250) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `vat_no` varchar(200) DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `ac_holder_name` varchar(250) DEFAULT NULL,
  `ac_number` varchar(250) DEFAULT NULL,
  `swift_number` varchar(250) DEFAULT NULL,
  `iban_number` varchar(250) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL,
  `reg_or_cr_number` varchar(200) DEFAULT NULL,
  `group_vat` varchar(200) DEFAULT NULL,
  `division_vat` varchar(200) DEFAULT NULL,
  `telephone_number` bigint(20) DEFAULT NULL,
  `whatapp_number` bigint(20) DEFAULT NULL,
  `shop_email` varchar(200) DEFAULT NULL,
  `shop_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `address2`, `address3`, `address4`, `address5`, `country`, `vat_no`, `bank_name`, `ac_holder_name`, `ac_number`, `swift_number`, `iban_number`, `bank_address`, `branch`, `contact`, `image`, `created_at`, `updated_at`, `banner`, `reg_or_cr_number`, `group_vat`, `division_vat`, `telephone_number`, `whatapp_number`, `shop_email`, `shop_type`) VALUES
(1, 1, 'shree ice cream', 'shree1', 'shree2', 'shree3', 'shree4', 'shree5', NULL, '098', 'SBI', 'rambo', '1234567891011', 'swt123', '123456789101112', 'wkj1234567891011', 'mahananda', '7999928743', '2022-05-11-627b6620e5919.png', '2022-05-11 07:30:40', '2022-05-11 07:30:40', '2022-05-11-627b6620e5d01.png', '000001', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'jeki shirt', '78', 'hjdf', 'jhasdgfjh', 'jhasgj', 'jhasgjh', NULL, '5455', 'SBI', 'jeki chain', '1212324231', 'SWI54', 'IBAN5465', '45,hari nagar , ujjain M.P.', 'hari nagar', '9009359677', '2022-05-11-627b881425b36.png', '2022-05-11 09:55:32', '2022-05-11 09:55:32', '2022-05-11-627b881426306.png', '000002', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'GreenFxwll Shop', '143', 'M.G. Road', 'Indore', 'm.p.', 'India', NULL, '54', 'HDFC', 'sivdas sir', '102425467412587', 'SWI889', 'ibnm889', '156, near ranipura, indore,M.P.', 'Ranipura', '8855446611', '2022-07-23-62dbe48335625.png', '2022-07-23 17:37:31', '2022-07-23 17:37:31', '2022-07-23-62dbe4833571f.png', '000003', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 'play-Ground', '14', 'freeganj-ujjain MP13', 'freeganj-ujjain MP15', 'freeganj-indore', 'freeganj-delhi', NULL, '120213', 'HDFC', 'jack roy', '456655615', '855665225', '4562325', '123, MG ROad', 'freeganj', '9981977945', '2022-07-27-62e0ed4312bc9.png', '2022-07-27 13:16:11', '2022-07-27 13:16:11', '2022-07-27-62e0ed4312cd2.png', '000004', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 'Chetan Garments', '152', 'bilotipura near vijay nagar', 'Indore', 'M.P.', 'India', NULL, '8956', 'PNB', 'chetan sharma', '8523741178969874', 'SWI55', 'IBAN44', '89, Bilotipura near vijay nagar, M.P. Indore, India', 'PNB Bilotipura', '8855224477', '2022-07-29-62e39353750ce.png', '2022-07-29 13:29:15', '2022-07-29 13:29:15', '2022-07-29-62e3935375222.png', '000005', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 'Govinda bat', '12', 'bangali choraya', 'Indore', 'M.P.', 'India', 30, '85', 'HDFC', 'Govinda dada', '4563321478966547', 'SWT564', 'IBAN888', '520,MG ROAD INDORE, M.P., India', 'sapna sangti', '8585858585', 'def.png', '2022-08-06 17:09:14', '2022-08-12 16:03:34', '2022-08-06-62ee52e2f19a9.png', '000006', '8558', '8558', NULL, NULL, NULL, 3),
(7, 7, 'Roma cloths', '56, govind pura,indore, m.p. india', NULL, NULL, NULL, NULL, 36, '900', 'HSBCPNB', 'Roma cloths', '897756441231', NULL, 'IBAN54', '89, Bilotipura near vijay nagar, M.P. Indore, India', 'HDFCPNB Bilotipura', '7418529637', 'def.png', '2022-08-12 16:33:00', '2022-08-12 16:52:12', '2022-08-12-62f6336423429.png', '000007', '99', '99', NULL, NULL, NULL, 3),
(8, 8, 'Ghar Sanskar', 'zamil tower near pani ptase gali', 'zamil tower near pani ptase gali2', 'zamil tower near pani ptase gali3', NULL, NULL, 17, '777777777777777777777777', 'GHAR KA BANK', 'Ghar Sanskar', '100200300400500600700', 'SWIFT001002003', 'IBAN001002003', '520,MG ROAD INDORE, M.P., India', 'MG ROAD', '8899556622', 'def.png', '2022-10-14 13:35:49', '2022-10-14 13:35:49', 'def.png', '000008', NULL, NULL, NULL, NULL, NULL, 1),
(9, 9, 'Gyan Traders', 'zamil tower', 'MG road', 'indore', NULL, NULL, 17, '88569', 'HDFC', 'Gyan Traders', '852741963963741', 'SWIFT01', 'IBAN02', '5500,MG ROAD INDORE, M.P., India', 'MG ROAD', '8527419631', 'def.png', '2022-10-14 15:09:52', '2022-10-14 15:09:52', 'def.png', '000009', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://ecom.sparedeveloper.tk/', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2022-02-15 23:26:11'),
(2, 'linkedin', 'https://ecom.sparedeveloper.tk/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2022-02-15 23:26:01'),
(3, 'google-plus', 'https://ecom.sparedeveloper.tk/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2022-02-15 23:25:51'),
(4, 'pinterest', 'https://ecom.sparedeveloper.tk/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2022-02-15 23:25:42'),
(5, 'instagram', 'https://ecom.sparedeveloper.tk/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2022-02-15 23:25:30'),
(6, 'facebook', 'https://ecom.sparedeveloper.tk/', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2022-02-15 23:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` varchar(100) NOT NULL,
  `allowed_products` int(11) NOT NULL,
  `allowed_invoice` int(11) NOT NULL,
  `expected_volume_of_business` int(11) NOT NULL,
  `offer_status` tinyint(1) NOT NULL DEFAULT 0,
  `offer_startdate` date DEFAULT NULL,
  `offer_enddate` date DEFAULT NULL,
  `offer_hold` tinyint(1) NOT NULL DEFAULT 0,
  `plan_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `title`, `currency_id`, `price`, `duration`, `duration_type`, `allowed_products`, `allowed_invoice`, `expected_volume_of_business`, `offer_status`, `offer_startdate`, `offer_enddate`, `offer_hold`, `plan_status`, `created_at`, `updated_at`) VALUES
(1, 'Basic Plan', 9, 100, 1, '2', 499, 499, 10000, 0, NULL, NULL, 0, 1, '2022-03-15 14:09:37', '2022-03-17 11:24:45'),
(2, 'Silver plan', 9, 200, 6, '2', 200, 2000, 2000, 0, NULL, NULL, 0, 1, '2022-03-17 12:15:04', '2022-03-17 12:15:04'),
(3, 'Sanjay Plan', 9, 500, 3, '2', 500, 500, 10000, 0, NULL, NULL, 0, 1, '2022-03-21 10:55:16', '2022-03-21 10:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Testing Ticket', 'Info inquiry', 'High', 'Testing', NULL, 'open', '2022-02-16 15:52:32', '2022-02-16 15:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `symbol` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` text DEFAULT NULL,
  `selected_seller` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `symbol`, `description`, `status`, `created_by`, `selected_seller`, `created_at`, `updated_at`) VALUES
(1, 'Pieces', 'Pcs', NULL, 1, '5', '[5]', '2022-12-13 17:21:02', '2022-12-15 16:30:22'),
(2, 'Kilogram', 'Kg', NULL, 1, '5', '[]', '2022-12-13 17:21:15', '2022-12-15 16:30:22'),
(3, 'Grams', 'gm', NULL, 1, '5', '[]', '2022-12-13 17:21:30', '2022-12-15 16:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `unit_allowes`
--

CREATE TABLE `unit_allowes` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT 0,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) DEFAULT NULL,
  `delete_status` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_allowes`
--

INSERT INTO `unit_allowes` (`id`, `seller_id`, `admin_id`, `unit_id`, `delete_status`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 1, 0, '2022-07-21', '2022-07-21'),
(2, 0, 1, 1, 0, '2022-07-21', '2022-07-21'),
(3, 6, 0, 2, 0, '2022-08-06', '2022-08-06'),
(4, 5, 0, 1, 0, '2022-09-23', '2022-09-23'),
(5, 9, 0, 1, 0, '2022-10-14', '2022-10-14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `country_code`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`) VALUES
(1, NULL, 'mohan', 'babu', '8527456123', NULL, 'def.png', 'mohanbabu@gmail.com', NULL, '$2y$10$lwSDwYMJKXiIH97zMhCUi.TFRnIyLLqxzJd973hhMTU7oOnLKvM.m', 'LAjbLVax7G4lvcUvhg12gU7uBAMnaUF7qI98MlT3TAuS3deKQbRjoYsZxQqo', '2022-06-29 12:23:24', '2022-06-29 12:23:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(2, NULL, 'Chinu', 'sharma', '8527419634', NULL, 'def.png', 'chinusharma@gmail.com', NULL, '$2y$10$cYhL.GpzqZRAfAxGc71TSOgmicifRtH9Ln.Xi1kZzXIKj8jhchAy.', NULL, '2022-07-05 13:45:32', '2022-07-05 13:45:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(3, NULL, 'Baba', 'cycle', '8596748596', NULL, 'def.png', 'babacycle@gmail.com', NULL, '$2y$10$dmNM3kd9BBjqvcDZ/0gaOOgVgh3HmSyOZfZaJsG3x8iOHf7U3RVXC', NULL, '2022-07-19 06:44:37', '2022-07-19 06:44:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(4, NULL, 'madan', 'lal', '7418529637', NULL, 'def.png', 'madan@gmail.com', NULL, '$2y$10$GtpFDO6awF7TMYIdJoLCH.Pl8fZljnvPexLfO2j8q91Q1PSXgtnv.', NULL, '2022-07-20 12:24:46', '2022-07-20 12:24:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(6, NULL, 'shyam', 'lal', '7878787878', NULL, 'def.png', 'shyam@gmail.com', NULL, '$2y$10$cPCkIH1aSIqWQmUIp248FOaMbnosTHa/wznCXLCRufj.r3AWg8EGa', NULL, '2022-07-20 12:26:49', '2022-07-20 12:26:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(7, NULL, 'abc', 'abc', '1111111111', NULL, 'def.png', 'abc@gmail.com', NULL, '$2y$10$/7kStb8jvcghFPjrav6KSOQJNS8PFl3Q5XERu.KK3PgPP.E69gX.m', 'Cm90kbxNdUm7LlWqC9rFZLDa181MYoeikvKWsZ8m67zrB1wpYjllyxOgZ0qj', '2022-07-20 12:29:54', '2022-07-20 12:29:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(8, NULL, 'jack', 'customer', '7999928745', NULL, 'def.png', 'jackcustomer@gmail.com', NULL, '$2y$10$NKFQ2lppif6jxA06R5Xxneu7.DbDPEMhMEm3YE5JfismZ8nVAxZ5q', NULL, '2022-07-27 13:42:32', '2022-07-27 13:42:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(9, NULL, 'Mack', 'Roy', '8527419637', NULL, 'def.png', 'mackroy@gmail.com', NULL, '$2y$10$mI6Qdz2djioKyTahyhf5a.ye1793wtRejBDM4cWHVCuIwlR2.enfG', NULL, '2022-07-29 17:22:17', '2022-07-29 17:22:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(10, NULL, 'Govinda\'s', 'Customer', '9595959595', 100, 'def.png', 'govindacustomer@gmail.com', NULL, '$2y$10$a9fiLZBu4g3qB7cfA8lN..hdauCYth5CeHo3G5DfRcQKl8gnJ.G82', NULL, '2022-08-06 17:34:36', '2022-08-06 17:35:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_allowes`
--
ALTER TABLE `brand_allowes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings_old`
--
ALTER TABLE `business_settings_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_blocks`
--
ALTER TABLE `category_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_types`
--
ALTER TABLE `company_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_code`
--
ALTER TABLE `country_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_permission`
--
ALTER TABLE `credit_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discount_masters`
--
ALTER TABLE `discount_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newproduct_discounts`
--
ALTER TABLE `newproduct_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offer_dates`
--
ALTER TABLE `offer_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plantabs_invoices`
--
ALTER TABLE `plantabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_offers`
--
ALTER TABLE `plan_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `possible_combination_elements`
--
ALTER TABLE `possible_combination_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `possible_variant`
--
ALTER TABLE `possible_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_plans`
--
ALTER TABLE `seller_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_allowes`
--
ALTER TABLE `unit_allowes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `balance_sheet`
--
ALTER TABLE `balance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand_allowes`
--
ALTER TABLE `brand_allowes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `business_settings_old`
--
ALTER TABLE `business_settings_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `category_blocks`
--
ALTER TABLE `category_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `company_types`
--
ALTER TABLE `company_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `country_code`
--
ALTER TABLE `country_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_permission`
--
ALTER TABLE `credit_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_masters`
--
ALTER TABLE `discount_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `newproduct_discounts`
--
ALTER TABLE `newproduct_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offer_dates`
--
ALTER TABLE `offer_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100011;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plantabs_invoices`
--
ALTER TABLE `plantabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `plan_offers`
--
ALTER TABLE `plan_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `possible_combination_elements`
--
ALTER TABLE `possible_combination_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT for table `possible_variant`
--
ALTER TABLE `possible_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4246;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_plans`
--
ALTER TABLE `seller_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unit_allowes`
--
ALTER TABLE `unit_allowes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

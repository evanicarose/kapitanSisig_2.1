-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306
-- Generation Time: Oct 19, 2024 at 09:26 AM
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
-- Database: `db_kapitanSisig`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_banned,1=banned',
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `position` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `is_banned`, `created_at`, `position`) VALUES
(5, 'Shiloh', 'Millondaga', 'smillondaga', '$2y$10$ahgUV/hxBYhMvOFgjuyISe8qYRjRlOyfHB15WJAwBArpiZralYBL.', 0, '2024-08-24', 1),
(7, 'Kristyle', 'Modin', 'kmmodin', '$2y$10$SOwyojJ8PIBdWRkmch1lJ.C4v8F977ZXhiGfeiStZuVKzSy5fhguq', 1, '2024-08-25', 1),
(13, 'Oneil', 'Victoriano', 'oneil', '$2y$10$p.IyPLsToz4DG60hHSJZt.ARDB5Yft/j8YVXIIPlXiZbDmZA/Mdy2', 0, '2024-08-27', 1),
(16, 'AJ', 'Salcedo', 'ajsalcedo', '$2y$10$QadskkEuYIairmnx7ToeKuSxMH5KBTLs4pHU17.wWT25t1UkiT4cG', 0, '2024-10-07', 0),
(17, 'Evanica', 'Juarbal', 'errjuarbal', '$2y$10$NyJz73curxmC7xiAnTU7g.nT91YlEgi5cARwDZNAMb2SpD7buU1Z.', 0, '2024-10-12', 1),
(18, 'jake', 'zyrus', 'jakesing', '$2y$10$2E9sqXzfUpnN8g98B.suE.ov6hBtrqaLxO84FI3sLkImCJoPdNlgS', 0, '2024-10-15', 1),
(19, 'Noriel', 'Rogon', 'nrogon', '$2y$10$QyXou9nRPGd3bVWFVbhTj.sQssldjRj5s.1ahd9TxbVVRtGjU60n2', 0, '2024-10-15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Sisig Meal', 0),
(2, 'Barkada Meals', 0),
(5, 'Shawarma Meals', 0),
(6, 'Meryenda Meals', 0),
(7, 'Extra', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(566) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`) VALUES
(3, 'Shanee'),
(4, 'AJ'),
(5, 'Keisha'),
(6, 'Aaron'),
(7, 'Khim'),
(8, 'Khim'),
(9, 'Kyle'),
(10, 'Kimchi'),
(11, 'Rex'),
(15, 'Oneil'),
(16, 'jj'),
(17, 'Owen'),
(18, 'Job'),
(19, 'Angel Marie'),
(20, 'Gel'),
(21, 'Christian'),
(22, 'Shi'),
(23, 'Nica'),
(25, 'Jake'),
(26, 'Hailey'),
(27, 'Bailey');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `unit_id` varchar(191) NOT NULL,
  `category` varchar(191) NOT NULL,
  `sub_category` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `sub_category`, `quantity`) VALUES
(30, 'Pork', '3', 'Main Ingredients', 'Meat & Poultry', 102),
(31, 'Calamansi', '3', 'Main Ingredients', 'Vegetables', 5),
(32, 'Bell Pepper', '3', 'Main Ingredients', 'Vegetables', 1),
(33, 'Carrots', '3', 'Main Ingredients', 'Vegetables', 0),
(34, 'Tuna', '3', 'Main Ingredients', 'Meat & Poultry', 0),
(35, 'Pork Belly', '3', 'Main Ingredients', 'Meat & Poultry', 0),
(36, 'Sugar', '3', 'Main Ingredients', 'Others', 0),
(37, 'Salt', '3', 'Main Ingredients', 'Others', 0),
(38, 'Pork', '4', 'Main Ingredients', 'Meat & Poultry', 0),
(39, 'TEST WITHOUT PRICE', '5', 'Commissary', 'Cutlery', 0),
(40, 'Potatoes', '1', 'Main Ingredients', 'Vegetables', 0),
(41, 'Chicken', '3', 'Main Ingredients', 'Meat & Poultry', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_items`
--

CREATE TABLE `ingredients_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_items`
--

INSERT INTO `ingredients_items` (`id`, `order_id`, `ingredient_id`, `price`, `quantity`) VALUES
(1, 1, 3, '140.00', '47'),
(2, 2, 3, '140.00', '47'),
(3, 3, 3, '140.00', '47'),
(4, 4, 3, '140.00', '47'),
(5, 4, 4, '350.00', '72'),
(6, 4, 26, '10.00', '15'),
(7, 4, 6, '80.00', '2'),
(8, 4, 28, '10.00', '10'),
(9, 5, 3, '140.00', '4'),
(10, 6, 3, '140.00', '1'),
(11, 7, 3, '140.00', '1'),
(12, 8, 4, '350.00', '1'),
(13, 9, 5, '300.00', '300'),
(14, 9, 3, '140.00', '1'),
(15, 10, 4, '350.00', '1'),
(16, 10, 3, '140.00', '4'),
(17, 10, 6, '80.00', '2'),
(18, 11, 3, '140.00', '3'),
(19, 11, 26, '11.00', '1'),
(20, 11, 28, '10.00', '4'),
(21, 12, 4, '350.00', '1'),
(22, 13, 26, '11.00', '1'),
(23, 14, 6, '80.00', '1'),
(24, 15, 3, '140.00', '1'),
(25, 16, 3, '140.00', '4'),
(26, 17, 4, '350.00', '1'),
(27, 17, 6, '80.00', '11'),
(28, 18, 3, '140.00', '5'),
(29, 18, 4, '350.00', '4'),
(30, 19, 3, '140.00', '1'),
(31, 20, 4, '350.00', '1'),
(32, 20, 6, '80.00', '1'),
(33, 20, 28, '10.00', '1'),
(34, 21, 3, '140.00', '1'),
(35, 22, 4, '350.00', '1'),
(36, 23, 4, '350.00', '4'),
(37, 24, 5, '300.00', '1'),
(38, 25, 5, '300.00', '3'),
(39, 26, 31, '100.00', '5'),
(40, 26, 30, '100.00', '2'),
(41, 27, 32, '100.00', '1'),
(42, 28, 30, '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('Placed','Preparing','Completed','Cancelled') NOT NULL DEFAULT 'Placed' COMMENT 'placed, preparing, completed, cancelled',
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash,online',
  `order_placed_by_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(39, 7, '226730', 'INV-300450', '89', '2024-10-09 14:34:39', 'Completed', 'Online Payment', 'Evanica Rose'),
(40, 22, '882095', 'INV-251510', '267', '2024-10-10 17:13:45', 'Cancelled', 'Cash Payment', 'Evanica Rose'),
(41, 22, '952796', 'INV-251510', '267', '2024-10-10 17:13:47', 'Completed', 'Cash Payment', 'Evanica Rose'),
(42, 7, '112409', 'INV-453702', '89', '2024-10-10 17:30:09', 'Cancelled', 'Cash Payment', 'Evanica Rose'),
(43, 23, '290385', 'INV-800678', '89', '2024-10-10 18:19:44', 'Completed', 'Cash Payment', 'Evanica Rose'),
(44, 7, '664221', 'INV-350966', '89', '2024-10-11 13:02:11', 'Cancelled', 'Online Payment', 'Evanica Rose'),
(45, 15, '295336', 'INV-321654', '89', '2024-10-11 13:26:59', 'Completed', 'Online Payment', 'Evanica Rose'),
(46, 7, '456683', 'INV-239910', '89', '2024-10-11 14:00:40', 'Completed', 'Cash Payment', 'Evanica Rose'),
(47, 7, '266292', 'INV-742395', '178', '2024-10-11 16:46:19', 'Cancelled', 'Cash Payment', 'Evanica Rose'),
(48, 7, '509693', 'INV-308188', '267', '2024-10-12 15:26:19', 'Completed', 'Cash Payment', 'Evanica'),
(73, 15, '971270', 'INV-149962', '89', '2024-10-13 10:19:06', 'Completed', 'Cash Payment', 'Evanica'),
(74, 9, '588247', 'INV-589747', '89', '2024-10-13 12:51:29', 'Completed', 'Cash Payment', 'Evanica'),
(75, 9, '618020', 'INV-135587', '1068', '2024-10-13 12:57:10', 'Completed', 'Cash Payment', 'Evanica'),
(76, 5, '250930', 'INV-853032', '89', '2024-10-13 12:57:28', 'Completed', 'Cash Payment', 'Evanica'),
(77, 9, '872105', 'INV-959096', '267', '2024-10-13 17:59:28', 'Completed', 'Online Payment', 'Evanica'),
(78, 7, '986163', 'INV-253069', '178', '2024-10-14 10:07:54', 'Cancelled', 'Cash Payment', 'Evanica'),
(79, 25, '733466', 'INV-158436', '623', '2024-10-15 10:49:16', 'Completed', 'Cash Payment', 'Evanica'),
(80, 9, '426872', 'INV-444514', '801', '2024-10-15 10:50:16', 'Completed', 'Cash Payment', 'Evanica'),
(81, 5, '308789', 'INV-232492', '89', '2024-10-15 10:51:44', 'Completed', 'Cash Payment', 'Evanica'),
(82, 21, '536186', 'INV-401381', '1513', '2024-10-17 22:40:15', 'Completed', 'Cash Payment', 'Evanica'),
(83, 7, '831929', 'INV-308966', '623', '2024-10-19 09:06:59', 'Completed', 'Cash Payment', 'Evanica'),
(84, 26, '274998', 'INV-629251', '89', '2024-10-19 15:12:56', 'Completed', 'Cash Payment', 'Evanica'),
(85, 27, '514824', 'INV-620509', '159', '2024-10-19 15:13:23', 'Preparing', 'Cash Payment', 'Evanica');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 18, '189.00', '7'),
(2, 1, 12, '89.00', '4'),
(3, 1, 13, '89.00', '1'),
(4, 2, 12, '89.00', '1'),
(5, 2, 13, '89.00', '2'),
(6, 3, 13, '89.00', '3'),
(7, 4, 12, '89.00', '1'),
(8, 5, 12, '89.00', '1'),
(9, 6, 12, '89.00', '1'),
(10, 7, 14, '89.00', '1'),
(11, 8, 11, '89.00', '1'),
(12, 9, 12, '89.00', '1'),
(13, 10, 11, '89.00', '1'),
(14, 11, 11, '89.00', '1'),
(15, 12, 11, '89.00', '1'),
(16, 12, 12, '89.00', '1'),
(17, 13, 11, '89.00', '1'),
(18, 14, 11, '89.00', '1'),
(19, 15, 13, '89.00', '1'),
(20, 16, 11, '89.00', '1'),
(21, 17, 11, '89.00', '1'),
(22, 18, 11, '89.00', '1'),
(23, 18, 13, '89.00', '2'),
(24, 19, 11, '89.00', '1'),
(25, 20, 11, '89.00', '2'),
(26, 21, 11, '89.00', '2'),
(27, 22, 11, '89.00', '2'),
(28, 23, 12, '89.00', '1'),
(29, 24, 13, '89.00', '1'),
(30, 25, 13, '89.00', '1'),
(31, 26, 13, '89.00', '1'),
(32, 27, 14, '89.00', '3'),
(33, 27, 11, '89.00', '3'),
(34, 28, 11, '89.00', '1'),
(35, 29, 11, '89.00', '3'),
(36, 30, 11, '89.00', '4'),
(37, 30, 14, '89.00', '4'),
(38, 31, 11, '89.00', '1'),
(39, 35, 11, '89.00', '1'),
(40, 37, 11, '89.00', '1'),
(41, 38, 11, '89.00', '1'),
(42, 39, 11, '89.00', '1'),
(43, 40, 14, '89.00', '2'),
(44, 41, 14, '89.00', '2'),
(45, 42, 13, '89.00', '1'),
(46, 43, 13, '89.00', '1'),
(47, 44, 13, '89.00', '1'),
(48, 45, 13, '89.00', '1'),
(49, 46, 14, '89.00', '1'),
(50, 47, 11, '89.00', '2'),
(51, 48, 11, '89.00', '3'),
(59, 53, 12, '89.00', '6'),
(60, 67, 11, '89.00', '4'),
(61, 68, 13, '89.00', '2'),
(62, 69, 12, '89.00', '1'),
(63, 70, 12, '89.00', '1'),
(64, 72, 11, '89.00', '1'),
(65, 73, 12, '89.00', '1'),
(66, 74, 12, '89.00', '1'),
(67, 75, 13, '89.00', '3'),
(68, 75, 14, '89.00', '9'),
(69, 76, 14, '89.00', '1'),
(70, 77, 13, '89.00', '3'),
(71, 78, 11, '89.00', '2'),
(72, 79, 11, '89.00', '7'),
(73, 80, 12, '89.00', '9'),
(74, 81, 11, '89.00', '1'),
(75, 82, 13, '89.00', '7'),
(76, 82, 14, '89.00', '10'),
(77, 83, 11, '89.00', '7'),
(78, 84, 12, '89.00', '1'),
(79, 85, 21, '53.00', '3');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `productname` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `productname`, `description`, `price`, `image`, `created_at`, `quantity`) VALUES
(11, 1, 'Pork Sisig', '', 89.00, 'pics/uploads/products/1724560695.jpg', '2024-08-25', 0),
(12, 1, 'Tuna Sisig', '', 89.00, 'pics/uploads/products/1724560714.jpg', '2024-08-25', 0),
(13, 1, 'Chicken Sisig', '', 89.00, 'pics/uploads/products/1724560785.jpg', '2024-08-25', 0),
(14, 1, 'Tofu', '', 89.00, 'pics/uploads/products/1724560817.jpg', '2024-08-25', 0),
(21, 7, 'Fried Rice', 'Yumm', 53.00, '', '2024-10-15', 85),
(23, 5, 'Test', '', 12.00, 'pics/uploads/products/1729300572.jpg', '2024-10-19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `ingPayment_mode` varchar(100) NOT NULL,
  `order_placed_by_id` varchar(100) NOT NULL,
  `supplierName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `ingPayment_mode`, `order_placed_by_id`, `supplierName`) VALUES
(5, 13, '149293', 'INV-133507', '560', '2024-10-06 00:00:00', 'Booked', 'Cash Payment', 'Admin', ''),
(6, 5, '219091', 'INV-573535', '140', '2024-10-06 00:00:00', 'Booked', 'Cash Payment', 'Admin', ''),
(7, 5, '512987', 'INV-270728', '140', '2024-10-06 00:00:00', 'Booked', 'Cash Payment', 'Admin', ''),
(8, 7, '614935', 'INV-545197', '350', '2024-10-06 00:00:00', 'Booked', 'Cash Payment', 'Admin', ''),
(9, 13, '939731', 'INV-279767', '90140', '2024-10-07 00:00:00', 'Booked', 'Online Payment', 'Admin', '9'),
(10, 5, '418286', 'INV-254659', '1070', '2024-10-07 00:00:00', 'Booked', 'Cash Payment', 'Admin', '5'),
(11, 5, '803370', 'INV-192858', '471', '2024-10-07 00:00:00', 'Booked', 'Cash Payment', 'Admin', '5'),
(12, 13, '573421', 'INV-202674', '350', '2024-10-07 00:00:00', 'Booked', 'Online Payment', 'Admin', '6'),
(13, 5, '967138', 'INV-292189', '11', '2024-10-07 00:00:00', 'Booked', 'Online Payment', 'Admin', '6'),
(14, 13, '447414', 'INV-959929', '80', '2024-10-07 18:06:57', 'Booked', 'Cash Payment', 'Admin', '9'),
(15, 5, '543892', 'INV-552408', '140', '2024-10-07 21:24:56', 'Booked', 'Cash Payment', 'Admin', '2'),
(16, 1, '580605', 'INV-885896', '560', '2024-10-07 22:25:47', 'Booked', 'Cash Payment', 'Admin', '5'),
(17, 5, '115070', 'INV-512646', '1230', '2024-10-08 18:57:37', 'Booked', 'Cash Payment', 'Admin', '9'),
(18, 1, '660849', 'INV-592503', '2100', '2024-10-10 18:24:38', 'Booked', 'Cash Payment', 'Admin', '6'),
(19, 2, '763136', 'INV-879511', '140', '2024-10-12 21:24:56', 'Delivered', 'Cash Payment', 'Admin', '5'),
(20, 1, '501893', 'INV-622879', '440', '2024-10-12 21:30:27', 'Delivered', 'Online Payment', 'Admin', '2'),
(21, 3, '883463', 'INV-218159', '140', '2024-10-12 21:33:35', 'Delivered', 'Cash Payment', 'Admin', '6'),
(22, 1, '162773', 'INV-214739', '350', '2024-10-12 22:50:40', 'Delivered', 'Cash Payment', 'Admin', '5'),
(23, 3, '232796', 'INV-310416', '1400', '2024-10-13 09:57:07', 'Delivered', 'Cash Payment', 'Admin', '2'),
(24, 3, '247569', 'INV-124286', '300', '2024-10-13 11:16:06', 'Delivered', 'Cash Payment', 'Admin', '5'),
(25, 3, '238076', 'INV-507708', '900', '2024-10-14 10:08:09', 'Delivered', 'Online Payment', 'Admin', '2'),
(26, 3, '991974', 'INV-675311', '700', '2024-10-15 15:02:17', 'Delivered', 'Cash Payment', 'Admin', '2'),
(27, 2, '856885', 'INV-384896', '100', '2024-10-15 16:55:50', 'Delivered', 'Cash Payment', 'Admin', '6'),
(28, 3, '744674', 'INV-713972', '0', '2024-10-16 17:40:57', 'Delivered', 'Cash Payment', 'Admin', '5');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `product_id`, `name`, `created_at`) VALUES
(8, 23, '', '2024-10-15 00:43:26'),
(9, 24, '', '2024-10-15 01:00:05'),
(10, 26, '', '2024-10-15 01:19:19'),
(11, 27, '', '2024-10-15 01:23:39'),
(12, 23, '', '2024-10-15 01:36:29'),
(13, 23, '', '2024-10-15 01:36:54'),
(14, 23, '', '2024-10-15 01:37:43'),
(15, 21, '', '2024-10-15 05:04:09'),
(16, 11, '', '2024-10-15 05:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `quantity`, `unit_id`) VALUES
(40, 8, 30, 5.00, 18),
(41, 8, 31, 2.00, 6),
(42, 8, 32, 4.00, 20),
(43, 8, 33, 6.00, 18),
(44, 8, 34, 7.00, 18),
(45, 8, 35, 3.00, 18),
(46, 8, 36, 4.00, 19),
(47, 8, 37, 2.00, 19),
(48, 8, 38, 2.00, 19),
(49, 8, 39, 3.00, 18),
(50, 8, 40, 3.00, 18),
(51, 8, 41, 7.00, 5),
(52, 8, 42, 5.00, 3),
(57, 9, 56, 2.00, 18),
(58, 9, 37, 2.00, 19),
(59, 9, 41, 1.00, 18),
(60, 9, 45, 2.00, 18),
(61, 9, 32, 1.00, 20),
(62, 9, 46, 2.00, 19),
(63, 9, 47, 1.00, 20),
(64, 9, 48, 3.00, 20),
(65, 9, 49, 2.00, 20),
(66, 9, 30, 1.00, 18),
(67, 9, 51, 2.00, 18),
(68, 9, 44, 1.00, 20),
(69, 9, 43, 1.00, 20),
(70, 9, 57, 2.00, 18),
(72, 10, 42, 5.00, 3),
(73, 10, 30, 5.00, 18),
(74, 10, 32, 2.00, 20),
(75, 10, 40, 3.00, 18),
(76, 10, 39, 3.00, 18),
(77, 11, 38, 50.00, 1),
(78, 11, 56, 7.00, 18),
(79, 12, 3, 8.00, 1),
(80, 13, 3, 6.00, 6),
(81, 14, 3, 99.00, 6),
(82, 8, 3, 2.00, 6),
(86, 16, 31, 1.00, 17),
(87, 16, 30, 100.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `phonenumber` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `firstname`, `lastname`, `phonenumber`, `address`) VALUES
(2, 'Aj Solane', 'Delivery', '09123456789', 'Bukid Heights'),
(5, 'Aaron Water', 'Ramirez', '0987654321', 'Baha Subdivision'),
(6, 'John Kyle Gulay', 'Lampa', '09567483921', 'Vegetable City'),
(9, 'Aj Banig', 'Salcedo', '0987485676', 'Kawayan Island'),
(14, 'Owen MeatShop', 'Juarbal', '0956615261', 'Meat Town'),
(15, 'Kristyle Khiamoy', 'Modin', '0988888', 'Khiamoy Street'),
(16, 'Shiloh Bugasan', 'Millondaga', '09888888', 'Rice Fields');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ingredients`
--

CREATE TABLE `supplier_ingredients` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_ingredients`
--

INSERT INTO `supplier_ingredients` (`id`, `supplier_id`, `ingredient_id`, `price`) VALUES
(1, 5, 31, 12.00),
(23, 9, 32, 120.00),
(24, 9, 32, 120.00),
(25, 9, 32, 120.00),
(26, 9, 32, 120.00),
(59, 6, 40, 60.00),
(60, 6, 40, 60.00),
(61, 6, 33, 100.00),
(62, 6, 31, 40.00),
(63, 6, 32, 90.00),
(67, 14, 30, 240.00),
(68, 14, 41, 150.00),
(69, 14, 34, 400.00),
(70, 2, 36, 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`) VALUES
(1, 'Gram', 0),
(3, 'Kilograms', 0),
(4, 'Milligram', 0),
(5, 'Ounce', 0),
(6, 'Pounds', 0),
(7, 'Litre', 0),
(8, 'Gallon', 0),
(17, 'Pieces', 0),
(18, 'tablespoon', 0),
(19, 'teaspoon', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  ADD CONSTRAINT `supplier_ingredients_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `supplier_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

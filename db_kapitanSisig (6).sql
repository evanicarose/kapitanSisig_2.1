-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306
-- Generation Time: Nov 17, 2024 at 03:52 AM
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
(1, 'Kristyle Marie', 'Modin', 'kmgmodin', '$2y$10$Aj1WGyrfovmy5VQA3wXKleP0nrV42X5knV.jfYJI1AStwXaV3kzDK', 0, '2024-10-16', 1),
(2, 'Evanica Rose', 'Juarbal', 'errjuarbal', '$2y$10$XevFsvoyVcLPL6i2PXPEb.zxapjWEjubiwA0RysghbNkgaoVmzGf6', 0, '2024-11-12', 1),
(3, 'Shiloh', 'Millondaga', 'ssmillondaga', '$2y$10$p4.ZXrU7LI3coe43F4i06e6/Nos8VTAYnF1huOXSsWB6Ytlsoc68a', 0, '2024-11-15', 0);

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
(1, 'khim'),
(2, 'Dawn'),
(3, 'Shiloh Millondaga'),
(4, 'Evanica'),
(5, 'Kristyle'),
(6, 'Shiloh'),
(7, 'Kyle'),
(8, 'Rex'),
(9, 'Sia'),
(10, 'Christian'),
(11, 'Jesus'),
(12, 'Cyril');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `quantity`) VALUES
(4, 'Pork Belly', 13, 'Meat & Poultry', 15200.00),
(5, 'Spoon', 14, 'Cutlery', 942.00),
(6, 'Soy Sauce', 18, 'Condiments', 8200.00),
(7, 'Tuna', 13, 'Meat & Poultry', 2000.00),
(8, 'Egg', 14, 'Others', 1131.00),
(9, 'Bell Pepper', 13, 'Meat & Poultry', 0.00),
(10, 'Fork', 14, 'Cutlery', 1200.00);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_items`
--

CREATE TABLE `ingredients_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_items`
--

INSERT INTO `ingredients_items` (`id`, `order_id`, `ingredient_id`, `unit_id`, `price`, `quantity`) VALUES
(1, 1, 15, 0, 0.00, 1),
(2, 2, 15, 0, 0.00, 5),
(9, 9, 8, 0, 0.00, 1),
(10, 10, 5, 0, 150.00, 4),
(11, 11, 1, 0, 120.00, 1),
(12, 12, 5, 0, 150.00, 3),
(13, 13, 5, 0, 150.00, 6),
(14, 14, 5, 0, 150.00, 1),
(15, 15, 5, 0, 150.00, 1),
(16, 16, 5, 16, 150.00, 1),
(17, 17, 4, 16, 150.00, 2),
(18, 17, 7, 16, 170.00, 1),
(19, 17, 8, 15, 120.00, 1),
(20, 18, 6, 19, 70.00, 1),
(21, 19, 4, 16, 250.00, 1),
(22, 20, 5, 14, 10.00, 1),
(23, 20, 6, 19, 70.00, 2),
(24, 20, 4, 16, 250.00, 2),
(25, 21, 4, 16, 150.00, 4),
(26, 21, 7, 16, 170.00, 2),
(27, 22, 5, 14, 10.00, 1),
(28, 22, 6, 19, 70.00, 1),
(29, 22, 4, 16, 250.00, 1),
(30, 23, 5, 14, 10.00, 1),
(31, 24, 6, 19, 70.00, 2),
(32, 24, 4, 16, 250.00, 1),
(33, 25, 4, 16, 250.00, 1),
(34, 26, 4, 16, 150.00, 1),
(35, 27, 5, 14, 10.00, 4),
(36, 27, 6, 19, 70.00, 1),
(37, 27, 4, 16, 250.00, 1),
(38, 27, 8, 15, 120.00, 1),
(39, 28, 5, 14, 10.00, 1),
(40, 28, 6, 19, 70.00, 1),
(41, 28, 8, 15, 120.00, 1),
(42, 28, 4, 16, 250.00, 1),
(43, 29, 5, 14, 10.00, 1),
(44, 29, 6, 19, 70.00, 1),
(45, 29, 4, 16, 250.00, 1),
(46, 29, 8, 15, 120.00, 1),
(47, 30, 7, 16, 170.00, 1),
(48, 31, 4, 16, 250.00, 1),
(49, 32, 4, 16, 250.00, 1),
(50, 33, 8, 15, 120.00, 1),
(51, 34, 5, 14, 10.00, 1),
(52, 34, 6, 19, 70.00, 1),
(53, 34, 4, 16, 250.00, 1),
(54, 34, 8, 15, 120.00, 1),
(55, 35, 4, 16, 150.00, 1),
(56, 36, 5, 14, 10.00, 1),
(57, 37, 5, 14, 10.00, 1),
(58, 38, 10, 15, 50.00, 100),
(59, 39, 10, 15, 50.00, 100),
(60, 40, 4, 16, 250.00, 2);

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
  `amount_received` decimal(10,2) NOT NULL,
  `change_money` varchar(200) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('Placed','Preparing','Completed','Cancelled') NOT NULL DEFAULT 'Placed' COMMENT 'placed, preparing, completed, cancelled',
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash,online',
  `order_placed_by_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `amount_received`, `change_money`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(31, 1, '000001', 'INV-584632', '310', 0.00, '0.00', '2024-11-12 18:58:17', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(32, 7, '000002', 'INV-955027', '100', 0.00, '0.00', '2024-11-12 19:27:15', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(33, 7, '000003', 'INV-673840', '200', 0.00, '0.00', '2024-11-12 19:30:22', 'Cancelled', 'Cash Payment', 'Kristyle Marie'),
(34, 1, '000004', 'INV-720451', '100', 0.00, '0.00', '2024-11-12 19:47:18', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(35, 1, '000005', 'INV-135815', '200', 0.00, '0.00', '2024-11-12 19:49:11', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(36, 1, '000006', 'INV-944271', '200', 0.00, '0.00', '2024-11-12 19:53:32', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(37, 1, '000007', 'INV-523977', '200', 0.00, '0.00', '2024-11-12 19:54:42', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(38, 1, '000008', 'INV-678220', '1000', 0.00, '0.00', '2024-11-12 19:56:34', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(39, 1, '000009', 'INV-627767', '1000', 0.00, '0.00', '2024-11-12 19:56:56', 'Completed', 'Cash Payment', 'Kristyle Marie'),
(40, 1, '000010', 'INV-437374', '100', 200.00, '100.00', '2024-11-16 20:31:20', 'Completed', 'Cash Payment', 'Evanica Rose'),
(41, 1, '000011', 'INV-521185', '530', 600.00, '70.00', '2024-11-16 21:56:14', 'Placed', 'Cash Payment', 'Evanica Rose'),
(42, 4, '000012', 'INV-698839', '100', 100.00, '0.00', '2024-11-16 22:32:47', 'Placed', 'Cash Payment', 'Evanica Rose'),
(43, 10, '000013', 'INV-634060', '100', 200.00, '100', '2024-11-17 10:41:18', 'Placed', 'Cash Payment', 'Evanica Rose'),
(44, 11, '000014', 'INV-252796', '100', 200.00, '100', '2024-11-17 10:46:20', 'Placed', 'Cash Payment', 'Evanica Rose'),
(45, 12, '000015', 'INV-331003', '100', 200.00, '100', '2024-11-17 10:49:17', 'Placed', 'Cash Payment', 'Evanica Rose');

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
(1, 1, 1, '10.00', '3'),
(2, 2, 1, '10.00', '10'),
(3, 3, 1, '10.00', '1'),
(4, 4, 1, '10.00', '1'),
(5, 5, 1, '10.00', '1'),
(6, 6, 2, '50.00', '1'),
(7, 7, 3, '100.00', '1'),
(8, 8, 1, '10.00', '1'),
(9, 9, 1, '10.00', '1'),
(10, 10, 3, '100.00', '1'),
(11, 11, 3, '100.00', '1'),
(12, 12, 3, '100.00', '10'),
(13, 13, 1, '10.00', '1'),
(14, 14, 4, '190.00', '1'),
(15, 15, 6, '100.00', '1'),
(16, 15, 8, '10.00', '1'),
(17, 16, 6, '100.00', '2'),
(18, 17, 5, '100.00', '2'),
(19, 18, 5, '100.00', '1'),
(20, 19, 6, '100.00', '1'),
(21, 20, 5, '100.00', '4'),
(22, 20, 8, '10.00', '1'),
(23, 21, 5, '100.00', '1'),
(24, 22, 6, '100.00', '1'),
(25, 23, 5, '100.00', '40'),
(26, 24, 5, '100.00', '4'),
(27, 25, 6, '100.00', '10'),
(28, 26, 5, '100.00', '9'),
(29, 27, 6, '100.00', '9'),
(30, 28, 5, '100.00', '1'),
(31, 29, 5, '100.00', '1'),
(32, 30, 5, '100.00', '1'),
(33, 31, 8, '10.00', '31'),
(34, 32, 6, '100.00', '1'),
(35, 33, 6, '100.00', '1'),
(36, 33, 5, '100.00', '1'),
(37, 34, 5, '100.00', '1'),
(38, 35, 5, '100.00', '2'),
(39, 36, 5, '100.00', '2'),
(40, 37, 5, '100.00', '2'),
(41, 38, 5, '100.00', '10'),
(42, 39, 5, '100.00', '10'),
(43, 40, 5, '100.00', '1'),
(44, 41, 5, '100.00', '2'),
(45, 41, 6, '100.00', '3'),
(46, 41, 8, '10.00', '3'),
(47, 42, 5, '100.00', '1'),
(48, 43, 5, '100.00', '1'),
(49, 44, 5, '100.00', '1'),
(50, 45, 5, '100.00', '1');

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
(5, 1, 'Pork Sisig (Test 1)', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 81),
(6, 1, 'Tuna Sisig', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 20),
(8, 7, 'Fried Egg', '', 10.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 1131);

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
(35, 1, '000035', 'INV-925718', '150', '2024-11-12 14:45:34', 'Placed', 'Online Payment', 'Kristyle Marie', '2'),
(36, 1, '000036', 'INV-729281', '10', '2024-11-12 15:08:42', 'Pending', 'Cash Payment', 'Kristyle Marie', '1'),
(37, 1, '000037', 'INV-140636', '10', '2024-11-12 15:14:05', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(38, 1, '000038', 'INV-843303', '5000', '2024-11-12 19:22:18', 'Placed', 'Cash Payment', 'Kristyle Marie', '1'),
(39, 1, '000039', 'INV-411502', '5000', '2024-11-12 19:23:15', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(40, 1, '000040', 'INV-930969', '500', '2024-11-12 19:38:04', 'Pending', 'Cash Payment', 'Kristyle Marie', '1');

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
(1, 1, '', '2024-10-22 05:38:04'),
(2, 2, '', '2024-10-22 06:57:40'),
(3, 3, '', '2024-10-22 07:03:38'),
(4, 4, '', '2024-11-08 12:49:51'),
(5, 5, '', '2024-11-08 13:05:37'),
(6, 6, '', '2024-11-08 13:25:18'),
(7, 8, '', '2024-11-08 13:50:49');

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
(1, 1, 15, 1.00, 16),
(5, 2, 19, 50.00, 13),
(6, 2, 22, 50.00, 18),
(7, 2, 21, 50.00, 13),
(8, 2, 18, 1.00, 14),
(9, 2, 20, 50.00, 13),
(10, 2, 23, 50.00, 18),
(11, 3, 24, 100.00, 13),
(12, 1, 16, 1.00, 14),
(13, 4, 4, 100.00, 13),
(14, 4, 5, 1.00, 14),
(15, 4, 6, 50.00, 18),
(16, 5, 4, 100.00, 13),
(17, 5, 5, 1.00, 14),
(18, 5, 6, 100.00, 18),
(19, 6, 7, 100.00, 13),
(20, 6, 5, 1.00, 14),
(21, 6, 6, 50.00, 13),
(22, 7, 8, 1.00, 14),
(23, 5, 10, 1.00, 14);

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `purchaseorder_id` int(11) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `stockin_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`id`, `admin_id`, `purchaseorder_id`, `invoice_no`, `supplier_id`, `stockin_date`) VALUES
(12, 1, 36, 'INV-729281', 1, '2024-11-12 15:09:09'),
(13, 1, 37, 'INV-140636', 1, '2024-11-12 15:14:25'),
(14, 1, 34, 'INV-697703', 1, '2024-11-12 17:48:23'),
(15, 1, 39, 'INV-411502', 1, '2024-11-12 19:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `stockin_ingredients`
--

CREATE TABLE `stockin_ingredients` (
  `id` int(11) NOT NULL,
  `stockin_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin_ingredients`
--

INSERT INTO `stockin_ingredients` (`id`, `stockin_id`, `ingredient_id`, `quantity`, `unit_id`, `totalPrice`) VALUES
(19, 12, 5, 1, 14, 10),
(20, 13, 5, 2, 14, 20),
(21, 14, 4, 1, 16, 250),
(22, 14, 5, 1, 14, 10),
(23, 14, 6, 1, 19, 70),
(24, 14, 8, 1, 15, 120),
(25, 15, 10, 100, 15, 5000);

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
(1, 'Kristyle Marie', 'Modin', '09094192413', 'Purok Lomboy Coog, Mandug,'),
(2, 'Kassandra Mae', 'Modin', '0934567890', 'Coog');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ingredients`
--

CREATE TABLE `supplier_ingredients` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_ingredients`
--

INSERT INTO `supplier_ingredients` (`id`, `supplier_id`, `ingredient_id`, `price`, `unit_id`) VALUES
(4, 1, 5, 10.00, 14),
(5, 2, 4, 150.00, 16),
(6, 2, 7, 170.00, 16),
(7, 1, 6, 70.00, 19),
(8, 2, 8, 120.00, 15),
(9, 1, 4, 250.00, 16),
(10, 1, 8, 120.00, 15),
(11, 1, 9, 150.00, 13),
(12, 1, 10, 50.00, 15);

-- --------------------------------------------------------

--
-- Table structure for table `units_of_measure`
--

CREATE TABLE `units_of_measure` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `uom_name` varchar(255) DEFAULT NULL,
  `type` enum('reference','bigger','smaller') DEFAULT NULL,
  `ratio` decimal(10,5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `rounding_precision` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units_of_measure`
--

INSERT INTO `units_of_measure` (`id`, `category_id`, `uom_name`, `type`, `ratio`, `active`, `rounding_precision`) VALUES
(13, 5, 'g', 'reference', 1.00000, 1, 0.01000),
(14, 6, 'Pieces', 'reference', 1.00000, 1, 0.01000),
(15, 6, 'Dozen', 'bigger', 12.00000, 1, 0.01000),
(16, 5, 'kg', 'bigger', 1000.00000, 1, 0.01000),
(18, 7, 'ml', 'reference', 1.00000, 1, 0.01000),
(19, 7, 'L', 'bigger', 1000.00000, 1, 0.01000),
(20, 7, 'gl', 'bigger', 0.00026, 1, 0.01000),
(22, 5, 'mg', 'smaller', 0.00100, 1, 0.00000);

-- --------------------------------------------------------

--
-- Table structure for table `unit_categories`
--

CREATE TABLE `unit_categories` (
  `id` int(11) NOT NULL,
  `category_unit_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_categories`
--

INSERT INTO `unit_categories` (`id`, `category_unit_name`) VALUES
(5, 'Weight'),
(6, 'Quantity'),
(7, 'Volume'),
(10, 'Count');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

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
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockin_ingredients`
--
ALTER TABLE `stockin_ingredients`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `supplier_ingredients_ibfk_1` (`supplier_id`),
  ADD KEY `supplier_ingredients_ibfk_2` (`ingredient_id`);

--
-- Indexes for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `unit_categories`
--
ALTER TABLE `unit_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stockin_ingredients`
--
ALTER TABLE `stockin_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `unit_categories`
--
ALTER TABLE `unit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units_of_measure` (`id`) ON DELETE CASCADE;

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

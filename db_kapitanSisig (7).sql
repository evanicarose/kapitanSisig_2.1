-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:4306
-- Generation Time: Nov 23, 2024 at 02:54 AM
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
(2, 'Evanica', 'Juarbal', 'errjuarbal', '$2y$10$wOfFG1LwTI1MiZcYjG.gIe9Zr0lq9NKo/RmvnISqJlkbR3VqStouu', 0, '2024-11-21', 1),
(3, 'Shiloh', 'Millondaga', 'ssmillondaga', '$2y$10$kC7HMdYxxDcaMZX7OCCxFui8fRdu5SypG7zM7A.5KBKSPYVYbm312', 0, '2024-11-22', 0);

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
(1, 'Khim'),
(2, 'Dawn'),
(3, 'Shiloh Millondaga'),
(4, 'Evanica'),
(5, 'Kristyle'),
(6, 'Shiloh'),
(7, 'AJ'),
(8, 'Jonas'),
(9, 'Keisha'),
(10, 'Jesus'),
(11, 'Oneil'),
(12, 'Angel Marie');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category` varchar(191) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `reorder_point` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `quantity`, `reorder_point`) VALUES
(4, 'Pork Belly', 13, 'Meat & Poultry', 3800.00, 100.00),
(5, 'Spoon', 14, 'Cutlery', 8.00, 10.00),
(6, 'Soy Sauce', 18, 'Condiments', 1850.00, 10.00),
(7, 'Tuna', 13, 'Meat & Poultry', 1000.00, 10.00),
(8, 'Egg', 14, 'Others', 0.00, 10.00),
(9, 'Pig Ears', 13, 'Meat & Poultry', 0.00, 100.00),
(10, 'Pig Snout', 13, 'Meat & Poultry', 0.00, 100.00),
(11, 'Onions', 13, 'Vegetables', 0.00, 10.00),
(12, 'Bay Leaf', 13, 'Spices & Herbs', 0.00, 0.00),
(13, 'Salt', 13, 'Spices & Herbs', 0.00, 0.00),
(14, 'Ginger', 13, 'Vegetables', 0.00, 0.00),
(15, 'Water', 18, 'Others', 0.00, 0.00),
(16, 'Mayonnaise', 13, 'Condiments', 0.00, 0.00),
(17, 'Vinegar', 18, 'Condiments', 0.00, 0.00),
(18, 'Sugar', 13, 'Condiments', 0.00, 0.00),
(19, 'Liver Spread', 13, 'Meat & Poultry', 0.00, 0.00),
(20, 'Knorr Liquid Seasoning', 18, 'Condiments', 0.00, 0.00);

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
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_items`
--

INSERT INTO `ingredients_items` (`id`, `order_id`, `ingredient_id`, `unit_id`, `price`, `quantity`) VALUES
(1, 1, 8, 15, 120.00, 2.00),
(2, 2, 8, 15, 120.00, 1.00),
(3, 3, 4, 16, 250.00, 2.00),
(4, 4, 4, 16, 250.00, 1.00),
(5, 5, 4, 16, 250.00, 2.00),
(6, 6, 4, 16, 250.00, 10.00),
(7, 7, 4, 16, 150.00, 3.00),
(8, 8, 4, 16, 250.00, 10.00),
(9, 9, 4, 16, 150.00, 15.00),
(10, 10, 4, 16, 150.00, 4.00),
(11, 11, 6, 19, 70.00, 2.00),
(12, 11, 5, 14, 10.00, 4.00),
(13, 12, 6, 19, 70.00, 1.00),
(14, 13, 4, 16, 250.00, 1.00),
(15, 14, 5, 14, 10.00, 20.00),
(16, 15, 4, 16, 250.00, 2.00),
(17, 16, 7, 16, 170.00, 1.00);

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
(1, 6, '000001', 'INV-657650', '20', 20.00, '0', '2024-11-19 08:49:47', 'Completed', 'Online Payment', 'Kristyle Marie'),
(2, 5, '000002', 'INV-981121', '210', 220.00, '10', '2024-11-19 09:12:09', 'Completed', 'Online Payment', 'Kristyle Marie'),
(3, 6, '000003', 'INV-973294', '20', 20.00, '10', '2024-11-19 09:12:39', 'Completed', 'Online Payment', 'Kristyle Marie'),
(4, 8, '000004', 'INV-318204', '200', 500.00, '300', '2024-11-21 22:47:29', 'Completed', 'Cash Payment', 'Evanica'),
(5, 1, '000005', 'INV-997326', '300', 500.00, '200', '2024-11-22 14:16:37', 'Completed', 'Cash Payment', 'Evanica'),
(6, 1, '000006', 'INV-285542', '400', 500.00, '100', '2024-11-22 14:55:46', 'Completed', 'Cash Payment', 'Evanica'),
(7, 1, '000007', 'INV-970274', '100', 100.00, '0', '2024-11-22 15:47:43', 'Completed', 'Cash Payment', 'Evanica'),
(8, 11, '000008', 'INV-717826', '100', 200.00, '100', '2024-11-22 20:36:41', 'Placed', 'Cash Payment', 'Evanica'),
(9, 12, '000009', 'INV-329020', '200', 500.00, '300', '2024-11-22 20:40:10', 'Completed', 'Cash Payment', 'Evanica');

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
(1, 1, 8, '10.00', '2'),
(2, 2, 8, '10.00', '21'),
(3, 3, 8, '10.00', '2'),
(4, 4, 5, '100.00', '2'),
(5, 5, 5, '100.00', '3'),
(6, 6, 5, '100.00', '4'),
(7, 7, 5, '100.00', '1'),
(8, 8, 5, '100.00', '1'),
(9, 9, 5, '100.00', '1'),
(10, 9, 6, '100.00', '1');

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
(5, 1, 'Pork Sisig', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 8),
(6, 1, 'Tuna Sisig', '', 100.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 8),
(8, 7, 'Fried Egg', 'Wow', 10.00, 'pics/uploads/products/1724471945.jpg\r\n', '2024-11-08', 0);

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
(1, 1, '000001', 'INV-701266', '240', '2024-11-19 08:36:57', 'Delivered', 'Online Payment', 'Kristyle Marie', '1'),
(2, 1, '000002', 'INV-497049', '120', '2024-11-19 08:50:18', 'Delivered', 'Online Payment', 'Kristyle Marie', '1'),
(3, 1, '000003', 'INV-831726', '500', '2024-11-21 19:03:07', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(4, 1, '000004', 'INV-143641', '250', '2024-11-21 19:04:06', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(5, 1, '000005', 'INV-222396', '500', '2024-11-21 19:30:13', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(6, 1, '000006', 'INV-867601', '2500', '2024-11-21 19:32:49', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(7, 1, '000007', 'INV-924808', '450', '2024-11-21 19:58:05', 'Delivered', 'Cash Payment', 'Kristyle Marie', '2'),
(8, 1, '000008', 'INV-765345', '2500', '2024-11-21 20:28:56', 'Delivered', 'Cash Payment', 'Kristyle Marie', '1'),
(9, 2, '000009', 'INV-971390', '2250', '2024-11-21 20:46:42', 'Delivered', 'Cash Payment', 'Evanica', '2'),
(10, 2, '000010', 'INV-454588', '600', '2024-11-21 22:43:33', 'Delivered', 'Cash Payment', 'Evanica', '2'),
(11, 2, '000011', 'INV-989475', '180', '2024-11-21 22:46:19', 'Delivered', 'Cash Payment', 'Evanica', '1'),
(12, 2, '000012', 'INV-709276', '70', '2024-11-21 22:52:11', 'Delivered', 'Cash Payment', 'Evanica', '1'),
(13, 2, '000013', 'INV-522399', '250', '2024-11-21 22:52:52', 'Delivered', 'Cash Payment', 'Evanica', '1'),
(14, 2, '000014', 'INV-869069', '200', '2024-11-22 07:47:38', 'Delivered', 'Cash Payment', 'Evanica', '1'),
(15, 2, '000015', 'INV-492020', '500', '2024-11-22 14:17:41', 'Delivered', 'Online Payment', 'Evanica', '1'),
(16, 2, '000016', 'INV-522942', '170', '2024-11-22 20:38:43', 'Delivered', 'Cash Payment', 'Evanica', '2');

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
(22, 7, 8, 1.00, 14);

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
(1, 1, 1, 'INV-701266', 1, '2024-11-19 08:42:43'),
(2, 1, 2, 'INV-497049', 1, '2024-11-19 08:50:30'),
(3, 1, 3, 'INV-831726', 1, '2024-11-21 19:03:27'),
(4, 1, 4, 'INV-143641', 1, '2024-11-21 19:04:22'),
(5, 1, 5, 'INV-222396', 1, '2024-11-21 19:30:32'),
(6, 1, 6, 'INV-867601', 1, '2024-11-21 19:33:01'),
(7, 1, 7, 'INV-924808', 2, '2024-11-21 19:58:17'),
(8, 1, 8, 'INV-765345', 1, '2024-11-21 20:29:06'),
(9, 2, 9, 'INV-971390', 2, '2024-11-21 20:46:52'),
(10, 2, 10, 'INV-454588', 2, '2024-11-21 22:44:05'),
(11, 2, 11, 'INV-989475', 1, '2024-11-21 22:46:34'),
(12, 2, 12, 'INV-709276', 1, '2024-11-21 22:52:29'),
(13, 2, 13, 'INV-522399', 1, '2024-11-21 22:53:03'),
(14, 2, 14, 'INV-869069', 1, '2024-11-22 07:47:56'),
(15, 2, 15, 'INV-492020', 1, '2024-11-22 14:19:12'),
(16, 2, 16, 'INV-522942', 2, '2024-11-22 20:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `stockin_ingredients`
--

CREATE TABLE `stockin_ingredients` (
  `id` int(11) NOT NULL,
  `stockin_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `totalQuantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `expiryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockin_ingredients`
--

INSERT INTO `stockin_ingredients` (`id`, `stockin_id`, `ingredient_id`, `quantity`, `totalQuantity`, `unit_id`, `totalPrice`, `expiryDate`) VALUES
(1, 1, 8, 0.00, 0.00, 15, 240, '2024-11-19'),
(2, 2, 8, 1.00, 11.00, 15, 120, '2024-11-19'),
(3, 3, 4, 0.00, 900.00, 16, 500, '2024-11-29'),
(4, 4, 4, 0.00, 1000.00, 16, 250, '2024-11-29'),
(5, 5, 4, 0.00, 2000.00, 16, 500, '2024-11-21'),
(6, 6, 4, 0.00, 10000.00, 16, 2500, '2024-11-21'),
(7, 7, 4, 0.00, 3000.00, 16, 450, '2024-11-21'),
(8, 8, 4, 0.00, 10000.00, 16, 2500, '2024-11-21'),
(9, 9, 4, 0.00, 15000.00, 16, 2250, '2024-11-21'),
(10, 10, 4, 1.90, 4000.00, 16, 600, '2024-11-21'),
(11, 11, 6, 2.00, 850.00, 19, 140, '2024-11-21'),
(12, 11, 5, 0.00, 0.00, 14, 40, '2024-11-21'),
(13, 12, 6, 1.00, 1000.00, 19, 70, '2024-11-21'),
(14, 13, 4, 1.00, 1000.00, 16, 250, '2024-11-21'),
(15, 14, 5, 18.00, 12.00, 14, 200, '2024-11-29'),
(16, 15, 4, 2.00, 2000.00, 16, 500, '2024-12-06'),
(17, 16, 7, 1.00, 1000.00, 16, 170, '2024-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(11) NOT NULL,
  `stockin_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_out`
--

INSERT INTO `stock_out` (`id`, `stockin_id`, `ingredient_id`, `quantity`, `reason`, `created_at`) VALUES
(1, 1, 8, 1.00, 'Expired', '2024-11-21 19:00:34'),
(2, 3, 4, 2.00, 'Expired', '2024-11-21 19:04:41'),
(3, 4, 4, 1.00, 'Expired', '2024-11-21 19:25:30'),
(4, 5, 4, 1000.00, 'Production', '2024-11-21 19:31:01'),
(5, 5, 4, 1000.00, 'Production', '2024-11-21 19:31:09'),
(6, 6, 4, 2000.00, 'Expired', '2024-11-21 19:33:18'),
(7, 6, 4, 2000.00, 'Expired', '2024-11-21 19:42:11'),
(8, 6, 4, 1000.00, 'Expired', '2024-11-21 19:48:52'),
(9, 6, 4, 1000.00, 'Production', '2024-11-21 19:56:57'),
(10, 6, 4, 2000.00, 'Expired', '2024-11-21 19:58:34'),
(11, 6, 4, 1000.00, 'Production', '2024-11-21 20:03:12'),
(12, 6, 4, 1000.00, 'Production', '2024-11-21 20:03:15'),
(13, 7, 4, 1000.00, 'Production Loss', '2024-11-21 20:18:44'),
(14, 1, 8, 9.00, 'Expired', '2024-11-21 20:19:48'),
(15, 7, 4, 1000.00, 'Loss', '2024-11-21 20:22:27'),
(16, 7, 4, 1000.00, 'Loss', '2024-11-21 20:28:13'),
(17, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:29:22'),
(18, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:30:21'),
(19, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:30:21'),
(20, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:30:23'),
(21, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:31:40'),
(22, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:31:40'),
(23, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:31:40'),
(24, 8, 4, 1000.00, 'Damaged', '2024-11-21 20:31:40'),
(25, 8, 4, 1000.00, 'Expired', '2024-11-21 20:32:04'),
(26, 8, 4, 500.00, 'Loss', '2024-11-21 20:37:21'),
(27, 8, 4, 100.00, 'Expired', '2024-11-21 20:41:29'),
(28, 8, 4, 100.00, 'Expired', '2024-11-21 20:42:50'),
(29, 8, 4, 100.00, 'Expired', '2024-11-21 20:42:50'),
(30, 8, 4, 100.00, 'Expired', '2024-11-21 20:42:50'),
(31, 8, 4, 100.00, 'Expired', '2024-11-21 20:42:51'),
(32, 9, 4, 100.00, 'Expired', '2024-11-21 20:47:08'),
(33, 9, 4, 100.00, 'Expired', '2024-11-21 20:47:54'),
(34, 9, 4, 100.00, 'Expired', '2024-11-21 20:51:24'),
(35, 9, 4, 200.00, 'Production', '2024-11-21 20:51:38'),
(36, 9, 4, 200.00, 'Damaged', '2024-11-21 22:05:46'),
(37, 9, 4, 200.00, 'Expired', '2024-11-21 22:15:15'),
(38, 9, 4, 200.00, 'Expired', '2024-11-21 22:17:04'),
(39, 9, 4, 200.00, 'Expired', '2024-11-21 22:17:04'),
(40, 9, 4, 200.00, 'Expired', '2024-11-21 22:18:15'),
(41, 9, 4, 200.00, 'Expired', '2024-11-21 22:18:17'),
(42, 9, 4, 200.00, 'Expired', '2024-11-21 22:18:18'),
(43, 9, 4, 100.00, 'Expired', '2024-11-21 22:29:45'),
(44, 9, 4, 100.00, 'Expired', '2024-11-21 22:31:35'),
(45, 9, 4, 100.00, 'Loss', '2024-11-21 22:31:45'),
(46, 9, 4, 800.00, 'Production', '2024-11-21 22:32:11'),
(47, 1, 8, 3.00, 'Expired', '2024-11-21 22:32:46'),
(48, 9, 4, 11900.00, 'Damaged', '2024-11-21 22:35:38'),
(49, 9, 4, 100.00, 'Loss', '2024-11-21 22:51:56'),
(50, 11, 5, 4.00, 'Expired', '2024-11-22 07:45:18'),
(51, 14, 5, 2.00, 'Expired', '2024-11-22 07:48:18'),
(52, 10, 4, 2000.00, 'Production', '2024-11-22 14:19:49'),
(53, 10, 4, 100.00, 'Loss', '2024-11-22 20:51:19');

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
(1, 'Kristyle Marie', 'Modin', '09094192413', 'Purok Lomboy Coog, Mandug, Davao City'),
(2, 'Kassandra Mae', 'Modin', '0934567890', 'Panabo City'),
(3, 'Agustine James', 'Salcedo', '0912345678', 'Obrero, Davao City');

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
(10, 1, 8, 120.00, 15);

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
(14, 6, 'pcs', 'reference', 1.00000, 1, 0.01000),
(15, 6, 'dozen', 'bigger', 12.00000, 1, 0.01000),
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
(7, 'Volume');

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
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stockin_id` (`stockin_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `stockin_ingredients`
--
ALTER TABLE `stockin_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_ingredients`
--
ALTER TABLE `supplier_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `unit_categories`
--
ALTER TABLE `unit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units_of_measure` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`stockin_id`) REFERENCES `stockin` (`id`),
  ADD CONSTRAINT `stock_out_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

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

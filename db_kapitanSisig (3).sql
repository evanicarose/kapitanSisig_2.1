-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2024 at 08:27 AM
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
(16, 'AJ', 'Salcedo', 'ajsalcedo', '$2y$10$un4kaYiKHXb4vPKRoNIOrOZU.0hCXLMJ3BHtFSP2POK0xoH2ZMQbO', 0, '2024-10-07', 0);

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
(23, 'Nica');

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
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit_id`, `category`, `sub_category`, `price`, `quantity`) VALUES
(3, 'Pork', '1', 'Main Ingredients', 'Meat & Poultry', 140.00, 71),
(4, 'Beef', '1', 'Main Ingredients', 'Meat & Poultry', 350.00, 80),
(5, 'Tuna', '1', 'Main Ingredients', 'Meat & Poultry', 300.00, 300),
(6, 'Mushroom', '4', 'Main Ingredients', 'Vegetables', 80.00, 16),
(26, 'Onion', '4', 'Main Ingredients', 'Meat & Poultry', 11.00, 17),
(28, 'Garlic', '1', 'Commissary', 'Spices & Herbs', 10.00, 14);

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
(29, 18, 4, '350.00', '4');

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
(39, 7, '226730', 'INV-300450', '89', '2024-10-09 14:34:39', 'Preparing', 'Online Payment', 'Evanica Rose'),
(40, 22, '882095', 'INV-251510', '267', '2024-10-10 17:13:45', 'Cancelled', 'Cash Payment', 'Evanica Rose'),
(41, 22, '952796', 'INV-251510', '267', '2024-10-10 17:13:47', 'Completed', 'Cash Payment', 'Evanica Rose'),
(42, 7, '112409', 'INV-453702', '89', '2024-10-10 17:30:09', 'Cancelled', 'Cash Payment', 'Evanica Rose'),
(43, 23, '290385', 'INV-800678', '89', '2024-10-10 18:19:44', 'Completed', 'Cash Payment', 'Evanica Rose'),
(44, 7, '664221', 'INV-350966', '89', '2024-10-11 13:02:11', 'Cancelled', 'Online Payment', 'Evanica Rose'),
(45, 15, '295336', 'INV-321654', '89', '2024-10-11 13:26:59', 'Completed', 'Online Payment', 'Evanica Rose'),
(46, 7, '456683', 'INV-239910', '89', '2024-10-11 14:00:40', 'Placed', 'Cash Payment', 'Evanica Rose');

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
(49, 46, 14, '89.00', '1');

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
(13, 1, 'Chicken Sisig', '', 89.00, 'pics/uploads/products/1724560785.jpg', '2024-08-25', 5),
(14, 1, 'Tofu', '', 89.00, 'pics/uploads/products/1724560817.jpg', '2024-08-25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseOrders`
--

CREATE TABLE `purchaseOrders` (
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
-- Dumping data for table `purchaseOrders`
--

INSERT INTO `purchaseOrders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `ingPayment_mode`, `order_placed_by_id`, `supplierName`) VALUES
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
(18, 1, '660849', 'INV-592503', '2100', '2024-10-10 18:24:38', 'Booked', 'Cash Payment', 'Admin', '6');

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
(9, 'Aj Banig', 'Salcedo', '0987485676', 'Kawayan Island');

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
(8, 'Gallon', 0);

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
-- Indexes for table `purchaseOrders`
--
ALTER TABLE `purchaseOrders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ingredients_items`
--
ALTER TABLE `ingredients_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `purchaseOrders`
--
ALTER TABLE `purchaseOrders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

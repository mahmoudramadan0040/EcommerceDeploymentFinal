-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 12:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(3, 'Bags', '2022-05-28 08:06:17', '2022-05-28 08:06:17'),
(4, 'Shoes', '2022-05-28 08:06:23', '2022-05-28 08:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `shipping_address`, `billing_address`, `phone`, `image`, `name`, `email`) VALUES
(1, 29, 'hoem dsfsaf', NULL, 1232412412, NULL, 'finally', 'Texzdgsdgvxvzam@Tam.com'),
(2, 30, 'hoem dsfsaf', NULL, 1232412412, NULL, 'finally', 'Texzdgfvsfgsdgvxvzam@Tam.com'),
(3, 31, 'hoem dsfsaf', 'home home', 1232412412, NULL, 'finally', 'safas@Tam.com'),
(4, 32, 'hoem dsfsaf', 'home home', 1232412412, NULL, 'finally', 'fsa@Tam.com'),
(5, 33, 'ewtewsdfas', 'finally', 316546, '202205282216final.png', 'finally', 'mahmpoud@gmail.com'),
(6, 34, 'ewtewsdfas', 'finally', 316546, '202205282219final.png', 'finally', 'mahmoud@gmail.com'),
(7, 35, 'ewtewsdfas', 'finally', 316546, '202205282231final.png', 'finally', 'mahmdoud@gmail.com'),
(8, 36, 'fasfasfasf', 'dsfsfasfas', 12324234, '202205282239final.png', 'mahmoud', 'mahmoud@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'category_name', 'text', 'Category Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(25, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(26, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(27, 5, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(28, 5, 'product_disc', 'text', 'Product Disc', 0, 1, 1, 1, 1, 1, '{}', 3),
(29, 5, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(30, 5, 'qty', 'text', 'Qty', 0, 1, 1, 1, 1, 1, '{}', 5),
(31, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(32, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(33, 5, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"category_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 8),
(34, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(35, 6, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(36, 6, 'qty', 'text', 'Qty', 0, 1, 1, 1, 1, 1, '{}', 3),
(37, 6, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 4),
(38, 6, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, '{}', 5),
(39, 6, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 6),
(40, 6, 'sku', 'text', 'Sku', 0, 1, 1, 1, 1, 1, '{}', 7),
(41, 6, 'stock_status', 'text', 'Stock Status', 0, 1, 1, 1, 1, 1, '{}', 8),
(42, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(43, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(44, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 7, 'crd_name', 'text', 'Crd Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(46, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(47, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(48, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 8, 'pay_type', 'text', 'Pay Type', 0, 1, 1, 1, 1, 1, '{}', 2),
(50, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(51, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(52, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(53, 9, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 2),
(54, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(55, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(56, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 10, 'order_user_id', 'text', 'Order User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 10, 'order_payment_type_id', 'text', 'Order Payment Type Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 10, 'order_visa_card_id', 'text', 'Order Visa Card Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 10, 'duration', 'text', 'Duration', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 10, 'total_price', 'text', 'Total Price', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 10, 'tax', 'text', 'Tax', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 10, 'coupon_code', 'text', 'Coupon Code', 0, 1, 1, 1, 1, 1, '{}', 8),
(64, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(65, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(66, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 0),
(67, 11, 'order_id', 'text', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 11, 'qty', 'text', 'Qty', 0, 1, 1, 1, 1, 1, '{}', 3),
(69, 11, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 4),
(70, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 5),
(71, 11, 'sku', 'text', 'Sku', 0, 1, 1, 1, 1, 1, '{}', 6),
(72, 11, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 7),
(73, 11, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, '{}', 8),
(74, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(75, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(76, 11, 'order_item_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 11),
(77, 10, 'order_belongsto_payment_card_relationship', 'relationship', 'payment_cards', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\PaymentCard\",\"table\":\"payment_cards\",\"type\":\"belongsTo\",\"column\":\"order_visa_card_id\",\"key\":\"id\",\"label\":\"crd_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(78, 10, 'order_belongsto_payment_type_relationship', 'relationship', 'payment_types', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\PaymentType\",\"table\":\"payment_types\",\"type\":\"belongsTo\",\"column\":\"order_payment_type_id\",\"key\":\"id\",\"label\":\"pay_type\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(79, 10, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"order_user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(80, 10, 'order_belongsto_order_state_relationship', 'relationship', 'order_states', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\OrderState\",\"table\":\"order_states\",\"type\":\"belongsTo\",\"column\":\"order_states_id\",\"key\":\"id\",\"label\":\"status\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(81, 6, 'product_detail_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(82, 6, 'image1', 'image', 'Image1', 0, 1, 1, 1, 1, 1, '{}', 11),
(83, 6, 'image2', 'image', 'Image2', 0, 1, 1, 1, 1, 1, '{}', 12),
(84, 6, 'image3', 'image', 'Image3', 0, 1, 1, 1, 1, 1, '{}', 13),
(85, 6, 'image4', 'image', 'Image4', 0, 1, 1, 1, 1, 1, '{}', 14),
(86, 6, 'image5', 'image', 'Image5', 0, 1, 1, 1, 1, 1, '{}', 15),
(87, 10, 'order_states_id', 'text', 'Order States Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(88, 1, 'user_hasone_customer_relationship', 'relationship', 'customer', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customer\",\"type\":\"hasOne\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 13),
(94, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(95, 15, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(96, 15, 'shipping_address', 'text', 'Shipping Address', 0, 1, 1, 1, 1, 1, '{}', 3),
(97, 15, 'billing_address', 'text', 'Billing Address', 0, 1, 1, 1, 1, 1, '{}', 4),
(98, 15, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 5),
(99, 15, 'image', 'text', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(100, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 7),
(101, 15, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(4, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(5, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(6, 'product_details', 'product-details', 'Product Detail', 'Product Details', NULL, 'App\\ProductDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-26 15:31:29', '2022-05-28 08:10:13'),
(7, 'payment_cards', 'payment-cards', 'Payment Card', 'Payment Cards', NULL, 'App\\PaymentCard', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(8, 'payment_types', 'payment-types', 'Payment Type', 'Payment Types', NULL, 'App\\PaymentType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(9, 'order_states', 'order-states', 'Order State', 'Order States', NULL, 'App\\OrderState', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(10, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-26 15:40:25', '2022-05-28 08:28:51'),
(11, 'order_items', 'order-items', 'Order Item', 'Order Items', NULL, 'App\\OrderItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(13, 'customer', 'customer', 'Customer', 'Customers', NULL, 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(15, 'customers', 'customers', 'Customer', 'Customers', NULL, 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-05-28 20:25:30', '2022-05-28 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-05-26 15:18:04', '2022-05-26 15:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2022-05-26 15:18:04', '2022-05-26 15:18:04', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2022-05-26 15:18:04', '2022-05-26 15:18:04', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', NULL, NULL, NULL, 15, '2022-05-26 15:25:33', '2022-05-26 15:25:33', 'voyager.categories.index', NULL),
(12, 1, 'Products', '', '_self', NULL, NULL, NULL, 16, '2022-05-26 15:27:51', '2022-05-26 15:27:51', 'voyager.products.index', NULL),
(13, 1, 'Product Details', '', '_self', NULL, NULL, NULL, 17, '2022-05-26 15:31:29', '2022-05-26 15:31:29', 'voyager.product-details.index', NULL),
(14, 1, 'Payment Cards', '', '_self', NULL, NULL, NULL, 18, '2022-05-26 15:33:04', '2022-05-26 15:33:04', 'voyager.payment-cards.index', NULL),
(15, 1, 'Payment Types', '', '_self', NULL, NULL, NULL, 19, '2022-05-26 15:34:06', '2022-05-26 15:34:06', 'voyager.payment-types.index', NULL),
(16, 1, 'Order States', '', '_self', NULL, NULL, NULL, 20, '2022-05-26 15:36:54', '2022-05-26 15:36:54', 'voyager.order-states.index', NULL),
(17, 1, 'Orders', '', '_self', NULL, NULL, NULL, 21, '2022-05-26 15:40:25', '2022-05-26 15:40:25', 'voyager.orders.index', NULL),
(18, 1, 'Order Items', '', '_self', NULL, NULL, NULL, 22, '2022-05-26 15:42:47', '2022-05-26 15:42:47', 'voyager.order-items.index', NULL),
(22, 1, 'Customers', '', '_self', NULL, NULL, NULL, 23, '2022-05-28 20:25:30', '2022-05-28 20:25:30', 'voyager.customers.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(26, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(27, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(28, '2016_06_01_000004_create_oauth_clients_table', 2),
(29, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('04125d8758bcb5d046f6048a6ff2c1e5672b54ea8879057e752455a1f20403c6f3fb128c32aca600', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 16:29:17', '2022-05-28 16:29:17', '2023-05-28 18:29:17'),
('0cde30ab630ab27824d762d51c80bcc3dd78c056e2fa0e13eb7c373111f9530d9bc7a6e77e010dd6', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:01:38', '2022-05-28 17:01:38', '2023-05-28 19:01:38'),
('1cea1ff191f513fbeebea008b8b00b94a4f3164bbb8979868a59c22d9891df6b390d08fbc30e236e', 32, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:04:00', '2022-05-28 20:04:00', '2023-05-28 22:04:00'),
('2ea41d23ab913b665f6884f044bcfba5fbe9c49058041a306102ce863d57725da8cce50880ca4c4a', 29, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 19:57:27', '2022-05-28 19:57:27', '2023-05-28 21:57:27'),
('3cf9fe10bfc33c9d6621b3de2fdc00a07729a21f18be7ccce77a8f45f820cac465b1b555ab6d059b', 20, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 15:56:56', '2022-05-28 15:56:56', '2023-05-28 17:56:56'),
('43543ca0ba243cc9f3f850ee3adb56063d994bb1e75b8022448a29fcad43814f1d080db3cdbcc596', 34, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:19:53', '2022-05-28 20:19:53', '2023-05-28 22:19:53'),
('43cc62ba0f7c02360bfee11ebe766fd41276d5fbb0e8b7bbaedd7e2e7c8b3526a5125bfe75ca8c85', 31, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:01:41', '2022-05-28 20:01:41', '2023-05-28 22:01:41'),
('4bb94ed26a0fd6f0df218c6dd34bfcfd64d11c6ab029dc7dacb07434bfb2036fb1052fa18d89ede0', 24, 1, 'Laravel Password Grant Client', '[]', 1, '2022-05-28 18:33:18', '2022-05-28 18:33:18', '2023-05-28 20:33:18'),
('6235fcd3173e904b4409c4611e42a5476fa0a8cdf0f611131cef2e0df23750baf126bd84acbc25bd', 30, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:00:14', '2022-05-28 20:00:14', '2023-05-28 22:00:14'),
('735102dd83a0a43cafefb18d16c1a330705933108eb05bbfdb1cd412fea553d82ad813e2fc266bab', 33, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:16:38', '2022-05-28 20:16:38', '2023-05-28 22:16:38'),
('80f5acbb56d1a2daad1b15f2b697556ac17755afb345f75dbe9990be22558f4a38653b2f2b005c89', 35, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:31:14', '2022-05-28 20:31:14', '2023-05-28 22:31:14'),
('81cc30a5e59df5a7b99a328d39b2ddced8927a975ec055692574c8223e7093327d15525f361f83cd', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:01:29', '2022-05-28 17:01:29', '2023-05-28 19:01:29'),
('8e3a84e6f815060786522ba6278913aa273df0973cacf5e8976230f926ae168e56e07e827c829f9a', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 16:32:53', '2022-05-28 16:32:53', '2023-05-28 18:32:53'),
('8e81c1e7b6a5b71a72e52fabaf66caae05aa61007cdfdbc23cba276f45d80c0083d859e27e827a66', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:01:17', '2022-05-28 17:01:17', '2023-05-28 19:01:17'),
('901ed799da24fb47c847066eb5862cc1fc6a43d5f4538a6c1a241b1d7c2c0e192524f7fdd7921aca', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:03:07', '2022-05-28 17:03:07', '2023-05-28 19:03:07'),
('9f470901f31260b25f270ec4df89fda932692e3731fb0a2e44c37b25b06a145019f4b7c3300d205c', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:02:42', '2022-05-28 17:02:42', '2023-05-28 19:02:42'),
('a22a3471069b984d135979e46da86cdf9cdd7be539defb413a193ed74a2bec49f6dad22dc6a9c80b', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:30:30', '2022-05-28 17:30:30', '2023-05-28 19:30:30'),
('b14972ccafcc31b605b6edb6b66f18c3d67b2e4b4a2e12c2174a9f4feb84f4a40270fc6ea276c987', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:40:28', '2022-05-28 20:40:28', '2023-05-28 22:40:28'),
('b3e143d2abc6d1cf6ce0e008b20de22eff3f945e625032d65f64dad8dc3f7290a2182f0316de9eec', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:02:14', '2022-05-28 17:02:14', '2023-05-28 19:02:14'),
('be3a3eca58e30d658d02010e9be42133858f03229218d37d4290cf489fb25a662dcd60b02001381e', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:40:15', '2022-05-28 20:40:15', '2023-05-28 22:40:15'),
('c07bd9da93c9c834448926541ce32d9c54d22ca1d496d4a217112a7b02f5d0cb1128d2c6064e4e9d', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 16:54:00', '2022-05-28 16:54:00', '2023-05-28 18:54:00'),
('c3a000e86b1af249f6de8086db0810dc95f62213481b4fab62804ec1cd9329a4828e0fb9c831e968', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 20:39:42', '2022-05-28 20:39:42', '2023-05-28 22:39:42'),
('ca0374eb8ddffe9ac02d188d989c3742ecd95b7db1e690f9845c1917c043f0da5c315af8a3c3b195', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:03:13', '2022-05-28 17:03:13', '2023-05-28 19:03:13'),
('ea23811a45ad13082e51b4f5f712152bfcf39f282e878d4e4dbc7c1bfea60a7538104efdc293836b', 21, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 15:57:11', '2022-05-28 15:57:11', '2023-05-28 17:57:11'),
('fb733e8cdef464c7014c00d14061eb508ef318dafb5abf4f9592982e25af947444182d71692f210a', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-28 17:01:35', '2022-05-28 17:01:35', '2023-05-28 19:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'oRxfplOxU9Ybg2lAIfB7DSIjxOBce4vJAkS5Nk5b', NULL, 'http://localhost', 1, 0, 0, '2022-05-28 15:56:26', '2022-05-28 15:56:26'),
(2, NULL, 'Laravel Password Grant Client', 'ji5yHCOROZxWF7nNo59JdzN7D8iqd5GHOR2JK4bg', 'users', 'http://localhost', 0, 1, 0, '2022-05-28 15:56:26', '2022-05-28 15:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-05-28 15:56:26', '2022-05-28 15:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_user_id` int(11) DEFAULT NULL,
  `order_payment_type_id` int(11) DEFAULT NULL,
  `order_visa_card_id` int(11) DEFAULT NULL,
  `duration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_states_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_user_id`, `order_payment_type_id`, `order_visa_card_id`, `duration`, `total_price`, `tax`, `coupon_code`, `created_at`, `updated_at`, `order_states_id`) VALUES
(2, 1, 1, 1, '3', 700, 50, 'rddrdrdtygygug', '2022-05-28 08:34:02', '2022-05-28 08:34:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `qty`, `price`, `name`, `sku`, `color`, `size`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 55, 'yytttytytytyt', 'ttftftttftf', 'black', 32, '2022-05-28 08:35:27', '2022-05-28 08:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_states`
--

CREATE TABLE `order_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_states`
--

INSERT INTO `order_states` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'In-Progress', '2022-05-26 15:37:14', '2022-05-26 15:37:14'),
(2, 'Delivered', '2022-05-26 15:37:25', '2022-05-26 15:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_cards`
--

CREATE TABLE `payment_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `crd_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_cards`
--

INSERT INTO `payment_cards` (`id`, `crd_name`, `created_at`, `updated_at`) VALUES
(1, 'QNB', '2022-05-26 15:35:17', '2022-05-26 15:35:17'),
(2, 'CIB', '2022-05-26 15:35:28', '2022-05-26 15:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `pay_type`, `created_at`, `updated_at`) VALUES
(1, 'Visa', '2022-05-26 15:34:55', '2022-05-26 15:34:55'),
(2, 'Cash On Delivery', '2022-05-26 15:35:08', '2022-05-26 15:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(2, 'browse_bread', NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(3, 'browse_database', NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(4, 'browse_media', NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(5, 'browse_compass', NULL, '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(6, 'browse_menus', 'menus', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(7, 'read_menus', 'menus', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(8, 'edit_menus', 'menus', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(9, 'add_menus', 'menus', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(10, 'delete_menus', 'menus', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(11, 'browse_roles', 'roles', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(12, 'read_roles', 'roles', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(13, 'edit_roles', 'roles', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(14, 'add_roles', 'roles', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(15, 'delete_roles', 'roles', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(16, 'browse_users', 'users', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(17, 'read_users', 'users', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(18, 'edit_users', 'users', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(19, 'add_users', 'users', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(20, 'delete_users', 'users', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(21, 'browse_settings', 'settings', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(22, 'read_settings', 'settings', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(23, 'edit_settings', 'settings', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(24, 'add_settings', 'settings', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(25, 'delete_settings', 'settings', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(26, 'browse_categories', 'categories', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(27, 'read_categories', 'categories', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(28, 'edit_categories', 'categories', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(29, 'add_categories', 'categories', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(30, 'delete_categories', 'categories', '2022-05-26 15:25:33', '2022-05-26 15:25:33'),
(31, 'browse_products', 'products', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(32, 'read_products', 'products', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(33, 'edit_products', 'products', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(34, 'add_products', 'products', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(35, 'delete_products', 'products', '2022-05-26 15:27:51', '2022-05-26 15:27:51'),
(36, 'browse_product_details', 'product_details', '2022-05-26 15:31:29', '2022-05-26 15:31:29'),
(37, 'read_product_details', 'product_details', '2022-05-26 15:31:29', '2022-05-26 15:31:29'),
(38, 'edit_product_details', 'product_details', '2022-05-26 15:31:29', '2022-05-26 15:31:29'),
(39, 'add_product_details', 'product_details', '2022-05-26 15:31:29', '2022-05-26 15:31:29'),
(40, 'delete_product_details', 'product_details', '2022-05-26 15:31:29', '2022-05-26 15:31:29'),
(41, 'browse_payment_cards', 'payment_cards', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(42, 'read_payment_cards', 'payment_cards', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(43, 'edit_payment_cards', 'payment_cards', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(44, 'add_payment_cards', 'payment_cards', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(45, 'delete_payment_cards', 'payment_cards', '2022-05-26 15:33:04', '2022-05-26 15:33:04'),
(46, 'browse_payment_types', 'payment_types', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(47, 'read_payment_types', 'payment_types', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(48, 'edit_payment_types', 'payment_types', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(49, 'add_payment_types', 'payment_types', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(50, 'delete_payment_types', 'payment_types', '2022-05-26 15:34:06', '2022-05-26 15:34:06'),
(51, 'browse_order_states', 'order_states', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(52, 'read_order_states', 'order_states', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(53, 'edit_order_states', 'order_states', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(54, 'add_order_states', 'order_states', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(55, 'delete_order_states', 'order_states', '2022-05-26 15:36:54', '2022-05-26 15:36:54'),
(56, 'browse_orders', 'orders', '2022-05-26 15:40:25', '2022-05-26 15:40:25'),
(57, 'read_orders', 'orders', '2022-05-26 15:40:25', '2022-05-26 15:40:25'),
(58, 'edit_orders', 'orders', '2022-05-26 15:40:25', '2022-05-26 15:40:25'),
(59, 'add_orders', 'orders', '2022-05-26 15:40:25', '2022-05-26 15:40:25'),
(60, 'delete_orders', 'orders', '2022-05-26 15:40:25', '2022-05-26 15:40:25'),
(61, 'browse_order_items', 'order_items', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(62, 'read_order_items', 'order_items', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(63, 'edit_order_items', 'order_items', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(64, 'add_order_items', 'order_items', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(65, 'delete_order_items', 'order_items', '2022-05-26 15:42:47', '2022-05-26 15:42:47'),
(71, 'browse_customer', 'customer', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(72, 'read_customer', 'customer', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(73, 'edit_customer', 'customer', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(74, 'add_customer', 'customer', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(75, 'delete_customer', 'customer', '2022-05-28 12:40:44', '2022-05-28 12:40:44'),
(81, 'browse_customers', 'customers', '2022-05-28 20:25:30', '2022-05-28 20:25:30'),
(82, 'read_customers', 'customers', '2022-05-28 20:25:30', '2022-05-28 20:25:30'),
(83, 'edit_customers', 'customers', '2022-05-28 20:25:30', '2022-05-28 20:25:30'),
(84, 'add_customers', 'customers', '2022-05-28 20:25:30', '2022-05-28 20:25:30'),
(85, 'delete_customers', 'customers', '2022-05-28 20:25:30', '2022-05-28 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'MyApp', '4153dc6354c5854d69ace7f18199bdfa6682c4d9913dacd509d80bf0246ce860', '[\"*\"]', NULL, '2022-05-28 14:32:23', '2022-05-28 14:32:23'),
(2, 'App\\Models\\User', 5, 'MyApp', 'b44fbc021e4478443011d367b41bb8b58da5c0c54dc358f0bc14c6cd04e5dea6', '[\"*\"]', NULL, '2022-05-28 14:34:29', '2022-05-28 14:34:29'),
(3, 'App\\Models\\User', 6, 'Laravel Password Grant Client', 'c7d44abd975957d01091ce597eb90a11b7a19b93e8e48dac1b73f90db7050d3d', '[\"*\"]', NULL, '2022-05-28 15:18:37', '2022-05-28 15:18:37'),
(4, 'App\\Models\\User', 7, 'Laravel Password Grant Client', '525e7d3e56b50dd80d980d2d489171cb5756e8f899f83ddc01e1c0852de853f1', '[\"*\"]', NULL, '2022-05-28 15:22:50', '2022-05-28 15:22:50'),
(5, 'App\\Models\\User', 8, 'Laravel Password Grant Client', '4570121c74f97522f5fe15042a94c1c97301c73e2addb66562a4cdf2e989fff3', '[\"*\"]', NULL, '2022-05-28 15:28:39', '2022-05-28 15:28:39'),
(6, 'App\\Models\\User', 9, 'Laravel Password Grant Client', 'b96508603c93daa179131ee680ae6f077de6293e8b35339ab5ec21d097abd745', '[\"*\"]', NULL, '2022-05-28 15:34:23', '2022-05-28 15:34:23'),
(7, 'App\\Models\\User', 10, 'Laravel Password Grant Client', '34d4b9f0419f65e4047f5781cae4f50b33e35cf2b766cc34d257b6c7d81254f0', '[\"*\"]', NULL, '2022-05-28 15:36:19', '2022-05-28 15:36:19'),
(8, 'App\\Models\\User', 11, 'Laravel Password Grant Client', 'b7e32ad976ca51a1508824eb0c8fd46dd6abecb24e57b900c1c914d433386ac7', '[\"*\"]', NULL, '2022-05-28 15:38:50', '2022-05-28 15:38:50'),
(9, 'App\\Models\\User', 12, 'Laravel Password Grant Client', 'baace3bb73de4cd68b7ccdb7faf8973dceb13e2c8c7b8f176a7827f015eb8dd3', '[\"*\"]', NULL, '2022-05-28 15:39:54', '2022-05-28 15:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_disc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `product_disc`, `category_id`, `qty`, `created_at`, `updated_at`) VALUES
(5, 'shoes_test', 'rrdrdrdrdrdrdydyfygguguugugugu', 4, 20, '2022-05-28 08:07:33', '2022-05-28 08:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image1` blob DEFAULT NULL,
  `image2` blob DEFAULT NULL,
  `image3` blob DEFAULT NULL,
  `image4` blob DEFAULT NULL,
  `image5` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `qty`, `color`, `size`, `price`, `sku`, `stock_status`, `created_at`, `updated_at`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES
(2, 5, 20, 'black', 32, 150, 'shoes_test/32/black', 'in-stock', '2022-05-28 08:11:39', '2022-05-28 08:11:39', 0x70726f647563742d64657461696c735c4d6179323032325c434b4e563775497159786a496249376e763966422e6a706567, 0x70726f647563742d64657461696c735c4d6179323032325c33505558344333566842555857443962756333482e6a706567, 0x70726f647563742d64657461696c735c4d6179323032325c567a6470356a546a6b45684d51754c41755a684b2e6a706567, 0x70726f647563742d64657461696c735c4d6179323032325c4b674b646d54776d6744373467316c4c705a696b2e6a706567, 0x70726f647563742d64657461696c735c4d6179323032325c6e53334b794b6c4877344d4a68396f70716432572e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-05-26 15:18:04', '2022-05-26 15:18:04'),
(2, 'user', 'Normal User', '2022-05-26 15:18:04', '2022-05-26 15:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$25ay3kqOuThbGEpJ.GQNXO/tLbe/w.8lJx38EWLqk0r2Hfeufx6je', NULL, NULL, '2022-05-28 12:16:50', '2022-05-28 12:16:50'),
(25, 1, 'admin', 'adminr@email.com', 'users/default.png', NULL, '$2y$10$HNCDkLzQju9dCmnx6c2l0eqm2O2.BA5Wn.BZ8ndrPpprK2a3Y/9LS', NULL, NULL, '2022-05-28 19:14:32', '2022-05-28 19:14:32'),
(36, 2, 'mahmoud', 'mahmoud@gmail.com', 'users/default.png', NULL, '$2y$10$R4rfikeU0.2jF.oVItzh4uMe9wR0ck7FD6l.aNCzUIiPT7UM5Dm5.', NULL, NULL, '2022-05-28 20:39:42', '2022-05-28 20:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- Indexes for table `order_states`
--
ALTER TABLE `order_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_cards`
--
ALTER TABLE `payment_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_states`
--
ALTER TABLE `order_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_cards`
--
ALTER TABLE `payment_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

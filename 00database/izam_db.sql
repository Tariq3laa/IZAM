-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 02:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `izam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'consequuntur blanditiis ipsam', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(2, 'voluptatem iusto possimus', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(3, 'dolore', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(4, 'ut', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(5, 'qui iure', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(6, 'optio', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(7, 'numquam qui', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(8, 'expedita sapiente facilis', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(9, 'alias', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(10, 'eum voluptatem', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(11, 'quibusdam', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(12, 'id', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(13, 'minus praesentium rerum', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(14, 'debitis', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(15, 'nam doloribus qui', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(16, 'tempore', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(17, 'et earum', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(18, 'minus natus est', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(19, 'iusto', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(20, 'quia', '2024-10-17 09:21:38', '2024-10-17 09:21:38');

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
(30, '2014_10_12_000000_create_users_table', 1),
(31, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(32, '2024_10_17_193136_create_categories_table', 1),
(33, '2024_10_17_193209_create_products_table', 1),
(34, '2024_10_17_193345_create_product_categories_table', 1),
(35, '2024_10_17_193408_create_orders_table', 1),
(36, '2024_10_17_193441_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(5,2) NOT NULL DEFAULT 1.00,
  `quantity` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'est natus deleniti', 'Consequatur omnis nobis velit praesentium minus ipsam doloribus omnis.', '317.00', 299, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(2, 'ut ut voluptatem', 'Quidem veniam rerum omnis soluta necessitatibus aut. Quaerat dicta adipisci qui et maxime.', '855.00', 37, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(3, 'ut reprehenderit libero', 'Numquam distinctio rerum aperiam vero explicabo.', '872.00', 51, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(4, 'qui', 'Iste repellat veniam nostrum. Dicta aperiam nemo enim consequatur inventore sint.', '593.00', 90, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(5, 'autem quod', 'Consequatur ducimus enim rerum expedita ut aut perferendis et. Ea nulla sed excepturi.', '265.00', 341, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(6, 'reprehenderit vel', 'Molestias dolorem necessitatibus fuga vel. Veritatis sed repellat et quasi consectetur tenetur alias.', '51.00', 455, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(7, 'placeat', 'Et eius autem ut perspiciatis qui ut. Maxime praesentium est culpa.', '509.00', 127, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(8, 'adipisci debitis libero', 'Deleniti dolore illo necessitatibus quo ipsam et.', '21.00', 185, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(9, 'animi accusamus', 'Praesentium in officiis dolor praesentium.', '602.00', 239, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(10, 'odio commodi quas', 'Eligendi quia error ipsam maxime voluptates ea fugiat.', '857.00', 380, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(11, 'laborum', 'Ipsa libero tenetur non dicta accusantium sint.', '484.00', 366, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(12, 'beatae nesciunt eius', 'Rerum aut vel enim veritatis hic ipsa consectetur.', '252.00', 140, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(13, 'possimus voluptatibus', 'Aut sunt est quod qui enim sunt.', '748.00', 133, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(14, 'soluta', 'Ut aut ut ut totam repellat. Quis cupiditate dolorem qui dolor et aspernatur.', '893.00', 406, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(15, 'reprehenderit', 'Atque aut est incidunt reprehenderit aperiam enim sint sed. Est repellendus cum earum soluta sapiente.', '84.00', 336, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(16, 'reiciendis minima nemo', 'Voluptas adipisci id quis.', '495.00', 170, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(17, 'possimus voluptates', 'Qui error similique nostrum in aut porro fugit.', '412.00', 332, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(18, 'aperiam doloremque vero', 'Neque deleniti quidem itaque pariatur.', '383.00', 111, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(19, 'aut voluptatem', 'Qui voluptatibus tenetur totam voluptas veniam aut.', '681.00', 259, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(20, 'eius suscipit', 'Alias rem accusamus quos aut repellat in. Hic animi qui quisquam consequuntur consectetur sed quos.', '565.00', 424, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(21, 'quae qui dolorem', 'A enim nobis aut qui veniam exercitationem.', '124.00', 147, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(22, 'mollitia nihil quod', 'Voluptatem ut harum iste dolorum delectus nesciunt eius. Atque et laborum voluptas laboriosam ea molestiae.', '201.00', 105, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(23, 'facilis', 'Deserunt in laborum sequi nobis.', '986.00', 42, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(24, 'tenetur', 'Nulla perferendis officiis et dignissimos sint. Est incidunt et vel suscipit fugiat.', '800.00', 348, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(25, 'consequatur adipisci expedita', 'Et quibusdam libero iure est dolorum odit perferendis.', '517.00', 221, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(26, 'explicabo quasi', 'Quos libero velit ab blanditiis. Sint consectetur nihil quis qui.', '623.00', 24, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(27, 'excepturi provident corrupti', 'Deleniti expedita velit quos eligendi dolores omnis.', '470.00', 41, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(28, 'omnis omnis est', 'Consectetur reprehenderit atque et similique.', '221.00', 355, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(29, 'voluptatum officia molestiae', 'Ut dolorem nesciunt ut quisquam quaerat corrupti. Sed omnis saepe deserunt quia occaecati illum nihil quis.', '483.00', 261, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(30, 'repellendus', 'Numquam tempore dolor quam itaque. Repellendus excepturi fugit aspernatur sit eum dolor eos.', '467.00', 325, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(31, 'quas', 'Est ut facilis iste deleniti vero.', '119.00', 71, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(32, 'eius', 'Aut incidunt placeat molestias ducimus quia animi cumque. Modi et molestias nihil aut suscipit blanditiis.', '577.00', 445, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(33, 'unde praesentium dicta', 'Sed alias commodi rem voluptas recusandae dolorem dolores non. Qui possimus ratione ea aspernatur.', '358.00', 391, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(34, 'quos dolores pariatur', 'Voluptas dolor consectetur odit quas et aliquam voluptatem.', '390.00', 265, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(35, 'est beatae', 'Consequatur sed nostrum quis corporis. Perspiciatis minima vitae qui facilis quibusdam qui voluptates.', '509.00', 423, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(36, 'suscipit dolor', 'Et occaecati quae magni quia deleniti.', '500.00', 118, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(37, 'autem eius', 'Repellat nulla reiciendis et id inventore sint mollitia. Delectus consequatur sunt debitis.', '299.00', 415, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(38, 'eum labore vel', 'Aspernatur ut nihil quaerat.', '636.00', 492, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(39, 'necessitatibus', 'Illum est temporibus repellendus minus unde in. Delectus dolor voluptates soluta et amet quo vel.', '535.00', 234, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(40, 'veritatis', 'Necessitatibus voluptatibus in aut sed ea.', '745.00', 457, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(41, 'non aut', 'Quidem repellendus voluptas eveniet perferendis ipsam error. Nobis aperiam numquam ut dolores ea error.', '155.00', 340, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(42, 'et unde', 'Quas voluptatem animi explicabo est. Voluptate et nostrum tenetur.', '938.00', 249, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(43, 'quasi et', 'Aliquam repellendus minima qui. Eum ut et velit aut velit ad.', '785.00', 106, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(44, 'atque voluptatem et', 'Id sit omnis eum quo.', '996.00', 190, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(45, 'a quia voluptatem', 'Fugiat ut a aut ducimus sunt sed aliquam.', '32.00', 295, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(46, 'natus', 'Earum fugit non accusantium cumque voluptate quisquam debitis. Iusto tenetur est sapiente vel veniam voluptas est.', '348.00', 249, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(47, 'veniam ut', 'Nulla alias ut cupiditate aut quaerat recusandae.', '417.00', 202, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(48, 'cupiditate quod voluptate', 'Omnis molestiae ipsum enim cum voluptatem accusamus iure.', '394.00', 310, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(49, 'non et repudiandae', 'Doloremque iure dolor totam.', '195.00', 279, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(50, 'explicabo', 'Cum et amet non ex.', '306.00', 459, '2024-10-17 09:21:38', '2024-10-17 09:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 22, 11, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(2, 48, 1, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(3, 19, 18, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(4, 22, 7, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(5, 42, 4, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(6, 17, 2, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(7, 13, 19, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(8, 11, 20, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(9, 18, 16, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(10, 4, 8, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(11, 2, 3, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(12, 36, 2, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(13, 19, 1, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(14, 35, 18, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(15, 7, 7, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(16, 36, 15, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(17, 44, 6, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(18, 18, 5, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(19, 49, 1, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(20, 10, 17, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(21, 10, 11, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(22, 38, 14, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(23, 34, 3, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(24, 31, 11, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(25, 45, 12, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(26, 40, 5, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(27, 14, 1, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(28, 18, 7, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(29, 5, 3, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(30, 36, 3, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(31, 12, 9, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(32, 26, 7, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(33, 9, 20, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(34, 25, 17, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(35, 6, 15, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(36, 47, 16, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(37, 33, 19, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(38, 20, 3, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(39, 25, 12, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(40, 29, 14, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(41, 30, 6, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(42, 45, 5, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(43, 48, 18, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(44, 35, 4, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(45, 44, 12, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(46, 26, 11, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(47, 24, 20, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(48, 33, 5, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(49, 6, 2, '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(50, 17, 15, '2024-10-17 09:21:38', '2024-10-17 09:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abelardo Parisian', 'botsford.connor@example.com', '2024-10-17 09:21:37', '$2y$10$Sz7esgHWb.fAIGox2.vG3.tbOPWOZT456fa0lzi4CS.w8xFjFlp.O', 'IEfL2PKDLi', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(2, 'Randy Wisoky', 'bogan.geovanny@example.org', '2024-10-17 09:21:37', '$2y$10$t38MpSckRKP2HTdeJtlZ1enWdvZ5dLK/YetURYgZRbEYDoH/Wcnhi', 'IBpi6DSQXd', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(3, 'Prof. Max Hirthe', 'lambert.shields@example.net', '2024-10-17 09:21:37', '$2y$10$26Jt/T.DUOaTgWaaVAiaOOQoz01rcf71voukZGIT1dnMw6YKiTXwO', 'GUfUxOXJsM', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(4, 'Abdullah Kerluke', 'garnet.smith@example.com', '2024-10-17 09:21:37', '$2y$10$apcccO0mwIC1741w7zrATujzM8Z3G4HGbrgeKMcUoSjxTqe09EdkG', 'vFROr5BaXZ', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(5, 'Mr. Alden Renner DVM', 'kobe55@example.com', '2024-10-17 09:21:37', '$2y$10$IOrqxCHxBlSXj7yJnXvVgOx0Y2bYqKjiTm/hxDnqC6DnaZu.CxvzC', 'hRzqI8tDjG', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(6, 'Thora Kuvalis', 'fkunde@example.net', '2024-10-17 09:21:37', '$2y$10$L/nHbwGU67X68Bm1j8/SE.1jHosn8MFV.Rz4oH08WlHWfmkqa9Oo6', '5eBvXUcfbE', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(7, 'Maudie Crona PhD', 'littel.wilber@example.org', '2024-10-17 09:21:37', '$2y$10$erZQ9yClVcchWitboQjMGuY0opTsqZjcPRPvQAmuNVf2hV290uUVe', 'hrguJ5ko4b', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(8, 'Dr. Kian Paucek Jr.', 'adonis38@example.org', '2024-10-17 09:21:37', '$2y$10$lrsUWU0qchFqpke8j0X/Le0fPNdWxOk.fIvjucTBQ2a3NXJP/gQEO', 'qLX3cimO6a', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(9, 'Mr. Marty Daugherty', 'ohara.peyton@example.net', '2024-10-17 09:21:37', '$2y$10$A.6wDDzy5u.1kC91GChyDuNsJnEMaEvBLYPV4XTmyd9d2egWp56bW', '1cYmUdPx35', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(10, 'Rogers Turner DDS', 'flavie52@example.org', '2024-10-17 09:21:37', '$2y$10$HdMqlEXwG05QyRG9dz.9xe2Idsq6LtOH7kwWgqw5v/VkoDO2gnoyC', 'KvPS4Tb6a0', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(11, 'Lyric Metz', 'miguel94@example.com', '2024-10-17 09:21:37', '$2y$10$PSBrw6LIk2hmDUvyU.D2OONqMWcVZ901HXm9u4jt//eKhPyosiTI6', 'PzXu0dWWVp', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(12, 'Prof. Erik Auer I', 'zroberts@example.org', '2024-10-17 09:21:37', '$2y$10$3v8xObEOA/XrtFqWuhfG1u0lQRWgLzGTKejpA6K8hIDsFmhGsTGXy', 'wkBKxcMWZk', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(13, 'Vida Gaylord', 'tara61@example.com', '2024-10-17 09:21:37', '$2y$10$s7874lEvJDTd22g5IaxzDe4AJbUDA7IkUr2gP.uGxMFTpaJOH9XhO', 'FLcnLAaihI', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(14, 'Ms. Glenna Metz', 'tfranecki@example.net', '2024-10-17 09:21:37', '$2y$10$ugD5G1Vr2Pru43jvYB718OY2ITy9PWTpDKKjZRFANeLj3jqQ0FgSO', '80c7bqSLAQ', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(15, 'Makayla Gutmann', 'oconnell.jordi@example.net', '2024-10-17 09:21:37', '$2y$10$F/9Kfvy7NCDPvXy5LaQdhe7CRvPMQ4zcKZDtmQ4t9Hx4qaw/VFjYe', '08GREIUn06', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(16, 'Elizabeth Herman DDS', 'wwolff@example.net', '2024-10-17 09:21:37', '$2y$10$IwkkafzmCh0XFkxQARIM3OK1Ewd.Y2htL4296Sb8fRCNLRdUa1FE6', 'jQ2OOx8CdP', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(17, 'Grady Stanton', 'equigley@example.net', '2024-10-17 09:21:37', '$2y$10$vnyOGY4gN8/qz9FjMvuf../SRNbIIY5.uuUghTzcposrMjrQ1ChhG', 'iPu3B1XGRs', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(18, 'Miss Albertha Walter Sr.', 'vpaucek@example.org', '2024-10-17 09:21:37', '$2y$10$ofjlGu0wSJJe8uZilglCXO02t4mv.UhESCLVHiTZ07VWxfGpFXgka', 'awTNAFLExL', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(19, 'Kylie Muller', 'fnienow@example.com', '2024-10-17 09:21:38', '$2y$10$Xz7MFUHaP7hCkAek4QHY9.AY9pPkDeGBpi6j/rfN1R29fN3Q1b5Tq', 'llBYVMF269', '2024-10-17 09:21:38', '2024-10-17 09:21:38'),
(20, 'Eriberto Boyle III', 'osbaldo.mraz@example.net', '2024-10-17 09:21:38', '$2y$10$v8ST/hvHe60QOclYackLPO0TRYCuFAFuHUqHJuzRMiovR.W3mN2N.', 'gzj3DXH3mx', '2024-10-17 09:21:38', '2024-10-17 09:21:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_buyer_id_foreign` (`buyer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

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
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

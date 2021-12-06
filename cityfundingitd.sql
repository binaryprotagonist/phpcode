-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 06, 2021 at 06:08 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cityfundingitd`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `property` bigint NOT NULL,
  `monthly` double(10,2) NOT NULL,
  `yearly` double(10,2) NOT NULL,
  `team` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `title`, `property`, `monthly`, `yearly`, `team`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Free', 10, 0.00, 0.00, 0, 1, '2021-11-25 11:37:04', NULL, NULL),
(2, 'Starter', 300, 5.00, 50.00, 0, 1, '2021-11-25 11:37:04', NULL, NULL),
(3, 'Lite', 700, 10.00, 100.00, 0, 1, '0000-00-00 00:00:00', NULL, NULL),
(4, 'Standard', 3000, 20.00, 200.00, 18, 1, '2021-11-25 11:37:04', NULL, NULL),
(5, 'Advanced', 10000, 50.00, 500.00, 15, 1, '2021-11-25 11:37:04', NULL, NULL),
(6, 'Professional ', 50000, 80.00, 800.00, 12, 1, '2021-11-25 11:37:04', NULL, NULL),
(7, 'Premium', 100000, 350.00, 3500.00, 10, 1, '0000-00-00 00:00:00', NULL, NULL),
(8, 'Enterprise', 200000, 600.00, 6000.00, 9, 1, '2021-11-25 11:37:04', NULL, NULL),
(9, 'Corporate ', 500000, 1200.00, 12000.00, 8, 1, '2021-11-25 11:37:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subscription_id` varchar(100) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `plan_id` bigint NOT NULL,
  `plan_title` varchar(100) NOT NULL,
  `plan_property` bigint NOT NULL,
  `subscription_date` datetime NOT NULL,
  `subscription_status` int NOT NULL DEFAULT '0',
  `subscription_cancel_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `subscription_id`, `user_id`, `plan_id`, `plan_title`, `plan_property`, `subscription_date`, `subscription_status`, `subscription_cancel_date`, `created_at`, `updated_at`, `delete_at`) VALUES
(15, 'SB0006WWKG2TRR', 4, 2, 'Starter', 300, '2021-11-26 00:00:00', 1, NULL, '2021-11-26 12:32:47', '2021-11-26 12:32:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mandate_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `register_type` enum('Manually','Google') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `name`, `profile_image`, `email`, `phone`, `password`, `postal_code`, `city`, `address`, `mandate_id`, `email_verified_at`, `register_type`, `social_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Brain', 'Inventory', 'Brain Inventory', NULL, 'admin@braininventory.com', NULL, '$2y$10$gY6EH73o9wNp.P0CfdeVYeXlD3o7I4ATBJh0Mv8Nf3BCczaKYPU0C', '452001', 'Indore', 'G0248 Kalandi Gold Indore', NULL, NULL, 'Manually', NULL, NULL, '2021-11-23 01:00:33', '2021-11-25 05:11:47'),
(2, 'Krishna', 'Yadav', 'Krishna Yadav', NULL, 'krishna@mailinator.com', NULL, '$2y$10$QKBhcNqE21aJLA8q3Hjn.eEj1BKOKoD.TcJQpk0sSAhOcj2juKz52', NULL, NULL, NULL, NULL, NULL, 'Manually', NULL, NULL, '2021-11-25 05:39:21', '2021-11-25 05:39:21'),
(3, 'Rahul', 'Yadav', 'Rahul Yadav', NULL, 'rahul@mailinator.com', NULL, '$2y$10$OF3ihUQT22o/tLPMEn102OMNZwQdiRUQNw/nJIMnJmJ1MYptPVhEO', 'EC1A 2BN', 'Indore', 'G-258 Kalandi Gold Indore', NULL, NULL, 'Manually', NULL, NULL, '2021-11-25 06:05:57', '2021-11-25 06:06:31'),
(4, 'Shivam', 'Yadav', 'Shivam Yadav', NULL, 's.yadav@mailinator.com', NULL, '$2y$10$eqgK4slMy7Jd3UifFxD67ujBcXLEQYJ8/m.VoMzg.yGHR9d5XtXPu', 'EC1A 2BN', 'India', 'G-258 Kalandi Gold Indore', 'MD000J4Q8DMH11', NULL, 'Manually', NULL, NULL, '2021-11-25 07:35:15', '2021-11-26 03:14:08'),
(9, 'Shivam', 'yadav', 'Shivam yadav', NULL, 'shivam@gmail.com', '5035435435', '$2y$10$2D4NwKKyCtF0X4gglpzogezg7om7C7448uTfLTq49k8xPCyAN21Di', NULL, NULL, NULL, NULL, NULL, 'Manually', NULL, NULL, '2021-12-01 07:41:34', '2021-12-01 08:42:56'),
(10, 'shivam', 'yadav', 'shivam yadav', '163845066510.png', 's.yadav@braininentory.com', '8959070299', '$2y$10$zzQ7WsIc139fbDi59HpdbeBf4Vx1mP8XaIzmEBugw2mkLBlTkdwDi', NULL, NULL, NULL, NULL, NULL, 'Manually', NULL, 'IRIp0VKe7TsaB8loMDj9fYYX7iaJkHOXbIXHQ7k1cPNH0ewJ3KH3AcE2CKFS', '2021-12-01 23:44:12', '2021-12-02 07:41:05'),
(11, 'City', 'Funding', 'City Funding', '163844194711.png', 'dev.cityfunding@gmail.com', '85934534', NULL, NULL, NULL, NULL, NULL, NULL, 'Google', '112432402236617877225', NULL, '2021-12-02 04:39:18', '2021-12-02 05:15:47'),
(12, 'Shivam', 'Yadav', 'Shivam Yadav', '163844291112.png', 's.yadav@braininventory.com', NULL, '$2y$10$FktvuU0IlBC0UnwHGoMe7eLlHarpEsQLpvejW/6HTA/GXdIQizwMy', NULL, NULL, NULL, NULL, NULL, 'Google', '107081742252533389850', 'AfU5I6risw8CkzKIr9yuhLzEgvtOIPlVa3xfFYnJXUeeRRIQRb4L7s386FIy', '2021-12-02 05:31:51', '2021-12-02 05:52:50'),
(13, NULL, NULL, 'karan yadva', NULL, 'k.yadav@braininventory.com', NULL, '$2y$10$zRoG8N8i908ml0kh2TaMs.P/hl.JbiAcd9y8/rzfxwUYvkL0/4CY2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 06:55:09', '2021-12-02 06:55:09'),
(14, 'jayant', 'patha', 'jayant patha', NULL, 'j.pathan@braininventory.com', NULL, '$2y$10$RAwmUbjyaFIbkbNYRcNXmenPg0mhwXUXNF5RJh0a7MHiRJilSuQom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 06:57:18', '2021-12-02 06:57:18');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

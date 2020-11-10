-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2020 at 12:03 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scart`
--

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
(1, '2020_00_00_step1_create_tables_admin', 1),
(2, '2020_00_00_step2_create_tables_shop', 1),
(3, '2020_00_00_step3_insert_database_admin', 1),
(4, '2020_00_00_step4_insert_database_shop', 1),
(5, '2020_00_00_step5_insert_database_product', 1),
(6, '2020_06_10_142117_create_providers_table', 1),
(7, '2020_06_18_153542_create_provider_role', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `sc_admin_config`
--

CREATE TABLE `sc_admin_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `detail` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_config`
--

INSERT INTO `sc_admin_config` (`id`, `group`, `code`, `key`, `value`, `store_id`, `sort`, `detail`) VALUES
(1, '', 'config', 'shop_allow_guest', '1', '1', 11, 'lang::admin.shop_allow_guest'),
(2, '', 'config', 'product_preorder', '1', '1', 18, 'lang::admin.product_preorder'),
(3, '', 'config', 'product_display_out_of_stock', '1', '1', 19, 'lang::admin.product_display_out_of_stock'),
(4, '', 'config', 'product_buy_out_of_stock', '1', '1', 20, 'lang::admin.product_buy_out_of_stock'),
(5, '', 'config', 'show_date_available', '1', '1', 21, 'lang::admin.show_date_available'),
(6, '', 'display', 'product_hot', '6', '1', 0, 'lang::admin.hot_product'),
(7, '', 'display', 'product_new', '6', '1', 0, 'lang::admin.new_product'),
(8, '', 'display', 'product_list', '9', '1', 0, 'lang::admin.list_product'),
(9, '', 'display', 'product_relation', '4', '1', 0, 'lang::admin.relation_product'),
(10, '', 'display', 'product_viewed', '4', '1', 0, 'lang::admin.viewed_product'),
(11, '', 'display', 'item_list', '12', '1', 0, 'lang::admin.item_list'),
(12, '', 'display', 'news_list', '16', '1', 0, 'lang::admin.news_list'),
(13, '', 'email_action', 'email_action_mode', '1', '1', 0, 'lang::email.email_action.email_action_mode'),
(14, '', 'email_action', 'order_success_to_admin', '0', '1', 1, 'lang::email.email_action.order_success_to_admin'),
(15, '', 'email_action', 'order_success_to_customer', '0', '1', 2, 'lang::email.email_action.order_success_to_cutomer'),
(16, '', 'email_action', 'welcome_customer', '0', '1', 4, 'lang::email.email_action.welcome_customer'),
(17, '', 'email_action', 'contact_to_admin', '1', '1', 6, 'lang::email.email_action.contact_to_admin'),
(18, '', 'email_action', 'email_action_smtp_mode', '0', '1', 6, 'lang::email.email_action.email_action_smtp_mode'),
(19, 'Plugins', 'Payment', 'Cash', '1', '1', 0, 'Plugins/Payment/Cash::lang.title'),
(20, 'Plugins', 'Shipping', 'ShippingStandard', '1', '1', 0, 'lang::Shipping Standard'),
(21, '', 'smtp', 'smtp_host', '', '1', 8, 'lang::email.smtp_host'),
(22, '', 'smtp', 'smtp_user', '', '1', 7, 'lang::email.smtp_user'),
(23, '', 'smtp', 'smtp_password', '', '1', 6, 'lang::email.smtp_password'),
(24, '', 'smtp', 'smtp_security', '', '1', 5, 'lang::email.smtp_security'),
(25, '', 'smtp', 'smtp_port', '', '1', 4, 'lang::email.smtp_port'),
(26, '', 'cache', 'cache_status', '0', '1', 0, 'lang::cache.config_manager.cache_status'),
(27, '', 'cache', 'cache_time', '600', '1', 1, 'lang::cache.config_manager.cache_time'),
(28, '', 'cache', 'cache_category', '0', '1', 3, 'lang::cache.config_manager.cache_category'),
(29, '', 'cache', 'cache_product', '0', '1', 4, 'lang::cache.config_manager.cache_product'),
(30, '', 'cache', 'cache_news', '0', '1', 5, 'lang::cache.config_manager.cache_news'),
(31, '', 'cache', 'cache_category_cms', '0', '1', 6, 'lang::cache.config_manager.cache_category_cms'),
(32, '', 'cache', 'cache_content_cms', '0', '1', 7, 'lang::cache.config_manager.cache_content_cms'),
(33, '', 'cache', 'cache_page', '0', '1', 8, 'lang::cache.config_manager.cache_page'),
(34, '', 'upload', 'upload_image_size', '2048', '1', 0, ''),
(35, '', 'upload', 'upload_image_thumb_width', '250', '1', 0, ''),
(36, '', 'upload', 'upload_image_thumb_status', '1', '1', 0, ''),
(37, '', 'upload', 'upload_watermark_status', '1', '1', 0, ''),
(38, '', 'upload', 'upload_watermark_path', 'images/watermark.png', '1', 0, ''),
(39, '', 'env', 'SITE_STATUS', 'on', '1', 0, 'lang::env.SITE_STATUS'),
(40, '', 'env', 'SITE_TIMEZONE', 'Asia/Ho_Chi_Minh', '1', 0, 'lang::env.SITE_TIMEZONE'),
(41, '', 'env', 'SITE_LANGUAGE', 'vi', '1', 0, 'lang::env.SITE_LANGUAGE'),
(42, '', 'env', 'SITE_CURRENCY', 'VND', '1', 0, 'lang::env.SITE_CURRENCY'),
(43, '', 'env', 'APP_DEBUG', 'on', '1', 0, 'lang::env.APP_DEBUG'),
(44, '', 'env', 'ADMIN_LOG', 'on', '1', 0, 'lang::env.ADMIN_LOG'),
(45, '', 'env', 'ADMIN_LOG_EXP', '', '1', 0, 'lang::env.ADMIN_LOG_EXP'),
(46, '', 'env', 'ADMIN_NAME', 'S-Cart System', '1', 0, 'lang::env.ADMIN_NAME'),
(47, '', 'env', 'ADMIN_TITLE', 'S-Cart System', '1', 0, 'lang::env.ADMIN_TITLE'),
(48, '', 'env', 'ADMIN_LOGO', 'S-Cart Admin', '1', 0, 'lang::env.ADMIN_LOGO'),
(49, '', 'env', 'ADMIN_LOGO_MINI', '<i class=\"fa fa-map-o\" aria-hidden=\"true\"></i>', '1', 0, 'lang::env.ADMIN_LOGO_MINI'),
(50, '', 'env', 'LOG_SLACK_WEBHOOK_URL', '', '1', 0, 'lang::env.LOG_SLACK_WEBHOOK_URL'),
(51, '', 'url', 'SUFFIX_URL', '.html', '1', 0, 'lang::url.SUFFIX_URL'),
(52, '', 'url', 'PREFIX_BRAND', 'brand', '1', 0, 'lang::url.PREFIX_BRAND'),
(53, '', 'url', 'PREFIX_SUPPLIER', 'supplier', '1', 0, 'lang::url.PREFIX_SUPPLIER'),
(54, '', 'url', 'PREFIX_CATEGORY', 'category', '1', 0, 'lang::url.PREFIX_CATEGORY'),
(55, '', 'url', 'PREFIX_PRODUCT', 'product', '1', 0, 'lang::url.PREFIX_PRODUCT'),
(56, '', 'url', 'PREFIX_SEARCH', 'search', '1', 0, 'lang::url.PREFIX_SEARCH'),
(57, '', 'url', 'PREFIX_CONTACT', 'contact', '1', 0, 'lang::url.PREFIX_CONTACT'),
(58, '', 'url', 'PREFIX_NEWS', 'news', '1', 0, 'lang::url.PREFIX_NEWS'),
(59, '', 'url', 'PREFIX_MEMBER', 'member', '1', 0, 'lang::url.PREFIX_MEMBER'),
(60, '', 'url', 'PREFIX_MEMBER_ORDER_LIST', 'order-list', '1', 0, 'lang::url.PREFIX_MEMBER_ORDER_LIST'),
(61, '', 'url', 'PREFIX_MEMBER_CHANGE_PWD', 'change-password', '1', 0, 'lang::url.PREFIX_MEMBER_CHANGE_PWD'),
(62, '', 'url', 'PREFIX_MEMBER_CHANGE_INFO', 'change-info', '1', 0, 'lang::url.PREFIX_MEMBER_CHANGE_INFO'),
(63, '', 'url', 'PREFIX_CMS_CATEGORY', 'cms-category', '1', 0, 'lang::url.PREFIX_CMS_CATEGORY'),
(64, '', 'url', 'PREFIX_CMS_ENTRY', 'entry', '1', 0, 'lang::url.PREFIX_CMS_ENTRY'),
(65, '', 'url', 'PREFIX_CART_WISHLIST', 'wishlst', '1', 0, 'lang::url.PREFIX_CART_WISHLIST'),
(66, '', 'url', 'PREFIX_CART_COMPARE', 'compare', '1', 0, 'lang::url.PREFIX_CART_COMPARE'),
(67, '', 'url', 'PREFIX_CART_DEFAULT', 'cart', '1', 0, 'lang::url.PREFIX_CART_DEFAULT'),
(68, '', 'url', 'PREFIX_CART_CHECKOUT', 'checkout', '1', 0, 'lang::url.PREFIX_CART_CHECKOUT'),
(69, '', 'url', 'PREFIX_ORDER_SUCCESS', 'order-success', '1', 0, 'lang::url.PREFIX_ORDER_SUCCESS'),
(70, '', 'product', 'product_brand', '1', '1', 0, 'lang::product.config_manager.brand'),
(71, '', 'product', 'product_supplier', '1', '1', 0, 'lang::product.config_manager.supplier'),
(72, '', 'product', 'product_price', '1', '1', 0, 'lang::product.config_manager.price'),
(73, '', 'product', 'product_cost', '1', '1', 0, 'lang::product.config_manager.cost'),
(74, '', 'product', 'product_promotion', '1', '1', 0, 'lang::product.config_manager.promotion'),
(75, '', 'product', 'product_stock', '1', '1', 0, 'lang::product.config_manager.stock'),
(76, '', 'product', 'product_kind', '1', '1', 0, 'lang::product.config_manager.kind'),
(77, '', 'product', 'product_virtual', '1', '1', 0, 'lang::product.config_manager.virtual'),
(78, '', 'product', 'product_attribute', '1', '1', 0, 'lang::product.config_manager.attribute'),
(79, '', 'product', 'product_available', '1', '1', 0, 'lang::product.config_manager.available'),
(80, '', 'product', 'product_weight', '1', '1', 0, 'lang::product.config_manager.weight'),
(81, '', 'product', 'product_length', '1', '1', 0, 'lang::product.config_manager.length'),
(82, '', 'env', 'product_tax', '1', '1', 0, 'lang::product.config_manager.tax'),
(83, '', 'customer', 'customer_lastname', '1', '1', 0, 'lang::customer.config_manager.lastname'),
(84, '', 'customer', 'customer_address1', '1', '1', 0, 'lang::customer.config_manager.address1'),
(85, '', 'customer', 'customer_address2', '1', '1', 0, 'lang::customer.config_manager.address2'),
(86, '', 'customer', 'customer_company', '0', '1', 0, 'lang::customer.config_manager.company'),
(87, '', 'customer', 'customer_postcode', '0', '1', 0, 'lang::customer.config_manager.postcode'),
(88, '', 'customer', 'customer_country', '1', '1', 0, 'lang::customer.config_manager.country'),
(89, '', 'customer', 'customer_group', '0', '1', 0, 'lang::customer.config_manager.group'),
(90, '', 'customer', 'customer_birthday', '0', '1', 0, 'lang::customer.config_manager.birthday'),
(91, '', 'customer', 'customer_sex', '0', '1', 0, 'lang::customer.config_manager.sex'),
(92, '', 'customer', 'customer_phone', '1', '1', 1, 'lang::customer.config_manager.phone'),
(93, '', 'api', 'api_connection_required', '0', '1', 1, 'lang::api_connection.api_connection_required'),
(94, 'Plugins', 'Total', 'Discount', '1', '1', 0, 'Plugins/Total/Discount::lang.title');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_log`
--

CREATE TABLE `sc_admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_log`
--

INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:10:18', '2020-06-11 03:10:18'),
(2, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:10:27', '2020-06-11 03:10:27'),
(3, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:10:36', '2020-06-11 03:10:36'),
(4, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:10:48', '2020-06-11 03:10:48'),
(5, 1, 'sc_admin/template/changeTemplate', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"thaihungecommerce\"}', '2020-06-11 03:10:50', '2020-06-11 03:10:50'),
(6, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:10:50', '2020-06-11 03:10:50'),
(7, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:11', '2020-06-11 03:11:11'),
(8, 1, 'sc_admin/block_content/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:12', '2020-06-11 03:11:12'),
(9, 1, 'sc_admin/block_content/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Product last view\",\"position\":\"left\",\"type\":\"view\",\"text\":\"product_lastview\",\"sort\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:11:16', '2020-06-11 03:11:16'),
(10, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:16', '2020-06-11 03:11:16'),
(11, 1, 'sc_admin/block_content/edit/6', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:17', '2020-06-11 03:11:17'),
(12, 1, 'sc_admin/block_content/edit/6', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Categories\",\"position\":\"left\",\"page\":[\"product_list\"],\"type\":\"view\",\"text\":\"categories\",\"sort\":\"4\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:11:25', '2020-06-11 03:11:25'),
(13, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:25', '2020-06-11 03:11:25'),
(14, 1, 'sc_admin/block_content/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:30', '2020-06-11 03:11:30'),
(15, 1, 'sc_admin/block_content/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Banner home\",\"position\":\"banner_top\",\"page\":[\"*\"],\"type\":\"view\",\"text\":\"banner_image\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:11:33', '2020-06-11 03:11:33'),
(16, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:33', '2020-06-11 03:11:33'),
(17, 1, 'sc_admin/block_content/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:36', '2020-06-11 03:11:36'),
(18, 1, 'sc_admin/block_content/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Brands\",\"position\":\"left\",\"type\":\"view\",\"text\":\"brands_left\",\"sort\":\"3\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:11:40', '2020-06-11 03:11:40'),
(19, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:40', '2020-06-11 03:11:40'),
(20, 1, 'sc_admin/block_content/edit/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:44', '2020-06-11 03:11:44'),
(21, 1, 'sc_admin/block_content/edit/3', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Product special\",\"position\":\"left\",\"type\":\"view\",\"text\":\"product_special\",\"sort\":\"1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:11:48', '2020-06-11 03:11:48'),
(22, 1, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:11:48', '2020-06-11 03:11:48'),
(23, 1, 'sc_admin/page', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:14', '2020-06-11 03:12:14'),
(24, 1, 'sc_admin/banner', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:16', '2020-06-11 03:12:16'),
(25, 1, 'sc_admin/banner/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:17', '2020-06-11 03:12:17'),
(26, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"banner\"}', '2020-06-11 03:12:19', '2020-06-11 03:12:19'),
(27, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1591845140084\"}', '2020-06-11 03:12:20', '2020-06-11 03:12:20'),
(28, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1591845140085\"}', '2020-06-11 03:12:20', '2020-06-11 03:12:20'),
(29, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1591845140086\"}', '2020-06-11 03:12:20', '2020-06-11 03:12:20'),
(30, 1, 'sc_admin/banner/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"image\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/banner\\/banner-01.png\",\"url\":null,\"target\":\"_self\",\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:12:24', '2020-06-11 03:12:24'),
(31, 1, 'sc_admin/banner', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:24', '2020-06-11 03:12:24'),
(32, 1, 'sc_admin/banner/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:26', '2020-06-11 03:12:26'),
(33, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"banner\"}', '2020-06-11 03:12:27', '2020-06-11 03:12:27'),
(34, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1591845147758\"}', '2020-06-11 03:12:27', '2020-06-11 03:12:27'),
(35, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"_\":\"1591845147757\"}', '2020-06-11 03:12:27', '2020-06-11 03:12:27'),
(36, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"banner\",\"sort_type\":\"alphabetic\",\"_\":\"1591845147759\"}', '2020-06-11 03:12:27', '2020-06-11 03:12:27'),
(37, 1, 'sc_admin/banner/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"image\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/banner\\/banner-02.jpg\",\"url\":null,\"target\":\"_self\",\"html\":null,\"type\":\"0\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:12:29', '2020-06-11 03:12:29'),
(38, 1, 'sc_admin/banner', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:12:30', '2020-06-11 03:12:30'),
(39, 1, 'sc_admin/category', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:13:00', '2020-06-11 03:13:00'),
(40, 1, 'sc_admin/category/edit/13', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:13:04', '2020-06-11 03:13:04'),
(41, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:13:05', '2020-06-11 03:13:05'),
(42, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:13:07', '2020-06-11 03:13:07'),
(43, 1, 'sc_admin/product/edit/17', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"descriptions\":{\"en\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"vi\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"9\"],\"image\":\"\\/data\\/product\\/img-26.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-12.jpg\",\"\\/data\\/product\\/img-11.jpg\",\"\\/data\\/product\\/img-32.jpg\"],\"sku\":\"ALOKK1-AY\",\"alias\":\"demo-alias-name-product-17\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"relation_id\":[\"4\",\"5\",\"13\",\"16\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"stock\":\"100\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"5\",\"sort\":\"0\",\"status\":\"on\",\"attribute\":{\"1\":{\"name\":[\"Blue\",\"White\"],\"add_price\":[\"50\",\"0\"]},\"2\":{\"name\":[\"S\",\"XL\"],\"add_price\":[\"20\",\"30\"]}},\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:13:20', '2020-06-11 03:13:20'),
(44, 1, 'sc_admin/product/edit/17', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"descriptions\":{\"en\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"vi\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"9\"],\"image\":\"\\/data\\/product\\/img-26.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-12.jpg\",\"\\/data\\/product\\/img-11.jpg\",\"\\/data\\/product\\/img-32.jpg\"],\"sku\":\"ALOKK1-AY\",\"alias\":\"demo-alias-name-product-17\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"relation_id\":[\"4\",\"5\",\"13\",\"16\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"stock\":\"100\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"5\",\"sort\":\"0\",\"status\":\"on\",\"attribute\":{\"1\":{\"name\":[\"Blue\",\"White\"],\"add_price\":[\"50\",\"0\"]},\"2\":{\"name\":[\"S\",\"XL\"],\"add_price\":[\"20\",\"30\"]}},\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:13:58', '2020-06-11 03:13:58'),
(45, 1, 'sc_admin/product/edit/17', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"descriptions\":{\"en\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"vi\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"9\"],\"image\":\"\\/data\\/product\\/img-26.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-12.jpg\",\"\\/data\\/product\\/img-11.jpg\",\"\\/data\\/product\\/img-32.jpg\"],\"sku\":\"ALOKK1-AY\",\"alias\":\"demo-alias-name-product-17\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"relation_id\":[\"4\",\"5\",\"13\",\"16\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"stock\":\"100\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"5\",\"sort\":\"0\",\"status\":\"on\",\"attribute\":{\"1\":{\"name\":[\"Blue\",\"White\"],\"add_price\":[\"50\",\"0\"]},\"2\":{\"name\":[\"S\",\"XL\"],\"add_price\":[\"20\",\"30\"]}},\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:04', '2020-06-11 03:14:04'),
(46, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:10', '2020-06-11 03:14:10'),
(47, 1, 'sc_admin/url_config', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:14', '2020-06-11 03:14:14'),
(48, 1, 'sc_admin/store_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:16', '2020-06-11 03:14:16'),
(49, 1, 'sc_admin/setting', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:18', '2020-06-11 03:14:18'),
(50, 1, 'sc_admin/setting/update_info', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"APP_DEBUG\",\"value\":\"on\",\"pk\":null,\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:21', '2020-06-11 03:14:21'),
(51, 1, 'sc_admin/setting/update_info', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"SITE_LANGUAGE\",\"value\":\"vi\",\"pk\":null,\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:26', '2020-06-11 03:14:26'),
(52, 1, 'sc_admin/setting/update_info', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"SITE_CURRENCY\",\"value\":\"VND\",\"pk\":null,\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:28', '2020-06-11 03:14:28'),
(53, 1, 'sc_admin/language', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:45', '2020-06-11 03:14:45'),
(54, 1, 'sc_admin/language/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:47', '2020-06-11 03:14:47'),
(55, 1, 'sc_admin/language/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"English\",\"code\":\"en\",\"icon\":\"\\/data\\/language\\/flag_uk.png\",\"sort\":\"1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:49', '2020-06-11 03:14:49'),
(56, 1, 'sc_admin/language', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:49', '2020-06-11 03:14:49'),
(57, 1, 'sc_admin/currency', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:52', '2020-06-11 03:14:52'),
(58, 1, 'sc_admin/currency/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:53', '2020-06-11 03:14:53'),
(59, 1, 'sc_admin/currency/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"USD Dola\",\"code\":\"USD\",\"symbol\":\"$\",\"exchange_rate\":\"1\",\"precision\":\"0\",\"symbol_first\":\"1\",\"thousands\":\",\",\"sort\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:14:56', '2020-06-11 03:14:56'),
(60, 1, 'sc_admin/currency', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:56', '2020-06-11 03:14:56'),
(61, 1, 'sc_admin/currency/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:14:58', '2020-06-11 03:14:58'),
(62, 1, 'sc_admin/currency/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"VietNam Dong\",\"code\":\"VND\",\"symbol\":\"\\u20ab\",\"exchange_rate\":\"1\",\"precision\":\"0\",\"symbol_first\":\"0\",\"thousands\":\",\",\"sort\":\"1\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:15:00', '2020-06-11 03:15:00'),
(63, 1, 'sc_admin/currency', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:15:00', '2020-06-11 03:15:00'),
(64, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:15:17', '2020-06-11 03:15:17'),
(65, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:15:19', '2020-06-11 03:15:19'),
(66, 1, 'sc_admin/product/edit/17', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"9\"],\"image\":\"\\/data\\/product\\/img-26.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-12.jpg\",\"\\/data\\/product\\/img-11.jpg\",\"\\/data\\/product\\/img-32.jpg\"],\"sku\":\"ALOKK1-AY\",\"alias\":\"demo-alias-name-product-17\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"relation_id\":[\"4\",\"6\",\"12\",\"13\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"stock\":\"100\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"5\",\"sort\":\"0\",\"status\":\"on\",\"attribute\":{\"1\":{\"name\":[\"Blue\",\"White\"],\"add_price\":[\"50\",\"0\"]},\"2\":{\"name\":[\"S\",\"XL\"],\"add_price\":[\"20\",\"30\"]}},\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:15:30', '2020-06-11 03:15:30'),
(67, 1, 'sc_admin/product/edit/17', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"descriptions\":{\"vi\":{\"name\":\"Easy Polo Black Edition 17\",\"keyword\":null,\"description\":null,\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\\\"\\\" src=\\\"\\/data\\/product\\/img-21.jpg\\\" style=\\\"width: 262px; height: 262px; float: right; margin: 10px;\\\" \\/><\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}},\"category\":[\"9\"],\"image\":\"\\/data\\/product\\/img-26.jpg\",\"sub_image\":[\"\\/data\\/product\\/img-12.jpg\",\"\\/data\\/product\\/img-11.jpg\",\"\\/data\\/product\\/img-32.jpg\"],\"sku\":\"ALOKK1-AY\",\"alias\":\"demo-alias-name-product-17\",\"brand_id\":\"3\",\"supplier_id\":[\"1\"],\"relation_id\":[\"4\",\"6\",\"12\",\"13\"],\"cost\":\"10000\",\"price\":\"15000\",\"tax_id\":\"auto\",\"stock\":\"100\",\"weight_class\":null,\"weight\":\"0\",\"length_class\":null,\"length\":\"0\",\"height\":\"0\",\"width\":\"0\",\"virtual\":\"0\",\"date_available\":null,\"minimum\":\"5\",\"sort\":\"0\",\"status\":\"on\",\"attribute\":{\"1\":{\"name\":[\"Blue\",\"White\"],\"add_price\":[\"50\",\"0\"]},\"2\":{\"name\":[\"S\",\"XL\"],\"add_price\":[\"20\",\"30\"]}},\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:15:42', '2020-06-11 03:15:42'),
(68, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:15:42', '2020-06-11 03:15:42'),
(69, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:16:43', '2020-06-11 03:16:43'),
(70, 1, 'sc_admin/menu/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"6\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0111\\u1ea1i l\\u00fd\",\"icon\":\"fa-codepen\",\"uri\":\"admin::provider\",\"sort\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:17:25', '2020-06-11 03:17:25'),
(71, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:17:25', '2020-06-11 03:17:25'),
(72, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:17:26', '2020-06-11 03:17:26'),
(73, 1, 'sc_admin/provider/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:17:28', '2020-06-11 03:17:28'),
(74, 1, 'sc_admin/provider/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":null,\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:17:58', '2020-06-11 03:17:58'),
(75, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:17:58', '2020-06-11 03:17:58'),
(76, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:18:04', '2020-06-11 03:18:04'),
(77, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:18:06', '2020-06-11 03:18:06'),
(78, 1, 'sc_admin/news', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:18:13', '2020-06-11 03:18:13'),
(79, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:20:26', '2020-06-11 03:20:26'),
(80, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:20:28', '2020-06-11 03:20:28'),
(81, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-1\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:20:57', '2020-06-11 03:20:57'),
(82, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:20:58', '2020-06-11 03:20:58'),
(83, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-12\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:21:01', '2020-06-11 03:21:01'),
(84, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:21:01', '2020-06-11 03:21:01'),
(85, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:21:26', '2020-06-11 03:21:26'),
(86, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-1\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:21:30', '2020-06-11 03:21:30'),
(87, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:21:30', '2020-06-11 03:21:30'),
(88, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:23:33', '2020-06-11 03:23:33'),
(89, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:23:35', '2020-06-11 03:23:35'),
(90, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"searchProduct\":null,\"searchSelected\":null,\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:24:48', '2020-06-11 03:24:48'),
(91, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:24:59', '2020-06-11 03:24:59'),
(92, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"searchProduct\":null,\"searchSelected\":null,\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:26:13', '2020-06-11 03:26:13'),
(93, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:26:14', '2020-06-11 03:26:14'),
(94, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:26:15', '2020-06-11 03:26:15'),
(95, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:26:16', '2020-06-11 03:26:16'),
(96, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:27:30', '2020-06-11 03:27:30'),
(97, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:27:30', '2020-06-11 03:27:30'),
(98, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 03:27:32', '2020-06-11 03:27:32'),
(99, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:27:34', '2020-06-11 03:27:34'),
(100, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:29:06', '2020-06-11 03:29:06'),
(101, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:29:13', '2020-06-11 03:29:13'),
(102, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:30:03', '2020-06-11 03:30:03'),
(103, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:31:47', '2020-06-11 03:31:47'),
(104, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:32:37', '2020-06-11 03:32:37'),
(105, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:33:34', '2020-06-11 03:33:34'),
(106, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:37:00', '2020-06-11 03:37:00'),
(107, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:37:23', '2020-06-11 03:37:23'),
(108, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:39:17', '2020-06-11 03:39:17'),
(109, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:39:38', '2020-06-11 03:39:38'),
(110, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:41:04', '2020-06-11 03:41:04'),
(111, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:42:03', '2020-06-11 03:42:03'),
(112, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:42:51', '2020-06-11 03:42:51'),
(113, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:42:53', '2020-06-11 03:42:53'),
(114, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:44:03', '2020-06-11 03:44:03'),
(115, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:44:56', '2020-06-11 03:44:56'),
(116, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:45:54', '2020-06-11 03:45:54'),
(117, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:46:19', '2020-06-11 03:46:19'),
(118, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:57:24', '2020-06-11 03:57:24'),
(119, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 03:58:42', '2020-06-11 03:58:42'),
(120, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:07:41', '2020-06-11 04:07:41'),
(121, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:08:14', '2020-06-11 04:08:14'),
(122, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,4,3,2,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:08:19', '2020-06-11 04:08:19'),
(123, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:08:22', '2020-06-11 04:08:22'),
(124, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:08:39', '2020-06-11 04:08:39'),
(125, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:08:52', '2020-06-11 04:08:52'),
(126, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:08:54', '2020-06-11 04:08:54'),
(127, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:08:56', '2020-06-11 04:08:56'),
(128, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,0,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:10:09', '2020-06-11 04:10:09'),
(129, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:10:14', '2020-06-11 04:10:14'),
(130, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:10:46', '2020-06-11 04:10:46'),
(131, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:10:49', '2020-06-11 04:10:49'),
(132, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,0,0,2,0,0,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:11:14', '2020-06-11 04:11:14'),
(133, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:11:20', '2020-06-11 04:11:20'),
(134, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:12:05', '2020-06-11 04:12:05'),
(135, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:12:44', '2020-06-11 04:12:44'),
(136, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:12:45', '2020-06-11 04:12:45'),
(137, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,4,5\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 04:12:47', '2020-06-11 04:12:47'),
(138, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:13:11', '2020-06-11 04:13:11'),
(139, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:13:23', '2020-06-11 04:13:23'),
(140, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:13:59', '2020-06-11 04:13:59'),
(141, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:20:51', '2020-06-11 04:20:51'),
(142, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:20:57', '2020-06-11 04:20:57'),
(143, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:22:12', '2020-06-11 04:22:12'),
(144, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:22:59', '2020-06-11 04:22:59'),
(145, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:23:39', '2020-06-11 04:23:39'),
(146, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:23:50', '2020-06-11 04:23:50');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(147, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:25:35', '2020-06-11 04:25:35'),
(148, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:25:41', '2020-06-11 04:25:41'),
(149, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:02', '2020-06-11 04:29:02'),
(150, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:08', '2020-06-11 04:29:08'),
(151, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:14', '2020-06-11 04:29:14'),
(152, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:41', '2020-06-11 04:29:41'),
(153, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:56', '2020-06-11 04:29:56'),
(154, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:58', '2020-06-11 04:29:58'),
(155, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:59', '2020-06-11 04:29:59'),
(156, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:29:59', '2020-06-11 04:29:59'),
(157, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:31:49', '2020-06-11 04:31:49'),
(158, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:31:51', '2020-06-11 04:31:51'),
(159, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:34:44', '2020-06-11 04:34:44'),
(160, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:34:51', '2020-06-11 04:34:51'),
(161, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:44:22', '2020-06-11 04:44:22'),
(162, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:44:45', '2020-06-11 04:44:45'),
(163, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:44:58', '2020-06-11 04:44:58'),
(164, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:45:30', '2020-06-11 04:45:30'),
(165, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:46:39', '2020-06-11 04:46:39'),
(166, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:46:54', '2020-06-11 04:46:54'),
(167, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:47:38', '2020-06-11 04:47:38'),
(168, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:48:37', '2020-06-11 04:48:37'),
(169, 1, 'sc_admin/brand', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:48:43', '2020-06-11 04:48:43'),
(170, 1, 'sc_admin/supplier', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:48:45', '2020-06-11 04:48:45'),
(171, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:48:47', '2020-06-11 04:48:47'),
(172, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:48:49', '2020-06-11 04:48:49'),
(173, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:55:15', '2020-06-11 04:55:15'),
(174, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:55:24', '2020-06-11 04:55:24'),
(175, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:56:10', '2020-06-11 04:56:10'),
(176, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:57:19', '2020-06-11 04:57:19'),
(177, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 04:57:25', '2020-06-11 04:57:25'),
(178, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:32:48', '2020-06-11 06:32:48'),
(179, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:32:54', '2020-06-11 06:32:54'),
(180, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:35:11', '2020-06-11 06:35:11'),
(181, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:37:29', '2020-06-11 06:37:29'),
(182, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:37:50', '2020-06-11 06:37:50'),
(183, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:37:52', '2020-06-11 06:37:52'),
(184, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:38:08', '2020-06-11 06:38:08'),
(185, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:38:09', '2020-06-11 06:38:09'),
(186, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:39:32', '2020-06-11 06:39:32'),
(187, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:39:35', '2020-06-11 06:39:35'),
(188, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:40:59', '2020-06-11 06:40:59'),
(189, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:41:03', '2020-06-11 06:41:03'),
(190, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:41:30', '2020-06-11 06:41:30'),
(191, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:41:38', '2020-06-11 06:41:38'),
(192, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:41:49', '2020-06-11 06:41:49'),
(193, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:42:01', '2020-06-11 06:42:01'),
(194, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:42:30', '2020-06-11 06:42:30'),
(195, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,6,3\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:42:37', '2020-06-11 06:42:37'),
(196, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:42:41', '2020-06-11 06:42:41'),
(197, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:33', '2020-06-11 06:44:33'),
(198, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,5,6,2,3\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:44:36', '2020-06-11 06:44:36'),
(199, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:37', '2020-06-11 06:44:37'),
(200, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:39', '2020-06-11 06:44:39'),
(201, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:46', '2020-06-11 06:44:46'),
(202, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:49', '2020-06-11 06:44:49'),
(203, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,11,2,3,5,6\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:44:57', '2020-06-11 06:44:57'),
(204, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:44:57', '2020-06-11 06:44:57'),
(205, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:45:00', '2020-06-11 06:45:00'),
(206, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:45:03', '2020-06-11 06:45:03'),
(207, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:46:40', '2020-06-11 06:46:40'),
(208, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:47:40', '2020-06-11 06:47:40'),
(209, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:48:19', '2020-06-11 06:48:19'),
(210, 1, 'sc_admin/api_connection', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:48:30', '2020-06-11 06:48:30'),
(211, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:48:38', '2020-06-11 06:48:38'),
(212, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:50:54', '2020-06-11 06:50:54'),
(213, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:51:08', '2020-06-11 06:51:08'),
(214, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:51:14', '2020-06-11 06:51:14'),
(215, 1, 'sc_admin/provider/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:51:32', '2020-06-11 06:51:32'),
(216, 1, 'sc_admin/provider/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":null,\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":null,\"district\":null,\"ward\":null,\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:52:05', '2020-06-11 06:52:05'),
(217, 1, 'sc_admin/provider/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:05', '2020-06-11 06:52:05'),
(218, 1, 'sc_admin/provider/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":null,\"ward\":null,\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:52:10', '2020-06-11 06:52:10'),
(219, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:10', '2020-06-11 06:52:10'),
(220, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:12', '2020-06-11 06:52:12'),
(221, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:52:16', '2020-06-11 06:52:16'),
(222, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:16', '2020-06-11 06:52:16'),
(223, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-21\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:52:21', '2020-06-11 06:52:21'),
(224, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:21', '2020-06-11 06:52:21'),
(225, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:27', '2020-06-11 06:52:27'),
(226, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:52:30', '2020-06-11 06:52:30'),
(227, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:52:30', '2020-06-11 06:52:30'),
(228, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":\"tempmail62501@emailna\",\"_pjax\":\"#pjax-container\"}', '2020-06-11 06:52:46', '2020-06-11 06:52:46'),
(229, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"_pjax\":\"#pjax-container\"}', '2020-06-11 06:52:54', '2020-06-11 06:52:54'),
(230, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:53:30', '2020-06-11 06:53:30'),
(231, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null}', '2020-06-11 06:53:31', '2020-06-11 06:53:31'),
(232, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:53:32', '2020-06-11 06:53:32'),
(233, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,5,6,17,11\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 06:53:39', '2020-06-11 06:53:39'),
(234, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:53:39', '2020-06-11 06:53:39'),
(235, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:56:03', '2020-06-11 06:56:03'),
(236, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:56:23', '2020-06-11 06:56:23'),
(237, 1, 'sc_admin/customer', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:56:44', '2020-06-11 06:56:44'),
(238, 1, 'sc_admin/customer/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:56:45', '2020-06-11 06:56:45'),
(239, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 06:58:17', '2020-06-11 06:58:17'),
(240, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:01:22', '2020-06-11 07:01:22'),
(241, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:02:05', '2020-06-11 07:02:05'),
(242, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:02:07', '2020-06-11 07:02:07'),
(243, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:02:08', '2020-06-11 07:02:08'),
(244, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:02:59', '2020-06-11 07:02:59'),
(245, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:03:04', '2020-06-11 07:03:04'),
(246, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:03', '2020-06-11 07:04:03'),
(247, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:20', '2020-06-11 07:04:20'),
(248, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:04:23', '2020-06-11 07:04:23'),
(249, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:23', '2020-06-11 07:04:23'),
(250, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:42', '2020-06-11 07:04:42'),
(251, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:42', '2020-06-11 07:04:42'),
(252, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:04:45', '2020-06-11 07:04:45'),
(253, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:45', '2020-06-11 07:04:45'),
(254, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-21\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"status\":\"on\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:04:48', '2020-06-11 07:04:48'),
(255, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:04:49', '2020-06-11 07:04:49'),
(256, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:00', '2020-06-11 07:06:00'),
(257, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:01', '2020-06-11 07:06:01'),
(258, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:06:05', '2020-06-11 07:06:05'),
(259, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:05', '2020-06-11 07:06:05'),
(260, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:12', '2020-06-11 07:06:12'),
(261, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:16', '2020-06-11 07:06:16'),
(262, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:06:20', '2020-06-11 07:06:20'),
(263, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:09:38', '2020-06-11 07:09:38'),
(264, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:10:18', '2020-06-11 07:10:18'),
(265, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:10:20', '2020-06-11 07:10:20'),
(266, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:11:05', '2020-06-11 07:11:05'),
(267, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:11:37', '2020-06-11 07:11:37'),
(268, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:12:06', '2020-06-11 07:12:06'),
(269, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:12:35', '2020-06-11 07:12:35'),
(270, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:12:38', '2020-06-11 07:12:38'),
(271, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:12:42', '2020-06-11 07:12:42'),
(272, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:13:24', '2020-06-11 07:13:24'),
(273, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:13:28', '2020-06-11 07:13:28'),
(274, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:13:36', '2020-06-11 07:13:36'),
(275, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:24:01', '2020-06-11 07:24:01'),
(276, 1, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:24:10', '2020-06-11 07:24:10'),
(277, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:24:13', '2020-06-11 07:24:13'),
(278, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,5,6,11,16,17\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:24:21', '2020-06-11 07:24:21'),
(279, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:24:21', '2020-06-11 07:24:21'),
(280, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:25:17', '2020-06-11 07:25:17'),
(281, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,5,6,11,15,17\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 07:25:24', '2020-06-11 07:25:24'),
(282, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:25:24', '2020-06-11 07:25:24'),
(283, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:29:31', '2020-06-11 07:29:31'),
(284, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:44:02', '2020-06-11 07:44:02'),
(285, 1, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:55:52', '2020-06-11 07:55:52'),
(286, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:56:01', '2020-06-11 07:56:01'),
(287, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:59:44', '2020-06-11 07:59:44'),
(288, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 07:59:45', '2020-06-11 07:59:45'),
(289, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:09:50', '2020-06-11 08:09:50'),
(290, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:10:17', '2020-06-11 08:10:17'),
(291, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:15:50', '2020-06-11 08:15:50'),
(292, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:20:35', '2020-06-11 08:20:35'),
(293, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:23:00', '2020-06-11 08:23:00'),
(294, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:23:11', '2020-06-11 08:23:11'),
(295, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:24:46', '2020-06-11 08:24:46'),
(296, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:27:27', '2020-06-11 08:27:27'),
(297, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,17,14,16,3\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 08:27:33', '2020-06-11 08:27:33'),
(298, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:27:33', '2020-06-11 08:27:33'),
(299, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:27:46', '2020-06-11 08:27:46'),
(300, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,14,16,17\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 08:27:50', '2020-06-11 08:27:50'),
(301, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:27:50', '2020-06-11 08:27:50'),
(302, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:46:59', '2020-06-11 08:46:59'),
(303, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,15,14,16,17\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 08:47:02', '2020-06-11 08:47:02'),
(304, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 08:47:02', '2020-06-11 08:47:02'),
(305, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:00:32', '2020-06-11 09:00:32'),
(306, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,14,15,16\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:00:37', '2020-06-11 09:00:37'),
(307, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:00:37', '2020-06-11 09:00:37'),
(308, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:01:32', '2020-06-11 09:01:32'),
(309, 1, 'sc_admin/provider/show/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"products\":\"1,2,3,14,15,17,16\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:01:36', '2020-06-11 09:01:36'),
(310, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:01:36', '2020-06-11 09:01:36'),
(311, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:34:00', '2020-06-11 09:34:00'),
(312, 1, 'sc_admin/category', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:34:50', '2020-06-11 09:34:50'),
(313, 1, 'sc_admin/category/edit/13', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:34:52', '2020-06-11 09:34:52'),
(314, 1, 'sc_admin/banner', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:34:57', '2020-06-11 09:34:57'),
(315, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:35:04', '2020-06-11 09:35:04'),
(316, 1, 'sc_admin/customer', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:35:07', '2020-06-11 09:35:07'),
(317, 1, 'sc_admin/customer/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:35:09', '2020-06-11 09:35:09'),
(318, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:35:56', '2020-06-11 09:35:56'),
(319, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:35:58', '2020-06-11 09:35:58'),
(320, 1, 'sc_admin/customer', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:36:02', '2020-06-11 09:36:02'),
(321, 1, 'sc_admin/customer/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:36:04', '2020-06-11 09:36:04'),
(322, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:36:48', '2020-06-11 09:36:48'),
(323, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:40:04', '2020-06-11 09:40:04'),
(324, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-1\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:40:15', '2020-06-11 09:40:15'),
(325, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:40:15', '2020-06-11 09:40:15'),
(326, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-1\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:41:07', '2020-06-11 09:41:07'),
(327, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:41:07', '2020-06-11 09:41:07'),
(328, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-11\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:41:11', '2020-06-11 09:41:11'),
(329, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:41:11', '2020-06-11 09:41:11'),
(330, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:41:13', '2020-06-11 09:41:13'),
(331, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:41:37', '2020-06-11 09:41:37'),
(332, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:41:55', '2020-06-11 09:41:55');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(333, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-11\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:42:02', '2020-06-11 09:42:02'),
(334, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:42:02', '2020-06-11 09:42:02'),
(335, 1, 'sc_admin/provider/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"alias\":\"provider-1\",\"email\":\"provider222@gmail.com\",\"phone\":\"0911824834\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n S\\u00ecn H\\u1ed3\",\"ward\":\"X\\u00e3 Ph\\u00ecn H\\u1ed3\",\"address\":\"994 Damaris Ville\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"0\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:42:07', '2020-06-11 09:42:07'),
(336, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:42:07', '2020-06-11 09:42:07'),
(337, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:42:17', '2020-06-11 09:42:17'),
(338, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:42:20', '2020-06-11 09:42:20'),
(339, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:42:20', '2020-06-11 09:42:20'),
(340, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-22\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\"}', '2020-06-11 09:42:23', '2020-06-11 09:42:23'),
(341, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:42:24', '2020-06-11 09:42:24'),
(342, 1, 'sc_admin/plugin/payment', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:55:34', '2020-06-11 09:55:34'),
(343, 1, 'sc_admin/plugin/disable', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"Cash\",\"code\":\"Payment\"}', '2020-06-11 09:55:36', '2020-06-11 09:55:36'),
(344, 1, 'sc_admin/plugin/payment', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-11 09:55:36', '2020-06-11 09:55:36'),
(345, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:55:38', '2020-06-11 09:55:38'),
(346, 1, 'sc_admin/plugin/disable', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"ShippingStandard\",\"code\":\"Shipping\"}', '2020-06-11 09:55:39', '2020-06-11 09:55:39'),
(347, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-11 09:55:39', '2020-06-11 09:55:39'),
(348, 1, 'sc_admin/plugin/total', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:55:41', '2020-06-11 09:55:41'),
(349, 1, 'sc_admin/plugin/install', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"Discount\",\"code\":\"Total\"}', '2020-06-11 09:55:44', '2020-06-11 09:55:44'),
(350, 1, 'sc_admin/plugin/total', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:55:44', '2020-06-11 09:55:44'),
(351, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 09:55:46', '2020-06-11 09:55:46'),
(352, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:18:17', '2020-06-11 10:18:17'),
(353, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:24:00', '2020-06-11 10:24:00'),
(354, 1, 'sc_admin/plugin/payment', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:25:36', '2020-06-11 10:25:36'),
(355, 1, 'sc_admin/plugin/enable', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"Cash\",\"code\":\"Payment\"}', '2020-06-11 10:25:39', '2020-06-11 10:25:39'),
(356, 1, 'sc_admin/plugin/payment', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-11 10:25:39', '2020-06-11 10:25:39'),
(357, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:25:43', '2020-06-11 10:25:43'),
(358, 1, 'sc_admin/plugin/payment', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:25:46', '2020-06-11 10:25:46'),
(359, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-11 10:25:50', '2020-06-11 10:25:50'),
(360, 1, 'sc_admin/plugin/enable', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"xfp4Qhpz0psbd0euQLdIAFf6duMISrzpAOVqgs6t\",\"key\":\"ShippingStandard\",\"code\":\"Shipping\"}', '2020-06-11 10:25:51', '2020-06-11 10:25:51'),
(361, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-11 10:25:52', '2020-06-11 10:25:52'),
(362, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:26:30', '2020-06-12 01:26:30'),
(363, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:26:32', '2020-06-12 01:26:32'),
(364, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:35:41', '2020-06-12 01:35:41'),
(365, 1, 'sc_admin/template/changeTemplate', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"yRFDturpwHMWZQdDO6sOmIqBOxjWRWKqxYImkjod\",\"key\":\"default-new\"}', '2020-06-12 01:35:42', '2020-06-12 01:35:42'),
(366, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:35:42', '2020-06-12 01:35:42'),
(367, 1, 'sc_admin/category', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:36:12', '2020-06-12 01:36:12'),
(368, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:36:15', '2020-06-12 01:36:15'),
(369, 1, 'sc_admin/product/edit/17', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:36:17', '2020-06-12 01:36:17'),
(370, 1, 'sc_admin/template/changeTemplate', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"yRFDturpwHMWZQdDO6sOmIqBOxjWRWKqxYImkjod\",\"key\":\"thaihungecommerce\"}', '2020-06-12 01:38:50', '2020-06-12 01:38:50'),
(371, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:38:50', '2020-06-12 01:38:50'),
(372, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:43:52', '2020-06-12 01:43:52'),
(373, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 01:53:04', '2020-06-12 01:53:04'),
(374, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:27:48', '2020-06-12 02:27:48'),
(375, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:37:00', '2020-06-12 02:37:00'),
(376, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:37:05', '2020-06-12 02:37:05'),
(377, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:41:10', '2020-06-12 02:41:10'),
(378, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:41:11', '2020-06-12 02:41:11'),
(379, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:45:44', '2020-06-12 02:45:44'),
(380, 1, 'sc_admin/template/changeTemplate', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"yRFDturpwHMWZQdDO6sOmIqBOxjWRWKqxYImkjod\",\"key\":\"default-new\"}', '2020-06-12 02:45:45', '2020-06-12 02:45:45'),
(381, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:45:45', '2020-06-12 02:45:45'),
(382, 1, 'sc_admin/template/changeTemplate', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"yRFDturpwHMWZQdDO6sOmIqBOxjWRWKqxYImkjod\",\"key\":\"thaihungecommerce\"}', '2020-06-12 02:47:20', '2020-06-12 02:47:20'),
(383, 1, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:47:20', '2020-06-12 02:47:20'),
(384, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:58:22', '2020-06-12 02:58:22'),
(385, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 02:58:25', '2020-06-12 02:58:25'),
(386, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 06:56:49', '2020-06-12 06:56:49'),
(387, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 06:57:01', '2020-06-12 06:57:01'),
(388, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 06:57:09', '2020-06-12 06:57:09'),
(389, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 06:57:13', '2020-06-12 06:57:13'),
(390, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 06:57:22', '2020-06-12 06:57:22'),
(391, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"2\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 06:57:25', '2020-06-12 06:57:25'),
(392, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"3\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 06:57:27', '2020-06-12 06:57:27'),
(393, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 06:57:29', '2020-06-12 06:57:29'),
(394, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":null,\"_pjax\":\"#pjax-container\"}', '2020-06-12 06:57:31', '2020-06-12 06:57:31'),
(395, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":null}', '2020-06-12 07:05:00', '2020-06-12 07:05:00'),
(396, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":null}', '2020-06-12 07:05:49', '2020-06-12 07:05:49'),
(397, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":null}', '2020-06-12 07:37:54', '2020-06-12 07:37:54'),
(398, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 07:37:56', '2020-06-12 07:37:56'),
(399, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:01', '2020-06-12 07:41:01'),
(400, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:01', '2020-06-12 07:41:01'),
(401, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:02', '2020-06-12 07:41:02'),
(402, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:02', '2020-06-12 07:41:02'),
(403, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:03', '2020-06-12 07:41:03'),
(404, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:03', '2020-06-12 07:41:03'),
(405, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:04', '2020-06-12 07:41:04'),
(406, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:05', '2020-06-12 07:41:05'),
(407, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:06', '2020-06-12 07:41:06'),
(408, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:06', '2020-06-12 07:41:06'),
(409, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:07', '2020-06-12 07:41:07'),
(410, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:08', '2020-06-12 07:41:08'),
(411, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:08', '2020-06-12 07:41:08'),
(412, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:09', '2020-06-12 07:41:09'),
(413, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:41:09', '2020-06-12 07:41:09'),
(414, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 07:42:30', '2020-06-12 07:42:30'),
(415, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:43:58', '2020-06-12 07:43:58'),
(416, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:44:02', '2020-06-12 07:44:02'),
(417, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:44:24', '2020-06-12 07:44:24'),
(418, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:44:43', '2020-06-12 07:44:43'),
(419, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:46:00', '2020-06-12 07:46:00'),
(420, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:47:51', '2020-06-12 07:47:51'),
(421, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:51:26', '2020-06-12 07:51:26'),
(422, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:53:55', '2020-06-12 07:53:55'),
(423, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:55:09', '2020-06-12 07:55:09'),
(424, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 07:56:14', '2020-06-12 07:56:14'),
(425, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:01:58', '2020-06-12 08:01:58'),
(426, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:04:02', '2020-06-12 08:04:02'),
(427, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:04:47', '2020-06-12 08:04:47'),
(428, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:08:57', '2020-06-12 08:08:57'),
(429, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:09:19', '2020-06-12 08:09:19'),
(430, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:10:17', '2020-06-12 08:10:17'),
(431, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:10:38', '2020-06-12 08:10:38'),
(432, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:10:47', '2020-06-12 08:10:47'),
(433, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:10:55', '2020-06-12 08:10:55'),
(434, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:11:03', '2020-06-12 08:11:03'),
(435, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:11:12', '2020-06-12 08:11:12'),
(436, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:11:20', '2020-06-12 08:11:20'),
(437, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:11:28', '2020-06-12 08:11:28'),
(438, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:11:44', '2020-06-12 08:11:44'),
(439, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:12:37', '2020-06-12 08:12:37'),
(440, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:13:59', '2020-06-12 08:13:59'),
(441, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:14:04', '2020-06-12 08:14:04'),
(442, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:14:10', '2020-06-12 08:14:10'),
(443, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:14:21', '2020-06-12 08:14:21'),
(444, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:18:03', '2020-06-12 08:18:03'),
(445, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:18:08', '2020-06-12 08:18:08'),
(446, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:20:49', '2020-06-12 08:20:49'),
(447, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:21:07', '2020-06-12 08:21:07'),
(448, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:21:50', '2020-06-12 08:21:50'),
(449, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:21:56', '2020-06-12 08:21:56'),
(450, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:25:04', '2020-06-12 08:25:04'),
(451, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:25:13', '2020-06-12 08:25:13'),
(452, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:26:48', '2020-06-12 08:26:48'),
(453, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:27:50', '2020-06-12 08:27:50'),
(454, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:28:10', '2020-06-12 08:28:10'),
(455, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:29:48', '2020-06-12 08:29:48'),
(456, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:29:56', '2020-06-12 08:29:56'),
(457, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:35:46', '2020-06-12 08:35:46'),
(458, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:35:49', '2020-06-12 08:35:49'),
(459, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:36:37', '2020-06-12 08:36:37'),
(460, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:36:50', '2020-06-12 08:36:50'),
(461, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:07', '2020-06-12 08:37:07'),
(462, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:15', '2020-06-12 08:37:15'),
(463, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:21', '2020-06-12 08:37:21'),
(464, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:27', '2020-06-12 08:37:27'),
(465, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:34', '2020-06-12 08:37:34'),
(466, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:34', '2020-06-12 08:37:34'),
(467, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:39', '2020-06-12 08:37:39'),
(468, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:37:51', '2020-06-12 08:37:51'),
(469, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:38:01', '2020-06-12 08:38:01'),
(470, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:38:22', '2020-06-12 08:38:22'),
(471, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:39:55', '2020-06-12 08:39:55'),
(472, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 08:40:06', '2020-06-12 08:40:06'),
(473, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 08:40:19', '2020-06-12 08:40:19'),
(474, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-06-12 08:40:19', '2020-06-12 08:40:19'),
(475, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:40:25', '2020-06-12 08:40:25'),
(476, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:40:34', '2020-06-12 08:40:34'),
(477, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:40:39', '2020-06-12 08:40:39'),
(478, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:40:56', '2020-06-12 08:40:56'),
(479, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:41:21', '2020-06-12 08:41:21'),
(480, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:41:37', '2020-06-12 08:41:37'),
(481, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:41:50', '2020-06-12 08:41:50'),
(482, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:41:57', '2020-06-12 08:41:57'),
(483, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:42:17', '2020-06-12 08:42:17'),
(484, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:42:48', '2020-06-12 08:42:48'),
(485, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:42:57', '2020-06-12 08:42:57'),
(486, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":null,\"order_status\":\"1\"}', '2020-06-12 08:43:11', '2020-06-12 08:43:11'),
(487, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:43:39', '2020-06-12 08:43:39'),
(488, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:43:49', '2020-06-12 08:43:49'),
(489, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:46:32', '2020-06-12 08:46:32'),
(490, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:51:40', '2020-06-12 08:51:40'),
(491, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:53:48', '2020-06-12 08:53:48'),
(492, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:55:38', '2020-06-12 08:55:38'),
(493, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:57:10', '2020-06-12 08:57:10'),
(494, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 08:58:31', '2020-06-12 08:58:31'),
(495, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:00:21', '2020-06-12 09:00:21'),
(496, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:00:25', '2020-06-12 09:00:25'),
(497, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:01:32', '2020-06-12 09:01:32'),
(498, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:02:52', '2020-06-12 09:02:52'),
(499, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:05:34', '2020-06-12 09:05:34'),
(500, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:05:44', '2020-06-12 09:05:44'),
(501, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:05:54', '2020-06-12 09:05:54'),
(502, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:06:04', '2020-06-12 09:06:04'),
(503, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:06:48', '2020-06-12 09:06:48'),
(504, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:07:39', '2020-06-12 09:07:39'),
(505, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:08:22', '2020-06-12 09:08:22'),
(506, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:08:49', '2020-06-12 09:08:49'),
(507, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:11:00', '2020-06-12 09:11:00'),
(508, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:11:13', '2020-06-12 09:11:13'),
(509, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:11:52', '2020-06-12 09:11:52'),
(510, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:12:18', '2020-06-12 09:12:18'),
(511, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:13:17', '2020-06-12 09:13:17'),
(512, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:14:01', '2020-06-12 09:14:01'),
(513, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:14:15', '2020-06-12 09:14:15'),
(514, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:14:26', '2020-06-12 09:14:26'),
(515, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:15:45', '2020-06-12 09:15:45'),
(516, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:16:01', '2020-06-12 09:16:01'),
(517, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:16:46', '2020-06-12 09:16:46'),
(518, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:17:18', '2020-06-12 09:17:18'),
(519, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:17:22', '2020-06-12 09:17:22'),
(520, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:17:37', '2020-06-12 09:17:37'),
(521, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:18:11', '2020-06-12 09:18:11'),
(522, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:18:20', '2020-06-12 09:18:20'),
(523, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:18:32', '2020-06-12 09:18:32'),
(524, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:18:40', '2020-06-12 09:18:40'),
(525, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:19:35', '2020-06-12 09:19:35');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(526, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:20:14', '2020-06-12 09:20:14'),
(527, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:20:30', '2020-06-12 09:20:30'),
(528, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:20:46', '2020-06-12 09:20:46'),
(529, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:21:01', '2020-06-12 09:21:01'),
(530, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:21:40', '2020-06-12 09:21:40'),
(531, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:21:48', '2020-06-12 09:21:48'),
(532, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:22:18', '2020-06-12 09:22:18'),
(533, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:22:23', '2020-06-12 09:22:23'),
(534, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:22:37', '2020-06-12 09:22:37'),
(535, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:22:46', '2020-06-12 09:22:46'),
(536, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:22:51', '2020-06-12 09:22:51'),
(537, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:22:57', '2020-06-12 09:22:57'),
(538, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:23:01', '2020-06-12 09:23:01'),
(539, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:23:14', '2020-06-12 09:23:14'),
(540, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:23:25', '2020-06-12 09:23:25'),
(541, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:23:32', '2020-06-12 09:23:32'),
(542, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:23:38', '2020-06-12 09:23:38'),
(543, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:23:42', '2020-06-12 09:23:42'),
(544, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:24:00', '2020-06-12 09:24:00'),
(545, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '[]', '2020-06-12 09:24:18', '2020-06-12 09:24:18'),
(546, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:24:22', '2020-06-12 09:24:22'),
(547, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:28:27', '2020-06-12 09:28:27'),
(548, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:30:38', '2020-06-12 09:30:38'),
(549, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:30:46', '2020-06-12 09:30:46'),
(550, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:30:59', '2020-06-12 09:30:59'),
(551, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:34:25', '2020-06-12 09:34:25'),
(552, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:36:01', '2020-06-12 09:36:01'),
(553, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:36:23', '2020-06-12 09:36:23'),
(554, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:37:05', '2020-06-12 09:37:05'),
(555, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:37:11', '2020-06-12 09:37:11'),
(556, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:38:42', '2020-06-12 09:38:42'),
(557, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:39:12', '2020-06-12 09:39:12'),
(558, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:41:39', '2020-06-12 09:41:39'),
(559, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:41:40', '2020-06-12 09:41:40'),
(560, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:42:20', '2020-06-12 09:42:20'),
(561, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:42:35', '2020-06-12 09:42:35'),
(562, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:42:56', '2020-06-12 09:42:56'),
(563, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:43:16', '2020-06-12 09:43:16'),
(564, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:43:35', '2020-06-12 09:43:35'),
(565, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:47:29', '2020-06-12 09:47:29'),
(566, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:49:50', '2020-06-12 09:49:50'),
(567, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:51:52', '2020-06-12 09:51:52'),
(568, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:52:02', '2020-06-12 09:52:02'),
(569, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:52:39', '2020-06-12 09:52:39'),
(570, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:52:43', '2020-06-12 09:52:43'),
(571, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:54:51', '2020-06-12 09:54:51'),
(572, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:55:22', '2020-06-12 09:55:22'),
(573, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:55:58', '2020-06-12 09:55:58'),
(574, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:56:10', '2020-06-12 09:56:10'),
(575, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:56:17', '2020-06-12 09:56:17'),
(576, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:57:11', '2020-06-12 09:57:11'),
(577, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:58:23', '2020-06-12 09:58:23'),
(578, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:58:47', '2020-06-12 09:58:47'),
(579, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:59:37', '2020-06-12 09:59:37'),
(580, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:59:44', '2020-06-12 09:59:44'),
(581, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 09:59:56', '2020-06-12 09:59:56'),
(582, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:00:02', '2020-06-12 10:00:02'),
(583, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:00:09', '2020-06-12 10:00:09'),
(584, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:00:46', '2020-06-12 10:00:46'),
(585, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:01:26', '2020-06-12 10:01:26'),
(586, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:01:38', '2020-06-12 10:01:38'),
(587, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:01:52', '2020-06-12 10:01:52'),
(588, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:02:00', '2020-06-12 10:02:00'),
(589, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:02:22', '2020-06-12 10:02:22'),
(590, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:02:35', '2020-06-12 10:02:35'),
(591, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:03:43', '2020-06-12 10:03:43'),
(592, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:04:17', '2020-06-12 10:04:17'),
(593, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:04:22', '2020-06-12 10:04:22'),
(594, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:04:30', '2020-06-12 10:04:30'),
(595, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:04:37', '2020-06-12 10:04:37'),
(596, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:05:08', '2020-06-12 10:05:08'),
(597, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:05:28', '2020-06-12 10:05:28'),
(598, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 10:05:39', '2020-06-12 10:05:39'),
(599, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-12 10:05:40', '2020-06-12 10:05:40'),
(600, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:05:59', '2020-06-12 10:05:59'),
(601, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:06:10', '2020-06-12 10:06:10'),
(602, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:06:15', '2020-06-12 10:06:15'),
(603, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:06:41', '2020-06-12 10:06:41'),
(604, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:06:52', '2020-06-12 10:06:52'),
(605, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:07:00', '2020-06-12 10:07:00'),
(606, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:09:02', '2020-06-12 10:09:02'),
(607, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:10:09', '2020-06-12 10:10:09'),
(608, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:10:21', '2020-06-12 10:10:21'),
(609, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:10:31', '2020-06-12 10:10:31'),
(610, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:11:21', '2020-06-12 10:11:21'),
(611, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:12:04', '2020-06-12 10:12:04'),
(612, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:12:45', '2020-06-12 10:12:45'),
(613, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:13:00', '2020-06-12 10:13:00'),
(614, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:13:00', '2020-06-12 10:13:00'),
(615, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:13:13', '2020-06-12 10:13:13'),
(616, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:13:27', '2020-06-12 10:13:27'),
(617, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:13:36', '2020-06-12 10:13:36'),
(618, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:19:43', '2020-06-12 10:19:43'),
(619, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-12 10:21:30', '2020-06-12 10:21:30'),
(620, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:24:28', '2020-06-13 01:24:28'),
(621, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:24:40', '2020-06-13 01:24:40'),
(622, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:25:20', '2020-06-13 01:25:20'),
(623, 1, 'sc_admin/auth/login', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:25:22', '2020-06-13 01:25:22'),
(624, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:25:22', '2020-06-13 01:25:22'),
(625, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:25:36', '2020-06-13 01:25:36'),
(626, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:26:35', '2020-06-13 01:26:35'),
(627, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:28:27', '2020-06-13 01:28:27'),
(628, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:31:27', '2020-06-13 01:31:27'),
(629, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:32:34', '2020-06-13 01:32:34'),
(630, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:32:36', '2020-06-13 01:32:36'),
(631, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:32:59', '2020-06-13 01:32:59'),
(632, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:33:35', '2020-06-13 01:33:35'),
(633, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:34:29', '2020-06-13 01:34:29'),
(634, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:34:30', '2020-06-13 01:34:30'),
(635, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:34:40', '2020-06-13 01:34:40'),
(636, 1, 'sc_admin/order/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:49:33', '2020-06-13 01:49:33'),
(637, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:51:36', '2020-06-13 01:51:36'),
(638, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:52:32', '2020-06-13 01:52:32'),
(639, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"f9zRsPhoLpZyJbjQe3ppvU7lOtZ8TWNF4jcgbcJQ\"}', '2020-06-13 01:52:36', '2020-06-13 01:52:36'),
(640, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 01:52:42', '2020-06-13 01:52:42'),
(641, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:52:54', '2020-06-13 01:52:54'),
(642, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"f9zRsPhoLpZyJbjQe3ppvU7lOtZ8TWNF4jcgbcJQ\"}', '2020-06-13 01:52:57', '2020-06-13 01:52:57'),
(643, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:53:00', '2020-06-13 01:53:00'),
(644, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:59:31', '2020-06-13 01:59:31'),
(645, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"f9zRsPhoLpZyJbjQe3ppvU7lOtZ8TWNF4jcgbcJQ\"}', '2020-06-13 01:59:35', '2020-06-13 01:59:35'),
(646, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 01:59:37', '2020-06-13 01:59:37'),
(647, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 01:59:41', '2020-06-13 01:59:41'),
(648, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:00:09', '2020-06-13 02:00:09'),
(649, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:01:14', '2020-06-13 02:01:14'),
(650, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:01:16', '2020-06-13 02:01:16'),
(651, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:01:17', '2020-06-13 02:01:17'),
(652, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:01:29', '2020-06-13 02:01:29'),
(653, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:01:51', '2020-06-13 02:01:51'),
(654, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:02:01', '2020-06-13 02:02:01'),
(655, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:02:05', '2020-06-13 02:02:05'),
(656, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:02:48', '2020-06-13 02:02:48'),
(657, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:02:49', '2020-06-13 02:02:49'),
(658, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:02:51', '2020-06-13 02:02:51'),
(659, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:03:21', '2020-06-13 02:03:21'),
(660, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:03:24', '2020-06-13 02:03:24'),
(661, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:03:34', '2020-06-13 02:03:34'),
(662, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:03:34', '2020-06-13 02:03:34'),
(663, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"f9zRsPhoLpZyJbjQe3ppvU7lOtZ8TWNF4jcgbcJQ\"}', '2020-06-13 02:03:39', '2020-06-13 02:03:39'),
(664, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:03:41', '2020-06-13 02:03:41'),
(665, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-13 02:03:42', '2020-06-13 02:03:42'),
(666, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:03:46', '2020-06-13 02:03:46'),
(667, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:04:49', '2020-06-13 02:04:49'),
(668, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:04:51', '2020-06-13 02:04:51'),
(669, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"f9zRsPhoLpZyJbjQe3ppvU7lOtZ8TWNF4jcgbcJQ\"}', '2020-06-13 02:04:57', '2020-06-13 02:04:57'),
(670, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:04:59', '2020-06-13 02:04:59'),
(671, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:10:51', '2020-06-13 02:10:51'),
(672, 1, 'sc_admin/setting', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:11:56', '2020-06-13 02:11:56'),
(673, 1, 'sc_admin/setting/update_info', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"product_list\",\"value\":\"9\",\"pk\":\"product_list\",\"_token\":\"203iGbOBfNbUxk3t7OjWnBtsn7MlhdRqUFxvsnuA\"}', '2020-06-13 02:12:09', '2020-06-13 02:12:09'),
(674, 1, 'sc_admin/auth/login', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:14:05', '2020-06-13 02:14:05'),
(675, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:25:39', '2020-06-13 02:25:39'),
(676, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:25:44', '2020-06-13 02:25:44'),
(677, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:25:47', '2020-06-13 02:25:47'),
(678, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:27:03', '2020-06-13 02:27:03'),
(679, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:27:26', '2020-06-13 02:27:26'),
(680, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:27:52', '2020-06-13 02:27:52'),
(681, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:28:03', '2020-06-13 02:28:03'),
(682, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:28:25', '2020-06-13 02:28:25'),
(683, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:29:44', '2020-06-13 02:29:44'),
(684, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:29:46', '2020-06-13 02:29:46'),
(685, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:30:02', '2020-06-13 02:30:02'),
(686, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:30:21', '2020-06-13 02:30:21'),
(687, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:30:27', '2020-06-13 02:30:27'),
(688, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:30:43', '2020-06-13 02:30:43'),
(689, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:31:07', '2020-06-13 02:31:07'),
(690, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:31:27', '2020-06-13 02:31:27'),
(691, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:31:42', '2020-06-13 02:31:42'),
(692, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:32:05', '2020-06-13 02:32:05'),
(693, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:33:51', '2020-06-13 02:33:51'),
(694, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:34:45', '2020-06-13 02:34:45'),
(695, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:35:31', '2020-06-13 02:35:31'),
(696, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:35:40', '2020-06-13 02:35:40'),
(697, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:36:26', '2020-06-13 02:36:26'),
(698, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:43:56', '2020-06-13 02:43:56'),
(699, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:44:16', '2020-06-13 02:44:16'),
(700, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:45:10', '2020-06-13 02:45:10'),
(701, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:46:03', '2020-06-13 02:46:03'),
(702, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:46:33', '2020-06-13 02:46:33'),
(703, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:47:44', '2020-06-13 02:47:44'),
(704, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:47:54', '2020-06-13 02:47:54'),
(705, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:49:33', '2020-06-13 02:49:33'),
(706, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:49:46', '2020-06-13 02:49:46'),
(707, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:49:52', '2020-06-13 02:49:52'),
(708, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:50:12', '2020-06-13 02:50:12'),
(709, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:50:27', '2020-06-13 02:50:27'),
(710, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:50:46', '2020-06-13 02:50:46'),
(711, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:50:53', '2020-06-13 02:50:53'),
(712, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:51:16', '2020-06-13 02:51:16'),
(713, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:51:26', '2020-06-13 02:51:26'),
(714, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:51:49', '2020-06-13 02:51:49'),
(715, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:54:09', '2020-06-13 02:54:09'),
(716, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:55:05', '2020-06-13 02:55:05'),
(717, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:55:34', '2020-06-13 02:55:34'),
(718, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:55:55', '2020-06-13 02:55:55'),
(719, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:58:05', '2020-06-13 02:58:05'),
(720, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:58:21', '2020-06-13 02:58:21'),
(721, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:58:43', '2020-06-13 02:58:43'),
(722, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"3\",\"pk\":\"1\",\"_token\":\"203iGbOBfNbUxk3t7OjWnBtsn7MlhdRqUFxvsnuA\"}', '2020-06-13 02:58:47', '2020-06-13 02:58:47'),
(723, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:58:48', '2020-06-13 02:58:48'),
(724, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"203iGbOBfNbUxk3t7OjWnBtsn7MlhdRqUFxvsnuA\"}', '2020-06-13 02:59:02', '2020-06-13 02:59:02'),
(725, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:59:33', '2020-06-13 02:59:33'),
(726, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 02:59:42', '2020-06-13 02:59:42'),
(727, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 03:14:23', '2020-06-13 03:14:23'),
(728, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 03:18:03', '2020-06-13 03:18:03'),
(729, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 03:18:32', '2020-06-13 03:18:32'),
(730, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:03:54', '2020-06-13 04:03:54'),
(731, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:04:05', '2020-06-13 04:04:05'),
(732, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:05:05', '2020-06-13 04:05:05'),
(733, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:06:34', '2020-06-13 04:06:34'),
(734, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:07:43', '2020-06-13 04:07:43'),
(735, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:19', '2020-06-13 04:13:19'),
(736, 1, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:21', '2020-06-13 04:13:21'),
(737, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:28', '2020-06-13 04:13:28'),
(738, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:32', '2020-06-13 04:13:32'),
(739, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:51', '2020-06-13 04:13:51'),
(740, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:13:54', '2020-06-13 04:13:54'),
(741, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:17:35', '2020-06-13 04:17:35'),
(742, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:18:01', '2020-06-13 04:18:01'),
(743, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:19:08', '2020-06-13 04:19:08'),
(744, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:22:00', '2020-06-13 04:22:00'),
(745, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:24:35', '2020-06-13 04:24:35');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(746, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:28:36', '2020-06-13 04:28:36'),
(747, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:28:54', '2020-06-13 04:28:54'),
(748, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:29:19', '2020-06-13 04:29:19'),
(749, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:31:48', '2020-06-13 04:31:48'),
(750, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:35:27', '2020-06-13 04:35:27'),
(751, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:35:41', '2020-06-13 04:35:41'),
(752, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:40:16', '2020-06-13 04:40:16'),
(753, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:40:20', '2020-06-13 04:40:20'),
(754, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:40:21', '2020-06-13 04:40:21'),
(755, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-13 04:40:24', '2020-06-13 04:40:24'),
(756, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:18:54', '2020-06-16 03:18:54'),
(757, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:18:58', '2020-06-16 03:18:58'),
(758, 1, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:19:03', '2020-06-16 03:19:03'),
(759, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:19:29', '2020-06-16 03:19:29'),
(760, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:25:41', '2020-06-16 03:25:41'),
(761, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:25:44', '2020-06-16 03:25:44'),
(762, 1, 'sc_admin/role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:25:50', '2020-06-16 03:25:50'),
(763, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:26:18', '2020-06-16 03:26:18'),
(764, 1, 'sc_admin/permission/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:26:20', '2020-06-16 03:26:20'),
(765, 1, 'sc_admin/permission/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:26:43', '2020-06-16 03:26:43'),
(766, 1, 'sc_admin/permission/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\",\"slug\":null,\"http_uri\":[\"ANY::sc_admin\\/provider\\/*\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:27:21', '2020-06-16 03:27:21'),
(767, 1, 'sc_admin/permission/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:27:21', '2020-06-16 03:27:21'),
(768, 1, 'sc_admin/permission/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Only\",\"slug\":\"provider-only\",\"http_uri\":[\"ANY::sc_admin\\/provider\\/*\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:27:35', '2020-06-16 03:27:35'),
(769, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:27:35', '2020-06-16 03:27:35'),
(770, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:27:42', '2020-06-16 03:27:42'),
(771, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:27:43', '2020-06-16 03:27:43'),
(772, 1, 'sc_admin/role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:27:45', '2020-06-16 03:27:45'),
(773, 1, 'sc_admin/role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\'s User\",\"slug\":\"provider-user\",\"permission\":[\"23\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:28:19', '2020-06-16 03:28:19'),
(774, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:28:19', '2020-06-16 03:28:19'),
(775, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:28:22', '2020-06-16 03:28:22'),
(776, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:28:24', '2020-06-16 03:28:24'),
(777, 1, 'sc_admin/user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"Dayne_Rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"Molestias maxime voluptatem amet dolor neque nobis ipsum.\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"roles\":[\"7\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:28:48', '2020-06-16 03:28:48'),
(778, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:28:48', '2020-06-16 03:28:48'),
(779, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:08', '2020-06-16 03:29:08'),
(780, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:11', '2020-06-16 03:29:11'),
(781, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:19', '2020-06-16 03:29:19'),
(782, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:19', '2020-06-16 03:29:19'),
(783, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:39', '2020-06-16 03:29:39'),
(784, 2, 'sc_admin/auth/setting', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:54', '2020-06-16 03:29:54'),
(785, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:29:55', '2020-06-16 03:29:55'),
(786, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-16 03:30:10', '2020-06-16 03:30:10'),
(787, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592278211269\"}', '2020-06-16 03:30:11', '2020-06-16 03:30:11'),
(788, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592278211270\"}', '2020-06-16 03:30:11', '2020-06-16 03:30:11'),
(789, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592278211271\"}', '2020-06-16 03:30:11', '2020-06-16 03:30:11'),
(790, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:30:13', '2020-06-16 03:30:13'),
(791, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:30:14', '2020-06-16 03:30:14'),
(792, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:30:16', '2020-06-16 03:30:16'),
(793, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:30:23', '2020-06-16 03:30:23'),
(794, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:30:44', '2020-06-16 03:30:44'),
(795, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__desc\",\"_pjax\":\"#pjax-container\"}', '2020-06-16 03:32:06', '2020-06-16 03:32:06'),
(796, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__desc\",\"_pjax\":\"#pjax-container\"}', '2020-06-16 03:32:06', '2020-06-16 03:32:06'),
(797, 2, 'sc_admin/template', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:03', '2020-06-16 03:33:03'),
(798, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:03', '2020-06-16 03:33:03'),
(799, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:16', '2020-06-16 03:33:16'),
(800, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:17', '2020-06-16 03:33:17'),
(801, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:17', '2020-06-16 03:33:17'),
(802, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:28', '2020-06-16 03:33:28'),
(803, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:31', '2020-06-16 03:33:31'),
(804, 1, 'sc_admin/role/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\'s User\",\"slug\":\"provider-user\",\"permission\":[\"2\",\"23\"],\"administrators\":[\"2\"],\"_token\":\"PmHXHfDSS0n2s6pCzNXZaVFJt8QiWgIPE9CrD8av\"}', '2020-06-16 03:33:36', '2020-06-16 03:33:36'),
(805, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:37', '2020-06-16 03:33:37'),
(806, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:33:40', '2020-06-16 03:33:40'),
(807, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:34:40', '2020-06-16 03:34:40'),
(808, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:35:34', '2020-06-16 03:35:34'),
(809, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:35:41', '2020-06-16 03:35:41'),
(810, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:35:52', '2020-06-16 03:35:52'),
(811, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:37:49', '2020-06-16 03:37:49'),
(812, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:37:59', '2020-06-16 03:37:59'),
(813, 1, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:38:02', '2020-06-16 03:38:02'),
(814, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:38:10', '2020-06-16 03:38:10'),
(815, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:38:11', '2020-06-16 03:38:11'),
(816, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:38:13', '2020-06-16 03:38:13'),
(817, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:39:31', '2020-06-16 03:39:31'),
(818, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:39:33', '2020-06-16 03:39:33'),
(819, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:39:42', '2020-06-16 03:39:42'),
(820, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:39:44', '2020-06-16 03:39:44'),
(821, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:40:46', '2020-06-16 03:40:46'),
(822, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:40:48', '2020-06-16 03:40:48'),
(823, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:00', '2020-06-16 03:41:00'),
(824, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:36', '2020-06-16 03:41:36'),
(825, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:39', '2020-06-16 03:41:39'),
(826, 2, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:40', '2020-06-16 03:41:40'),
(827, 2, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:43', '2020-06-16 03:41:43'),
(828, 2, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:41:45', '2020-06-16 03:41:45'),
(829, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:42:03', '2020-06-16 03:42:03'),
(830, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:42:04', '2020-06-16 03:42:04'),
(831, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:42:05', '2020-06-16 03:42:05'),
(832, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:42:59', '2020-06-16 03:42:59'),
(833, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:43:00', '2020-06-16 03:43:00'),
(834, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:43:11', '2020-06-16 03:43:11'),
(835, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:48:35', '2020-06-16 03:48:35'),
(836, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 03:50:22', '2020-06-16 03:50:22'),
(837, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:04:58', '2020-06-16 04:04:58'),
(838, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:05:14', '2020-06-16 04:05:14'),
(839, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:09:58', '2020-06-16 04:09:58'),
(840, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:11:04', '2020-06-16 04:11:04'),
(841, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:11:18', '2020-06-16 04:11:18'),
(842, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:12:14', '2020-06-16 04:12:14'),
(843, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:12:16', '2020-06-16 04:12:16'),
(844, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:13:37', '2020-06-16 04:13:37'),
(845, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:13:50', '2020-06-16 04:13:50'),
(846, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:14:04', '2020-06-16 04:14:04'),
(847, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:14:26', '2020-06-16 04:14:26'),
(848, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:14:47', '2020-06-16 04:14:47'),
(849, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:15:11', '2020-06-16 04:15:11'),
(850, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:15:15', '2020-06-16 04:15:15'),
(851, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:15:18', '2020-06-16 04:15:18'),
(852, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:17:13', '2020-06-16 04:17:13'),
(853, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:17:25', '2020-06-16 04:17:25'),
(854, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":null,\"alias\":\"provider-22\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"S\\u01a1n La\",\"district\":\"Huy\\u1ec7n M\\u01b0\\u1eddng La\",\"ward\":\"X\\u00e3 Chi\\u1ec1ng Lao\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"zzeYtgwcCKh8us7lHcWMjCWGTPPFH9ZTAPltTngq\"}', '2020-06-16 04:17:36', '2020-06-16 04:17:36'),
(855, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:17:36', '2020-06-16 04:17:36'),
(856, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:05', '2020-06-16 04:21:05'),
(857, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:07', '2020-06-16 04:21:07'),
(858, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:17', '2020-06-16 04:21:17'),
(859, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:22', '2020-06-16 04:21:22'),
(860, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:36', '2020-06-16 04:21:36'),
(861, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:21:37', '2020-06-16 04:21:37'),
(862, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:23:52', '2020-06-16 04:23:52'),
(863, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:23:59', '2020-06-16 04:23:59'),
(864, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:24:25', '2020-06-16 04:24:25'),
(865, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:26:13', '2020-06-16 04:26:13'),
(866, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:27:01', '2020-06-16 04:27:01'),
(867, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:29:23', '2020-06-16 04:29:23'),
(868, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:29:39', '2020-06-16 04:29:39'),
(869, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:29:41', '2020-06-16 04:29:41'),
(870, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:29:55', '2020-06-16 04:29:55'),
(871, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:25', '2020-06-16 04:30:25'),
(872, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:27', '2020-06-16 04:30:27'),
(873, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:33', '2020-06-16 04:30:33'),
(874, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:34', '2020-06-16 04:30:34'),
(875, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:55', '2020-06-16 04:30:55'),
(876, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:30:58', '2020-06-16 04:30:58'),
(877, 2, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:31:03', '2020-06-16 04:31:03'),
(878, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:32:14', '2020-06-16 04:32:14'),
(879, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:32:16', '2020-06-16 04:32:16'),
(880, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:32:22', '2020-06-16 04:32:22'),
(881, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:32:24', '2020-06-16 04:32:24'),
(882, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:32:29', '2020-06-16 04:32:29'),
(883, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Only\",\"slug\":\"provider-only\",\"http_uri\":[\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\"],\"_token\":\"zzeYtgwcCKh8us7lHcWMjCWGTPPFH9ZTAPltTngq\"}', '2020-06-16 04:33:00', '2020-06-16 04:33:00'),
(884, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:33:00', '2020-06-16 04:33:00'),
(885, 2, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:33:02', '2020-06-16 04:33:02'),
(886, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:33:04', '2020-06-16 04:33:04'),
(887, 2, 'sc_admin/provider/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"1\",\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\"}', '2020-06-16 04:33:09', '2020-06-16 04:33:09'),
(888, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-16 04:33:09', '2020-06-16 04:33:09'),
(889, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:33:11', '2020-06-16 04:33:11'),
(890, 2, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:33:13', '2020-06-16 04:33:13'),
(891, 2, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:36:19', '2020-06-16 04:36:19'),
(892, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:36:22', '2020-06-16 04:36:22'),
(893, 2, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:36:23', '2020-06-16 04:36:23'),
(894, 2, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:36:26', '2020-06-16 04:36:26'),
(895, 2, 'sc_admin/provider/edit/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:36:31', '2020-06-16 04:36:31'),
(896, 2, 'sc_admin/provider/show/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:34', '2020-06-16 04:37:34'),
(897, 2, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:36', '2020-06-16 04:37:36'),
(898, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:45', '2020-06-16 04:37:45'),
(899, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:45', '2020-06-16 04:37:45'),
(900, 2, 'sc_admin/news', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:56', '2020-06-16 04:37:56'),
(901, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:37:56', '2020-06-16 04:37:56'),
(902, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:38:01', '2020-06-16 04:38:01'),
(903, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:38:51', '2020-06-16 04:38:51'),
(904, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:38:54', '2020-06-16 04:38:54'),
(905, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Only\",\"slug\":\"provider-only\",\"http_uri\":[\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\"],\"_token\":\"zzeYtgwcCKh8us7lHcWMjCWGTPPFH9ZTAPltTngq\"}', '2020-06-16 04:40:38', '2020-06-16 04:40:38'),
(906, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:40:38', '2020-06-16 04:40:38'),
(907, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:41:01', '2020-06-16 04:41:01'),
(908, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:41:04', '2020-06-16 04:41:04'),
(909, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:42:03', '2020-06-16 04:42:03'),
(910, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:44:36', '2020-06-16 04:44:36'),
(911, 1, 'sc_admin/order/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:44:37', '2020-06-16 04:44:37'),
(912, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:44:41', '2020-06-16 04:44:41'),
(913, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:45:56', '2020-06-16 04:45:56'),
(914, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:46:11', '2020-06-16 04:46:11'),
(915, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:46:42', '2020-06-16 04:46:42'),
(916, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:47:33', '2020-06-16 04:47:33'),
(917, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:47:40', '2020-06-16 04:47:40'),
(918, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:49:15', '2020-06-16 04:49:15'),
(919, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:49:23', '2020-06-16 04:49:23'),
(920, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:49:25', '2020-06-16 04:49:25'),
(921, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 04:59:31', '2020-06-16 04:59:31'),
(922, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:47:51', '2020-06-16 05:47:51'),
(923, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:47:57', '2020-06-16 05:47:57'),
(924, 2, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:48:02', '2020-06-16 05:48:02'),
(925, 2, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:49:33', '2020-06-16 05:49:33'),
(926, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:49:42', '2020-06-16 05:49:42'),
(927, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:49:44', '2020-06-16 05:49:44'),
(928, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"comment\",\"value\":\"oksdf\",\"pk\":\"1\",\"_token\":\"zzeYtgwcCKh8us7lHcWMjCWGTPPFH9ZTAPltTngq\"}', '2020-06-16 05:51:46', '2020-06-16 05:51:46'),
(929, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 05:51:48', '2020-06-16 05:51:48'),
(930, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:14', '2020-06-16 06:39:14'),
(931, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:18', '2020-06-16 06:39:18'),
(932, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"comment\",\"value\":\"Graham LLCasdads\",\"pk\":\"2\",\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\"}', '2020-06-16 06:39:23', '2020-06-16 06:39:23'),
(933, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:24', '2020-06-16 06:39:24'),
(934, 2, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:29', '2020-06-16 06:39:29'),
(935, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:32', '2020-06-16 06:39:32'),
(936, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"comment\",\"value\":\"Graham\",\"pk\":\"2\",\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\"}', '2020-06-16 06:39:42', '2020-06-16 06:39:42'),
(937, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:44', '2020-06-16 06:39:44'),
(938, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:39:46', '2020-06-16 06:39:46'),
(939, 2, 'sc_admin/order/product_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"id\":\"12\",\"order_id\":\"2\"}', '2020-06-16 06:40:26', '2020-06-16 06:40:26'),
(940, 2, 'sc_admin/order/product_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"id\":\"10\",\"order_id\":\"2\"}', '2020-06-16 06:40:27', '2020-06-16 06:40:27'),
(941, 2, 'sc_admin/order/product_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"id\":\"17\",\"order_id\":\"2\"}', '2020-06-16 06:40:31', '2020-06-16 06:40:31'),
(942, 2, 'sc_admin/order/product_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"id\":\"8\",\"order_id\":\"2\"}', '2020-06-16 06:40:37', '2020-06-16 06:40:37'),
(943, 2, 'sc_admin/order/add_item', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\",\"order_id\":\"2\",\"add_id\":[\"8\",\"0\"],\"add_price\":[\"15000\",\"0\"],\"add_qty\":[\"1\",\"0\"],\"add_tax\":[\"0\",\"0\"]}', '2020-06-16 06:40:40', '2020-06-16 06:40:40'),
(944, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:40:44', '2020-06-16 06:40:44'),
(945, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:40:58', '2020-06-16 06:40:58'),
(946, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:41:00', '2020-06-16 06:41:00'),
(947, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:41:06', '2020-06-16 06:41:06'),
(948, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:41:08', '2020-06-16 06:41:08'),
(949, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:41:28', '2020-06-16 06:41:28'),
(950, 2, 'sc_admin/order/export_detail', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"order_id\":\"2\",\"type\":\"invoice\"}', '2020-06-16 06:41:41', '2020-06-16 06:41:41');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(951, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"payment_status\",\"value\":\"2\",\"pk\":\"2\",\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\"}', '2020-06-16 06:42:11', '2020-06-16 06:42:11'),
(952, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:42:12', '2020-06-16 06:42:12'),
(953, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:42:44', '2020-06-16 06:42:44'),
(954, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:43:10', '2020-06-16 06:43:10'),
(955, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:43:14', '2020-06-16 06:43:14'),
(956, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:45:55', '2020-06-16 06:45:55'),
(957, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:05', '2020-06-16 06:46:05'),
(958, 2, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:07', '2020-06-16 06:46:07'),
(959, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:11', '2020-06-16 06:46:11'),
(960, 2, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:12', '2020-06-16 06:46:12'),
(961, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:13', '2020-06-16 06:46:13'),
(962, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:46:15', '2020-06-16 06:46:15'),
(963, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:49:16', '2020-06-16 06:49:16'),
(964, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:49:20', '2020-06-16 06:49:20'),
(965, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:49:22', '2020-06-16 06:49:22'),
(966, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:49:24', '2020-06-16 06:49:24'),
(967, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:55:45', '2020-06-16 06:55:45'),
(968, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:55:58', '2020-06-16 06:55:58'),
(969, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:17', '2020-06-16 06:58:17'),
(970, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:19', '2020-06-16 06:58:19'),
(971, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:22', '2020-06-16 06:58:22'),
(972, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:27', '2020-06-16 06:58:27'),
(973, 2, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:29', '2020-06-16 06:58:29'),
(974, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:31', '2020-06-16 06:58:31'),
(975, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:39', '2020-06-16 06:58:39'),
(976, 2, 'sc_admin/order/product_info', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"id\":\"12\",\"order_id\":\"2\"}', '2020-06-16 06:58:43', '2020-06-16 06:58:43'),
(977, 2, 'sc_admin/order/add_item', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\",\"order_id\":\"2\",\"add_id\":[\"12\"],\"add_price\":[\"15000\"],\"add_qty\":[\"1\"],\"add_tax\":[\"0\"]}', '2020-06-16 06:58:43', '2020-06-16 06:58:43'),
(978, 2, 'sc_admin/order/delete_item', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"pId\":\"2\",\"_token\":\"uIEKU2lLkLJQ9rnSKf9tJMLFo5fej7naj76ro7xs\"}', '2020-06-16 06:58:46', '2020-06-16 06:58:46'),
(979, 2, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 06:58:51', '2020-06-16 06:58:51'),
(980, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":\"asd\",\"search\":null}', '2020-06-16 06:58:58', '2020-06-16 06:58:58'),
(981, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"keyword\":\"asd\",\"search\":null}', '2020-06-16 07:01:58', '2020-06-16 07:01:58'),
(982, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:02:11', '2020-06-16 07:02:11'),
(983, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:04:18', '2020-06-16 07:04:18'),
(984, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:06:57', '2020-06-16 07:06:57'),
(985, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:37', '2020-06-16 07:07:37'),
(986, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:42', '2020-06-16 07:07:42'),
(987, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:45', '2020-06-16 07:07:45'),
(988, 2, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:50', '2020-06-16 07:07:50'),
(989, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:50', '2020-06-16 07:07:50'),
(990, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:51', '2020-06-16 07:07:51'),
(991, 2, 'sc_admin/provider/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:58', '2020-06-16 07:07:58'),
(992, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:07:58', '2020-06-16 07:07:58'),
(993, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:08:08', '2020-06-16 07:08:08'),
(994, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:08:09', '2020-06-16 07:08:09'),
(995, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:08:12', '2020-06-16 07:08:12'),
(996, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:09:11', '2020-06-16 07:09:11'),
(997, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:09:27', '2020-06-16 07:09:27'),
(998, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:10:13', '2020-06-16 07:10:13'),
(999, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:21:14', '2020-06-16 07:21:14'),
(1000, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:21:59', '2020-06-16 07:21:59'),
(1001, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:22:36', '2020-06-16 07:22:36'),
(1002, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:22:44', '2020-06-16 07:22:44'),
(1003, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:23:05', '2020-06-16 07:23:05'),
(1004, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:23:07', '2020-06-16 07:23:07'),
(1005, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:23:11', '2020-06-16 07:23:11'),
(1006, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:23:19', '2020-06-16 07:23:19'),
(1007, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:25:58', '2020-06-16 07:25:58'),
(1008, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:26:04', '2020-06-16 07:26:04'),
(1009, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:27:44', '2020-06-16 07:27:44'),
(1010, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:28:17', '2020-06-16 07:28:17'),
(1011, 1, 'sc_admin/provider/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:28:19', '2020-06-16 07:28:19'),
(1012, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:42:39', '2020-06-16 07:42:39'),
(1013, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:01', '2020-06-16 07:43:01'),
(1014, 1, 'sc_admin/provider/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:06', '2020-06-16 07:43:06'),
(1015, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:08', '2020-06-16 07:43:08'),
(1016, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-22\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n Tam \\u0110\\u01b0\\u1eddng\",\"ward\":\"X\\u00e3 Th\\u00e8n Sin\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"CRFkWAwCX4mY8Te06nx0lxVNbn30WhqoeVdyKEQh\"}', '2020-06-16 07:43:23', '2020-06-16 07:43:23'),
(1017, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:23', '2020-06-16 07:43:23'),
(1018, 1, 'sc_admin/provider/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 2\",\"alias\":\"provider-2\",\"email\":\"tempmail62501@emailna.co\",\"phone\":\"0995721445\",\"province\":\"Lai Ch\\u00e2u\",\"district\":\"Huy\\u1ec7n Tam \\u0110\\u01b0\\u1eddng\",\"ward\":\"X\\u00e3 Th\\u00e8n Sin\",\"address\":\"0099 Padberg Alley\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/intro-4.png\",\"cover\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/provider-avatar\\/p1.jpg\",\"type\":\"1\",\"_token\":\"CRFkWAwCX4mY8Te06nx0lxVNbn30WhqoeVdyKEQh\"}', '2020-06-16 07:43:27', '2020-06-16 07:43:27'),
(1019, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:27', '2020-06-16 07:43:27'),
(1020, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:43:58', '2020-06-16 07:43:58'),
(1021, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:44:03', '2020-06-16 07:44:03'),
(1022, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:44:07', '2020-06-16 07:44:07'),
(1023, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:44:09', '2020-06-16 07:44:09'),
(1024, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:45:24', '2020-06-16 07:45:24'),
(1025, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:30', '2020-06-16 07:47:30'),
(1026, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:33', '2020-06-16 07:47:33'),
(1027, 1, 'sc_admin/news', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:35', '2020-06-16 07:47:35'),
(1028, 1, 'sc_admin/news/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:37', '2020-06-16 07:47:37'),
(1029, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:45', '2020-06-16 07:47:45'),
(1030, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:46', '2020-06-16 07:47:46'),
(1031, 1, 'sc_admin/product', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:51', '2020-06-16 07:47:51'),
(1032, 1, 'sc_admin/product/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:47:52', '2020-06-16 07:47:52'),
(1033, 1, 'sc_admin/auth/login', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:49:07', '2020-06-16 07:49:07'),
(1034, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:49:14', '2020-06-16 07:49:14'),
(1035, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:49:16', '2020-06-16 07:49:16'),
(1036, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:51:21', '2020-06-16 07:51:21'),
(1037, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:53:24', '2020-06-16 07:53:24'),
(1038, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"1\",\"_token\":\"CRFkWAwCX4mY8Te06nx0lxVNbn30WhqoeVdyKEQh\"}', '2020-06-16 07:53:30', '2020-06-16 07:53:30'),
(1039, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:53:30', '2020-06-16 07:53:30'),
(1040, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:53:47', '2020-06-16 07:53:47'),
(1041, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:53:52', '2020-06-16 07:53:52'),
(1042, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:53:57', '2020-06-16 07:53:57'),
(1043, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:54:05', '2020-06-16 07:54:05'),
(1044, 2, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:54:49', '2020-06-16 07:54:49'),
(1045, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:54:49', '2020-06-16 07:54:49'),
(1046, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:54:53', '2020-06-16 07:54:53'),
(1047, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:54:56', '2020-06-16 07:54:56'),
(1048, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:55:00', '2020-06-16 07:55:00'),
(1049, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:55:01', '2020-06-16 07:55:01'),
(1050, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"1\",\"_token\":\"fhuRtRtg8e1oJyLF3LZooz771QrBiRaiDRHez9qp\"}', '2020-06-16 07:55:05', '2020-06-16 07:55:05'),
(1051, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:55:05', '2020-06-16 07:55:05'),
(1052, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:55:07', '2020-06-16 07:55:07'),
(1053, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"1\",\"_token\":\"fhuRtRtg8e1oJyLF3LZooz771QrBiRaiDRHez9qp\"}', '2020-06-16 07:56:17', '2020-06-16 07:56:17'),
(1054, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"1\",\"_token\":\"fhuRtRtg8e1oJyLF3LZooz771QrBiRaiDRHez9qp\"}', '2020-06-16 07:56:23', '2020-06-16 07:56:23'),
(1055, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:56:23', '2020-06-16 07:56:23'),
(1056, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:56:25', '2020-06-16 07:56:25'),
(1057, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:57:22', '2020-06-16 07:57:22'),
(1058, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:57:29', '2020-06-16 07:57:29'),
(1059, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:58:43', '2020-06-16 07:58:43'),
(1060, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:00', '2020-06-16 07:59:00'),
(1061, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:11', '2020-06-16 07:59:11'),
(1062, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:20', '2020-06-16 07:59:20'),
(1063, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"dayne_rohan52\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"_token\":\"fhuRtRtg8e1oJyLF3LZooz771QrBiRaiDRHez9qp\"}', '2020-06-16 07:59:24', '2020-06-16 07:59:24'),
(1064, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:24', '2020-06-16 07:59:24'),
(1065, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:31', '2020-06-16 07:59:31'),
(1066, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:35', '2020-06-16 07:59:35'),
(1067, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:44', '2020-06-16 07:59:44'),
(1068, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 07:59:45', '2020-06-16 07:59:45'),
(1069, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:06', '2020-06-16 09:54:06'),
(1070, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:14', '2020-06-16 09:54:14'),
(1071, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:18', '2020-06-16 09:54:18'),
(1072, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:30', '2020-06-16 09:54:30'),
(1073, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:34', '2020-06-16 09:54:34'),
(1074, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:49', '2020-06-16 09:54:49'),
(1075, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:54:54', '2020-06-16 09:54:54'),
(1076, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"3\",\"pk\":\"3\",\"_token\":\"W6s12mANeQTOpU3xwXJDRSgct2qsYbIkvDJmOm3O\"}', '2020-06-16 09:55:13', '2020-06-16 09:55:13'),
(1077, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:55:15', '2020-06-16 09:55:15'),
(1078, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:56:31', '2020-06-16 09:56:31'),
(1079, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:56:43', '2020-06-16 09:56:43'),
(1080, 2, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:56:45', '2020-06-16 09:56:45'),
(1081, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:57:52', '2020-06-16 09:57:52'),
(1082, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:19', '2020-06-16 09:58:19'),
(1083, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:23', '2020-06-16 09:58:23'),
(1084, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:26', '2020-06-16 09:58:26'),
(1085, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:30', '2020-06-16 09:58:30'),
(1086, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:34', '2020-06-16 09:58:34'),
(1087, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 09:58:48', '2020-06-16 09:58:48'),
(1088, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 10:02:04', '2020-06-16 10:02:04'),
(1089, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 10:16:31', '2020-06-16 10:16:31'),
(1090, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-16 10:16:37', '2020-06-16 10:16:37'),
(1091, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:29:12', '2020-06-17 02:29:12'),
(1092, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:29:14', '2020-06-17 02:29:14'),
(1093, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:29:16', '2020-06-17 02:29:16'),
(1094, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:30:34', '2020-06-17 02:30:34'),
(1095, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:30:39', '2020-06-17 02:30:39'),
(1096, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:31:03', '2020-06-17 02:31:03'),
(1097, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:31:05', '2020-06-17 02:31:05'),
(1098, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:31:51', '2020-06-17 02:31:51'),
(1099, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:36:04', '2020-06-17 02:36:04'),
(1100, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 02:37:03', '2020-06-17 02:37:03'),
(1101, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:00:44', '2020-06-17 03:00:44'),
(1102, 1, 'sc_admin/order_status/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:01:59', '2020-06-17 03:01:59'),
(1103, 1, 'sc_admin/order_status/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Kh\\u1edfi t\\u1ea1o\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:02:17', '2020-06-17 03:02:17'),
(1104, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:02:17', '2020-06-17 03:02:17'),
(1105, 1, 'sc_admin/order_status/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:02:28', '2020-06-17 03:02:28'),
(1106, 1, 'sc_admin/order_status/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"X\\u00e1c nh\\u1eadn\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:02:33', '2020-06-17 03:02:33'),
(1107, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:02:33', '2020-06-17 03:02:33'),
(1108, 1, 'sc_admin/order_status/edit/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:02:56', '2020-06-17 03:02:56'),
(1109, 1, 'sc_admin/order_status/edit/3', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Ph\\u00ea duy\\u1ec7t\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:03:01', '2020-06-17 03:03:01'),
(1110, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:03:01', '2020-06-17 03:03:01'),
(1111, 1, 'sc_admin/order_status/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:08:18', '2020-06-17 03:08:18'),
(1112, 1, 'sc_admin/order_status/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"\\u0110ang th\\u1ef1c hi\\u1ec7n\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:08:24', '2020-06-17 03:08:24'),
(1113, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:08:24', '2020-06-17 03:08:24'),
(1114, 1, 'sc_admin/order_status/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:08:58', '2020-06-17 03:08:58'),
(1115, 1, 'sc_admin/order_status/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:10', '2020-06-17 03:09:10'),
(1116, 1, 'sc_admin/order_status/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Ho\\u00e0n th\\u00e0nh\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:09:14', '2020-06-17 03:09:14'),
(1117, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:15', '2020-06-17 03:09:15'),
(1118, 1, 'sc_admin/order_status/edit/6', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:16', '2020-06-17 03:09:16'),
(1119, 1, 'sc_admin/order_status/edit/6', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"H\\u1ee7y b\\u1ecf\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:09:28', '2020-06-17 03:09:28'),
(1120, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:28', '2020-06-17 03:09:28'),
(1121, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:31', '2020-06-17 03:09:31'),
(1122, 1, 'sc_admin/order_status/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"L\\u1ed7i th\\u1ef1c hi\\u1ec7n\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:09:40', '2020-06-17 03:09:40'),
(1123, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:40', '2020-06-17 03:09:40'),
(1124, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:46', '2020-06-17 03:09:46'),
(1125, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"4\",\"pk\":\"1\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:09:57', '2020-06-17 03:09:57'),
(1126, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:09:58', '2020-06-17 03:09:58'),
(1127, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:10:05', '2020-06-17 03:10:05'),
(1128, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:10:35', '2020-06-17 03:10:35'),
(1129, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:10:40', '2020-06-17 03:10:40'),
(1130, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:12:16', '2020-06-17 03:12:16'),
(1131, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:12:49', '2020-06-17 03:12:49'),
(1132, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"6\",\"pk\":\"1\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:13:05', '2020-06-17 03:13:05'),
(1133, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:13:08', '2020-06-17 03:13:08'),
(1134, 1, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"7\",\"pk\":\"1\",\"_token\":\"onuTIYHbyiZjbWoh5TR2cnUH8nURnkDYlMHPGuke\"}', '2020-06-17 03:13:22', '2020-06-17 03:13:22'),
(1135, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:13:24', '2020-06-17 03:13:24'),
(1136, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:14:02', '2020-06-17 03:14:02'),
(1137, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:14:42', '2020-06-17 03:14:42'),
(1138, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:14:48', '2020-06-17 03:14:48'),
(1139, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:14:50', '2020-06-17 03:14:50'),
(1140, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:15:33', '2020-06-17 03:15:33'),
(1141, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:16:49', '2020-06-17 03:16:49'),
(1142, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:16:51', '2020-06-17 03:16:51'),
(1143, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:17:51', '2020-06-17 03:17:51'),
(1144, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:17:53', '2020-06-17 03:17:53'),
(1145, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:25:42', '2020-06-17 03:25:42'),
(1146, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:25:58', '2020-06-17 03:25:58'),
(1147, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:27:22', '2020-06-17 03:27:22'),
(1148, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:28:47', '2020-06-17 03:28:47'),
(1149, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:36:28', '2020-06-17 03:36:28'),
(1150, 1, 'sc_admin/subscribe', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:37:10', '2020-06-17 03:37:10'),
(1151, 1, 'sc_admin/customer_config', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:37:14', '2020-06-17 03:37:14'),
(1152, 1, 'sc_admin/customer', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:37:15', '2020-06-17 03:37:15'),
(1153, 1, 'sc_admin/customer/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:37:27', '2020-06-17 03:37:27'),
(1154, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:38:10', '2020-06-17 03:38:10');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1155, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:38:12', '2020-06-17 03:38:12'),
(1156, 1, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:38:44', '2020-06-17 03:38:44'),
(1157, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:39:38', '2020-06-17 03:39:38'),
(1158, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:39:42', '2020-06-17 03:39:42'),
(1159, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:39:50', '2020-06-17 03:39:50'),
(1160, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:42:46', '2020-06-17 03:42:46'),
(1161, 1, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:42:50', '2020-06-17 03:42:50'),
(1162, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:43:41', '2020-06-17 03:43:41'),
(1163, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:43:43', '2020-06-17 03:43:43'),
(1164, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:45:50', '2020-06-17 03:45:50'),
(1165, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:46:17', '2020-06-17 03:46:17'),
(1166, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:46:29', '2020-06-17 03:46:29'),
(1167, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:46:33', '2020-06-17 03:46:33'),
(1168, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:47:17', '2020-06-17 03:47:17'),
(1169, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:47:23', '2020-06-17 03:47:23'),
(1170, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:47:42', '2020-06-17 03:47:42'),
(1171, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:49:02', '2020-06-17 03:49:02'),
(1172, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:49:17', '2020-06-17 03:49:17'),
(1173, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:50:23', '2020-06-17 03:50:23'),
(1174, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:50:30', '2020-06-17 03:50:30'),
(1175, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:50:34', '2020-06-17 03:50:34'),
(1176, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:51:04', '2020-06-17 03:51:04'),
(1177, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:52:01', '2020-06-17 03:52:01'),
(1178, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:52:37', '2020-06-17 03:52:37'),
(1179, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:52:48', '2020-06-17 03:52:48'),
(1180, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:53:52', '2020-06-17 03:53:52'),
(1181, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:54:02', '2020-06-17 03:54:02'),
(1182, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:54:35', '2020-06-17 03:54:35'),
(1183, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:55:55', '2020-06-17 03:55:55'),
(1184, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:55:57', '2020-06-17 03:55:57'),
(1185, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:56:56', '2020-06-17 03:56:56'),
(1186, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:21', '2020-06-17 03:58:21'),
(1187, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:23', '2020-06-17 03:58:23'),
(1188, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:25', '2020-06-17 03:58:25'),
(1189, 1, 'sc_admin/user/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:26', '2020-06-17 03:58:26'),
(1190, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:30', '2020-06-17 03:58:30'),
(1191, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:33', '2020-06-17 03:58:33'),
(1192, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:45', '2020-06-17 03:58:45'),
(1193, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 03:58:47', '2020-06-17 03:58:47'),
(1194, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:11', '2020-06-17 07:39:11'),
(1195, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:30', '2020-06-17 07:39:30'),
(1196, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:32', '2020-06-17 07:39:32'),
(1197, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"type\":\"2\",\"_token\":\"qYMAzUHv3Mv9vwSdHb0Y5PkMVlGHSKLajbOfty2M\"}', '2020-06-17 07:39:40', '2020-06-17 07:39:40'),
(1198, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:40', '2020-06-17 07:39:40'),
(1199, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:45', '2020-06-17 07:39:45'),
(1200, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:39:48', '2020-06-17 07:39:48'),
(1201, 2, 'sc_admin/block_content', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:41:43', '2020-06-17 07:41:43'),
(1202, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:41:43', '2020-06-17 07:41:43'),
(1203, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:59:16', '2020-06-17 07:59:16'),
(1204, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:59:24', '2020-06-17 07:59:24'),
(1205, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:59:43', '2020-06-17 07:59:43'),
(1206, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 07:59:59', '2020-06-17 07:59:59'),
(1207, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:00:21', '2020-06-17 08:00:21'),
(1208, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:01:00', '2020-06-17 08:01:00'),
(1209, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:01:12', '2020-06-17 08:01:12'),
(1210, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:07:28', '2020-06-17 08:07:28'),
(1211, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:07:44', '2020-06-17 08:07:44'),
(1212, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:10:55', '2020-06-17 08:10:55'),
(1213, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:15:08', '2020-06-17 08:15:08'),
(1214, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:15:18', '2020-06-17 08:15:18'),
(1215, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:15:27', '2020-06-17 08:15:27'),
(1216, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:17:47', '2020-06-17 08:17:47'),
(1217, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:18:43', '2020-06-17 08:18:43'),
(1218, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:20:54', '2020-06-17 08:20:54'),
(1219, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:21:42', '2020-06-17 08:21:42'),
(1220, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:37:31', '2020-06-17 08:37:31'),
(1221, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:37:39', '2020-06-17 08:37:39'),
(1222, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:37:39', '2020-06-17 08:37:39'),
(1223, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:37:49', '2020-06-17 08:37:49'),
(1224, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:42:25', '2020-06-17 08:42:25'),
(1225, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:42:50', '2020-06-17 08:42:50'),
(1226, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:43:10', '2020-06-17 08:43:10'),
(1227, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:43:39', '2020-06-17 08:43:39'),
(1228, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:44:12', '2020-06-17 08:44:12'),
(1229, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:44:31', '2020-06-17 08:44:31'),
(1230, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:44:45', '2020-06-17 08:44:45'),
(1231, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:45:07', '2020-06-17 08:45:07'),
(1232, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:47:29', '2020-06-17 08:47:29'),
(1233, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:48:10', '2020-06-17 08:48:10'),
(1234, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:49:23', '2020-06-17 08:49:23'),
(1235, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:52:37', '2020-06-17 08:52:37'),
(1236, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:52:55', '2020-06-17 08:52:55'),
(1237, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:57:50', '2020-06-17 08:57:50'),
(1238, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:57:51', '2020-06-17 08:57:51'),
(1239, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 08:57:53', '2020-06-17 08:57:53'),
(1240, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:00:49', '2020-06-17 09:00:49'),
(1241, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:02:42', '2020-06-17 09:02:42'),
(1242, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:02:44', '2020-06-17 09:02:44'),
(1243, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:02:45', '2020-06-17 09:02:45'),
(1244, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:03:21', '2020-06-17 09:03:21'),
(1245, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:03:26', '2020-06-17 09:03:26'),
(1246, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:03:45', '2020-06-17 09:03:45'),
(1247, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:03:49', '2020-06-17 09:03:49'),
(1248, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:03:54', '2020-06-17 09:03:54'),
(1249, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:03:55', '2020-06-17 09:03:55'),
(1250, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:10:50', '2020-06-17 09:10:50'),
(1251, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:12:03', '2020-06-17 09:12:03'),
(1252, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:12:06', '2020-06-17 09:12:06'),
(1253, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:12:09', '2020-06-17 09:12:09'),
(1254, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:12:14', '2020-06-17 09:12:14'),
(1255, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:12:17', '2020-06-17 09:12:17'),
(1256, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:26:43', '2020-06-17 09:26:43'),
(1257, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:26:47', '2020-06-17 09:26:47'),
(1258, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:26:47', '2020-06-17 09:26:47'),
(1259, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:26:57', '2020-06-17 09:26:57'),
(1260, 2, 'sc_admin/order/update', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"status\",\"value\":\"1\",\"pk\":\"4\",\"_token\":\"LT2KM14kNtQVVr2Wt0TlcEK9krNC5LWXZv43fJEL\"}', '2020-06-17 09:27:01', '2020-06-17 09:27:01'),
(1261, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 09:27:07', '2020-06-17 09:27:07'),
(1262, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:20:32', '2020-06-17 10:20:32'),
(1263, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:20:45', '2020-06-17 10:20:45'),
(1264, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:21:46', '2020-06-17 10:21:46'),
(1265, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:22:10', '2020-06-17 10:22:10'),
(1266, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:22:36', '2020-06-17 10:22:36'),
(1267, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:22:42', '2020-06-17 10:22:42'),
(1268, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:23:32', '2020-06-17 10:23:32'),
(1269, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:24:07', '2020-06-17 10:24:07'),
(1270, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:24:54', '2020-06-17 10:24:54'),
(1271, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:25:02', '2020-06-17 10:25:02'),
(1272, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:25:11', '2020-06-17 10:25:11'),
(1273, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:25:18', '2020-06-17 10:25:18'),
(1274, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:25:55', '2020-06-17 10:25:55'),
(1275, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:26:48', '2020-06-17 10:26:48'),
(1276, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:26:56', '2020-06-17 10:26:56'),
(1277, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:27:02', '2020-06-17 10:27:02'),
(1278, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:27:43', '2020-06-17 10:27:43'),
(1279, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:27:55', '2020-06-17 10:27:55'),
(1280, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:28:00', '2020-06-17 10:28:00'),
(1281, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:28:05', '2020-06-17 10:28:05'),
(1282, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:28:27', '2020-06-17 10:28:27'),
(1283, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:28:35', '2020-06-17 10:28:35'),
(1284, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:29:27', '2020-06-17 10:29:27'),
(1285, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:29:43', '2020-06-17 10:29:43'),
(1286, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:29:59', '2020-06-17 10:29:59'),
(1287, 2, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:04', '2020-06-17 10:35:04'),
(1288, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:04', '2020-06-17 10:35:04'),
(1289, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:06', '2020-06-17 10:35:06'),
(1290, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:29', '2020-06-17 10:35:29'),
(1291, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:56', '2020-06-17 10:35:56'),
(1292, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:35:57', '2020-06-17 10:35:57'),
(1293, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:36:09', '2020-06-17 10:36:09'),
(1294, 2, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:36:16', '2020-06-17 10:36:16'),
(1295, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:39:27', '2020-06-17 10:39:27'),
(1296, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:39:30', '2020-06-17 10:39:30'),
(1297, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:39:33', '2020-06-17 10:39:33'),
(1298, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-17 10:39:37', '2020-06-17 10:39:37'),
(1299, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 01:15:41', '2020-06-18 01:15:41'),
(1300, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 01:48:59', '2020-06-18 01:48:59'),
(1301, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 03:18:01', '2020-06-18 03:18:01'),
(1302, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 04:07:13', '2020-06-18 04:07:13'),
(1303, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 04:07:15', '2020-06-18 04:07:15'),
(1304, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-18 04:23:03', '2020-06-18 04:23:03'),
(1305, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592454185259\"}', '2020-06-18 04:23:05', '2020-06-18 04:23:05'),
(1306, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592454185260\"}', '2020-06-18 04:23:05', '2020-06-18 04:23:05'),
(1307, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592454185261\"}', '2020-06-18 04:23:05', '2020-06-18 04:23:05'),
(1308, 1, 'sc_admin/uploads/upload', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"_token\":\"hfaQvdnSSZgLuFAgyg6sEyX34piikWE2yaCQ6L83\"}', '2020-06-18 04:23:18', '2020-06-18 04:23:18'),
(1309, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 04:24:13', '2020-06-18 04:24:13'),
(1310, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-18 04:24:45', '2020-06-18 04:24:45'),
(1311, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592454285993\"}', '2020-06-18 04:24:46', '2020-06-18 04:24:46'),
(1312, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592454285992\"}', '2020-06-18 04:24:46', '2020-06-18 04:24:46'),
(1313, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592454285994\"}', '2020-06-18 04:24:46', '2020-06-18 04:24:46'),
(1314, 1, 'sc_admin/uploads/upload', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"_token\":\"hfaQvdnSSZgLuFAgyg6sEyX34piikWE2yaCQ6L83\"}', '2020-06-18 04:24:50', '2020-06-18 04:24:50'),
(1315, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"_\":\"1592454285995\"}', '2020-06-18 04:24:50', '2020-06-18 04:24:50'),
(1316, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592454285996\"}', '2020-06-18 04:24:50', '2020-06-18 04:24:50'),
(1317, 1, 'sc_admin/uploads/upload', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"_token\":\"hfaQvdnSSZgLuFAgyg6sEyX34piikWE2yaCQ6L83\"}', '2020-06-18 04:25:11', '2020-06-18 04:25:11'),
(1318, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"_\":\"1592454285997\"}', '2020-06-18 04:25:13', '2020-06-18 04:25:13'),
(1319, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":\"\\/\",\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592454285998\"}', '2020-06-18 04:25:13', '2020-06-18 04:25:13'),
(1320, 1, 'sc_admin/category', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:43:56', '2020-06-18 06:43:56'),
(1321, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:44:04', '2020-06-18 06:44:04'),
(1322, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:44:07', '2020-06-18 06:44:07'),
(1323, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:44:20', '2020-06-18 06:44:20'),
(1324, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:51:48', '2020-06-18 06:51:48'),
(1325, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:51:56', '2020-06-18 06:51:56'),
(1326, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:51:58', '2020-06-18 06:51:58'),
(1327, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 06:52:06', '2020-06-18 06:52:06'),
(1328, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 07:41:38', '2020-06-18 07:41:38'),
(1329, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 08:54:28', '2020-06-18 08:54:28'),
(1330, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 08:54:34', '2020-06-18 08:54:34'),
(1331, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 08:54:54', '2020-06-18 08:54:54'),
(1332, 1, 'sc_admin/plugin/shipping', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-18 09:07:55', '2020-06-18 09:07:55'),
(1333, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:34:18', '2020-06-19 02:34:18'),
(1334, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:34:46', '2020-06-19 02:34:46'),
(1335, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:34:54', '2020-06-19 02:34:54'),
(1336, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:35:02', '2020-06-19 02:35:02'),
(1337, 1, 'sc_admin/menu/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"6\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0111\\u1ea1i l\\u00fd\",\"icon\":\"fa-archive\",\"uri\":null,\"sort\":\"0\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 02:35:28', '2020-06-19 02:35:28'),
(1338, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:35:28', '2020-06-19 02:35:28'),
(1339, 1, 'sc_admin/menu/update_sort', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\",\"menu\":\"[{\\\"id\\\":6,\\\"children\\\":[{\\\"id\\\":65,\\\"children\\\":[{\\\"id\\\":64}]},{\\\"id\\\":1,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":11}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":17},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":61},{\\\"id\\\":62},{\\\"id\\\":63},{\\\"id\\\":55}]},{\\\"id\\\":3,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21},{\\\"id\\\":56}]}]},{\\\"id\\\":7,\\\"children\\\":[{\\\"id\\\":33},{\\\"id\\\":10},{\\\"id\\\":52}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":4,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]},{\\\"id\\\":35,\\\"children\\\":[{\\\"id\\\":39},{\\\"id\\\":40},{\\\"id\\\":41},{\\\"id\\\":43},{\\\"id\\\":42}]}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":38,\\\"children\\\":[{\\\"id\\\":46},{\\\"id\\\":47},{\\\"id\\\":48},{\\\"id\\\":49},{\\\"id\\\":50}]},{\\\"id\\\":5,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":57},{\\\"id\\\":53},{\\\"id\\\":60},{\\\"id\\\":27},{\\\"id\\\":30},{\\\"id\\\":34},{\\\"id\\\":58}]},{\\\"id\\\":37,\\\"children\\\":[{\\\"id\\\":54}]},{\\\"id\\\":59}]}]\"}', '2020-06-19 02:35:37', '2020-06-19 02:35:37'),
(1340, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:35:37', '2020-06-19 02:35:37'),
(1341, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:35:41', '2020-06-19 02:35:41'),
(1342, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:36:13', '2020-06-19 02:36:13'),
(1343, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:36:15', '2020-06-19 02:36:15'),
(1344, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:36:20', '2020-06-19 02:36:20'),
(1345, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:51:48', '2020-06-19 02:51:48'),
(1346, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:51:50', '2020-06-19 02:51:50'),
(1347, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"type\":null,\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 02:54:13', '2020-06-19 02:54:13'),
(1348, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:54:13', '2020-06-19 02:54:13'),
(1349, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:54:15', '2020-06-19 02:54:15'),
(1350, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"type\":\"2\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 02:54:18', '2020-06-19 02:54:18'),
(1351, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:54:19', '2020-06-19 02:54:19'),
(1352, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:54:20', '2020-06-19 02:54:20'),
(1353, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:55:23', '2020-06-19 02:55:23'),
(1354, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:55:26', '2020-06-19 02:55:26'),
(1355, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:55:27', '2020-06-19 02:55:27'),
(1356, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:55:29', '2020-06-19 02:55:29'),
(1357, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:55:31', '2020-06-19 02:55:31'),
(1358, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:58:13', '2020-06-19 02:58:13');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1359, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:58:34', '2020-06-19 02:58:34'),
(1360, 1, 'sc_admin/menu/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"65\",\"title\":\"Quy\\u1ec1n \\u0111\\u1ea1i l\\u00fd cho \\u0111\\u01a1n h\\u00e0ng\",\"icon\":\"fa-balance-scale\",\"uri\":\"admin::provider-role\",\"sort\":\"0\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 02:59:16', '2020-06-19 02:59:16'),
(1361, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:59:16', '2020-06-19 02:59:16'),
(1362, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 02:59:23', '2020-06-19 02:59:23'),
(1363, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:00:13', '2020-06-19 03:00:13'),
(1364, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:04:58', '2020-06-19 03:04:58'),
(1365, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:05:08', '2020-06-19 03:05:08'),
(1366, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:05:40', '2020-06-19 03:05:40'),
(1367, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:06:27', '2020-06-19 03:06:27'),
(1368, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:07:02', '2020-06-19 03:07:02'),
(1369, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:08:06', '2020-06-19 03:08:06'),
(1370, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:08:09', '2020-06-19 03:08:09'),
(1371, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 03:27:40', '2020-06-19 03:27:40'),
(1372, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:09:03', '2020-06-19 04:09:03'),
(1373, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:11:36', '2020-06-19 04:11:36'),
(1374, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:13:38', '2020-06-19 04:13:38'),
(1375, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:21:38', '2020-06-19 04:21:38'),
(1376, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:22:08', '2020-06-19 04:22:08'),
(1377, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:22:23', '2020-06-19 04:22:23'),
(1378, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:23:26', '2020-06-19 04:23:26'),
(1379, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:23:36', '2020-06-19 04:23:36'),
(1380, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:32:32', '2020-06-19 04:32:32'),
(1381, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:02', '2020-06-19 04:33:02'),
(1382, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:04', '2020-06-19 04:33:04'),
(1383, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:10', '2020-06-19 04:33:10'),
(1384, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:16', '2020-06-19 04:33:16'),
(1385, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:33', '2020-06-19 04:33:33'),
(1386, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:33:41', '2020-06-19 04:33:41'),
(1387, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:35:15', '2020-06-19 04:35:15'),
(1388, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:35:49', '2020-06-19 04:35:49'),
(1389, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:36:56', '2020-06-19 04:36:56'),
(1390, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:37:47', '2020-06-19 04:37:47'),
(1391, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:38:21', '2020-06-19 04:38:21'),
(1392, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:39:08', '2020-06-19 04:39:08'),
(1393, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:39:09', '2020-06-19 04:39:09'),
(1394, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:39:50', '2020-06-19 04:39:50'),
(1395, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:41:04', '2020-06-19 04:41:04'),
(1396, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:43:08', '2020-06-19 04:43:08'),
(1397, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:43:12', '2020-06-19 04:43:12'),
(1398, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:43:16', '2020-06-19 04:43:16'),
(1399, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 04:43:17', '2020-06-19 04:43:17'),
(1400, 1, 'sc_admin/page', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:35:16', '2020-06-19 06:35:16'),
(1401, 1, 'sc_admin/page/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:35:18', '2020-06-19 06:35:18'),
(1402, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:50:36', '2020-06-19 06:50:36'),
(1403, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:50:46', '2020-06-19 06:50:46'),
(1404, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:50:48', '2020-06-19 06:50:48'),
(1405, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:51:13', '2020-06-19 06:51:13'),
(1406, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:52:07', '2020-06-19 06:52:07'),
(1407, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:52:27', '2020-06-19 06:52:27'),
(1408, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:52:58', '2020-06-19 06:52:58'),
(1409, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:57:08', '2020-06-19 06:57:08'),
(1410, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:57:23', '2020-06-19 06:57:23'),
(1411, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 06:57:46', '2020-06-19 06:57:46'),
(1412, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:02:39', '2020-06-19 07:02:39'),
(1413, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:02:44', '2020-06-19 07:02:44'),
(1414, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:05:29', '2020-06-19 07:05:29'),
(1415, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:06:58', '2020-06-19 07:06:58'),
(1416, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:07:40', '2020-06-19 07:07:40'),
(1417, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:07:58', '2020-06-19 07:07:58'),
(1418, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:08:08', '2020-06-19 07:08:08'),
(1419, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:08:30', '2020-06-19 07:08:30'),
(1420, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:08:57', '2020-06-19 07:08:57'),
(1421, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:10:31', '2020-06-19 07:10:31'),
(1422, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:10:34', '2020-06-19 07:10:34'),
(1423, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:11:56', '2020-06-19 07:11:56'),
(1424, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:13:17', '2020-06-19 07:13:17'),
(1425, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:13:22', '2020-06-19 07:13:22'),
(1426, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:14:06', '2020-06-19 07:14:06'),
(1427, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:14:25', '2020-06-19 07:14:25'),
(1428, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:15:44', '2020-06-19 07:15:44'),
(1429, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:15:56', '2020-06-19 07:15:56'),
(1430, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:18:19', '2020-06-19 07:18:19'),
(1431, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:19:14', '2020-06-19 07:19:14'),
(1432, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:19:34', '2020-06-19 07:19:34'),
(1433, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:19:38', '2020-06-19 07:19:38'),
(1434, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:34:17', '2020-06-19 07:34:17'),
(1435, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:34:21', '2020-06-19 07:34:21'),
(1436, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:35:16', '2020-06-19 07:35:16'),
(1437, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:35:21', '2020-06-19 07:35:21'),
(1438, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:35:31', '2020-06-19 07:35:31'),
(1439, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:35:35', '2020-06-19 07:35:35'),
(1440, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 07:44:11', '2020-06-19 07:44:11'),
(1441, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Fausto Rath\",\"slug\":\"ascn-jkasc\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 07:44:29', '2020-06-19 07:44:29'),
(1442, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Fausto Rath\",\"slug\":\"ascn-jkasc\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:12:23', '2020-06-19 08:12:23'),
(1443, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:12:47', '2020-06-19 08:12:47'),
(1444, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"3\",\"5\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:12:54', '2020-06-19 08:12:54'),
(1445, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:13:12', '2020-06-19 08:13:12'),
(1446, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:13:14', '2020-06-19 08:13:14'),
(1447, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:13:31', '2020-06-19 08:13:31'),
(1448, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"3\",\"4\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:19:39', '2020-06-19 08:19:39'),
(1449, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:21:20', '2020-06-19 08:21:20'),
(1450, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"provider-only\",\"order_status\":[\"2\",\"3\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:22:26', '2020-06-19 08:22:26'),
(1451, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"provider-only\",\"order_status\":[\"2\",\"3\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:27:16', '2020-06-19 08:27:16'),
(1452, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:16', '2020-06-19 08:27:16'),
(1453, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:20', '2020-06-19 08:27:20'),
(1454, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:26', '2020-06-19 08:27:26'),
(1455, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:45', '2020-06-19 08:27:45'),
(1456, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:47', '2020-06-19 08:27:47'),
(1457, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"4\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:27:52', '2020-06-19 08:27:52'),
(1458, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:52', '2020-06-19 08:27:52'),
(1459, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:56', '2020-06-19 08:27:56'),
(1460, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:27:59', '2020-06-19 08:27:59'),
(1461, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:27:59', '2020-06-19 08:27:59'),
(1462, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:31:04', '2020-06-19 08:31:04'),
(1463, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:31:07', '2020-06-19 08:31:07'),
(1464, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:31:14', '2020-06-19 08:31:14'),
(1465, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:31:17', '2020-06-19 08:31:17'),
(1466, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 08:31:17', '2020-06-19 08:31:17'),
(1467, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:31:50', '2020-06-19 08:31:50'),
(1468, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:31:53', '2020-06-19 08:31:53'),
(1469, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:31:56', '2020-06-19 08:31:56'),
(1470, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:31:59', '2020-06-19 08:31:59'),
(1471, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:32:00', '2020-06-19 08:32:00'),
(1472, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:32:18', '2020-06-19 08:32:18'),
(1473, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:32:21', '2020-06-19 08:32:21'),
(1474, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:34:54', '2020-06-19 08:34:54'),
(1475, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:34:59', '2020-06-19 08:34:59'),
(1476, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:38:32', '2020-06-19 08:38:32'),
(1477, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:38:34', '2020-06-19 08:38:34'),
(1478, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-19 08:38:34', '2020-06-19 08:38:34'),
(1479, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:39:13', '2020-06-19 08:39:13'),
(1480, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:39:37', '2020-06-19 08:39:37'),
(1481, 1, 'sc_admin/provider-role/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"4\",\"5\"],\"_token\":\"qBgTcjBI0eTMbLDgjwRe7Yomf3CiCQeAgKhbKpPb\"}', '2020-06-19 08:39:43', '2020-06-19 08:39:43'),
(1482, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:41:37', '2020-06-19 08:41:37'),
(1483, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-19 08:41:50', '2020-06-19 08:41:50'),
(1484, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:06:33', '2020-06-20 01:06:33'),
(1485, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:06:35', '2020-06-20 01:06:35'),
(1486, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:06:38', '2020-06-20 01:06:38'),
(1487, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:16:33', '2020-06-20 01:16:33'),
(1488, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:17:41', '2020-06-20 01:17:41'),
(1489, 1, 'sc_admin/provider-role/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:17:43', '2020-06-20 01:17:43'),
(1490, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"1\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:17:51', '2020-06-20 01:17:51'),
(1491, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:18:09', '2020-06-20 01:18:09'),
(1492, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:21:04', '2020-06-20 01:21:04'),
(1493, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:21:08', '2020-06-20 01:21:08'),
(1494, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:28:11', '2020-06-20 01:28:11'),
(1495, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:28:38', '2020-06-20 01:28:38'),
(1496, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:28:41', '2020-06-20 01:28:41'),
(1497, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:28:49', '2020-06-20 01:28:49'),
(1498, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:28:51', '2020-06-20 01:28:51'),
(1499, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:29:08', '2020-06-20 01:29:08'),
(1500, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:29:44', '2020-06-20 01:29:44'),
(1501, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:29:55', '2020-06-20 01:29:55'),
(1502, 1, 'sc_admin/role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:29:59', '2020-06-20 01:29:59'),
(1503, 1, 'sc_admin/role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"provider-only\",\"permission\":[\"3\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:30:09', '2020-06-20 01:30:09'),
(1504, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:30:09', '2020-06-20 01:30:09'),
(1505, 1, 'sc_admin/role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"8\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:30:12', '2020-06-20 01:30:12'),
(1506, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:30:12', '2020-06-20 01:30:12'),
(1507, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:30:22', '2020-06-20 01:30:22'),
(1508, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:30:29', '2020-06-20 01:30:29'),
(1509, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:38:20', '2020-06-20 01:38:20'),
(1510, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:38:29', '2020-06-20 01:38:29'),
(1511, 1, 'sc_admin/provider-role/deleteasdasd', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:38:31', '2020-06-20 01:38:31'),
(1512, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:38:44', '2020-06-20 01:38:44'),
(1513, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:38:46', '2020-06-20 01:38:46'),
(1514, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:38:58', '2020-06-20 01:38:58'),
(1515, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:39:00', '2020-06-20 01:39:00'),
(1516, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:40:39', '2020-06-20 01:40:39'),
(1517, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:42:26', '2020-06-20 01:42:26'),
(1518, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:42:29', '2020-06-20 01:42:29'),
(1519, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:42:29', '2020-06-20 01:42:29'),
(1520, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:42:41', '2020-06-20 01:42:41'),
(1521, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:49:59', '2020-06-20 01:49:59'),
(1522, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:50:02', '2020-06-20 01:50:02'),
(1523, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:50:02', '2020-06-20 01:50:02'),
(1524, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:50:18', '2020-06-20 01:50:18'),
(1525, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:50:21', '2020-06-20 01:50:21'),
(1526, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:50:21', '2020-06-20 01:50:21'),
(1527, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:50:29', '2020-06-20 01:50:29'),
(1528, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:50:31', '2020-06-20 01:50:31'),
(1529, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:50:31', '2020-06-20 01:50:31'),
(1530, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:50:34', '2020-06-20 01:50:34'),
(1531, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:50:34', '2020-06-20 01:50:34'),
(1532, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:50:37', '2020-06-20 01:50:37'),
(1533, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:50:39', '2020-06-20 01:50:39'),
(1534, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:50:39', '2020-06-20 01:50:39'),
(1535, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:51:11', '2020-06-20 01:51:11'),
(1536, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:51:13', '2020-06-20 01:51:13'),
(1537, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:51:52', '2020-06-20 01:51:52'),
(1538, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:51:55', '2020-06-20 01:51:55'),
(1539, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:51:55', '2020-06-20 01:51:55'),
(1540, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 01:51:58', '2020-06-20 01:51:58'),
(1541, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 01:51:58', '2020-06-20 01:51:58'),
(1542, 1, 'sc_admin/provider-role/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 01:54:40', '2020-06-20 01:54:40'),
(1543, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:07:43', '2020-06-20 02:07:43'),
(1544, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:07:46', '2020-06-20 02:07:46'),
(1545, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 02:07:46', '2020-06-20 02:07:46'),
(1546, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:07:55', '2020-06-20 02:07:55'),
(1547, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:07:58', '2020-06-20 02:07:58'),
(1548, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:16:33', '2020-06-20 02:16:33'),
(1549, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"5\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:16:47', '2020-06-20 02:16:47'),
(1550, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 02:16:48', '2020-06-20 02:16:48'),
(1551, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:37:55', '2020-06-20 02:37:55'),
(1552, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:37:56', '2020-06-20 02:37:56'),
(1553, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"3\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:38:01', '2020-06-20 02:38:01'),
(1554, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:38:02', '2020-06-20 02:38:02'),
(1555, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"6\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:38:11', '2020-06-20 02:38:11'),
(1556, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:38:36', '2020-06-20 02:38:36');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1557, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:38:50', '2020-06-20 02:38:50'),
(1558, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"3\",\"6\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:38:55', '2020-06-20 02:38:55'),
(1559, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:38:55', '2020-06-20 02:38:55'),
(1560, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:39:22', '2020-06-20 02:39:22'),
(1561, 1, 'sc_admin/provider-role/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"7\",\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:39:35', '2020-06-20 02:39:35'),
(1562, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 02:39:35', '2020-06-20 02:39:35'),
(1563, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:39:51', '2020-06-20 02:39:51'),
(1564, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:39:57', '2020-06-20 02:39:57'),
(1565, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:40:01', '2020-06-20 02:40:01'),
(1566, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"3\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:40:07', '2020-06-20 02:40:07'),
(1567, 1, 'sc_admin/provider-role/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"3\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:41:30', '2020-06-20 02:41:30'),
(1568, 1, 'sc_admin/provider-role/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:41:31', '2020-06-20 02:41:31'),
(1569, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:41:42', '2020-06-20 02:41:42'),
(1570, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:41:44', '2020-06-20 02:41:44'),
(1571, 1, 'sc_admin/provider-role/edit/8', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"3\",\"5\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:41:48', '2020-06-20 02:41:48'),
(1572, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:41:48', '2020-06-20 02:41:48'),
(1573, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:41:51', '2020-06-20 02:41:51'),
(1574, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:42:14', '2020-06-20 02:42:14'),
(1575, 1, 'sc_admin/permission/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:42:23', '2020-06-20 02:42:23'),
(1576, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:46:28', '2020-06-20 02:46:28'),
(1577, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:46:29', '2020-06-20 02:46:29'),
(1578, 1, 'sc_admin/provider-role/edit/8', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:46:33', '2020-06-20 02:46:33'),
(1579, 1, 'sc_admin/provider-role/edit/8', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:47:06', '2020-06-20 02:47:06'),
(1580, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:47:06', '2020-06-20 02:47:06'),
(1581, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:47:08', '2020-06-20 02:47:08'),
(1582, 1, 'sc_admin/provider-role/edit/8', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider 1\",\"slug\":\"xe-may\",\"order_status\":[\"2\",\"3\",\"4\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:47:11', '2020-06-20 02:47:11'),
(1583, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:47:12', '2020-06-20 02:47:12'),
(1584, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:47:15', '2020-06-20 02:47:15'),
(1585, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:47:29', '2020-06-20 02:47:29'),
(1586, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:48:20', '2020-06-20 02:48:20'),
(1587, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:48:55', '2020-06-20 02:48:55'),
(1588, 1, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:49:27', '2020-06-20 02:49:27'),
(1589, 1, 'sc_admin/provider-role/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"slug\":\"giam-doc\",\"order_status\":[\"1\",\"2\",\"5\"],\"_token\":\"XyNHjrdcGhmOqOEWIMrBRWnaJIIQYu8Avc8Yqynh\"}', '2020-06-20 02:49:30', '2020-06-20 02:49:30'),
(1590, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:49:30', '2020-06-20 02:49:30'),
(1591, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:49:49', '2020-06-20 02:49:49'),
(1592, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:49:54', '2020-06-20 02:49:54'),
(1593, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 02:50:04', '2020-06-20 02:50:04'),
(1594, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:25', '2020-06-20 03:14:25'),
(1595, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:32', '2020-06-20 03:14:32'),
(1596, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:33', '2020-06-20 03:14:33'),
(1597, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:38', '2020-06-20 03:14:38'),
(1598, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:44', '2020-06-20 03:14:44'),
(1599, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:54', '2020-06-20 03:14:54'),
(1600, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:14:56', '2020-06-20 03:14:56'),
(1601, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:15:59', '2020-06-20 03:15:59'),
(1602, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:16:06', '2020-06-20 03:16:06'),
(1603, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:52:37', '2020-06-20 03:52:37'),
(1604, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:52:40', '2020-06-20 03:52:40'),
(1605, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:52:43', '2020-06-20 03:52:43'),
(1606, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 03:52:51', '2020-06-20 03:52:51'),
(1607, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:00:45', '2020-06-20 04:00:45'),
(1608, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:01:17', '2020-06-20 04:01:17'),
(1609, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:24', '2020-06-20 04:03:24'),
(1610, 1, 'sc_admin/menu/edit/66', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:26', '2020-06-20 04:03:26'),
(1611, 1, 'sc_admin/menu/edit/66', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"65\",\"title\":\"Nh\\u00f3m quy\\u1ec1n \\u0110\\u1ea1i l\\u00fd\",\"icon\":\"fa-balance-scale\",\"uri\":\"admin::provider-role\",\"sort\":\"0\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 04:03:34', '2020-06-20 04:03:34'),
(1612, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:35', '2020-06-20 04:03:35'),
(1613, 1, 'sc_admin/menu/edit/64', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:37', '2020-06-20 04:03:37'),
(1614, 1, 'sc_admin/menu/edit/64', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"65\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0110\\u1ea1i l\\u00fd\",\"icon\":\"fa-codepen\",\"uri\":\"admin::provider\",\"sort\":\"1\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 04:03:42', '2020-06-20 04:03:42'),
(1615, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:43', '2020-06-20 04:03:43'),
(1616, 1, 'sc_admin/menu/update_sort', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\",\"menu\":\"[{\\\"id\\\":6,\\\"children\\\":[{\\\"id\\\":65,\\\"children\\\":[{\\\"id\\\":64},{\\\"id\\\":66}]},{\\\"id\\\":1,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":11}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":17},{\\\"id\\\":18},{\\\"id\\\":19},{\\\"id\\\":61},{\\\"id\\\":62},{\\\"id\\\":63},{\\\"id\\\":55}]},{\\\"id\\\":3,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21},{\\\"id\\\":56}]}]},{\\\"id\\\":7,\\\"children\\\":[{\\\"id\\\":33},{\\\"id\\\":10},{\\\"id\\\":52}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":4,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":23},{\\\"id\\\":24}]},{\\\"id\\\":35,\\\"children\\\":[{\\\"id\\\":39},{\\\"id\\\":40},{\\\"id\\\":41},{\\\"id\\\":43},{\\\"id\\\":42}]}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":38,\\\"children\\\":[{\\\"id\\\":46},{\\\"id\\\":47},{\\\"id\\\":48},{\\\"id\\\":49},{\\\"id\\\":50}]},{\\\"id\\\":5,\\\"children\\\":[{\\\"id\\\":26},{\\\"id\\\":57},{\\\"id\\\":53},{\\\"id\\\":60},{\\\"id\\\":27},{\\\"id\\\":30},{\\\"id\\\":34},{\\\"id\\\":58}]},{\\\"id\\\":37,\\\"children\\\":[{\\\"id\\\":54}]},{\\\"id\\\":59}]}]\"}', '2020-06-20 04:03:48', '2020-06-20 04:03:48'),
(1617, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:03:48', '2020-06-20 04:03:48'),
(1618, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:04:10', '2020-06-20 04:04:10'),
(1619, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:04:17', '2020-06-20 04:04:17'),
(1620, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:04:25', '2020-06-20 04:04:25'),
(1621, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:21:54', '2020-06-20 04:21:54'),
(1622, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:24:13', '2020-06-20 04:24:13'),
(1623, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:24:17', '2020-06-20 04:24:17'),
(1624, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:24:22', '2020-06-20 04:24:22'),
(1625, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:24:33', '2020-06-20 04:24:33'),
(1626, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:24:36', '2020-06-20 04:24:36'),
(1627, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:33:14', '2020-06-20 04:33:14'),
(1628, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:33:23', '2020-06-20 04:33:23'),
(1629, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:33:31', '2020-06-20 04:33:31'),
(1630, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:34:46', '2020-06-20 04:34:46'),
(1631, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:34:47', '2020-06-20 04:34:47'),
(1632, 1, 'sc_admin/user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:34:53', '2020-06-20 04:34:53'),
(1633, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:35:45', '2020-06-20 04:35:45'),
(1634, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:50', '2020-06-20 04:35:50'),
(1635, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:51', '2020-06-20 04:35:51'),
(1636, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:51', '2020-06-20 04:35:51'),
(1637, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:52', '2020-06-20 04:35:52'),
(1638, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:53', '2020-06-20 04:35:53'),
(1639, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:53', '2020-06-20 04:35:53'),
(1640, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:54', '2020-06-20 04:35:54'),
(1641, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:54', '2020-06-20 04:35:54'),
(1642, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:54', '2020-06-20 04:35:54'),
(1643, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 04:35:55', '2020-06-20 04:35:55'),
(1644, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:42:18', '2020-06-20 04:42:18'),
(1645, 1, 'sc_admin/menu/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"parent_id\":\"65\",\"title\":\"T\\u00e0i kho\\u1ea3n \\u0110\\u1ea1i l\\u00fd\",\"icon\":\"fa-coffee\",\"uri\":\"admin::provider-user\",\"sort\":\"0\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 04:44:00', '2020-06-20 04:44:00'),
(1646, 1, 'sc_admin/menu', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:44:00', '2020-06-20 04:44:00'),
(1647, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:44:06', '2020-06-20 04:44:06'),
(1648, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:46:22', '2020-06-20 04:46:22'),
(1649, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:47:09', '2020-06-20 04:47:09'),
(1650, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:48:22', '2020-06-20 04:48:22'),
(1651, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 04:48:48', '2020-06-20 04:48:48'),
(1652, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:25:13', '2020-06-20 06:25:13'),
(1653, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:31:40', '2020-06-20 06:31:40'),
(1654, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:31:43', '2020-06-20 06:31:43'),
(1655, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:31:45', '2020-06-20 06:31:45'),
(1656, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:34:23', '2020-06-20 06:34:23'),
(1657, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:34:30', '2020-06-20 06:34:30'),
(1658, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:34:35', '2020-06-20 06:34:35'),
(1659, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:34:56', '2020-06-20 06:34:56'),
(1660, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:07', '2020-06-20 06:35:07'),
(1661, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:11', '2020-06-20 06:35:11'),
(1662, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:14', '2020-06-20 06:35:14'),
(1663, 1, 'sc_admin/role/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\'s Manager\",\"slug\":\"provider-manager\",\"permission\":[\"2\",\"23\"],\"administrators\":[\"2\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:35:38', '2020-06-20 06:35:38'),
(1664, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:38', '2020-06-20 06:35:38'),
(1665, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:42', '2020-06-20 06:35:42'),
(1666, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:35:43', '2020-06-20 06:35:43'),
(1667, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Only\",\"slug\":\"provider-only\",\"http_uri\":[\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\",\"ANY::sc_admin\\/provider-user\\/*\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:36:17', '2020-06-20 06:36:17'),
(1668, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:17', '2020-06-20 06:36:17'),
(1669, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:24', '2020-06-20 06:36:24'),
(1670, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:28', '2020-06-20 06:36:28'),
(1671, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:30', '2020-06-20 06:36:30'),
(1672, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Only\",\"slug\":\"provider-only\",\"http_uri\":[\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\",\"ANY::sc_admin\\/provider-role\\/*\",\"ANY::sc_admin\\/provider-user\\/*\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:36:48', '2020-06-20 06:36:48'),
(1673, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:48', '2020-06-20 06:36:48'),
(1674, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:36:56', '2020-06-20 06:36:56'),
(1675, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider Manager\",\"slug\":\"provider-manager\",\"http_uri\":[\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\",\"ANY::sc_admin\\/provider-role\\/*\",\"ANY::sc_admin\\/provider-user\\/*\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:37:07', '2020-06-20 06:37:07'),
(1676, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:37:07', '2020-06-20 06:37:07'),
(1677, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:37:11', '2020-06-20 06:37:11'),
(1678, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:37:13', '2020-06-20 06:37:13'),
(1679, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:37:18', '2020-06-20 06:37:18'),
(1680, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:47:15', '2020-06-20 06:47:15'),
(1681, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:47:18', '2020-06-20 06:47:18'),
(1682, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:47:20', '2020-06-20 06:47:20'),
(1683, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:49:32', '2020-06-20 06:49:32'),
(1684, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:49:34', '2020-06-20 06:49:34'),
(1685, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:49:38', '2020-06-20 06:49:38'),
(1686, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:49:41', '2020-06-20 06:49:41'),
(1687, 1, 'sc_admin/role/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:50:01', '2020-06-20 06:50:01'),
(1688, 1, 'sc_admin/role/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\'s User\",\"slug\":\"provider-manager\",\"permission\":[\"2\",\"23\"],\"administrators\":[\"2\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:51:57', '2020-06-20 06:51:57'),
(1689, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:51:57', '2020-06-20 06:51:57'),
(1690, 1, 'sc_admin/role/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider\'s User\",\"slug\":\"provider-manager\",\"permission\":[\"2\",\"23\"],\"administrators\":[\"2\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:51:57', '2020-06-20 06:51:57'),
(1691, 1, 'sc_admin/role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:51:58', '2020-06-20 06:51:58'),
(1692, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:52:01', '2020-06-20 06:52:01'),
(1693, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:52:03', '2020-06-20 06:52:03'),
(1694, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider User\",\"slug\":\"provider-manager\",\"http_uri\":[\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\",\"ANY::sc_admin\\/provider-role\\/*\",\"ANY::sc_admin\\/provider-user\\/*\"],\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 06:52:10', '2020-06-20 06:52:10'),
(1695, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:52:10', '2020-06-20 06:52:10'),
(1696, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:52:18', '2020-06-20 06:52:18'),
(1697, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:52:35', '2020-06-20 06:52:35'),
(1698, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 06:53:03', '2020-06-20 06:53:03'),
(1699, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:01:09', '2020-06-20 07:01:09'),
(1700, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:01:55', '2020-06-20 07:01:55'),
(1701, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:02:13', '2020-06-20 07:02:13'),
(1702, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:25:44', '2020-06-20 07:25:44'),
(1703, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:26:33', '2020-06-20 07:26:33'),
(1704, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:27:02', '2020-06-20 07:27:02'),
(1705, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:28:45', '2020-06-20 07:28:45'),
(1706, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:31:47', '2020-06-20 07:31:47'),
(1707, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:32:40', '2020-06-20 07:32:40'),
(1708, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:33:12', '2020-06-20 07:33:12'),
(1709, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:33:46', '2020-06-20 07:33:46'),
(1710, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:33:52', '2020-06-20 07:33:52'),
(1711, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:35:54', '2020-06-20 07:35:54'),
(1712, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:36:00', '2020-06-20 07:36:00'),
(1713, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:36:12', '2020-06-20 07:36:12'),
(1714, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:36:24', '2020-06-20 07:36:24'),
(1715, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:36:37', '2020-06-20 07:36:37'),
(1716, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:36:55', '2020-06-20 07:36:55'),
(1717, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:37:00', '2020-06-20 07:37:00'),
(1718, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:42:41', '2020-06-20 07:42:41'),
(1719, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:42:43', '2020-06-20 07:42:43'),
(1720, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:42:52', '2020-06-20 07:42:52'),
(1721, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:42:56', '2020-06-20 07:42:56'),
(1722, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:43:03', '2020-06-20 07:43:03'),
(1723, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:44:36', '2020-06-20 07:44:36'),
(1724, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:44:37', '2020-06-20 07:44:37'),
(1725, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:45:44', '2020-06-20 07:45:44'),
(1726, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:45:58', '2020-06-20 07:45:58'),
(1727, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:48:10', '2020-06-20 07:48:10'),
(1728, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:48:12', '2020-06-20 07:48:12'),
(1729, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:49:29', '2020-06-20 07:49:29'),
(1730, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:49:46', '2020-06-20 07:49:46'),
(1731, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:52:41', '2020-06-20 07:52:41'),
(1732, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:53:06', '2020-06-20 07:53:06'),
(1733, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:55:03', '2020-06-20 07:55:03'),
(1734, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:55:13', '2020-06-20 07:55:13'),
(1735, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:56:10', '2020-06-20 07:56:10'),
(1736, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:58:55', '2020-06-20 07:58:55'),
(1737, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:58:57', '2020-06-20 07:58:57'),
(1738, 1, 'sc_admin/provider-role/edit/8', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:59:34', '2020-06-20 07:59:34'),
(1739, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:59:37', '2020-06-20 07:59:37'),
(1740, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 07:59:39', '2020-06-20 07:59:39'),
(1741, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 08:00:18', '2020-06-20 08:00:18'),
(1742, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 08:04:20', '2020-06-20 08:04:20'),
(1743, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 08:49:31', '2020-06-20 08:49:31'),
(1744, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 08:50:41', '2020-06-20 08:50:41'),
(1745, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 08:51:40', '2020-06-20 08:51:40'),
(1746, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:02:10', '2020-06-20 09:02:10'),
(1747, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:02:12', '2020-06-20 09:02:12');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1748, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:02:23', '2020-06-20 09:02:23'),
(1749, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:02:25', '2020-06-20 09:02:25'),
(1750, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:02:50', '2020-06-20 09:02:50'),
(1751, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 09:02:57', '2020-06-20 09:02:57'),
(1752, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:03:03', '2020-06-20 09:03:03'),
(1753, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 09:03:05', '2020-06-20 09:03:05'),
(1754, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 09:03:22', '2020-06-20 09:03:22'),
(1755, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:03:48', '2020-06-20 09:03:48'),
(1756, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:03:50', '2020-06-20 09:03:50'),
(1757, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:03:53', '2020-06-20 09:03:53'),
(1758, 1, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:03:55', '2020-06-20 09:03:55'),
(1759, 1, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:04:44', '2020-06-20 09:04:44'),
(1760, 1, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:07', '2020-06-20 09:05:07'),
(1761, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:05:14', '2020-06-20 09:05:14'),
(1762, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643915738\"}', '2020-06-20 09:05:15', '2020-06-20 09:05:15'),
(1763, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643915739\"}', '2020-06-20 09:05:15', '2020-06-20 09:05:15'),
(1764, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592643915740\"}', '2020-06-20 09:05:16', '2020-06-20 09:05:16'),
(1765, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:05:21', '2020-06-20 09:05:21'),
(1766, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643921715\"}', '2020-06-20 09:05:21', '2020-06-20 09:05:21'),
(1767, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643921716\"}', '2020-06-20 09:05:21', '2020-06-20 09:05:21'),
(1768, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592643921717\"}', '2020-06-20 09:05:22', '2020-06-20 09:05:22'),
(1769, 1, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Robin Harvey\",\"username\":\"Isaac_Kub\",\"email\":\"tempmail91714@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 09:05:26', '2020-06-20 09:05:26'),
(1770, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:26', '2020-06-20 09:05:26'),
(1771, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:30', '2020-06-20 09:05:30'),
(1772, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:36', '2020-06-20 09:05:36'),
(1773, 1, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:40', '2020-06-20 09:05:40'),
(1774, 1, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:05:44', '2020-06-20 09:05:44'),
(1775, 1, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643944545\"}', '2020-06-20 09:05:44', '2020-06-20 09:05:44'),
(1776, 1, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592643944546\"}', '2020-06-20 09:05:44', '2020-06-20 09:05:44'),
(1777, 1, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592643944547\"}', '2020-06-20 09:05:44', '2020-06-20 09:05:44'),
(1778, 1, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Mr. Riley Crona\",\"username\":\"Frieda_Dach32\",\"email\":\"tempmail33228@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"ZHSxxPEHuE6svhPJhkSUqT1oPkWpHZMiWCyOCy0G\"}', '2020-06-20 09:05:52', '2020-06-20 09:05:52'),
(1779, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:53', '2020-06-20 09:05:53'),
(1780, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:05:57', '2020-06-20 09:05:57'),
(1781, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:06:07', '2020-06-20 09:06:07'),
(1782, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:06:10', '2020-06-20 09:06:10'),
(1783, 2, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:06:42', '2020-06-20 09:06:42'),
(1784, 2, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:06:45', '2020-06-20 09:06:45'),
(1785, 2, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:06:51', '2020-06-20 09:06:51'),
(1786, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:06:51', '2020-06-20 09:06:51'),
(1787, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:07:10', '2020-06-20 09:07:10'),
(1788, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:07:19', '2020-06-20 09:07:19'),
(1789, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:07:21', '2020-06-20 09:07:21'),
(1790, 1, 'sc_admin/permission/edit/23', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:07:33', '2020-06-20 09:07:33'),
(1791, 1, 'sc_admin/permission/edit/23', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Provider User\",\"slug\":\"provider-manager\",\"http_uri\":[\"ANY::sc_admin\\/uploads\\/*\",\"GET::sc_admin\\/order\",\"GET::sc_admin\\/order\\/detail\\/{id}\",\"POST::sc_admin\\/order\\/update\",\"GET::sc_admin\\/order\\/product_info\",\"GET::sc_admin\\/order\\/user_info\",\"GET::sc_admin\\/order\\/export_detail\",\"GET::sc_admin\\/provider\",\"GET::sc_admin\\/provider\\/edit\\/{id}\",\"POST::sc_admin\\/provider\\/edit\\/{id}\",\"GET::sc_admin\\/provider\\/show\\/{id}\",\"POST::sc_admin\\/provider\\/show\\/{id}\",\"ANY::sc_admin\\/provider-role\\/*\",\"ANY::sc_admin\\/provider-user\\/*\"],\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 09:08:09', '2020-06-20 09:08:09'),
(1792, 1, 'sc_admin/permission', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:08:09', '2020-06-20 09:08:09'),
(1793, 2, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:08:11', '2020-06-20 09:08:11'),
(1794, 2, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592644091645\"}', '2020-06-20 09:08:12', '2020-06-20 09:08:12'),
(1795, 2, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592644091646\"}', '2020-06-20 09:08:12', '2020-06-20 09:08:12'),
(1796, 2, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592644091647\"}', '2020-06-20 09:08:12', '2020-06-20 09:08:12'),
(1797, 2, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Jackeline Nitzsche\",\"username\":\"Marlene.Bins\",\"email\":\"tempmail10140@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"PPunGAo6RgOOrdCeXsgkLpVRr4AOshFCpIfVopLe\"}', '2020-06-20 09:08:14', '2020-06-20 09:08:14'),
(1798, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:08:14', '2020-06-20 09:08:14'),
(1799, 2, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:08:38', '2020-06-20 09:08:38'),
(1800, 2, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"PPunGAo6RgOOrdCeXsgkLpVRr4AOshFCpIfVopLe\"}', '2020-06-20 09:08:42', '2020-06-20 09:08:42'),
(1801, 2, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"PPunGAo6RgOOrdCeXsgkLpVRr4AOshFCpIfVopLe\"}', '2020-06-20 09:08:50', '2020-06-20 09:08:50'),
(1802, 2, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"PPunGAo6RgOOrdCeXsgkLpVRr4AOshFCpIfVopLe\"}', '2020-06-20 09:09:18', '2020-06-20 09:09:18'),
(1803, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:18', '2020-06-20 09:09:18'),
(1804, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:18', '2020-06-20 09:09:18'),
(1805, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:21', '2020-06-20 09:09:21'),
(1806, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:21', '2020-06-20 09:09:21'),
(1807, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:24', '2020-06-20 09:09:24'),
(1808, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:24', '2020-06-20 09:09:24'),
(1809, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:25', '2020-06-20 09:09:25'),
(1810, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:25', '2020-06-20 09:09:25'),
(1811, 2, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:29', '2020-06-20 09:09:29'),
(1812, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:29', '2020-06-20 09:09:29'),
(1813, 2, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:30', '2020-06-20 09:09:30'),
(1814, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:30', '2020-06-20 09:09:30'),
(1815, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:31', '2020-06-20 09:09:31'),
(1816, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:31', '2020-06-20 09:09:31'),
(1817, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:32', '2020-06-20 09:09:32'),
(1818, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:32', '2020-06-20 09:09:32'),
(1819, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:35', '2020-06-20 09:09:35'),
(1820, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:38', '2020-06-20 09:09:38'),
(1821, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:09:41', '2020-06-20 09:09:41'),
(1822, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:10:22', '2020-06-20 09:10:22'),
(1823, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:10:23', '2020-06-20 09:10:23'),
(1824, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 09:10:27', '2020-06-20 09:10:27'),
(1825, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:10:27', '2020-06-20 09:10:27'),
(1826, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:10:29', '2020-06-20 09:10:29'),
(1827, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 09:11:35', '2020-06-20 09:11:35'),
(1828, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:11:35', '2020-06-20 09:11:35'),
(1829, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:13:16', '2020-06-20 09:13:16'),
(1830, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:13:17', '2020-06-20 09:13:17'),
(1831, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:13:23', '2020-06-20 09:13:23'),
(1832, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:13:27', '2020-06-20 09:13:27'),
(1833, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 09:13:32', '2020-06-20 09:13:32'),
(1834, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:13:33', '2020-06-20 09:13:33'),
(1835, 1, 'sc_admin/user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"3\",\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 09:14:05', '2020-06-20 09:14:05'),
(1836, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 09:14:05', '2020-06-20 09:14:05'),
(1837, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:14:37', '2020-06-20 09:14:37'),
(1838, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:14:49', '2020-06-20 09:14:49'),
(1839, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:14:55', '2020-06-20 09:14:55'),
(1840, 2, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:14:58', '2020-06-20 09:14:58'),
(1841, 2, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:15:49', '2020-06-20 09:15:49'),
(1842, 2, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 09:15:51', '2020-06-20 09:15:51'),
(1843, 2, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592644551910\"}', '2020-06-20 09:15:52', '2020-06-20 09:15:52'),
(1844, 2, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592644551911\"}', '2020-06-20 09:15:52', '2020-06-20 09:15:52'),
(1845, 2, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592644551912\"}', '2020-06-20 09:15:52', '2020-06-20 09:15:52'),
(1846, 2, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Damaris Smith\",\"username\":\"Theresa7\",\"email\":\"tempmail46387@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"VBPekzI8595AIOTO09d5BEV2CLyl4Jw5haJCbjsx\"}', '2020-06-20 09:15:58', '2020-06-20 09:15:58'),
(1847, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:15:59', '2020-06-20 09:15:59'),
(1848, 2, 'sc_admin/provider-user/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:16:04', '2020-06-20 09:16:04'),
(1849, 2, 'sc_admin/provider-user/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Damaris Smith\",\"username\":\"theresa7\",\"email\":\"tempmail46387@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"VBPekzI8595AIOTO09d5BEV2CLyl4Jw5haJCbjsx\"}', '2020-06-20 09:16:07', '2020-06-20 09:16:07'),
(1850, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:16:07', '2020-06-20 09:16:07'),
(1851, 2, 'sc_admin/provider-user/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:17:06', '2020-06-20 09:17:06'),
(1852, 2, 'sc_admin/provider-user/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Damaris Smith\",\"username\":\"theresa7\",\"email\":\"tempmail46387@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"VBPekzI8595AIOTO09d5BEV2CLyl4Jw5haJCbjsx\"}', '2020-06-20 09:17:08', '2020-06-20 09:17:08'),
(1853, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:17:08', '2020-06-20 09:17:08'),
(1854, 2, 'sc_admin/provider-user/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:17:12', '2020-06-20 09:17:12'),
(1855, 2, 'sc_admin/provider-user/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Damaris Smith\",\"username\":\"theresa7\",\"email\":\"tempmail46387@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"VBPekzI8595AIOTO09d5BEV2CLyl4Jw5haJCbjsx\"}', '2020-06-20 09:17:15', '2020-06-20 09:17:15'),
(1856, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:17:15', '2020-06-20 09:17:15'),
(1857, 2, 'sc_admin/provider-user/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:18:04', '2020-06-20 09:18:04'),
(1858, 2, 'sc_admin/provider-user/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Damaris Smith\",\"username\":\"theresa7\",\"email\":\"tempmail46387@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"VBPekzI8595AIOTO09d5BEV2CLyl4Jw5haJCbjsx\"}', '2020-06-20 09:18:09', '2020-06-20 09:18:09'),
(1859, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:18:09', '2020-06-20 09:18:09'),
(1860, 2, 'sc_admin/provider-user/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:18:17', '2020-06-20 09:18:17'),
(1861, 2, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:21:06', '2020-06-20 09:21:06'),
(1862, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:21:06', '2020-06-20 09:21:06'),
(1863, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:21:11', '2020-06-20 09:21:11'),
(1864, 1, 'sc_admin/plugin/cms/online', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:21:13', '2020-06-20 09:21:13'),
(1865, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:22:32', '2020-06-20 09:22:32'),
(1866, 1, 'sc_admin/plugin/cms/online', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:22:34', '2020-06-20 09:22:34'),
(1867, 1, 'sc_admin/plugin/install/online', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\",\"key\":\"Content\",\"path\":\"https:\\/\\/api.s-cart.org\\/process\\/file?key=1586095900\",\"code\":\"Cms\"}', '2020-06-20 09:22:40', '2020-06-20 09:22:40'),
(1868, 1, 'sc_admin/plugin/cms/online', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:22:41', '2020-06-20 09:22:41'),
(1869, 1, 'sc_admin/cms_category', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:22:45', '2020-06-20 09:22:45'),
(1870, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:26:34', '2020-06-20 09:26:34'),
(1871, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 09:27:38', '2020-06-20 09:27:38'),
(1872, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:06:39', '2020-06-20 10:06:39'),
(1873, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:09:14', '2020-06-20 10:09:14'),
(1874, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:09:28', '2020-06-20 10:09:28'),
(1875, 2, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:09:31', '2020-06-20 10:09:31'),
(1876, 2, 'sc_admin/uploads', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"type\":\"avatar\"}', '2020-06-20 10:09:35', '2020-06-20 10:09:35'),
(1877, 2, 'sc_admin/uploads/folders', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592647775522\"}', '2020-06-20 10:09:35', '2020-06-20 10:09:35'),
(1878, 2, 'sc_admin/uploads/errors', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"_\":\"1592647775523\"}', '2020-06-20 10:09:35', '2020-06-20 10:09:35'),
(1879, 2, 'sc_admin/uploads/jsonitems', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"working_dir\":null,\"type\":\"avatar\",\"sort_type\":\"alphabetic\",\"_\":\"1592647775524\"}', '2020-06-20 10:09:36', '2020-06-20 10:09:36'),
(1880, 2, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"Malcolm_Ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"2\",\"_token\":\"vjV5XLtspWoEPcd2JqEnadUSByqBkPQ53QjlcorR\"}', '2020-06-20 10:09:41', '2020-06-20 10:09:41'),
(1881, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:09:41', '2020-06-20 10:09:41'),
(1882, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:09:55', '2020-06-20 10:09:55'),
(1883, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:10:15', '2020-06-20 10:10:15'),
(1884, 1, 'sc_admin/plugin/disable', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\",\"key\":\"Content\",\"code\":\"Cms\"}', '2020-06-20 10:10:20', '2020-06-20 10:10:20'),
(1885, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:10:20', '2020-06-20 10:10:20'),
(1886, 1, 'sc_admin/plugin/uninstall', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\",\"key\":\"Content\",\"code\":\"Cms\"}', '2020-06-20 10:10:23', '2020-06-20 10:10:23'),
(1887, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:10:23', '2020-06-20 10:10:23'),
(1888, 1, 'sc_admin/plugin/cms', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:10:41', '2020-06-20 10:10:41'),
(1889, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:10:44', '2020-06-20 10:10:44'),
(1890, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:11:16', '2020-06-20 10:11:16'),
(1891, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:11:20', '2020-06-20 10:11:20'),
(1892, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__desc\",\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:12:59', '2020-06-20 10:12:59'),
(1893, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__asc\",\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:13:01', '2020-06-20 10:13:01'),
(1894, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__asc\",\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:13:05', '2020-06-20 10:13:05'),
(1895, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__desc\",\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:13:07', '2020-06-20 10:13:07'),
(1896, 1, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:13:50', '2020-06-20 10:13:50'),
(1897, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"sort_order\":\"id__desc\"}', '2020-06-20 10:14:02', '2020-06-20 10:14:02'),
(1898, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:27', '2020-06-20 10:14:27'),
(1899, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:43', '2020-06-20 10:14:43'),
(1900, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:45', '2020-06-20 10:14:45'),
(1901, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:49', '2020-06-20 10:14:49'),
(1902, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:51', '2020-06-20 10:14:51'),
(1903, 1, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:58', '2020-06-20 10:14:58'),
(1904, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:14:59', '2020-06-20 10:14:59'),
(1905, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:15:01', '2020-06-20 10:15:01'),
(1906, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:19:41', '2020-06-20 10:19:41'),
(1907, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:19:43', '2020-06-20 10:19:43'),
(1908, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:19:53', '2020-06-20 10:19:53'),
(1909, 4, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:19:57', '2020-06-20 10:19:57'),
(1910, 4, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:04', '2020-06-20 10:20:04'),
(1911, 4, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:06', '2020-06-20 10:20:06'),
(1912, 4, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Janick Ruecker\",\"username\":\"Imani_Stark23\",\"email\":\"tempmail53497@emailna.co\",\"avatar\":\"Vel laboriosam tenetur rerum autem dignissimos iusto fugit officiis optio.\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"wdzPs9mUq44nnTfM3zMEPcpGonv49e1QZWiewpqI\"}', '2020-06-20 10:20:08', '2020-06-20 10:20:08'),
(1913, 4, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:08', '2020-06-20 10:20:08'),
(1914, 4, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:49', '2020-06-20 10:20:49'),
(1915, 4, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:53', '2020-06-20 10:20:53'),
(1916, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:20:55', '2020-06-20 10:20:55'),
(1917, 5, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:21:00', '2020-06-20 10:21:00'),
(1918, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:21:04', '2020-06-20 10:21:04'),
(1919, 5, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:21:46', '2020-06-20 10:21:46'),
(1920, 5, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Ms. Damaris Beatty\",\"username\":\"Arnold46\",\"email\":\"tempmail98885@emailna.co\",\"avatar\":\"Alias inventore excepturi laudantium maxime aut illo ea quia corporis.\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"1\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:21:52', '2020-06-20 10:21:52'),
(1921, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:21:52', '2020-06-20 10:21:52'),
(1922, 5, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:22:10', '2020-06-20 10:22:10'),
(1923, 5, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Mavis Haag II\",\"username\":\"Stephany55\",\"email\":\"tempmail18666@emailna.co\",\"avatar\":\"Ut et sed.\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"2\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:22:13', '2020-06-20 10:22:13'),
(1924, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:22:13', '2020-06-20 10:22:13');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(1925, 5, 'sc_admin/provider-user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"7\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:22:28', '2020-06-20 10:22:28'),
(1926, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:22:28', '2020-06-20 10:22:28'),
(1927, 5, 'sc_admin/provider-user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"6\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:22:31', '2020-06-20 10:22:31'),
(1928, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:22:31', '2020-06-20 10:22:31'),
(1929, 5, 'sc_admin/provider-user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"4\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:22:33', '2020-06-20 10:22:33'),
(1930, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:22:33', '2020-06-20 10:22:33'),
(1931, 5, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:23:59', '2020-06-20 10:23:59'),
(1932, 5, 'sc_admin/provider-user/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"malcolm_ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:24:01', '2020-06-20 10:24:01'),
(1933, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:24:01', '2020-06-20 10:24:01'),
(1934, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:24:15', '2020-06-20 10:24:15'),
(1935, 5, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:24:29', '2020-06-20 10:24:29'),
(1936, 5, 'sc_admin/provider-user/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"malcolm_ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:24:34', '2020-06-20 10:24:34'),
(1937, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:24:34', '2020-06-20 10:24:34'),
(1938, 5, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:24:39', '2020-06-20 10:24:39'),
(1939, 1, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:17', '2020-06-20 10:25:17'),
(1940, 1, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:19', '2020-06-20 10:25:19'),
(1941, 1, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"G5TKXyqggHlhCFk6VQ3DKNOJ30CkRHP4wdkHtrsl\"}', '2020-06-20 10:25:22', '2020-06-20 10:25:22'),
(1942, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:22', '2020-06-20 10:25:22'),
(1943, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:27', '2020-06-20 10:25:27'),
(1944, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:30', '2020-06-20 10:25:30'),
(1945, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:32', '2020-06-20 10:25:32'),
(1946, 2, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:35', '2020-06-20 10:25:35'),
(1947, 2, 'sc_admin/provider-user/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"malcolm_ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"2rAMkNn6O53OwfP2WNsAZxvl9sUBTow6yI9tvQsR\"}', '2020-06-20 10:25:39', '2020-06-20 10:25:39'),
(1948, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:39', '2020-06-20 10:25:39'),
(1949, 2, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:42', '2020-06-20 10:25:42'),
(1950, 2, 'sc_admin/provider-user/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"malcolm_ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"2\",\"_token\":\"2rAMkNn6O53OwfP2WNsAZxvl9sUBTow6yI9tvQsR\"}', '2020-06-20 10:25:44', '2020-06-20 10:25:44'),
(1951, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:25:44', '2020-06-20 10:25:44'),
(1952, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:26:31', '2020-06-20 10:26:31'),
(1953, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:26:41', '2020-06-20 10:26:41'),
(1954, 5, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:26:44', '2020-06-20 10:26:44'),
(1955, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:26:46', '2020-06-20 10:26:46'),
(1956, 5, 'sc_admin/provider-user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"2\",\"_token\":\"13KeAVM2856vjggyjAeYaoHrP0o97O7sUze1EGJf\"}', '2020-06-20 10:26:48', '2020-06-20 10:26:48'),
(1957, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:26:49', '2020-06-20 10:26:49'),
(1958, 5, 'sc_admin/provider-user/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"2\",\"_token\":\"13KeAVM2856vjggyjAeYaoHrP0o97O7sUze1EGJf\"}', '2020-06-20 10:26:56', '2020-06-20 10:26:56'),
(1959, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-20 10:26:56', '2020-06-20 10:26:56'),
(1960, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:27:24', '2020-06-20 10:27:24'),
(1961, 5, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:27:26', '2020-06-20 10:27:26'),
(1962, 5, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:27:30', '2020-06-20 10:27:30'),
(1963, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:06', '2020-06-20 10:29:06'),
(1964, 5, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:24', '2020-06-20 10:29:24'),
(1965, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:38', '2020-06-20 10:29:38'),
(1966, 5, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:41', '2020-06-20 10:29:41'),
(1967, 5, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:47', '2020-06-20 10:29:47'),
(1968, 5, 'sc_admin/provider-role/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:51', '2020-06-20 10:29:51'),
(1969, 5, 'sc_admin/provider-role/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Gi\\u00e1m \\u0111\\u1ed1c\",\"slug\":\"giam-doc\",\"order_status\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1970, 5, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1971, 5, 'sc_admin/provider-role/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:30:03', '2020-06-20 10:30:03'),
(1972, 5, 'sc_admin/provider-role/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Nh\\u00e2n vi\\u00ean kho\",\"slug\":null,\"order_status\":[\"2\",\"3\",\"4\"],\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:30:16', '2020-06-20 10:30:16'),
(1973, 5, 'sc_admin/provider-role/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:30:17', '2020-06-20 10:30:17'),
(1974, 5, 'sc_admin/provider-role/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Nh\\u00e2n vi\\u00ean kho\",\"slug\":\"nhan-vien-kho\",\"order_status\":[\"2\",\"3\",\"4\"],\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:30:26', '2020-06-20 10:30:26'),
(1975, 5, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:30:26', '2020-06-20 10:30:26'),
(1976, 5, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:30:54', '2020-06-20 10:30:54'),
(1977, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:31:14', '2020-06-20 10:31:14'),
(1978, 1, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:31:16', '2020-06-20 10:31:16'),
(1979, 5, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:31:31', '2020-06-20 10:31:31'),
(1980, 5, 'sc_admin/provider/show/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:31:51', '2020-06-20 10:31:51'),
(1981, 5, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:33:13', '2020-06-20 10:33:13'),
(1982, 5, 'sc_admin/provider/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:33:14', '2020-06-20 10:33:14'),
(1983, 5, 'sc_admin/provider', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:33:35', '2020-06-20 10:33:35'),
(1984, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:33:38', '2020-06-20 10:33:38'),
(1985, 5, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:08', '2020-06-20 10:34:08'),
(1986, 5, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:34:10', '2020-06-20 10:34:10'),
(1987, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:10', '2020-06-20 10:34:10'),
(1988, 5, 'sc_admin/provider-user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:19', '2020-06-20 10:34:19'),
(1989, 5, 'sc_admin/provider-user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/s-cart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"provider_role\":\"1\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:34:20', '2020-06-20 10:34:20'),
(1990, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:20', '2020-06-20 10:34:20'),
(1991, 5, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:27', '2020-06-20 10:34:27'),
(1992, 5, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":null,\"username\":null,\"email\":null,\"avatar\":null,\"password\":null,\"password_confirmation\":null,\"provider_role\":null,\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:34:28', '2020-06-20 10:34:28'),
(1993, 5, 'sc_admin/provider-user/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:29', '2020-06-20 10:34:29'),
(1994, 5, 'sc_admin/provider-user/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Watson Schuppe I\",\"username\":\"Agustin18\",\"email\":\"tempmail34157@emailna.co\",\"avatar\":\"Illo eum aut aperiam quae ut ab perferendis.\",\"password\":\"2011TitHnAhK@@\",\"password_confirmation\":\"2011TitHnAhK@@\",\"provider_role\":\"2\",\"_token\":\"v0fGfj0E1HLsnTJn7ow1BkSN3XkJ2NAuSksEw6n7\"}', '2020-06-20 10:34:33', '2020-06-20 10:34:33'),
(1995, 5, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:33', '2020-06-20 10:34:33'),
(1996, 5, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:34:57', '2020-06-20 10:34:57'),
(1997, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:35:08', '2020-06-20 10:35:08'),
(1998, 5, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:35:38', '2020-06-20 10:35:38'),
(1999, 5, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:35:38', '2020-06-20 10:35:38'),
(2000, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:35:44', '2020-06-20 10:35:44'),
(2001, 5, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:36:49', '2020-06-20 10:36:49'),
(2002, 5, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:36:49', '2020-06-20 10:36:49'),
(2003, 1, 'sc_admin/order_status/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:36:55', '2020-06-20 10:36:55'),
(2004, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:37:39', '2020-06-20 10:37:39'),
(2005, 1, 'sc_admin/order_status/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"T\\u1ea1o sort\",\"_token\":\"DhBgikUQ8JjTW84HIqzLrl0pKrTt73ECjZ7UplUF\"}', '2020-06-20 10:37:44', '2020-06-20 10:37:44'),
(2006, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-20 10:37:44', '2020-06-20 10:37:44'),
(2007, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:07:23', '2020-06-21 07:07:23'),
(2008, 1, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:07:27', '2020-06-21 07:07:27'),
(2009, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:07:41', '2020-06-21 07:07:41'),
(2010, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:12:50', '2020-06-21 07:12:50'),
(2011, 1, 'sc_admin/order_status/edit/10', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:14:48', '2020-06-21 07:14:48'),
(2012, 1, 'sc_admin/order_status/edit/10', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:16:38', '2020-06-21 07:16:38'),
(2013, 1, 'sc_admin/order_status/edit/10', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:17:56', '2020-06-21 07:17:56'),
(2014, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:17:59', '2020-06-21 07:17:59'),
(2015, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:18:50', '2020-06-21 07:18:50'),
(2016, 1, 'sc_admin/order_status/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":null,\"sort\":null,\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:18:52', '2020-06-21 07:18:52'),
(2017, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:18:52', '2020-06-21 07:18:52'),
(2018, 1, 'sc_admin/order_status/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":null,\"sort\":null,\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:21:21', '2020-06-21 07:21:21'),
(2019, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:21:22', '2020-06-21 07:21:22'),
(2020, 1, 'sc_admin/order_status/create', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"asdad\",\"sort\":\"asd\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:21:36', '2020-06-21 07:21:36'),
(2021, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:21:36', '2020-06-21 07:21:36'),
(2022, 1, 'sc_admin/order_status/create', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:42', '2020-06-21 07:23:42'),
(2023, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:44', '2020-06-21 07:23:44'),
(2024, 1, 'sc_admin/order_status/edit/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:46', '2020-06-21 07:23:46'),
(2025, 1, 'sc_admin/order_status/edit/1', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Kh\\u1edfi t\\u1ea1o\",\"sort\":\"1\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:23:49', '2020-06-21 07:23:49'),
(2026, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:49', '2020-06-21 07:23:49'),
(2027, 1, 'sc_admin/order_status/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:51', '2020-06-21 07:23:51'),
(2028, 1, 'sc_admin/order_status/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"X\\u00e1c nh\\u1eadn\",\"sort\":\"02\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:23:55', '2020-06-21 07:23:55'),
(2029, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:55', '2020-06-21 07:23:55'),
(2030, 1, 'sc_admin/order_status/edit/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:23:57', '2020-06-21 07:23:57'),
(2031, 1, 'sc_admin/order_status/edit/3', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Ph\\u00ea duy\\u1ec7t\",\"sort\":\"3\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:00', '2020-06-21 07:24:00'),
(2032, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:00', '2020-06-21 07:24:00'),
(2033, 1, 'sc_admin/order_status/edit/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:02', '2020-06-21 07:24:02'),
(2034, 1, 'sc_admin/order_status/edit/4', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"\\u0110ang th\\u1ef1c hi\\u1ec7n\",\"sort\":\"4\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:05', '2020-06-21 07:24:05'),
(2035, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:05', '2020-06-21 07:24:05'),
(2036, 1, 'sc_admin/order_status/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:07', '2020-06-21 07:24:07'),
(2037, 1, 'sc_admin/order_status/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Ho\\u00e0n th\\u00e0nh\",\"sort\":\"5\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:10', '2020-06-21 07:24:10'),
(2038, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:11', '2020-06-21 07:24:11'),
(2039, 1, 'sc_admin/order_status/edit/6', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:14', '2020-06-21 07:24:14'),
(2040, 1, 'sc_admin/order_status/edit/6', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"L\\u1ed7i th\\u1ef1c hi\\u1ec7n\",\"sort\":\"6\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:17', '2020-06-21 07:24:17'),
(2041, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:17', '2020-06-21 07:24:17'),
(2042, 1, 'sc_admin/order_status/edit/7', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:34', '2020-06-21 07:24:34'),
(2043, 1, 'sc_admin/order_status/edit/7', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"H\\u1ee7y b\\u1ecf\",\"sort\":\"07\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:38', '2020-06-21 07:24:38'),
(2044, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:38', '2020-06-21 07:24:38'),
(2045, 1, 'sc_admin/order_status/delete', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"ids\":\"10\",\"_token\":\"9rOGIKeYGmGI0N9e4MBw7a2sEI03l1gTc6v1BsXA\"}', '2020-06-21 07:24:42', '2020-06-21 07:24:42'),
(2046, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"_pjax\":\"#pjax-container\"}', '2020-06-21 07:24:42', '2020-06-21 07:24:42'),
(2047, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 07:24:54', '2020-06-21 07:24:54'),
(2048, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:18:18', '2020-06-21 08:18:18'),
(2049, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:18:26', '2020-06-21 08:18:26'),
(2050, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:18:37', '2020-06-21 08:18:37'),
(2051, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:18:42', '2020-06-21 08:18:42'),
(2052, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:18:59', '2020-06-21 08:18:59'),
(2053, 2, 'sc_admin/auth/setting', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:20:14', '2020-06-21 08:20:14'),
(2054, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:20:14', '2020-06-21 08:20:14'),
(2055, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:21', '2020-06-21 08:21:21'),
(2056, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:25', '2020-06-21 08:21:25'),
(2057, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:28', '2020-06-21 08:21:28'),
(2058, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:32', '2020-06-21 08:21:32'),
(2059, 1, 'sc_admin/user/edit/2', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Michelle Mohr Jr.\",\"username\":\"provider\",\"email\":\"tempmail86529@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/scart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"_token\":\"1kfppP3dFmwjsp5cBKs4eMQi5W1Pk3Dc1b2zsM8I\"}', '2020-06-21 08:21:37', '2020-06-21 08:21:37'),
(2060, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:38', '2020-06-21 08:21:38'),
(2061, 1, 'sc_admin/user/edit/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:40', '2020-06-21 08:21:40'),
(2062, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:42', '2020-06-21 08:21:42'),
(2063, 1, 'sc_admin/user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:44', '2020-06-21 08:21:44'),
(2064, 1, 'sc_admin/user/edit/5', 'POST', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '{\"name\":\"Rhoda Altenwerth\",\"username\":\"malcolm_ryan32\",\"email\":\"tempmail25219@emailna.co\",\"avatar\":\"http:\\/\\/localhost\\/scart\\/public\\/data\\/avatar\\/user.jpg\",\"password\":null,\"password_confirmation\":null,\"roles\":[\"7\"],\"provider_id\":\"2\",\"_token\":\"1kfppP3dFmwjsp5cBKs4eMQi5W1Pk3Dc1b2zsM8I\"}', '2020-06-21 08:21:49', '2020-06-21 08:21:49'),
(2065, 1, 'sc_admin/user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:21:49', '2020-06-21 08:21:49'),
(2066, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:22:00', '2020-06-21 08:22:00'),
(2067, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:22:04', '2020-06-21 08:22:04'),
(2068, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:23:31', '2020-06-21 08:23:31'),
(2069, 2, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:24:49', '2020-06-21 08:24:49'),
(2070, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:27:28', '2020-06-21 08:27:28'),
(2071, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:27:32', '2020-06-21 08:27:32'),
(2072, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:27:34', '2020-06-21 08:27:34'),
(2073, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:27:59', '2020-06-21 08:27:59'),
(2074, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:29:11', '2020-06-21 08:29:11'),
(2075, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:34:09', '2020-06-21 08:34:09'),
(2076, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:35:12', '2020-06-21 08:35:12'),
(2077, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:35:18', '2020-06-21 08:35:18'),
(2078, 2, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:35:22', '2020-06-21 08:35:22'),
(2079, 2, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:35:22', '2020-06-21 08:35:22'),
(2080, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:35:23', '2020-06-21 08:35:23'),
(2081, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:36:00', '2020-06-21 08:36:00'),
(2082, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:37:37', '2020-06-21 08:37:37'),
(2083, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:38:35', '2020-06-21 08:38:35'),
(2084, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:45:02', '2020-06-21 08:45:02'),
(2085, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:45:14', '2020-06-21 08:45:14'),
(2086, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:46:29', '2020-06-21 08:46:29'),
(2087, 2, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:46:41', '2020-06-21 08:46:41'),
(2088, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:46:48', '2020-06-21 08:46:48'),
(2089, 2, 'sc_admin/provider-user/edit/5', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:10', '2020-06-21 08:47:10'),
(2090, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:18', '2020-06-21 08:47:18'),
(2091, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:21', '2020-06-21 08:47:21'),
(2092, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:31', '2020-06-21 08:47:31'),
(2093, 5, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:34', '2020-06-21 08:47:34'),
(2094, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:47:37', '2020-06-21 08:47:37'),
(2095, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:57:46', '2020-06-21 08:57:46'),
(2096, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 08:57:48', '2020-06-21 08:57:48'),
(2097, 5, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:15:35', '2020-06-21 09:15:35'),
(2098, 1, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:15:44', '2020-06-21 09:15:44'),
(2099, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:15:47', '2020-06-21 09:15:47'),
(2100, 1, 'sc_admin/payment_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:24:49', '2020-06-21 09:24:49'),
(2101, 1, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:24:50', '2020-06-21 09:24:50'),
(2102, 1, 'sc_admin/payment_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:24:53', '2020-06-21 09:24:53'),
(2103, 1, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:01', '2020-06-21 09:25:01'),
(2104, 1, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:04', '2020-06-21 09:25:04'),
(2105, 1, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:06', '2020-06-21 09:25:06'),
(2106, 1, 'sc_admin/order/detail/2', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:09', '2020-06-21 09:25:09'),
(2107, 1, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:12', '2020-06-21 09:25:12'),
(2108, 1, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:16', '2020-06-21 09:25:16'),
(2109, 2, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:21', '2020-06-21 09:25:21'),
(2110, 2, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:25', '2020-06-21 09:25:25'),
(2111, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:33', '2020-06-21 09:25:33'),
(2112, 2, 'sc_admin/order/detail/1', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:25:47', '2020-06-21 09:25:47'),
(2113, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:27:25', '2020-06-21 09:27:25'),
(2114, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:27:55', '2020-06-21 09:27:55'),
(2115, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:28:07', '2020-06-21 09:28:07'),
(2116, 2, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:30:08', '2020-06-21 09:30:08'),
(2117, 2, 'sc_admin/provider-role', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:30:19', '2020-06-21 09:30:19'),
(2118, 2, 'sc_admin/provider-user', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:30:29', '2020-06-21 09:30:29'),
(2119, 2, 'sc_admin/auth/logout', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:33:42', '2020-06-21 09:33:42');
INSERT INTO `sc_admin_log` (`id`, `user_id`, `path`, `method`, `ip`, `user_agent`, `input`, `created_at`, `updated_at`) VALUES
(2120, 5, 'sc_admin', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:33:46', '2020-06-21 09:33:46'),
(2121, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:33:51', '2020-06-21 09:33:51'),
(2122, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:33:53', '2020-06-21 09:33:53'),
(2123, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:34:00', '2020-06-21 09:34:00'),
(2124, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:35:05', '2020-06-21 09:35:05'),
(2125, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:36:03', '2020-06-21 09:36:03'),
(2126, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:47:29', '2020-06-21 09:47:29'),
(2127, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:52:32', '2020-06-21 09:52:32'),
(2128, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 09:52:50', '2020-06-21 09:52:50'),
(2129, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:02:28', '2020-06-21 10:02:28'),
(2130, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:03:16', '2020-06-21 10:03:16'),
(2131, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:07:42', '2020-06-21 10:07:42'),
(2132, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:08:07', '2020-06-21 10:08:07'),
(2133, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:11:17', '2020-06-21 10:11:17'),
(2134, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:11:30', '2020-06-21 10:11:30'),
(2135, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:11:41', '2020-06-21 10:11:41'),
(2136, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:12:26', '2020-06-21 10:12:26'),
(2137, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:19:10', '2020-06-21 10:19:10'),
(2138, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:21:39', '2020-06-21 10:21:39'),
(2139, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:21:58', '2020-06-21 10:21:58'),
(2140, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:22:33', '2020-06-21 10:22:33'),
(2141, 5, 'sc_admin/order_status', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:22:44', '2020-06-21 10:22:44'),
(2142, 5, 'sc_admin/deny', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:22:44', '2020-06-21 10:22:44'),
(2143, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:22:47', '2020-06-21 10:22:47'),
(2144, 5, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:23:06', '2020-06-21 10:23:06'),
(2145, 5, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:24:50', '2020-06-21 10:24:50'),
(2146, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:24:57', '2020-06-21 10:24:57'),
(2147, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:26:47', '2020-06-21 10:26:47'),
(2148, 5, 'sc_admin/order/detail/4', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:27:00', '2020-06-21 10:27:00'),
(2149, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:27:10', '2020-06-21 10:27:10'),
(2150, 5, 'sc_admin/order/detail/3', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:27:17', '2020-06-21 10:27:17'),
(2151, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:28:10', '2020-06-21 10:28:10'),
(2152, 5, 'sc_admin/order', 'GET', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '[]', '2020-06-21 10:31:44', '2020-06-21 10:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_menu`
--

CREATE TABLE `sc_admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_menu`
--

INSERT INTO `sc_admin_menu` (`id`, `parent_id`, `sort`, `title`, `icon`, `uri`, `type`, `key`, `permission`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 'lang::admin.menu_titles.order_manager', 'fa-cart-arrow-down', '', 0, 'ORDER_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(2, 6, 3, 'lang::admin.menu_titles.catalog_mamager', 'fa-folder-open', '', 0, 'CATALOG_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(3, 6, 4, 'lang::admin.menu_titles.customer_manager', 'fa-group', '', 0, 'CUSTOMER_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(4, 8, 1, 'lang::admin.menu_titles.template_layout', 'fa-object-ungroup', '', 0, 'TEMPLATE', NULL, NULL, '2020-06-20 04:03:48'),
(5, 9, 2, 'lang::admin.menu_titles.config_manager', 'fa-cogs', '', 0, 'CONFIG_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(6, 0, 1, 'lang::ADMIN SHOP', 'fa-minus', '', 0, 'ADMIN_SHOP', NULL, NULL, '2020-06-20 04:03:48'),
(7, 0, 2, 'lang::ADMIN CONTENT', 'fa-minus', '', 0, 'ADMIN_CONTENT', NULL, NULL, '2020-06-20 04:03:48'),
(8, 0, 3, 'lang::ADMIN EXTENSION', 'fa-minus', '', 0, 'ADMIN_EXTENSION', NULL, NULL, '2020-06-20 04:03:48'),
(9, 0, 4, 'lang::ADMIN SYSTEM', 'fa-minus', '', 0, 'ADMIN_SYSTEM', NULL, NULL, '2020-06-20 04:03:48'),
(10, 7, 2, 'lang::page.admin.title', 'fa-clone', 'admin::page', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(11, 1, 4, 'lang::shipping_status.admin.title', 'fa-truck', 'admin::shipping_status', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(12, 1, 1, 'lang::order.admin.title', 'fa-shopping-cart', 'admin::order', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(13, 1, 2, 'lang::order_status.admin.title', 'fa-asterisk', 'admin::order_status', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(14, 1, 3, 'lang::payment_status.admin.title', 'fa-recycle', 'admin::payment_status', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(15, 2, 1, 'lang::product.admin.title', 'fa-file-photo-o', 'admin::product', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(16, 2, 2, 'lang::category.admin.title', 'fa-folder-open-o', 'admin::category', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(17, 2, 3, 'lang::supplier.admin.title', 'fa-user-secret', 'admin::supplier', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(18, 2, 4, 'lang::brand.admin.title', 'fa-bank', 'admin::brand', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(19, 2, 5, 'lang::attribute_group.admin.title', 'fa-bars', 'admin::attribute_group', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(20, 3, 1, 'lang::customer.admin.title', 'fa-user', 'admin::customer', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(21, 3, 2, 'lang::subscribe.admin.title', 'fa-user-circle-o', 'admin::subscribe', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(22, 4, 1, 'lang::block_content.admin.title', 'fa-newspaper-o', 'admin::block_content', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(23, 4, 2, 'lang::admin.menu_titles.block_link', 'fa-chrome', 'admin::link', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(24, 4, 3, 'lang::admin.menu_titles.template_manager', 'fa-columns', 'admin::template', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(26, 5, 1, 'lang::store_info.admin.title', 'fa-h-square', 'admin::store_info', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(27, 5, 5, 'lang::admin.menu_titles.email_setting', 'fa-envelope', '', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(28, 27, 0, 'lang::email.admin.title', 'fa-cog', 'admin::email', 0, NULL, NULL, NULL, NULL),
(29, 27, 0, 'lang::email_template.admin.title', 'fa-bars', 'admin::email_template', 0, NULL, NULL, NULL, NULL),
(30, 5, 6, 'lang::admin.menu_titles.localisation', 'fa-shirtsinbulk', '', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(31, 30, 0, 'lang::language.admin.title', 'fa-pagelines', 'admin::language', 0, NULL, NULL, NULL, NULL),
(32, 30, 0, 'lang::currency.admin.title', 'fa-dollar', 'admin::currency', 0, NULL, NULL, NULL, NULL),
(33, 7, 1, 'lang::banner.admin.title', 'fa-image', 'admin::banner', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(34, 5, 7, 'lang::backup.admin.title', 'fa-save', 'admin::backup', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(35, 8, 2, 'lang::admin.menu_titles.plugins', 'fa-puzzle-piece', '', 0, 'PLUGIN', NULL, NULL, '2020-06-20 04:03:48'),
(37, 9, 3, 'lang::admin.menu_titles.report_manager', 'fa-pie-chart', '', 0, 'REPORT_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(38, 9, 1, 'lang::admin.menu_titles.admin', 'fa-sitemap', '', 0, 'ADMIN', NULL, NULL, '2020-06-20 04:03:48'),
(39, 35, 1, 'plugin.Payment', 'fa-money', 'admin::plugin/payment', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(40, 35, 2, 'plugin.Shipping', 'fa-ambulance', 'admin::plugin/shipping', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(41, 35, 3, 'plugin.Total', 'fa-cog', 'admin::plugin/total', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(42, 35, 5, 'plugin.Other', 'fa-circle-thin', 'admin::plugin/other', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(43, 35, 4, 'plugin.Cms', 'fa-modx', 'admin::plugin/cms', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(46, 38, 1, 'lang::admin.menu_titles.users', 'fa-users', 'admin::user', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(47, 38, 2, 'lang::admin.menu_titles.roles', 'fa-user', 'admin::role', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(48, 38, 3, 'lang::admin.menu_titles.permission', 'fa-ban', 'admin::permission', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(49, 38, 4, 'lang::admin.menu_titles.menu', 'fa-bars', 'admin::menu', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(50, 38, 5, 'lang::admin.menu_titles.operation_log', 'fa-history', 'admin::log', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(52, 7, 3, 'lang::news.admin.title', 'fa-file-powerpoint-o', 'admin::news', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(53, 5, 3, 'lang::setting.title', 'fa-cog', 'admin::setting', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(54, 37, 1, 'lang::admin.menu_titles.report_product', 'fa-bars', 'admin::report/product', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(55, 2, 9, 'lang::product.config_manager.title', 'fa fa-cog', 'admin::product_config', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(56, 3, 3, 'lang::customer.config_manager.title', 'fa fa-cog', 'admin::customer_config', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(57, 5, 2, 'lang::link.config_manager.title', 'fa-gg', 'admin::url_config', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(58, 5, 8, 'lang::admin.menu_titles.cache_manager', 'fa-tripadvisor', 'admin::cache_config', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(59, 9, 4, 'lang::admin.menu_titles.api_manager', 'fa-plug', 'admin::api_connection', 0, 'API_MANAGER', NULL, NULL, '2020-06-20 04:03:48'),
(60, 5, 4, 'lang::maintain.config_manager.title', 'fa-flag', 'admin::maintain', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(61, 2, 6, 'lang::tax.admin.admin_title', 'fa-calendar-minus-o', 'admin::tax', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(62, 2, 7, 'lang::weight.admin.title', 'fa-balance-scale', 'admin::weight_unit', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(63, 2, 8, 'lang::length.admin.title', 'fa-minus', 'admin::length_unit', 0, NULL, NULL, NULL, '2020-06-20 04:03:48'),
(64, 65, 1, 'Quản lý Đại lý', 'fa-codepen', 'admin::provider', 0, NULL, NULL, '2020-06-11 03:17:25', '2020-06-20 04:03:48'),
(65, 6, 1, 'Quản lý đại lý', 'fa-archive', '', 0, NULL, NULL, '2020-06-19 02:35:28', '2020-06-20 04:03:48'),
(66, 65, 2, 'Nhóm quyền Đại lý', 'fa-balance-scale', 'admin::provider-role', 0, NULL, NULL, '2020-06-19 02:59:16', '2020-06-20 04:03:48'),
(67, 65, 0, 'Tài khoản Đại lý', 'fa-coffee', 'admin::provider-user', 0, NULL, NULL, '2020-06-20 04:44:00', '2020-06-20 04:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_menu_permission`
--

CREATE TABLE `sc_admin_menu_permission` (
  `menu_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_permission`
--

CREATE TABLE `sc_admin_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_uri` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_permission`
--

INSERT INTO `sc_admin_permission` (`id`, `name`, `slug`, `http_uri`, `created_at`, `updated_at`) VALUES
(1, 'Admin manager', 'admin.manager', 'GET::sc_admin/user,GET::sc_admin/role,GET::sc_admin/permission,ANY::sc_admin/log/*,ANY::sc_admin/menu/*', '2020-06-11 03:10:15', NULL),
(2, 'Dashboard', 'dashboard', 'GET::sc_admin', '2020-06-11 03:10:15', NULL),
(3, 'Auth manager', 'auth.full', 'ANY::sc_admin/auth/*', '2020-06-11 03:10:15', NULL),
(4, 'Setting manager', 'setting.full', '\n                    ANY::sc_admin/store_info/*,\n                    ANY::sc_admin/setting/*,\n                    ANY::sc_admin/url_config/*,\n                    ANY::sc_admin/product_config/*,\n                    ANY::sc_admin/customer_config/*,\n                    ANY::sc_admin/cache_config/*,\n                    ANY::sc_admin/email/*,\n                    ANY::sc_admin/email_template/*,\n                    ANY::sc_admin/language/*,\n                    ANY::sc_admin/currency/*,\n                    ANY::sc_admin/backup/*,\n                    ANY::sc_admin/api_connection/*,\n                    ANY::sc_admin/maintain/*,\n                    ANY::sc_admin/tax/*\n                ', '2020-06-11 03:10:15', NULL),
(6, 'Plugin manager', 'plugin.full', 'ANY::sc_admin/plugin/*', '2020-06-11 03:10:15', NULL),
(8, 'Provider 1', 'xe-may', '', '2020-06-11 03:10:15', '2020-06-20 02:41:48'),
(11, 'Discount manager', 'discount.full', 'ANY::sc_admin/shop_discount/*', '2020-06-11 03:10:15', NULL),
(14, 'Shipping status', 'shipping_status.full', 'ANY::sc_admin/shipping_status/*', '2020-06-11 03:10:15', NULL),
(15, 'Payment  status', 'payment_status.full', 'ANY::sc_admin/payment_status/*', '2020-06-11 03:10:15', NULL),
(17, 'Customer manager', 'customer.full', 'ANY::sc_admin/customer/*,ANY::sc_admin/subscribe/*', '2020-06-11 03:10:15', NULL),
(18, 'Order status', 'order_status.full', 'ANY::sc_admin/order_status/*', '2020-06-11 03:10:15', NULL),
(19, 'Product manager', 'product.full', '\n                ANY::sc_admin/category/*,\n                ANY::sc_admin/supplier/*,\n                ANY::sc_admin/brand/*,\n                ANY::sc_admin/attribute_group/*,\n                ANY::sc_admin/product/,\n                ANY::sc_admin/weight_unit/*,\n                ANY::sc_admin/length_unit/*\n                ', '2020-06-11 03:10:15', NULL),
(20, 'Order Manager', 'order.full', 'ANY::sc_admin/order/*', '2020-06-11 03:10:15', NULL),
(21, 'Report manager', 'report.full', 'ANY::sc_admin/report/*', '2020-06-11 03:10:15', NULL),
(22, 'Template manager', 'template.full', 'ANY::sc_admin/block_content/*,ANY::sc_admin/link/*,ANY::sc_admin/template/*', '2020-06-11 03:10:15', NULL),
(23, 'Provider User', 'provider-manager', 'ANY::sc_admin/uploads/*,GET::sc_admin/order,GET::sc_admin/order/detail/{id},POST::sc_admin/order/update,GET::sc_admin/order/product_info,GET::sc_admin/order/user_info,GET::sc_admin/order/export_detail,GET::sc_admin/provider,GET::sc_admin/provider/edit/{id},POST::sc_admin/provider/edit/{id},GET::sc_admin/provider/show/{id},POST::sc_admin/provider/show/{id},ANY::sc_admin/provider-role/*,ANY::sc_admin/provider-user/*', '2020-06-16 03:27:35', '2020-06-20 09:08:09');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_role`
--

CREATE TABLE `sc_admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_role`
--

INSERT INTO `sc_admin_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2020-06-11 03:10:15', NULL),
(2, 'Group only View', 'view.all', '2020-06-11 03:10:15', NULL),
(3, 'Manager', 'manager', '2020-06-11 03:10:15', NULL),
(4, 'Cms manager', 'cms', '2020-06-11 03:10:15', NULL),
(5, 'Accountant', 'accountant', '2020-06-11 03:10:15', NULL),
(6, 'Marketing', 'maketing', '2020-06-11 03:10:15', NULL),
(7, 'Provider\'s User', 'provider-manager', '2020-06-16 03:28:19', '2020-06-20 06:51:57');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_role_menu`
--

CREATE TABLE `sc_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_role_menu`
--

INSERT INTO `sc_admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 38, '2020-06-11 03:10:15', NULL),
(2, 38, '2020-06-11 03:10:15', NULL),
(3, 38, '2020-06-11 03:10:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_role_permission`
--

CREATE TABLE `sc_admin_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_role_permission`
--

INSERT INTO `sc_admin_role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(3, 1, '2020-06-11 03:10:15', NULL),
(3, 2, '2020-06-11 03:10:15', NULL),
(3, 3, '2020-06-11 03:10:15', NULL),
(3, 4, '2020-06-11 03:10:15', NULL),
(3, 8, '2020-06-11 03:10:15', NULL),
(3, 11, '2020-06-11 03:10:15', NULL),
(3, 14, '2020-06-11 03:10:15', NULL),
(3, 15, '2020-06-11 03:10:15', NULL),
(3, 17, '2020-06-11 03:10:15', NULL),
(3, 18, '2020-06-11 03:10:15', NULL),
(3, 19, '2020-06-11 03:10:15', NULL),
(3, 20, '2020-06-11 03:10:15', NULL),
(3, 21, '2020-06-11 03:10:15', NULL),
(3, 22, '2020-06-11 03:10:15', NULL),
(4, 3, '2020-06-11 03:10:15', NULL),
(4, 8, '2020-06-11 03:10:15', NULL),
(5, 2, '2020-06-11 03:10:15', NULL),
(5, 3, '2020-06-11 03:10:15', NULL),
(5, 20, '2020-06-11 03:10:15', NULL),
(5, 21, '2020-06-11 03:10:15', NULL),
(6, 2, '2020-06-11 03:10:15', NULL),
(6, 3, '2020-06-11 03:10:15', NULL),
(6, 8, '2020-06-11 03:10:15', NULL),
(6, 11, '2020-06-11 03:10:15', NULL),
(6, 14, '2020-06-11 03:10:15', NULL),
(6, 15, '2020-06-11 03:10:15', NULL),
(6, 17, '2020-06-11 03:10:15', NULL),
(6, 18, '2020-06-11 03:10:15', NULL),
(6, 19, '2020-06-11 03:10:15', NULL),
(6, 20, '2020-06-11 03:10:15', NULL),
(6, 21, '2020-06-11 03:10:15', NULL),
(7, 2, NULL, NULL),
(7, 23, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_role_user`
--

CREATE TABLE `sc_admin_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_role_user`
--

INSERT INTO `sc_admin_role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(7, 2, NULL, NULL),
(7, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_store`
--

CREATE TABLE `sc_admin_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_active` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_store`
--

INSERT INTO `sc_admin_store` (`id`, `logo`, `phone`, `long_phone`, `email`, `time_active`, `address`, `office`, `warehouse`, `template`) VALUES
(1, '/data/logo/scart-mid.png', '0123456789', 'Support: 0987654321', 'admin-demo@s-cart.org', '', '123st - abc - xyz', NULL, NULL, 'thaihungecommerce');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_store_description`
--

CREATE TABLE `sc_admin_store_description` (
  `config_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintain_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_store_description`
--

INSERT INTO `sc_admin_store_description` (`config_id`, `lang`, `title`, `description`, `keyword`, `maintain_content`) VALUES
(1, 'en', 'Demo S-cart : Free Laravel eCommerce for Business', 'Free website shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\n<h3><span style=\"color:#e74c3c;\"><strong>Sorry! We are currently doing site maintenance!</strong></span></h3>\n</center>'),
(1, 'vi', 'Demo S-cart: Mã nguồn website thương mại điện tử miễn phí cho doanh nghiệp', 'Laravel shopping cart for business', '', '<center><img src=\"/images/maintenance.png\" />\n<h3><span style=\"color:#e74c3c;\"><strong>Xin lỗi! Hiện tại website đang bảo trì!</strong></span></h3>\n</center>');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_user`
--

CREATE TABLE `sc_admin_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_role` int(11) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_admin_user`
--

INSERT INTO `sc_admin_user` (`id`, `username`, `password`, `name`, `email`, `provider_id`, `provider_role`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$JcmAHe5eUZ2rS0jU1GWr/.xhwCnh2RU13qwjTPcqfmtZXjZxcryPO', 'Administrator', 'your-email@your-domain.com', NULL, NULL, '/admin/avatar/user.jpg', NULL, '2020-06-11 03:10:15', NULL),
(2, 'provider', '$2y$10$ls3MsDQHg6bPwvWDz7RLiu38sDF.iDqzZEirx5NyaMHsYtlwWicqG', 'Michelle Mohr Jr.', 'tempmail86529@emailna.co', 2, 1, 'http://localhost/scart/public/data/avatar/user.jpg', NULL, '2020-06-16 03:28:48', '2020-06-21 08:21:38'),
(5, 'malcolm_ryan32', '$2y$10$61Cl52su4/nE.kSZNnXmbe3IYilP1SWrBOZsOoReri0QBcRr1jKKG', 'Rhoda Altenwerth', 'tempmail25219@emailna.co', 2, 2, 'http://localhost/scart/public/data/avatar/user.jpg', NULL, '2020-06-20 10:09:41', '2020-06-21 08:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `sc_admin_user_permission`
--

CREATE TABLE `sc_admin_user_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_api_connection`
--

CREATE TABLE `sc_api_connection` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiconnection` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apikey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` date DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_api_connection`
--

INSERT INTO `sc_api_connection` (`id`, `description`, `apiconnection`, `apikey`, `expire`, `last_active`, `status`) VALUES
(1, 'Demo api connection', 'appmobile', '5ee1a097e70b0', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_provider_products`
--

CREATE TABLE `sc_provider_products` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sc_provider_products`
--

INSERT INTO `sc_provider_products` (`id`, `provider_id`, `product_id`, `create_at`, `update_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_provider_role`
--

CREATE TABLE `sc_provider_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_provider_role`
--

INSERT INTO `sc_provider_role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Giám đốc', 'giam-doc', '2020-06-19 03:05:15', NULL),
(2, 'Nhân viên kho', 'nhan-vien-kho', '2020-06-20 02:40:07', '2020-06-20 10:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `sc_provider_role_order`
--

CREATE TABLE `sc_provider_role_order` (
  `role_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_provider_role_order`
--

INSERT INTO `sc_provider_role_order` (`role_id`, `order_status_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 2, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 3, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 4, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 5, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 6, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(1, 7, '2020-06-20 10:29:58', '2020-06-20 10:29:58'),
(2, 2, '2020-06-20 10:30:26', '2020-06-20 10:30:26'),
(2, 3, '2020-06-20 10:30:26', '2020-06-20 10:30:26'),
(2, 4, '2020-06-20 10:30:26', '2020-06-20 10:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_attribute_group`
--

CREATE TABLE `sc_shop_attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'radio,select,checkbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_attribute_group`
--

INSERT INTO `sc_shop_attribute_group` (`id`, `name`, `status`, `sort`, `type`) VALUES
(1, 'Color', 1, 1, 'radio'),
(2, 'Size', 1, 2, 'select');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_banner`
--

CREATE TABLE `sc_shop_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `click` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_banner`
--

INSERT INTO `sc_shop_banner` (`id`, `image`, `url`, `target`, `html`, `status`, `sort`, `click`, `type`, `created_at`, `updated_at`) VALUES
(1, 'http://localhost/s-cart/public/data/banner/banner-02.jpg', NULL, '_self', NULL, 1, 0, 2, 0, NULL, '2020-06-16 07:29:39'),
(2, 'http://localhost/s-cart/public/data/banner/banner-01.png', NULL, '_self', NULL, 1, 0, 0, 0, NULL, '2020-06-11 03:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_block_content`
--

CREATE TABLE `sc_shop_block_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_block_content`
--

INSERT INTO `sc_shop_block_content` (`id`, `name`, `position`, `page`, `type`, `text`, `status`, `sort`) VALUES
(1, 'Facebook code', 'top', '*', 'html', '<div id=\"fb-root\"></div>\n<script>(function(d, s, id) {\n  var js, fjs = d.getElementsByTagName(s)[0];\n  if (d.getElementById(id)) return;\n  js = d.createElement(s); js.id = id;\n  js.src = \'//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=934208239994473\';\n  fjs.parentNode.insertBefore(js, fjs);\n}(document, \'script\', \'facebook-jssdk\'));\n</script>', 1, 0),
(2, 'Google Analytics', 'header', '*', 'html', '<!-- Global site tag (gtag.js) - Google Analytics -->\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-128658138-1\"></script>\n<script>\n  window.dataLayer = window.dataLayer || [];\n  function gtag(){dataLayer.push(arguments);}\n  gtag(\'js\', new Date());\n  gtag(\'config\', \'UA-128658138-1\');\n</script>', 1, 0),
(3, 'Product special', 'left', '', 'view', 'product_special', 0, 1),
(4, 'Brands', 'left', '', 'view', 'brands_left', 0, 3),
(5, 'Banner home', 'banner_top', '*', 'view', 'banner_image', 1, 0),
(6, 'Categories', 'left', 'product_list', 'view', 'categories', 1, 4),
(7, 'Product last view', 'left', '', 'view', 'product_lastview', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_brand`
--

CREATE TABLE `sc_shop_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_brand`
--

INSERT INTO `sc_shop_brand` (`id`, `name`, `alias`, `image`, `url`, `status`, `sort`) VALUES
(1, 'Husq', 'husq', '/data/brand/01-181x52.png', '', 1, 0),
(2, 'Ideal', 'ideal', '/data/brand/02-181x52.png', '', 1, 0),
(3, 'Apex', 'apex', '/data/brand/03-181x52.png', '', 1, 0),
(4, 'CST', 'cst', '/data/brand/04-181x52.png', '', 1, 0),
(5, 'Klein', 'klein', '/data/brand/05-181x52.png', '', 1, 0),
(6, 'Metabo', 'metabo', '/data/brand/06-181x52.png', '', 1, 0),
(7, 'Avatar', 'avatar', '/data/brand/07-181x52.png', '', 1, 0),
(8, 'Brand KA', 'brand-ka', '/data/brand/08-181x52.png', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_category`
--

CREATE TABLE `sc_shop_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `top` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_category`
--

INSERT INTO `sc_shop_category` (`id`, `image`, `alias`, `parent`, `top`, `status`, `sort`) VALUES
(1, '/data/category/img-40.jpg', 'electronics', 0, 1, 1, 0),
(2, '/data/category/img-44.jpg', 'clothing-wears', 0, 1, 1, 0),
(3, '/data/category/img-42.jpg', 'mobile', 1, 1, 1, 0),
(4, '/data/category/img-18.jpg', 'accessaries-extras', 0, 1, 1, 0),
(5, '/data/category/img-14.jpg', 'computers', 1, 1, 1, 0),
(6, '/data/category/img-14.jpg', 'tablets', 1, 0, 1, 0),
(7, '/data/category/img-40.jpg', 'appliances', 1, 0, 1, 0),
(8, '/data/category/img-14.jpg', 'men-clothing', 2, 0, 1, 0),
(9, '/data/category/img-18.jpg', 'women-clothing', 2, 1, 1, 0),
(10, '/data/category/img-14.jpg', 'kid-wear', 2, 0, 1, 0),
(11, '/data/category/img-40.jpg', 'mobile-accessaries', 4, 0, 1, 0),
(12, '/data/category/img-42.jpg4', 'women-accessaries', 4, 0, 1, 3),
(13, '/data/category/img-40.jpg', 'men-accessaries', 4, 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_category_description`
--

CREATE TABLE `sc_shop_category_description` (
  `category_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_category_description`
--

INSERT INTO `sc_shop_category_description` (`category_id`, `lang`, `title`, `keyword`, `description`) VALUES
(1, 'en', 'Electronics', '', ''),
(1, 'vi', 'Thiết bị điện tử', '', ''),
(2, 'en', 'Clothing & Wears', '', ''),
(2, 'vi', 'Quần áo', '', ''),
(3, 'en', 'Mobile', '', ''),
(3, 'vi', 'Điện thoại', '', ''),
(4, 'en', 'Accessaries & Extras', '', ''),
(4, 'vi', 'Phụ kiện ', '', ''),
(5, 'en', 'Computers', '', ''),
(5, 'vi', 'Máy tính', '', ''),
(6, 'en', 'Tablets', '', ''),
(6, 'vi', 'Máy tính bảng', '', ''),
(7, 'en', 'Appliances', '', ''),
(7, 'vi', 'Thiết bị', '', ''),
(8, 'en', 'Men\'s Clothing', '', ''),
(8, 'vi', 'Quần áo nam', '', ''),
(9, 'en', 'Women\'s Clothing', '', ''),
(9, 'vi', 'Quần áo nữ', '', ''),
(10, 'en', 'Kid\'s Wear', '', ''),
(10, 'vi', 'Đồ trẻ em', '', ''),
(11, 'en', 'Mobile Accessaries', '', ''),
(11, 'vi', 'Phụ kiện điện thoại', '', ''),
(12, 'en', 'Women\'s Accessaries', '', ''),
(12, 'vi', 'Phụ kiện nữ', '', ''),
(13, 'en', 'Men\'s Accessaries', '', ''),
(13, 'vi', 'Phụ kiện nam', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_country`
--

CREATE TABLE `sc_shop_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_country`
--

INSERT INTO `sc_shop_country` (`id`, `code`, `name`) VALUES
(1, 'AL', 'Albania'),
(2, 'DZ', 'Algeria'),
(3, 'DS', 'American Samoa'),
(4, 'AD', 'Andorra'),
(5, 'AO', 'Angola'),
(6, 'AI', 'Anguilla'),
(7, 'AQ', 'Antarctica'),
(8, 'AG', 'Antigua and Barbuda'),
(9, 'AR', 'Argentina'),
(10, 'AM', 'Armenia'),
(11, 'AW', 'Aruba'),
(12, 'AU', 'Australia'),
(13, 'AT', 'Austria'),
(14, 'AZ', 'Azerbaijan'),
(15, 'BS', 'Bahamas'),
(16, 'BH', 'Bahrain'),
(17, 'BD', 'Bangladesh'),
(18, 'BB', 'Barbados'),
(19, 'BY', 'Belarus'),
(20, 'BE', 'Belgium'),
(21, 'BZ', 'Belize'),
(22, 'BJ', 'Benin'),
(23, 'BM', 'Bermuda'),
(24, 'BT', 'Bhutan'),
(25, 'BO', 'Bolivia'),
(26, 'BA', 'Bosnia and Herzegovina'),
(27, 'BW', 'Botswana'),
(28, 'BV', 'Bouvet Island'),
(29, 'BR', 'Brazil'),
(30, 'IO', 'British Indian Ocean Territory'),
(31, 'BN', 'Brunei Darussalam'),
(32, 'BG', 'Bulgaria'),
(33, 'BF', 'Burkina Faso'),
(34, 'BI', 'Burundi'),
(35, 'KH', 'Cambodia'),
(36, 'CM', 'Cameroon'),
(37, 'CA', 'Canada'),
(38, 'CV', 'Cape Verde'),
(39, 'KY', 'Cayman Islands'),
(40, 'CF', 'Central African Republic'),
(41, 'TD', 'Chad'),
(42, 'CL', 'Chile'),
(43, 'CN', 'China'),
(44, 'CX', 'Christmas Island'),
(45, 'CC', 'Cocos (Keeling) Islands'),
(46, 'CO', 'Colombia'),
(47, 'KM', 'Comoros'),
(48, 'CG', 'Congo'),
(49, 'CK', 'Cook Islands'),
(50, 'CR', 'Costa Rica'),
(51, 'HR', 'Croatia (Hrvatska)'),
(52, 'CU', 'Cuba'),
(53, 'CY', 'Cyprus'),
(54, 'CZ', 'Czech Republic'),
(55, 'DK', 'Denmark'),
(56, 'DJ', 'Djibouti'),
(57, 'DM', 'Dominica'),
(58, 'DO', 'Dominican Republic'),
(59, 'TP', 'East Timor'),
(60, 'EC', 'Ecuador'),
(61, 'EG', 'Egypt'),
(62, 'SV', 'El Salvador'),
(63, 'GQ', 'Equatorial Guinea'),
(64, 'ER', 'Eritrea'),
(65, 'EE', 'Estonia'),
(66, 'ET', 'Ethiopia'),
(67, 'FK', 'Falkland Islands (Malvinas)'),
(68, 'FO', 'Faroe Islands'),
(69, 'FJ', 'Fiji'),
(70, 'FI', 'Finland'),
(71, 'FR', 'France'),
(72, 'FX', 'France, Metropolitan'),
(73, 'GF', 'French Guiana'),
(74, 'PF', 'French Polynesia'),
(75, 'TF', 'French Southern Territories'),
(76, 'GA', 'Gabon'),
(77, 'GM', 'Gambia'),
(78, 'GE', 'Georgia'),
(79, 'DE', 'Germany'),
(80, 'GH', 'Ghana'),
(81, 'GI', 'Gibraltar'),
(82, 'GK', 'Guernsey'),
(83, 'GR', 'Greece'),
(84, 'GL', 'Greenland'),
(85, 'GD', 'Grenada'),
(86, 'GP', 'Guadeloupe'),
(87, 'GU', 'Guam'),
(88, 'GT', 'Guatemala'),
(89, 'GN', 'Guinea'),
(90, 'GW', 'Guinea-Bissau'),
(91, 'GY', 'Guyana'),
(92, 'HT', 'Haiti'),
(93, 'HM', 'Heard and Mc Donald Islands'),
(94, 'HN', 'Honduras'),
(95, 'HK', 'Hong Kong'),
(96, 'HU', 'Hungary'),
(97, 'IS', 'Iceland'),
(98, 'IN', 'India'),
(99, 'IM', 'Isle of Man'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JE', 'Jersey'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'JO', 'Jordan'),
(111, 'KZ', 'Kazakhstan'),
(112, 'KE', 'Kenya'),
(113, 'KI', 'Kiribati'),
(114, 'KP', 'Korea,Democratic People\'s Republic of'),
(115, 'KR', 'Korea, Republic of'),
(116, 'XK', 'Kosovo'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Lao People\'s Democratic Republic'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libyan Arab Jamahiriya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'MH', 'Marshall Islands'),
(137, 'MQ', 'Martinique'),
(138, 'MR', 'Mauritania'),
(139, 'MU', 'Mauritius'),
(140, 'TY', 'Mayotte'),
(141, 'MX', 'Mexico'),
(142, 'FM', 'Micronesia, Federated States of'),
(143, 'MD', 'Moldova, Republic of'),
(144, 'MC', 'Monaco'),
(145, 'MN', 'Mongolia'),
(146, 'ME', 'Montenegro'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'NL', 'Netherlands'),
(155, 'AN', 'Netherlands Antilles'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestine'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua New Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russian Federation'),
(182, 'RW', 'Rwanda'),
(183, 'KN', 'Saint Kitts and Nevis'),
(184, 'LC', 'Saint Lucia'),
(185, 'VC', 'Saint Vincent and the Grenadines'),
(186, 'WS', 'Samoa'),
(187, 'SM', 'San Marino'),
(188, 'ST', 'Sao Tome and Principe'),
(189, 'SA', 'Saudi Arabia'),
(190, 'SN', 'Senegal'),
(191, 'RS', 'Serbia'),
(192, 'SC', 'Seychelles'),
(193, 'SL', 'Sierra Leone'),
(194, 'SG', 'Singapore'),
(195, 'SK', 'Slovakia'),
(196, 'SI', 'Slovenia'),
(197, 'SB', 'Solomon Islands'),
(198, 'SO', 'Somalia'),
(199, 'ZA', 'South Africa'),
(200, 'GS', 'South Georgia South Sandwich Islands'),
(201, 'SS', 'South Sudan'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_currency`
--

CREATE TABLE `sc_shop_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `precision` tinyint(4) NOT NULL DEFAULT '2',
  `symbol_first` tinyint(4) NOT NULL DEFAULT '0',
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_currency`
--

INSERT INTO `sc_shop_currency` (`id`, `name`, `code`, `symbol`, `exchange_rate`, `precision`, `symbol_first`, `thousands`, `status`, `sort`) VALUES
(1, 'USD Dola', 'USD', '$', 1.00, 0, 1, ',', 0, 0),
(2, 'VietNam Dong', 'VND', '₫', 1.00, 0, 0, ',', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_discount`
--

CREATE TABLE `sc_shop_discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward` int(11) NOT NULL DEFAULT '2',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'point' COMMENT 'point - Point; percent - %',
  `data` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT '1',
  `used` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_discount_user`
--

CREATE TABLE `sc_shop_discount_user` (
  `user_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_email_template`
--

CREATE TABLE `sc_shop_email_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_email_template`
--

INSERT INTO `sc_shop_email_template` (`id`, `name`, `group`, `text`, `status`) VALUES
(1, 'Reset password', 'forgot_password', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:left\">{{$title}}</h1>\n<p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">{{$reason_sendmail}}</p>\n                    <table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;margin:30px auto;padding:0;text-align:center;width:100%\">\n                      <tbody><tr>\n                        <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                          <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                            <tbody><tr>\n                              <td align=\"center\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                                  <tbody><tr>\n                                    <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                                      <a href=\"{{$reset_link}}\" class=\"button button-primary\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-radius:3px;color:#fff;display:inline-block;text-decoration:none;background-color:#3097d1;border-top:10px solid #3097d1;border-right:18px solid #3097d1;border-bottom:10px solid #3097d1;border-left:18px solid #3097d1\" target=\"_blank\">{{$reset_button}}</a>\n                                    </td>\n                                  </tr>\n                                </tbody>\n                              </table>\n                              </td>\n                            </tr>\n                          </tbody>\n                        </table>\n                        </td>\n                      </tr>\n                    </tbody>\n                  </table>\n                    <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;font-size:16px;line-height:1.5em;margin-top:0;text-align:left\">\n                      {{$note_sendmail}}\n                    </p>\n                    <table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;border-top:1px solid #edeff2;margin-top:25px;padding-top:25px\">\n                    <tbody><tr>\n                      <td style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box\">\n                        <p style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#74787e;line-height:1.5em;margin-top:0;text-align:left;font-size:12px\">{{$note_access_link}}: <a href=\"{{$reset_link}}\" style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#3869d4\" target=\"_blank\">{{$reset_link}}</a></p>\n                          </td>\n                        </tr>\n                      </tbody>\n                    </table>', 1),
(2, 'Welcome new customer', 'welcome_customer', '<h1 style=\"font-family:Avenir,Helvetica,sans-serif;box-sizing:border-box;color:#2f3133;font-size:19px;font-weight:bold;margin-top:0;text-align:center\">{{$title}}</h1>\n<p style=\"text-align:center;\">Welcome to my site!</p>', 1),
(3, 'Send form contact to admin', 'contact_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            <b>Name</b>: {{$name}}<br>\n            <b>Email</b>: {{$email}}<br>\n            <b>Phone</b>: {{$phone}}<br>\n        </td>\n    </tr>\n</table>\n<hr>\n<p style=\"text-align: center;\">Content:<br>\n<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n    <tr>\n        <td>{{$content}}</td>\n    </tr>\n</table>', 1),
(4, 'New order to admin', 'order_success_to_admin', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                        <tr>\n                            <td>\n                                <b>Order ID</b>: {{$orderID}}<br>\n                                <b>Customer name</b>: {{$toname}}<br>\n                                <b>Email</b>: {{$email}}<br>\n                                <b>Address</b>: {{$address}}<br>\n                                <b>Phone</b>: {{$phone}}<br>\n                                <b>Order note</b>: {{$comment}}\n                            </td>\n                        </tr>\n                    </table>\n                    <hr>\n                    <p style=\"text-align: center;\">Order detail:<br>\n                    ===================================<br></p>\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\n                        {{$orderDetail}}\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\n                        </tr>\n                    </table>', 1),
(5, 'New order to customr', 'order_success_to_customer', '<table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                        <tr>\n                            <td>\n                                <b>Order ID</b>: {{$orderID}}<br>\n                                <b>Customer name</b>: {{$toname}}<br>\n                                <b>Address</b>: {{$address}}<br>\n                                <b>Phone</b>: {{$phone}}<br>\n                                <b>Order note</b>: {{$comment}}\n                            </td>\n                        </tr>\n                    </table>\n                    <hr>\n                    <p style=\"text-align: center;\">Order detail:<br>\n                    ===================================<br></p>\n                    <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\" border=\"1\">\n                        {{$orderDetail}}\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Sub total</td>\n                            <td colspan=\"2\" align=\"right\">{{$subtotal}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Shipping fee</td>\n                            <td colspan=\"2\" align=\"right\">{{$shipping}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Discount</td>\n                            <td colspan=\"2\" align=\"right\">{{$discount}}</td>\n                        </tr>\n                        <tr>\n                            <td colspan=\"2\"></td>\n                            <td colspan=\"2\" style=\"font-weight: bold;\">Total</td>\n                            <td colspan=\"2\" align=\"right\">{{$total}}</td>\n                        </tr>\n                    </table>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_language`
--

CREATE TABLE `sc_shop_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) DEFAULT '0' COMMENT 'Layout RTL',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_language`
--

INSERT INTO `sc_shop_language` (`id`, `name`, `code`, `icon`, `status`, `rtl`, `sort`) VALUES
(1, 'English', 'en', '/data/language/flag_uk.png', 0, 0, 1),
(2, 'Tiếng Việt', 'vi', '/data/language/flag_vn.png', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_layout_page`
--

CREATE TABLE `sc_shop_layout_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_layout_page`
--

INSERT INTO `sc_shop_layout_page` (`id`, `key`, `name`) VALUES
(1, 'shop_home', 'Home page'),
(2, 'product_list', 'Product list'),
(3, 'product_detail', 'Product detail'),
(4, 'shop_cart', 'Shop cart'),
(5, 'shop_auth', 'Account auth'),
(6, 'shop_profile', 'Account profile'),
(7, 'item_list', 'Item list'),
(8, 'news_list', 'News list'),
(9, 'news_detail', 'News detail'),
(10, 'shop_page', 'Page detail'),
(11, 'shop_contact', 'Contact page');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_layout_position`
--

CREATE TABLE `sc_shop_layout_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_layout_position`
--

INSERT INTO `sc_shop_layout_position` (`id`, `key`, `name`) VALUES
(1, 'meta', 'Meta'),
(2, 'header', 'Header'),
(3, 'top', 'Top'),
(4, 'bottom', 'Bottom'),
(5, 'footer', 'Footer'),
(6, 'left', 'Column left'),
(7, 'right', 'Column right'),
(8, 'banner_top', 'Banner top');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_length`
--

CREATE TABLE `sc_shop_length` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_length`
--

INSERT INTO `sc_shop_length` (`id`, `name`, `description`) VALUES
(1, 'mm', 'Millimeter'),
(2, 'cm', 'Centimeter'),
(3, 'm', 'Meter'),
(4, 'in', 'Inch');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_link`
--

CREATE TABLE `sc_shop_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_link`
--

INSERT INTO `sc_shop_link` (`id`, `name`, `url`, `target`, `group`, `module`, `status`, `sort`) VALUES
(1, 'lang::front.contact', 'route::page.detail::contact', '_self', 'menu', '', 1, 3),
(2, 'lang::front.about', 'route::page.detail::about', '_self', 'menu', '', 1, 4),
(3, 'lang::front.my_profile', '/member/login.html', '_self', 'footer', '', 1, 5),
(4, 'lang::front.compare_page', '/compare.html', '_self', 'footer', '', 1, 4),
(5, 'lang::front.wishlist_page', 'route::wishlist', '_self', 'footer', '', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_news`
--

CREATE TABLE `sc_shop_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_news_description`
--

CREATE TABLE `sc_shop_news_description` (
  `shop_news_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_order`
--

CREATE TABLE `sc_shop_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` int(11) DEFAULT '0',
  `shipping` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '1',
  `shipping_status` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0',
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `received` int(11) DEFAULT '0',
  `balance` int(11) DEFAULT '0',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_order`
--

INSERT INTO `sc_shop_order` (`id`, `user_id`, `subtotal`, `shipping`, `discount`, `payment_status`, `shipping_status`, `status`, `tax`, `total`, `currency`, `exchange_rate`, `received`, `balance`, `first_name`, `last_name`, `address1`, `address2`, `country`, `company`, `postcode`, `phone`, `email`, `comment`, `provider_id`, `payment_method`, `shipping_method`, `user_agent`, `ip`, `transaction`, `created_at`, `updated_at`) VALUES
(1, 1, 5000, 2000, 0, 1, 1, 7, 0, 7000, 'USD', 1.00, 0, 7000, 'Naruto', 'Kun', 'ADDRESS 1', 'ADDRESS 2', 'VN', NULL, NULL, '667151172', 'test@test.com', 'ok', NULL, 'Cash', 'ShippingStandard', NULL, NULL, NULL, '2020-06-11 03:10:15', '2020-06-17 03:13:22'),
(2, 0, 90420, 0, 0, 2, 1, 1, 9042, 99462, 'VND', 1.00, 0, 99462, 'Piper', 'White', '724 Johns Circle', '34805 Dorian Shore', 'IT', '', '', '0945912910', 'tempmail77601@emailna.co', 'Graham', 1, 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '::1', NULL, '2020-06-13 04:11:25', '2020-06-16 06:42:11'),
(3, 0, 3000, 20, 0, 1, 1, 3, 300, 3320, 'VND', 1.00, 0, 3320, 'Karelle', 'Murray', '90143 Halvorson Drive', '8660 Jermey Port', 'AE', '', '', '0959688635', 'tempmail42430@emailna.co', 'Cruickshank Inc', 2, 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '::1', NULL, '2020-06-16 07:43:55', '2020-06-16 09:55:13'),
(4, 0, 5000, 20, 0, 1, 1, 1, 500, 5520, 'VND', 1.00, 0, 5520, 'Jeramy', 'Quigley', '8603 Marisa Island', '146 Raven Ranch', 'PW', '', '', '0945894689', 'tempmail72601@emailna.co', 'Ferry Inc', 2, 'Cash', 'ShippingStandard', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 OPR/68.0.3618.125', '::1', NULL, '2020-06-16 09:53:51', '2020-06-17 09:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_order_detail`
--

CREATE TABLE `sc_shop_order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_price` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_order_detail`
--

INSERT INTO `sc_shop_order_detail` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `total_price`, `tax`, `sku`, `currency`, `exchange_rate`, `attribute`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Easy Polo Black Edition 1', 5000, 1, 5000, 0, 'ABCZZ', 'USD', 1.00, '[]', NULL, NULL),
(2, 2, 17, 'Easy Polo Black Edition 17', 15070, 6, 90420, 9042, 'ALOKK1-AY', 'VND', 1.00, '{\"1\":\"Blue__50\",\"2\":\"S__20\"}', '2020-06-13 04:11:25', '2020-06-13 04:11:25'),
(3, 3, 2, 'Easy Polo Black Edition 2', 3000, 1, 3000, 300, 'LEDFAN1', 'VND', 1.00, '[]', '2020-06-16 07:43:55', '2020-06-16 07:43:55'),
(4, 4, 1, 'Easy Polo Black Edition 1', 5000, 1, 5000, 500, 'ABCZZ', 'VND', 1.00, '[]', '2020-06-16 09:53:51', '2020-06-16 09:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_order_history`
--

CREATE TABLE `sc_shop_order_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_order_history`
--

INSERT INTO `sc_shop_order_history` (`id`, `order_id`, `content`, `admin_id`, `user_id`, `order_status_id`, `add_date`) VALUES
(1, 1, 'New order', 0, 1, 1, '2020-06-11 10:10:15'),
(2, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, 2, '2020-06-13 08:52:36'),
(3, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, 1, '2020-06-13 08:52:57'),
(4, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, 2, '2020-06-13 08:59:35'),
(5, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, 1, '2020-06-13 09:03:39'),
(6, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 1, 0, 2, '2020-06-13 09:04:57'),
(7, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'3\'</span>', 1, 0, 3, '2020-06-13 09:58:47'),
(8, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'3\'</span> to <span style=\"color:red\">\'1\'</span>', 1, 0, 1, '2020-06-13 09:59:02'),
(9, 2, 'New order', 0, 0, 1, '2020-06-13 11:11:25'),
(10, 2, 'Change <b>comment</b> from <span style=\"color:blue\">\'Graham LLC\'</span> to <span style=\"color:red\">\'Graham LLCasdads\'</span>', 2, 0, 1, '2020-06-16 13:39:23'),
(11, 2, 'Change <b>comment</b> from <span style=\"color:blue\">\'Graham LLCasdads\'</span> to <span style=\"color:red\">\'Graham\'</span>', 2, 0, 1, '2020-06-16 13:39:42'),
(12, 2, 'Change <b>payment_status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 2, 0, 1, '2020-06-16 13:42:11'),
(13, 3, 'New order', 0, 0, 1, '2020-06-16 14:43:55'),
(14, 4, 'New order', 0, 0, 1, '2020-06-16 16:53:51'),
(15, 3, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'3\'</span>', 2, 0, 3, '2020-06-16 16:55:13'),
(16, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'4\'</span>', 1, 0, 4, '2020-06-17 10:09:57'),
(17, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'4\'</span> to <span style=\"color:red\">\'6\'</span>', 1, 0, 6, '2020-06-17 10:13:05'),
(18, 1, 'Change <b>status</b> from <span style=\"color:blue\">\'6\'</span> to <span style=\"color:red\">\'7\'</span>', 1, 0, 7, '2020-06-17 10:13:22'),
(19, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 2, 0, 2, '2020-06-17 16:03:49'),
(20, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 2, 0, 1, '2020-06-17 16:03:54'),
(21, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 2, 0, 2, '2020-06-17 16:12:06'),
(22, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 2, 0, 1, '2020-06-17 16:12:17'),
(23, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'1\'</span> to <span style=\"color:red\">\'2\'</span>', 2, 0, 2, '2020-06-17 16:26:47'),
(24, 4, 'Change <b>status</b> from <span style=\"color:blue\">\'2\'</span> to <span style=\"color:red\">\'1\'</span>', 2, 0, 1, '2020-06-17 16:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_order_status`
--

CREATE TABLE `sc_shop_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_order_status`
--

INSERT INTO `sc_shop_order_status` (`id`, `name`, `sort`) VALUES
(1, 'Khởi tạo', 1),
(2, 'Xác nhận', 2),
(3, 'Phê duyệt', 3),
(4, 'Đang thực hiện', 4),
(5, 'Hoàn thành', 5),
(6, 'Lỗi thực hiện', 6),
(7, 'Hủy bỏ', 7);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_order_total`
--

CREATE TABLE `sc_shop_order_total` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_order_total`
--

INSERT INTO `sc_shop_order_total` (`id`, `order_id`, `title`, `code`, `value`, `text`, `sort`, `created_at`, `updated_at`) VALUES
(1, 1, 'Subtotal', 'subtotal', 5000, NULL, 1, NULL, NULL),
(2, 1, 'Shipping', 'shipping', 2000, NULL, 10, NULL, NULL),
(3, 1, 'Discount', 'discount', 0, NULL, 20, NULL, NULL),
(4, 1, 'Total', 'total', 7000, NULL, 100, NULL, NULL),
(5, 1, 'Received', 'received', 0, NULL, 200, NULL, NULL),
(6, 2, 'Tiền hàng', 'subtotal', 90420, '90,420₫', 1, '2020-06-13 04:11:25', NULL),
(7, 2, 'Thuế', 'tax', 9042, '9,042₫', 2, '2020-06-13 04:11:25', NULL),
(8, 2, 'Vận chuyển cơ bản', 'shipping', 0, '0₫', 10, '2020-06-13 04:11:25', NULL),
(9, 2, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-13 04:11:25', NULL),
(10, 2, 'Tổng tiền', 'total', 99462, '99,462₫', 100, '2020-06-13 04:11:25', NULL),
(11, 2, 'Đã nhận', 'received', 0, '0', 200, '2020-06-13 04:11:25', NULL),
(12, 3, 'Tiền hàng', 'subtotal', 3000, '3,000₫', 1, '2020-06-16 07:43:55', NULL),
(13, 3, 'Thuế', 'tax', 300, '300₫', 2, '2020-06-16 07:43:55', NULL),
(14, 3, 'Vận chuyển cơ bản', 'shipping', 20, '20₫', 10, '2020-06-16 07:43:55', NULL),
(15, 3, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-16 07:43:55', NULL),
(16, 3, 'Tổng tiền', 'total', 3320, '3,320₫', 100, '2020-06-16 07:43:55', NULL),
(17, 3, 'Đã nhận', 'received', 0, '0', 200, '2020-06-16 07:43:55', NULL),
(18, 4, 'Tiền hàng', 'subtotal', 5000, '5,000₫', 1, '2020-06-16 09:53:51', NULL),
(19, 4, 'Thuế', 'tax', 500, '500₫', 2, '2020-06-16 09:53:51', NULL),
(20, 4, 'Vận chuyển cơ bản', 'shipping', 20, '20₫', 10, '2020-06-16 09:53:51', NULL),
(21, 4, 'Giảm giá', 'discount', 0, '0', 20, '2020-06-16 09:53:51', NULL),
(22, 4, 'Tổng tiền', 'total', 5520, '5,520₫', 100, '2020-06-16 09:53:51', NULL),
(23, 4, 'Đã nhận', 'received', 0, '0', 200, '2020-06-16 09:53:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_page`
--

CREATE TABLE `sc_shop_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_page`
--

INSERT INTO `sc_shop_page` (`id`, `image`, `alias`, `status`) VALUES
(1, '', 'about', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_page_description`
--

CREATE TABLE `sc_shop_page_description` (
  `page_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_page_description`
--

INSERT INTO `sc_shop_page_description` (`page_id`, `lang`, `title`, `keyword`, `description`, `content`) VALUES
(1, 'en', 'About', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\n'),
(1, 'vi', 'Giới thiệu', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_password_resets`
--

CREATE TABLE `sc_shop_password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_payment_status`
--

CREATE TABLE `sc_shop_payment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_payment_status`
--

INSERT INTO `sc_shop_payment_status` (`id`, `name`) VALUES
(1, 'Unpaid'),
(2, 'Partial payment'),
(3, 'Paid'),
(4, 'Refurn');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product`
--

CREATE TABLE `sc_shop_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'upc code',
  `ean` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ean code',
  `jan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'jan code',
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'isbn code',
  `mpn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mpn code',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT '0',
  `supplier_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `sold` int(11) DEFAULT '0',
  `minimum` int(11) DEFAULT '0',
  `weight_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `length_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `kind` tinyint(4) DEFAULT '0' COMMENT '0:single, 1:bundle, 2:group',
  `virtual` tinyint(4) DEFAULT '0' COMMENT '0:physical, 1:download, 2:only view, 3: Service',
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0:No-tax, auto: Use tax default',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_lastview` datetime DEFAULT NULL,
  `date_available` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product`
--

INSERT INTO `sc_shop_product` (`id`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `image`, `brand_id`, `supplier_id`, `relation_id`, `price`, `cost`, `stock`, `sold`, `minimum`, `weight_class`, `weight`, `length_class`, `length`, `width`, `height`, `kind`, `virtual`, `tax_id`, `status`, `sort`, `view`, `alias`, `date_lastview`, `date_available`, `created_at`, `updated_at`) VALUES
(1, 'ABCZZ', NULL, NULL, NULL, NULL, NULL, '/data/product/img-1.jpg', 1, '1', NULL, 15000, 10000, 98, 2, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 4, 'demo-alias-name-product-1', '2020-06-16 16:43:18', '2020-07-11', NULL, '2020-06-16 09:53:51'),
(2, 'LEDFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/img-4.jpg', 1, '1', NULL, 15000, 10000, 99, 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 3, 'demo-alias-name-product-2', '2020-06-16 14:42:51', NULL, NULL, '2020-06-16 07:43:55'),
(3, 'CLOCKFAN1', NULL, NULL, NULL, NULL, NULL, '/data/product/img-11.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 1, 'demo-alias-name-product-3', '2020-06-16 10:12:02', NULL, NULL, '2020-06-16 03:12:02'),
(4, 'CLOCKFAN2', NULL, NULL, NULL, NULL, NULL, '/data/product/img-14.jpg', 3, '1', NULL, 15000, 10000, 100, 0, 10, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-4', NULL, NULL, NULL, NULL),
(5, 'CLOCKFAN3', NULL, NULL, NULL, NULL, NULL, '/data/product/img-15.jpg', 1, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-5', NULL, NULL, NULL, NULL),
(6, 'TMC2208', NULL, NULL, NULL, NULL, NULL, '/data/product/img-16.jpg', 1, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-6', NULL, NULL, NULL, NULL),
(7, 'FILAMENT', NULL, NULL, NULL, NULL, NULL, '/data/product/img-17.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-7', NULL, NULL, NULL, NULL),
(8, 'A4988', NULL, NULL, NULL, NULL, NULL, '/data/product/img-18.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-8', NULL, NULL, NULL, NULL),
(9, 'ANYCUBIC-P', NULL, NULL, NULL, NULL, NULL, '/data/product/img-20.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-9', NULL, NULL, NULL, NULL),
(10, '3DHLFD-P', NULL, NULL, NULL, NULL, NULL, '/data/product/img-21.jpg', 4, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-10', NULL, NULL, NULL, NULL),
(11, 'SS495A', NULL, NULL, NULL, NULL, NULL, '/data/product/img-22.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-11', NULL, NULL, NULL, NULL),
(12, '3D-CARBON1.75', NULL, NULL, NULL, NULL, NULL, '/data/product/img-23.jpg', 2, '1', NULL, 15000, 10000, 100, 0, 5, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-12', NULL, NULL, NULL, NULL),
(13, '3D-GOLD1.75', NULL, NULL, NULL, NULL, NULL, '/data/product/img-34.jpg', 3, '1', NULL, 10000, 5000, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-13', NULL, NULL, NULL, NULL),
(14, 'LCD12864-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-13.jpg', 3, '1', NULL, 15000, 10000, 100, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 'auto', 1, 0, 0, 'demo-alias-name-product-14', NULL, NULL, NULL, NULL),
(15, 'LCD2004-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-41.jpg', 3, '1', NULL, 15000, 10000, 100, 0, 10, NULL, 0, NULL, 0, 0, 0, 1, 0, 'auto', 1, 0, 1, 'demo-alias-name-product-15', '2020-06-11 14:25:02', NULL, NULL, '2020-06-11 07:25:02'),
(16, 'RAMPS1.5-3D', NULL, NULL, NULL, NULL, NULL, '/data/product/img-42.jpg', 2, '1', NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 2, 0, 'auto', 1, 0, 1, 'demo-alias-name-product-16', '2020-06-11 14:24:32', NULL, NULL, '2020-06-11 07:24:32'),
(17, 'ALOKK1-AY', NULL, NULL, NULL, NULL, NULL, '/data/product/img-26.jpg', 3, '1', '4,6,12,13', 15000, 10000, 94, 6, 5, '', 0, '', 0, 0, 0, 0, 0, 'auto', 1, 0, 8, 'demo-alias-name-product-17', '2020-06-13 11:03:38', NULL, NULL, '2020-06-13 04:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_attribute`
--

CREATE TABLE `sc_shop_product_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `add_price` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_attribute`
--

INSERT INTO `sc_shop_product_attribute` (`id`, `name`, `attribute_group_id`, `product_id`, `add_price`, `sort`, `status`) VALUES
(5, 'Blue', 1, 10, 150, 0, 1),
(6, 'Red', 1, 10, 0, 0, 1),
(7, 'S', 2, 10, 0, 0, 1),
(8, 'M', 2, 10, 0, 0, 1),
(9, 'Blue', 1, 17, 50, 0, 1),
(10, 'White', 1, 17, 0, 0, 1),
(11, 'S', 2, 17, 20, 0, 1),
(12, 'XL', 2, 17, 30, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_build`
--

CREATE TABLE `sc_shop_product_build` (
  `build_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_build`
--

INSERT INTO `sc_shop_product_build` (`build_id`, `product_id`, `quantity`) VALUES
(15, 6, 1),
(15, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_category`
--

CREATE TABLE `sc_shop_product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_category`
--

INSERT INTO `sc_shop_product_category` (`product_id`, `category_id`) VALUES
(1, 6),
(1, 10),
(1, 13),
(2, 13),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 12),
(8, 10),
(9, 6),
(10, 11),
(11, 10),
(12, 9),
(13, 5),
(14, 11),
(15, 6),
(16, 9),
(17, 9);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_description`
--

CREATE TABLE `sc_shop_product_description` (
  `product_id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_description`
--

INSERT INTO `sc_shop_product_description` (`product_id`, `lang`, `name`, `keyword`, `description`, `content`) VALUES
(1, 'en', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(1, 'vi', 'Easy Polo Black Edition 1', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(2, 'en', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(2, 'vi', 'Easy Polo Black Edition 2', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'en', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(3, 'vi', 'Easy Polo Black Edition 3', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'en', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(4, 'vi', 'Easy Polo Black Edition 4', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'en', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(5, 'vi', 'Easy Polo Black Edition 5', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'en', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(6, 'vi', 'Easy Polo Black Edition 6', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'en', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(7, 'vi', 'Easy Polo Black Edition 7', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'en', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(8, 'vi', 'Easy Polo Black Edition 8', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'en', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(9, 'vi', 'Easy Polo Black Edition 9', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'en', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(10, 'vi', 'Easy Polo Black Edition 10', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'en', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(11, 'vi', 'Easy Polo Black Edition 11', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'en', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(12, 'vi', 'Easy Polo Black Edition 12', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'en', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(13, 'vi', 'Easy Polo Black Edition 13', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'en', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(14, 'vi', 'Easy Polo Black Edition 14', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'en', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(15, 'vi', 'Easy Polo Black Edition 15', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'en', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(16, 'vi', 'Easy Polo Black Edition 16', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>'),
(17, 'vi', 'Easy Polo Black Edition 17', NULL, NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<img alt=\"\" src=\"/data/product/img-21.jpg\" style=\"width: 262px; height: 262px; float: right; margin: 10px;\" /></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_group`
--

CREATE TABLE `sc_shop_product_group` (
  `group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_group`
--

INSERT INTO `sc_shop_product_group` (`group_id`, `product_id`) VALUES
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_image`
--

CREATE TABLE `sc_shop_product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_image`
--

INSERT INTO `sc_shop_product_image` (`id`, `image`, `product_id`) VALUES
(1, '/data/product/img-32.jpg', 1),
(2, '/data/product/img-33.jpg', 1),
(3, '/data/product/img-22.jpg', 11),
(4, '/data/product/img-23.jpg', 2),
(5, '/data/product/img-14.jpg', 11),
(6, '/data/product/img-12.jpg', 5),
(7, '/data/product/img-11.jpg', 5),
(8, '/data/product/img-9.jpg', 2),
(9, '/data/product/img-19.jpg', 2),
(10, '/data/product/img-21.jpg', 9),
(11, '/data/product/img-22.jpg', 8),
(12, '/data/product/img-20.jpg', 7),
(13, '/data/product/img-26.jpg', 7),
(14, '/data/product/img-27.jpg', 5),
(15, '/data/product/img-40.jpg', 4),
(16, '/data/product/img-14.jpg', 15),
(17, '/data/product/img-23.jpg', 15),
(21, '/data/product/img-12.jpg', 17),
(22, '/data/product/img-11.jpg', 17),
(23, '/data/product/img-32.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_product_promotion`
--

CREATE TABLE `sc_shop_product_promotion` (
  `product_id` int(11) NOT NULL,
  `price_promotion` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status_promotion` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_product_promotion`
--

INSERT INTO `sc_shop_product_promotion` (`product_id`, `price_promotion`, `date_start`, `date_end`, `status_promotion`, `created_at`, `updated_at`) VALUES
(1, 5000, NULL, NULL, 1, NULL, NULL),
(2, 3000, NULL, NULL, 1, NULL, NULL),
(11, 600, NULL, NULL, 1, NULL, NULL),
(13, 4000, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_providers`
--

CREATE TABLE `sc_shop_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_providers`
--

INSERT INTO `sc_shop_providers` (`id`, `name`, `alias`, `email`, `phone`, `avatar`, `cover`, `address`, `ward`, `district`, `province`, `products`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Provider 1', 'provider-1', 'provider222@gmail.com', '0911824834', 'http://localhost/s-cart/public/data/provider-avatar/intro-4.png', 'http://localhost/s-cart/public/data/provider-avatar/p1.jpg', '994 Damaris Ville', 'Xã Phìn Hồ', 'Huyện Sìn Hồ', 'Lai Châu', '1,2,3,14,15,17,16', 1, 0, '2020-06-11 03:21:30', '2020-06-11 09:42:07'),
(2, 'Provider 2', 'provider-2', 'tempmail62501@emailna.co', '0995721445', 'http://localhost/s-cart/public/data/provider-avatar/intro-4.png', 'http://localhost/s-cart/public/data/provider-avatar/p1.jpg', '0099 Padberg Alley', 'Xã Thèn Sin', 'Huyện Tam Đường', 'Lai Châu', '1,2,3,14,15,17,16', 1, 1, '2020-06-11 06:52:10', '2020-06-16 07:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_sessions`
--

CREATE TABLE `sc_shop_sessions` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_shipping_standard`
--

CREATE TABLE `sc_shop_shipping_standard` (
  `id` int(10) UNSIGNED NOT NULL,
  `fee` int(11) NOT NULL,
  `shipping_free` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_shipping_standard`
--

INSERT INTO `sc_shop_shipping_standard` (`id`, `fee`, `shipping_free`) VALUES
(1, 20, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_shipping_status`
--

CREATE TABLE `sc_shop_shipping_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_shipping_status`
--

INSERT INTO `sc_shop_shipping_status` (`id`, `name`) VALUES
(1, 'Not sent'),
(2, 'Sending'),
(3, 'Shipping done');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_shoppingcart`
--

CREATE TABLE `sc_shop_shoppingcart` (
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_subscribe`
--

CREATE TABLE `sc_shop_subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_supplier`
--

CREATE TABLE `sc_shop_supplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_supplier`
--

INSERT INTO `sc_shop_supplier` (`id`, `name`, `alias`, `email`, `phone`, `image`, `address`, `url`, `status`, `sort`) VALUES
(1, 'ABC distributor', 'abc-distributor', 'abc@abc.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 0),
(2, 'XYZ distributor', 'xyz-distributor', 'xyz@xyz.com', '012496657567', '/data/supplier/supplier.png', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_tax`
--

CREATE TABLE `sc_shop_tax` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_tax`
--

INSERT INTO `sc_shop_tax` (`id`, `name`, `value`) VALUES
(1, 'Tax default (10%)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_user`
--

CREATE TABLE `sc_shop_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:women, 1:men',
  `birthday` date DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL DEFAULT '0',
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `group` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_user`
--

INSERT INTO `sc_shop_user` (`id`, `first_name`, `last_name`, `email`, `sex`, `birthday`, `password`, `address_id`, `postcode`, `address1`, `address2`, `company`, `country`, `phone`, `remember_token`, `status`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', 'Kun', 'test@test.com', 0, NULL, '$2y$10$rT9r811xm77RWpMfxDPpB.PVMBqoB0NwaIryNqr3PBhsuGAyJN.eO', 0, '70000', 'HCM', 'HCM city', 'KTC', 'VN', '0667151172', NULL, 1, 1, '2020-06-11 03:10:15', NULL),
(2, 'Corine Murray', 'Torphy', 'tempmail43853@emailna.co', 0, NULL, '$2y$10$ujHOSYSab.juwf/WtHXXXuIEHn3q7.bdelJ0YT7rFgL3EB5Nfyz4O', 1, NULL, '29369 Romaguera Lights', '40496 Mertz Harbors', NULL, 'ZW', '0969837648', NULL, 1, 1, '2020-06-16 04:01:59', '2020-06-16 04:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_user_address`
--

CREATE TABLE `sc_shop_user_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VN',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_user_address`
--

INSERT INTO `sc_shop_user_address` (`id`, `user_id`, `first_name`, `last_name`, `postcode`, `address1`, `address2`, `country`, `phone`) VALUES
(1, 2, 'Corine Murray', 'Torphy', '', '29369 Romaguera Lights', '40496 Mertz Harbors', 'ZW', '0969837648');

-- --------------------------------------------------------

--
-- Table structure for table `sc_shop_weight`
--

CREATE TABLE `sc_shop_weight` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sc_shop_weight`
--

INSERT INTO `sc_shop_weight` (`id`, `name`, `description`) VALUES
(1, 'g', 'Gram'),
(2, 'kg', 'Kilogram'),
(3, 'lb', 'Pound '),
(4, 'oz', 'Ounce ');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_admin_config`
--
ALTER TABLE `sc_admin_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_config_key_unique` (`key`),
  ADD KEY `sc_admin_config_code_index` (`code`);

--
-- Indexes for table `sc_admin_log`
--
ALTER TABLE `sc_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_admin_log_user_id_index` (`user_id`);

--
-- Indexes for table `sc_admin_menu`
--
ALTER TABLE `sc_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_menu_key_unique` (`key`);

--
-- Indexes for table `sc_admin_menu_permission`
--
ALTER TABLE `sc_admin_menu_permission`
  ADD PRIMARY KEY (`menu_id`,`permission_id`),
  ADD KEY `sc_admin_menu_permission_menu_id_permission_id_index` (`menu_id`,`permission_id`);

--
-- Indexes for table `sc_admin_permission`
--
ALTER TABLE `sc_admin_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_permission_name_unique` (`name`),
  ADD UNIQUE KEY `sc_admin_permission_slug_unique` (`slug`);

--
-- Indexes for table `sc_admin_role`
--
ALTER TABLE `sc_admin_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_role_name_unique` (`name`),
  ADD UNIQUE KEY `sc_admin_role_slug_unique` (`slug`);

--
-- Indexes for table `sc_admin_role_menu`
--
ALTER TABLE `sc_admin_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`),
  ADD KEY `sc_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `sc_admin_role_permission`
--
ALTER TABLE `sc_admin_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `sc_admin_role_permission_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `sc_admin_role_user`
--
ALTER TABLE `sc_admin_role_user`
  ADD KEY `sc_admin_role_user_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `sc_admin_store`
--
ALTER TABLE `sc_admin_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_admin_store_description`
--
ALTER TABLE `sc_admin_store_description`
  ADD PRIMARY KEY (`config_id`,`lang`),
  ADD KEY `sc_admin_store_description_lang_index` (`lang`);

--
-- Indexes for table `sc_admin_user`
--
ALTER TABLE `sc_admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_admin_user_username_unique` (`username`),
  ADD UNIQUE KEY `sc_admin_user_email_unique` (`email`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `sc_admin_user_permission`
--
ALTER TABLE `sc_admin_user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `sc_admin_user_permission_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `sc_api_connection`
--
ALTER TABLE `sc_api_connection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_api_connection_apiconnection_unique` (`apiconnection`);

--
-- Indexes for table `sc_provider_products`
--
ALTER TABLE `sc_provider_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sc_provider_role`
--
ALTER TABLE `sc_provider_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_provider_role_name_unique` (`name`),
  ADD UNIQUE KEY `sc_provider_role_slug_unique` (`slug`);

--
-- Indexes for table `sc_provider_role_order`
--
ALTER TABLE `sc_provider_role_order`
  ADD PRIMARY KEY (`role_id`,`order_status_id`),
  ADD KEY `sc_provider_role_order_role_id_order_id_index` (`role_id`,`order_status_id`);

--
-- Indexes for table `sc_shop_attribute_group`
--
ALTER TABLE `sc_shop_attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_banner`
--
ALTER TABLE `sc_shop_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_block_content`
--
ALTER TABLE `sc_shop_block_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_brand`
--
ALTER TABLE `sc_shop_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_brand_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_category`
--
ALTER TABLE `sc_shop_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_category_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_category_description`
--
ALTER TABLE `sc_shop_category_description`
  ADD PRIMARY KEY (`category_id`,`lang`),
  ADD KEY `sc_shop_category_description_lang_index` (`lang`);

--
-- Indexes for table `sc_shop_country`
--
ALTER TABLE `sc_shop_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_country_code_unique` (`code`);

--
-- Indexes for table `sc_shop_currency`
--
ALTER TABLE `sc_shop_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_currency_code_unique` (`code`);

--
-- Indexes for table `sc_shop_discount`
--
ALTER TABLE `sc_shop_discount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_discount_code_unique` (`code`);

--
-- Indexes for table `sc_shop_email_template`
--
ALTER TABLE `sc_shop_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_language`
--
ALTER TABLE `sc_shop_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_language_code_unique` (`code`);

--
-- Indexes for table `sc_shop_layout_page`
--
ALTER TABLE `sc_shop_layout_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_layout_page_key_unique` (`key`);

--
-- Indexes for table `sc_shop_layout_position`
--
ALTER TABLE `sc_shop_layout_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_layout_position_key_unique` (`key`);

--
-- Indexes for table `sc_shop_length`
--
ALTER TABLE `sc_shop_length`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_length_name_unique` (`name`);

--
-- Indexes for table `sc_shop_link`
--
ALTER TABLE `sc_shop_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_news`
--
ALTER TABLE `sc_shop_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_news_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_news_description`
--
ALTER TABLE `sc_shop_news_description`
  ADD PRIMARY KEY (`shop_news_id`,`lang`);

--
-- Indexes for table `sc_shop_order`
--
ALTER TABLE `sc_shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_order_detail`
--
ALTER TABLE `sc_shop_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_order_history`
--
ALTER TABLE `sc_shop_order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_order_status`
--
ALTER TABLE `sc_shop_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_order_total`
--
ALTER TABLE `sc_shop_order_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_page`
--
ALTER TABLE `sc_shop_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_page_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_page_description`
--
ALTER TABLE `sc_shop_page_description`
  ADD PRIMARY KEY (`page_id`,`lang`),
  ADD KEY `sc_shop_page_description_lang_index` (`lang`);

--
-- Indexes for table `sc_shop_password_resets`
--
ALTER TABLE `sc_shop_password_resets`
  ADD KEY `sc_shop_password_resets_email_index` (`email`);

--
-- Indexes for table `sc_shop_payment_status`
--
ALTER TABLE `sc_shop_payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_product`
--
ALTER TABLE `sc_shop_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_product_sku_unique` (`sku`),
  ADD UNIQUE KEY `sc_shop_product_alias_unique` (`alias`),
  ADD KEY `sc_shop_product_brand_id_index` (`brand_id`),
  ADD KEY `sc_shop_product_supplier_id_index` (`supplier_id`),
  ADD KEY `sc_shop_product_kind_index` (`kind`),
  ADD KEY `sc_shop_product_virtual_index` (`virtual`),
  ADD KEY `sc_shop_product_tax_id_index` (`tax_id`),
  ADD KEY `sc_shop_product_status_index` (`status`);

--
-- Indexes for table `sc_shop_product_attribute`
--
ALTER TABLE `sc_shop_product_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_shop_product_attribute_product_id_attribute_group_id_index` (`product_id`,`attribute_group_id`);

--
-- Indexes for table `sc_shop_product_build`
--
ALTER TABLE `sc_shop_product_build`
  ADD PRIMARY KEY (`build_id`,`product_id`);

--
-- Indexes for table `sc_shop_product_category`
--
ALTER TABLE `sc_shop_product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`);

--
-- Indexes for table `sc_shop_product_description`
--
ALTER TABLE `sc_shop_product_description`
  ADD PRIMARY KEY (`product_id`,`lang`),
  ADD KEY `sc_shop_product_description_lang_index` (`lang`);

--
-- Indexes for table `sc_shop_product_group`
--
ALTER TABLE `sc_shop_product_group`
  ADD PRIMARY KEY (`group_id`,`product_id`);

--
-- Indexes for table `sc_shop_product_image`
--
ALTER TABLE `sc_shop_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sc_shop_product_image_product_id_index` (`product_id`);

--
-- Indexes for table `sc_shop_product_promotion`
--
ALTER TABLE `sc_shop_product_promotion`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sc_shop_providers`
--
ALTER TABLE `sc_shop_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_providers_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_sessions`
--
ALTER TABLE `sc_shop_sessions`
  ADD UNIQUE KEY `sc_shop_sessions_id_unique` (`id`);

--
-- Indexes for table `sc_shop_shipping_standard`
--
ALTER TABLE `sc_shop_shipping_standard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_shipping_status`
--
ALTER TABLE `sc_shop_shipping_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_shoppingcart`
--
ALTER TABLE `sc_shop_shoppingcart`
  ADD KEY `sc_shop_shoppingcart_identifier_instance_index` (`identifier`,`instance`);

--
-- Indexes for table `sc_shop_subscribe`
--
ALTER TABLE `sc_shop_subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_subscribe_email_unique` (`email`);

--
-- Indexes for table `sc_shop_supplier`
--
ALTER TABLE `sc_shop_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_supplier_alias_unique` (`alias`);

--
-- Indexes for table `sc_shop_tax`
--
ALTER TABLE `sc_shop_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_user`
--
ALTER TABLE `sc_shop_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_user_email_unique` (`email`),
  ADD KEY `sc_shop_user_address_id_index` (`address_id`);

--
-- Indexes for table `sc_shop_user_address`
--
ALTER TABLE `sc_shop_user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sc_shop_weight`
--
ALTER TABLE `sc_shop_weight`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sc_shop_weight_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sc_admin_config`
--
ALTER TABLE `sc_admin_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `sc_admin_log`
--
ALTER TABLE `sc_admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2153;
--
-- AUTO_INCREMENT for table `sc_admin_menu`
--
ALTER TABLE `sc_admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `sc_admin_permission`
--
ALTER TABLE `sc_admin_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sc_admin_role`
--
ALTER TABLE `sc_admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sc_admin_store`
--
ALTER TABLE `sc_admin_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_admin_user`
--
ALTER TABLE `sc_admin_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sc_api_connection`
--
ALTER TABLE `sc_api_connection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_provider_products`
--
ALTER TABLE `sc_provider_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_provider_role`
--
ALTER TABLE `sc_provider_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_attribute_group`
--
ALTER TABLE `sc_shop_attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_banner`
--
ALTER TABLE `sc_shop_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_block_content`
--
ALTER TABLE `sc_shop_block_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sc_shop_brand`
--
ALTER TABLE `sc_shop_brand`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sc_shop_category`
--
ALTER TABLE `sc_shop_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sc_shop_country`
--
ALTER TABLE `sc_shop_country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
--
-- AUTO_INCREMENT for table `sc_shop_currency`
--
ALTER TABLE `sc_shop_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_discount`
--
ALTER TABLE `sc_shop_discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sc_shop_email_template`
--
ALTER TABLE `sc_shop_email_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sc_shop_language`
--
ALTER TABLE `sc_shop_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_layout_page`
--
ALTER TABLE `sc_shop_layout_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sc_shop_layout_position`
--
ALTER TABLE `sc_shop_layout_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sc_shop_length`
--
ALTER TABLE `sc_shop_length`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sc_shop_link`
--
ALTER TABLE `sc_shop_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sc_shop_news`
--
ALTER TABLE `sc_shop_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sc_shop_order`
--
ALTER TABLE `sc_shop_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sc_shop_order_detail`
--
ALTER TABLE `sc_shop_order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sc_shop_order_history`
--
ALTER TABLE `sc_shop_order_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `sc_shop_order_status`
--
ALTER TABLE `sc_shop_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sc_shop_order_total`
--
ALTER TABLE `sc_shop_order_total`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sc_shop_page`
--
ALTER TABLE `sc_shop_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_shop_payment_status`
--
ALTER TABLE `sc_shop_payment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sc_shop_product`
--
ALTER TABLE `sc_shop_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sc_shop_product_attribute`
--
ALTER TABLE `sc_shop_product_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sc_shop_product_image`
--
ALTER TABLE `sc_shop_product_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sc_shop_providers`
--
ALTER TABLE `sc_shop_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_shipping_standard`
--
ALTER TABLE `sc_shop_shipping_standard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_shop_shipping_status`
--
ALTER TABLE `sc_shop_shipping_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sc_shop_subscribe`
--
ALTER TABLE `sc_shop_subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sc_shop_supplier`
--
ALTER TABLE `sc_shop_supplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_tax`
--
ALTER TABLE `sc_shop_tax`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_shop_user`
--
ALTER TABLE `sc_shop_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sc_shop_user_address`
--
ALTER TABLE `sc_shop_user_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sc_shop_weight`
--
ALTER TABLE `sc_shop_weight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

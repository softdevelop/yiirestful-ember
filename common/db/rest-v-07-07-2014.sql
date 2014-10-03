-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2014 at 07:21 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `sd_account`
--

CREATE TABLE IF NOT EXISTS `sd_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `sd_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sd_auth_assignment`
--

INSERT INTO `sd_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Abouter', '5', 1404379521),
('admin', '3', 1403837434),
('admin', '4', 1404709707);

-- --------------------------------------------------------

--
-- Table structure for table `sd_auth_item`
--

CREATE TABLE IF NOT EXISTS `sd_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sd_auth_item`
--

INSERT INTO `sd_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/admin/*', 2, NULL, NULL, NULL, 1404375023, 1404375023),
('/site/about', 2, NULL, NULL, NULL, 1404183912, 1404183912),
('/site/index', 2, NULL, NULL, NULL, 1404379478, 1404379478),
('Abouter', 1, 'dasdsada', NULL, NULL, 1404379436, 1404379436),
('admin', 1, 'This is admin role. it''s full permissions', NULL, NULL, 1403837403, 1403837403),
('createAnything', 2, 'createAnything', NULL, NULL, 1404115114, 1404115114),
('creator', 1, 'with this creator role.. it can create anything', NULL, NULL, 1404115015, 1404115015),
('full', 2, 'full', NULL, 's:4:"full";', 1404105103, 1404105103);

-- --------------------------------------------------------

--
-- Table structure for table `sd_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `sd_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sd_auth_item_child`
--

INSERT INTO `sd_auth_item_child` (`parent`, `child`) VALUES
('admin', '/admin/*'),
('admin', '/site/about'),
('creator', '/site/about'),
('Abouter', '/site/index'),
('admin', 'full');

-- --------------------------------------------------------

--
-- Table structure for table `sd_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sd_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_badges_and_challenges`
--

CREATE TABLE IF NOT EXISTS `sd_badges_and_challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycotts`
--

CREATE TABLE IF NOT EXISTS `sd_boycotts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `description` text,
  `demand` text,
  `taxonomy_tag` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_companies_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  `sd_products_id` int(11) NOT NULL,
  `sd_users_id` int(11) NOT NULL,
  `notification_time` int(11) DEFAULT NULL,
  `notification_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_companies_id`,`sd_countries_id`,`sd_products_id`,`sd_users_id`),
  KEY `fk_sd_boycotts_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_boycotts_sd_countries1_idx` (`sd_countries_id`),
  KEY `fk_sd_boycotts_sd_products1_idx` (`sd_products_id`),
  KEY `fk_sd_boycotts_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sd_boycotts`
--

INSERT INTO `sd_boycotts` (`id`, `title`, `target_type`, `target_id`, `description`, `demand`, `taxonomy_tag`, `owner`, `visibility`, `status`, `created_at`, `updated_at`, `sd_companies_id`, `sd_countries_id`, `sd_products_id`, `sd_users_id`, `notification_time`, `notification_number`) VALUES
(6, 'boycott', 'product', NULL, 'description', 'fix', NULL, 1, 1, 1, NULL, NULL, 1, 1, 4, 3, NULL, NULL),
(7, 'new', 'product2', NULL, 'dsd', 'new', NULL, 1, 1, 1, NULL, NULL, 1, 1, 4, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycotts_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_boycotts_has_sd_tags` (
  `sd_boycotts_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_boycotts_id`,`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycott_images`
--

CREATE TABLE IF NOT EXISTS `sd_boycott_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `sd_boycotts_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_images_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycott_links`
--

CREATE TABLE IF NOT EXISTS `sd_boycott_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_links_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_challenges`
--

CREATE TABLE IF NOT EXISTS `sd_challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_comments`
--

CREATE TABLE IF NOT EXISTS `sd_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `type` varchar(45) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_comments_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_companies`
--

CREATE TABLE IF NOT EXISTS `sd_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `short_info` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT NULL,
  `sd_countries_id` int(11) NOT NULL,
  `contact` text,
  PRIMARY KEY (`id`,`sd_countries_id`),
  KEY `fk_sd_companies_sd_galleries1_idx` (`sd_galleries_id`),
  KEY `fk_sd_companies_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_companies`
--

INSERT INTO `sd_companies` (`id`, `title`, `description`, `short_info`, `owner`, `visibility`, `status`, `created_at`, `updated_at`, `sd_galleries_id`, `sd_countries_id`, `contact`) VALUES
(1, 'HDsoft', 'phat trien web', NULL, 1, 0, 1, NULL, NULL, 1, 2, NULL),
(2, 'HDweb', 'phat trien soft', NULL, 1, 0, 1, NULL, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_companies_active_country`
--

CREATE TABLE IF NOT EXISTS `sd_companies_active_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_companies_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_companies_id`,`sd_countries_id`),
  KEY `fk_sd_companies_active_country_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_companies_active_country_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_companies_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_companies_has_sd_tags` (
  `sd_companies_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_companies_id`,`sd_tags_id`),
  KEY `fk_sd_companies_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_companies_has_sd_tags_sd_companies1_idx` (`sd_companies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_countries`
--

CREATE TABLE IF NOT EXISTS `sd_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_countries_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sd_countries`
--

INSERT INTO `sd_countries` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created_at`, `updated_at`, `sd_galleries_id`) VALUES
(1, 'Ha Lan', 'nuoc cua loai hoa', 1, 0, 1, NULL, NULL, 1),
(2, 'Phap', 'thap et phen', 1, 0, 1, NULL, NULL, 1),
(3, 'VietNam', 'gap dep', 1, 0, 1, NULL, NULL, 1),
(4, 'Anh', 'anh dep trai', 1, 0, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sd_countries_has_sd_companies`
--

CREATE TABLE IF NOT EXISTS `sd_countries_has_sd_companies` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_companies_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_companies_id`),
  KEY `fk_sd_countries_has_sd_companies_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_countries_has_sd_companies_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_countries_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_countries_has_sd_tags` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_tags_id`),
  KEY `fk_sd_countries_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_countries_has_sd_tags_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_galleries`
--

CREATE TABLE IF NOT EXISTS `sd_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_galleries`
--

INSERT INTO `sd_galleries` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created_at`, `updated_at`) VALUES
(1, 'gallery1', 'abs', 1, 1, 1, 0, NULL),
(2, 'gallery2', 'acbbab', 1, 1, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_galleries_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_galleries_has_sd_tags` (
  `sd_galleries_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_galleries_id`,`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gamifications`
--

CREATE TABLE IF NOT EXISTS `sd_gamifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `reason` text,
  `target` varchar(45) DEFAULT NULL,
  `sd_userprofiles_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated-at` int(11) DEFAULT NULL,
  `sd_badges_and_challenges_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_userprofiles_id`,`sd_badges_and_challenges_id`),
  KEY `fk_sd_gamifications_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  KEY `fk_sd_gamifications_sd_badges_and_challenges1_idx` (`sd_badges_and_challenges_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_images`
--

CREATE TABLE IF NOT EXISTS `sd_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_images_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_images`
--

INSERT INTO `sd_images` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created_at`, `updated_at`, `sd_galleries_id`) VALUES
(1, 'image1', 'discriotion1', 3, 1, 1, NULL, NULL, 1),
(2, 'image2', 'description2', 3, 1, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sd_images_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_images_has_sd_tags` (
  `sd_images_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_images_id`,`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_images1_idx` (`sd_images_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_likes`
--

CREATE TABLE IF NOT EXISTS `sd_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_likes_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_migration`
--

CREATE TABLE IF NOT EXISTS `sd_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sd_migration`
--

INSERT INTO `sd_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1404462600),
('m140209_132017_init', 1404462765),
('m140403_174025_create_account_table', 1404462767);

-- --------------------------------------------------------

--
-- Table structure for table `sd_news`
--

CREATE TABLE IF NOT EXISTS `sd_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `taxonomy_tag` varchar(45) DEFAULT NULL,
  `is_published` tinyint(4) DEFAULT '0',
  `published_date` datetime DEFAULT NULL,
  `owener` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `content` text,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_news_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_news_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_news_has_sd_tags` (
  `sd_news_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_news_id`,`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_news1_idx` (`sd_news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_notifications`
--

CREATE TABLE IF NOT EXISTS `sd_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `trigger` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trigger_UNIQUE` (`trigger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_products`
--

CREATE TABLE IF NOT EXISTS `sd_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT '0',
  `sd_companies_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sd_companies_id`),
  KEY `fk_sd_products_sd_galleries1_idx` (`sd_galleries_id`),
  KEY `fk_sd_products_sd_companies1_idx` (`sd_companies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sd_products`
--

INSERT INTO `sd_products` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created_at`, `updated_at`, `sd_galleries_id`, `sd_companies_id`) VALUES
(4, 'kem', 'kem lanh', 1, 1, 1, NULL, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sd_products_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_products_has_sd_tags` (
  `sd_products_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_products_id`,`sd_tags_id`),
  KEY `fk_sd_products_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_products_has_sd_tags_sd_products1_idx` (`sd_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `description` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_tags_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_tags_has_sd_news`
--

CREATE TABLE IF NOT EXISTS `sd_tags_has_sd_news` (
  `sd_tags_id` int(11) NOT NULL,
  `sd_news_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_tags_id`,`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_news1_idx` (`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_tags_idx` (`sd_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_userprofiles`
--

CREATE TABLE IF NOT EXISTS `sd_userprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_users_id` int(11) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text,
  `total` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `comment` text,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_userprofiles_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sd_userprofiles`
--

INSERT INTO `sd_userprofiles` (`id`, `sd_users_id`, `birthday`, `profile_picture`, `bio`, `total`, `name`, `surname`, `created_at`, `updated_at`, `comment`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@gmail.com', 'b13fdf448fbdad847fe3b9435644d9e8', NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anh@gmail.com', 'b13fdf448fbdad847fe3b9435644d9e8', NULL, NULL),
(3, 3, NULL, NULL, 'dsa', NULL, 'yiiRest', 'dsa', 1404528061, 1404530839, 'da', NULL, NULL, NULL, NULL, NULL),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1404709683, 1404709683, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_users`
--

CREATE TABLE IF NOT EXISTS `sd_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `social_link` text,
  `social_link_signup` text,
  `status` tinyint(4) DEFAULT '0',
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `auth_key` varchar(255) NOT NULL,
  `confirmation_token` varchar(32) DEFAULT NULL,
  `confirmation_sent_at` int(11) DEFAULT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `recovery_token` varchar(32) DEFAULT NULL,
  `recovery_sent_at` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `registered_from` int(11) DEFAULT NULL,
  `logged_in_from` int(11) DEFAULT NULL,
  `logged_in_at` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sd_users`
--

INSERT INTO `sd_users` (`id`, `username`, `visibility`, `social_link`, `social_link_signup`, `status`, `password_hash`, `email`, `access_token`, `created_at`, `updated_at`, `auth_key`, `confirmation_token`, `confirmation_sent_at`, `confirmed_at`, `unconfirmed_email`, `recovery_token`, `recovery_sent_at`, `blocked_at`, `role`, `registered_from`, `logged_in_from`, `logged_in_at`, `name`) VALUES
(1, 'administrator', 0, NULL, NULL, 0, '$2y$12$AfB72dikOjHst.McbdqKfOun4IwUPtXDl4DMLFVDuthV4S9tfTuoq', 'admin@gmail.com', '', 1404372342, 1404464122, 'VTs6mdHjehGKU3O92afmhxCgSgFL5iaC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2130706433, 2130706433, 1404464122, 'administrator'),
(2, 'anh', 0, NULL, NULL, 0, '$2y$12$AfB72dikOjHst.McbdqKfOun4IwUPtXDl4DMLFVDuthV4S9tfTuoq', 'anh@gmail.com', '', 1404463352, 1404464053, 'YKZyCfsllHoE8qQwiaP1Gx_bq35-EdUP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2130706433, 2130706433, 1404464053, NULL),
(3, 'admin', 0, NULL, NULL, 1, '$2y$13$mMP4Ij9/0pYhnkXgEfATlO/rdnDz4rAwuy8fdhBmI2t7Jp2XsoZBu', 'choidautim@gmail.com', '$2y$13$mMP4Ij9/0pYhnkXgEfATlO/rdnDz4rAwuy8fdhBmI2t7Jp2XsoZBuadmin', 1404528061, 1404528061, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'admin4', 0, NULL, NULL, 0, '$2y$13$4cDr.5V8cW3hbxDDEd.0g.iMZeij/jcv27Z98EXMgIz.yUOGCtL1a', 'choidautim@gmail.com4', '$2y$13$4cDr.5V8cW3hbxDDEd.0g.iMZeij/jcv27Z98EXMgIz.yUOGCtL1aadmin4', 1404709683, 1404709683, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_users_has_sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_users_has_sd_tags` (
  `sd_users_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_users_id`,`sd_tags_id`),
  KEY `fk_sd_users_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_users_has_sd_tags_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_boycott_creates`
--

CREATE TABLE IF NOT EXISTS `sd_user_boycott_creates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_userprofiles_id`,`sd_boycotts_id`),
  KEY `fk_sd_user_boycott_creates_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  KEY `fk_sd_user_boycott_creates_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_user_boycott_creates`
--

INSERT INTO `sd_user_boycott_creates` (`id`, `sd_userprofiles_id`, `sd_boycotts_id`) VALUES
(1, 3, 6),
(2, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_boycott_signs`
--

CREATE TABLE IF NOT EXISTS `sd_user_boycott_signs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  `money_spend` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sd_userprofiles_id`,`sd_boycotts_id`),
  KEY `fk_sd_user_boycott_signs_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  KEY `fk_sd_user_boycott_signs_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_user_boycott_signs`
--

INSERT INTO `sd_user_boycott_signs` (`id`, `sd_userprofiles_id`, `sd_boycotts_id`, `money_spend`) VALUES
(1, 3, 6, 13),
(2, 3, 7, 12);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_account`
--
ALTER TABLE `sd_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `sd_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sd_auth_assignment`
--
ALTER TABLE `sd_auth_assignment`
  ADD CONSTRAINT `sd_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_auth_item`
--
ALTER TABLE `sd_auth_item`
  ADD CONSTRAINT `sd_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `sd_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_auth_item_child`
--
ALTER TABLE `sd_auth_item_child`
  ADD CONSTRAINT `sd_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_boycotts`
--
ALTER TABLE `sd_boycotts`
  ADD CONSTRAINT `fk_sd_boycotts_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_boycotts_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_boycotts_sd_products1` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_boycotts_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycotts_has_sd_tags`
--
ALTER TABLE `sd_boycotts_has_sd_tags`
  ADD CONSTRAINT `fk_sd_boycotts_has_sd_tags_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_boycotts_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycott_images`
--
ALTER TABLE `sd_boycott_images`
  ADD CONSTRAINT `fk_sd_boycott_images_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycott_links`
--
ALTER TABLE `sd_boycott_links`
  ADD CONSTRAINT `fk_sd_boycott_links_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_comments`
--
ALTER TABLE `sd_comments`
  ADD CONSTRAINT `fk_sd_comments_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_companies`
--
ALTER TABLE `sd_companies`
  ADD CONSTRAINT `fk_sd_companies_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_companies_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_companies_active_country`
--
ALTER TABLE `sd_companies_active_country`
  ADD CONSTRAINT `fk_sd_companies_active_country_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_companies_active_country_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_companies_has_sd_tags`
--
ALTER TABLE `sd_companies_has_sd_tags`
  ADD CONSTRAINT `fk_sd_companies_has_sd_tags_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_companies_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_countries`
--
ALTER TABLE `sd_countries`
  ADD CONSTRAINT `fk_sd_countries_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_countries_has_sd_companies`
--
ALTER TABLE `sd_countries_has_sd_companies`
  ADD CONSTRAINT `fk_sd_countries_has_sd_companies_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_countries_has_sd_companies_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_countries_has_sd_tags`
--
ALTER TABLE `sd_countries_has_sd_tags`
  ADD CONSTRAINT `fk_sd_countries_has_sd_tags_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_countries_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_galleries_has_sd_tags`
--
ALTER TABLE `sd_galleries_has_sd_tags`
  ADD CONSTRAINT `fk_sd_galleries_has_sd_tags_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_galleries_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_gamifications`
--
ALTER TABLE `sd_gamifications`
  ADD CONSTRAINT `fk_sd_gamifications_sd_badges_and_challenges1` FOREIGN KEY (`sd_badges_and_challenges_id`) REFERENCES `sd_badges_and_challenges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_gamifications_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_images`
--
ALTER TABLE `sd_images`
  ADD CONSTRAINT `fk_sd_images_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_images_has_sd_tags`
--
ALTER TABLE `sd_images_has_sd_tags`
  ADD CONSTRAINT `fk_sd_images_has_sd_tags_sd_images1` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_images_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_likes`
--
ALTER TABLE `sd_likes`
  ADD CONSTRAINT `fk_sd_likes_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_news`
--
ALTER TABLE `sd_news`
  ADD CONSTRAINT `fk_sd_news_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_news_has_sd_tags`
--
ALTER TABLE `sd_news_has_sd_tags`
  ADD CONSTRAINT `fk_sd_news_has_sd_tags_sd_news1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_news_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_products`
--
ALTER TABLE `sd_products`
  ADD CONSTRAINT `fk_sd_products_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_products_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_products_has_sd_tags`
--
ALTER TABLE `sd_products_has_sd_tags`
  ADD CONSTRAINT `fk_sd_products_has_sd_tags_sd_products1` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_products_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_tags`
--
ALTER TABLE `sd_tags`
  ADD CONSTRAINT `fk_sd_tags_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_tags_has_sd_news`
--
ALTER TABLE `sd_tags_has_sd_news`
  ADD CONSTRAINT `fk_sd_tags_has_sd_news_sd_news1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_tags_has_sd_news_sd_tags` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_userprofiles`
--
ALTER TABLE `sd_userprofiles`
  ADD CONSTRAINT `fk_sd_userprofiles_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_users_has_sd_tags`
--
ALTER TABLE `sd_users_has_sd_tags`
  ADD CONSTRAINT `fk_sd_users_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_users_has_sd_tags_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_user_boycott_creates`
--
ALTER TABLE `sd_user_boycott_creates`
  ADD CONSTRAINT `fk_sd_user_boycott_creates_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_user_boycott_creates_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_user_boycott_signs`
--
ALTER TABLE `sd_user_boycott_signs`
  ADD CONSTRAINT `fk_sd_user_boycott_signs_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_user_boycott_signs_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

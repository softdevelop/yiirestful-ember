-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2014 at 06:00 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

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
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1403756782),
('m130524_201442_init', 1403756785);

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
('admin', '1', 1403837434);

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
-- Table structure for table `sd_badges`
--

CREATE TABLE IF NOT EXISTS `sd_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `description` varchar(255) DEFAULT NULL,
  `money_spend` int(11) DEFAULT '0',
  `demand` text,
  `taxonomy_tag` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sd_products_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_products_id`,`sd_countries_id`),
  KEY `fk_sd_boycotts_sd_products1_idx` (`sd_products_id`),
  KEY `fk_sd_boycotts_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycott_images`
--

CREATE TABLE IF NOT EXISTS `sd_boycott_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_images_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_boycott_links`
--

CREATE TABLE IF NOT EXISTS `sd_boycott_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_links_sd_boycotts1_idx` (`sd_boycotts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_comments`
--

CREATE TABLE IF NOT EXISTS `sd_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `type` varchar(45) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sd_users_id` int(11) NOT NULL,
  `sd_news_id` int(11) DEFAULT NULL,
  `sd_boycotts_id` int(11) DEFAULT NULL,
  `sd_images_id` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_comments_sd_users1_idx` (`sd_users_id`),
  KEY `fk_sd_comments_sd_news1_idx` (`sd_news_id`),
  KEY `fk_sd_comments_sd_boycotts1_idx` (`sd_boycotts_id`),
  KEY `fk_sd_comments_sd_images1_idx` (`sd_images_id`),
  KEY `fk_sd_comments_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_companies`
--

CREATE TABLE IF NOT EXISTS `sd_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `short_info` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sd_galleries_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_galleries_id`,`sd_countries_id`),
  KEY `fk_sd_companies_sd_galleries1_idx` (`sd_galleries_id`),
  KEY `fk_sd_companies_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_companies`
--

INSERT INTO `sd_companies` (`id`, `title`, `description`, `short_info`, `owner`, `visibility`, `status`, `created`, `modified`, `sd_galleries_id`, `sd_countries_id`) VALUES
(1, 'Samsum', 'cua samsum', NULL, NULL, 0, 1, '2014-07-04 03:56:56', NULL, 1, 1),
(2, 'sony', 'cua sony', NULL, NULL, 0, 1, '2014-07-04 03:58:20', NULL, 2, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `description` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sd_galleries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_galleries_id`),
  KEY `fk_sd_countries_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_countries`
--

INSERT INTO `sd_countries` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created`, `modified`, `sd_galleries_id`) VALUES
(1, 'Ha Lan', 'vai ca ha lan', 1, 0, 1, '2014-07-04 03:56:06', NULL, 1),
(2, 'Phap', 'vai ca phap', 1, 0, 0, '2014-07-04 03:57:47', NULL, 2);

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
-- Table structure for table `sd_countries_has_sd_products`
--

CREATE TABLE IF NOT EXISTS `sd_countries_has_sd_products` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_products_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_products_id`),
  KEY `fk_sd_countries_has_sd_products_sd_products1_idx` (`sd_products_id`),
  KEY `fk_sd_countries_has_sd_products_sd_countries1_idx` (`sd_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `description` varchar(255) DEFAULT NULL,
  `tags` text,
  `comments` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_galleries`
--

INSERT INTO `sd_galleries` (`id`, `title`, `description`, `tags`, `comments`, `owner`, `visibility`, `status`, `created`, `modified`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 0, 0, '2014-07-04 03:54:17', NULL),
(2, NULL, NULL, NULL, NULL, NULL, 0, 0, '2014-07-04 03:57:12', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_images`
--

CREATE TABLE IF NOT EXISTS `sd_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tags` text,
  `comments` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sd_galleries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_galleries_id`),
  KEY `fk_sd_images_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sd_likes`
--

CREATE TABLE IF NOT EXISTS `sd_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  `sd_news_id` int(11) DEFAULT NULL,
  `sd_images_id` int(11) DEFAULT NULL,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_likes_sd_users1_idx` (`sd_users_id`),
  KEY `fk_sd_likes_sd_news1_idx` (`sd_news_id`),
  KEY `fk_sd_likes_sd_images1_idx` (`sd_images_id`),
  KEY `fk_sd_likes_sd_galleries1_idx` (`sd_galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
('m000000_000000_base', 1404372119),
('m140209_132017_init', 1404372278),
('m140403_174025_create_account_table', 1404372285);

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
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_products`
--

CREATE TABLE IF NOT EXISTS `sd_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `sd_galleries_id` int(11) NOT NULL,
  `sd_companies_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_galleries_id`,`sd_companies_id`),
  KEY `fk_sd_products_sd_galleries1_idx` (`sd_galleries_id`),
  KEY `fk_sd_products_sd_companies1_idx` (`sd_companies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sd_products`
--

INSERT INTO `sd_products` (`id`, `title`, `description`, `owner`, `visibility`, `status`, `created`, `modified`, `sd_galleries_id`, `sd_companies_id`) VALUES
(1, 'samsum galaxy note 3', 'samsum galaxy note 3', 1, 0, 1, '2014-07-24 03:51:44', '2014-07-15 10:52:34', 1, 1),
(2, 'Vai', 'vai the', 2, 0, 1, '2014-07-04 03:58:52', NULL, 2, 2);

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
-- Table structure for table `sd_profile`
--

CREATE TABLE IF NOT EXISTS `sd_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sd_profile`
--

INSERT INTO `sd_profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, 'Nguyen Anh', 'cauut2117610@gmail.com', 'admin@gmail.com', 'a5d80d2ad26e658a58faf0b732fed461', 'Việt Nam', 'https://translate.google.com.vn', ''),
(5, NULL, NULL, 'anh@gmail.com', 'b13fdf448fbdad847fe3b9435644d9e8', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sd_tags`
--

CREATE TABLE IF NOT EXISTS `sd_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user`
--

CREATE TABLE IF NOT EXISTS `sd_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `social_link` text,
  `social_link_signup` text,
  `status` tinyint(4) DEFAULT '0',
  `password_hash` varchar(1000) NOT NULL,
  `email` varchar(45) NOT NULL,
  `access_token` varchar(45) NOT NULL,
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
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sd_user`
--

INSERT INTO `sd_user` (`id`, `name`, `username`, `visibility`, `social_link`, `social_link_signup`, `status`, `password_hash`, `email`, `access_token`, `auth_key`, `confirmation_token`, `confirmation_sent_at`, `confirmed_at`, `unconfirmed_email`, `recovery_token`, `recovery_sent_at`, `blocked_at`, `role`, `registered_from`, `logged_in_from`, `logged_in_at`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'admin', 0, NULL, NULL, 1, '$2y$12$fMlf1O/lkMNY7nOEcazuleMADXW.EHDKL9bWjx2stsxvi1/IqJCkW', 'admin@gmail.com', '', 'VTs6mdHjehGKU3O92afmhxCgSgFL5iaC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 2130706433, 2130706433, 1404379589, 1404372342, 1404379589),
(5, NULL, 'anh', 0, NULL, NULL, 0, '$2y$12$eN5cPEJqSlqjeKNEWn.fke8kAFH.T1fUHUP29bldy30pNywARmxH.', 'anh@gmail.com', '', '6GAfo4Ni0xx1tUjEWsIApNX9nDKAf-AY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2130706433, 2130706433, 1404379536, 1404374123, 1404379536);

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
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_userprofiles_sd_users1_idx` (`sd_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sd_userprofiles_has_sd_badges`
--

CREATE TABLE IF NOT EXISTS `sd_userprofiles_has_sd_badges` (
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_badges_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_userprofiles_id`,`sd_badges_id`),
  KEY `fk_sd_userprofiles_has_sd_badges_sd_badges1_idx` (`sd_badges_id`),
  KEY `fk_sd_userprofiles_has_sd_badges_sd_userprofiles1_idx` (`sd_userprofiles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sd_userprofiles_has_sd_challenges`
--

CREATE TABLE IF NOT EXISTS `sd_userprofiles_has_sd_challenges` (
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_challenges_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_userprofiles_id`,`sd_challenges_id`),
  KEY `fk_sd_userprofiles_has_sd_challenges_sd_challenges1_idx` (`sd_challenges_id`),
  KEY `fk_sd_userprofiles_has_sd_challenges_sd_userprofiles1_idx` (`sd_userprofiles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_account`
--
ALTER TABLE `sd_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `sd_user` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `sd_boycotts_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_boycotts_ibfk_2` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycotts_has_sd_tags`
--
ALTER TABLE `sd_boycotts_has_sd_tags`
  ADD CONSTRAINT `sd_boycotts_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_boycotts_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycott_images`
--
ALTER TABLE `sd_boycott_images`
  ADD CONSTRAINT `sd_boycott_images_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_boycott_links`
--
ALTER TABLE `sd_boycott_links`
  ADD CONSTRAINT `sd_boycott_links_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_comments`
--
ALTER TABLE `sd_comments`
  ADD CONSTRAINT `sd_comments_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_comments_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_comments_ibfk_3` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_comments_ibfk_4` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_comments_ibfk_5` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_companies`
--
ALTER TABLE `sd_companies`
  ADD CONSTRAINT `sd_companies_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_companies_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_companies_active_country`
--
ALTER TABLE `sd_companies_active_country`
  ADD CONSTRAINT `sd_companies_active_country_ibfk_1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_companies_active_country_ibfk_2` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `sd_countries_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_countries_has_sd_companies`
--
ALTER TABLE `sd_countries_has_sd_companies`
  ADD CONSTRAINT `fk_sd_countries_has_sd_companies_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_countries_has_sd_companies_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_countries_has_sd_products`
--
ALTER TABLE `sd_countries_has_sd_products`
  ADD CONSTRAINT `sd_countries_has_sd_products_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_countries_has_sd_products_ibfk_2` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `sd_galleries_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_galleries_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_images`
--
ALTER TABLE `sd_images`
  ADD CONSTRAINT `sd_images_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_images_has_sd_tags`
--
ALTER TABLE `sd_images_has_sd_tags`
  ADD CONSTRAINT `sd_images_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_images_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_likes`
--
ALTER TABLE `sd_likes`
  ADD CONSTRAINT `sd_likes_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_likes_ibfk_2` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_likes_ibfk_3` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_likes_ibfk_4` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_news_has_sd_tags`
--
ALTER TABLE `sd_news_has_sd_tags`
  ADD CONSTRAINT `sd_news_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_news_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_products`
--
ALTER TABLE `sd_products`
  ADD CONSTRAINT `sd_products_ibfk_1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_products_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_products_has_sd_tags`
--
ALTER TABLE `sd_products_has_sd_tags`
  ADD CONSTRAINT `fk_sd_products_has_sd_tags_sd_products1` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sd_products_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_profile`
--
ALTER TABLE `sd_profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `sd_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sd_tags_has_sd_news`
--
ALTER TABLE `sd_tags_has_sd_news`
  ADD CONSTRAINT `sd_tags_has_sd_news_ibfk_1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_tags_has_sd_news_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_userprofiles`
--
ALTER TABLE `sd_userprofiles`
  ADD CONSTRAINT `sd_userprofiles_ibfk_1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_userprofiles_has_sd_badges`
--
ALTER TABLE `sd_userprofiles_has_sd_badges`
  ADD CONSTRAINT `sd_userprofiles_has_sd_badges_ibfk_1` FOREIGN KEY (`sd_badges_id`) REFERENCES `sd_badges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_userprofiles_has_sd_badges_ibfk_2` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_userprofiles_has_sd_challenges`
--
ALTER TABLE `sd_userprofiles_has_sd_challenges`
  ADD CONSTRAINT `sd_userprofiles_has_sd_challenges_ibfk_1` FOREIGN KEY (`sd_challenges_id`) REFERENCES `sd_challenges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sd_userprofiles_has_sd_challenges_ibfk_2` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

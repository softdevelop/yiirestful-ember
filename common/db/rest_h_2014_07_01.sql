/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : rest

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-07-01 11:42:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1403756782');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1403756785');

-- ----------------------------
-- Table structure for sd_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `sd_auth_assignment`;
CREATE TABLE `sd_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `sd_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_auth_assignment
-- ----------------------------
INSERT INTO `sd_auth_assignment` VALUES ('admin', '1', '1403837434');

-- ----------------------------
-- Table structure for sd_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `sd_auth_item`;
CREATE TABLE `sd_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `sd_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `sd_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_auth_item
-- ----------------------------
INSERT INTO `sd_auth_item` VALUES ('/site/about', '2', null, null, null, '1404183912', '1404183912');
INSERT INTO `sd_auth_item` VALUES ('admin', '1', 'This is admin role. it\'s full permissions', null, null, '1403837403', '1403837403');
INSERT INTO `sd_auth_item` VALUES ('createAnything', '2', 'createAnything', null, null, '1404115114', '1404115114');
INSERT INTO `sd_auth_item` VALUES ('creator', '1', 'with this creator role.. it can create anything', null, null, '1404115015', '1404115015');
INSERT INTO `sd_auth_item` VALUES ('full', '2', 'full', null, 's:4:\"full\";', '1404105103', '1404105103');

-- ----------------------------
-- Table structure for sd_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `sd_auth_item_child`;
CREATE TABLE `sd_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `sd_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sd_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `sd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_auth_item_child
-- ----------------------------
INSERT INTO `sd_auth_item_child` VALUES ('admin', '/site/about');
INSERT INTO `sd_auth_item_child` VALUES ('creator', 'createAnything');
INSERT INTO `sd_auth_item_child` VALUES ('admin', 'full');

-- ----------------------------
-- Table structure for sd_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sd_auth_rule`;
CREATE TABLE `sd_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sd_badges
-- ----------------------------
DROP TABLE IF EXISTS `sd_badges`;
CREATE TABLE `sd_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_badges
-- ----------------------------

-- ----------------------------
-- Table structure for sd_boycotts
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycotts`;
CREATE TABLE `sd_boycotts` (
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
  KEY `fk_sd_boycotts_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `sd_boycotts_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_boycotts_ibfk_2` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_boycotts
-- ----------------------------

-- ----------------------------
-- Table structure for sd_boycotts_has_sd_tags
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycotts_has_sd_tags`;
CREATE TABLE `sd_boycotts_has_sd_tags` (
  `sd_boycotts_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_boycotts_id`,`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `sd_boycotts_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_boycotts_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_boycotts_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sd_boycott_images
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycott_images`;
CREATE TABLE `sd_boycott_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_images_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `sd_boycott_images_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_boycott_images
-- ----------------------------

-- ----------------------------
-- Table structure for sd_boycott_links
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycott_links`;
CREATE TABLE `sd_boycott_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_links_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `sd_boycott_links_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_boycott_links
-- ----------------------------

-- ----------------------------
-- Table structure for sd_challenges
-- ----------------------------
DROP TABLE IF EXISTS `sd_challenges`;
CREATE TABLE `sd_challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_id_UNIQUE` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_challenges
-- ----------------------------

-- ----------------------------
-- Table structure for sd_comments
-- ----------------------------
DROP TABLE IF EXISTS `sd_comments`;
CREATE TABLE `sd_comments` (
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
  KEY `fk_sd_comments_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `sd_comments_ibfk_1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_comments_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_comments_ibfk_3` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_comments_ibfk_4` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_comments_ibfk_5` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_comments
-- ----------------------------

-- ----------------------------
-- Table structure for sd_companies
-- ----------------------------
DROP TABLE IF EXISTS `sd_companies`;
CREATE TABLE `sd_companies` (
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
  KEY `fk_sd_companies_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `sd_companies_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_companies_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_companies
-- ----------------------------

-- ----------------------------
-- Table structure for sd_companies_active_country
-- ----------------------------
DROP TABLE IF EXISTS `sd_companies_active_country`;
CREATE TABLE `sd_companies_active_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_companies_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_companies_id`,`sd_countries_id`),
  KEY `fk_sd_companies_active_country_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_companies_active_country_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `sd_companies_active_country_ibfk_1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_companies_active_country_ibfk_2` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_companies_active_country
-- ----------------------------

-- ----------------------------
-- Table structure for sd_countries
-- ----------------------------
DROP TABLE IF EXISTS `sd_countries`;
CREATE TABLE `sd_countries` (
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
  KEY `fk_sd_countries_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `sd_countries_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_countries
-- ----------------------------

-- ----------------------------
-- Table structure for sd_countries_has_sd_products
-- ----------------------------
DROP TABLE IF EXISTS `sd_countries_has_sd_products`;
CREATE TABLE `sd_countries_has_sd_products` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_products_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_products_id`),
  KEY `fk_sd_countries_has_sd_products_sd_products1_idx` (`sd_products_id`),
  KEY `fk_sd_countries_has_sd_products_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `sd_countries_has_sd_products_ibfk_1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_countries_has_sd_products_ibfk_2` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_countries_has_sd_products
-- ----------------------------

-- ----------------------------
-- Table structure for sd_galleries
-- ----------------------------
DROP TABLE IF EXISTS `sd_galleries`;
CREATE TABLE `sd_galleries` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_galleries
-- ----------------------------

-- ----------------------------
-- Table structure for sd_galleries_has_sd_tags
-- ----------------------------
DROP TABLE IF EXISTS `sd_galleries_has_sd_tags`;
CREATE TABLE `sd_galleries_has_sd_tags` (
  `sd_galleries_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_galleries_id`,`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `sd_galleries_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_galleries_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_galleries_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sd_gamifications
-- ----------------------------
DROP TABLE IF EXISTS `sd_gamifications`;
CREATE TABLE `sd_gamifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `reason` text,
  `target` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_gamifications
-- ----------------------------

-- ----------------------------
-- Table structure for sd_images
-- ----------------------------
DROP TABLE IF EXISTS `sd_images`;
CREATE TABLE `sd_images` (
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
  KEY `fk_sd_images_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `sd_images_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_images
-- ----------------------------

-- ----------------------------
-- Table structure for sd_images_has_sd_tags
-- ----------------------------
DROP TABLE IF EXISTS `sd_images_has_sd_tags`;
CREATE TABLE `sd_images_has_sd_tags` (
  `sd_images_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_images_id`,`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_images1_idx` (`sd_images_id`),
  CONSTRAINT `sd_images_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_images_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_images_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sd_likes
-- ----------------------------
DROP TABLE IF EXISTS `sd_likes`;
CREATE TABLE `sd_likes` (
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
  KEY `fk_sd_likes_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `sd_likes_ibfk_1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_likes_ibfk_2` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_likes_ibfk_3` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_likes_ibfk_4` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_likes
-- ----------------------------

-- ----------------------------
-- Table structure for sd_news
-- ----------------------------
DROP TABLE IF EXISTS `sd_news`;
CREATE TABLE `sd_news` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_news
-- ----------------------------

-- ----------------------------
-- Table structure for sd_news_has_sd_tags
-- ----------------------------
DROP TABLE IF EXISTS `sd_news_has_sd_tags`;
CREATE TABLE `sd_news_has_sd_tags` (
  `sd_news_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_news_id`,`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_news1_idx` (`sd_news_id`),
  CONSTRAINT `sd_news_has_sd_tags_ibfk_1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_news_has_sd_tags_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_news_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sd_notifications
-- ----------------------------
DROP TABLE IF EXISTS `sd_notifications`;
CREATE TABLE `sd_notifications` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for sd_products
-- ----------------------------
DROP TABLE IF EXISTS `sd_products`;
CREATE TABLE `sd_products` (
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
  KEY `fk_sd_products_sd_companies1_idx` (`sd_companies_id`),
  CONSTRAINT `sd_products_ibfk_1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_products_ibfk_2` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_products
-- ----------------------------

-- ----------------------------
-- Table structure for sd_tags
-- ----------------------------
DROP TABLE IF EXISTS `sd_tags`;
CREATE TABLE `sd_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for sd_tags_has_sd_news
-- ----------------------------
DROP TABLE IF EXISTS `sd_tags_has_sd_news`;
CREATE TABLE `sd_tags_has_sd_news` (
  `sd_tags_id` int(11) NOT NULL,
  `sd_news_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_tags_id`,`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_news1_idx` (`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_tags_idx` (`sd_tags_id`),
  CONSTRAINT `sd_tags_has_sd_news_ibfk_1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_tags_has_sd_news_ibfk_2` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_tags_has_sd_news
-- ----------------------------

-- ----------------------------
-- Table structure for sd_user
-- ----------------------------
DROP TABLE IF EXISTS `sd_user`;
CREATE TABLE `sd_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `visibility` tinyint(4) DEFAULT '0',
  `social_link` text,
  `social_link_signup` text,
  `status` tinyint(4) DEFAULT '0',
  `password` varchar(1000) NOT NULL,
  `email` varchar(45) NOT NULL,
  `access_token` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_user
-- ----------------------------
INSERT INTO `sd_user` VALUES ('1', 'administrator', 'admin', '0', null, null, '1', '$2y$13$W86JOYUrIF5afjvMgqGzmOXU0ACH77J3TRK3QxvUoz5qnH8RdK19q', '', '');
INSERT INTO `sd_user` VALUES ('2', 'Creator', 'creator', '0', null, null, '1', '$2y$13$W86JOYUrIF5afjvMgqGzmOXU0ACH77J3TRK3QxvUoz5qnH8RdK19q', '', '');

-- ----------------------------
-- Table structure for sd_userprofiles
-- ----------------------------
DROP TABLE IF EXISTS `sd_userprofiles`;
CREATE TABLE `sd_userprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_users_id` int(11) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_userprofiles_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `sd_userprofiles_ibfk_1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_userprofiles
-- ----------------------------

-- ----------------------------
-- Table structure for sd_userprofiles_has_sd_badges
-- ----------------------------
DROP TABLE IF EXISTS `sd_userprofiles_has_sd_badges`;
CREATE TABLE `sd_userprofiles_has_sd_badges` (
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_badges_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_userprofiles_id`,`sd_badges_id`),
  KEY `fk_sd_userprofiles_has_sd_badges_sd_badges1_idx` (`sd_badges_id`),
  KEY `fk_sd_userprofiles_has_sd_badges_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  CONSTRAINT `sd_userprofiles_has_sd_badges_ibfk_1` FOREIGN KEY (`sd_badges_id`) REFERENCES `sd_badges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_userprofiles_has_sd_badges_ibfk_2` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_userprofiles_has_sd_badges
-- ----------------------------

-- ----------------------------
-- Table structure for sd_userprofiles_has_sd_challenges
-- ----------------------------
DROP TABLE IF EXISTS `sd_userprofiles_has_sd_challenges`;
CREATE TABLE `sd_userprofiles_has_sd_challenges` (
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_challenges_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_userprofiles_id`,`sd_challenges_id`),
  KEY `fk_sd_userprofiles_has_sd_challenges_sd_challenges1_idx` (`sd_challenges_id`),
  KEY `fk_sd_userprofiles_has_sd_challenges_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  CONSTRAINT `sd_userprofiles_has_sd_challenges_ibfk_1` FOREIGN KEY (`sd_challenges_id`) REFERENCES `sd_challenges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sd_userprofiles_has_sd_challenges_ibfk_2` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sd_userprofiles_has_sd_challenges
-- ----------------------------

-- ----------------------------
-- Table structure for sd_users__
-- ----------------------------
DROP TABLE IF EXISTS `sd_users__`;
CREATE TABLE `sd_users__` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_users__
-- ----------------------------
INSERT INTO `sd_users__` VALUES ('1', 'admin', 'b31UiB4Nx-UwG9sRT9WeDUzHpjnBi-7A', '$2y$13$W86JOYUrIF5afjvMgqGzmOXU0ACH77J3TRK3QxvUoz5qnH8RdK19q', null, 'admin@admin.com', '10', '10', '1403756965', '1403756965');

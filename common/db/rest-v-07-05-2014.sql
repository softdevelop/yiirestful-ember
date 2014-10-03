/*
Navicat MySQL Data Transfer

Source Server         : restlocal
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : rest

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-07-05 10:05:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `sd_account`
-- ----------------------------
DROP TABLE IF EXISTS `sd_account`;
CREATE TABLE `sd_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `properties` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `sd_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_account
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_auth_assignment`
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
INSERT INTO `sd_auth_assignment` VALUES ('Abouter', '5', '1404379521');
INSERT INTO `sd_auth_assignment` VALUES ('admin', '1', '1403837434');

-- ----------------------------
-- Table structure for `sd_auth_item`
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
INSERT INTO `sd_auth_item` VALUES ('/admin/*', '2', null, null, null, '1404375023', '1404375023');
INSERT INTO `sd_auth_item` VALUES ('/site/about', '2', null, null, null, '1404183912', '1404183912');
INSERT INTO `sd_auth_item` VALUES ('/site/index', '2', null, null, null, '1404379478', '1404379478');
INSERT INTO `sd_auth_item` VALUES ('Abouter', '1', 'dasdsada', null, null, '1404379436', '1404379436');
INSERT INTO `sd_auth_item` VALUES ('admin', '1', 'This is admin role. it\'s full permissions', null, null, '1403837403', '1403837403');
INSERT INTO `sd_auth_item` VALUES ('createAnything', '2', 'createAnything', null, null, '1404115114', '1404115114');
INSERT INTO `sd_auth_item` VALUES ('creator', '1', 'with this creator role.. it can create anything', null, null, '1404115015', '1404115015');
INSERT INTO `sd_auth_item` VALUES ('full', '2', 'full', null, 's:4:\"full\";', '1404105103', '1404105103');

-- ----------------------------
-- Table structure for `sd_auth_item_child`
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
INSERT INTO `sd_auth_item_child` VALUES ('admin', '/admin/*');
INSERT INTO `sd_auth_item_child` VALUES ('admin', '/site/about');
INSERT INTO `sd_auth_item_child` VALUES ('creator', '/site/about');
INSERT INTO `sd_auth_item_child` VALUES ('Abouter', '/site/index');
INSERT INTO `sd_auth_item_child` VALUES ('admin', 'full');

-- ----------------------------
-- Table structure for `sd_auth_rule`
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
-- Table structure for `sd_badges_and_challenges`
-- ----------------------------
DROP TABLE IF EXISTS `sd_badges_and_challenges`;
CREATE TABLE `sd_badges_and_challenges` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_badges_and_challenges
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_boycott_images`
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycott_images`;
CREATE TABLE `sd_boycott_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `sd_boycotts_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_images_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `fk_sd_boycott_images_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_boycott_images
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_boycott_links`
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycott_links`;
CREATE TABLE `sd_boycott_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) DEFAULT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`sd_boycotts_id`),
  KEY `fk_sd_boycott_links_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `fk_sd_boycott_links_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_boycott_links
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_boycotts`
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycotts`;
CREATE TABLE `sd_boycotts` (
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
  KEY `fk_sd_boycotts_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_boycotts_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_boycotts_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_boycotts_sd_products1` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_boycotts_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_boycotts
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_boycotts_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_boycotts_has_sd_tags`;
CREATE TABLE `sd_boycotts_has_sd_tags` (
  `sd_boycotts_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_boycotts_id`,`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_boycotts_has_sd_tags_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `fk_sd_boycotts_has_sd_tags_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_boycotts_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_boycotts_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_comments`
-- ----------------------------
DROP TABLE IF EXISTS `sd_comments`;
CREATE TABLE `sd_comments` (
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
  KEY `fk_sd_comments_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_comments_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_companies`
-- ----------------------------
DROP TABLE IF EXISTS `sd_companies`;
CREATE TABLE `sd_companies` (
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
  KEY `fk_sd_companies_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `fk_sd_companies_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_companies_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_companies
-- ----------------------------
INSERT INTO `sd_companies` VALUES ('1', 'HDsoft', 'phat trien web', null, '1', '0', '1', null, null, '1', '2', null);
INSERT INTO `sd_companies` VALUES ('2', 'HDweb', 'phat trien soft', null, '1', '0', '1', null, null, '1', '1', null);

-- ----------------------------
-- Table structure for `sd_companies_active_country`
-- ----------------------------
DROP TABLE IF EXISTS `sd_companies_active_country`;
CREATE TABLE `sd_companies_active_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_companies_id` int(11) NOT NULL,
  `sd_countries_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_companies_id`,`sd_countries_id`),
  KEY `fk_sd_companies_active_country_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_companies_active_country_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `fk_sd_companies_active_country_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_companies_active_country_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_companies_active_country
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_companies_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_companies_has_sd_tags`;
CREATE TABLE `sd_companies_has_sd_tags` (
  `sd_companies_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_companies_id`,`sd_tags_id`),
  KEY `fk_sd_companies_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_companies_has_sd_tags_sd_companies1_idx` (`sd_companies_id`),
  CONSTRAINT `fk_sd_companies_has_sd_tags_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_companies_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_companies_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_countries`
-- ----------------------------
DROP TABLE IF EXISTS `sd_countries`;
CREATE TABLE `sd_countries` (
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
  KEY `fk_sd_countries_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `fk_sd_countries_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_countries
-- ----------------------------
INSERT INTO `sd_countries` VALUES ('1', 'Ha Lan', 'nuoc cua loai hoa', '1', '0', '1', null, null, '1');
INSERT INTO `sd_countries` VALUES ('2', 'Phap', 'thap et phen', '1', '0', '1', null, null, '1');
INSERT INTO `sd_countries` VALUES ('3', 'VietNam', 'gap dep', '1', '0', '1', null, null, '1');
INSERT INTO `sd_countries` VALUES ('4', 'Anh', 'anh dep trai', '1', '0', '1', null, null, '1');

-- ----------------------------
-- Table structure for `sd_countries_has_sd_companies`
-- ----------------------------
DROP TABLE IF EXISTS `sd_countries_has_sd_companies`;
CREATE TABLE `sd_countries_has_sd_companies` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_companies_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_companies_id`),
  KEY `fk_sd_countries_has_sd_companies_sd_companies1_idx` (`sd_companies_id`),
  KEY `fk_sd_countries_has_sd_companies_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `fk_sd_countries_has_sd_companies_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_countries_has_sd_companies_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_countries_has_sd_companies
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_countries_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_countries_has_sd_tags`;
CREATE TABLE `sd_countries_has_sd_tags` (
  `sd_countries_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_countries_id`,`sd_tags_id`),
  KEY `fk_sd_countries_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_countries_has_sd_tags_sd_countries1_idx` (`sd_countries_id`),
  CONSTRAINT `fk_sd_countries_has_sd_tags_sd_countries1` FOREIGN KEY (`sd_countries_id`) REFERENCES `sd_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_countries_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_countries_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_challenges`
-- ----------------------------
DROP TABLE IF EXISTS `sd_challenges`;
CREATE TABLE `sd_challenges` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_challenges
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_galleries`
-- ----------------------------
DROP TABLE IF EXISTS `sd_galleries`;
CREATE TABLE `sd_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `owner` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_galleries
-- ----------------------------
INSERT INTO `sd_galleries` VALUES ('1', 'gallery1', 'abs', '1', '1', '1', '0', null);
INSERT INTO `sd_galleries` VALUES ('2', 'gallery2', 'acbbab', '1', '1', '1', '0', null);

-- ----------------------------
-- Table structure for `sd_galleries_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_galleries_has_sd_tags`;
CREATE TABLE `sd_galleries_has_sd_tags` (
  `sd_galleries_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_galleries_id`,`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_galleries_has_sd_tags_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `fk_sd_galleries_has_sd_tags_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_galleries_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_galleries_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_gamifications`
-- ----------------------------
DROP TABLE IF EXISTS `sd_gamifications`;
CREATE TABLE `sd_gamifications` (
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
  KEY `fk_sd_gamifications_sd_badges_and_challenges1_idx` (`sd_badges_and_challenges_id`),
  CONSTRAINT `fk_sd_gamifications_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_gamifications_sd_badges_and_challenges1` FOREIGN KEY (`sd_badges_and_challenges_id`) REFERENCES `sd_badges_and_challenges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_gamifications
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_images`
-- ----------------------------
DROP TABLE IF EXISTS `sd_images`;
CREATE TABLE `sd_images` (
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
  KEY `fk_sd_images_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `fk_sd_images_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_images
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_images_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_images_has_sd_tags`;
CREATE TABLE `sd_images_has_sd_tags` (
  `sd_images_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_images_id`,`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_images_has_sd_tags_sd_images1_idx` (`sd_images_id`),
  CONSTRAINT `fk_sd_images_has_sd_tags_sd_images1` FOREIGN KEY (`sd_images_id`) REFERENCES `sd_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_images_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_images_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_likes`
-- ----------------------------
DROP TABLE IF EXISTS `sd_likes`;
CREATE TABLE `sd_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `target_type` varchar(45) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_likes_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_likes_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_likes
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_migration`
-- ----------------------------
DROP TABLE IF EXISTS `sd_migration`;
CREATE TABLE `sd_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_migration
-- ----------------------------
INSERT INTO `sd_migration` VALUES ('m000000_000000_base', '1404462600');
INSERT INTO `sd_migration` VALUES ('m140209_132017_init', '1404462765');
INSERT INTO `sd_migration` VALUES ('m140403_174025_create_account_table', '1404462767');

-- ----------------------------
-- Table structure for `sd_news`
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
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `content` text,
  `sd_galleries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sd_news_sd_galleries1_idx` (`sd_galleries_id`),
  CONSTRAINT `fk_sd_news_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_news
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_news_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_news_has_sd_tags`;
CREATE TABLE `sd_news_has_sd_tags` (
  `sd_news_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_news_id`,`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_news_has_sd_tags_sd_news1_idx` (`sd_news_id`),
  CONSTRAINT `fk_sd_news_has_sd_tags_sd_news1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_news_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_news_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_notifications`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_products`
-- ----------------------------
DROP TABLE IF EXISTS `sd_products`;
CREATE TABLE `sd_products` (
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
  KEY `fk_sd_products_sd_companies1_idx` (`sd_companies_id`),
  CONSTRAINT `fk_sd_products_sd_companies1` FOREIGN KEY (`sd_companies_id`) REFERENCES `sd_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_products_sd_galleries1` FOREIGN KEY (`sd_galleries_id`) REFERENCES `sd_galleries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_products
-- ----------------------------
INSERT INTO `sd_products` VALUES ('4', 'kem', 'kem lanh', '1', '1', '1', null, null, '1', '2');

-- ----------------------------
-- Table structure for `sd_products_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_products_has_sd_tags`;
CREATE TABLE `sd_products_has_sd_tags` (
  `sd_products_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_products_id`,`sd_tags_id`),
  KEY `fk_sd_products_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_products_has_sd_tags_sd_products1_idx` (`sd_products_id`),
  CONSTRAINT `fk_sd_products_has_sd_tags_sd_products1` FOREIGN KEY (`sd_products_id`) REFERENCES `sd_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_products_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_products_has_sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_tags`;
CREATE TABLE `sd_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `description` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `sd_users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_users_id`),
  KEY `fk_sd_tags_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_tags_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_tags_has_sd_news`
-- ----------------------------
DROP TABLE IF EXISTS `sd_tags_has_sd_news`;
CREATE TABLE `sd_tags_has_sd_news` (
  `sd_tags_id` int(11) NOT NULL,
  `sd_news_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_tags_id`,`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_news1_idx` (`sd_news_id`),
  KEY `fk_sd_tags_has_sd_news_sd_tags_idx` (`sd_tags_id`),
  CONSTRAINT `fk_sd_tags_has_sd_news_sd_tags` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_tags_has_sd_news_sd_news1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_tags_has_sd_news
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_user_boycott_creates`
-- ----------------------------
DROP TABLE IF EXISTS `sd_user_boycott_creates`;
CREATE TABLE `sd_user_boycott_creates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sd_userprofiles_id`,`sd_boycotts_id`),
  KEY `fk_sd_user_boycott_creates_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  KEY `fk_sd_user_boycott_creates_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `fk_sd_user_boycott_creates_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_user_boycott_creates_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_user_boycott_creates
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_user_boycott_signs`
-- ----------------------------
DROP TABLE IF EXISTS `sd_user_boycott_signs`;
CREATE TABLE `sd_user_boycott_signs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sd_userprofiles_id` int(11) NOT NULL,
  `sd_boycotts_id` int(11) NOT NULL,
  `money_spend` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`sd_userprofiles_id`,`sd_boycotts_id`),
  KEY `fk_sd_user_boycott_signs_sd_userprofiles1_idx` (`sd_userprofiles_id`),
  KEY `fk_sd_user_boycott_signs_sd_boycotts1_idx` (`sd_boycotts_id`),
  CONSTRAINT `fk_sd_user_boycott_signs_sd_userprofiles1` FOREIGN KEY (`sd_userprofiles_id`) REFERENCES `sd_userprofiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_user_boycott_signs_sd_boycotts1` FOREIGN KEY (`sd_boycotts_id`) REFERENCES `sd_boycotts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_user_boycott_signs
-- ----------------------------

-- ----------------------------
-- Table structure for `sd_userprofiles`
-- ----------------------------
DROP TABLE IF EXISTS `sd_userprofiles`;
CREATE TABLE `sd_userprofiles` (
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
  KEY `fk_sd_userprofiles_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_userprofiles_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_userprofiles
-- ----------------------------
INSERT INTO `sd_userprofiles` VALUES ('1', '1', null, null, null, null, null, null, null, null, null, null, 'admin@gmail.com', 'b13fdf448fbdad847fe3b9435644d9e8', null, null);
INSERT INTO `sd_userprofiles` VALUES ('2', '2', null, null, null, null, null, null, null, null, null, null, 'anh@gmail.com', 'b13fdf448fbdad847fe3b9435644d9e8', null, null);
INSERT INTO `sd_userprofiles` VALUES ('3', '3', null, null, null, null, null, null, '1404528061', '1404528061', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sd_users`
-- ----------------------------
DROP TABLE IF EXISTS `sd_users`;
CREATE TABLE `sd_users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_users
-- ----------------------------
INSERT INTO `sd_users` VALUES ('1', 'administrator', '0', null, null, '0', '$2y$12$AfB72dikOjHst.McbdqKfOun4IwUPtXDl4DMLFVDuthV4S9tfTuoq', 'admin@gmail.com', '', '1404372342', '1404464122', 'VTs6mdHjehGKU3O92afmhxCgSgFL5iaC', null, null, null, null, null, null, null, null, '2130706433', '2130706433', '1404464122', 'administrator');
INSERT INTO `sd_users` VALUES ('2', 'anh', '0', null, null, '0', '$2y$12$AfB72dikOjHst.McbdqKfOun4IwUPtXDl4DMLFVDuthV4S9tfTuoq', 'anh@gmail.com', '', '1404463352', '1404464053', 'YKZyCfsllHoE8qQwiaP1Gx_bq35-EdUP', null, null, null, null, null, null, null, null, '2130706433', '2130706433', '1404464053', null);
INSERT INTO `sd_users` VALUES ('3', 'admin', '0', null, null, '1', '$2y$13$mMP4Ij9/0pYhnkXgEfATlO/rdnDz4rAwuy8fdhBmI2t7Jp2XsoZBu', 'choidautim@gmail.com', '$2y$13$mMP4Ij9/0pYhnkXgEfATlO/rdnDz4rAwuy8fdhBmI2t7Jp2XsoZBuadmin', '1404528061', '1404528061', '', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sd_users_has_sd_tags`
-- ----------------------------
DROP TABLE IF EXISTS `sd_users_has_sd_tags`;
CREATE TABLE `sd_users_has_sd_tags` (
  `sd_users_id` int(11) NOT NULL,
  `sd_tags_id` int(11) NOT NULL,
  PRIMARY KEY (`sd_users_id`,`sd_tags_id`),
  KEY `fk_sd_users_has_sd_tags_sd_tags1_idx` (`sd_tags_id`),
  KEY `fk_sd_users_has_sd_tags_sd_users1_idx` (`sd_users_id`),
  CONSTRAINT `fk_sd_users_has_sd_tags_sd_users1` FOREIGN KEY (`sd_users_id`) REFERENCES `sd_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sd_users_has_sd_tags_sd_tags1` FOREIGN KEY (`sd_tags_id`) REFERENCES `sd_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sd_users_has_sd_tags
-- ----------------------------

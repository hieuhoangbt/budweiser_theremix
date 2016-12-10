/*
Navicat MySQL Data Transfer

Source Server         : All
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : budweiser

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-12-10 13:09:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jigsaw_assets
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_assets`;
CREATE TABLE `jigsaw_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_assets
-- ----------------------------
INSERT INTO `jigsaw_assets` VALUES ('1', '0', '0', '105', '0', 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('2', '1', '1', '2', '1', 'com_admin', 'com_admin', '{}');
INSERT INTO `jigsaw_assets` VALUES ('3', '1', '3', '6', '1', 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('4', '1', '7', '8', '1', 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('5', '1', '9', '10', '1', 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('6', '1', '11', '12', '1', 'com_config', 'com_config', '{}');
INSERT INTO `jigsaw_assets` VALUES ('7', '1', '13', '16', '1', 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('8', '1', '17', '20', '1', 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('9', '1', '21', '22', '1', 'com_cpanel', 'com_cpanel', '{}');
INSERT INTO `jigsaw_assets` VALUES ('10', '1', '23', '24', '1', 'com_installer', 'com_installer', '{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}');
INSERT INTO `jigsaw_assets` VALUES ('11', '1', '25', '26', '1', 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('12', '1', '27', '28', '1', 'com_login', 'com_login', '{}');
INSERT INTO `jigsaw_assets` VALUES ('13', '1', '29', '30', '1', 'com_mailto', 'com_mailto', '{}');
INSERT INTO `jigsaw_assets` VALUES ('14', '1', '31', '32', '1', 'com_massmail', 'com_massmail', '{}');
INSERT INTO `jigsaw_assets` VALUES ('15', '1', '33', '34', '1', 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('16', '1', '35', '38', '1', 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('17', '1', '39', '40', '1', 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('18', '1', '41', '72', '1', 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('19', '1', '73', '76', '1', 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('20', '1', '77', '78', '1', 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('21', '1', '79', '80', '1', 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1},\"core.manage\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('22', '1', '81', '82', '1', 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('23', '1', '83', '84', '1', 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('24', '1', '85', '88', '1', 'com_users', 'com_users', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('26', '1', '89', '90', '1', 'com_wrapper', 'com_wrapper', '{}');
INSERT INTO `jigsaw_assets` VALUES ('27', '8', '18', '19', '2', 'com_content.category.2', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('28', '3', '4', '5', '2', 'com_banners.category.3', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('29', '7', '14', '15', '2', 'com_contact.category.4', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('30', '19', '74', '75', '2', 'com_newsfeeds.category.5', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('32', '24', '86', '87', '1', 'com_users.category.7', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('33', '1', '91', '92', '1', 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `jigsaw_assets` VALUES ('34', '1', '93', '94', '1', 'com_joomlaupdate', 'com_joomlaupdate', '{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('35', '1', '95', '96', '1', 'com_tags', 'com_tags', '{\"core.admin\":[],\"core.manage\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('36', '1', '97', '98', '1', 'com_contenthistory', 'com_contenthistory', '{}');
INSERT INTO `jigsaw_assets` VALUES ('37', '1', '99', '100', '1', 'com_ajax', 'com_ajax', '{}');
INSERT INTO `jigsaw_assets` VALUES ('38', '1', '101', '102', '1', 'com_postinstall', 'com_postinstall', '{}');
INSERT INTO `jigsaw_assets` VALUES ('39', '18', '42', '43', '2', 'com_modules.module.1', 'Main Menu', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('40', '18', '44', '45', '2', 'com_modules.module.2', 'Login', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('41', '18', '46', '47', '2', 'com_modules.module.3', 'Popular Articles', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('42', '18', '48', '49', '2', 'com_modules.module.4', 'Recently Added Articles', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('43', '18', '50', '51', '2', 'com_modules.module.8', 'Toolbar', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('44', '18', '52', '53', '2', 'com_modules.module.9', 'Quick Icons', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('45', '18', '54', '55', '2', 'com_modules.module.10', 'Logged-in Users', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('46', '18', '56', '57', '2', 'com_modules.module.12', 'Admin Menu', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('47', '18', '58', '59', '2', 'com_modules.module.13', 'Admin Submenu', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('48', '18', '60', '61', '2', 'com_modules.module.14', 'User Status', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('49', '18', '62', '63', '2', 'com_modules.module.15', 'Title', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('50', '18', '64', '65', '2', 'com_modules.module.16', 'Login Form', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('51', '18', '66', '67', '2', 'com_modules.module.17', 'Breadcrumbs', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('52', '18', '68', '69', '2', 'com_modules.module.79', 'Multilanguage status', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('53', '18', '70', '71', '2', 'com_modules.module.86', 'Joomla Version', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `jigsaw_assets` VALUES ('54', '16', '36', '37', '2', 'com_menus.menu.1', 'Main Menu', '{}');
INSERT INTO `jigsaw_assets` VALUES ('55', '1', '103', '104', '1', 'com_budweiser_theremix', 'com_budweiser_theremix', '{}');

-- ----------------------------
-- Table structure for jigsaw_associations
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_associations`;
CREATE TABLE `jigsaw_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_associations
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_banners
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_banners`;
CREATE TABLE `jigsaw_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_banners
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_banner_clients
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_banner_clients`;
CREATE TABLE `jigsaw_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_banner_clients
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_banner_tracks
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_banner_tracks`;
CREATE TABLE `jigsaw_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_banner_tracks
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_budweiser_theremix_celebrity
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_budweiser_theremix_celebrity`;
CREATE TABLE `jigsaw_budweiser_theremix_celebrity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_jpeg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `image_png` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_budweiser_theremix_celebrity
-- ----------------------------
INSERT INTO `jigsaw_budweiser_theremix_celebrity` VALUES ('1', '0', '1', '0', '0000-00-00 00:00:00', '0', '0', 'Hồ ngọc hà', 'dgdfhfgjhfjf', '2016-12-10 12:15:49', null, null, null);

-- ----------------------------
-- Table structure for jigsaw_budweiser_theremix_frame
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_budweiser_theremix_frame`;
CREATE TABLE `jigsaw_budweiser_theremix_frame` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_budweiser_theremix_frame
-- ----------------------------
INSERT INTO `jigsaw_budweiser_theremix_frame` VALUES ('1', '1', '1', '0', '0000-00-00 00:00:00', '126', '126', 'frame 1', 'images/15085647_616795178528407_625038474606721871_n.jpg', null, null);

-- ----------------------------
-- Table structure for jigsaw_budweiser_theremix_result
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_budweiser_theremix_result`;
CREATE TABLE `jigsaw_budweiser_theremix_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `celebrity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `frame_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_budweiser_theremix_result
-- ----------------------------
INSERT INTO `jigsaw_budweiser_theremix_result` VALUES ('1', '1', '1', '0', '0000-00-00 00:00:00', '126', '126', '1', '1', 'images/15085647_616795178528407_625038474606721871_n.jpg', '2016-12-10 11:00:07', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for jigsaw_budweiser_theremix_user
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_budweiser_theremix_user`;
CREATE TABLE `jigsaw_budweiser_theremix_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_budweiser_theremix_user
-- ----------------------------
INSERT INTO `jigsaw_budweiser_theremix_user` VALUES ('1', '0', '1', '0', '0000-00-00 00:00:00', '0', '0', 'Nguyễn văn tí', 'gút văn boi', '25445758678678', '1', 'teo@gmail.com', '2016-12-07 10:45:24', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for jigsaw_categories
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_categories`;
CREATE TABLE `jigsaw_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_categories
-- ----------------------------
INSERT INTO `jigsaw_categories` VALUES ('1', '0', '0', '0', '11', '0', '', 'system', 'ROOT', 'root', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{}', '', '', '{}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');
INSERT INTO `jigsaw_categories` VALUES ('2', '27', '1', '1', '2', '1', 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');
INSERT INTO `jigsaw_categories` VALUES ('3', '28', '1', '3', '4', '1', 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');
INSERT INTO `jigsaw_categories` VALUES ('4', '29', '1', '5', '6', '1', 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');
INSERT INTO `jigsaw_categories` VALUES ('5', '30', '1', '7', '8', '1', 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');
INSERT INTO `jigsaw_categories` VALUES ('7', '32', '1', '9', '10', '1', 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', '1', '0', '0000-00-00 00:00:00', '1', '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', '126', '2011-01-01 00:00:01', '0', '0000-00-00 00:00:00', '0', '*', '1');

-- ----------------------------
-- Table structure for jigsaw_contact_details
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_contact_details`;
CREATE TABLE `jigsaw_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_contact_details
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_content
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_content`;
CREATE TABLE `jigsaw_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_content
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_contentitem_tag_map
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_contentitem_tag_map`;
CREATE TABLE `jigsaw_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- ----------------------------
-- Records of jigsaw_contentitem_tag_map
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_content_frontpage
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_content_frontpage`;
CREATE TABLE `jigsaw_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_content_frontpage
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_content_rating
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_content_rating`;
CREATE TABLE `jigsaw_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_content_rating
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_content_types
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_content_types`;
CREATE TABLE `jigsaw_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_content_types
-- ----------------------------
INSERT INTO `jigsaw_content_types` VALUES ('1', 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `jigsaw_content_types` VALUES ('2', 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }');
INSERT INTO `jigsaw_content_types` VALUES ('3', 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `jigsaw_content_types` VALUES ('4', 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', 'UsersHelperRoute::getUserRoute', '');
INSERT INTO `jigsaw_content_types` VALUES ('5', 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('6', 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('7', 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('8', 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('9', 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}');
INSERT INTO `jigsaw_content_types` VALUES ('10', 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('11', 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}');
INSERT INTO `jigsaw_content_types` VALUES ('12', 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('13', 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
INSERT INTO `jigsaw_content_types` VALUES ('10000', 'Celebrity', 'com_budweiser_theremix.celebrity', '{\"special\":{\"dbtable\":\"#__budweiser_theremix_celebrity\",\"key\":\"id\",\"type\":\"Celebrity\",\"prefix\":\"Budweiser_theremixTable\"}}', '', '', '', '{\"formFile\":\"administrator/components/com_budweiser_theremix/models/forms/celebrity.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"params\",\"language\"], \"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"group_id\",\"targetTable\":\"#__usergroups\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}');

-- ----------------------------
-- Table structure for jigsaw_core_log_searches
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_core_log_searches`;
CREATE TABLE `jigsaw_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_core_log_searches
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_extensions
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_extensions`;
CREATE TABLE `jigsaw_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_extensions
-- ----------------------------
INSERT INTO `jigsaw_extensions` VALUES ('1', 'com_mailto', 'component', 'com_mailto', '', '0', '1', '1', '1', '{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('2', 'com_wrapper', 'component', 'com_wrapper', '', '0', '1', '1', '1', '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('3', 'com_admin', 'component', 'com_admin', '', '1', '1', '1', '1', '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('4', 'com_banners', 'component', 'com_banners', '', '1', '1', '1', '0', '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('5', 'com_cache', 'component', 'com_cache', '', '1', '1', '1', '1', '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('6', 'com_categories', 'component', 'com_categories', '', '1', '1', '1', '1', '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('7', 'com_checkin', 'component', 'com_checkin', '', '1', '1', '1', '1', '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('8', 'com_contact', 'component', 'com_contact', '', '1', '1', '1', '0', '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('9', 'com_cpanel', 'component', 'com_cpanel', '', '1', '1', '1', '1', '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('10', 'com_installer', 'component', 'com_installer', '', '1', '1', '1', '1', '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('11', 'com_languages', 'component', 'com_languages', '', '1', '1', '1', '1', '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('12', 'com_login', 'component', 'com_login', '', '1', '1', '1', '1', '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('13', 'com_media', 'component', 'com_media', '', '1', '1', '0', '1', '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS,MP4,OGG,mp4\",\"upload_maxsize\":\"100\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,mp4,ogg\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip,video\\/mp4\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('14', 'com_menus', 'component', 'com_menus', '', '1', '1', '1', '1', '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('15', 'com_messages', 'component', 'com_messages', '', '1', '1', '1', '1', '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('16', 'com_modules', 'component', 'com_modules', '', '1', '1', '1', '1', '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('17', 'com_newsfeeds', 'component', 'com_newsfeeds', '', '1', '1', '1', '0', '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('18', 'com_plugins', 'component', 'com_plugins', '', '1', '1', '1', '1', '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('19', 'com_search', 'component', 'com_search', '', '1', '1', '1', '0', '{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}', '{\"enabled\":\"0\",\"show_date\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('20', 'com_templates', 'component', 'com_templates', '', '1', '1', '1', '1', '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('22', 'com_content', 'component', 'com_content', '', '1', '1', '0', '1', '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('23', 'com_config', 'component', 'com_config', '', '1', '1', '0', '1', '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('24', 'com_redirect', 'component', 'com_redirect', '', '1', '1', '0', '1', '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('25', 'com_users', 'component', 'com_users', '', '1', '1', '0', '1', '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"1\",\"useractivation\":\"1\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('27', 'com_finder', 'component', 'com_finder', '', '1', '1', '0', '0', '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('28', 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', '1', '1', '0', '1', '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('29', 'com_tags', 'component', 'com_tags', '', '1', '1', '1', '1', '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"show_tag_num_items\":\"0\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('30', 'com_contenthistory', 'component', 'com_contenthistory', '', '1', '1', '1', '0', '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('31', 'com_ajax', 'component', 'com_ajax', '', '1', '1', '1', '1', '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('32', 'com_postinstall', 'component', 'com_postinstall', '', '1', '1', '1', '1', '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('102', 'LIB_PHPUTF8', 'library', 'phputf8', '', '0', '1', '1', '1', '{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('103', 'LIB_JOOMLA', 'library', 'joomla', '', '0', '1', '1', '1', '{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"mediaversion\":\"59ea323d283aac0f0b0374e97608b10e\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('104', 'LIB_IDNA', 'library', 'idna_convert', '', '0', '1', '1', '1', '{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('105', 'FOF', 'library', 'fof', '', '0', '1', '1', '1', '{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('106', 'LIB_PHPASS', 'library', 'phpass', '', '0', '1', '1', '1', '{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('200', 'mod_articles_archive', 'module', 'mod_articles_archive', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('201', 'mod_articles_latest', 'module', 'mod_articles_latest', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('202', 'mod_articles_popular', 'module', 'mod_articles_popular', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('203', 'mod_banners', 'module', 'mod_banners', '', '0', '1', '1', '0', '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('204', 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', '0', '1', '1', '1', '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('205', 'mod_custom', 'module', 'mod_custom', '', '0', '1', '1', '1', '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('206', 'mod_feed', 'module', 'mod_feed', '', '0', '1', '1', '0', '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('207', 'mod_footer', 'module', 'mod_footer', '', '0', '1', '1', '0', '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('208', 'mod_login', 'module', 'mod_login', '', '0', '1', '1', '1', '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('209', 'mod_menu', 'module', 'mod_menu', '', '0', '1', '1', '1', '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('210', 'mod_articles_news', 'module', 'mod_articles_news', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('211', 'mod_random_image', 'module', 'mod_random_image', '', '0', '1', '1', '0', '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('212', 'mod_related_items', 'module', 'mod_related_items', '', '0', '1', '1', '0', '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('213', 'mod_search', 'module', 'mod_search', '', '0', '1', '1', '0', '{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('214', 'mod_stats', 'module', 'mod_stats', '', '0', '1', '1', '0', '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('215', 'mod_syndicate', 'module', 'mod_syndicate', '', '0', '1', '1', '1', '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('216', 'mod_users_latest', 'module', 'mod_users_latest', '', '0', '1', '1', '0', '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('218', 'mod_whosonline', 'module', 'mod_whosonline', '', '0', '1', '1', '0', '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('219', 'mod_wrapper', 'module', 'mod_wrapper', '', '0', '1', '1', '0', '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('220', 'mod_articles_category', 'module', 'mod_articles_category', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('221', 'mod_articles_categories', 'module', 'mod_articles_categories', '', '0', '1', '1', '0', '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('222', 'mod_languages', 'module', 'mod_languages', '', '0', '1', '1', '1', '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('223', 'mod_finder', 'module', 'mod_finder', '', '0', '1', '0', '0', '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('300', 'mod_custom', 'module', 'mod_custom', '', '1', '1', '1', '1', '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('301', 'mod_feed', 'module', 'mod_feed', '', '1', '1', '1', '0', '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('302', 'mod_latest', 'module', 'mod_latest', '', '1', '1', '1', '0', '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('303', 'mod_logged', 'module', 'mod_logged', '', '1', '1', '1', '0', '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('304', 'mod_login', 'module', 'mod_login', '', '1', '1', '1', '1', '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('305', 'mod_menu', 'module', 'mod_menu', '', '1', '1', '1', '0', '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('307', 'mod_popular', 'module', 'mod_popular', '', '1', '1', '1', '0', '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('308', 'mod_quickicon', 'module', 'mod_quickicon', '', '1', '1', '1', '1', '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('309', 'mod_status', 'module', 'mod_status', '', '1', '1', '1', '0', '{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('310', 'mod_submenu', 'module', 'mod_submenu', '', '1', '1', '1', '0', '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('311', 'mod_title', 'module', 'mod_title', '', '1', '1', '1', '0', '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('312', 'mod_toolbar', 'module', 'mod_toolbar', '', '1', '1', '1', '1', '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('313', 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', '1', '1', '1', '0', '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('314', 'mod_version', 'module', 'mod_version', '', '1', '1', '1', '0', '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('315', 'mod_stats_admin', 'module', 'mod_stats_admin', '', '1', '1', '1', '0', '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('316', 'mod_tags_popular', 'module', 'mod_tags_popular', '', '0', '1', '1', '0', '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('317', 'mod_tags_similar', 'module', 'mod_tags_similar', '', '0', '1', '1', '0', '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('400', 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', '0', '0', '1', '0', '{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('401', 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', '0', '1', '1', '1', '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('402', 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', '0', '0', '1', '0', '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('403', 'plg_content_contact', 'plugin', 'contact', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('404', 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('406', 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', '', '0', '2011-09-18 15:22:50', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('407', 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `jigsaw_extensions` VALUES ('408', 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `jigsaw_extensions` VALUES ('409', 'plg_content_vote', 'plugin', 'vote', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `jigsaw_extensions` VALUES ('410', 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', '0', '1', '1', '1', '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.18.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('411', 'plg_editors_none', 'plugin', 'none', 'editors', '0', '1', '1', '1', '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('412', 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', '0', '1', '1', '0', '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2016\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.4.3\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"mode\":\"1\",\"skin\":\"0\",\"mobile\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"1\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"hr\":\"1\",\"link\":\"1\",\"media\":\"1\",\"print\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"alignment\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('413', 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', '0', '1', '1', '0', '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('414', 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', '0', '1', '1', '0', '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('415', 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', '0', '1', '1', '0', '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('416', 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', '0', '1', '1', '0', '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `jigsaw_extensions` VALUES ('417', 'plg_search_categories', 'plugin', 'categories', 'search', '0', '1', '1', '0', '{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('418', 'plg_search_contacts', 'plugin', 'contacts', 'search', '0', '1', '1', '0', '{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('419', 'plg_search_content', 'plugin', 'content', 'search', '0', '1', '1', '0', '{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('420', 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', '0', '1', '1', '0', '{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('422', 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', '0', '0', '1', '1', '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('423', 'plg_system_p3p', 'plugin', 'p3p', 'system', '0', '0', '1', '0', '{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('424', 'plg_system_cache', 'plugin', 'cache', 'system', '0', '0', '1', '1', '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', '0', '0000-00-00 00:00:00', '9', '0');
INSERT INTO `jigsaw_extensions` VALUES ('425', 'plg_system_debug', 'plugin', 'debug', 'system', '0', '1', '1', '0', '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `jigsaw_extensions` VALUES ('426', 'plg_system_log', 'plugin', 'log', 'system', '0', '1', '1', '1', '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', '', '0', '0000-00-00 00:00:00', '5', '0');
INSERT INTO `jigsaw_extensions` VALUES ('427', 'plg_system_redirect', 'plugin', 'redirect', 'system', '0', '0', '1', '1', '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', '', '0', '0000-00-00 00:00:00', '6', '0');
INSERT INTO `jigsaw_extensions` VALUES ('428', 'plg_system_remember', 'plugin', 'remember', 'system', '0', '1', '1', '1', '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `jigsaw_extensions` VALUES ('429', 'plg_system_sef', 'plugin', 'sef', 'system', '0', '1', '1', '0', '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', '', '0', '0000-00-00 00:00:00', '8', '0');
INSERT INTO `jigsaw_extensions` VALUES ('430', 'plg_system_logout', 'plugin', 'logout', 'system', '0', '1', '1', '1', '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('431', 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', '0', '0', '1', '0', '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('432', 'plg_user_joomla', 'plugin', 'joomla', 'user', '0', '1', '1', '0', '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('433', 'plg_user_profile', 'plugin', 'profile', 'user', '0', '0', '1', '0', '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('434', 'plg_extension_joomla', 'plugin', 'joomla', 'extension', '0', '1', '1', '1', '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('435', 'plg_content_joomla', 'plugin', 'joomla', 'content', '0', '1', '1', '0', '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('436', 'plg_system_languagecode', 'plugin', 'languagecode', 'system', '0', '0', '1', '0', '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', '', '0', '0000-00-00 00:00:00', '10', '0');
INSERT INTO `jigsaw_extensions` VALUES ('437', 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', '0', '1', '1', '1', '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('438', 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', '0', '1', '1', '1', '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('439', 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', '0', '0', '1', '0', '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('440', 'plg_system_highlight', 'plugin', 'highlight', 'system', '0', '1', '1', '0', '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', '', '0', '0000-00-00 00:00:00', '7', '0');
INSERT INTO `jigsaw_extensions` VALUES ('441', 'plg_content_finder', 'plugin', 'finder', 'content', '0', '0', '1', '0', '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('442', 'plg_finder_categories', 'plugin', 'categories', 'finder', '0', '1', '1', '0', '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('443', 'plg_finder_contacts', 'plugin', 'contacts', 'finder', '0', '1', '1', '0', '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('444', 'plg_finder_content', 'plugin', 'content', 'finder', '0', '1', '1', '0', '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('445', 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', '0', '1', '1', '0', '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', '', '0', '0000-00-00 00:00:00', '4', '0');
INSERT INTO `jigsaw_extensions` VALUES ('447', 'plg_finder_tags', 'plugin', 'tags', 'finder', '0', '1', '1', '0', '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('448', 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', '0', '0', '1', '0', '{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('449', 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', '0', '1', '1', '0', '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('450', 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', '0', '0', '1', '0', '{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('451', 'plg_search_tags', 'plugin', 'tags', 'search', '0', '1', '1', '0', '{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('452', 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', '0', '1', '1', '0', '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1481338018}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('453', 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', '0', '1', '1', '0', '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('454', 'plg_system_stats', 'plugin', 'stats', 'system', '0', '1', '1', '0', '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":1481077962,\"unique_id\":\"a9b3316b24bff9284da8fb7ea15227b0ee257800\",\"interval\":12}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('455', 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', '0', '1', '1', '1', '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', '', '0', '0000-00-00 00:00:00', '1', '0');
INSERT INTO `jigsaw_extensions` VALUES ('456', 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', '0', '1', '1', '1', '{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', '', '0', '0000-00-00 00:00:00', '2', '0');
INSERT INTO `jigsaw_extensions` VALUES ('457', 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', '0', '1', '1', '1', '{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', '', '0', '0000-00-00 00:00:00', '3', '0');
INSERT INTO `jigsaw_extensions` VALUES ('503', 'beez3', 'template', 'beez3', '', '0', '1', '1', '0', '{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('504', 'hathor', 'template', 'hathor', '', '1', '1', '1', '0', '{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('506', 'protostar', 'template', 'protostar', '', '0', '1', '1', '0', '{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('507', 'isis', 'template', 'isis', '', '1', '1', '1', '0', '{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('600', 'English (en-GB)', 'language', 'en-GB', '', '0', '1', '1', '1', '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.4\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('601', 'English (en-GB)', 'language', 'en-GB', '', '1', '1', '1', '1', '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.4\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('700', 'files_joomla', 'file', 'joomla', '', '0', '1', '1', '1', '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.4\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('802', 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', '0', '1', '1', '1', '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.4.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('10000', 'com_budweiser_theremix', 'component', 'com_budweiser_theremix', '', '1', '1', '0', '0', '{\"name\":\"com_budweiser_theremix\",\"type\":\"component\",\"creationDate\":\"2016-12-07\",\"author\":\"anh\",\"copyright\":\"2016 anh\",\"authorEmail\":\"xuananh1059@gmail.com\",\"authorUrl\":\"\",\"version\":\"CVS: 1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"budweiser_theremix\"}', '{\"save_history\":\"0\"}', '', '', '0', '0000-00-00 00:00:00', '0', '0');
INSERT INTO `jigsaw_extensions` VALUES ('10001', 'Budweiser The Remix', 'template', 'budweisertheremix', '', '0', '1', '1', '0', '{\"name\":\"Budweiser The Remix\",\"type\":\"template\",\"creationDate\":\"2016-12-07\",\"author\":\"XuanAnh\",\"copyright\":\"XuanAnh 2016\",\"authorEmail\":\"xuananh1059@gmail.com\",\"authorUrl\":\"http:\\/\\/www.example.com\",\"version\":\"1.0.0\",\"description\":\"Budweiser The Remix Template\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{}', '', '', '0', '0000-00-00 00:00:00', '0', '0');

-- ----------------------------
-- Table structure for jigsaw_finder_filters
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_filters`;
CREATE TABLE `jigsaw_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_filters
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links`;
CREATE TABLE `jigsaw_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms0
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms0`;
CREATE TABLE `jigsaw_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms0
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms1
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms1`;
CREATE TABLE `jigsaw_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms1
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms2
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms2`;
CREATE TABLE `jigsaw_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms2
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms3
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms3`;
CREATE TABLE `jigsaw_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms3
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms4
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms4`;
CREATE TABLE `jigsaw_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms4
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms5
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms5`;
CREATE TABLE `jigsaw_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms5
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms6
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms6`;
CREATE TABLE `jigsaw_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms6
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms7
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms7`;
CREATE TABLE `jigsaw_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms7
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms8
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms8`;
CREATE TABLE `jigsaw_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms8
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_terms9
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_terms9`;
CREATE TABLE `jigsaw_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_terms9
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termsa
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termsa`;
CREATE TABLE `jigsaw_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termsa
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termsb
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termsb`;
CREATE TABLE `jigsaw_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termsb
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termsc
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termsc`;
CREATE TABLE `jigsaw_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termsc
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termsd
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termsd`;
CREATE TABLE `jigsaw_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termsd
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termse
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termse`;
CREATE TABLE `jigsaw_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termse
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_links_termsf
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_links_termsf`;
CREATE TABLE `jigsaw_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_links_termsf
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_taxonomy`;
CREATE TABLE `jigsaw_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_taxonomy
-- ----------------------------
INSERT INTO `jigsaw_finder_taxonomy` VALUES ('1', '0', 'ROOT', '0', '0', '0');

-- ----------------------------
-- Table structure for jigsaw_finder_taxonomy_map
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_taxonomy_map`;
CREATE TABLE `jigsaw_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_taxonomy_map
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_terms
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_terms`;
CREATE TABLE `jigsaw_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_terms
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_terms_common
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_terms_common`;
CREATE TABLE `jigsaw_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_terms_common
-- ----------------------------
INSERT INTO `jigsaw_finder_terms_common` VALUES ('a', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('about', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('after', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('ago', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('all', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('am', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('an', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('and', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('ani', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('any', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('are', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('aren\'t', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('as', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('at', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('be', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('but', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('by', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('for', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('from', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('get', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('go', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('how', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('if', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('in', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('into', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('is', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('isn\'t', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('it', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('its', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('me', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('more', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('most', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('must', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('my', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('new', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('no', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('none', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('not', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('noth', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('nothing', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('of', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('off', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('often', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('old', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('on', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('onc', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('once', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('onli', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('only', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('or', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('other', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('our', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('ours', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('out', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('over', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('page', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('she', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('should', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('small', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('so', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('some', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('than', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('thank', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('that', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('the', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('their', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('theirs', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('them', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('then', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('there', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('these', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('they', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('this', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('those', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('thus', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('time', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('times', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('to', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('too', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('true', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('under', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('until', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('up', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('upon', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('use', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('user', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('users', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('veri', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('version', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('very', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('via', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('want', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('was', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('way', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('were', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('what', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('when', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('where', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('whi', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('which', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('who', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('whom', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('whose', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('why', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('wide', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('will', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('with', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('within', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('without', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('would', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('yes', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('yet', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('you', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('your', 'en');
INSERT INTO `jigsaw_finder_terms_common` VALUES ('yours', 'en');

-- ----------------------------
-- Table structure for jigsaw_finder_tokens
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_tokens`;
CREATE TABLE `jigsaw_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_tokens_aggregate
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_tokens_aggregate`;
CREATE TABLE `jigsaw_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_tokens_aggregate
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_finder_types
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_finder_types`;
CREATE TABLE `jigsaw_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jigsaw_finder_types
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_languages
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_languages`;
CREATE TABLE `jigsaw_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_languages
-- ----------------------------
INSERT INTO `jigsaw_languages` VALUES ('1', '0', 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en_gb', '', '', '', '', '1', '1', '1');

-- ----------------------------
-- Table structure for jigsaw_menu
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_menu`;
CREATE TABLE `jigsaw_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_menu
-- ----------------------------
INSERT INTO `jigsaw_menu` VALUES ('1', '', 'Menu_Item_Root', 'root', '', '', '', '', '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0', '0', '', '0', '', '0', '47', '0', '*', '0');
INSERT INTO `jigsaw_menu` VALUES ('2', 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', '0', '1', '1', '4', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '1', '10', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('3', 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', '0', '2', '2', '4', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners', '0', '', '2', '3', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('4', 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', '0', '2', '2', '6', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-cat', '0', '', '4', '5', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('5', 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', '0', '2', '2', '4', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-clients', '0', '', '6', '7', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('6', 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', '0', '2', '2', '4', '0', '0000-00-00 00:00:00', '0', '0', 'class:banners-tracks', '0', '', '8', '9', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('7', 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', '0', '1', '1', '8', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '11', '16', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('8', 'menu', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', '0', '7', '2', '8', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact', '0', '', '12', '13', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('9', 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', '0', '7', '2', '6', '0', '0000-00-00 00:00:00', '0', '0', 'class:contact-cat', '0', '', '14', '15', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('10', 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', '0', '1', '1', '15', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages', '0', '', '17', '22', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('11', 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', '0', '10', '2', '15', '0', '0000-00-00 00:00:00', '0', '0', 'class:messages-add', '0', '', '18', '19', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('13', 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '1', '1', '17', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '23', '28', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('14', 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', '0', '13', '2', '17', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds', '0', '', '24', '25', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('15', 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', '0', '13', '2', '6', '0', '0000-00-00 00:00:00', '0', '0', 'class:newsfeeds-cat', '0', '', '26', '27', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('16', 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', '0', '1', '1', '24', '0', '0000-00-00 00:00:00', '0', '0', 'class:redirect', '0', '', '29', '30', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('17', 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', '0', '1', '1', '19', '0', '0000-00-00 00:00:00', '0', '0', 'class:search', '0', '', '31', '32', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('18', 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', '0', '1', '1', '27', '0', '0000-00-00 00:00:00', '0', '0', 'class:finder', '0', '', '33', '34', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('19', 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', '1', '1', '1', '28', '0', '0000-00-00 00:00:00', '0', '0', 'class:joomlaupdate', '0', '', '35', '36', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('20', 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', '0', '1', '1', '29', '0', '0000-00-00 00:00:00', '0', '1', 'class:tags', '0', '', '37', '38', '0', '', '1');
INSERT INTO `jigsaw_menu` VALUES ('21', 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', '0', '1', '1', '32', '0', '0000-00-00 00:00:00', '0', '1', 'class:postinstall', '0', '', '39', '40', '0', '*', '1');
INSERT INTO `jigsaw_menu` VALUES ('101', 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', '1', '1', '1', '22', '0', '0000-00-00 00:00:00', '0', '1', '', '0', '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', '41', '42', '1', '*', '0');
INSERT INTO `jigsaw_menu` VALUES ('102', 'main', 'COM_BUDWEISER_THEREMIX', 'com-budweiser-theremix', '', 'com-budweiser-theremix', 'index.php?option=com_budweiser_theremix', 'component', '0', '1', '1', '10000', '0', '0000-00-00 00:00:00', '0', '1', 'media/com_budweiser_theremix/images/s_com_budweiser_theremix.png', '0', '{}', '43', '46', '0', '', '1');
INSERT INTO `jigsaw_menu` VALUES ('103', 'main', 'COM_BUDWEISER_THEREMIX_TITLE_CELEBRITYS', 'com-budweiser-theremix-title-celebrities', '', 'com-budweiser-theremix/com-budweiser-theremix-title-celebrities', 'index.php?option=com_budweiser_theremix&view=celebrities', 'component', '0', '102', '2', '10000', '0', '0000-00-00 00:00:00', '0', '1', 'media/com_budweiser_theremix/images/s_celebritys.png', '0', '{}', '44', '45', '0', '', '1');

-- ----------------------------
-- Table structure for jigsaw_menu_types
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_menu_types`;
CREATE TABLE `jigsaw_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_menu_types
-- ----------------------------
INSERT INTO `jigsaw_menu_types` VALUES ('1', '0', 'mainmenu', 'Main Menu', 'The main menu for the site');

-- ----------------------------
-- Table structure for jigsaw_messages
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_messages`;
CREATE TABLE `jigsaw_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_messages
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_messages_cfg
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_messages_cfg`;
CREATE TABLE `jigsaw_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_messages_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_modules
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_modules`;
CREATE TABLE `jigsaw_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_modules
-- ----------------------------
INSERT INTO `jigsaw_modules` VALUES ('1', '39', 'Main Menu', '', '', '1', 'position-7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '1', '1', '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `jigsaw_modules` VALUES ('2', '40', 'Login', '', '', '1', 'login', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('3', '41', 'Popular Articles', '', '', '3', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_popular', '3', '1', '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('4', '42', 'Recently Added Articles', '', '', '4', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_latest', '3', '1', '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('8', '43', 'Toolbar', '', '', '1', 'toolbar', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_toolbar', '3', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('9', '44', 'Quick Icons', '', '', '1', 'icon', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_quickicon', '3', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('10', '45', 'Logged-in Users', '', '', '2', 'cpanel', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_logged', '3', '1', '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('12', '46', 'Admin Menu', '', '', '1', 'menu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_menu', '3', '1', '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('13', '47', 'Admin Submenu', '', '', '1', 'submenu', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_submenu', '3', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('14', '48', 'User Status', '', '', '2', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_status', '3', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('15', '49', 'Title', '', '', '1', 'title', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_title', '3', '1', '', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('16', '50', 'Login Form', '', '', '7', 'position-7', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_login', '1', '1', '{\"greeting\":\"1\",\"name\":\"0\"}', '0', '*');
INSERT INTO `jigsaw_modules` VALUES ('17', '51', 'Breadcrumbs', '', '', '1', 'position-2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_breadcrumbs', '1', '1', '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', '0', '*');
INSERT INTO `jigsaw_modules` VALUES ('79', '52', 'Multilanguage status', '', '', '1', 'status', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'mod_multilangstatus', '3', '1', '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');
INSERT INTO `jigsaw_modules` VALUES ('86', '53', 'Joomla Version', '', '', '1', 'footer', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', 'mod_version', '3', '1', '{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', '1', '*');

-- ----------------------------
-- Table structure for jigsaw_modules_menu
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_modules_menu`;
CREATE TABLE `jigsaw_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_modules_menu
-- ----------------------------
INSERT INTO `jigsaw_modules_menu` VALUES ('1', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('2', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('3', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('4', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('6', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('7', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('8', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('9', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('10', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('12', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('13', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('14', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('15', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('16', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('17', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('79', '0');
INSERT INTO `jigsaw_modules_menu` VALUES ('86', '0');

-- ----------------------------
-- Table structure for jigsaw_newsfeeds
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_newsfeeds`;
CREATE TABLE `jigsaw_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_newsfeeds
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_overrider
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_overrider`;
CREATE TABLE `jigsaw_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_overrider
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_postinstall_messages
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_postinstall_messages`;
CREATE TABLE `jigsaw_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_postinstall_messages
-- ----------------------------
INSERT INTO `jigsaw_postinstall_messages` VALUES ('1', '700', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', '1', 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', '1');
INSERT INTO `jigsaw_postinstall_messages` VALUES ('2', '700', 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', '1', 'message', '', '', '', '', '3.2.0', '1');
INSERT INTO `jigsaw_postinstall_messages` VALUES ('3', '700', 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', '1', 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', '1');
INSERT INTO `jigsaw_postinstall_messages` VALUES ('4', '700', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', '1', 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', '1');

-- ----------------------------
-- Table structure for jigsaw_redirect_links
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_redirect_links`;
CREATE TABLE `jigsaw_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_redirect_links
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_schemas
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_schemas`;
CREATE TABLE `jigsaw_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_schemas
-- ----------------------------
INSERT INTO `jigsaw_schemas` VALUES ('700', '3.6.3-2016-08-16');

-- ----------------------------
-- Table structure for jigsaw_session
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_session`;
CREATE TABLE `jigsaw_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_session
-- ----------------------------
INSERT INTO `jigsaw_session` VALUES ('tlhjifv1qju0h0uqt4pouasgd7', '0', '1', '1481346952', 'joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ4MTM0NjgzODtzOjQ6Imxhc3QiO2k6MTQ4MTM0NjgzODtzOjM6Im5vdyI7aToxNDgxMzQ2OTUxO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjoxO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', '0', '');
INSERT INTO `jigsaw_session` VALUES ('tsbuvlqfvmukmhrhl5ddto0vn5', '1', '0', '1481346951', 'joomla|s:1556:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo1OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxMDc7czo1OiJ0b2tlbiI7czozMjoiazlVWWIyU2lnNEhOT0hvWnM4dWlBM3ZrSHFMOTFjZFkiO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ4MTM0MzQ5ODtzOjQ6Imxhc3QiO2k6MTQ4MTM0Njk0OTtzOjM6Im5vdyI7aToxNDgxMzQ2OTUwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjI6e3M6MjI6ImNvbV9idWR3ZWlzZXJfdGhlcmVtaXgiO086ODoic3RkQ2xhc3MiOjM6e3M6NzoicmVzdWx0cyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo4OiJvcmRlcmNvbCI7czo0OiJhLmlkIjt9czoxMToiY2VsZWJyaXRpZXMiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoib3JkZXJjb2wiO3M6NjoiYS5uYW1lIjt9czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjk6ImNlbGVicml0eSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO319fXM6MTA6ImNvbV9jb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Imdsb2JhbCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjtOO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjoxO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiMTI2Ijt9czo5OiJjb21fbWVkaWEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InJldHVybl91cmwiO3M6MTI4OiJpbmRleC5waHA/b3B0aW9uPWNvbV9tZWRpYSZ2aWV3PWltYWdlcyZ0bXBsPWNvbXBvbmVudCZmaWVsZGlkPWpmb3JtX3ZpZGVvJmVfbmFtZT0mYXNzZXQ9Y29tX2J1ZHdlaXNlcl90aGVyZW1peCZhdXRob3I9Y3JlYXRlZF9ieSI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjtOO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', '126', 'sysadmin');

-- ----------------------------
-- Table structure for jigsaw_tags
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_tags`;
CREATE TABLE `jigsaw_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_tags
-- ----------------------------
INSERT INTO `jigsaw_tags` VALUES ('1', '0', '0', '1', '0', '', 'ROOT', 'root', '', '', '1', '0', '0000-00-00 00:00:00', '1', '', '', '', '', '126', '2011-01-01 00:00:01', '', '0', '0000-00-00 00:00:00', '', '', '0', '*', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for jigsaw_template_styles
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_template_styles`;
CREATE TABLE `jigsaw_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_template_styles
-- ----------------------------
INSERT INTO `jigsaw_template_styles` VALUES ('4', 'beez3', '0', '0', 'Beez3 - Default', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}');
INSERT INTO `jigsaw_template_styles` VALUES ('5', 'hathor', '1', '0', 'Hathor - Default', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}');
INSERT INTO `jigsaw_template_styles` VALUES ('7', 'protostar', '0', '0', 'protostar - Default', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}');
INSERT INTO `jigsaw_template_styles` VALUES ('8', 'isis', '1', '1', 'isis - Default', '{\"templateColor\":\"\",\"logoFile\":\"\"}');
INSERT INTO `jigsaw_template_styles` VALUES ('9', 'budweisertheremix', '0', '1', 'Budweiser The Remix - Default', '{}');

-- ----------------------------
-- Table structure for jigsaw_ucm_base
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_ucm_base`;
CREATE TABLE `jigsaw_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_ucm_base
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_ucm_content
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_ucm_content`;
CREATE TABLE `jigsaw_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- ----------------------------
-- Records of jigsaw_ucm_content
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_ucm_history
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_ucm_history`;
CREATE TABLE `jigsaw_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_ucm_history
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_updates
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_updates`;
CREATE TABLE `jigsaw_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- ----------------------------
-- Records of jigsaw_updates
-- ----------------------------
INSERT INTO `jigsaw_updates` VALUES ('1', '3', '0', 'Armenian', '', 'pkg_hy-AM', 'package', '', '0', '3.4.4.1', '', 'https://update.joomla.org/language/details3/hy-AM_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('2', '3', '0', 'Malay', '', 'pkg_ms-MY', 'package', '', '0', '3.4.1.2', '', 'https://update.joomla.org/language/details3/ms-MY_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('3', '3', '0', 'Romanian', '', 'pkg_ro-RO', 'package', '', '0', '3.6.0.1', '', 'https://update.joomla.org/language/details3/ro-RO_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('4', '3', '0', 'Flemish', '', 'pkg_nl-BE', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('5', '3', '0', 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/zh-TW_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('6', '3', '0', 'French', '', 'pkg_fr-FR', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('7', '3', '0', 'Galician', '', 'pkg_gl-ES', 'package', '', '0', '3.3.1.2', '', 'https://update.joomla.org/language/details3/gl-ES_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('8', '3', '0', 'Georgian', '', 'pkg_ka-GE', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/ka-GE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('9', '3', '0', 'Greek', '', 'pkg_el-GR', 'package', '', '0', '3.6.3.2', '', 'https://update.joomla.org/language/details3/el-GR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('10', '3', '0', 'Japanese', '', 'pkg_ja-JP', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('11', '3', '0', 'Hebrew', '', 'pkg_he-IL', 'package', '', '0', '3.1.1.1', '', 'https://update.joomla.org/language/details3/he-IL_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('12', '3', '0', 'Hungarian', '', 'pkg_hu-HU', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/hu-HU_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('13', '3', '0', 'Afrikaans', '', 'pkg_af-ZA', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/af-ZA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('14', '3', '0', 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', '0', '3.6.4.2', '', 'https://update.joomla.org/language/details3/ar-AA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('15', '3', '0', 'Belarusian', '', 'pkg_be-BY', 'package', '', '0', '3.2.1.1', '', 'https://update.joomla.org/language/details3/be-BY_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('16', '3', '0', 'Bulgarian', '', 'pkg_bg-BG', 'package', '', '0', '3.4.4.2', '', 'https://update.joomla.org/language/details3/bg-BG_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('17', '3', '0', 'Catalan', '', 'pkg_ca-ES', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/ca-ES_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('18', '3', '0', 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', '0', '3.4.1.1', '', 'https://update.joomla.org/language/details3/zh-CN_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('19', '3', '0', 'Croatian', '', 'pkg_hr-HR', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/hr-HR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('20', '3', '0', 'Czech', '', 'pkg_cs-CZ', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('21', '3', '0', 'Danish', '', 'pkg_da-DK', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/da-DK_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('22', '3', '0', 'Dutch', '', 'pkg_nl-NL', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('23', '3', '0', 'Estonian', '', 'pkg_et-EE', 'package', '', '0', '3.6.0.1', '', 'https://update.joomla.org/language/details3/et-EE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('24', '3', '0', 'Italian', '', 'pkg_it-IT', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('25', '3', '0', 'Khmer', '', 'pkg_km-KH', 'package', '', '0', '3.4.5.1', '', 'https://update.joomla.org/language/details3/km-KH_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('26', '3', '0', 'Korean', '', 'pkg_ko-KR', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/ko-KR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('27', '3', '0', 'Latvian', '', 'pkg_lv-LV', 'package', '', '0', '3.6.2.2', '', 'https://update.joomla.org/language/details3/lv-LV_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('28', '3', '0', 'Macedonian', '', 'pkg_mk-MK', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/mk-MK_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('29', '3', '0', 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', '0', '3.5.1.1', '', 'https://update.joomla.org/language/details3/nb-NO_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('30', '3', '0', 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', '0', '3.4.2.1', '', 'https://update.joomla.org/language/details3/nn-NO_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('31', '3', '0', 'Persian', '', 'pkg_fa-IR', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('32', '3', '0', 'Polish', '', 'pkg_pl-PL', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/pl-PL_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('33', '3', '0', 'Portuguese', '', 'pkg_pt-PT', 'package', '', '0', '3.6.4.3', '', 'https://update.joomla.org/language/details3/pt-PT_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('34', '3', '0', 'Russian', '', 'pkg_ru-RU', 'package', '', '0', '3.6.2.2', '', 'https://update.joomla.org/language/details3/ru-RU_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('35', '3', '0', 'English AU', '', 'pkg_en-AU', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('36', '3', '0', 'Slovak', '', 'pkg_sk-SK', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('37', '3', '0', 'English US', '', 'pkg_en-US', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('38', '3', '0', 'Swedish', '', 'pkg_sv-SE', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('39', '3', '0', 'Syriac', '', 'pkg_sy-IQ', 'package', '', '0', '3.4.5.1', '', 'https://update.joomla.org/language/details3/sy-IQ_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('40', '3', '0', 'Tamil', '', 'pkg_ta-IN', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('41', '3', '0', 'Thai', '', 'pkg_th-TH', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('42', '3', '0', 'Turkish', '', 'pkg_tr-TR', 'package', '', '0', '3.6.2.1', '', 'https://update.joomla.org/language/details3/tr-TR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('43', '3', '0', 'Ukrainian', '', 'pkg_uk-UA', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/uk-UA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('44', '3', '0', 'Uyghur', '', 'pkg_ug-CN', 'package', '', '0', '3.3.0.1', '', 'https://update.joomla.org/language/details3/ug-CN_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('45', '3', '0', 'Albanian', '', 'pkg_sq-AL', 'package', '', '0', '3.1.1.1', '', 'https://update.joomla.org/language/details3/sq-AL_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('46', '3', '0', 'Basque', '', 'pkg_eu-ES', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/eu-ES_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('47', '3', '0', 'Hindi', '', 'pkg_hi-IN', 'package', '', '0', '3.3.6.2', '', 'https://update.joomla.org/language/details3/hi-IN_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('48', '3', '0', 'German DE', '', 'pkg_de-DE', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('49', '3', '0', 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/pt-BR_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('50', '3', '0', 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('51', '3', '0', 'Spanish', '', 'pkg_es-ES', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/es-ES_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('52', '3', '0', 'Bosnian', '', 'pkg_bs-BA', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('53', '3', '0', 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', '0', '3.6.3.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('54', '3', '0', 'Vietnamese', '', 'pkg_vi-VN', 'package', '', '0', '3.2.1.1', '', 'https://update.joomla.org/language/details3/vi-VN_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('55', '3', '0', 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', '0', '3.6.2.1', '', 'https://update.joomla.org/language/details3/id-ID_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('56', '3', '0', 'Finnish', '', 'pkg_fi-FI', 'package', '', '0', '3.6.2.1', '', 'https://update.joomla.org/language/details3/fi-FI_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('57', '3', '0', 'Swahili', '', 'pkg_sw-KE', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('58', '3', '0', 'Montenegrin', '', 'pkg_srp-ME', 'package', '', '0', '3.3.1.1', '', 'https://update.joomla.org/language/details3/srp-ME_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('59', '3', '0', 'English CA', '', 'pkg_en-CA', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('60', '3', '0', 'French CA', '', 'pkg_fr-CA', 'package', '', '0', '3.5.1.2', '', 'https://update.joomla.org/language/details3/fr-CA_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('61', '3', '0', 'Welsh', '', 'pkg_cy-GB', 'package', '', '0', '3.3.0.2', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('62', '3', '0', 'Sinhala', '', 'pkg_si-LK', 'package', '', '0', '3.3.1.1', '', 'https://update.joomla.org/language/details3/si-LK_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('63', '3', '0', 'Dari Persian', '', 'pkg_prs-AF', 'package', '', '0', '3.4.4.1', '', 'https://update.joomla.org/language/details3/prs-AF_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('64', '3', '0', 'Turkmen', '', 'pkg_tk-TM', 'package', '', '0', '3.5.0.2', '', 'https://update.joomla.org/language/details3/tk-TM_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('65', '3', '0', 'Irish', '', 'pkg_ga-IE', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/ga-IE_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('66', '3', '0', 'Dzongkha', '', 'pkg_dz-BT', 'package', '', '0', '3.6.2.1', '', 'https://update.joomla.org/language/details3/dz-BT_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('67', '3', '0', 'Slovenian', '', 'pkg_sl-SI', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('68', '3', '0', 'Spanish CO', '', 'pkg_es-CO', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/es-CO_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('69', '3', '0', 'German CH', '', 'pkg_de-CH', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-CH_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('70', '3', '0', 'German AT', '', 'pkg_de-AT', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-AT_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('71', '3', '0', 'German LI', '', 'pkg_de-LI', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-LI_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('72', '3', '0', 'German LU', '', 'pkg_de-LU', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/de-LU_details.xml', '', '');
INSERT INTO `jigsaw_updates` VALUES ('73', '3', '0', 'English NZ', '', 'pkg_en-NZ', 'package', '', '0', '3.6.4.1', '', 'https://update.joomla.org/language/details3/en-NZ_details.xml', '', '');

-- ----------------------------
-- Table structure for jigsaw_update_sites
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_update_sites`;
CREATE TABLE `jigsaw_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

-- ----------------------------
-- Records of jigsaw_update_sites
-- ----------------------------
INSERT INTO `jigsaw_update_sites` VALUES ('1', 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', '1', '1481338073', '');
INSERT INTO `jigsaw_update_sites` VALUES ('2', 'Joomla! Extension Directory', 'collection', 'https://update.joomla.org/jed/list.xml', '1', '1481338074', '');
INSERT INTO `jigsaw_update_sites` VALUES ('3', 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', '1', '1481338079', '');
INSERT INTO `jigsaw_update_sites` VALUES ('4', 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', '1', '1481338079', '');

-- ----------------------------
-- Table structure for jigsaw_update_sites_extensions
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_update_sites_extensions`;
CREATE TABLE `jigsaw_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

-- ----------------------------
-- Records of jigsaw_update_sites_extensions
-- ----------------------------
INSERT INTO `jigsaw_update_sites_extensions` VALUES ('1', '700');
INSERT INTO `jigsaw_update_sites_extensions` VALUES ('2', '700');
INSERT INTO `jigsaw_update_sites_extensions` VALUES ('3', '802');
INSERT INTO `jigsaw_update_sites_extensions` VALUES ('4', '28');

-- ----------------------------
-- Table structure for jigsaw_usergroups
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_usergroups`;
CREATE TABLE `jigsaw_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_usergroups
-- ----------------------------
INSERT INTO `jigsaw_usergroups` VALUES ('1', '0', '1', '18', 'Public');
INSERT INTO `jigsaw_usergroups` VALUES ('2', '1', '8', '15', 'Registered');
INSERT INTO `jigsaw_usergroups` VALUES ('3', '2', '9', '14', 'Author');
INSERT INTO `jigsaw_usergroups` VALUES ('4', '3', '10', '13', 'Editor');
INSERT INTO `jigsaw_usergroups` VALUES ('5', '4', '11', '12', 'Publisher');
INSERT INTO `jigsaw_usergroups` VALUES ('6', '1', '4', '7', 'Manager');
INSERT INTO `jigsaw_usergroups` VALUES ('7', '6', '5', '6', 'Administrator');
INSERT INTO `jigsaw_usergroups` VALUES ('8', '1', '16', '17', 'Super Users');
INSERT INTO `jigsaw_usergroups` VALUES ('9', '1', '2', '3', 'Guest');

-- ----------------------------
-- Table structure for jigsaw_users
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_users`;
CREATE TABLE `jigsaw_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_users
-- ----------------------------
INSERT INTO `jigsaw_users` VALUES ('126', 'Super User', 'sysadmin', 'xuananh1059@gmail.com', '$2y$10$mu2rGI5nCA31W23uBuOwcez76otU3FNKce8tK1SVsnAWWsUtZOjpq', '0', '1', '2016-12-07 01:28:51', '2016-12-10 04:18:19', '0', '', '0000-00-00 00:00:00', '0', '', '', '0');

-- ----------------------------
-- Table structure for jigsaw_user_keys
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_user_keys`;
CREATE TABLE `jigsaw_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_user_keys
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_user_notes
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_user_notes`;
CREATE TABLE `jigsaw_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_user_notes
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_user_profiles
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_user_profiles`;
CREATE TABLE `jigsaw_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- ----------------------------
-- Records of jigsaw_user_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for jigsaw_user_usergroup_map
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_user_usergroup_map`;
CREATE TABLE `jigsaw_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_user_usergroup_map
-- ----------------------------
INSERT INTO `jigsaw_user_usergroup_map` VALUES ('126', '8');

-- ----------------------------
-- Table structure for jigsaw_utf8_conversion
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_utf8_conversion`;
CREATE TABLE `jigsaw_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_utf8_conversion
-- ----------------------------
INSERT INTO `jigsaw_utf8_conversion` VALUES ('2');

-- ----------------------------
-- Table structure for jigsaw_viewlevels
-- ----------------------------
DROP TABLE IF EXISTS `jigsaw_viewlevels`;
CREATE TABLE `jigsaw_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jigsaw_viewlevels
-- ----------------------------
INSERT INTO `jigsaw_viewlevels` VALUES ('1', 'Public', '0', '[1]');
INSERT INTO `jigsaw_viewlevels` VALUES ('2', 'Registered', '2', '[6,2,8]');
INSERT INTO `jigsaw_viewlevels` VALUES ('3', 'Special', '3', '[6,3,8]');
INSERT INTO `jigsaw_viewlevels` VALUES ('5', 'Guest', '1', '[9]');
INSERT INTO `jigsaw_viewlevels` VALUES ('6', 'Super Users', '4', '[8]');

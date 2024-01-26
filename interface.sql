/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : interface

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2023-03-04 17:32:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add interface', '7', 'add_interface');
INSERT INTO `auth_permission` VALUES ('26', 'Can change interface', '7', 'change_interface');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete interface', '7', 'delete_interface');
INSERT INTO `auth_permission` VALUES ('28', 'Can view interface', '7', 'view_interface');
INSERT INTO `auth_permission` VALUES ('29', 'Can add auto', '8', 'add_auto');
INSERT INTO `auth_permission` VALUES ('30', 'Can change auto', '8', 'change_auto');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete auto', '8', 'delete_auto');
INSERT INTO `auth_permission` VALUES ('32', 'Can view auto', '8', 'view_auto');
INSERT INTO `auth_permission` VALUES ('33', 'Can add django job', '9', 'add_djangojob');
INSERT INTO `auth_permission` VALUES ('34', 'Can change django job', '9', 'change_djangojob');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete django job', '9', 'delete_djangojob');
INSERT INTO `auth_permission` VALUES ('36', 'Can view django job', '9', 'view_djangojob');
INSERT INTO `auth_permission` VALUES ('37', 'Can add django job execution', '10', 'add_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('38', 'Can change django job execution', '10', 'change_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete django job execution', '10', 'delete_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('40', 'Can view django job execution', '10', 'view_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('41', 'Can add auth group', '11', 'add_authgroup');
INSERT INTO `auth_permission` VALUES ('42', 'Can change auth group', '11', 'change_authgroup');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete auth group', '11', 'delete_authgroup');
INSERT INTO `auth_permission` VALUES ('44', 'Can view auth group', '11', 'view_authgroup');
INSERT INTO `auth_permission` VALUES ('45', 'Can add auth group permissions', '12', 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('46', 'Can change auth group permissions', '12', 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete auth group permissions', '12', 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('48', 'Can view auth group permissions', '12', 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES ('49', 'Can add auth permission', '13', 'add_authpermission');
INSERT INTO `auth_permission` VALUES ('50', 'Can change auth permission', '13', 'change_authpermission');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete auth permission', '13', 'delete_authpermission');
INSERT INTO `auth_permission` VALUES ('52', 'Can view auth permission', '13', 'view_authpermission');
INSERT INTO `auth_permission` VALUES ('53', 'Can add auth user', '14', 'add_authuser');
INSERT INTO `auth_permission` VALUES ('54', 'Can change auth user', '14', 'change_authuser');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete auth user', '14', 'delete_authuser');
INSERT INTO `auth_permission` VALUES ('56', 'Can view auth user', '14', 'view_authuser');
INSERT INTO `auth_permission` VALUES ('57', 'Can add auth user groups', '15', 'add_authusergroups');
INSERT INTO `auth_permission` VALUES ('58', 'Can change auth user groups', '15', 'change_authusergroups');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete auth user groups', '15', 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES ('60', 'Can view auth user groups', '15', 'view_authusergroups');
INSERT INTO `auth_permission` VALUES ('61', 'Can add auth user user permissions', '16', 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('62', 'Can change auth user user permissions', '16', 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete auth user user permissions', '16', 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('64', 'Can view auth user user permissions', '16', 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES ('65', 'Can add autotimer', '17', 'add_autotimer');
INSERT INTO `auth_permission` VALUES ('66', 'Can change autotimer', '17', 'change_autotimer');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete autotimer', '17', 'delete_autotimer');
INSERT INTO `auth_permission` VALUES ('68', 'Can view autotimer', '17', 'view_autotimer');
INSERT INTO `auth_permission` VALUES ('69', 'Can add django admin log', '18', 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('70', 'Can change django admin log', '18', 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete django admin log', '18', 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('72', 'Can view django admin log', '18', 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES ('73', 'Can add django apscheduler djangojob', '19', 'add_djangoapschedulerdjangojob');
INSERT INTO `auth_permission` VALUES ('74', 'Can change django apscheduler djangojob', '19', 'change_djangoapschedulerdjangojob');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete django apscheduler djangojob', '19', 'delete_djangoapschedulerdjangojob');
INSERT INTO `auth_permission` VALUES ('76', 'Can view django apscheduler djangojob', '19', 'view_djangoapschedulerdjangojob');
INSERT INTO `auth_permission` VALUES ('77', 'Can add django apscheduler djangojobexecution', '20', 'add_djangoapschedulerdjangojobexecution');
INSERT INTO `auth_permission` VALUES ('78', 'Can change django apscheduler djangojobexecution', '20', 'change_djangoapschedulerdjangojobexecution');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete django apscheduler djangojobexecution', '20', 'delete_djangoapschedulerdjangojobexecution');
INSERT INTO `auth_permission` VALUES ('80', 'Can view django apscheduler djangojobexecution', '20', 'view_djangoapschedulerdjangojobexecution');
INSERT INTO `auth_permission` VALUES ('81', 'Can add django content type', '21', 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('82', 'Can change django content type', '21', 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete django content type', '21', 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('84', 'Can view django content type', '21', 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES ('85', 'Can add django migrations', '22', 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES ('86', 'Can change django migrations', '22', 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete django migrations', '22', 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES ('88', 'Can view django migrations', '22', 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES ('89', 'Can add django session', '23', 'add_djangosession');
INSERT INTO `auth_permission` VALUES ('90', 'Can change django session', '23', 'change_djangosession');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete django session', '23', 'delete_djangosession');
INSERT INTO `auth_permission` VALUES ('92', 'Can view django session', '23', 'view_djangosession');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$390000$cq4umzDwntpRuL0I5NQV9Y$SKvftiTROa87NoZC8cv3wL8lolw89twCNDakUGwGRro=', null, '1', 'admin', '', '', '123@qq.com', '1', '1', '2022-12-05 16:33:49.385215');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auto
-- ----------------------------
DROP TABLE IF EXISTS `auto`;
CREATE TABLE `auto` (
  `activity_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auto
-- ----------------------------
INSERT INTO `auto` VALUES ('大转盘', '125', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '1');
INSERT INTO `auto` VALUES ('砸金蛋', '84', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '2');
INSERT INTO `auto` VALUES ('摇一摇', '98', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '3');
INSERT INTO `auto` VALUES ('刮刮卡', '86', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '4');
INSERT INTO `auto` VALUES ('摇摇乐', '71', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '5');
INSERT INTO `auto` VALUES ('扭蛋机', '78', 'apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir report --out-file bigwheel', 'bigwheel', '6');

-- ----------------------------
-- Table structure for autotimer
-- ----------------------------
DROP TABLE IF EXISTS `autotimer`;
CREATE TABLE `autotimer` (
  `adjure` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of autotimer
-- ----------------------------
INSERT INTO `autotimer` VALUES ('* * 13 * * * *', '1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_apscheduler_djangojob
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_apscheduler_djangojob
-- ----------------------------

-- ----------------------------
-- Table structure for django_apscheduler_djangojobexecution
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_job_executions` (`job_id`,`run_time`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_apscheduler_djangojobexecution
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('11', 'api', 'authgroup');
INSERT INTO `django_content_type` VALUES ('12', 'api', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES ('13', 'api', 'authpermission');
INSERT INTO `django_content_type` VALUES ('14', 'api', 'authuser');
INSERT INTO `django_content_type` VALUES ('15', 'api', 'authusergroups');
INSERT INTO `django_content_type` VALUES ('16', 'api', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES ('8', 'api', 'auto');
INSERT INTO `django_content_type` VALUES ('17', 'api', 'autotimer');
INSERT INTO `django_content_type` VALUES ('18', 'api', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES ('19', 'api', 'djangoapschedulerdjangojob');
INSERT INTO `django_content_type` VALUES ('20', 'api', 'djangoapschedulerdjangojobexecution');
INSERT INTO `django_content_type` VALUES ('21', 'api', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES ('22', 'api', 'djangomigrations');
INSERT INTO `django_content_type` VALUES ('23', 'api', 'djangosession');
INSERT INTO `django_content_type` VALUES ('7', 'api', 'interface');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'django_apscheduler', 'djangojob');
INSERT INTO `django_content_type` VALUES ('10', 'django_apscheduler', 'djangojobexecution');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('20', 'contenttypes', '0001_initial', '2022-12-05 16:32:42.136286');
INSERT INTO `django_migrations` VALUES ('21', 'auth', '0001_initial', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('22', 'admin', '0001_initial', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('23', 'admin', '0002_logentry_remove_auto_add', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('24', 'admin', '0003_logentry_add_action_flag_choices', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('25', 'api', '0001_initial', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('26', 'api', '0002_interface_delete_api', '2022-12-05 16:32:42.152324');
INSERT INTO `django_migrations` VALUES ('27', 'api', '0003_authgroup_authgrouppermissions_authpermission_and_more', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('28', 'api', '0004_delete_authgroup_delete_authgrouppermissions_and_more', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('29', 'api', '0005_book', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('30', 'api', '0006_delete_book', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('31', 'api', '0007_auto', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('32', 'api', '0008_authgroup_authgrouppermissions_authpermission_and_more', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('33', 'contenttypes', '0002_remove_content_type_name', '2022-12-05 16:32:42.168161');
INSERT INTO `django_migrations` VALUES ('34', 'auth', '0002_alter_permission_name_max_length', '2022-12-05 16:32:42.188063');
INSERT INTO `django_migrations` VALUES ('35', 'auth', '0003_alter_user_email_max_length', '2022-12-05 16:32:42.191579');
INSERT INTO `django_migrations` VALUES ('36', 'auth', '0004_alter_user_username_opts', '2022-12-05 16:32:42.191579');
INSERT INTO `django_migrations` VALUES ('37', 'auth', '0005_alter_user_last_login_null', '2022-12-05 16:32:42.191579');
INSERT INTO `django_migrations` VALUES ('38', 'auth', '0006_require_contenttypes_0002', '2022-12-05 16:32:42.198870');
INSERT INTO `django_migrations` VALUES ('39', 'auth', '0007_alter_validators_add_error_messages', '2022-12-05 16:32:42.201184');
INSERT INTO `django_migrations` VALUES ('40', 'auth', '0008_alter_user_username_max_length', '2022-12-05 16:32:42.201184');
INSERT INTO `django_migrations` VALUES ('41', 'auth', '0009_alter_user_last_name_max_length', '2022-12-05 16:32:42.206520');
INSERT INTO `django_migrations` VALUES ('42', 'auth', '0010_alter_group_name_max_length', '2022-12-05 16:32:42.209331');
INSERT INTO `django_migrations` VALUES ('43', 'auth', '0011_update_proxy_permissions', '2022-12-05 16:32:42.209937');
INSERT INTO `django_migrations` VALUES ('44', 'auth', '0012_alter_user_first_name_max_length', '2022-12-05 16:32:42.209937');
INSERT INTO `django_migrations` VALUES ('45', 'sessions', '0001_initial', '2022-12-05 16:32:42.219297');
INSERT INTO `django_migrations` VALUES ('46', 'api', '0009_delete_authgroup_delete_authgrouppermissions_and_more', '2022-12-14 11:11:54.815140');
INSERT INTO `django_migrations` VALUES ('47', 'django_apscheduler', '0001_initial', '2022-12-14 12:37:04.455149');
INSERT INTO `django_migrations` VALUES ('48', 'django_apscheduler', '0002_auto_20180412_0758', '2022-12-14 12:37:04.488707');
INSERT INTO `django_migrations` VALUES ('49', 'django_apscheduler', '0003_auto_20200716_1632', '2022-12-14 12:37:04.505118');
INSERT INTO `django_migrations` VALUES ('50', 'django_apscheduler', '0004_auto_20200717_1043', '2022-12-14 12:37:04.673967');
INSERT INTO `django_migrations` VALUES ('51', 'django_apscheduler', '0005_migrate_name_to_id', '2022-12-14 12:37:04.688799');
INSERT INTO `django_migrations` VALUES ('52', 'django_apscheduler', '0006_remove_djangojob_name', '2022-12-14 12:37:04.716816');
INSERT INTO `django_migrations` VALUES ('53', 'django_apscheduler', '0007_auto_20200717_1404', '2022-12-14 12:37:04.758980');
INSERT INTO `django_migrations` VALUES ('54', 'django_apscheduler', '0008_remove_djangojobexecution_started', '2022-12-14 12:37:04.790280');
INSERT INTO `django_migrations` VALUES ('55', 'django_apscheduler', '0009_djangojobexecution_unique_job_executions', '2022-12-14 12:37:04.807854');
INSERT INTO `django_migrations` VALUES ('56', 'api', '0010_authgroup_authgrouppermissions_authpermission_and_more', '2022-12-15 08:47:43.297087');
INSERT INTO `django_migrations` VALUES ('57', 'api', '0011_delete_authgroup_delete_authgrouppermissions_and_more', '2022-12-28 04:16:13.831943');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for interface
-- ----------------------------
DROP TABLE IF EXISTS `interface`;
CREATE TABLE `interface` (
  `header` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` int(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interface
-- ----------------------------
INSERT INTO `interface` VALUES ('{\'Content-Type\':\'application/x-www-form-urlencoded; charset=UTF-8\'}', '测试', 'https://account.saas.weimobqa.com/website/saas/account/api2/user/getCodeRs', '2', '{\"zone\": \"0086\", \"phoneNumber\": 13816173589, \"pageName\": \"login\"}', '{\"errcode\":0,\"errmsg\":\"\",\"data\":{\"rs\":\"1\"}}', 'getCode', '1', '2');

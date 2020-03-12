/*
Navicat MySQL Data Transfer

Source Server         : six
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : dr_info

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-03-12 14:55:26
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('25', 'Can add CCFInfo', '7', 'add_ccfinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change CCFInfo', '7', 'change_ccfinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete CCFInfo', '7', 'delete_ccfinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can view CCFInfo', '7', 'view_ccfinfo');

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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

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
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'dr_server', 'ccfinfo');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-01-05 12:14:42.704039');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-01-05 12:14:42.885529');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-01-05 12:14:43.389205');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2020-01-05 12:14:43.498887');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2020-01-05 12:14:43.506866');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2020-01-05 12:14:43.597653');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2020-01-05 12:14:43.657490');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2020-01-05 12:14:43.719298');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2020-01-05 12:14:43.728274');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2020-01-05 12:14:43.776145');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2020-01-05 12:14:43.780135');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2020-01-05 12:14:43.787117');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2020-01-05 12:14:43.848951');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2020-01-05 12:14:43.909788');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2020-01-05 12:14:43.971624');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2020-01-05 12:14:43.979602');
INSERT INTO `django_migrations` VALUES ('17', 'dr_server', '0001_initial', '2020-01-05 12:14:44.011539');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2020-01-05 12:14:44.041460');

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
-- Table structure for dr_server_ccfinfo
-- ----------------------------
DROP TABLE IF EXISTS `dr_server_ccfinfo`;
CREATE TABLE `dr_server_ccfinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(64) NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `published` varchar(100) NOT NULL,
  `url_link` varchar(200) NOT NULL,
  `classes` varchar(2) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dr_server_ccfinfo
-- ----------------------------
INSERT INTO `dr_server_ccfinfo` VALUES ('4', 'TOCS', 'ACM Transactions on Computer Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/tocs/', 'A', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('5', 'TOS', 'ACM Transactions on Storage', 'ACM', 'http://dblp.uni-trier.de/db/journals/tos/', 'A', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('6', 'TCAD', 'IEEE Transactions on Computer-Aided Design of Integrated Circuits And System', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tcad/', 'A', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('7', 'TC', 'IEEE Transactions on Computers', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tc/index.html', 'A', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('8', 'TPDS', 'IEEE Transactions on Parallel and Distributed Systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tpds/', 'A', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('9', 'TACO', 'ACM Transactions on Architecture and Code Optimization', 'ACM', 'http://dblp.uni-trier.de/db/journals/taco/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('10', 'TAAS', 'ACM Transactions on Autonomous and Adaptive Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/taas/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('11', 'TODAES', 'ACM Transactions on Design Automation of Electronic Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/todaes/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('12', 'TECS', 'ACM Transactions on Embedded Computing Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/tecs/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('13', 'TRETS', 'ACM Transactions on Reconfigurable Technology and Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/trets/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('14', 'TVLSI', 'IEEE Transactions on Very Large Scale Integration (VLSI) Systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tvlsi/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('15', 'JPDC', 'Journal of Parallel and Distributed Computing', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jpdc/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('16', 'JSA', 'Journal of Systems Architecture: Embedded Software Design', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jsa/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('17', 'PARCO', 'Parallel Computing', 'Elsevier', 'http://dblp.uni-trier.de/db/conf/parco/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('18', 'nan', 'Performance Evaluation: An International Journal', 'Elsevier', 'http://www.journals.elsevier.com/performance-evaluation/', 'B', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('19', 'JETC', 'ACM Journal on Emerging Technologies in Computing Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/jetc/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('20', 'nan', 'Concurrency and Computation: Practice and Experience', 'Wiley', 'http://dblp.uni-trier.de/db/journals/concurrency/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('21', 'DC', 'Distributed Computing', 'Springer', 'http://dblp.uni-trier.de/db/journals/dc/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('22', 'FGCS', 'Future Generation Computer Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/fgcs/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('23', 'TCC', 'IEEE Transactions on Cloud Computing', 'IEEE', 'https://dblp.uni-trier.de/db/journals/tcc/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('24', 'Integration', 'Integration, the VLSI Journal', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/integration/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('25', 'JETTA', 'Journal of Electronic Testing-Theory and Applications', 'Springer', 'http://link.springer.com/journal/10836', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('26', 'JGC', 'Journal of Grid computing', 'Springer', 'https://dblp.uni-trier.de/db/journals/grid/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('27', 'MICPRO', 'Microprocessors and Microsystems: Embedded Hardware Design', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/mam/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('28', 'RTS', 'Real-Time Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/rts/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('29', 'TJSC', 'The Journal of Supercomputing', 'Springer', 'http://dblp.uni-trier.de/db/journals/tjs/', 'C', '计算机体系结构/并行与分布计算/存储系统', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('30', 'PPoPP', 'ACM SIGPLAN Symposium on Principles & Practice of Parallel Programming', 'ACM', 'http://dblp.uni-trier.de/db/conf/ppopp/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('31', 'FAST', 'Conference on File and Storage Technologies', 'USENIX', 'http://dblp.uni-trier.de/db/conf/fast/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('32', 'DAC', 'Design Automation Conference', 'ACM', 'https://dblp.uni-trier.de/db/conf/dac/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('33', 'HPCA', 'High Performance Computer Architecture', 'IEEE', 'http://dblp.uni-trier.de/db/conf/hpca/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('34', 'MICRO', 'IEEE/ACM International Symposium on Microarchitecture', 'IEEE/ACM', 'https://dblp.uni-trier.de/db/conf/micro/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('35', 'SC', 'International Conference for High Performance Computing, Networking, Storage, and Analysis', 'IEEE', 'http://dblp.uni-trier.de/db/conf/sc/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('36', 'ASPLOS', 'International Conference on Architectural Support for Programming Languages and Operating Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/asplos/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('37', 'ISCA', 'International Symposium on Computer Architecture', 'ACM /IEEE', 'http://dblp.uni-trier.de/db/conf/isca/', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('38', 'USENIX ATC', 'USENIX Annul Technical Conference', 'USENIX', 'http://dblp.uni-trier.de/db/conf/usenix/index.html', 'A', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('39', 'SoCC', 'ACM Symposium on Cloud Computing', 'ACM', 'http://dblp.uni-trier.de/db/conf/cloud/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('40', 'SPAA', 'ACM Symposium on Parallelism in Algorithms and Architectures', 'ACM', 'http://dblp.uni-trier.de/db/conf/spaa/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('41', 'PODC', 'ACM Symposium on Principles of Distributed Computing', 'ACM', 'http://dblp.uni-trier.de/db/conf/podc/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('42', 'FPGA', 'ACM/SIGDA International Symposium on Field-Programmable Gate Arrays', 'ACM', 'http://dblp.uni-trier.de/db/conf/fpga/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('43', 'CGO', 'Code Generation and Optimization', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/cgo/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('44', 'DATE', 'Design, Automation & Test in Europe', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/date/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('45', 'EuroSys', 'European Conference on Computer Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/eurosys/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('46', 'HOT CHIPS', 'Hot Chips: A Symposium on High Performance Chips', 'IEEE', 'http://www.hotchips.org/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('47', 'CLUSTER', 'IEEE International Conference on Cluster Computing', 'IEEE', 'https://dblp.uni-trier.de/db/conf/cluster/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('48', 'ICCD', 'International Conference on Computer Design', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iccd/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('49', 'ICCAD', 'International Conference on Computer-Aided Design', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/iccad/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('50', 'ICDCS', 'International Conference on Distributed Computing Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icdcs/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('51', 'CODES+ISSS', 'International Conference on Hardware/Software Co-design and System Synthesis', 'ACM/ IEEE', 'http://dblp.uni-trier.de/db/conf/codes/index.html', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('52', 'HiPEAC', 'International Conference on High Performance and Embedded Architectures and Compilers', 'ACM', 'http://dblp.uni-trier.de/db/conf/hipeac/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('53', 'PACT', 'International Conference on Parallel Architectures and Compilation Techniques', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/IEEEpact/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('54', 'ICPP', 'International Conference on Parallel Processing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icpp/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('55', 'ICS', 'International Conference on Supercomputing', 'ACM', 'http://dblp.uni-trier.de/db/conf/ics/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('56', 'VEE', 'International Conference on Virtual Execution Environments', 'ACM', 'http://dblp.uni-trier.de/db/conf/vee/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('57', 'IPDPS', 'International Parallel & Distributed Processing Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ipps/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('58', 'Performance', 'International Symposium on Computer Performance Modeling, Measurements and Evaluation', 'ACM', 'http://dblp.uni-trier.de/db/conf/performance/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('59', 'HPDC', 'International Symposium on High Performance Distributed Computing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/hpdc/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('60', 'ITC', 'International Test Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/itc/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('61', 'LISA', 'Large Installation System Administration Conference', 'USENIX', 'http://dblp.uni-trier.de/db/conf/lisa/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('62', 'MSST', 'Mass Storage Systems and Technologies', 'IEEE', 'http://dblp.uni-trier.de/db/conf/mss/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('63', 'RTAS', 'Real-Time and Embedded Technology and Applications Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/rtas/', 'B', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('64', 'CF', 'ACM International Conference on Computing Frontiers', 'ACM', 'http://dblp.uni-trier.de/db/conf/cf', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('65', 'SYSTOR', 'ACM International Systems and Storage Conference', 'ACM', 'http://dblp.uni-trier.de/db/conf/systor/index.html', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('66', 'NOCS', 'ACM/IEEE International Symposium on Networks-on-Chip', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/nocs', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('67', 'ASAP', 'Application-Specific Systems, Architectures, and Processors', 'IEEE', 'http://dblp.uni-trier.de/db/conf/asap', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('68', 'ASP-DAC', 'Asia and South Pacific Design Automation Conference', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/aspdac', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('69', 'Euro-Par', 'European Conference on Parallel and Distributed Computing', 'Springer', 'http://dblp.uni-trier.de/db/conf/europar/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('70', 'ETS', 'European Test Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ets/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('71', 'FPL', 'Field Programmable Logic and Applications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/fpl/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('72', 'FCCM', 'Field-Programmable Custom Computing Machines', 'IEEE', 'http://dblp.uni-trier.de/db/conf/fccm/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('73', 'GLSVLSI', 'Great Lakes Symposium on VLSI', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/glvlsi/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('74', 'ATS', 'IEEE Asian Test Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ats/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('75', 'HPCC', 'IEEE International Conference on High Performance Computing and Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/hpcc/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('76', 'HiPC', 'IEEE International Conference on High Performance Computing, Data and Analytics', 'IEEE/ ACM', 'http://dblp.uni-trier.de/db/conf/hipc/index.html', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('77', 'MASCOTS', 'IEEE International Symposium on Modeling, Analysis, and Simulation of Computer and Telecommunication Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/mascots/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('78', 'CCGRID', 'IEEE/ACM International Symposium on Cluster, Cloud and Grid Computing', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/ccgrid/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('79', 'NPC', 'IFIP International Conference on Network and Parallel Computing', 'Springer', 'http://dblp.uni-trier.de/db/conf/npc/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('80', 'ICA3PP', 'International Conference on Algorithms and Architectures for Parallel Processing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ica3pp/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('81', 'CASES', 'International Conference on Compilers, Architectures, and Synthesis for Embedded Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/cases/index.html', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('82', 'FPT', 'International Conference on Field-Programmable Technology', 'IEEE', 'http://dblp.uni-trier.de/db/conf/fpt/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('83', 'ICPADS', 'International Conference on Parallel and Distributed Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icpads/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('84', 'ISCAS', 'International Symposium on Circuits and Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iscas/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('85', 'ISLPED', 'International Symposium on Low Power Electronics and Design', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/islped/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('86', 'ISPD', 'International Symposium on Physical Design', 'ACM', 'http://dblp.uni-trier.de/db/conf/ispd/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('87', 'HotI', 'Symposium on High-Performance Interconnects', 'IEEE', 'http://dblp.uni-trier.de/db/conf/hoti/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('88', 'VTS', 'VLSI Test Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/vts/', 'C', '计算机体系结构/并行与分布计算/存储系统', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('89', 'JSAC', 'IEEE Journal of Selected Areas in Communications', 'IEEE', 'http://dblp.uni-trier.de/db/journals/jsac/', 'A', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('90', 'TMC', 'IEEE Transactions on Mobile Computing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tmc/', 'A', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('91', 'TON', 'IEEE/ACM Transactions on Networking', 'IEEE, ACM', 'http://dblp.uni-trier.de/db/journals/ton/', 'A', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('92', 'TOIT', 'ACM Transactions on Internet Technology', 'ACM', 'http://dblp.uni-trier.de/db/journals/toit/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('93', 'TOMCCAP', 'ACM Transactions on Multimedia Computing, Communications and Applications', 'ACM', 'http://dblp.uni-trier.de/db/journals/tomccap/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('94', 'TOSN', 'ACM Transactions on Sensor Networks', 'ACM', 'http://dblp.uni-trier.de/db/journals/tosn/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('95', 'CN', 'Computer Networks', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cn/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('96', 'TCOM', 'IEEE Transactions on Communications', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tcom/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('97', 'TWC', 'IEEE Transactions on Wireless Communications', 'IEEE', 'http://dblp.uni-trier.de/db/journals/twc/', 'B', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('98', 'nan', 'Ad Hoc Networks', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/adhoc/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('99', 'CC', 'Computer Communications', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/comcom/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('100', 'TNSM', 'IEEE Transactions on Network and Service Management', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tnsm/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('101', 'nan', 'IET Communications', 'IET', 'http://dblp.uni-trier.de/db/journals/iet-com/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('102', 'JNCA', 'Journal of Network and Computer Applications', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jnca/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('103', 'MONET', 'Mobile Networks & Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/monet/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('104', 'nan', 'Networks', 'Wiley', 'http://dblp.uni-trier.de/db/journals/networks/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('105', 'PPNA', 'Peer-to-Peer Networking and Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/ppna/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('106', 'WCMC', 'Wireless Communications & Mobile Computing', 'Wiley.', 'http://dblp.uni-trier.de/db/journals/wicomm/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('107', 'nan', 'Wireless Networks', 'Springer', 'http://dblp.uni-trier.de/db/journals/winet/', 'C', '计算机网络', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('108', 'SIGCOMM', 'ACM International Conference on Applications, Technologies, Architectures, and Protocols for Computer Communication', 'ACM', 'http://dblp.uni-trier.de/db/conf/sigcomm/index.html', 'A', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('109', 'MobiCom', 'ACM International Conference on Mobile Computing and Networking', 'ACM', 'http://dblp.uni-trier.de/db/conf/mobicom/', 'A', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('110', 'INFOCOM', 'IEEE International Conference on Computer Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/infocom/', 'A', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('111', 'NSDI', 'Symposium on Network System Design and Implementation', 'USENIX', 'http://dblp.uni-trier.de/db/conf/nsdi/', 'A', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('112', 'SenSys', 'ACM Conference on Embedded Networked Sensor Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/sensys/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('113', 'CoNEXT', 'ACM International Conference on Emerging Networking Experiments and Technologies', 'ACM', 'http://dblp.uni-trier.de/db/conf/conext/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('114', 'SECON', 'IEEE Communications Society Conference on Sensor and Ad Hoc Communications and Networks', 'IEEE', 'http://dblp.uni-trier.de/db/conf/secon/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('115', 'IPSN', 'International Conference on Information Processing in Sensor Networks', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/ipsn/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('116', 'MobiSys', 'International Conference on Mobile Systems, Applications, and Services', 'ACM', 'http://dblp.uni-trier.de/db/conf/mobisys/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('117', 'ICNP', 'International Conference on Network Protocols', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icnp/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('118', 'MobiHoc', 'International Symposium on Mobile Ad Hoc Networking and Computing', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/mobihoc/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('119', 'NOSSDAV', 'International Workshop on Network and Operating System Support for Digital Audio and Video', 'ACM', 'http://dblp.uni-trier.de/db/conf/nossdav/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('120', 'IWQoS', 'International Workshop on Quality of Service', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iwqos/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('121', 'IMC', 'Internet Measurement Conference', 'ACM/USENIX', 'http://dblp.uni-trier.de/db/conf/imc/', 'B', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('122', 'ANCS', 'Architectures for Networking and Communications Systems', 'ACM/IEE\nE', 'http://dblp.uni-trier.de/db/conf/ancs/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('123', 'APNOMS', 'Asia-Pacific Network Operations and Management Symposium', 'IFIP/IEEE', 'http://dblp.uni-trier.de/db/conf/apnoms/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('124', 'FORTE', 'Formal Techniques for Networked and Distributed Systems', 'Springer', 'http://dblp.uni-trier.de/db/conf/forte/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('125', 'LCN', 'IEEE Conference on Local Computer Networks', 'IEEE', 'http://dblp.uni-trier.de/db/conf/lcn/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('126', 'GLOBECO\nM', 'IEEE Global Communications Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/globecom/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('127', 'ICC', 'IEEE International Conference on Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icc/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('128', 'ICCCN', 'IEEE International Conference on Computer Communications and Networks', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icccn/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('129', 'MASS', 'IEEE International Conference on Mobile Ad-hoc and Sensor Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/mass/index.html', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('130', 'P2P', 'IEEE International Conference on Peer-to-Peer Computing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/p2p/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('131', 'IPCCC', 'IEEE International Performance Computing and Communications Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ipccc/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('132', 'WoWMoM', 'IEEE International Symposium on a World of Wireless, Mobile and Multimedia Networks', 'IEEE', 'http://dblp.uni-trier.de/db/conf/wowmom/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('133', 'ISCC', 'IEEE Symposium on Computers and Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iscc/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('134', 'WCNC', 'IEEE Wireless Communications & Networking Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/wcnc/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('135', 'Networking', 'IFIP International Conferences on Networking', 'IFIP', 'http://dblp.uni-trier.de/db/conf/networking/index.', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('136', 'IM', 'IFIP/IEEE International Symposium on Integrated Network Management', 'IFIP/IEEE', 'http://dblp.uni-trier.de/db/conf/im/index.html', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('137', 'MSN', 'International Conference on Mobile Ad-hoc and Sensor Networks', 'IEEE', 'https://dblp.uni-trier.de/db/conf/msn/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('138', 'MSWiM', 'International Conference on Modeling, Analysis and Simulation of Wireless and Mobile Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/mswim/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('139', 'WASA', 'International Conference on Wireless Algorithms, Systems, and Applications', 'Springer', 'http://dblp.uni-trier.de/db/conf/wasa/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('140', 'HotNets', 'The Workshop on Hot Topics in Networks', 'ACM', 'http://dblp.uni-trier.de/db/conf/hotnets/', 'C', '计算机网络', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('141', 'TDSC', 'IEEE Transactions on Dependable and Secure Computing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tdsc/', 'A', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('142', 'TIFS', 'IEEE Transactions on Information Forensics and Security', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tifs/', 'A', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('143', 'nan', 'Journal of Cryptology', 'Springer', 'http://dblp.uni-trier.de/db/journals/joc/', 'A', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('144', 'TISSEC', 'ACM Transactions on Information and System Security', 'ACM', 'http://dblp.uni-trier.de/db/journals/tissec/', 'B', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('145', 'nan', 'Computers & Security', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/compsec/', 'B', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('146', 'nan', 'Designs, Codes and Cryptography', 'Springer', 'http://dblp.uni-trier.de/db/journals/dcc/', 'B', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('147', 'JCS', 'Journal of Computer Security', 'IOS Press', 'http://dblp.uni-trier.de/db/journals/jcs/', 'B', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('148', 'CLSR', 'Computer Law and Security Review', 'Elsevier', 'http://www.journals.elsevier.com/computer-law-and-se\ncurity-review/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('149', 'nan', 'EURASIP Journal on Information Security', 'Springer', 'http://dblp.uni-trier.de/db/journals/ejisec/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('150', 'nan', 'IET Information Security', 'IET', 'http://dblp.uni-trier.de/db/journals/iet-ifs/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('151', 'IMCS', 'Information Management & Computer Security', 'Emerald', 'http://dblp.uni-trier.de/db/journals/imcs/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('152', 'IJICS', 'International Journal of Information and Computer Security', 'Inderscience', 'http://dblp.uni-trier.de/db/journals/ijics/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('153', 'IJISP', 'International Journal of Information Security and Privacy', 'Idea Group Inc', 'http://dblp.uni-trier.de/db/journals/ijisp/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('154', 'JISA', 'Journal of Information Security and Application', 'Elsevier', 'https://dblp.uni-trier.de/db/journals/istr/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('155', 'SCN', 'Security and Communication Networks', 'Wiley', 'http://dblp.uni-trier.de/db/journals/scn/', 'C', '网络与信息安全', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('156', 'CCS', 'ACM Conference on Computer and Communications Security', 'ACM', 'http://dblp.uni-trier.de/db/conf/ccs/', 'A', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('157', 'EUROCRYPT', 'European Cryptology Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/eurocrypt/', 'A', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('158', 'S&P', 'IEEE Symposium on Security and Privacy', 'IEEE', 'http://dblp.uni-trier.de/db/conf/sp/', 'A', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('159', 'CRYPTO', 'International Cryptology Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/crypto/', 'A', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('160', 'USENIX Security', 'Usenix Security Symposium', 'USENIX Association', 'http://dblp.uni-trier.de/db/conf/uss/', 'A', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('161', 'ACSAC', 'Annual Computer Security Applications Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/acsac/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('162', 'ASIACRYPT', 'Annual International Conference on the Theory and Application of Cryptology and Information Security', 'Springer', 'http://dblp.uni-trier.de/db/conf/asiacrypt/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('163', 'ESORICS', 'European Symposium on Research in Computer Security', 'Springer', 'http://dblp.uni-trier.de/db/conf/esorics/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('164', 'FSE', 'Fast Software Encryption', 'Springer', 'http://dblp.uni-trier.de/db/conf/fse/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('165', 'CSFW', 'IEEE Computer Security Foundations Workshop', 'IEEE', 'http://dblp.uni-trier.de/db/conf/csfw/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('166', 'SRDS', 'IEEE International Symposium on Reliable Distributed Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/srds/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('167', 'CHES', 'International Conference on Cryptographic Hardware and Embedded Systems', 'Springer', 'http://dblp.uni-trier.de/db/conf/ches/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('168', 'DSN', 'International Conference on Dependable Systems and Networks', 'IEEE/IFIP', 'http://dblp.uni-trier.de/db/conf/dsn/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('169', 'RAID', 'International Symposium on Recent Advances in Intrusion Detection', 'Springer', 'http://dblp.uni-trier.de/db/conf/raid/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('170', 'PKC', 'International Workshop on Practice and Theory in Public Key Cryptography', 'Springer', 'http://dblp.uni-trier.de/db/conf/pkc/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('171', 'NDSS', 'ISOC Network and Distributed System Security Symposium', 'ISOC', 'http://dblp.uni-trier.de/db/conf/ndss/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('172', 'TCC', 'Theory of Cryptography Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/tcc/', 'B', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('173', 'WiSec', 'ACM Conference on Security and Privacy in Wireless and Mobile Networks', 'ACM', 'http://dblp.uni-trier.de/db/conf/wisec/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('174', 'SACMAT', 'ACM Symposium on Access Control Models and Technologies', 'ACM', 'http://dblp.uni-trier.de/db/conf/sacmat/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('175', 'DRM', 'ACM Workshop on Digital Rights Management', 'ACM', 'http://dblp.uni-trier.de/db/conf/drm/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('176', 'IH&MMSec', 'ACM Workshop on Information Hiding and Multimedia Security', 'ACM', 'http://dblp.uni-trier.de/db/conf/ih/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('177', 'ACNS', 'Applied Cryptography and Network Security', 'Springer', 'http://dblp.uni-trier.de/db/conf/acns/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('178', 'AsiaCCS', 'Asia Conference on Computer and Communications Security', 'ACM', 'http://dblp.uni-trier.de/db/conf/ccs/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('179', 'ACISP', 'Australasia Conference on Information Security and Privacy', 'Springer', 'http://dblp.uni-trier.de/db/conf/acisp/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('180', 'CT-RSA', 'Cryptographer\'s Track at RSA Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/ctrsa/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('181', 'DIMVA', 'Detection of Intrusions and Malware & Vulnerability Assessment', 'nan', 'http://dblp.uni-trier.de/db/conf/dimva/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('182', 'DFRWS', 'Digital Forensic Research Workshop', 'Elsevier', 'http://dblp.uni-trier.de/db/conf/dfrws/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('183', 'FC', 'Financial Cryptography and Data Security', 'Springer', 'http://dblp.uni-trier.de/db/conf/fc/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('184', 'TrustCom', 'IEEE International Conference on Trust, Security and Privacy in Computing and Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/trustcom/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('185', 'IFIP WG 11.9', 'IFIP WG 11.9 International Conference on Digital Forensics', 'Springer', '*http://www.ifip119.org/Conferences/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('186', 'ISC', 'Information Security Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/isw/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('187', 'ICDF2C', 'International Conference on Digital Forensics & Cyber Crime', 'Springer', 'http://dblp.uni-trier.de/db/conf/icdf2c/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('188', 'ICICS', 'International Conference on Information and Communications Security', 'Springer', 'http://dblp.uni-trier.de/db/conf/icics/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('189', 'SecureComm', 'International Conference on Security and Privacy in Communication Networks', 'ACM', 'http://dblp.uni-trier.de/db/conf/securecom\nm/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('190', 'NSPW', 'New Security Paradigms Workshop', 'ACM', 'http://dblp.uni-trier.de/db/conf/nspw/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('191', 'PAM', 'Passive and Active Measurement Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/pam/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('192', 'PETS', 'Privacy Enhancing Technologies Symposium', 'Springer', 'http://dblp.uni-trier.de/db/conf/pet/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('193', 'SAC', 'Selected Areas in Cryptography', 'Springer', 'http://dblp.uni-trier.de/db/conf/sacrypt/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('194', 'SOUPS', 'Symposium On Usable Privacy and Security', 'USENIX', 'http://dblp.uni-trier.de/db/conf/soups/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('195', 'HotSec', 'USENIX Workshop on Hot Topics in Security', 'USENIX', '*http://www.usenix.org/events/', 'C', '网络与信息安全', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('196', 'TOPLAS', 'ACM Transactions on Programming Languages & Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/toplas/', 'A', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('197', 'TOSEM', 'ACM Transactions on Software Engineering and Methodology', 'ACM', 'http://dblp.uni-trier.de/db/journals/tosem/', 'A', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('198', 'TSE', 'IEEE Transactions on Software Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tse/', 'A', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('199', 'ASE', 'Automated Software Engineering', 'Springer', 'http://dblp.uni-trier.de/db/journals/ase/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('200', 'ESE', 'Empirical Software Engineering', 'Springer', 'http://dblp.uni-trier.de/db/journals/ese/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('201', 'TSC', 'IEEE Transactions on Service Computing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tsc/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('202', 'IETS', 'IET Software', 'IET', 'https://dblp.uni-trier.de/db/journals/iet-sen/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('203', 'IST', 'Information and Software Technology', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/infsof/index.html', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('204', 'JFP', 'Journal of Functional Programming', 'Cambridge \nUniversity Press', 'http://dblp.uni-trier.de/db/journals/jfp/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('205', 'nan', 'Journal of Software: Evolution and Process', 'Wiley', 'http://dblp.uni-trier.de/db/journals/smr/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('206', 'JSS', 'Journal of Systems and Software', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jss/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('207', 'RE', 'Requirements Engineering', 'Springer', 'http://dblp.uni-trier.de/db/journals/re/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('208', 'SCP', 'Science of Computer Programming', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/scp/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('209', 'SoSyM', 'Software and System Modeling', 'Springer', 'http://dblp.uni-trier.de/db/journals/sosym/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('210', 'STVR', 'Software Testing, Verification and Reliability', 'Wiley', 'http://dblp.uni-trier.de/db/journals/stvr/index.html', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('211', 'SPE', 'Software: Practice and Experience', 'Wiley', 'http://dblp.uni-trier.de/db/journals/spe/', 'B', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('212', 'CL', 'Computer Languages, Systems and Structures', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cl/index.html', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('213', 'IJSEKE', 'International Journal on Software Engineering and Knowledge Engineering', 'World Scientific', 'http://dblp.uni-trier.de/db/journals/ijseke/index.html', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('214', 'STTT', 'International Journal on Software Tools for Technology Transfer', 'Springer', 'http://dblp.uni-trier.de/db/journals/sttt/', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('215', 'JLAP', 'Journal of Logic and Algebraic Programming', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jlp/jlap.html', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('216', 'JWE', 'Journal of Web Engineering', 'Rinton Press', 'http://dblp.uni-trier.de/db/journals/jwe/', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('217', 'SOCA', 'Service Oriented Computing and Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/soca/', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('218', 'SQJ', 'Software Quality Journal', 'Springer', 'http://dblp.uni-trier.de/db/journals/sqj/', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('219', 'TPLP', 'Theory and Practice of Logic Programming', 'Cambridge University \nPress', 'http://dblp.uni-trier.de/db/journals/tplp/', 'C', '软件工程/系统软件/程序设计语言', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('220', 'PLDI', 'ACM SIGPLAN Conference on Programming Language Design & Implementation', 'ACM', 'http://dblp.uni-trier.de/db/conf/pldi/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('221', 'POPL', 'ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages', 'ACM', 'http://dblp.uni-trier.de/db/conf/popl/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('222', 'FSE/ESEC', 'ACM SIGSOFT Symposium on the Foundation of Software Engineering/ European Software Engineering Conference', 'ACM', 'http://dblp.uni-trier.de/db/conf/sigsoft/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('223', 'SOSP', 'ACM Symposium on Operating Systems Principles', 'ACM', 'http://dblp.uni-trier.de/db/conf/sosp/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('224', 'OOPSLA', 'Conference on Object-Oriented Programming Systems, Languages, and Applications', 'ACM', 'http://dblp.uni-trier.de/db/conf/oopsla/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('225', 'ASE', 'International Conference on Automated Software Engineering', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/kbse/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('226', 'ICSE', 'International Conference on Software Engineering', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/icse/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('227', 'ISSTA', 'International Symposium on Software Testing and Analysis', 'ACM', 'http://dblp.uni-trier.de/db/conf/issta/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('228', 'OSDI', 'USENIX Symposium on Operating Systems Design and Implementations', 'USENIX', 'http://dblp.uni-trier.de/db/conf/osdi/', 'A', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('229', 'ECOOP', 'European Conference on Object-Oriented Programming', 'AITO', 'http://dblp.uni-trier.de/db/conf/ecoop/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('230', 'ETAPS', 'European Joint Conferences on Theory and Practice of Software', 'Springer', 'http://dblp.uni-trier.de/db/conf/etaps/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('231', 'ICPC', 'IEEE International Conference on Program Comprehension', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iwpc/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('232', 'RE', 'IEEE International Requirement Engineering Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/re/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('233', 'CAiSE', 'International Conference on Advanced Information Systems Engineering', 'Springer', 'http://dblp.uni-trier.de/db/conf/caise/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('234', 'ICFP', 'International Conference on Function Programming', 'ACM', 'http://dblp.uni-trier.de/db/conf/icfp/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('235', 'LCTES', 'International Conference on Languages, Compilers and Tools for Embedded Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/lctrts/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('236', 'MoDELS', 'International Conference on Model Driven Engineering Languages and Systems', 'ACM, IEEE', 'http://dblp.uni-trier.de/db/conf/models/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('237', 'CP', 'International Conference on Principles and Practice of Constraint Programming', 'Springer', 'http://dblp.uni-trier.de/db/conf/cp/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('238', 'ICSOC', 'International Conference on Service Oriented Computing', 'Springer', 'http://dblp.uni-trier.de/db/conf/icsoc/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('239', 'ICSME', 'International Conference on Software Maintenance and Evolution', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icsm/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('240', 'VMCAI', 'International Conference on Verification, Model Checking, and Abstract Interpretation', 'Springer', 'http://dblp.uni-trier.de/db/conf/vmcai/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('241', 'ICWS', 'International Conference on Web Services （Research Track）', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icws/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('242', 'Middleware', 'International Middleware Conference', 'ACM/IFIP/ \nUSENIX', 'http://dblp.uni-trier.de/db/conf/middleware/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('243', 'SAS', 'International Static Analysis Symposium', 'Springer', 'http://dblp.uni-trier.de/db/conf/sas/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('244', 'ESEM', 'International Symposium on Empirical Software Engineering and Measurement', 'ACM/IEEE', 'http://dblp.uni-trier.de/db/conf/esem/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('245', 'FM', 'International Symposium on Formal Methods', 'FME', 'http://dblp.uni-trier.de/db/conf/fm/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('246', 'ISSRE', 'International Symposium on Software Reliability Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/conf/issre/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('247', 'HotOS', 'USENIX Workshop on Hot Topics in Operating Systems', 'USENIX', 'http://dblp.uni-trier.de/db/conf/hotos/', 'B', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('248', 'PEPM', 'ACM SIGPLAN Workshop on Partial Evaluation and Program Manipulation', 'ACM', 'http://dblp.uni-trier.de/db/conf/pepm/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('249', 'PASTE', 'ACMSIGPLAN-SIGSOFT Workshop on Program Analysis for Software Tools and Engineering', 'ACM', 'http://dblp.uni-trier.de/db/conf/paste/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('250', 'APLAS', 'Asian Symposium on Programming Languages and Systems', 'Springer', 'http://dblp.uni-trier.de/db/conf/aplas/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('251', 'APSEC', 'Asia-Pacific Software Engineering Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/apsec/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('252', 'EASE', 'Evaluation and Assessment in Software Engineering', 'ACM', 'http://dblp.uni-trier.de/db/conf/ease/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('253', 'ICECCS', 'IEEE International Conference on Engineering of Complex Computer Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iceccs/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('254', 'ICST', 'IEEE International Conference on Software Testing, Verification and Validation', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icst/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('255', 'ISPASS', 'IEEE International Symposium on Performance Analysis of Systems and Software', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ispass/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('256', 'SCAM', 'IEEE International Working Conference on Source Code Analysis and Manipulation', 'IEEE', 'http://dblp.uni-trier.de/db/conf/scam/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('257', 'COMPSAC', 'International Computer Software and Applications Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/compsac/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('258', 'TOOLS', 'International Conference on Objects, Models, Components, Patterns', 'Springer', 'http://dblp.uni-trier.de/db/conf/tools/index.html', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('259', 'QSIC', 'International Conference on Quality Software', 'IEEE', 'http://dblp.uni-trier.de/db/conf/qsic/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('260', 'SCC', 'International Conference on Service Computing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/IEEEscc/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('261', 'ICSSP', 'International Conference on Software and System Process', 'ACM', 'http://dblp.uni-trier.de/db/conf/ispw/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('262', 'SEKE', 'International Conference on Software Engineering and Knowledge Engineering', 'KSI', 'http://dblp.uni-trier.de/db/conf/seke/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('263', 'ICSR', 'International Conference on Software Reuse', 'Springer', 'http://dblp.uni-trier.de/db/conf/icsr/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('264', 'ICWE', 'International Conference on Web Engineering', 'Springer', 'http://dblp.uni-trier.de/db/conf/icwe/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('265', 'SPIN', 'International SPIN Workshop on Model Checking Software', 'Springer', 'http://dblp.uni-trier.de/db/conf/spin/index.html', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('266', 'ATVA', 'International Symposium on Automated Technology for Verification and Analysis', 'Springer', 'http://dblp.uni-trier.de/db/conf/atva/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('267', 'LOPSTR', 'International Symposium on Logic-based Program Synthesis and Transformation', 'Springer', 'http://dblp.uni-trier.de/db/conf/lopstr/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('268', 'TASE', 'International Symposium on Theoretical Aspects of Software Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/conf/tase/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('269', 'MSR', 'Mining Software Repositories', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/msr/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('270', 'REFSQ', 'Requirements Engineering: Foundation for Software Quality', 'Springer', 'http://dblp.uni-trier.de/db/conf/refsq/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('271', 'WICSA', 'Working IEEE/IFIP Conference on Software Architecture', 'IEEE', 'http://dblp.uni-trier.de/db/conf/wicsa/', 'C', '软件工程/系统软件/程序设计语言', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('272', 'TODS', 'ACM Transactions on Database Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/tods/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('273', 'TOIS', 'ACM Transactions on Information Systems', 'ACM', 'http://dblp.uni-trier.de/db/journals/tois/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('274', 'TKDE', 'IEEE Transactions on Knowledge and Data Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tkde/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('275', 'VLDBJ', 'The VLDB Journal', 'Springer', 'http://dblp.uni-trier.de/db/journals/vldb/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('276', 'TKDD', 'ACM Transactions on Knowledge Discovery from Data', 'ACM', 'http://dblp.uni-trier.de/db/journals/tkdd/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('277', 'TWEB', 'ACM Transactions on the Web', 'ACM', 'http://dblp.uni-trier.de/db/journals/tweb/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('278', 'AEI', 'Advanced Engineering Informatics', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/aei/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('279', 'DKE', 'Data and Knowledge Engineering', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/dke/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('280', 'DMKD', 'Data Mining and Knowledge Discovery', 'Springer', 'http://dblp.uni-trier.de/db/journals/datamine/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('281', 'EJIS', 'European Journal of Information Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/ejis/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('282', 'nan', 'GeoInformatica', 'Springer', 'http://dblp.uni-trier.de/db/journals/geoinformatica/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('283', 'IPM', 'Information Processing and Management', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ipm/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('284', 'nan', 'Information Sciences', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/isci/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('285', 'IS', 'Information Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/is/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('286', 'JASIST', 'Journal of the American Society for Information Science and Technology', 'American Society for \nInformation Science and \nTechnology', 'http://dblp.uni-trier.de/db/journals/jasis/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('287', 'JWS', 'Journal of Web Semantics', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ws/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('288', 'KAIS', 'Knowledge and Information Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/kais/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('289', 'DPD', 'Distributed and Parallel Databases', 'Springer', 'http://dblp.uni-trier.de/db/journals/dpd/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('290', 'I&M', 'Information and Management', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/iam/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('291', 'IPL', 'Information Processing Letters', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ipl/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('292', 'IR', 'Information Retrieval Journal', 'Springer', 'http://dblp.uni-trier.de/db/journals/ir/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('293', 'IJCIS', 'International Journal of Cooperative Information Systems', 'World Scientific', 'http://dblp.uni-trier.de/db/journals/ijcis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('294', 'IJGIS', 'International Journal of Geographical Information Science', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/gis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('295', 'IJIS', 'International Journal of Intelligent Systems', 'Wiley', 'http://dblp.uni-trier.de/db/journals/ijis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('296', 'IJKM', 'International Journal of Knowledge Management', 'IGI', 'http://dblp.uni-trier.de/db/journals/ijkm/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('297', 'IJSWIS', 'International Journal on Semantic Web and Information Systems', 'IGI', 'http://dblp.uni-trier.de/db/journals/ijswis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('298', 'JCIS', 'Journal of Computer Information Systems', 'IACIS', 'http://dblp.uni-trier.de/db/journals/jcis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('299', 'JDM', 'Journal of Database Management', 'IGI-Global', 'http://dblp.uni-trier.de/db/journals/jdm/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('300', 'JGITM', 'Journal of Global Information Technology Management', 'Ivy League \nPublishing', 'http://www.tandfonline.com/loi/ugit20#.Vnv35pN97rI', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('301', 'JIIS', 'Journal of Intelligent Information Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/jiis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('302', 'JSIS', 'Journal of Strategic Information Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jsis/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('303', 'SIGMOD', 'ACM Conference on Management of Data', 'ACM', 'http://dblp.uni-trier.de/db/conf/sigmod/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('304', 'SIGKDD', 'ACM Knowledge Discovery and Data Mining', 'ACM', 'http://dblp.uni-trier.de/db/conf/kdd/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('305', 'ICDE', 'IEEE International Conference on Data Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icde/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('306', 'SIGIR', 'International Conference on Research on Development in Information Retrieval', 'ACM', 'http://dblp.uni-trier.de/db/conf/sigir/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('307', 'VLDB', 'International Conference on Very Large Data Bases', 'Morgan \nKaufmann/ACM', 'http://dblp.uni-trier.de/db/conf/vldb/', 'A', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('308', 'CIKM', 'ACM International Conference on Information and Knowledge Management', 'ACM', 'http://dblp.uni-trier.de/db/conf/cikm/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('309', 'WSDM', 'ACM International Conference on Web Search and Data Mining', 'ACM', 'http://dblp.uni-trier.de/db/conf/wsdm/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('310', 'PODS', 'ACM Symposium on Principles of Database Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/pods/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('311', 'DASFAA', 'Database Systems for Advanced Applications', 'Springer', 'http://dblp.uni-trier.de/db/conf/dasfaa/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('312', 'ECML-PKDD', 'European Conference on Machine Learning and Principles and Practice of Knowledge Discovery in Databases', 'Springer', 'http://dblp.uni-trier.de/db/conf/ecml/ \nhttp://dblp.uni-trier.de/db/conf/pkdd/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('313', 'ISWC', 'IEEE International Semantic Web Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/semweb/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('314', 'ICDM', 'International Conference on Data Mining', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icdm/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('315', 'ICDT', 'International Conference on Database Theory', 'Springer', 'http://dblp.uni-trier.de/db/conf/icdt/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('316', 'EDBT', 'International Conference on Extending DB Technology', 'Springer', 'http://dblp.uni-trier.de/db/conf/edbt/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('317', 'CIDR', 'International Conference on Innovative Data Systems Research', 'Online Proceeding', 'http://dblp.uni-trier.de/db/conf/cidr/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('318', 'SDM', 'SIAM International Conference on Data Mining', 'SIAM', 'http://dblp.uni-trier.de/db/conf/sdm/', 'B', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('319', 'APWeb', 'Asia Pacific Web Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/apweb/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('320', 'DEXA', 'Database and Expert System Applications', 'Springer', 'http://dblp.uni-trier.de/db/conf/dexa/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('321', 'ECIR', 'European Conference on IR Research', 'Springer', 'http://dblp.uni-trier.de/db/conf/ecir/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('322', 'ESWC', 'Extended Semantic Web Conference', 'Springer', 'http://dblp.uni-trier.de/db/conf/esws/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('323', 'WebDB', 'International ACM Workshop on Web and Databases', 'ACM', 'http://dblp.uni-trier.de/db/conf/webdb/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('324', 'ER', 'International Conference on Conceptual Modeling', 'Springer', 'http://dblp.uni-trier.de/db/conf/er/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('325', 'MDM', 'International Conference on Mobile Data Management', 'IEEE', 'http://dblp.uni-trier.de/db/conf/mdm/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('326', 'SSDBM', 'International Conference on Scientific and Statistical DB Management', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ssdbm/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('327', 'WAIM', 'International Conference on Web Age Information Management', 'Springer', 'http://dblp.uni-trier.de/db/conf/waim/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('328', 'SSTD', 'International Symposium on Spatial and Temporal Databases', 'Springer', 'http://dblp.uni-trier.de/db/conf/ssd/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('329', 'PAKDD', 'Pacific-Asia Conference on Knowledge Discovery and Data Mining', 'Springer', 'http://dblp.uni-trier.de/db/conf/pakdd/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('330', 'WISE', 'Web Information Systems Engineering', 'Springer', 'http://dblp.uni-trier.de/db/conf/wise/', 'C', '数据库/数据挖掘/内容检索', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('331', 'TIT', 'IEEE Transactions on Information Theory', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tit/', 'A', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('332', 'IANDC', 'Information and Computation', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/iandc/', 'A', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('333', 'SICOMP', 'SIAM Journal on Computing', 'SIAM', 'http://dblp.uni-trier.de/db/journals/siamcomp/', 'A', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('334', 'TALG', 'ACM Transactions on Algorithms', 'ACM', 'http://dblp.uni-trier.de/db/journals/talg/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('335', 'TOCL', 'ACM Transactions on Computational Logic', 'ACM', 'http://dblp.uni-trier.de/db/journals/tocl/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('336', 'TOMS', 'ACM Transactions on Mathematical Software', 'ACM', 'http://dblp.uni-trier.de/db/journals/toms/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('337', 'Algorithmica', 'Algorithmica', 'Springer', 'http://dblp.uni-trier.de/db/journals/algorithmica/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('338', 'CC', 'Computational Complexity', 'Springer', 'http://dblp.uni-trier.de/db/journals/cc/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('339', 'FAC', 'Formal Aspects of Computing', 'Springer', 'http://dblp.uni-trier.de/db/journals/fac/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('340', 'FMSD', 'Formal Methods in System Design', 'Springer', 'http://dblp.uni-trier.de/db/journals/fmsd/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('341', 'INFORMS', 'INFORMS Journal on Computing', 'INFORMS', 'http://dblp.uni-trier.de/db/journals/informs/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('342', 'JCSS', 'Journal of Computer and System Sciences', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jcss/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('343', 'JGO', 'Journal of Global Optimization', 'Springer', 'http://dblp.uni-trier.de/db/journals/jgo/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('344', 'JSC', 'Journal of Symbolic Computation', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jsc/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('345', 'MSCS', 'Mathematical Structures in Computer Science', 'Cambridge \nUniversity Press', 'http://dblp.uni-trier.de/db/journals/mscs/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('346', 'TCS', 'Theoretical Computer Science', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/tcs/', 'B', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('347', 'ACTA', 'Acta Informatica', 'Springer', 'http://dblp.uni-trier.de/db/journals/acta/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('348', 'APAL', 'Annals of Pure and Applied Logic', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/apal/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('349', 'DAM', 'Discrete Applied Mathematics', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/dam/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('350', 'FUIN', 'Fundamenta Informaticae', 'IOS Press', 'http://dblp.uni-trier.de/db/journals/fuin/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('351', 'LISP', 'Higher-Order and Symbolic Computation', 'Springer', 'http://dblp.uni-trier.de/db/journals/lisp/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('352', 'IPL', 'Information Processing Letters', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ipl/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('353', 'JCOMPLEXITY', 'Journal of Complexity', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jc/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('354', 'LOGCOM', 'Journal of Logic and Computation', 'Oxford University Press', 'http://dblp.uni-trier.de/db/journals/logcom/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('355', 'JSL', 'Journal of Symbolic Logic', 'Association for Symbolic Logic', 'http://dblp.uni-trier.de/db/journals/jsyml/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('356', 'LMCS', 'Logical Methods in Computer Science', 'LMCS', 'http://dblp.uni-trier.de/db/journals/lmcs/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('357', 'SIDMA', 'SIAM Journal on Discrete Mathematics', 'SIAM', 'http://dblp.uni-trier.de/db/journals/siamdm/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('358', 'nan', 'Theory of Computing Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/mst/', 'C', '计算机科学理论', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('359', 'STOC', 'ACM Symposium on the Theory of Computing', 'ACM', 'http://dblp.uni-trier.de/db/conf/stoc/', 'A', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('360', 'SODA', 'ACM-SIAM Symposium on Discrete Algorithms', 'SIAM', 'http://dblp.uni-trier.de/db/conf/soda/', 'A', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('361', 'CAV', 'Computer Aided Verification', 'Springer', 'http://dblp.uni-trier.de/db/conf/cav/', 'A', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('362', 'FOCS', 'IEEE Annual Symposium on Foundations of Computer Science', 'IEEE', 'http://dblp.uni-trier.de/db/conf/focs/', 'A', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('363', 'LICS', 'IEEE Symposium on Logic in Computer Science', 'IEEE', 'http://dblp.uni-trier.de/db/conf/lics/', 'A', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('364', 'SoCG', 'ACM Symposium on Computational Geometry', 'ACM', 'http://dblp.uni-trier.de/db/conf/compgeom/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('365', 'ESA', 'European Symposium on Algorithms', 'Springer', 'http://dblp.uni-trier.de/db/conf/esa/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('366', 'CCC', 'IEEE Conference on Computational Complexity', 'IEEE', 'http://dblp.uni-trier.de/db/conf/coco/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('367', 'ICALP', 'International Colloquium on Automata, Languages and Programming', 'Springer', 'http://dblp.uni-trier.de/db/conf/icalp/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('368', 'CADE/IJCAR', 'International Conference on Automated Deduction/International Joint Conference on Automated Reasoning', 'Springer', 'http://dblp.uni-trier.de/db/conf/cade/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('369', 'CONCUR', 'International Conference on Concurrency Theory', 'Springer', 'http://dblp.uni-trier.de/db/conf/concur/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('370', 'HSCC', 'International Conference on Hybrid Systems: Computation and Control', 'Springer and ACM', 'http://dblp.uni-trier.de/db/conf/hybrid/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('371', 'SAT', 'Theory and Applications of Satisfiability Testing', 'Springer', 'http://dblp.uni-trier.de/db/conf/sat/', 'B', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('372', 'CSL', 'Computer Science Logic', 'Springer', 'http://dblp.uni-trier.de/db/conf/csl/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('373', 'FMCAD', 'Formal Methods in Computer-Aided Design', 'ACM', 'http://dblp.uni-trier.de/db/conf/fmcad/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('374', 'FSTTCS', 'Foundations of Software Technology and Theoretical Computer Science', 'Indian Association for Research \nin Computing Science', 'http://dblp.uni-trier.de/db/conf/fsttcs/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('375', 'DSAA', 'IEEE International Conference on Data Science and Advanced Analytics', 'IEEE', 'https://dblp.uni-trier.de/db/conf/dsaa/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('376', 'ICTAC', 'International Colloquium on Theoretical Aspects of Computing', 'Springer', 'http://dblp.uni-trier.de/db/conf/ictac/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('377', 'IPCO', 'International Conference on Integer Programming and Combinatorial Optimization', 'Springer', 'http://dblp.uni-trier.de/db/conf/ipco/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('378', 'RTA', 'International Conference on Rewriting Techniques and Applications', 'Springer', 'http://dblp.uni-trier.de/db/conf/rta/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('379', 'ISAAC', 'International Symposium on Algorithms and Computation', 'Springer', 'http://dblp.uni-trier.de/db/conf/isaac/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('380', 'MFCS', 'Mathematical Foundations of Computer Science', 'Springer', 'http://dblp.uni-trier.de/db/conf/mfcs/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('381', 'STACS', 'Symposium on Theoretical Aspects of Computer Science', 'Springer', 'http://dblp.uni-trier.de/db/conf/stacs/', 'C', '计算机科学理论', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('382', 'TOG', 'ACM Transactions on Graphics', 'ACM', 'http://dblp.uni-trier.de/db/journals/tog/', 'A', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('383', 'TIP', 'IEEE Transactions on Image Processing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tip/', 'A', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('384', 'TVCG', 'IEEE Transactions on Visualization and Computer Graphics', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tvcg/', 'A', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('385', 'TOMCCAP', 'ACM Transactions on Multimedia Computing, Communications and Application', 'ACM', 'http://dblp.uni-trier.de/db/journals/tomccap/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('386', 'CAGD', 'Computer Aided Geometric Design', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cagd/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('387', 'CGF', 'Computer Graphics Forum', 'Wiley', 'http://dblp.uni-trier.de/db/journals/cgf/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('388', 'CAD', 'Computer-Aided Design', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cad/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('389', 'GM', 'Graphical Models', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cvgip/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('390', 'TCSVT', 'IEEE Transactions on Circuits and Systems for Video Technology', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tcsv/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('391', 'TMM', 'IEEE Transactions on Multimedia', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tmm/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('392', 'JASA', 'Journal of The Acoustical Society of America', 'AIP', 'http://scitation.aip.org/content/asa/journal/jasa', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('393', 'SIIMS', 'SIAM Journal on Imaging Sciences', 'SIAM', 'http://dblp.uni-trier.de/db/journals/siamis/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('394', 'Speech Com', 'Speech Communication', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/speech/', 'B', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('395', 'CGTA', 'Computational Geometry: Theory and Applications', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/comgeo/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('396', 'CAVW', 'Computer Animation and Virtual Worlds', 'Wiley', 'http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1546\n-427X', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('397', 'C&G', 'Computers & Graphics', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cg/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('398', 'DCG', 'Discrete & Computational Geometry', 'Springer', 'http://dblp.uni-trier.de/db/journals/dcg/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('399', 'SPL', 'IEEE Signal Processing Letters', 'IEEE', 'http://dblp.uni-trier.de/db/journals/spl/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('400', 'IET-IPR', 'IET Image Processing', 'IET', 'http://dblp.uni-trier.de/db/journals/iet-ipr/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('401', 'JVCIR', 'Journal of Visual Communication and Image Representation', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/jvcir/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('402', 'MS', 'Multimedia Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/mms/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('403', 'MTA', 'Multimedia Tools and Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/mta/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('404', 'nan', 'Signal Processing', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/sigpro/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('405', 'SPIC', 'Signal Processing: Image Communication', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/spic/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('406', 'TVC', 'The Visual Computer', 'Springer', 'http://dblp.uni-trier.de/db/journals/vc/', 'C', '计算机图形学与多媒体', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('407', 'ACM MM', 'ACM International Conference on Multimedia', 'ACM', 'http://dblp.uni-trier.de/db/conf/mm/', 'A', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('408', 'SIGGRAPH', 'ACM SIGGRAPH Annual Conference', 'ACM', 'http://dblp.uni-trier.de/db/conf/siggraph/index.html', 'A', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('409', 'VR', 'IEEE Virtual Reality', 'IEEE', 'http://dblp.uni-trier.de/db/conf/vr/', 'A', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('410', 'IEEE VIS', 'IEEE Visualization Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/visualization/index.html', 'A', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('411', 'ICMR', 'ACM SIGMM International Conference on Multimedia Retrieval', 'ACM', 'http://dblp.uni-trier.de/db/conf/mir/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('412', 'SI3D', 'ACM Symposium on Interactive 3D Graphics', 'ACM', 'http://dblp.uni-trier.de/db/conf/si3d/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('413', 'SCA', 'ACM/Eurographics Symposium on Computer Animation', 'ACM', 'http://dblp.uni-trier.de/db/conf/sca/index.html', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('414', 'DCC', 'Data Compression Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/dcc/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('415', 'EG', 'Eurographics', 'Wiley/ Blackwell', 'http://dblp.uni-trier.de/db/conf/eurographics/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('416', 'EuroVis', 'Eurographics Conference on Visualization', 'ACM', 'http://dblp.uni-trier.de/db/conf/vissym/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('417', 'SGP', 'Eurographics Symposium on Geometry Processing', 'Wiley/Blackwell', 'http://dblp.uni-trier.de/db/conf/sgp/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('418', 'EGSR', 'Eurographics Symposium on Rendering', 'Wiley/Blackwell', 'http://dblp.uni-trier.de/db/conf/rt/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('419', 'ICASSP', 'IEEE International Conference on Acoustics, Speech and SP', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icassp/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('420', 'ICME', 'IEEE International Conference on Multimedia & Expo', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icmcs/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('421', 'ISMAR', 'International Symposium on Mixed and Augmented Reality', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/conf/ismar/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('422', 'PG', 'Pacific Graphics: The Pacific Conference on Computer Graphics and Applications', 'Wiley/Blackwell', 'http://dblp.uni-trier.de/db/conf/pg/index.html', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('423', 'SPM', 'Symposium on Solid and Physical Modeling', 'SMA/Elsevier', 'http://dblp.uni-trier.de/db/conf/sma/', 'B', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('424', 'nan', 'ACM Symposium on Virtual Reality Software and Technology', 'ACM', 'http://dblp2.uni-trier.de/db/conf/vrst/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('425', 'CASA', 'Computer Animation and Social Agents', 'Wiley', 'http://dblp.uni-trier.de/db/conf/ca/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('426', 'CGI', 'Computer Graphics International', 'Springer', 'http://dblp.uni-trier.de/db/conf/cgi/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('427', 'INTERSPEECH', 'Conference of the International Speech Communication Association', 'nan', 'http://dblp.uni-trier.de/db/conf/interspeech/index.html', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('428', 'GMP', 'Geometric Modeling and Processing', 'Elsevier', 'http://dblp.uni-trier.de/db/conf/gmp/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('429', 'PacificVis', 'IEEE Pacific Visualization Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/apvis/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('430', '3DV', 'International Conference on 3D Vision', 'IEEE', 'https://dblp.uni-trier.de/db/conf/3dim/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('431', 'CAD/Graphics', 'International Conference on Computer-Aided Design and Computer Graphics', 'IEEE', 'https://dblp.uni-trier.de/db/conf/cadgraphics/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('432', 'ICIP', 'International Conference on Image Processing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icip/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('433', 'MMM', 'International Conference on Multimedia Modeling', 'Springer', 'http://dblp.uni-trier.de/db/conf/mmm/index.html', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('434', 'PCM', 'Pacific-Rim Conference on Multimedia', 'Springer', 'http://dblp.uni-trier.de/db/conf/pcm/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('435', 'SMI', 'Shape Modeling International', 'IEEE', 'http://dblp.uni-trier.de/db/conf/smi/', 'C', '计算机图形学与多媒体', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('436', 'AI', 'Artificial Intelligence', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ai/', 'A', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('437', 'TPAMI', 'IEEE Trans on Pattern Analysis and Machine Intelligence', 'IEEE', 'http://dblp.uni-trier.de/db/journals/pami/', 'A', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('438', 'IJCV', 'International Journal of Computer Vision', 'Springer', 'http://dblp.uni-trier.de/db/journals/ijcv/', 'A', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('439', 'JMLR', 'Journal of Machine Learning Research', 'MIT Press', 'http://dblp.uni-trier.de/db/journals/jmlr/', 'A', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('440', 'TAP', 'ACM Transactions on Applied Perception', 'ACM', 'http://dblp.uni-trier.de/db/journals/tap/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('441', 'TSLP', 'ACM Transactions on Speech and Language Processing', 'ACM', 'http://dblp.uni-trier.de/db/journals/tslp/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('442', 'AAMAS', 'Autonomous Agents and Multi-Agent Systems', 'Springer', 'http://dblp.uni-trier.de/db/journals/aamas/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('443', 'nan', 'Computational Linguistics', 'MIT Press', 'http://dblp.uni-trier.de/db/journals/coling/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('444', 'CVIU', 'Computer Vision and Image Understanding', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/cviu/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('445', 'DKE', 'Data and Knowledge Engineering', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/dke/index.html', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('446', 'nan', 'Evolutionary Computation', 'MIT Press', 'http://dblp.uni-trier.de/db/journals/ec/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('447', 'TAC', 'IEEE Transactions on Affective Computing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/taffco/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('448', 'TASLP', 'IEEE Transactions on Audio, Speech, and Language Processing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/taslp/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('449', 'nan', 'IEEE Transactions on Cybernetics', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tcyb/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('450', 'TEC', 'IEEE Transactions on Evolutionary Computation', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tec/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('451', 'TFS', 'IEEE Transactions on Fuzzy Systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tfs/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('452', 'TNNLS', 'IEEE Transactions on Neural Networks and learning systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tnn/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('453', 'IJAR', 'International Journal of Approximate Reasoning', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ijar/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('454', 'nan', 'Journal of Automated Reasoning', 'Springer', 'http://dblp.uni-trier.de/db/journals/jar/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('455', 'JSLHR', 'Journal of Speech, Language, and Hearing Research', 'American \nSpeech-Language \nHearing Association', 'http://jslhr.pubs.asha.org/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('456', 'nan', 'Machine Learning', 'Springer', 'http://dblp.uni-trier.de/db/journals/ml/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('457', 'nan', 'Neural Computation', 'MIT Press', 'http://dblp.uni-trier.de/db/journals/neco/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('458', 'nan', 'Neural Networks', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/nn/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('459', 'PR', 'Pattern Recognition', 'Elsevier', 'http://dblp.uni-trier.de/db/conf/par/', 'B', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('460', 'TALIP', 'ACM Transactions on Asian Language Information Processing', 'ACM', 'http://dblp.uni-trier.de/db/journals/talip/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('461', 'nan', 'Applied Intelligence', 'Springer', 'http://dblp.uni-trier.de/db/journals/apin/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('462', 'AIM', 'Artificial Intelligence in Medicine', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/artmed/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('463', 'nan', 'Artificial Life', 'MIT Press', 'http://dblp.uni-trier.de/db/journals/alife/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('464', 'nan', 'Computational Intelligence', 'Wiley', 'http://dblp.uni-trier.de/db/journals/ci/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('465', 'nan', 'Computer Speech and Language', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/csl/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('466', 'nan', 'Connection Science', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/connection/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('467', 'DSS', 'Decision Support Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/dss/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('468', 'EAAI', 'Engineering Applications of Artificial Intelligence', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/eaai/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('469', 'nan', 'Expert Systems', 'Blackwell/Wiley', 'http://dblp.uni-trier.de/db/journals/es/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('470', 'ESWA', 'Expert Systems with Applications', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/eswa/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('471', 'nan', 'Fuzzy Sets and Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/fss/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('472', 'TG', 'IEEE Transactions on Games', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tciaig/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('473', 'IET-CVI', 'IET Computer Vision', 'IET', 'http://digital-library.theiet.org/content/journals/iet-cvi', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('474', 'IVC', 'Image and Vision Computing', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ivc/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('475', 'IDA', 'Intelligent Data Analysis', 'IOS Press', 'http://dblp.uni-trier.de/db/journals/ida/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('476', 'IJCIA', 'International Journal of Computational Intelligence and Applications', 'World Scientific', 'http://dblp.uni-trier.de/db/journals/ijcia/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('477', 'IJIS', 'International Journal of Intelligent Systems', 'Wiley', 'http://dblp.uni-trier.de/db/journals/ijis/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('478', 'IJNS', 'International Journal of Neural Systems', 'World Scientific', 'http://dblp.uni-trier.de/db/journals/ijns/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('479', 'IJPRAI', 'International Journal of Pattern Recognition and Artificial Intelligence', 'World Scientific', 'http://dblp.uni-trier.de/db/journals/ijprai/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('480', 'IJUFKS', 'International Journal of Uncertainty, Fuzziness and Knowledge-Based System', 'World Scientific', 'https://dblp.uni-trier.de/db/journals/ijufks/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('481', 'IJDAR', 'International Journal on Document Analysis and Recognition', 'Springer', 'http://dblp.uni-trier.de/db/journals/ijdar/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('482', 'JETAI', 'Journal of Experimental and Theoretical Artificial Intelligence', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/jetai/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('483', 'KBS', 'Knowledge-Based Systems', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/kbs/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('484', 'nan', 'Machine Translation', 'Springer', 'http://dblp.uni-trier.de/db/journals/mt/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('485', 'nan', 'Machine Vision and Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/mva/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('486', 'nan', 'Natural Computing', 'Springer', 'http://dblp.uni-trier.de/db/journals/nc/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('487', 'NLE', 'Natural Language Engineering', 'Cambridge University \nPress', 'http://dblp.uni-trier.de/db/journals/nle/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('488', 'NCA', 'Neural Computing & Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/nca/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('489', 'nan', 'Neurocomputing', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ijon/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('490', 'PAA', 'Pattern Analysis and Applications', 'Springer', 'http://dblp.uni-trier.de/db/journals/paa/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('491', 'PRL', 'Pattern Recognition Letters', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/prl/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('492', 'nan', 'Soft Computing', 'Springer', 'http://dblp.uni-trier.de/db/journals/soco/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('493', 'WI', 'Web Intelligence', 'IOS Press', 'http://dblp.uni-trier.de/db/journals/wias/', 'C', '人工智能', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('494', 'AAAI', 'AAAI Conference on Artificial Intelligence', 'AAAI', 'http://dblp.uni-trier.de/db/conf/aaai/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('495', 'NeurIPS', 'Annual Conference on Neural Information Processing Systems', 'MIT Press', 'http://dblp.uni-trier.de/db/conf/nips/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('496', 'ACL', 'Annual Meeting of the Association for Computational Linguistics', 'ACL', 'http://dblp.uni-trier.de/db/conf/acl/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('497', 'CVPR', 'IEEE Conference on Computer Vision and Pattern Recognition', 'IEEE', 'http://dblp.uni-trier.de/db/conf/cvpr/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('498', 'ICCV', 'International Conference on Computer Vision', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iccv/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('499', 'ICML', 'International Conference on Machine Learning', 'ACM', 'http://dblp.uni-trier.de/db/conf/icml/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('500', 'IJCAI', 'International Joint Conference on Artificial Intelligence', 'Morgan Kaufmann', 'http://dblp.uni-trier.de/db/conf/ijcai/', 'A', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('501', 'COLT', 'Annual Conference on Computational Learning Theory', 'Springer', 'http://dblp.uni-trier.de/db/conf/colt/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('502', 'EMNLP', 'Conference on Empirical Methods in Natural Language Processing', 'ACL', 'http://dblp.uni-trier.de/db/conf/emnlp/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('503', 'ECAI', 'European Conference on Artificial Intelligence', 'IOS Press', 'http://dblp.uni-trier.de/db/conf/ecai/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('504', 'ECCV', 'European Conference on Computer Vision', 'Springer', 'http://dblp.uni-trier.de/db/conf/eccv/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('505', 'ICRA', 'IEEE International Conference on Robotics and Automation', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icra/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('506', 'ICAPS', 'International Conference on Automated Planning and Scheduling', 'AAAI', 'http://dblp.uni-trier.de/db/conf/aips/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('507', 'ICCBR', 'International Conference on Case-Based Reasoning and Development', 'Springer', 'http://dblp.uni-trier.de/db/conf/iccbr/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('508', 'COLING', 'International Conference on Computational Linguistics', 'ACM', 'http://dblp.uni-trier.de/db/conf/coling/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('509', 'KR', 'International Conference on Principles of Knowledge', 'Morgan Kaufmann', 'http://dblp.uni-trier.de/db/conf/kr/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('510', 'UAI', 'International Conference on Uncertainty in Artificial Intelligence', 'AUAI', 'http://dblp.uni-trier.de/db/conf/uai/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('511', 'AAMAS', 'International Joint Conference on Autonomous Agents and Multi-agent Systems', 'Springer', 'http://dblp.uni-trier.de/db/conf/atal/index.html', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('512', 'PPSN', 'Parallel Problem Solving from Nature', 'Springer', 'http://dblp.uni-trier.de/db/conf/ppsn/', 'B', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('513', 'AISTATS', 'Artificial Intelligence and Statistics', 'JMLR', 'http://dblp.uni-trier.de/db/conf/aistats/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('514', 'ACCV', 'Asian Conference on Computer Vision', 'Springer', 'http://dblp.uni-trier.de/db/conf/accv/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('515', 'ACML', 'Asian Conference on Machine Learning', 'JMLR', 'http://dblp.uni-trier.de/db/conf/acml/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('516', 'BMVC', 'British Machine Vision Conference', 'British Machine Vision \nAssociation', 'http://dblp.uni-trier.de/db/conf/bmvc/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('517', 'NLPCC', 'CCF International Conference on Natural Language Processing and Chinese Computing', 'Springer', 'https://dblp.uni-trier.de/db/conf/nlpcc/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('518', 'CoNLL', 'Conference on Computational Natural Language Learning', 'Association for \nComputational Linguistics', 'http://dblp.uni-trier.de/db/conf/conll', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('519', 'GECCO', 'Genetic and Evolutionary Computation Conference', 'ACM', 'http://dblp.uni-trier.de/db/conf/gecco/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('520', 'ICTAI', 'IEEE International Conference on Tools with Artificial Intelligence', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ictai/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('521', 'IROS', 'IEEE\\RSJ International Conference on Intelligent Robots and Systems', 'IEEE', 'http://dblp.uni-trier.de/db/conf/iros/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('522', 'ALT', 'International Conference on Algorithmic Learning Theory', 'Springer', 'http://dblp.uni-trier.de/db/conf/alt/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('523', 'ICANN', 'International Conference on Artificial Neural Networks', 'Springer', 'http://dblp.uni-trier.de/db/conf/icann/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('524', 'FG', 'International Conference on Automatic Face and Gesture Recognition', 'IEEE', 'http://dblp.uni-trier.de/db/conf/fgr/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('525', 'ICDAR', 'International Conference on Document Analysis and Recognition', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icdar/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('526', 'ILP', 'International Conference on Inductive Logic Programming', 'Springer', 'http://dblp.uni-trier.de/db/conf/ilp/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('527', 'KSEM', 'International conference on Knowledge Science, Engineering and Management', 'Springer', 'http://dblp.uni-trier.de/db/conf/ksem/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('528', 'ICONIP', 'International Conference on Neural Information Processing', 'Springer', 'http://dblp.uni-trier.de/db/conf/iconip/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('529', 'ICPR', 'International Conference on Pattern Recognition', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icpr/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('530', 'ICB', 'International Joint Conference on Biometrics', 'IEEE', 'http://dblp.uni-trier.de/db/conf/icb/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('531', 'IJCNN', 'International Joint Conference on Neural Networks', 'IEEE', 'http://dblp.uni-trier.de/db/conf/ijcnn/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('532', 'PRICAI', 'Pacific Rim International Conference on Artificial Intelligence', 'Springer', 'http://dblp.uni-trier.de/db/conf/pricai/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('533', 'NAACL', 'The Annual Conference of the North American Chapter of the Association for Computational Linguistics', 'NAACL', 'http://dblp.uni-trier.de/db/conf/naacl/', 'C', '人工智能', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('534', 'TOCHI', 'ACM Transactions on Computer-Human Interaction', 'ACM', 'http://dblp.uni-trier.de/db/journals/tochi/', 'A', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('535', 'IJHCS', 'International Journal of Human Computer Studies', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/ijmms/', 'A', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('536', 'CSCW', 'Computer Supported Cooperative Work', 'Springer', 'http://dblp.uni-trier.de/db/journals/cscw/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('537', 'HCI', 'Human Computer Interaction', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/hhci/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('538', 'nan', 'IEEE Transactions on Human-Machine Systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/thms/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('539', 'IWC', 'Interacting with Computers', 'Oxford University Press', 'http://dblp.uni-trier.de/db/journals/iwc/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('540', 'IJHCI', 'International Journal of Human-Computer Interaction', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/ijhci/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('541', 'UMUAI', 'User Modeling and User-Adapted Interaction', 'Springer', 'http://dblp.uni-trier.de/db/journals/umuai/', 'B', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('542', 'BIT', 'Behaviour & Information Technology', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/behaviourIT/', 'C', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('543', 'PUC', 'Personal and Ubiquitous Computing', 'Springer', 'http://dblp.uni-trier.de/db/journals/puc/', 'C', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('544', 'PMC', 'Pervasive and Mobile Computing', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/percom/', 'C', '人机交互与普适计算', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('545', 'CSCW', 'ACM Conference on Computer Supported Cooperative Work and Social Computing', 'ACM', 'http://dblp.uni-trier.de/db/conf/cscw', 'A', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('546', 'CHI', 'ACM Conference on Human Factors in Computing Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/chi', 'A', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('547', 'UbiComp', 'ACM International Conference on Ubiquitous Computing', 'ACM', 'http://dblp.uni-trier.de/db/conf/huc/', 'A', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('548', 'GROUP', 'ACM Conference on Supporting Group Work', 'ACM', 'http://dblp.uni-trier.de/db/conf/group/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('549', 'IUI', 'ACM International Conference on Intelligent User Interfaces', 'ACM', 'http://dblp.uni-trier.de/db/conf/iui/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('550', 'ITS', 'ACM International Conference on Interactive Tabletops and Surfaces', 'ACM', 'http://dblp.uni-trier.de/db/conf/tabletop/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('551', 'UIST', 'ACM Symposium on User Interface Software and Technology', 'ACM', 'http://dblp.uni-trier.de/db/conf/uist/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('552', 'ECSCW', 'European Conference on Computer Supported Cooperative Work', 'Springer', 'http://dblp.uni-trier.de/db/conf/ecscw/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('553', 'PERCOM', 'IEEE International Conference on Pervasive Computing and Communications', 'IEEE', 'http://dblp.uni-trier.de/db/conf/percom/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('554', 'MobileHCI', 'International Conference on Human Computer Interaction with Mobile Devices and Services', 'ACM', 'http://dblp.uni-trier.de/db/conf/mhci/', 'B', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('555', 'DIS', 'ACM Conference on Designing Interactive Systems', 'ACM', 'http://dblp.uni-trier.de/db/conf/ACMdis', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('556', 'ICMI', 'ACM International Conference on Multimodal Interaction', 'ACM', 'http://dblp.uni-trier.de/db/conf/icmi/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('557', 'ASSETS', 'ACM SIGACCESS Conference on Computers and Accessibility', 'ACM', 'http://dblp.uni-trier.de/db/conf/assets', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('558', 'GI', 'Graphics Interface conference', 'ACM', 'http://dblp.uni-trier.de/db/conf/graphicsinterface/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('559', 'UIC', 'IEEE International Conference on Ubiquitous Intelligence and Computing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/uic/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('560', 'nan', 'IEEE World Haptics Conference', 'IEEE', 'http://dblp.uni-trier.de/db/conf/haptics/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('561', 'INTERACT', 'IFIP TC13 Conference on Human-Computer Interaction', 'IFIP', 'http://dblp.uni-trier.de/db/conf/interact/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('562', 'IDC', 'Interaction Design and Children', 'ACM', 'http://dblp.uni-trier.de/db/conf/acmidc/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('563', 'CollaborateCom', 'International Conference on Collaborative Computing: Networking, Applications and Worksharing', 'Springer', 'http://collaboratecom.org', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('564', 'CSCWD', 'International Conference on Computer Supported Cooperative Work in Design', 'Springer', 'http://dblp.uni-trier.de/db/conf/cscwd/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('565', 'CoopIS', 'International Conference on Cooperative Information Systems', 'Springer', 'http://dblp.uni-trier.de/db/conf/coopis/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('566', 'MobiQuitous', 'International Conference on Mobile and Ubiquitous Systems: Computing, Networking and Services', 'Springer', 'http://dblp.uni-trier.de/db/conf/mobiquitous/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('567', 'AVI', 'International Working Conference on Advanced Visual Interfaces', 'ACM', 'http://dblp.uni-trier.de/db/conf/avi/', 'C', '人机交互与普适计算', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('568', 'JACM', 'Journal of the ACM', 'ACM', 'http://dblp.uni-trier.de/db/journals/jacm/', 'A', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('569', 'Proc. IEEE', 'Proceedings of the IEEE', 'IEEE', 'http://dblp.uni-trier.de/db/journals/pieee/', 'A', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('570', 'nan', 'Bioinformatics', 'Oxford University Press', 'http://dblp.uni-trier.de/db/journals/bioinformatics/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('571', 'nan', 'Briefings in Bioinformatics', 'Oxford University Press', 'http://dblp.uni-trier.de/db/journals/bib/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('572', 'Cognition', 'Cognition：International Journal of Cognitive Science', 'Elsevier', 'http://www.journals.elsevier.com/cognition/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('573', 'TASAE', 'IEEE Transactions on Automation Science and Engineering', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tase/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('574', 'TGARS', 'IEEE Transactions on Geoscience and Remote Sensing', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tgrs/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('575', 'TITS', 'IEEE Transactions on Intelligent Transportation Systems', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tits/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('576', 'TMI', 'IEEE Transactions on Medical Imaging', 'IEEE', 'http://dblp.uni-trier.de/db/journals/tmi/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('577', 'TR', 'IEEE Transactions on Robotics', 'IEEE', 'http://dblp.uni-trier.de/db/journals/trob/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('578', 'TCBB', 'IEEE-ACM Transactions on Computational Biology and Bioinformatics', 'IEEE/ACM', 'http://dblp.uni-trier.de/db/journals/tcbb/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('579', 'JCST', 'Journal of Computer Science and Technology', 'SCIENCE PRESS/Springer', 'http://dblp.uni-trier.de/db/journals/jcst/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('580', 'JAMIA', 'Journal of the American Medical Informatics Association', 'BMJ Journals', 'http://dblp.uni-trier.de/db/journals/jamia/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('581', 'nan', 'PLOS Computational Biology', 'Public Library of Science', 'http://dblp.uni-trier.de/db/journals/ploscb/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('582', 'nan', 'Science China Information Sciences', 'Science in China \nPress/Springer', 'http://dblp.uni-trier.de/db/journals/chinaf/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('583', 'nan', 'The Computer Journal', 'Oxford University Press', 'http://dblp.uni-trier.de/db/journals/cj/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('584', 'nan', 'World Wide Web Journal', 'Springer', 'http://dblp.uni-trier.de/db/journals/wwwj/', 'B', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('585', 'nan', 'BMC Bioinformatics', 'BioMed Central', 'http://dblp.uni-trier.de/db/journals/bmcbi/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('586', 'nan', 'Cybernetics and Systems', 'Taylor & Francis', 'http://dblp.uni-trier.de/db/journals/cas/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('587', 'FCS', 'Frontiers of Computer Science', 'Higher Education \nPress', 'http://dblp.uni-trier.de/db/journals/fcsc/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('588', 'nan', 'IEEE Geoscience and Remote Sensing Letters', 'IEEE', 'http://dblp.uni-trier.de/db/journals/lgrs/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('589', 'JBHI', 'IEEE Journal of Biomedical and Health Informatics', 'IEEE', 'http://dblp.uni-trier.de/db/journals/titb/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('590', 'TBD', 'IEEE Transactions on Big Data', 'IEEE', 'https://dblp.uni-trier.de/db/journals/tbd/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('591', 'nan', 'IET Intelligent Transport Systems', 'IET', 'http://digital-library.theiet.org/content/journals/iet-its', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('592', 'JBI', 'Journal of Biomedical Informatics', 'Elsevier', 'https://dblp.uni-trier.de/db/journals/jbi/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('593', 'nan', 'Medical Image Analysis', 'Elsevier', 'http://dblp.uni-trier.de/db/journals/mia/', 'C', '交叉/综合/新兴', '期刊');
INSERT INTO `dr_server_ccfinfo` VALUES ('594', 'WWW', 'International World Wide Web Conferences', 'ACM', 'http://dblp.uni-trier.de/db/conf/www/', 'A', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('595', 'RTSS', 'Real-Time Systems Symposium', 'IEEE', 'http://dblp.uni-trier.de/db/conf/rtss/', 'A', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('596', 'CogSci', 'Cognitive Science Society Annual Conference', 'Psychology Press', 'https://dblp.uni-trier.de/db/conf/cogsci/', 'B', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('597', 'BIBM', 'IEEE International Conference on Bioinformatics and Biomedicine', 'IEEE', 'http://dblp.uni-trier.de/db/conf/bibm/', 'B', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('598', 'EMSOFT', 'International Conference on Embedded Software', 'ACM/IEEE/IFIP', 'http://dblp.uni-trier.de/db/conf/emsoft/', 'B', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('599', 'ISMB', 'International conference on Intelligent Systems for Molecular Biology', 'Oxford Journals', 'http://www.iscb.org/about-ismb', 'B', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('600', 'RECOMB', 'International Conference on Research in Computational Molecular Biology', 'Springer', 'http://dblp.uni-trier.de/db/conf/recomb/', 'B', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('601', 'AMIA', 'American Medical Informatics Association Annual Symposium', 'AMIA', 'http://dblp.uni-trier.de/db/conf/amia/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('602', 'APBC', 'Asia Pacific Bioinformatics Conference', 'BioMed Central', 'http://dblp.uni-trier.de/db/conf/apbc/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('603', 'nan', 'IEEE International Conference on Big Data', 'IEEE', 'https://dblp.uni-trier.de/db/conf/bigdataconf/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('604', 'nan', 'IEEE International Conference on Cloud Computing', 'IEEE', 'http://dblp.uni-trier.de/db/conf/IEEEcloud/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('605', 'SMC', 'IEEE International Conference on Systems, Man, and Cybernetics', 'IEEE', 'https://dblp.uni-trier.de/db/conf/smc/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('606', 'COSIT', 'International Conference on Spatial Information Theory', 'ACM', 'http://dblp.uni-trier.de/db/conf/cosit/', 'C', '交叉/综合/新兴', '会议');
INSERT INTO `dr_server_ccfinfo` VALUES ('607', 'ISBRA', 'International Symposium on Bioinformatics Research and Applications', 'Springer', 'https://dblp.uni-trier.de/db/conf/isbra/', 'C', '交叉/综合/新兴', '会议');

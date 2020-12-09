/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-11-02 09:03:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `abcd`
-- ----------------------------
DROP TABLE IF EXISTS `abcd`;
CREATE TABLE `abcd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `img_url` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `from_id` int(11) DEFAULT NULL COMMENT '发送者',
  `to_id` int(11) DEFAULT NULL COMMENT '接收者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of abcd
-- ----------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'Admin', '700eeda71ec9806c37ae084ecad8c968', '15d4fa', '/assets/img/avatar.png', 'admin@admin.com', '0', '1603094312', '0.0.0.0', '1492186163', '1603094312', '5ac049c8-bbc2-4eab-a619-c551ae2df125', 'normal');

-- ----------------------------
-- Table structure for `admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES ('1', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_type/add?dialog=1', 'calorie 类别 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e3b\\u98df\",\"icon\":\"\\/assets\\/img\\/qrcode.png\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116691');
INSERT INTO `admin_log` VALUES ('2', '1', 'admin', '/test/public/ITqvmghAiM.php/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"b00d8803f033c0a8a94dac02b92434c6\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"calorie\",\"title\":\"\\u5361\\u8def\\u91cc\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116938');
INSERT INTO `admin_log` VALUES ('3', '1', 'admin', '/test/public/ITqvmghAiM.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116938');
INSERT INTO `admin_log` VALUES ('4', '1', 'admin', '/test/public/ITqvmghAiM.php/auth/rule/edit/ids/86?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"95ecbc925bd313d2012e0356ce0170fb\",\"row\":{\"ismenu\":\"1\",\"pid\":\"85\",\"name\":\"calorie\\/calorie_product\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"86\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116954');
INSERT INTO `admin_log` VALUES ('5', '1', 'admin', '/test/public/ITqvmghAiM.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116954');
INSERT INTO `admin_log` VALUES ('6', '1', 'admin', '/test/public/ITqvmghAiM.php/auth/rule/edit/ids/86?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ce0c193296ac15989edf4e5b43b74526\",\"row\":{\"ismenu\":\"1\",\"pid\":\"85\",\"name\":\"calorie\\/calorie_product\",\"title\":\"\\u4ea7\\u54c1\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"86\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116968');
INSERT INTO `admin_log` VALUES ('7', '1', 'admin', '/test/public/ITqvmghAiM.php/index/index', '', '{\"action\":\"refreshmenu\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116968');
INSERT INTO `admin_log` VALUES ('8', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_product/add?dialog=1', '卡路里管理 产品 添加', '{\"dialog\":\"1\",\"row\":{\"cover_img\":\"\",\"name\":\"\",\"kcal\":\"\",\"suggestion\":\"\",\"remark\":\"\",\"unit\":\"\",\"carbohydrate\":\"\",\"protein\":\"\",\"fat\":\"\",\"eatfiber\":\"\",\"vitaminA\":\"1\",\"vitaminC\":\"\",\"vitaminE\":\"\",\"carotene\":\"\",\"vitaminB1\":\"\",\"vitaminB2\":\"\",\"niacin\":\"\",\"cholesterol\":\"\",\"magnesium\":\"\",\"calcium\":\"\",\"iron\":\"\",\"zinc\":\"\",\"copper\":\"\",\"manganese\":\"\",\"potassium\":\"\",\"phosphorus\":\"\",\"sodium\":\"\",\"selenium\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116977');
INSERT INTO `admin_log` VALUES ('9', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_product/del/ids/0', '卡路里管理 产品 删除', '{\"action\":\"del\",\"ids\":\"0\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595116981');
INSERT INTO `admin_log` VALUES ('10', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_product/del/ids/1', '卡路里管理 产品 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117010');
INSERT INTO `admin_log` VALUES ('11', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_product/add?dialog=1', '卡路里管理 产品 添加', '{\"dialog\":\"1\",\"row\":{\"cover_img\":\"\\/assets\\/img\\/qrcode.png\",\"name\":\"\\u9762\\u6761\",\"kcal\":\"10\",\"suggestion\":\"\",\"remark\":\"100\\u514b=2.2\\u7c73\\u996d\",\"unit\":\"\\u514b\",\"carbohydrate\":\"\",\"protein\":\"\",\"fat\":\"\",\"eatfiber\":\"\",\"vitaminA\":\"1\",\"vitaminC\":\"\",\"vitaminE\":\"\",\"carotene\":\"\",\"vitaminB1\":\"\",\"vitaminB2\":\"\",\"niacin\":\"\",\"cholesterol\":\"\",\"magnesium\":\"\",\"calcium\":\"\",\"iron\":\"\",\"zinc\":\"\",\"copper\":\"\",\"manganese\":\"\",\"potassium\":\"\",\"phosphorus\":\"\",\"sodium\":\"\",\"selenium\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117120');
INSERT INTO `admin_log` VALUES ('12', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117536');
INSERT INTO `admin_log` VALUES ('13', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117565');
INSERT INTO `admin_log` VALUES ('14', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117587');
INSERT INTO `admin_log` VALUES ('15', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/calorie_product/edit/ids/2?dialog=1', '卡路里管理 产品 编辑', '{\"dialog\":\"1\",\"row\":{\"cover_img\":\"\\/assets\\/img\\/qrcode.png\",\"name\":\"\\u9762\\u6761\",\"type_id\":\"1\",\"kcal\":\"10\",\"suggestion\":\"\",\"remark\":\"100\\u514b=2.2\\u7c73\\u996d\",\"unit\":\"\\u514b\",\"carbohydrate\":\"\",\"protein\":\"\",\"fat\":\"\",\"eatfiber\":\"\",\"vitaminA\":\"1\",\"vitaminC\":\"\",\"vitaminE\":\"\",\"carotene\":\"\",\"vitaminB1\":\"\",\"vitaminB2\":\"\",\"niacin\":\"\",\"cholesterol\":\"\",\"magnesium\":\"\",\"calcium\":\"\",\"iron\":\"\",\"zinc\":\"\",\"copper\":\"\",\"manganese\":\"\",\"potassium\":\"\",\"phosphorus\":\"\",\"sodium\":\"\",\"selenium\":\"\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117588');
INSERT INTO `admin_log` VALUES ('16', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595117590');
INSERT INTO `admin_log` VALUES ('17', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/dashboard?ref=addtabs\",\"__token__\":\"e096a9dbfdce76328cb7b0af34034e27\",\"username\":\"admin\",\"captcha\":\"t2qn\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '1595229437');
INSERT INTO `admin_log` VALUES ('18', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"d1c61bfdab729ea73f4f6bfc9e7ae7d6\",\"username\":\"admin\",\"captcha\":\"5nzn\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597802938');
INSERT INTO `admin_log` VALUES ('19', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"08bb6ab8673440f9b2833acdcf1fecc8\",\"username\":\"admin\",\"captcha\":\"7tkd\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597802944');
INSERT INTO `admin_log` VALUES ('20', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"1b2c196d3d370dc87dad81de9c7761b4\",\"username\":\"admin\",\"captcha\":\"3nnb\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597802948');
INSERT INTO `admin_log` VALUES ('21', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login', '登录', '{\"__token__\":\"c59a84e44ffc9f7b421cfae1ea546abc\",\"username\":\"admin\",\"captcha\":\"tgvv\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597815085');
INSERT INTO `admin_log` VALUES ('22', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597815141');
INSERT INTO `admin_log` VALUES ('23', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597815667');
INSERT INTO `admin_log` VALUES ('24', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login', '', '{\"__token__\":\"26d78c92664f2c07908cf3addf70f646\",\"username\":\"admin\",\"captcha\":\"nmum\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597816158');
INSERT INTO `admin_log` VALUES ('25', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login', '', '{\"__token__\":\"e79b2d79e9b0715f3f206baeece28ae5\",\"username\":\"admin\",\"captcha\":\"crhp\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597816162');
INSERT INTO `admin_log` VALUES ('26', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login', '登录', '{\"__token__\":\"c49e71a923341eb66c9bec71d7f0a94e\",\"username\":\"admin\",\"captcha\":\"5qww\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597816165');
INSERT INTO `admin_log` VALUES ('27', '1', 'admin', '/test/public/ITqvmghAiM.php/calorie/Calorie_Type', '卡路里管理 类别 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597816280');
INSERT INTO `admin_log` VALUES ('28', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login', '登录', '{\"__token__\":\"876cd3d9b1e9972618c73706899d1038\",\"username\":\"admin\",\"captcha\":\"cq77\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1597820276');
INSERT INTO `admin_log` VALUES ('29', '0', 'Unknown', '/test/public/index.php/admin/index/login?url=%2Ftest%2Fpublic%2Findex.php%2Fadmin', '', '{\"url\":\"\\/test\\/public\\/index.php\\/admin\",\"__token__\":\"395c8af3c865f7dbae5045312f7d285a\",\"username\":\"admin\",\"captcha\":\"urgq\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599187820');
INSERT INTO `admin_log` VALUES ('30', '0', 'Unknown', '/test/public/index.php/admin/index/login?url=%2Ftest%2Fpublic%2Findex.php%2Fadmin', '', '{\"url\":\"\\/test\\/public\\/index.php\\/admin\",\"__token__\":\"f9b9e92254943a4a6e1f5a76747911b4\",\"username\":\"admin\",\"captcha\":\"ef4m\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599187823');
INSERT INTO `admin_log` VALUES ('31', '0', 'Unknown', '/test/public/index.php/admin/index/login?url=%2Ftest%2Fpublic%2Findex.php%2Fadmin', '登录', '{\"url\":\"\\/test\\/public\\/index.php\\/admin\",\"__token__\":\"48032446c7f94e8e891b517b637667a7\",\"username\":\"admin\",\"captcha\":\"ekck\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599187827');
INSERT INTO `admin_log` VALUES ('32', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"405e796f265d290822c17ba80710fd68\",\"username\":\"admin\",\"captcha\":\"7cvh\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599187871');
INSERT INTO `admin_log` VALUES ('33', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"0dc005234affb3de696a855a12906e62\",\"username\":\"admin\",\"captcha\":\"2zfq\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599187890');
INSERT INTO `admin_log` VALUES ('34', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5f20\\u4e09\",\"major\":\"\\u9aa8\\u79d1\",\"position\":\"\\u4e3b\\u6cbb\\u533b\\u751f\",\"hospital\":\"\\u4fdd\\u5b9a\\u4eba\\u6c11\\u533b\\u9662\",\"username\":\"admin\",\"password\":\"123456\",\"img_url\":\"\\/assets\\/img\\/qrcode.png\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599270482');
INSERT INTO `admin_log` VALUES ('35', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/multi/ids/1', '会员管理 医生账号 批量更新', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"state=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599270798');
INSERT INTO `admin_log` VALUES ('36', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\",\"major\":\"1\",\"position\":\"1\",\"hospital\":\"1\",\"username\":\"admin\",\"password\":\"123456\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599270824');
INSERT INTO `admin_log` VALUES ('37', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/del/ids/2', '会员管理 医生账号 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599270830');
INSERT INTO `admin_log` VALUES ('38', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"admin\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271017');
INSERT INTO `admin_log` VALUES ('39', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"admin\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271018');
INSERT INTO `admin_log` VALUES ('40', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"admin1\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271021');
INSERT INTO `admin_log` VALUES ('41', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/del/ids/3', '会员管理 医生账号 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271024');
INSERT INTO `admin_log` VALUES ('42', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"admin\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271047');
INSERT INTO `admin_log` VALUES ('43', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"admin\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271048');
INSERT INTO `admin_log` VALUES ('44', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/add?dialog=1', '会员管理 医生账号 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"major\":\"\",\"position\":\"\",\"hospital\":\"\",\"username\":\"\",\"password\":\"1234567\",\"img_url\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271050');
INSERT INTO `admin_log` VALUES ('45', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/del/ids/4', '会员管理 医生账号 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271053');
INSERT INTO `admin_log` VALUES ('46', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fuser%2Fuser%3Fref%3Daddtabs', '', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/user\\/user?ref=addtabs\",\"__token__\":\"776d853e6ad975df7681ab427969f8c6\",\"username\":\"admin\",\"captcha\":\"76oh\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271907');
INSERT INTO `admin_log` VALUES ('47', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fuser%2Fuser%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/user\\/user?ref=addtabs\",\"__token__\":\"47eafcd5201f490591fa293859b80026\",\"username\":\"admin\",\"captcha\":\"4rbw\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599271912');
INSERT INTO `admin_log` VALUES ('48', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599272892');
INSERT INTO `admin_log` VALUES ('49', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599273423');
INSERT INTO `admin_log` VALUES ('50', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599273425');
INSERT INTO `admin_log` VALUES ('51', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599273462');
INSERT INTO `admin_log` VALUES ('52', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"name\":\"1\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599273465');
INSERT INTO `admin_log` VALUES ('53', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287653');
INSERT INTO `admin_log` VALUES ('54', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287711');
INSERT INTO `admin_log` VALUES ('55', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287749');
INSERT INTO `admin_log` VALUES ('56', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287805');
INSERT INTO `admin_log` VALUES ('57', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287862');
INSERT INTO `admin_log` VALUES ('58', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287869');
INSERT INTO `admin_log` VALUES ('59', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287871');
INSERT INTO `admin_log` VALUES ('60', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287915');
INSERT INTO `admin_log` VALUES ('61', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/uid/1/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"doctor_id\":\"1\",\"id\":\"3\"},\"uid\":\"1\",\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599287917');
INSERT INTO `admin_log` VALUES ('62', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288006');
INSERT INTO `admin_log` VALUES ('63', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288085');
INSERT INTO `admin_log` VALUES ('64', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/id/1/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"doctor_id\":\"1\",\"id\":\"3\"},\"id\":\"1\",\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288088');
INSERT INTO `admin_log` VALUES ('65', '1', 'admin', '/test/public/ITqvmghAiM.php/user/user/choose/id/1/ids/1?dialog=1', '会员管理 患者', '{\"dialog\":\"1\",\"row\":{\"doctor_id\":\"1\",\"id\":\"3\"},\"id\":\"1\",\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288181');
INSERT INTO `admin_log` VALUES ('66', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288185');
INSERT INTO `admin_log` VALUES ('67', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288188');
INSERT INTO `admin_log` VALUES ('68', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599288208');
INSERT INTO `admin_log` VALUES ('69', '1', 'admin', '/test/public/ITqvmghAiM.php/ajax/upload', '', '{\"name\":\"gh_1d377e39bb4c_258.jpg\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599294597');
INSERT INTO `admin_log` VALUES ('70', '1', 'admin', '/test/public/ITqvmghAiM.php/ajax/upload', '', '{\"name\":\"kfewm.png\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599294598');
INSERT INTO `admin_log` VALUES ('71', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor/index', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599294728');
INSERT INTO `admin_log` VALUES ('72', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/add?dialog=1', '养治计划 添加', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\\/uploads\\/20200905\\/b19bde32f817c337fe82975c8d9ddcc2.png,\\/uploads\\/20200905\\/0d49e2c251d5b7f1add16008b721d4ac.jpg\",\"introduce\":\"\\u60c5\\u6211\\u8da3\\u5de5\\u4f5c\",\"remark\":\"11\",\"doctor_id\":\"1\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599294732');
INSERT INTO `admin_log` VALUES ('73', '0', 'Unknown', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fuser%2Fuser%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/user\\/user?ref=addtabs\",\"__token__\":\"6d61bc6ec427618aadf71d0176d9a9c0\",\"username\":\"admin\",\"captcha\":\"AGMY\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599442298');
INSERT INTO `admin_log` VALUES ('74', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fuser%2Fuser%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/user\\/user?ref=addtabs\",\"__token__\":\"fa0ee7d2c5ba90568837ebb36e8ef275\",\"username\":\"admin\",\"captcha\":\"hk45\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599442311');
INSERT INTO `admin_log` VALUES ('75', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php%2Fuser%2Fuser%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\\/user\\/user?ref=addtabs\",\"__token__\":\"e04ec89b1e8f9a2c02abaaac8a09adfc\",\"username\":\"admin\",\"captcha\":\"yAFB\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599443088');
INSERT INTO `admin_log` VALUES ('76', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/add?dialog=1', '养治计划 添加', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\",\"introduce\":\"\",\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599447522');
INSERT INTO `admin_log` VALUES ('77', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/del/ids/1', '养治计划 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599447526');
INSERT INTO `admin_log` VALUES ('78', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/add?dialog=1', '养治计划 添加', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\",\"introduce\":\"\",\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599447532');
INSERT INTO `admin_log` VALUES ('79', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/edit/ids/2?dialog=1', '养治计划 编辑', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\\/uploads\\/20200905\\/b19bde32f817c337fe82975c8d9ddcc2.png,\\/uploads\\/20200905\\/0d49e2c251d5b7f1add16008b721d4ac.jpg\",\"introduce\":\"ww\",\"remark\":\"www\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599447550');
INSERT INTO `admin_log` VALUES ('80', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"c88e1ca2d0035ebc58df95f050529ea4\",\"username\":\"admin\",\"captcha\":\"vvha\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 UBrowser/6.2.4098.3 Safari/537.36', '1599700812');
INSERT INTO `admin_log` VALUES ('81', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"26f93c400eca3a1b7f4579dc0640e0a9\",\"username\":\"admin\",\"captcha\":\"ffx8\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600652724');
INSERT INTO `admin_log` VALUES ('82', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600652743');
INSERT INTO `admin_log` VALUES ('83', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600667164');
INSERT INTO `admin_log` VALUES ('84', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600667165');
INSERT INTO `admin_log` VALUES ('85', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600667167');
INSERT INTO `admin_log` VALUES ('86', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"7408f06f0b5d543d31ed82d5c44039b9\",\"username\":\"admin\",\"captcha\":\"fc2h\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600738982');
INSERT INTO `admin_log` VALUES ('87', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/edit/ids/2?dialog=1', '养治计划 编辑', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\\/uploads\\/20200905\\/b19bde32f817c337fe82975c8d9ddcc2.png,\\/uploads\\/20200905\\/0d49e2c251d5b7f1add16008b721d4ac.jpg\",\"introduce\":\"ww12121\",\"remark\":\"www\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600740799');
INSERT INTO `admin_log` VALUES ('88', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/edit/ids/2?dialog=1', '养治计划 编辑', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\\/uploads\\/20200905\\/b19bde32f817c337fe82975c8d9ddcc2.png,\\/uploads\\/20200905\\/0d49e2c251d5b7f1add16008b721d4ac.jpg\",\"introduce\":\"12\",\"remark\":\"www\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600740937');
INSERT INTO `admin_log` VALUES ('89', '1', 'admin', '/test/public/ITqvmghAiM.php/plan/edit/ids/2?dialog=1', '养治计划 编辑', '{\"dialog\":\"1\",\"row\":{\"img_url\":\"\\/uploads\\/20200905\\/b19bde32f817c337fe82975c8d9ddcc2.png,\\/uploads\\/20200905\\/0d49e2c251d5b7f1add16008b721d4ac.jpg\",\"introduce\":\"ww121214\",\"remark\":\"www\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600740959');
INSERT INTO `admin_log` VALUES ('90', '1', 'admin', '/test/public/ITqvmghAiM.php/user/doctor', '会员管理 医生账号 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600754566');
INSERT INTO `admin_log` VALUES ('91', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"7adfd9cdbf4292c2474d6ac1eb7a884f\",\"username\":\"admin\",\"captcha\":\"qhw6\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600829277');
INSERT INTO `admin_log` VALUES ('92', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"5ac8acbfce685a9eaa49e6f05ddbe05c\",\"username\":\"admin\",\"captcha\":\"vncf\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1600911866');
INSERT INTO `admin_log` VALUES ('93', '1', 'admin', '/test/public/ITqvmghAiM.php/index/login?url=%2Ftest%2Fpublic%2FITqvmghAiM.php', '登录', '{\"url\":\"\\/test\\/public\\/ITqvmghAiM.php\",\"__token__\":\"15cd61adea957b23be31075255a7586b\",\"username\":\"admin\",\"captcha\":\"zphl\",\"keeplogin\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', '1603094312');

-- ----------------------------
-- Table structure for `archives`
-- ----------------------------
DROP TABLE IF EXISTS `archives`;
CREATE TABLE `archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `img_url` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL COMMENT '患者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='档案';

-- ----------------------------
-- Records of archives
-- ----------------------------

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `attachment` VALUES ('2', '1', '0', '/uploads/20200905/0d49e2c251d5b7f1add16008b721d4ac.jpg', '258', '258', 'jpg', '0', '49646', 'image/jpeg', '{\"name\":\"gh_1d377e39bb4c_258.jpg\"}', '1599294597', '1599294597', '1599294597', 'local', 'f9e85f88aa6ff1c07b649f9e135db2771966f80a');
INSERT INTO `attachment` VALUES ('3', '1', '0', '/uploads/20200905/b19bde32f817c337fe82975c8d9ddcc2.png', '1742', '2751', 'png', '0', '73356', 'image/png', '{\"name\":\"kfewm.png\"}', '1599294598', '1599294598', '1599294598', 'local', '1723efab116f871c4cc20ae40296f401ed0bf524');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for `auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '143', 'normal');
INSERT INTO `auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-leaf', '', 'Category tips', '1', '1497429920', '1497429920', '119', 'normal');
INSERT INTO `auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('59', 'file', '4', 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('73', 'file', '66', 'user/group', 'User group', 'fa fa-users', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('74', 'file', '73', 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('75', 'file', '73', 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('76', 'file', '73', 'user/group/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('77', 'file', '73', 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('78', 'file', '73', 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('79', 'file', '66', 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('80', 'file', '79', 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('81', 'file', '79', 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('82', 'file', '79', 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('83', 'file', '79', 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('84', 'file', '79', 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('85', 'file', '0', 'calorie', '卡路里管理', 'fa fa-list', '', '', '1', '1595116557', '1595116937', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('86', 'file', '85', 'calorie/calorie_product', '产品', 'fa fa-circle-o', '', '', '1', '1595116557', '1595116967', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('87', 'file', '86', 'calorie/calorie_product/index', '查看', 'fa fa-circle-o', '', '', '0', '1595116557', '1595116557', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('88', 'file', '86', 'calorie/calorie_product/add', '添加', 'fa fa-circle-o', '', '', '0', '1595116557', '1595116557', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('89', 'file', '86', 'calorie/calorie_product/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1595116557', '1595116557', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('90', 'file', '86', 'calorie/calorie_product/del', '删除', 'fa fa-circle-o', '', '', '0', '1595116557', '1595116557', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('91', 'file', '86', 'calorie/calorie_product/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1595116557', '1595116557', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('92', 'file', '85', 'calorie/calorie_type', '类别', 'fa fa-circle-o', '', '', '1', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('93', 'file', '92', 'calorie/calorie_type/index', '查看', 'fa fa-circle-o', '', '', '0', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('94', 'file', '92', 'calorie/calorie_type/add', '添加', 'fa fa-circle-o', '', '', '0', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('95', 'file', '92', 'calorie/calorie_type/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('96', 'file', '92', 'calorie/calorie_type/del', '删除', 'fa fa-circle-o', '', '', '0', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('97', 'file', '92', 'calorie/calorie_type/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1595116562', '1595116562', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('104', 'file', '66', 'user/doctor', '医生账号', 'fa fa-circle-o', '', '', '1', '1599270295', '1599270295', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('105', 'file', '104', 'user/doctor/index', '查看', 'fa fa-circle-o', '', '', '0', '1599270296', '1599270296', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('106', 'file', '104', 'user/doctor/add', '添加', 'fa fa-circle-o', '', '', '0', '1599270296', '1599270296', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('107', 'file', '104', 'user/doctor/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1599270296', '1599270296', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('108', 'file', '104', 'user/doctor/del', '删除', 'fa fa-circle-o', '', '', '0', '1599270296', '1599270296', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('109', 'file', '104', 'user/doctor/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1599270296', '1599270296', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('116', 'file', '66', 'user/user', '患者', 'fa fa-user', '', '', '1', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('117', 'file', '116', 'user/user/index', '查看', 'fa fa-circle-o', '', '', '0', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('118', 'file', '116', 'user/user/add', '添加', 'fa fa-circle-o', '', '', '0', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('119', 'file', '116', 'user/user/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('120', 'file', '116', 'user/user/del', '删除', 'fa fa-circle-o', '', '', '0', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('121', 'file', '116', 'user/user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1599271808', '1599271808', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('122', 'file', '0', 'plan', '养治计划', 'fa fa-circle-o', '', '', '1', '1599294131', '1599294131', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('123', 'file', '122', 'plan/index', '查看', 'fa fa-circle-o', '', '', '0', '1599294131', '1599294131', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('124', 'file', '122', 'plan/add', '添加', 'fa fa-circle-o', '', '', '0', '1599294131', '1599294131', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('125', 'file', '122', 'plan/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1599294131', '1599294131', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('126', 'file', '122', 'plan/del', '删除', 'fa fa-circle-o', '', '', '0', '1599294131', '1599294131', '0', 'normal');
INSERT INTO `auth_rule` VALUES ('127', 'file', '122', 'plan/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1599294131', '1599294131', '0', 'normal');

-- ----------------------------
-- Table structure for `calorie_product`
-- ----------------------------
DROP TABLE IF EXISTS `calorie_product`;
CREATE TABLE `calorie_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面图',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `kcal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '热量',
  `suggestion` text COLLATE utf8mb4_unicode_ci COMMENT '饮食建议',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位',
  `carbohydrate` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '碳水化合物',
  `protein` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '蛋白质',
  `fat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脂肪',
  `eatfiber` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '膳食纤维',
  `vitaminA` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维生素A',
  `vitaminC` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维生素C',
  `vitaminE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维生素E',
  `carotene` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '胡萝卜素',
  `vitaminB1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维生素B1',
  `vitaminB2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维生素B2',
  `niacin` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '烟酸',
  `cholesterol` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '胆固醇',
  `magnesium` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镁',
  `calcium` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '钙',
  `iron` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '铁',
  `zinc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '锌',
  `copper` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '铜',
  `manganese` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '锰',
  `potassium` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '钾',
  `phosphorus` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '磷',
  `sodium` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '钠',
  `selenium` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 硒',
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calorie_product
-- ----------------------------
INSERT INTO `calorie_product` VALUES ('2', '/assets/img/qrcode.png', '面条', '10', '', '100克=2.2米饭', '克', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for `calorie_type`
-- ----------------------------
DROP TABLE IF EXISTS `calorie_type`;
CREATE TABLE `calorie_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类别名称',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='类别';

-- ----------------------------
-- Records of calorie_type
-- ----------------------------
INSERT INTO `calorie_type` VALUES ('1', '主食', '/assets/img/qrcode.png');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', '1495262190', '1495262190', '1', 'normal');
INSERT INTO `category` VALUES ('2', '0', 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', '1495262244', '1495262244', '2', 'normal');
INSERT INTO `category` VALUES ('3', '2', 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', '1495262288', '1495262288', '3', 'normal');
INSERT INTO `category` VALUES ('4', '2', 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', '1495262317', '1495262317', '4', 'normal');
INSERT INTO `category` VALUES ('5', '0', 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', '1495262336', '1499681850', '5', 'normal');
INSERT INTO `category` VALUES ('6', '5', 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', '1495262357', '1495262357', '6', 'normal');
INSERT INTO `category` VALUES ('7', '5', 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', '1495262391', '1495262391', '7', 'normal');
INSERT INTO `category` VALUES ('8', '6', 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', '1495262424', '1495262424', '8', 'normal');
INSERT INTO `category` VALUES ('9', '6', 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', '1495262456', '1495262456', '9', 'normal');
INSERT INTO `category` VALUES ('10', '7', 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', '1495262487', '1495262487', '10', 'normal');
INSERT INTO `category` VALUES ('11', '7', 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', '1495262515', '1495262515', '11', 'normal');
INSERT INTO `category` VALUES ('12', '0', 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', '1497015727', '1497015727', '12', 'normal');
INSERT INTO `category` VALUES ('13', '0', 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', '1497015738', '1497015738', '13', 'normal');

-- ----------------------------
-- Table structure for `chat_mes`
-- ----------------------------
DROP TABLE IF EXISTS `chat_mes`;
CREATE TABLE `chat_mes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `dietitian_id` int(11) DEFAULT NULL COMMENT '营养师',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天管理';

-- ----------------------------
-- Records of chat_mes
-- ----------------------------

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', '网站', '', 'required', '');
INSERT INTO `config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for `dietitian`
-- ----------------------------
DROP TABLE IF EXISTS `dietitian`;
CREATE TABLE `dietitian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '头像',
  `section` varchar(30) DEFAULT NULL COMMENT '部门',
  `position` varchar(30) DEFAULT NULL COMMENT '职位',
  `hospital` varchar(50) DEFAULT NULL COMMENT '医院',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='营养师管理';

-- ----------------------------
-- Records of dietitian
-- ----------------------------

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `major` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职位',
  `hospital` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医院',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `state` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医生账号';

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '张三', '骨科', '主治医生', '保定人民医院', 'admin', '123456', '/assets/img/qrcode.png', '1');

-- ----------------------------
-- Table structure for `doctor_mes`
-- ----------------------------
DROP TABLE IF EXISTS `doctor_mes`;
CREATE TABLE `doctor_mes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createtime` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL COMMENT '医生ID',
  `is_look` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '是否观看',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息列表';

-- ----------------------------
-- Records of doctor_mes
-- ----------------------------

-- ----------------------------
-- Table structure for `ems`
-- ----------------------------
DROP TABLE IF EXISTS `ems`;
CREATE TABLE `ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of ems
-- ----------------------------

-- ----------------------------
-- Table structure for `files`
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `img_url` text COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='档案';

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `createtime` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息列表';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `plan`
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` text COLLATE utf8mb4_unicode_ci COMMENT '轮播图',
  `introduce` text COLLATE utf8mb4_unicode_ci COMMENT '服务介绍',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '服务特色',
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='养治计划';

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('2', '/uploads/20200905/b19bde32f817c337fe82975c8d9ddcc2.png,/uploads/20200905/0d49e2c251d5b7f1add16008b721d4ac.jpg', 'ww121214', 'www', null);

-- ----------------------------
-- Table structure for `real_chat`
-- ----------------------------
DROP TABLE IF EXISTS `real_chat`;
CREATE TABLE `real_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `send_type` int(11) DEFAULT '1' COMMENT '发送的类型 1为文字 2为图片',
  `createtime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发送时间',
  `send_id` int(11) DEFAULT NULL COMMENT '发送者',
  `to_id` int(11) DEFAULT NULL COMMENT '接收者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天信息';

-- ----------------------------
-- Records of real_chat
-- ----------------------------
INSERT INTO `real_chat` VALUES ('1', '内容', null, '1561467242', '1', '1');
INSERT INTO `real_chat` VALUES ('2', 'neirogn', '1', '1600675581', '1', '1');
INSERT INTO `real_chat` VALUES ('3', 'neirogn', '1', '1600675599', '1', '1');
INSERT INTO `real_chat` VALUES ('4', 'neirogn', '2', '1600675747', '1', '1');

-- ----------------------------
-- Table structure for `sms`
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';

-- ----------------------------
-- Records of sms
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '0', '12', '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '0.00', '0', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', '1499682285', '1499682526', '1499682526', null, '0', '1', 'normal', '1');

-- ----------------------------
-- Table structure for `test_report`
-- ----------------------------
DROP TABLE IF EXISTS `test_report`;
CREATE TABLE `test_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `img_url` text COLLATE utf8mb4_unicode_ci,
  `archives_id` int(11) DEFAULT NULL COMMENT '档案ID',
  `user_id` int(11) DEFAULT NULL COMMENT '患者ID',
  PRIMARY KEY (`id`),
  KEY `a_id` (`archives_id`),
  CONSTRAINT `a_id` FOREIGN KEY (`archives_id`) REFERENCES `archives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检报告';

-- ----------------------------
-- Records of test_report
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '患者名称',
  `img_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '患者头像',
  `mobile` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `district` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `openid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='患者';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李四', null, '13231906493', '河北省', '保定', '莲池', '男', 'adasdwjal64sadsa');

-- ----------------------------
-- Table structure for `user_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `user_doctor`;
CREATE TABLE `user_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='患者对应医生关系';

-- ----------------------------
-- Records of user_doctor
-- ----------------------------
INSERT INTO `user_doctor` VALUES ('4', null, null);
INSERT INTO `user_doctor` VALUES ('3', '1', '1');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', '1515386468', '1516168298', 'normal');

-- ----------------------------
-- Table structure for `user_money_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_money_log`;
CREATE TABLE `user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';

-- ----------------------------
-- Records of user_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for `user_rule`
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';

-- ----------------------------
-- Records of user_rule
-- ----------------------------
INSERT INTO `user_rule` VALUES ('1', '0', 'index', '前台', '', '1', '1516168079', '1516168079', '1', 'normal');
INSERT INTO `user_rule` VALUES ('2', '0', 'api', 'API接口', '', '1', '1516168062', '1516168062', '2', 'normal');
INSERT INTO `user_rule` VALUES ('3', '1', 'user', '会员模块', '', '1', '1515386221', '1516168103', '12', 'normal');
INSERT INTO `user_rule` VALUES ('4', '2', 'user', '会员模块', '', '1', '1515386221', '1516168092', '11', 'normal');
INSERT INTO `user_rule` VALUES ('5', '3', 'index/user/login', '登录', '', '0', '1515386247', '1515386247', '5', 'normal');
INSERT INTO `user_rule` VALUES ('6', '3', 'index/user/register', '注册', '', '0', '1515386262', '1516015236', '7', 'normal');
INSERT INTO `user_rule` VALUES ('7', '3', 'index/user/index', '会员中心', '', '0', '1516015012', '1516015012', '9', 'normal');
INSERT INTO `user_rule` VALUES ('8', '3', 'index/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '4', 'normal');
INSERT INTO `user_rule` VALUES ('9', '4', 'api/user/login', '登录', '', '0', '1515386247', '1515386247', '6', 'normal');
INSERT INTO `user_rule` VALUES ('10', '4', 'api/user/register', '注册', '', '0', '1515386262', '1516015236', '8', 'normal');
INSERT INTO `user_rule` VALUES ('11', '4', 'api/user/index', '会员中心', '', '0', '1516015012', '1516015012', '10', 'normal');
INSERT INTO `user_rule` VALUES ('12', '4', 'api/user/profile', '个人资料', '', '0', '1516015012', '1516015012', '3', 'normal');

-- ----------------------------
-- Table structure for `user_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_score_log`;
CREATE TABLE `user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';

-- ----------------------------
-- Records of user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for `user_token`
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';

-- ----------------------------
-- Records of user_token
-- ----------------------------

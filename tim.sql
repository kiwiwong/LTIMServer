/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : tim

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 20/03/2018 15:05:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ghistorymessage
-- ----------------------------
DROP TABLE IF EXISTS `ghistorymessage`;
CREATE TABLE `ghistorymessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroupid` int(11) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `usergroupid`(`usergroupid`) USING BTREE,
  CONSTRAINT `ghistorymessage_ibfk_3` FOREIGN KEY (`usergroupid`) REFERENCES `usergroup` (`usergroupid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ghistorymessage
-- ----------------------------
INSERT INTO `ghistorymessage` VALUES (1, 2, 'saafafdasd', NULL);
INSERT INTO `ghistorymessage` VALUES (3, 21, '呃呃呃呃呃呃', '2018-03-20 14:37:05');
INSERT INTO `ghistorymessage` VALUES (4, 3, '哈哈哈哈', '2018-03-20 14:37:21');
INSERT INTO `ghistorymessage` VALUES (5, 3, '有人么？', '2018-03-20 14:38:27');
INSERT INTO `ghistorymessage` VALUES (6, 21, '有', '2018-03-20 14:38:37');

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupintroduce` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`groupid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (-1, '总群', 'welcome', 'img/touxiang.jpg');

-- ----------------------------
-- Table structure for ptphismes
-- ----------------------------
DROP TABLE IF EXISTS `ptphismes`;
CREATE TABLE `ptphismes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NULL DEFAULT NULL,
  `receiver` int(11) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stime` datetime(0) NULL DEFAULT NULL,
  `isSend` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ptphismes
-- ----------------------------
INSERT INTO `ptphismes` VALUES (77, 6, 2, '6666666666666', '2017-12-27 13:22:21', b'1');
INSERT INTO `ptphismes` VALUES (78, 2, 6, '444444444444444', '2017-12-27 13:22:31', b'1');
INSERT INTO `ptphismes` VALUES (79, 2, 6, '5555555555', '2017-12-27 13:22:55', b'1');
INSERT INTO `ptphismes` VALUES (80, 6, 2, '333333333333', '2017-12-27 13:23:05', b'1');
INSERT INTO `ptphismes` VALUES (81, 2, 6, '77777777777777', '2017-12-27 13:23:16', b'1');
INSERT INTO `ptphismes` VALUES (82, 6, 2, '88888888888888', '2017-12-27 13:23:30', b'1');
INSERT INTO `ptphismes` VALUES (83, 2, 6, '999999999999999999', '2017-12-27 13:23:37', b'1');
INSERT INTO `ptphismes` VALUES (84, 6, 2, '000000000000', '2017-12-27 13:23:44', b'1');
INSERT INTO `ptphismes` VALUES (85, 2, 6, '111111111111111', '2017-12-27 13:24:13', b'1');
INSERT INTO `ptphismes` VALUES (86, 6, 2, '222222222222', '2017-12-27 13:24:31', b'1');
INSERT INTO `ptphismes` VALUES (87, 2, 6, '44444444444444', '2017-12-27 13:24:36', b'1');
INSERT INTO `ptphismes` VALUES (88, 6, 2, '2333333333', '2017-12-27 13:25:28', b'1');
INSERT INTO `ptphismes` VALUES (89, 6, 2, '2222222222', '2017-12-27 13:37:48', b'1');
INSERT INTO `ptphismes` VALUES (90, 2, 6, 'dfsfsdfsdfs', '2017-12-27 13:38:08', b'1');
INSERT INTO `ptphismes` VALUES (91, 6, 2, 'sdfsfsfsdfsf', '2017-12-27 13:38:12', b'1');
INSERT INTO `ptphismes` VALUES (92, 2, 6, 'sdfsdfsdfsdf', '2017-12-27 13:39:15', b'1');
INSERT INTO `ptphismes` VALUES (93, 6, 2, 'sdfsdfsdfsdf', '2017-12-27 13:39:22', b'1');
INSERT INTO `ptphismes` VALUES (94, 2, 6, 'sdfsdfsdfsdfs', '2017-12-27 13:39:26', b'1');
INSERT INTO `ptphismes` VALUES (95, 6, 2, 'dfsdfsdfsdfsdfsdf', '2017-12-27 13:39:43', b'1');
INSERT INTO `ptphismes` VALUES (96, 1, 2, 'hello', '2017-12-27 15:00:36', b'0');
INSERT INTO `ptphismes` VALUES (97, 1, 2, 'hello', '2017-12-27 15:00:36', b'1');
INSERT INTO `ptphismes` VALUES (98, 2, 1, '啊啊啊', '2017-12-27 15:01:08', b'0');
INSERT INTO `ptphismes` VALUES (99, 2, 1, '啊啊啊', '2017-12-27 15:01:08', b'1');
INSERT INTO `ptphismes` VALUES (100, 1, 2, '有什么问题', '2017-12-27 15:01:16', b'0');
INSERT INTO `ptphismes` VALUES (101, 1, 2, '有什么问题', '2017-12-27 15:01:16', b'1');
INSERT INTO `ptphismes` VALUES (102, 2, 1, '没问题', '2017-12-27 15:01:21', b'0');
INSERT INTO `ptphismes` VALUES (103, 2, 1, '没问题', '2017-12-27 15:01:21', b'1');
INSERT INTO `ptphismes` VALUES (104, 1, 2, '有问题', '2017-12-27 15:01:25', b'0');
INSERT INTO `ptphismes` VALUES (105, 1, 2, '有问题', '2017-12-27 15:01:25', b'1');
INSERT INTO `ptphismes` VALUES (106, 2, 1, '是你写的店有问题', '2017-12-27 15:01:34', b'0');
INSERT INTO `ptphismes` VALUES (107, 2, 1, '是你写的店有问题', '2017-12-27 15:01:34', b'1');
INSERT INTO `ptphismes` VALUES (108, 1, 2, '哦', '2017-12-27 15:01:37', b'0');
INSERT INTO `ptphismes` VALUES (109, 1, 2, '哦', '2017-12-27 15:01:37', b'1');
INSERT INTO `ptphismes` VALUES (110, 2, 1, '嗯', '2017-12-27 15:01:43', b'0');
INSERT INTO `ptphismes` VALUES (111, 2, 1, '嗯', '2017-12-27 15:01:43', b'1');
INSERT INTO `ptphismes` VALUES (112, 1, 2, '啊？', '2017-12-27 15:01:47', b'0');
INSERT INTO `ptphismes` VALUES (113, 1, 2, '啊？', '2017-12-27 15:01:47', b'1');
INSERT INTO `ptphismes` VALUES (114, 2, 1, '呵呵', '2017-12-27 15:01:57', b'0');
INSERT INTO `ptphismes` VALUES (115, 2, 1, '呵呵', '2017-12-27 15:01:57', b'1');
INSERT INTO `ptphismes` VALUES (116, 1, 2, '哈哈', '2017-12-27 15:02:02', b'0');
INSERT INTO `ptphismes` VALUES (117, 1, 2, '哈哈', '2017-12-27 15:02:02', b'1');
INSERT INTO `ptphismes` VALUES (118, 2, 1, '比u比u', '2017-12-27 15:02:12', b'0');
INSERT INTO `ptphismes` VALUES (119, 2, 1, '比u比u', '2017-12-27 15:02:12', b'1');
INSERT INTO `ptphismes` VALUES (120, 1, 2, '咻咻', '2017-12-27 15:02:17', b'0');
INSERT INTO `ptphismes` VALUES (121, 1, 2, '咻咻', '2017-12-27 15:02:17', b'1');
INSERT INTO `ptphismes` VALUES (122, 2, 1, '表情', '2017-12-27 15:02:27', b'0');
INSERT INTO `ptphismes` VALUES (123, 2, 1, '表情', '2017-12-27 15:02:27', b'1');
INSERT INTO `ptphismes` VALUES (124, 1, 2, '没有', '2017-12-27 15:02:33', b'0');
INSERT INTO `ptphismes` VALUES (125, 1, 2, '没有', '2017-12-27 15:02:33', b'1');
INSERT INTO `ptphismes` VALUES (126, 6, 7, 'hello', '2017-12-27 22:31:46', b'1');
INSERT INTO `ptphismes` VALUES (127, 6, 7, '在吗？', '2017-12-27 22:32:14', b'1');
INSERT INTO `ptphismes` VALUES (128, 7, 6, '在的', '2017-12-27 22:32:24', b'1');
INSERT INTO `ptphismes` VALUES (129, 6, 7, 'hello', '2017-12-27 22:46:53', b'1');
INSERT INTO `ptphismes` VALUES (130, 2, 7, 'kk', '2017-12-28 09:01:06', b'1');
INSERT INTO `ptphismes` VALUES (131, 7, 2, '?\n', '2017-12-28 09:01:14', b'1');
INSERT INTO `ptphismes` VALUES (132, 2, 7, 'nfiasdfnasjdkfa', '2017-12-28 09:04:46', b'1');
INSERT INTO `ptphismes` VALUES (133, 7, 6, 'No', '2017-12-28 09:56:29', b'1');
INSERT INTO `ptphismes` VALUES (134, 6, 2, 'fa', '2017-12-28 12:57:32', b'1');
INSERT INTO `ptphismes` VALUES (135, 6, 2, 'fasd', '2017-12-28 12:58:01', b'1');
INSERT INTO `ptphismes` VALUES (136, 6, 2, 'nihao', '2017-12-28 12:59:19', b'1');
INSERT INTO `ptphismes` VALUES (137, 6, 2, 'fa', '2017-12-28 13:03:01', b'1');
INSERT INTO `ptphismes` VALUES (138, 6, 2, '?', '2017-12-28 13:03:56', b'1');
INSERT INTO `ptphismes` VALUES (139, 6, 2, '飞', '2017-12-28 13:07:32', b'1');
INSERT INTO `ptphismes` VALUES (140, 6, 2, '啊', '2017-12-28 13:08:21', b'1');
INSERT INTO `ptphismes` VALUES (141, 6, 2, '发顺丰', '2017-12-28 13:08:30', b'1');
INSERT INTO `ptphismes` VALUES (142, 6, 2, '发达', '2017-12-28 13:10:20', b'1');
INSERT INTO `ptphismes` VALUES (143, 6, 2, '法师打发', '2017-12-28 13:10:40', b'1');
INSERT INTO `ptphismes` VALUES (144, 6, 2, '法师打发', '2017-12-28 13:10:43', b'1');
INSERT INTO `ptphismes` VALUES (145, 7, 2, 'hello', '2017-12-28 13:11:02', b'1');
INSERT INTO `ptphismes` VALUES (146, 7, 2, '固定', '2017-12-28 14:20:54', b'1');
INSERT INTO `ptphismes` VALUES (147, 7, 2, '发送', '2017-12-28 14:22:14', b'1');
INSERT INTO `ptphismes` VALUES (148, 6, 21, 'wwwwww', '2018-03-05 11:31:32', b'1');
INSERT INTO `ptphismes` VALUES (149, 21, 6, 'wwwwwwww', '2018-03-05 11:31:42', b'1');
INSERT INTO `ptphismes` VALUES (150, 23, 6, '哈哈', '2018-03-20 14:29:31', b'1');
INSERT INTO `ptphismes` VALUES (151, 23, 6, '你好', '2018-03-20 14:29:50', b'1');
INSERT INTO `ptphismes` VALUES (152, 6, 23, '你好', '2018-03-20 14:29:59', b'1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `tnum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emaile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isonline` bit(1) NULL DEFAULT NULL,
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '1565845039', '1565845039@qq.com', '15879703547', '1565845039', 'yh', b'0', 'img/tx3.jpg');
INSERT INTO `t_user` VALUES (2, '600002', '123', '123', '123', 'hello', NULL, 'img/ceshi-1.jpg');
INSERT INTO `t_user` VALUES (6, '600001', '666', '666', '666', '666', NULL, 'img/ceshi-2.jpg');
INSERT INTO `t_user` VALUES (7, '600000', '777', '777', '777', '777', NULL, 'img/tx1.jpg');
INSERT INTO `t_user` VALUES (20, '600004', '123456@qq.com', NULL, '111', 'hell', NULL, 'img/default.jpg');
INSERT INTO `t_user` VALUES (21, '600008', '132@qq.com', '13688888', '123456', 'xp', NULL, 'img/default.jpg');
INSERT INTO `t_user` VALUES (23, '600014', '1322397827@qq.com', NULL, 'abc123456', 'lychee', NULL, 'img/default.jpg');
INSERT INTO `t_user` VALUES (27, '600016', '1322397827@qq.com', NULL, 'abc123456', 'cherry', NULL, 'img/default.jpg');

-- ----------------------------
-- Table structure for usergroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup`  (
  `usergroupid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  `ename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unreadnum` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`usergroupid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  CONSTRAINT `usergroup_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usergroup_ibfk_2` FOREIGN KEY (`groupid`) REFERENCES `group` (`groupid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES (1, 1, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (2, 2, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (3, 6, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (4, 7, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (5, NULL, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (18, 20, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (19, 21, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (21, 23, -1, NULL, NULL);
INSERT INTO `usergroup` VALUES (25, 27, -1, NULL, NULL);

-- ----------------------------
-- Triggers structure for table t_user
-- ----------------------------
DROP TRIGGER IF EXISTS `afterinsertuser`;
delimiter ;;
CREATE TRIGGER `afterinsertuser` AFTER INSERT ON `t_user` FOR EACH ROW BEGIN
	INSERT INTO usergroup(`userid`,`groupid`) VALUES(new.userid,'-1');
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

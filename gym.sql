/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : gym

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-05-27 10:14:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `times` varchar(11) NOT NULL,
  `keshi` int(11) NOT NULL,
  `cost` double NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK78A7CC3B1CAF7366` (`tid`),
  CONSTRAINT `FK78A7CC3B1CAF7366` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('10', '瑜伽', '海滨学院二期', '1', '上午', '30', '999', '按时上瑜伽课');
INSERT INTO `course` VALUES ('11', '动感单车', '海滨学院二期', '2', '下午', '20', '999', '按时上动感单车课');
INSERT INTO `course` VALUES ('12', '体操', '海滨学院二期', '1', '晚上', '50', '999', '按时上体操课');

-- ----------------------------
-- Table structure for health
-- ----------------------------
DROP TABLE IF EXISTS `health`;
CREATE TABLE `health` (
  `oid` int(32) NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) DEFAULT NULL,
  `weight` varchar(32) DEFAULT NULL,
  `fat` varchar(32) DEFAULT NULL,
  `muscle` varchar(32) DEFAULT NULL,
  `water` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `createtime` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of health
-- ----------------------------
INSERT INTO `health` VALUES ('1', '1', '34', '56', '78', '90', 'adsfasd', '20170523');
INSERT INTO `health` VALUES ('2', '1', '56', '25', '78', '65', '5555', '20170524');
INSERT INTO `health` VALUES ('3', '1', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `times` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '1', '3', '1', '2017-05-25 17:57:15');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '新闻一标题', '新闻一内容新闻一内容新闻一内容', '2017-05-14');
INSERT INTO `news` VALUES ('2', '新闻二标题', '新闻二内容新闻二内容新闻二内容', '2017-05-14');
INSERT INTO `news` VALUES ('3', '新闻三标题', '新闻三内容新闻三内容新闻三内容', '2017-05-14');
INSERT INTO `news` VALUES ('4', '新闻四标题', '新闻四内容新闻四内容新闻四内容', '2017-05-14');
INSERT INTO `news` VALUES ('5', '新闻五标题', '新闻五内容新闻五内容新闻五内容', '2017-05-14');
INSERT INTO `news` VALUES ('6', '新闻六标题', '新闻六内容新闻六内容新闻六内容', '2017-05-14');
INSERT INTO `news` VALUES ('7', '新闻七标题', '新闻七内容新闻七内容新闻七内容', '2017-05-14');
INSERT INTO `news` VALUES ('8', '新闻八标题', '新闻八内容新闻八内容新闻八内容', '2017-05-14');

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `times` int(11) NOT NULL,
  `createdate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`),
  CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ALTER TABLE `relation`\r\nADD COLUMN `createdate`  date NOT NULL AFTER `times`;';

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('1', '10', '1', '30', '20170523');
INSERT INTO `relation` VALUES ('2', '11', '1', '20', '20170525');
INSERT INTO `relation` VALUES ('3', '12', '1', '50', '20170526');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tel` bigint(20) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'wangzhiquan', '101', 'asdf', '1', '101');
INSERT INTO `teacher` VALUES ('2', 'zhangyujun_', '102', 'asdf', '0', '101');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` bigint(20) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'asdf', 'asdfasdf', '101', '13613330001', '123456878');

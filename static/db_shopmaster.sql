/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : db_shopmaster

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2021-04-15 20:01:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(12) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int(12) DEFAULT NULL,
  `reducePrice` int(12) DEFAULT NULL,
  `fullNum` int(12) DEFAULT NULL,
  `reduceNum` int(12) DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '无活动', '无', '1', null, null, null, null);
INSERT INTO `activity` VALUES ('2', '情人节大放送', '情人节 折扣慢慢', '1', '123', '123', '1231', '12');
INSERT INTO `activity` VALUES ('3', '开业大酬宾', '开业大酬宾，全场9折。', '9.2', '100', '8', '200', '20');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('14', '6', '辽宁省', '沈阳市', '和平区', '奈曼一中', '毕鹤', '13887879999');
INSERT INTO `address` VALUES ('15', '6', '辽宁省', '大连市', '沙河口区', '软件园', '老王', '333333333');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(12) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateId` int(12) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '马蹄莲');
INSERT INTO `category` VALUES ('2', '玫瑰');
INSERT INTO `category` VALUES ('3', '百合');
INSERT INTO `category` VALUES ('4', '康乃馨');
INSERT INTO `category` VALUES ('5', '满天星');
INSERT INTO `category` VALUES ('6', '向日葵');
INSERT INTO `category` VALUES ('7', '其他');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `userId` int(12) NOT NULL COMMENT '收藏',
  `goodsId` int(12) NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('6', '93', '2021-03-18 23:00:41');
INSERT INTO `collection` VALUES ('6', '95', '2021-03-18 23:00:46');
INSERT INTO `collection` VALUES ('6', '97', '2021-03-18 22:42:09');
INSERT INTO `collection` VALUES ('6', '99', '2021-03-16 21:10:09');
INSERT INTO `collection` VALUES ('6', '100', '2021-03-18 23:00:38');
INSERT INTO `collection` VALUES ('6', '101', '2021-03-18 23:00:56');
INSERT INTO `collection` VALUES ('6', '105', '2021-03-18 23:00:58');
INSERT INTO `collection` VALUES ('6', '116', '2021-03-28 19:20:20');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `point` int(8) NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '6', '93', '5', 'very good nice', '2021-03-16 20:56:34');
INSERT INTO `comment` VALUES ('4', '6', '99', '5', '漂亮。', '2021-03-16 21:12:36');
INSERT INTO `comment` VALUES ('5', '6', '95', '4', '123456789', '2021-04-11 21:59:42');
INSERT INTO `comment` VALUES ('6', '6', '96', '5', '123456789567890', '2021-04-11 22:00:24');

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `sendId` int(12) NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` int(12) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int(12) NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int(12) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('93', '玫瑰1', '10', '29', '2019-05-10 19:43:04', '2', '测试', '这是测试商品1', '3');
INSERT INTO `goods` VALUES ('95', '马蹄莲1', '123', '1231', '2019-05-11 11:41:24', '1', '测试', '测试商品', '1');
INSERT INTO `goods` VALUES ('96', '马蹄莲2', '213', '222', '2019-05-11 11:42:00', '1', '12321', '这是一个测试商品4', '2');
INSERT INTO `goods` VALUES ('97', '马蹄莲3', '213', '212', '2019-05-13 10:22:58', '1', '测试', '这是测试商品', '2');
INSERT INTO `goods` VALUES ('99', '马蹄莲4', '99', '50', '2021-03-16 21:09:35', '1', '花', '花花', '3');
INSERT INTO `goods` VALUES ('100', '百合1', '45', '46', '2021-03-17 11:20:49', '3', '123', '百合11111111111111', '1');
INSERT INTO `goods` VALUES ('101', '马蹄莲5', '138', '78', '2021-03-09 23:27:19', '1', '2345667', '马蹄莲', '1');
INSERT INTO `goods` VALUES ('102', '马蹄莲6', '88', '67', '2021-03-17 23:31:15', '1', '22', '22', '1');
INSERT INTO `goods` VALUES ('103', '马蹄莲7', '77', '77', '2021-03-02 23:31:59', '1', '1', '11', '1');
INSERT INTO `goods` VALUES ('104', '马蹄莲8', '132', '24', '2021-03-17 23:32:26', '1', '34', '3', '1');
INSERT INTO `goods` VALUES ('105', '马蹄莲9', '229', '67', '2021-03-05 23:32:54', '1', '233', '465', '1');
INSERT INTO `goods` VALUES ('106', '玫瑰2', '99', '99', '2021-03-12 20:28:56', '2', '情人', '情人', '1');
INSERT INTO `goods` VALUES ('107', '玫瑰3', '199', '100', '2021-03-10 20:29:38', '2', 'flower', 'flower', '1');
INSERT INTO `goods` VALUES ('108', '玫瑰4', '666', '65', '2021-03-10 20:44:25', '2', '玫瑰', '玫瑰', '1');
INSERT INTO `goods` VALUES ('109', '玫瑰5', '399', '123', '2021-03-20 20:44:47', '2', '玫瑰', '玫瑰', '1');
INSERT INTO `goods` VALUES ('110', '玫瑰6', '245', '22', '2021-03-20 20:45:06', '2', '玫瑰', '玫瑰', '1');
INSERT INTO `goods` VALUES ('111', '玫瑰7', '888', '56', '2021-03-20 20:45:24', '2', '玫瑰', '玫瑰', '1');
INSERT INTO `goods` VALUES ('112', '百合2', '212', '250', '2021-03-20 20:54:18', '3', '百合', '百合', '1');
INSERT INTO `goods` VALUES ('113', '百合3', '444', '443', '2021-03-20 20:54:38', '3', '百合', '百合', '1');
INSERT INTO `goods` VALUES ('114', '百合4', '233', '23', '2021-03-20 20:54:57', '3', '百合', '百合', '1');
INSERT INTO `goods` VALUES ('115', '百合5', '98', '45', '2021-03-20 20:55:12', '3', '百合', '百合', '1');
INSERT INTO `goods` VALUES ('116', '百合6', '334', '22', '2021-03-20 20:55:27', '3', '百合', '百合', '1');
INSERT INTO `goods` VALUES ('117', '康乃馨1', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨1', '康乃馨1', '1');
INSERT INTO `goods` VALUES ('118', '康乃馨2', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨2', '康乃馨2', '1');
INSERT INTO `goods` VALUES ('119', '康乃馨3', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨3', '康乃馨3', '1');
INSERT INTO `goods` VALUES ('120', '康乃馨4', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨4', '康乃馨4', '1');
INSERT INTO `goods` VALUES ('121', '康乃馨5', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨5', '康乃馨5', '1');
INSERT INTO `goods` VALUES ('122', '康乃馨6', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨6', '康乃馨6', '1');
INSERT INTO `goods` VALUES ('123', '康乃馨7', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨7', '康乃馨7', '1');
INSERT INTO `goods` VALUES ('124', '康乃馨8', '300', '40', '2021-03-20 21:01:18', '4', '康乃馨8', '康乃馨8', '1');
INSERT INTO `goods` VALUES ('125', '向日葵1', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('126', '向日葵2', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('127', '向日葵3', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('128', '向日葵4', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('129', '向日葵5', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('130', '向日葵6', '98', '45', '2021-03-20 20:55:12', '6', '向日葵', '向日葵', '1');
INSERT INTO `goods` VALUES ('131', '满天星1', '98', '45', '2021-03-20 20:55:12', '5', '满天星', '满天星', '1');
INSERT INTO `goods` VALUES ('132', '满天星2', '98', '45', '2021-03-20 20:55:12', '5', '满天星', '满天星', '1');
INSERT INTO `goods` VALUES ('133', '满天星3', '98', '45', '2021-03-20 20:55:12', '5', '满天星', '满天星', '1');
INSERT INTO `goods` VALUES ('134', '满天星4', '98', '45', '2021-03-20 20:55:12', '5', '满天星', '满天星', '1');
INSERT INTO `goods` VALUES ('135', '满天星5', '98', '45', '2021-03-20 20:55:12', '5', '满天星', '满天星', '1');
INSERT INTO `goods` VALUES ('136', '其他1', '100', '100', '2021-03-20 20:55:12', '7', '其他', '其他', '1');
INSERT INTO `goods` VALUES ('137', '其他2', '100', '100', '2021-03-20 20:55:12', '7', '其他', '其他', '1');
INSERT INTO `goods` VALUES ('138', '其他3', '100', '100', '2021-03-20 20:55:12', '7', '其他', '其他', '1');
INSERT INTO `goods` VALUES ('139', '那个她', '999', '999', '2021-04-11 14:13:26', '2', '只有她', '一生所爱', '1');

-- ----------------------------
-- Table structure for imagepath
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath` (
  `pathId` int(12) NOT NULL AUTO_INCREMENT,
  `goodId` int(12) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO `imagepath` VALUES ('114', '93', '玫瑰-1.jpg');
INSERT INTO `imagepath` VALUES ('117', '95', '马蹄莲1.jpg');
INSERT INTO `imagepath` VALUES ('118', '96', '马蹄莲2.jpg');
INSERT INTO `imagepath` VALUES ('121', '97', '马蹄莲3.jpg');
INSERT INTO `imagepath` VALUES ('130', '99', '马蹄莲4.jpg');
INSERT INTO `imagepath` VALUES ('131', '100', '百合1.jpg');
INSERT INTO `imagepath` VALUES ('132', '101', '马蹄莲5.jpg');
INSERT INTO `imagepath` VALUES ('133', '102', '马蹄莲6.jpg');
INSERT INTO `imagepath` VALUES ('134', '103', '马蹄莲7.jpg');
INSERT INTO `imagepath` VALUES ('135', '104', '马蹄莲8.jpg');
INSERT INTO `imagepath` VALUES ('136', '105', '马蹄莲9.jpg');
INSERT INTO `imagepath` VALUES ('137', '106', '玫瑰_2.jpg');
INSERT INTO `imagepath` VALUES ('138', '107', '玫瑰-3.jpg');
INSERT INTO `imagepath` VALUES ('139', '107', '玫瑰-1.jpg');
INSERT INTO `imagepath` VALUES ('140', '108', '玫瑰-4.jpg');
INSERT INTO `imagepath` VALUES ('141', '109', '玫瑰-5.jpg');
INSERT INTO `imagepath` VALUES ('142', '110', '玫瑰-6.jpg');
INSERT INTO `imagepath` VALUES ('143', '111', '玫瑰-7.jpg');
INSERT INTO `imagepath` VALUES ('144', '112', '百合2.jpg');
INSERT INTO `imagepath` VALUES ('145', '113', '百合3.jpg');
INSERT INTO `imagepath` VALUES ('146', '114', '百合4.jpg');
INSERT INTO `imagepath` VALUES ('147', '115', '百合5.jpg');
INSERT INTO `imagepath` VALUES ('148', '116', '百合6.jpg');
INSERT INTO `imagepath` VALUES ('149', '117', '康乃馨1.jpg');
INSERT INTO `imagepath` VALUES ('150', '118', '康乃馨2.jpg');
INSERT INTO `imagepath` VALUES ('151', '119', '康乃馨3.jpg');
INSERT INTO `imagepath` VALUES ('152', '120', '康乃馨4.jpg');
INSERT INTO `imagepath` VALUES ('153', '121', '康乃馨5.jpg');
INSERT INTO `imagepath` VALUES ('154', '122', '康乃馨6.jpg');
INSERT INTO `imagepath` VALUES ('155', '123', '康乃馨7.jpg');
INSERT INTO `imagepath` VALUES ('156', '124', '康乃馨8.jpg');
INSERT INTO `imagepath` VALUES ('157', '125', '向日葵1.jpg');
INSERT INTO `imagepath` VALUES ('158', '126', '向日葵2.jpg');
INSERT INTO `imagepath` VALUES ('159', '127', '向日葵3.jpg');
INSERT INTO `imagepath` VALUES ('160', '128', '向日葵4.jpg');
INSERT INTO `imagepath` VALUES ('161', '129', '向日葵5.jpg');
INSERT INTO `imagepath` VALUES ('162', '130', '向日葵6.jpg');
INSERT INTO `imagepath` VALUES ('163', '131', '满天星1.jpg');
INSERT INTO `imagepath` VALUES ('164', '132', '满天星2.jpg');
INSERT INTO `imagepath` VALUES ('165', '133', '满天星3.jpg');
INSERT INTO `imagepath` VALUES ('166', '134', '满天星4.jpg');
INSERT INTO `imagepath` VALUES ('167', '135', '满天星5.jpg');
INSERT INTO `imagepath` VALUES ('168', '136', '其他1.jpg');
INSERT INTO `imagepath` VALUES ('169', '137', '其他2.jpg');
INSERT INTO `imagepath` VALUES ('170', '138', '其他3.jpg');
INSERT INTO `imagepath` VALUES ('171', '139', 'b960那个她微信图片_20210317091350.jpg');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `orderId` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int(12) NOT NULL,
  `addres` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('42', '6', '2021-04-11 18:56:49', '99', '99', '1', '1', '1', '1', '14', 'aa');
INSERT INTO `indent` VALUES ('45', '6', '2021-04-11 21:16:22', '213', '213', '1', '0', '0', '0', '14', null);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemId` int(12) NOT NULL AUTO_INCREMENT,
  `orderId` int(12) NOT NULL,
  `goodsId` int(12) NOT NULL,
  `num` int(12) NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('30', '42', '106', '1');
INSERT INTO `orderitem` VALUES ('32', '45', '97', '1');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `goodsId` int(11) NOT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sales
-- ----------------------------

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `userId` int(12) NOT NULL,
  `goodsid` int(12) NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int(12) NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'zhangxin', '19402600297a305197962a5633e7711e', '2019-04-22 15:29:12', '994683607@qq.com', '18229819406');
INSERT INTO `user` VALUES ('6', 'bihe', 'e10adc3949ba59abbe56e057f20f883e', '2021-03-16 20:34:41', '1067716908@qq.com', '17614851547');
INSERT INTO `user` VALUES ('7', 'tom', 'e10adc3949ba59abbe56e057f20f883e', '2021-03-20 22:23:29', '123456@s.com', '123456');

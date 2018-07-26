/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : grapefruitread

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-20 11:47:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ID号',
  `article_title` varchar(128) NOT NULL COMMENT '文章标题',
  `article_author` varchar(32) NOT NULL COMMENT '作者',
  `article_class` varchar(32) NOT NULL COMMENT '年级',
  `article_school` varchar(32) NOT NULL COMMENT '所属校区',
  `article_teacher` varchar(32) NOT NULL COMMENT '指导老师',
  `article_time` datetime NOT NULL COMMENT '发布时间',
  `article_like` int(11) NOT NULL COMMENT '喜欢数量',
  `article_read` int(11) NOT NULL COMMENT '阅读数量',
  `sort_id` int(11) NOT NULL COMMENT '所属分类',
  `article_type` int(13) NOT NULL DEFAULT '1' COMMENT '文章的模式:0为私有，1为公开，2为仅好友查看',
  `article_content` text NOT NULL COMMENT '文章内容',
  `article_up` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶:0为否，1为是',
  `article_support` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否博主推荐:0为否，1为是',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_article_sort`;
CREATE TABLE `t_article_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ID',
  `sort_name` varchar(60) NOT NULL COMMENT '分类名称',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`sort_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of t_article_sort
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `c_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '评论自增ID号',
  `user_id` mediumint(8) NOT NULL COMMENT '收到评论的用户ID',
  `commit_id` mediumint(8) NOT NULL COMMENT '评论内容的ID',
  `commit_content` varchar(255) NOT NULL COMMENT '评论内容',
  `commit_user_id` mediumint(8) NOT NULL COMMENT '评论者ID',
  `commit_time` int(13) NOT NULL COMMENT '评论时间',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户评论表';

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_grade_team
-- ----------------------------
DROP TABLE IF EXISTS `t_grade_team`;
CREATE TABLE `t_grade_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ID',
  `team_name` varchar(60) NOT NULL COMMENT '班级名称',
  `grade_id` int(11) NOT NULL COMMENT '对应年级ID',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of t_grade_team
-- ----------------------------

-- ----------------------------
-- Table structure for t_school
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ID',
  `school_name` varchar(60) NOT NULL COMMENT '校区名称',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='校区表';

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('1', '景田校区', '1', '1', '2018-06-19 16:18:44', '2018-06-19', '2018-06-19 16:18:51', '2018-06-19');

-- ----------------------------
-- Table structure for t_school_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_school_grade`;
CREATE TABLE `t_school_grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ID',
  `grade_name` varchar(60) NOT NULL COMMENT '年级名称',
  `school_id` int(11) NOT NULL COMMENT '对应校区ID',
  `create_user_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='校区年级表';

-- ----------------------------
-- Records of t_school_grade
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MENU_NAME` varchar(256) DEFAULT NULL COMMENT '菜单名字',
  `MENU_URL` varchar(512) DEFAULT NULL COMMENT '请求地址',
  `PARENT_ID` int(10) unsigned DEFAULT NULL COMMENT '父ID',
  `MENU_ORDER` varchar(32) DEFAULT NULL COMMENT '菜单排序',
  `MENU_ICON` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `MENU_TYPE` varchar(2) DEFAULT NULL COMMENT '菜单类型 1菜单 2按钮',
  `SYS_CODE` varchar(8) DEFAULT NULL COMMENT '1:统一运营平台2:物联网平台3:种植平台',
  `STATE` varchar(10) DEFAULT NULL COMMENT '菜单状态1:正常2:停用',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `UPDATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_DATE` date DEFAULT NULL COMMENT '创建日期',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_DATE` date DEFAULT NULL COMMENT '更新日期',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(256) DEFAULT NULL COMMENT '角色名字',
  `STATE` varchar(2) DEFAULT NULL COMMENT '状态： 0：冻结 1 正常',
  `REMARK` varchar(512) DEFAULT NULL COMMENT '备注',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '更新人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_DATE` date DEFAULT NULL COMMENT '创建日期',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_DATE` date DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE `t_sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `NAME` varchar(256) DEFAULT NULL COMMENT '用户真实名字',
  `USER_NAME` varchar(256) DEFAULT NULL COMMENT '用户帐号',
  `NICKNAME` varchar(256) DEFAULT NULL COMMENT '别名',
  `PASSWD` varchar(256) DEFAULT NULL COMMENT '密码',
  `SKIN` varchar(64) DEFAULT 'default' COMMENT '皮肤',
  `EMAIL` varchar(40) DEFAULT NULL COMMENT '电子邮件，多个可用英文逗号分割',
  `PHONE` varchar(40) DEFAULT NULL COMMENT '电话，多个可用英文逗号分割',
  `CATEGORY` varchar(2) DEFAULT NULL COMMENT '分类  0 ：内部用户 1：外部用户',
  `STATE` varchar(2) DEFAULT NULL COMMENT '状态 0:冻结 1：正常',
  `REMARK` varchar(512) DEFAULT NULL COMMENT '备注',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `UPDATE_USER_ID` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_DATE` date DEFAULT NULL COMMENT '创建日期',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_DATE` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `user_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_name`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关系表';

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------

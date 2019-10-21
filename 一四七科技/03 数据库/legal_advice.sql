/*
Navicat MySQL Data Transfer

Source Server         : gcp-mysql
Source Server Version : 50728
Source Host           : 34.80.173.230:3306
Source Database       : legal_advice

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-10-21 17:50:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_info`
-- ----------------------------
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE `account_info` (
  `account_id` int(15) NOT NULL COMMENT '帐号',
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `birthday` varchar(30) DEFAULT NULL COMMENT '出生年月',
  `address` varchar(300) DEFAULT NULL COMMENT '住址',
  `telephone` varchar(30) DEFAULT NULL COMMENT '电话',
  `balance` decimal(22,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `freezing_amount` decimal(22,2) DEFAULT NULL COMMENT '冻结金额',
  `account_status` int(2) NOT NULL COMMENT ' 账户状态:0正常 1锁定',
  `del_flag` int(2) NOT NULL DEFAULT '0' COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL,
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_info
-- ----------------------------

-- ----------------------------
-- Table structure for `app_message`
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `id` bigint(10) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_time` timestamp(6) NULL DEFAULT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `user_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flag` int(2) DEFAULT NULL,
  `create_time` timestamp(6) NULL DEFAULT NULL,
  `create_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` timestamp(6) NULL DEFAULT NULL,
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of app_message
-- ----------------------------

-- ----------------------------
-- Table structure for `app_versions`
-- ----------------------------
DROP TABLE IF EXISTS `app_versions`;
CREATE TABLE `app_versions` (
  `id` bigint(20) NOT NULL,
  `mobile_phone_system` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机系统',
  `now_versions` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '当前版本',
  `now_versions_content` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本说明',
  `download_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载路径',
  `del_flag` int(2) DEFAULT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `create_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` timestamp(6) NULL DEFAULT NULL,
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of app_versions
-- ----------------------------

-- ----------------------------
-- Table structure for `document_info`
-- ----------------------------
DROP TABLE IF EXISTS `document_info`;
CREATE TABLE `document_info` (
  `id` varchar(20) NOT NULL COMMENT '文件ID',
  `file_content` varchar(500) DEFAULT NULL COMMENT '内容',
  `upload_type` int(2) NOT NULL COMMENT '上传类型',
  `del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '上传时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '上传人',
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_info
-- ----------------------------

-- ----------------------------
-- Table structure for `exception_log`
-- ----------------------------
DROP TABLE IF EXISTS `exception_log`;
CREATE TABLE `exception_log` (
  `id` bigint(20) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bussid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exp_num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_times` int(10) DEFAULT NULL,
  `depict` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flag` int(2) NOT NULL,
  `create_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `create_by` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `update_time` timestamp(6) NULL DEFAULT NULL,
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exception_log
-- ----------------------------

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` varchar(25) NOT NULL COMMENT '订单编号',
  `order_type_` int(2) NOT NULL COMMENT '需求类型',
  `order_describe` varchar(255) NOT NULL COMMENT '需求描述',
  `is_public` int(2) NOT NULL COMMENT '是否公开 00公开 01不公开',
  `reservation_type` int(2) NOT NULL COMMENT '预约类型',
  `order_amount` decimal(19,2) DEFAULT NULL COMMENT '订单金额',
  `payment_channel` int(2) DEFAULT NULL COMMENT '支付渠道',
  `pay_amount` decimal(19,2) NOT NULL COMMENT '实付金额',
  `paytime` timestamp(6) NULL DEFAULT NULL COMMENT '付款时间',
  `order_status` int(2) NOT NULL COMMENT '订单状态',
  `requirement_id` varchar(20) NOT NULL COMMENT '需求方id',
  `service_id` varchar(20) DEFAULT NULL COMMENT '服务方id',
  `annex_id` varchar(20) DEFAULT NULL COMMENT '附件ID',
  `del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for `oss_file`
-- ----------------------------
DROP TABLE IF EXISTS `oss_file`;
CREATE TABLE `oss_file` (
  `oss_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '上传服务key（推荐uuid）',
  `tab_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务表名',
  `tab_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务表关联主键id',
  `file_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件类别（实际业务决定，没有可不填）',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件原始名称（不包含后缀名）',
  `new_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新生成的文件名',
  `del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `temp` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注（预留字段）',
  PRIMARY KEY (`oss_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of oss_file
-- ----------------------------

-- ----------------------------
-- Table structure for `service_type`
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type` (
  `id` varchar(10) NOT NULL COMMENT '自增id',
  `code` int(2) NOT NULL COMMENT '诉讼code',
  `litigation_type` varchar(20) NOT NULL COMMENT '诉讼类型',
  `del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_type
-- ----------------------------

-- ----------------------------
-- Table structure for `transaction_info`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_info`;
CREATE TABLE `transaction_info` (
  `transaction_id` varchar(20) NOT NULL COMMENT '交易ID',
  `amount` decimal(22,2) NOT NULL COMMENT '交易金额',
  `payment_account` varchar(30) NOT NULL COMMENT '付款账户',
  `payer_id` varchar(20) NOT NULL COMMENT '付款人ID',
  `collection_account` varchar(30) NOT NULL COMMENT '收款账户',
  `payee_id` varchar(20) NOT NULL COMMENT '收款人',
  `del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '交易时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transaction_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `name` varchar(25) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `id_number` varchar(30) DEFAULT NULL COMMENT '身份证件号码',
  `password` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `customer_mark` int(2) NOT NULL COMMENT '客户01律师02',
  `audit_status` int(2) NOT NULL COMMENT '审核状态',
  `associated_file_id` varchar(20) DEFAULT NULL COMMENT '关联文件ID',
  `alipay_account` varchar(20) DEFAULT NULL COMMENT '支付宝账号',
  `is_bind` int(2) NOT NULL COMMENT '用户是否绑定支付宝。1是绑定 0是没有',
  `is_certified` int(2) NOT NULL COMMENT '用户是否通过实名认证。1是通过 0是没有实名认证',
  `del_flag` int(2) NOT NULL COMMENT '0：正常 1：被删除',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '注册时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_group_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组编号',
  `user_group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组名称',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` int(2) DEFAULT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `temp` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注（预留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for `usergroup_relation`
-- ----------------------------
DROP TABLE IF EXISTS `usergroup_relation`;
CREATE TABLE `usergroup_relation` (
  `id` bigint(11) DEFAULT NULL COMMENT '该表的主键（自增）',
  `user_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `usergroup_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户组ID',
  `del_flag` int(2) DEFAULT NULL COMMENT '（0：正常 1：被删除）',
  `create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `temp` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of usergroup_relation
-- ----------------------------

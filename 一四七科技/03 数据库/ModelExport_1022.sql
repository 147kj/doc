CREATE TABLE `account_info` (
`account_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
`user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
`birthday` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生年月',
`address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址',
`telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
`balance` decimal(22,2) NOT NULL DEFAULT 0.00 COMMENT '余额',
`freezing_amount` decimal(22,2) NULL DEFAULT NULL COMMENT '冻结金额',
`account_status` int(2) NOT NULL COMMENT ' 账户状态:0正常 1锁定',
`del_flag` int(2) NOT NULL DEFAULT 0 COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
PRIMARY KEY (`account_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `action` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`anction_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`del_flag` int(2) NOT NULL,
`create_time` timestamp(6) NULL DEFAULT NULL,
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`update_tme` timestamp(6) NULL DEFAULT NULL,
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `action_group` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`action_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`group_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`master_id` int(10) NOT NULL,
`master_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`del_flag` int(2) NULL DEFAULT NULL,
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`create_time` timestamp(6) NULL DEFAULT NULL,
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`update_time` timestamp(6) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `action_id` (`action_id`),
INDEX `group_id` (`group_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `exception_log` (
`id` bigint(20) NOT NULL,
`type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`bussid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`exp_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`error_times` int(10) NULL DEFAULT NULL,
`depict` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`del_flag` int(2) NOT NULL,
`create_time` timestamp(6) NULL DEFAULT NULL,
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`update_time` timestamp(6) NULL DEFAULT NULL,
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`temp` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `bussid` (`bussid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `message` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`sub_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`publish_time` timestamp(6) NULL DEFAULT NULL,
`source` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`details` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`is_read` int(2) NULL DEFAULT NULL,
`status` int(2) NULL DEFAULT NULL,
`user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`del_flag` int(2) NULL DEFAULT NULL,
`create_time` timestamp(6) NULL DEFAULT NULL,
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`update_time` timestamp(6) NULL DEFAULT NULL,
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `user_id` (`user_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `order_info` (
`id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
`order_type_` int(2) NOT NULL COMMENT '需求类型',
`order_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '需求描述',
`transaction_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易ID',
`is_public` int(2) NOT NULL COMMENT '是否公开 00公开 01不公开',
`reservation_type` int(2) NOT NULL COMMENT '预约类型',
`order_amount` decimal(19,2) NULL DEFAULT NULL COMMENT '订单金额',
`payment_channel` int(2) NULL DEFAULT NULL COMMENT '支付渠道',
`pay_amount` decimal(19,2) NOT NULL COMMENT '实付金额',
`paytime` timestamp(6) NULL DEFAULT NULL COMMENT '付款时间',
`order_status` int(2) NOT NULL COMMENT '订单状态',
`requirement_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '需求方id',
`service_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务方id',
`annex_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件ID',
`del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
PRIMARY KEY (`id`) ,
INDEX `transaction_id` (`transaction_id`),
INDEX `requirement_id` (`requirement_id`),
INDEX `reservation_type` (`reservation_type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `oss_file` (
`oss_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上传服务key（推荐uuid）',
`tab_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务表名',
`tab_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务表关联主键id',
`file_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '附件类别（实际业务决定，没有可不填）',
`file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '附件原始名称（不包含后缀名）',
`new_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '新生成的文件名',
`del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
`temp` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注（预留字段）',
PRIMARY KEY (`oss_key`) ,
INDEX `oss_key` (`oss_key`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `service_type` (
`id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '自增id',
`code` int(2) NOT NULL COMMENT '诉讼code',
`litigation_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '诉讼类型',
`del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `code` (`code`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `transaction_info` (
`transaction_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易ID',
`amount` decimal(22,2) NOT NULL COMMENT '交易金额',
`payment_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款账户',
`payer_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付款人ID',
`collection_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收款账户',
`payee_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收款人',
`del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '交易时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
PRIMARY KEY (`transaction_id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
`name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
`phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
`id_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证件号码',
`password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
`customer_mark` int(2) NOT NULL COMMENT '客户01律师02',
`audit_status` int(2) NOT NULL COMMENT '审核状态',
`associated_file_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联文件ID',
`account_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付宝账号',
`is_bind` int(2) NOT NULL COMMENT '用户是否绑定支付宝。1是绑定 0是没有',
`is_certified` int(2) NOT NULL COMMENT '用户是否通过实名认证。1是通过 0是没有实名认证',
`del_flag` int(2) NOT NULL COMMENT '0：正常 1：被删除',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '注册时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `id` (`id`),
INDEX `account_id` (`account_id`),
INDEX `associated_file_id` (`associated_file_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `usergroup` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`user_group_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组编号',
`user_group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组名称',
`remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
`del_flag` int(2) NULL DEFAULT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
`temp` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注（预留字段）',
PRIMARY KEY (`id`) ,
INDEX `id` (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `usergroup_relation` (
`id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
`usergroup_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户组ID',
`del_flag` int(2) NULL DEFAULT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL COMMENT '创建时间',
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
`update_time` timestamp(6) NULL DEFAULT NULL COMMENT '更新时间',
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
`temp` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `user_id` (`user_id`),
INDEX `usergroup_id` (`usergroup_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `versions` (
`id` bigint(20) NOT NULL,
`mobile_phone_system` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '手机系统',
`now_versions` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '当前版本',
`now_versions_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '版本说明',
`download_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下载路径',
`del_flag` int(2) NOT NULL COMMENT '（0：正常 1：被删除）',
`create_time` timestamp(6) NULL DEFAULT NULL,
`create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`update_time` timestamp(6) NULL DEFAULT NULL,
`update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`temp` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `action_group` ADD CONSTRAINT `action_group_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`);
ALTER TABLE `action_group` ADD CONSTRAINT `action_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`);
ALTER TABLE `exception_log` ADD CONSTRAINT `exception_log_ibfk_1` FOREIGN KEY (`bussid`) REFERENCES `order_info` (`id`);
ALTER TABLE `order_info` ADD CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`);
ALTER TABLE `order_info` ADD CONSTRAINT `order_info_ibfk_2` FOREIGN KEY (`reservation_type`) REFERENCES `service_type` (`code`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usergroup_relation` (`user_id`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account_info` (`account_id`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `account_info` (`account_id`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id`) REFERENCES `order_info` (`requirement_id`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_5` FOREIGN KEY (`associated_file_id`) REFERENCES `oss_file` (`oss_key`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_6` FOREIGN KEY (`id`) REFERENCES `message` (`user_id`);
ALTER TABLE `usergroup_relation` ADD CONSTRAINT `usergroup_relation_ibfk_1` FOREIGN KEY (`usergroup_id`) REFERENCES `usergroup` (`id`);


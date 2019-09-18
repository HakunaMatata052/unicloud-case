/*
 Auth:calvin wong
 Sql type:Mysql
 web:weimumu.top

*/

#地址
DROP TABLE IF EXISTS `weishop_address`;
CREATE TABLE `weishop_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `province` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `county` varchar(60) NOT NULL,
  `address` varchar(240) NOT NULL,
  `default_address` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `consignee` varchar(100) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

#管理员
DROP TABLE IF EXISTS `weishop_admin`;
CREATE TABLE `weishop_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `role_ids` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '0.冻结 1.激活',
  `last_login_ip` varchar(255) DEFAULT NULL,
  `gmt_last_login` datetime NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`(30)) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

#评论
DROP TABLE IF EXISTS `weishop_comment`;
CREATE TABLE `weishop_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

#购物车
DROP TABLE IF EXISTS `weishop_cart`;
CREATE TABLE `weishop_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `num` int(11) NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

#分类
DROP TABLE IF EXISTS `weishop_category`;
CREATE TABLE `weishop_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036484 DEFAULT CHARSET=utf8mb4;

#收藏
DROP TABLE IF EXISTS `weishop_collect`;
CREATE TABLE `weishop_collect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `spu_id` bigint(20) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

#配置
DROP TABLE IF EXISTS `weishop_config`;
CREATE TABLE `weishop_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_word` varchar(60) DEFAULT NULL,
  `value_worth` varchar(100) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#优惠卷
DROP TABLE IF EXISTS `weishop_coupon`;
CREATE TABLE `weishop_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '使用类型，如满减',
  `description` varchar(255) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `surplus` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `discount` int(11) NOT NULL COMMENT '减少金额',
  `min` int(11) NOT NULL COMMENT '最低消费金额',
  `status` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `days` int(11) DEFAULT NULL COMMENT '过期天数',
  `gmt_start` datetime DEFAULT NULL COMMENT '领取开始时间',
  `gmt_end` datetime DEFAULT NULL COMMENT '领取/使用结束时间',
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

#运费模板
DROP TABLE IF EXISTS `weishop_freight`;
CREATE TABLE `weishop_freight` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL,
  `spu_location` varchar(200) DEFAULT NULL,
  `delivery_deadline` int(11) NOT NULL,
  `default_free_price` int(11) NOT NULL DEFAULT '-1',
  `default_first_num` int(11) DEFAULT '1',
  `default_first_money` int(11) DEFAULT '0',
  `default_continue_num` int(11) DEFAULT '1',
  `default_continue_money` int(11) DEFAULT '0',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

#图片
DROP TABLE IF EXISTS `weishop_img`;
CREATE TABLE `weishop_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_type` int(11) NOT NULL,
  `biz_id` bigint(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2888 DEFAULT CHARSET=utf8mb4;

#订单
DROP TABLE IF EXISTS `weishop_order`;
CREATE TABLE `weishop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `sku_original_total_price` int(11) DEFAULT NULL,
  `sku_total_price` int(11) NOT NULL,
  `freight_price` int(11) NOT NULL,
  `coupon_price` int(11) DEFAULT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `actual_price` int(11) NOT NULL,
  `pay_price` int(11) DEFAULT NULL,
  `pay_id` varchar(255) DEFAULT NULL,
  `pay_channel` varchar(255) DEFAULT NULL,
  `gmt_pay` datetime DEFAULT NULL,
  `ship_no` varchar(255) DEFAULT NULL,
  `ship_code` varchar(255) DEFAULT NULL,
  `gmt_ship` datetime DEFAULT NULL,
  `gmt_confirm` datetime DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL COMMENT '若province字段为空，表示无需收货地址',
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `mono` varchar(512) DEFAULT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`(20)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

#订单详情
DROP TABLE IF EXISTS `weishop_order_info`;
CREATE TABLE `weishop_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `spu_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `spu_title` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `bar_code` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `original_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

#推荐
DROP TABLE IF EXISTS `weishop_recommend`;
CREATE TABLE `weishop_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL,
  `recommend_type` int(11) NOT NULL DEFAULT '1',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#角色
DROP TABLE IF EXISTS `weishop_role`;
CREATE TABLE `weishop_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) DEFAULT NULL,
  `desc` varchar(1023) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0.冻结 1.激活',
  `gmt_update` datetime NOT NULL COMMENT '更新时间',
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

#权限
DROP TABLE IF EXISTS `weishop_role_permission`;
CREATE TABLE `weishop_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission` varchar(63) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `gmt_update` datetime NOT NULL COMMENT '更新时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

#sku
DROP TABLE IF EXISTS `weishop_sku`;
CREATE TABLE `weishop_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL,
  `bar_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `original_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `vip_price` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '9999999',
  `freeze_stock` int(11) NOT NULL DEFAULT '0',
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2773 DEFAULT CHARSET=utf8mb4;

#Spu
DROP TABLE IF EXISTS `weishop_spu`;
CREATE TABLE `weishop_spu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `original_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `vip_price` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL,
  `detail` varchar(4096) NOT NULL DEFAULT '暂无细节描述',
  `description` varchar(255) NOT NULL DEFAULT '介绍',
  `category_id` bigint(20) NOT NULL,
  `freight_template_id` bigint(20) NOT NULL DEFAULT '1',
  `unit` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1236768 DEFAULT CHARSET=utf8mb4;

#attribute
DROP TABLE IF EXISTS `weishop_spu_attribute`;
CREATE TABLE `weishop_spu_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

#用户
DROP TABLE IF EXISTS `weishop_user`;
CREATE TABLE `weishop_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `login_type` int(11) NOT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '0.普通会员 1.VIP会员',
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT '-1',
  `gmt_last_login` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unimall_user_phone_uindex` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

#用户优惠卷
DROP TABLE IF EXISTS `weishop_user_coupon`;
CREATE TABLE `weishop_user_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL COMMENT '使用订单Id',
  `gmt_used` datetime DEFAULT NULL COMMENT '使用时间，若使用时间为空，表示未使用',
  `gmt_start` datetime NOT NULL COMMENT '领取优惠券时写入',
  `gmt_end` datetime NOT NULL COMMENT '领取优惠券根据策略计算',
  `gmt_update` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*
Navicat MySQL Data Transfer

Source Server         : database
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : alen_db

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-11-03 19:06:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(16) NOT NULL DEFAULT '1' COMMENT '主键',
  `menu_type` int(4) NOT NULL DEFAULT '1' COMMENT '菜单类型（1：左侧主菜单；2：页面中的按钮；3：页面中标签）',
  `parent_id` bigint(16) NOT NULL COMMENT '父级菜单id',
  `title` varchar(64) NOT NULL COMMENT '菜单名称',
  `title_en` varchar(64) DEFAULT NULL COMMENT '菜单名称（英文）',
  `icon_pic` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(64) DEFAULT NULL COMMENT 'vue组件根路径',
  `component` varchar(64) DEFAULT NULL COMMENT 'vue的组件名',
  `element_id` varchar(32) DEFAULT NULL COMMENT '按钮id（页面级别唯一)',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效（默认1：有效；0：无效；）',
  `request_url` varchar(128) NOT NULL COMMENT '请求地址',
  `sort_order` int(8) NOT NULL DEFAULT '1' COMMENT '菜单的排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1555644237787932', '2', '1555665340855816', '给用户增加角色', null, null, '/role/add/to*', null, 'addRole', '1', '/role/add/to*', '5');
INSERT INTO `sys_menu` VALUES ('1555644280714295', '2', '1555404164368283', '给角色增加权限', null, null, '/permission/add/to*', null, 'addMenu', '1', '/permission/add/to*', '5');
INSERT INTO `sys_menu` VALUES ('1555644357649573', '2', '1555404164368283', '添加权限资源', null, null, '/permission/create*', null, 'createMenu', '1', '/permission/create*', '5');
INSERT INTO `sys_menu` VALUES ('1555657643454174', '2', '1555665340855816', '查看系统所有权限菜单', null, null, '/permission/list/get', null, '123', '1', '/permission/list/get', '1');
INSERT INTO `sys_menu` VALUES ('1555657749886239', '2', '1555665340855816', '查看系统所有角色', null, null, '/role/list/get', null, '12341', '1', '/role/list/get', '1');
INSERT INTO `sys_menu` VALUES ('1555659909669972', '1', '0', '操作管理', null, 'icon-caozuorizhi', '/menu/operation-management', null, null, '1', '/menu/operation-management', '1');
INSERT INTO `sys_menu` VALUES ('1555659963488148', '1', '1555659909669972', '空运下单', null, null, '/menu/operation-management/logistics-place-order-air', null, null, '1', '/menu/operation-management/logistics-place-order-air', '1');
INSERT INTO `sys_menu` VALUES ('1555659987279701', '1', '1555659909669972', '海运下单', null, null, '/menu/operation-management/logistics-place-order-sea', null, null, '1', '/menu/operation-management/logistics-place-order-sea', '2');
INSERT INTO `sys_menu` VALUES ('1555660008079195', '1', '1555659909669972', '订单管理', null, null, '/menu/operation-management/order-management', null, null, '1', '/menu/operation-management/order-management', '2');
INSERT INTO `sys_menu` VALUES ('1555660030866576', '1', '1555659909669972', '提货管理', null, null, '/menu/operation-management/pick-up-management2', null, null, '1', '/menu/operation-management/pick-up-management2', '4');
INSERT INTO `sys_menu` VALUES ('1555660048161603', '1', '1555659909669972', '订舱', null, null, '/menu/operation-management/booking-space', null, null, '1', '/menu/operation-management/booking-space', '5');
INSERT INTO `sys_menu` VALUES ('1555660109395138', '1', '1555659909669972', '交仓管理', null, null, '/menu/operation-management/handManagenment', null, null, '1', '/menu/operation-management/handManagenment', '6');
INSERT INTO `sys_menu` VALUES ('1555660144065828', '1', '1555659909669972', '入库', null, null, '/menu/operation-management/put-storage', null, null, '1', '/menu/operation-management/put-storage', '6');
INSERT INTO `sys_menu` VALUES ('1555661179325123', '1', '1555659909669972', '运单管理', 'waybill manage', null, '/menu/operation-management/waybill-manage', null, null, '1', '/menu/operation-management/waybill-manage', '7');
INSERT INTO `sys_menu` VALUES ('1555661247959403', '1', '1555659909669972', '压缩', 'compression', null, '/menu/operation-management/compression', null, null, '1', '/menu/operation-management/compression', '8');
INSERT INTO `sys_menu` VALUES ('1555661427787361', '1', '1555659909669972', '出库', 'out ware house', null, '/menu/operation-management/out-ware-house', null, null, '1', '/menu/operation-management/out-ware-house', '9');
INSERT INTO `sys_menu` VALUES ('1555661462609143', '1', '1555659909669972', '目的地-货物清单', 'destination goods list', null, '/menu/operation-management/toPart-GoodsList', null, null, '1', '/menu/operation-management/toPart-GoodsList', '10');
INSERT INTO `sys_menu` VALUES ('1555664071327835', '1', '1555659909669972', '目的地-取货管理', 'destination waybill', null, '/menu/operation-management/toPart-Waybill', null, null, '1', '/menu/operation-management/toPart-Waybill', '11');
INSERT INTO `sys_menu` VALUES ('1555664165515579', '1', '0', '销售管理', 'sales management', 'icon-kehu', '/menu/customers-and-service-providers', null, null, '1', '/menu/customers-and-service-providers', '2');
INSERT INTO `sys_menu` VALUES ('1555664242578525', '1', '1555664165515579', '客户管理', 'customer management', null, '/menu/customers-and-service-providers/customer-management', null, null, '1', '/menu/customers-and-service-providers/customer-management', '1');
INSERT INTO `sys_menu` VALUES ('1555664275137636', '1', '1555664165515579', '客户资料', 'customer info', null, '/menu/customers-and-service-providers/customer-info', null, null, '1', '/menu/customers-and-service-providers/customer-info', '2');
INSERT INTO `sys_menu` VALUES ('1555664505741215', '1', '1555664165515579', '客户组', 'customer group', null, '/menu/customers-and-service-providers/customer-group', null, null, '1', '/menu/customers-and-service-providers/customer-group', '3');
INSERT INTO `sys_menu` VALUES ('1555664634844953', '1', '1555664165515579', '服务商管理', 'service provider management', null, '/menu/customers-and-service-providers/service-provider-managemen', null, null, '1', '/menu/customers-and-service-providers/service-provider-management', '5');
INSERT INTO `sys_menu` VALUES ('1555664714614471', '1', '0', '价格管理', 'price management', 'icon-jiage', '/menu/price-management', null, null, '1', '/menu/price-management', '3');
INSERT INTO `sys_menu` VALUES ('1555664760198863', '1', '1555664714614471', '价格列表', 'price list', null, '/menu/price-management/price-list', null, null, '1', '/menu/price-management/price-list', '1');
INSERT INTO `sys_menu` VALUES ('1555664788951130', '1', '1555664714614471', '业务报价', 'business quotation', null, '/menu/price-management/business-quotation', null, null, '1', '/menu/price-management/business-quotation', '2');
INSERT INTO `sys_menu` VALUES ('1555664834365714', '1', '0', '财务管理', 'financial management', 'icon-caiwu', '/menu/financial-management', null, null, '1', '/menu/financial-management', '4');
INSERT INTO `sys_menu` VALUES ('1555664867764197', '1', '1555664834365714', '销售金额', 'receivables', null, '/menu/financial-management/receivables', null, null, '1', '/menu/financial-management/receivables', '1');
INSERT INTO `sys_menu` VALUES ('1555664898539526', '1', '1555664834365714', '成本管理', 'accounts payable', null, '/menu/financial-management/accounts-payable', null, null, '1', '/menu/financial-management/accounts-payable', '2');
INSERT INTO `sys_menu` VALUES ('1555664938613563', '1', '1555664834365714', '佣金管理', 'commission management', null, '/menu/financial-management/Commission-management', null, null, '1', '/menu/financial-management/Commission-management', '3');
INSERT INTO `sys_menu` VALUES ('1555664970701575', '1', '1555664834365714', '出纳管理', 'cashier management', null, '/menu/financial-management/cashier-management', null, null, '1', '/menu/financial-management/cashier-management', '4');
INSERT INTO `sys_menu` VALUES ('1555665003406184', '1', '1555664834365714', '统计报表', 'statistical form', null, '/menu/financial-management/statistical-form', null, null, '1', '/menu/financial-management/statistical-form', '5');
INSERT INTO `sys_menu` VALUES ('1555665032861203', '1', '1555664834365714', '科目管理', 'expense management', null, '/menu/financial-management/expense-management', null, null, '1', '/menu/financial-management/expense-management', '6');
INSERT INTO `sys_menu` VALUES ('1555665070078205', '1', '1555664834365714', '银行账户', 'bank account', null, '/menu/financial-management/bank-account', null, null, '1', '/menu/financial-management/bank-account', '7');
INSERT INTO `sys_menu` VALUES ('1555665103110335', '1', '1555664834365714', '币制管理', 'monetary management', null, '/menu/financial-management/Monetary-management', null, null, '1', '/menu/financial-management/Monetary-management', '8');
INSERT INTO `sys_menu` VALUES ('1555665157749697', '1', '0', '客服管理', 'price management', 'icon-kefu', '/menu/customer-service-management', null, null, '1', '/menu/customer-service-management', '5');
INSERT INTO `sys_menu` VALUES ('1555665211513458', '1', '1555665157749697', '问题件', 'problem pieces', null, '/menu/customer-service-management/problem-pieces', null, null, '1', '/menu/customer-service-management/problem-pieces', '1');
INSERT INTO `sys_menu` VALUES ('1555665258648209', '1', '0', '系统管理', 'system management', 'icon-tulai-xitongiconcopy', '/menu/system-management', null, null, '1', '/menu/system-management', '6');
INSERT INTO `sys_menu` VALUES ('1555665340855816', '1', '1555665258648209', '账号管理', 'account manage', null, '/menu/system-management/account-manage', null, null, '1', '/menu/system-management/account-manage', '1');
INSERT INTO `sys_menu` VALUES ('1555665368430381', '1', '1555665258648209', '权限组', 'permission group', null, '/menu/system-management/permission-group', null, null, '1', '/menu/system-management/permission-group', '2');
INSERT INTO `sys_menu` VALUES ('1555665442710605', '1', '1555665258648209', '常用发件地址', 'common sender address', null, '/menu/system-management/common-sending-address', null, null, '1', '/menu/system-management/common-sending-address', '4');
INSERT INTO `sys_menu` VALUES ('1555665469437602', '1', '1555665258648209', '常用收件人', 'common recipient', null, '/menu/system-management/common-recipients', null, null, '1', '/menu/system-management/common-recipients', '5');
INSERT INTO `sys_menu` VALUES ('1555665502558617', '1', '1555665258648209', '常用品名', 'regular name', null, '/menu/system-management/common-product-name', null, null, '1', '/menu/system-management/common-product-name', '6');
INSERT INTO `sys_menu` VALUES ('1555665502558618', '1', '1555665258648209', 'test', 'regular name test', null, '/test', null, null, '1', '/test', '6');

-- ----------------------------
-- Table structure for sys_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role`;
CREATE TABLE `sys_menu_role` (
  `id` bigint(16) NOT NULL,
  `menu_id` bigint(16) NOT NULL COMMENT '菜单编号',
  `role_id` bigint(16) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`menu_id`) USING BTREE,
  KEY `rid` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单-角色关联';

-- ----------------------------
-- Records of sys_menu_role
-- ----------------------------
INSERT INTO `sys_menu_role` VALUES ('1555038421157643', '1554889204758391', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555052003057859', '1555051802530375', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555052009457830', '1555051825023870', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555118037333834', '1555118002148511', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1555118082264743', '1555117864358950', '1554348527245584');
INSERT INTO `sys_menu_role` VALUES ('1555404116401705', '1555404008499247', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555404343775385', '1555404164368283', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555644536669892', '1555644357649573', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555644745522203', '1555644237787932', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555644779761508', '1555644280714295', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555646218684216', '1555642939516213', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1555657769443929', '1555657749886239', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555657844474366', '1555404008499247', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1555661179411935', '1555661179325123', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661248029676', '1555661247959403', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661427858861', '1555661427787361', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661462681705', '1555661462609143', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661699261880', '1555659963488148', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661712305443', '1555659987279701', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661719613937', '1555660008079195', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661728618470', '1555660030866576', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661736260914', '1555660048161603', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661744844234', '1555660109395138', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555661753221887', '1555660144065828', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664071394385', '1555664071327835', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664165585748', '1555664165515579', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664242646167', '1555664242578525', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664275210686', '1555664275137636', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664505818464', '1555664505741215', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664586820714', '1555664586735147', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664634930478', '1555664634844953', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664714692221', '1555664714614471', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664760275929', '1555664760198863', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664789027847', '1555664788951130', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664834441831', '1555664834365714', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664867845501', '1555664867764197', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664898615594', '1555664898539526', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664938688182', '1555664938613563', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555664970798616', '1555664970701575', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665003497768', '1555665003406184', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665032940541', '1555665032861203', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665070156611', '1555665070078205', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665103187140', '1555665103110335', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665157830595', '1555665157749697', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665211596677', '1555665211513458', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665258723160', '1555665258648209', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665340933273', '1555665340855816', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665368506323', '1555665368430381', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665409238659', '1555665409159273', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665442785986', '1555665442710605', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665469516275', '1555665469437602', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1555665502633515', '1555665502558617', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1556010875469109', '1555644237787932', '1554348527245315');
INSERT INTO `sys_menu_role` VALUES ('1556077356692386', '1555660008079195', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1556077395495261', '1555661247959403', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1556077403149653', '1555660048161603', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1556077511228404', '1555657749886239', '1554348527245314');
INSERT INTO `sys_menu_role` VALUES ('1556077576342642', '1555657749886239', '1554348527245584');
INSERT INTO `sys_menu_role` VALUES ('1556077591770581', '1555661462609143', '1554348527245584');
INSERT INTO `sys_menu_role` VALUES ('1556164235861529', '1556164235550905', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1556164243974332', '1556164243681579', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1556164253890727', '1556164253521782', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1556164253890728', '1555665502558618', '1554348527245589');
INSERT INTO `sys_menu_role` VALUES ('1556182531664318', '1555644237787932', '1556182531540993');
INSERT INTO `sys_menu_role` VALUES ('1556258741117001', '1555657749886239', '1556258740399525');
INSERT INTO `sys_menu_role` VALUES ('1556258741117002', '1555660008079195', '1556258740399525');
INSERT INTO `sys_menu_role` VALUES ('1556258741117003', '1555660048161603', '1556258740399525');
INSERT INTO `sys_menu_role` VALUES ('1556258741117004', '1555661247959403', '1556258740399525');
INSERT INTO `sys_menu_role` VALUES ('1556258741117637', '1555644237787932', '1556258740399525');
INSERT INTO `sys_menu_role` VALUES ('1556258788959245', '1555644237787932', '1556258788269996');
INSERT INTO `sys_menu_role` VALUES ('1556259440964383', '1555644237787932', '1556259440292666');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(16) NOT NULL,
  `name_en` varchar(64) DEFAULT NULL COMMENT '角色英文名称',
  `name_cn` varchar(64) DEFAULT NULL COMMENT '角色中文名称',
  `group_type` int(4) DEFAULT '1' COMMENT '组（默认1：主系统；2：子系统1；3：子系统2）',
  `on_alone` tinyint(1) DEFAULT '0' COMMENT '是否为独立角色（默认是0：共享角色；1：独立角色；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1554348527245314', 'ROLE_custom', '客户', '1', '0');
INSERT INTO `sys_role` VALUES ('1554348527245315', 'ROLE_employee_cdriver', '司机', '1', '0');
INSERT INTO `sys_role` VALUES ('1554348527245584', 'ROLE_supplier', '供应商', '1', '0');
INSERT INTO `sys_role` VALUES ('1554348527245589', 'ROLE_admin', '系统管理员', '1', '1');
INSERT INTO `sys_role` VALUES ('1555659572096324', 'ROLE_employee_sale', '销售员', '1', '0');
INSERT INTO `sys_role` VALUES ('1555659661185230', 'ROLE_employee_coperator', '操作员', '1', '0');
INSERT INTO `sys_role` VALUES ('1555659731394343', 'ROLE_employee_customer', '客服', '1', '0');
INSERT INTO `sys_role` VALUES ('1555727445886677', 'ROLE_employee_admin', '员工管理员', '1', '0');
INSERT INTO `sys_role` VALUES ('1556182531540993', 'ROLE_jiu', 'yushi', '1', '0');
INSERT INTO `sys_role` VALUES ('1556258740399525', 'ROLE_1236666', '123', '1', '0');
INSERT INTO `sys_role` VALUES ('1556258788269996', 'ROLE_77777', '123', '1', '0');
INSERT INTO `sys_role` VALUES ('1556259440292666', 'ROLE_6666666', '测试独立角色', '1', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(16) NOT NULL COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, null, null, null, '1', 'zhaoxi1', '$2a$10$0dHG4hmu6gvZ/EayMk5wK.BQbE59hLLCELj7nJP7vz5by2bBCl2Ai', null, null);
INSERT INTO `sys_user` VALUES ('59', '系统管理员', '18568887789', '029-82881234', '深圳南山', '1', 'admin', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', null);
INSERT INTO `sys_user` VALUES ('137', '李白', '18568123489', '029-82123434', '海口美兰', '1', 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', null);
INSERT INTO `sys_user` VALUES ('146', '韩愈', '18568123666', '029-82111555', '广州番禺', '1', 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', null);
INSERT INTO `sys_user` VALUES ('147', '柳宗元', '18568123377', '029-82111333', '广州天河', '1', 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', null);
INSERT INTO `sys_user` VALUES ('148', '曾巩', '18568128888', '029-82111222', '广州越秀', '1', 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', null);
INSERT INTO `sys_user` VALUES ('1554348527245332', '昭熙', '17722515203', null, null, '1', 'Healer', '$2a$10$16t9pxh0JeR8O12Njv49leWpzC1PuhbQ1dxvC/yVdudSoUoKhvkXK', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(16) NOT NULL,
  `user_id` bigint(16) NOT NULL,
  `role_id` bigint(16) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1554348767233916', '1554348527245332', '1554348527245589');
INSERT INTO `sys_user_role` VALUES ('1555038225632685', '1554348527245331', '1554348527245589');
INSERT INTO `sys_user_role` VALUES ('1555118174480980', '1554348527245322', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555379608095464', '1554366933450203', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555379864304265', '1555379305139592', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555409237664811', '1555406089462573', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555421765809212', '1555421508613342', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555464812268542', '1555464687235531', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555465755298448', '1555465681303796', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555466400664289', '1555466361373260', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555484780767812', '1554348527245321', '1554348527245589');
INSERT INTO `sys_user_role` VALUES ('1555495634741465', '1555495564837764', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555495709495640', '1555495648225437', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555495874629314', '1555495830187626', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555579003690724', '1555578976838485', '1554348527245584');
INSERT INTO `sys_user_role` VALUES ('1555643937256400', '137', '1554348527245589');
INSERT INTO `sys_user_role` VALUES ('1555645060481820', '136', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1555726677006878', '59', '1554348527245589');
INSERT INTO `sys_user_role` VALUES ('1556091775111970', '136', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556160123229768', '146', '1555659661185230');
INSERT INTO `sys_user_role` VALUES ('1556160229795705', '147', '1554348527245315');
INSERT INTO `sys_user_role` VALUES ('1556160230120639', '147', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556160436175152', '148', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556160436516608', '148', '1554348527245315');
INSERT INTO `sys_user_role` VALUES ('1556161501410930', '149', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556161501741875', '149', '1555659661185230');
INSERT INTO `sys_user_role` VALUES ('1556182531596847', '150', '1556182531540993');
INSERT INTO `sys_user_role` VALUES ('1556182679084265', '151', '1554348527245315');
INSERT INTO `sys_user_role` VALUES ('1556182679138627', '151', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1556250889593125', '146', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556251335558170', '146', '1554348527245314');
INSERT INTO `sys_user_role` VALUES ('1556251451890878', '146', '1555659731394343');
INSERT INTO `sys_user_role` VALUES ('1556251652936834', '146', '1555727445886677');
INSERT INTO `sys_user_role` VALUES ('1556253637698301', '151', '1555659572096324');
INSERT INTO `sys_user_role` VALUES ('1556253638074257', '151', '1554348527245584');
INSERT INTO `sys_user_role` VALUES ('1556257773319716', '152', '1554348527245315');
INSERT INTO `sys_user_role` VALUES ('1556257774207837', '152', '1555727445886677');
INSERT INTO `sys_user_role` VALUES ('1556258237261334', '156', '1554348527245315');
INSERT INTO `sys_user_role` VALUES ('1556258237595160', '156', '1555727445886677');
INSERT INTO `sys_user_role` VALUES ('1556258740754792', '158', '1556258740399525');
INSERT INTO `sys_user_role` VALUES ('1556258788610347', '159', '1556258788269996');
INSERT INTO `sys_user_role` VALUES ('1556259440629335', '161', '1556259440292666');

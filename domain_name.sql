/*
Navicat MySQL Data Transfer

Source Server         : 本地数据
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : domain_name

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-06-11 12:25:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dn_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_access`;
CREATE TABLE `dn_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- ----------------------------
-- Records of dn_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for dn_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_action`;
CREATE TABLE `dn_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of dn_admin_action
-- ----------------------------
INSERT INTO `dn_admin_action` VALUES ('1', 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', '1', '1480156399', '1480163853');
INSERT INTO `dn_admin_action` VALUES ('2', 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', '1', '1480164578', '1480297748');
INSERT INTO `dn_admin_action` VALUES ('3', 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', '1', '1480168582', '1480168616');
INSERT INTO `dn_admin_action` VALUES ('4', 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', '1', '1480169185', '1480169185');
INSERT INTO `dn_admin_action` VALUES ('5', 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', '1', '1480169214', '1480170581');
INSERT INTO `dn_admin_action` VALUES ('6', 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', '1', '1480221441', '1480221563');
INSERT INTO `dn_admin_action` VALUES ('7', 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', '1', '1480251473', '1480251473');
INSERT INTO `dn_admin_action` VALUES ('8', 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', '1', '1480252369', '1480252369');
INSERT INTO `dn_admin_action` VALUES ('9', 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', '1', '1480252580', '1480252580');
INSERT INTO `dn_admin_action` VALUES ('10', 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', '1', '1480252620', '1480252620');
INSERT INTO `dn_admin_action` VALUES ('11', 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', '1', '1480252651', '1480252651');
INSERT INTO `dn_admin_action` VALUES ('12', 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', '1', '1480253226', '1480253332');
INSERT INTO `dn_admin_action` VALUES ('13', 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', '1', '1480253267', '1480253340');
INSERT INTO `dn_admin_action` VALUES ('14', 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', '1', '1480253323', '1480253323');
INSERT INTO `dn_admin_action` VALUES ('15', 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', '1', '1480296196', '1480296196');
INSERT INTO `dn_admin_action` VALUES ('16', 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', '1', '1480296960', '1480296960');
INSERT INTO `dn_admin_action` VALUES ('17', 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', '1', '1480298479', '1480298479');
INSERT INTO `dn_admin_action` VALUES ('18', 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', '1', '1480298506', '1480298506');
INSERT INTO `dn_admin_action` VALUES ('19', 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', '1', '1480298532', '1480298532');
INSERT INTO `dn_admin_action` VALUES ('20', 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', '1', '1480298946', '1480298946');
INSERT INTO `dn_admin_action` VALUES ('21', 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', '1', '1480301990', '1480302022');
INSERT INTO `dn_admin_action` VALUES ('22', 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', '1', '1480302616', '1480302616');
INSERT INTO `dn_admin_action` VALUES ('23', 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', '1', '1480302798', '1480302798');
INSERT INTO `dn_admin_action` VALUES ('24', 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', '1', '1480302870', '1480302870');
INSERT INTO `dn_admin_action` VALUES ('25', 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', '1', '1480303198', '1480303198');
INSERT INTO `dn_admin_action` VALUES ('26', 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', '1', '1480303229', '1480303229');
INSERT INTO `dn_admin_action` VALUES ('27', 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', '1', '1480303264', '1480303264');
INSERT INTO `dn_admin_action` VALUES ('28', 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', '1', '1480303294', '1480303294');
INSERT INTO `dn_admin_action` VALUES ('29', 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', '1', '1480303409', '1480303409');
INSERT INTO `dn_admin_action` VALUES ('30', 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', '1', '1480305468', '1480305468');
INSERT INTO `dn_admin_action` VALUES ('31', 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', '1', '1480305513', '1480305513');
INSERT INTO `dn_admin_action` VALUES ('32', 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', '1', '1480305562', '1480305562');
INSERT INTO `dn_admin_action` VALUES ('33', 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', '1', '1480305630', '1480305630');
INSERT INTO `dn_admin_action` VALUES ('34', 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', '1', '1480305659', '1480305659');
INSERT INTO `dn_admin_action` VALUES ('35', 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', '1', '1480307558', '1480307558');
INSERT INTO `dn_admin_action` VALUES ('36', 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', '1', '1480307588', '1480307588');
INSERT INTO `dn_admin_action` VALUES ('37', 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', '1', '1480307618', '1480307618');
INSERT INTO `dn_admin_action` VALUES ('38', 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', '1', '1480307653', '1480307653');
INSERT INTO `dn_admin_action` VALUES ('39', 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', '1', '1480307682', '1480307682');
INSERT INTO `dn_admin_action` VALUES ('40', 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', '1', '1480308342', '1480308342');
INSERT INTO `dn_admin_action` VALUES ('41', 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', '1', '1480308372', '1480308372');
INSERT INTO `dn_admin_action` VALUES ('42', 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', '1', '1480309555', '1480309642');
INSERT INTO `dn_admin_action` VALUES ('43', 'cms', 'slider_delete', '删除滚动图片', '删除滚动图片', '', '[user|get_nickname] 删除了滚动图片：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('44', 'cms', 'slider_edit', '编辑滚动图片', '编辑滚动图片', '', '[user|get_nickname] 编辑了滚动图片：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('45', 'cms', 'slider_add', '添加滚动图片', '添加滚动图片', '', '[user|get_nickname] 添加了滚动图片：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('46', 'cms', 'document_delete', '删除文档', '删除文档', '', '[user|get_nickname] 删除了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('47', 'cms', 'document_restore', '还原文档', '还原文档', '', '[user|get_nickname] 还原了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('48', 'cms', 'nav_disable', '禁用导航', '禁用导航', '', '[user|get_nickname] 禁用了导航：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('49', 'cms', 'nav_enable', '启用导航', '启用导航', '', '[user|get_nickname] 启用了导航：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('50', 'cms', 'nav_delete', '删除导航', '删除导航', '', '[user|get_nickname] 删除了导航：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('51', 'cms', 'nav_edit', '编辑导航', '编辑导航', '', '[user|get_nickname] 编辑了导航：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('52', 'cms', 'nav_add', '添加导航', '添加导航', '', '[user|get_nickname] 添加了导航：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('53', 'cms', 'model_disable', '禁用内容模型', '禁用内容模型', '', '[user|get_nickname] 禁用了内容模型：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('54', 'cms', 'model_enable', '启用内容模型', '启用内容模型', '', '[user|get_nickname] 启用了内容模型：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('55', 'cms', 'model_delete', '删除内容模型', '删除内容模型', '', '[user|get_nickname] 删除了内容模型：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('56', 'cms', 'model_edit', '编辑内容模型', '编辑内容模型', '', '[user|get_nickname] 编辑了内容模型：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('57', 'cms', 'model_add', '添加内容模型', '添加内容模型', '', '[user|get_nickname] 添加了内容模型：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('58', 'cms', 'menu_disable', '禁用导航菜单', '禁用导航菜单', '', '[user|get_nickname] 禁用了导航菜单：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('59', 'cms', 'menu_enable', '启用导航菜单', '启用导航菜单', '', '[user|get_nickname] 启用了导航菜单：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('60', 'cms', 'menu_delete', '删除导航菜单', '删除导航菜单', '', '[user|get_nickname] 删除了导航菜单：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('61', 'cms', 'menu_edit', '编辑导航菜单', '编辑导航菜单', '', '[user|get_nickname] 编辑了导航菜单：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('62', 'cms', 'menu_add', '添加导航菜单', '添加导航菜单', '', '[user|get_nickname] 添加了导航菜单：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('63', 'cms', 'link_disable', '禁用友情链接', '禁用友情链接', '', '[user|get_nickname] 禁用了友情链接：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('64', 'cms', 'link_enable', '启用友情链接', '启用友情链接', '', '[user|get_nickname] 启用了友情链接：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('65', 'cms', 'link_delete', '删除友情链接', '删除友情链接', '', '[user|get_nickname] 删除了友情链接：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('66', 'cms', 'link_edit', '编辑友情链接', '编辑友情链接', '', '[user|get_nickname] 编辑了友情链接：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('67', 'cms', 'link_add', '添加友情链接', '添加友情链接', '', '[user|get_nickname] 添加了友情链接：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('68', 'cms', 'field_disable', '禁用模型字段', '禁用模型字段', '', '[user|get_nickname] 禁用了模型字段：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('69', 'cms', 'field_enable', '启用模型字段', '启用模型字段', '', '[user|get_nickname] 启用了模型字段：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('70', 'cms', 'field_delete', '删除模型字段', '删除模型字段', '', '[user|get_nickname] 删除了模型字段：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('71', 'cms', 'field_edit', '编辑模型字段', '编辑模型字段', '', '[user|get_nickname] 编辑了模型字段：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('72', 'cms', 'field_add', '添加模型字段', '添加模型字段', '', '[user|get_nickname] 添加了模型字段：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('73', 'cms', 'column_disable', '禁用栏目', '禁用栏目', '', '[user|get_nickname] 禁用了栏目：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('74', 'cms', 'column_enable', '启用栏目', '启用栏目', '', '[user|get_nickname] 启用了栏目：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('75', 'cms', 'column_delete', '删除栏目', '删除栏目', '', '[user|get_nickname] 删除了栏目：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('76', 'cms', 'column_edit', '编辑栏目', '编辑栏目', '', '[user|get_nickname] 编辑了栏目：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('77', 'cms', 'column_add', '添加栏目', '添加栏目', '', '[user|get_nickname] 添加了栏目：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('78', 'cms', 'advert_type_disable', '禁用广告分类', '禁用广告分类', '', '[user|get_nickname] 禁用了广告分类：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('79', 'cms', 'advert_type_enable', '启用广告分类', '启用广告分类', '', '[user|get_nickname] 启用了广告分类：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('80', 'cms', 'advert_type_delete', '删除广告分类', '删除广告分类', '', '[user|get_nickname] 删除了广告分类：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('81', 'cms', 'advert_type_edit', '编辑广告分类', '编辑广告分类', '', '[user|get_nickname] 编辑了广告分类：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('82', 'cms', 'advert_type_add', '添加广告分类', '添加广告分类', '', '[user|get_nickname] 添加了广告分类：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('83', 'cms', 'advert_disable', '禁用广告', '禁用广告', '', '[user|get_nickname] 禁用了广告：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('84', 'cms', 'advert_enable', '启用广告', '启用广告', '', '[user|get_nickname] 启用了广告：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('85', 'cms', 'advert_delete', '删除广告', '删除广告', '', '[user|get_nickname] 删除了广告：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('86', 'cms', 'advert_edit', '编辑广告', '编辑广告', '', '[user|get_nickname] 编辑了广告：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('87', 'cms', 'advert_add', '添加广告', '添加广告', '', '[user|get_nickname] 添加了广告：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('88', 'cms', 'document_disable', '禁用文档', '禁用文档', '', '[user|get_nickname] 禁用了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('89', 'cms', 'document_enable', '启用文档', '启用文档', '', '[user|get_nickname] 启用了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('90', 'cms', 'document_trash', '回收文档', '回收文档', '', '[user|get_nickname] 回收了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('91', 'cms', 'document_edit', '编辑文档', '编辑文档', '', '[user|get_nickname] 编辑了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('92', 'cms', 'document_add', '添加文档', '添加文档', '', '[user|get_nickname] 添加了文档：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('93', 'cms', 'slider_enable', '启用滚动图片', '启用滚动图片', '', '[user|get_nickname] 启用了滚动图片：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('94', 'cms', 'slider_disable', '禁用滚动图片', '禁用滚动图片', '', '[user|get_nickname] 禁用了滚动图片：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('95', 'cms', 'support_add', '添加客服', '添加客服', '', '[user|get_nickname] 添加了客服：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('96', 'cms', 'support_edit', '编辑客服', '编辑客服', '', '[user|get_nickname] 编辑了客服：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('97', 'cms', 'support_delete', '删除客服', '删除客服', '', '[user|get_nickname] 删除了客服：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('98', 'cms', 'support_enable', '启用客服', '启用客服', '', '[user|get_nickname] 启用了客服：[details]', '1', '1525785270', '1525785270');
INSERT INTO `dn_admin_action` VALUES ('99', 'cms', 'support_disable', '禁用客服', '禁用客服', '', '[user|get_nickname] 禁用了客服：[details]', '1', '1525785270', '1525785270');

-- ----------------------------
-- Table structure for dn_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_attachment`;
CREATE TABLE `dn_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dn_admin_attachment
-- ----------------------------
INSERT INTO `dn_admin_attachment` VALUES ('1', '1', 'logo.png', 'admin', 'uploads/images/20180510/54cf2f571347529d79e20cef1363c5a9.png', '', '', 'image/png', 'png', '19386', '9169884456ecefdaac76ba1533a2ae04', '1e7dca5987ecfcb0086621378e6c54147cd2bde9', 'local', '0', '1525939235', '1525939235', '100', '1', '155', '128');
INSERT INTO `dn_admin_attachment` VALUES ('2', '1', 'logo-text.png', 'admin', 'uploads/images/20180510/c1c7ed3cfd2858d76d8057420c85278c.png', '', '', 'image/png', 'png', '9601', '9175ea6c2fc706cfcf17351914b7bc9a', 'f182e8f5b6ccc34068b8ca5cfa19b329127f0f96', 'local', '0', '1525939240', '1525939240', '100', '1', '127', '64');
INSERT INTO `dn_admin_attachment` VALUES ('3', '1', 'logo-text.png', 'admin', 'uploads/images/20180510/141a157bf8ae7b1b5571980f84cf91e0.png', '', '', 'image/png', 'png', '3513', '3227990ddcccc7857d84960d89958288', '8e756ae3e9437ae6343f58a00d7e84861f789612', 'local', '0', '1525940538', '1525940538', '100', '1', '127', '64');
INSERT INTO `dn_admin_attachment` VALUES ('4', '1', 'ads.png', 'cms', 'uploads/images/20180514/cdc2ab7669db1b1f35500ebe1d080c55.png', '', '', 'image/png', 'png', '72689', '70c320f1d4a71cf78aa82f90afeb3c02', '50502a082981cb1281c8e168794dc9304ef67ed3', 'local', '0', '1526267321', '1526267321', '100', '1', '280', '184');
INSERT INTO `dn_admin_attachment` VALUES ('5', '1', '64380cd7912397dd3e7a6dbc5582b2b7d0a28703.jpg', 'cms', 'uploads/images/20180514/fce093edfb0afb55243bd43e686921f3.jpg', '', '', 'image/jpeg', 'jpg', '282350', 'f1586d0d65e0774e105afe7f44ccbc3c', '56a083a64a7972ec7b3d3de8fd0bcb20555b270d', 'local', '0', '1526272850', '1526272850', '100', '1', '544', '352');
INSERT INTO `dn_admin_attachment` VALUES ('6', '1', '01.png', 'cms', 'uploads/images/20180518/52918c4a3ae454ac9f8e2106ec0f8754.png', '', '', 'image/png', 'png', '314338', '3309b480ea34b6267aefdecd352b2497', '4b23201a5daf35148716c5ae60c7e5dd12394d58', 'local', '0', '1526629560', '1526629560', '100', '1', '1200', '701');
INSERT INTO `dn_admin_attachment` VALUES ('7', '1', '微信图片_20180522151159.png', 'admin', 'uploads/images/20180525/58e6337204584a2a185d5d724a50b0c7.png', '', '', 'image/png', 'png', '139049', '00f1b2a76e5696919a91f459063873df', '96d3d627f231ef96f254bfa39f28f92e14ac669d', 'local', '0', '1527225289', '1527225289', '100', '1', '794', '600');
INSERT INTO `dn_admin_attachment` VALUES ('8', '1', 'timg.bmp', 'admin', 'uploads/images/20180525/858f484bcb5444a0d46a2a34d1c9f633.bmp', '', '', 'image/bmp', 'bmp', '50353', 'e79763f45025f02d623440923aff6e5f', 'e711852bbff70ba15ef90f867d41e7829ee35ee9', 'local', '0', '1527225338', '1527225338', '100', '1', '720', '842');
INSERT INTO `dn_admin_attachment` VALUES ('9', '1', 'timg.bmp', 'admin', 'uploads/images/20180525/543644f990d3132f926a2c59c586d518.bmp', '', '', 'image/bmp', 'bmp', '516607', '131947444e99c622d3f4e2ab3c21c243', '0de217e4c7f4adc6e408c14aaa8afd31314649c4', 'local', '0', '1527225523', '1527225523', '100', '1', '2400', '2806');
INSERT INTO `dn_admin_attachment` VALUES ('10', '2', 'JPG测试图片.jpg', 'cms', 'uploads/images/20180525/36ec9a4cd8d577274d69201f0befc850.jpg', '', '', 'image/jpeg', 'jpg', '59831', 'b21d7b9964d9b3676fce8a4ff497676a', 'cefda25600168015c7dcffe7c6dff825eb566570', 'local', '0', '1527230475', '1527230475', '100', '1', '500', '500');
INSERT INTO `dn_admin_attachment` VALUES ('11', '2', 'PNG测试图片.png', 'cms', 'uploads/images/20180525/fc65beab9d0c032f881f47c69a48d0b1.png', '', '', 'image/png', 'png', '48875', 'db4a11eaba0c8f90d79791c60e11af58', '69499c1ee060c12b27755165a8b501ce501c139c', 'local', '0', '1527230479', '1527230479', '100', '1', '500', '500');
INSERT INTO `dn_admin_attachment` VALUES ('12', '2', 'Gif测试图片.gif', 'cms', 'uploads/images/20180525/900f3a3575eb93bdeec2bade9a84d9fc.gif', '', '', 'image/gif', 'gif', '36838', '370151d7851b6dfb909cbde423a410f6', '3c908d29ca7c66f22fd43d69b16a36bebba756b4', 'local', '0', '1527230482', '1527230482', '100', '1', '500', '500');
INSERT INTO `dn_admin_attachment` VALUES ('13', '1', 'logo.jpg', 'admin', 'uploads/images/20180528/d0ff4e92f0e01cea68bb5a74b20193ed.jpg', '', '', 'image/jpeg', 'jpg', '5510', '4fb3e2330d41beff7f2f7babc1ef11de', '666b6bc48006924fc6ff0903698f725785a213b9', 'local', '0', '1527488797', '1527488797', '100', '1', '177', '177');
INSERT INTO `dn_admin_attachment` VALUES ('14', '1', 'ad2.jpg', 'cms', 'uploads/images/20180528/7f19a5ef1852c7c5bc4d8c6b0926d752.jpg', '', '', 'image/jpeg', 'jpg', '71066', '4ee21f3b745e251f7bab318a7a710ddc', 'a7c0498f6713bd5fa6577800729c5c53908c0852', 'local', '0', '1527500789', '1527500789', '100', '1', '1200', '120');

-- ----------------------------
-- Table structure for dn_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_config`;
CREATE TABLE `dn_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of dn_admin_config
-- ----------------------------
INSERT INTO `dn_admin_config` VALUES ('1', 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', '2', '', '', '', '', '1475240395', '1477403914', '1', '1');
INSERT INTO `dn_admin_config` VALUES ('2', 'web_site_title', '站点标题', 'base', 'text', '二零一八实业集团', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240646', '1477710341', '2', '1');
INSERT INTO `dn_admin_config` VALUES ('3', 'web_site_slogan', '站点标语', 'base', 'text', '二零一八实业集团，极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240994', '1477710357', '3', '1');
INSERT INTO `dn_admin_config` VALUES ('4', 'web_site_logo', '站点LOGO', 'base', 'image', '13', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241067', '1475241067', '4', '1');
INSERT INTO `dn_admin_config` VALUES ('5', 'web_site_description', '站点描述', 'base', 'textarea', '域名交易网站', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', '2', '', '', '', '', '1475241186', '1475241186', '6', '1');
INSERT INTO `dn_admin_config` VALUES ('6', 'web_site_keywords', '站点关键词', 'base', 'text', '二零一八实业集团、16820、201818', '', '网站搜索引擎关键字', '', '', '', '', '', '2', '', '', '', '', '1475241328', '1475241328', '7', '1');
INSERT INTO `dn_admin_config` VALUES ('7', 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright 2017 © 安徽二零一八实业集团 All Rights Reserved', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241416', '1477710383', '8', '1');
INSERT INTO `dn_admin_config` VALUES ('8', 'web_site_icp', '备案信息', 'base', 'text', '皖ICP备17028567号-2', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241441', '1477710441', '9', '1');
INSERT INTO `dn_admin_config` VALUES ('9', 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241498', '1477710455', '10', '1');
INSERT INTO `dn_admin_config` VALUES ('10', 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241716', '1477649446', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('11', 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241835', '1495853193', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('12', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475241897', '1477663520', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('13', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475241975', '1477649489', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('14', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475242015', '1477663529', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('15', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,png,bmp', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475242056', '1477649506', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('16', 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', '2', '', '', '', '', '1475242066', '1476074507', '101', '1');
INSERT INTO `dn_admin_config` VALUES ('17', 'system_color', '后台配色方案', 'system', 'radio', 'smooth', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', '2', '', '', '', '', '1475250066', '1477316689', '102', '1');
INSERT INTO `dn_admin_config` VALUES ('18', 'develop_mode', '开发模式', 'develop', 'radio', '0', '0:关闭\r\n1:开启', '', '', '', '', '', '', '2', '', '', '', '', '1476864205', '1476864231', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('19', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', '2', '', '', '', '', '1476866355', '1476866355', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('21', 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', '2', '', '', '', '', '1477017745', '1477018467', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('22', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', '2', '', '', '', '', '1477017886', '1477017886', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('23', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', '2', '', '', '', '', '1477017978', '1477018172', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('24', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', '2', '', '', '', '', '1477018083', '1477018083', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('25', 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', '2', '', '', '', '', '1477579289', '1477579289', '103', '1');
INSERT INTO `dn_admin_config` VALUES ('26', 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '3', '', '', '', '', '', '', '', '2', '', '', '', '', '1477620643', '1477620643', '5', '1');
INSERT INTO `dn_admin_config` VALUES ('27', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', '2', '', '', '', '', '1477644150', '1477649513', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('28', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', '2', '', '', '', '', '1477646271', '1477649521', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('29', 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', '2', '', '', '', '', '1477649648', '1477649648', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('30', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656390', '1477656390', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('31', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656528', '1477656528', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('32', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', '2', '', '', '', '', '1477656714', '1477661309', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('33', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', '2', '', '', '', '', '1477727305', '1477727305', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('34', 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', '2', '', '', '', '', '1478771958', '1478771958', '99', '1');
INSERT INTO `dn_admin_config` VALUES ('35', 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', '0', '', '', '', '', '1486714723', '1486715620', '104', '1');
INSERT INTO `dn_admin_config` VALUES ('36', 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', '0', '', '', '', '', '1487035843', '1487035843', '99', '1');
INSERT INTO `dn_admin_config` VALUES ('37', 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', '0', '', '', '', '', '1501488567', '1501490821', '100', '1');
INSERT INTO `dn_admin_config` VALUES ('38', 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', '0', '', '', '', '', '1512635391', '1512635391', '99', '1');

-- ----------------------------
-- Table structure for dn_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_hook`;
CREATE TABLE `dn_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of dn_admin_hook
-- ----------------------------
INSERT INTO `dn_admin_hook` VALUES ('1', 'admin_index', '', '后台首页', '1', '1468174214', '1477757518', '1');
INSERT INTO `dn_admin_hook` VALUES ('2', 'plugin_index_tab_list', '', '插件扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dn_admin_hook` VALUES ('3', 'module_index_tab_list', '', '模块扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `dn_admin_hook` VALUES ('4', 'page_tips', '', '每个页面的提示', '1', '1468174214', '1468174214', '1');
INSERT INTO `dn_admin_hook` VALUES ('5', 'signin_footer', '', '登录页面底部钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dn_admin_hook` VALUES ('6', 'signin_captcha', '', '登录页面验证码钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `dn_admin_hook` VALUES ('7', 'signin', '', '登录控制器钩子', '1', '1479386875', '1479386875', '1');
INSERT INTO `dn_admin_hook` VALUES ('8', 'upload_attachment', '', '附件上传钩子', '1', '1501493808', '1501493808', '1');
INSERT INTO `dn_admin_hook` VALUES ('9', 'page_plugin_js', '', '页面插件js钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('10', 'page_plugin_css', '', '页面插件css钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('11', 'signin_sso', '', '单点登录钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('12', 'signout_sso', '', '单点退出钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('13', 'user_add', '', '添加用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('14', 'user_edit', '', '编辑用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('15', 'user_delete', '', '删除用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('16', 'user_enable', '', '启用用户钩子', '1', '1503633591', '1503633591', '1');
INSERT INTO `dn_admin_hook` VALUES ('17', 'user_disable', '', '禁用用户钩子', '1', '1503633591', '1503633591', '1');

-- ----------------------------
-- Table structure for dn_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_hook_plugin`;
CREATE TABLE `dn_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

-- ----------------------------
-- Records of dn_admin_hook_plugin
-- ----------------------------
INSERT INTO `dn_admin_hook_plugin` VALUES ('1', 'admin_index', 'SystemInfo', '1477757503', '1477757503', '1', '1');
INSERT INTO `dn_admin_hook_plugin` VALUES ('2', 'admin_index', 'DevTeam', '1477755780', '1477755780', '2', '1');

-- ----------------------------
-- Table structure for dn_admin_icon
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_icon`;
CREATE TABLE `dn_admin_icon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标表';

-- ----------------------------
-- Records of dn_admin_icon
-- ----------------------------

-- ----------------------------
-- Table structure for dn_admin_icon_list
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_icon_list`;
CREATE TABLE `dn_admin_icon_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='详细图标列表';

-- ----------------------------
-- Records of dn_admin_icon_list
-- ----------------------------

-- ----------------------------
-- Table structure for dn_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_log`;
CREATE TABLE `dn_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of dn_admin_log
-- ----------------------------
INSERT INTO `dn_admin_log` VALUES ('1', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：门户', '1', '1525785270');
INSERT INTO `dn_admin_log` VALUES ('2', '31', '1', '2130706433', 'admin_menu', '254', '超级管理员 编辑了节点：节点ID(254)', '1', '1525787552');
INSERT INTO `dn_admin_log` VALUES ('3', '31', '1', '2130706433', 'admin_menu', '244', '超级管理员 编辑了节点：节点ID(244)', '1', '1525787688');
INSERT INTO `dn_admin_log` VALUES ('4', '31', '1', '2130706433', 'admin_menu', '244', '超级管理员 编辑了节点：节点ID(244)', '1', '1525787885');
INSERT INTO `dn_admin_log` VALUES ('5', '30', '1', '2130706433', 'admin_menu', '327', '超级管理员 添加了节点：所属模块(cms),所属节点ID(254),节点标题(域名类型),节点链接(cms/dntype/index)', '1', '1525788235');
INSERT INTO `dn_admin_log` VALUES ('6', '31', '1', '2130706433', 'admin_menu', '237', '超级管理员 编辑了节点：节点ID(237)', '1', '1525865507');
INSERT INTO `dn_admin_log` VALUES ('7', '31', '1', '2130706433', 'admin_menu', '238', '超级管理员 编辑了节点：节点ID(238)', '1', '1525865590');
INSERT INTO `dn_admin_log` VALUES ('8', '34', '1', '2130706433', 'admin_menu', '251', '超级管理员 禁用了节点：节点ID(251),节点标题(回收站),节点链接(cms/recycle/index)', '1', '1525865665');
INSERT INTO `dn_admin_log` VALUES ('9', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1525866172');
INSERT INTO `dn_admin_log` VALUES ('10', '30', '1', '2130706433', 'admin_menu', '334', '超级管理员 添加了节点：所属模块(cms),所属节点ID(255),节点标题(用户留言),节点链接(cms/massage/index)', '1', '1525885824');
INSERT INTO `dn_admin_log` VALUES ('11', '31', '1', '2130706433', 'admin_menu', '334', '超级管理员 编辑了节点：节点ID(334)', '1', '1525885883');
INSERT INTO `dn_admin_log` VALUES ('12', '30', '1', '2130706433', 'admin_menu', '341', '超级管理员 添加了节点：所属模块(cms),所属节点ID(244),节点标题(导入数据),节点链接(cms/page/import)', '1', '1525934205');
INSERT INTO `dn_admin_log` VALUES ('13', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1525939243');
INSERT INTO `dn_admin_log` VALUES ('14', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1525940131');
INSERT INTO `dn_admin_log` VALUES ('15', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1525940541');
INSERT INTO `dn_admin_log` VALUES ('16', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526110731');
INSERT INTO `dn_admin_log` VALUES ('17', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526110754');
INSERT INTO `dn_admin_log` VALUES ('18', '31', '1', '2130706433', 'admin_menu', '270', '超级管理员 编辑了节点：节点ID(270)', '1', '1526267204');
INSERT INTO `dn_admin_log` VALUES ('19', '31', '1', '2130706433', 'admin_menu', '256', '超级管理员 编辑了节点：节点ID(256)', '1', '1526267237');
INSERT INTO `dn_admin_log` VALUES ('20', '45', '1', '2130706433', 'cms_slider', '1', '超级管理员 添加了滚动图片：热门广告热门广告热门广告', '1', '1526267322');
INSERT INTO `dn_admin_log` VALUES ('21', '45', '1', '2130706433', 'cms_slider', '2', '超级管理员 添加了滚动图片：热门广告热门广告热门广告', '1', '1526267336');
INSERT INTO `dn_admin_log` VALUES ('22', '45', '1', '2130706433', 'cms_slider', '1', '超级管理员 添加了滚动图片：热门广告热门广告热门广告', '1', '1526267382');
INSERT INTO `dn_admin_log` VALUES ('23', '45', '1', '2130706433', 'cms_slider', '2', '超级管理员 添加了滚动图片：热门广告热门广告热门广告', '1', '1526267392');
INSERT INTO `dn_admin_log` VALUES ('24', '45', '1', '2130706433', 'cms_slider', '1', '超级管理员 添加了滚动图片：啦啦啦啦', '1', '1526271787');
INSERT INTO `dn_admin_log` VALUES ('25', '45', '1', '2130706433', 'cms_slider', '3', '超级管理员 添加了滚动图片：洗车蜡', '1', '1526272852');
INSERT INTO `dn_admin_log` VALUES ('26', '45', '1', '2130706433', 'cms_slider', '3', '超级管理员 添加了滚动图片：洗车蜡', '1', '1526273248');
INSERT INTO `dn_admin_log` VALUES ('27', '44', '1', '2130706433', 'cms_slider', '1', '超级管理员 编辑了滚动图片：字段(status)，原值(1)，新值：(false)', '1', '1526274959');
INSERT INTO `dn_admin_log` VALUES ('28', '44', '1', '2130706433', 'cms_slider', '2', '超级管理员 编辑了滚动图片：字段(status)，原值(1)，新值：(false)', '1', '1526275066');
INSERT INTO `dn_admin_log` VALUES ('29', '44', '1', '2130706433', 'cms_slider', '2', '超级管理员 编辑了滚动图片：字段(status)，原值(0)，新值：(true)', '1', '1526275071');
INSERT INTO `dn_admin_log` VALUES ('30', '44', '1', '2130706433', 'cms_slider', '1', '超级管理员 编辑了滚动图片：字段(status)，原值(0)，新值：(true)', '1', '1526275072');
INSERT INTO `dn_admin_log` VALUES ('31', '43', '1', '3232236455', 'cms_slider', '0', '超级管理员 删除了滚动图片：啦啦啦啦、热门广告热门广告热门广告、洗车蜡', '1', '1526370516');
INSERT INTO `dn_admin_log` VALUES ('32', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526460730');
INSERT INTO `dn_admin_log` VALUES ('33', '34', '1', '2130706433', 'admin_menu', '214', '超级管理员 禁用了节点：节点ID(214),节点标题(消息管理),节点链接()', '1', '1526620184');
INSERT INTO `dn_admin_log` VALUES ('34', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526628189');
INSERT INTO `dn_admin_log` VALUES ('35', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526628703');
INSERT INTO `dn_admin_log` VALUES ('36', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526628708');
INSERT INTO `dn_admin_log` VALUES ('37', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526628715');
INSERT INTO `dn_admin_log` VALUES ('38', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1526628722');
INSERT INTO `dn_admin_log` VALUES ('39', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1526628934');
INSERT INTO `dn_admin_log` VALUES ('40', '45', '1', '2130706433', 'cms_slider', '4', '超级管理员 添加了滚动图片：1212', '1', '1526629569');
INSERT INTO `dn_admin_log` VALUES ('41', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(title)，原值(1212)，新值：(12121)', '1', '1526629673');
INSERT INTO `dn_admin_log` VALUES ('42', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(sort)，原值(100)，新值：(1001)', '1', '1526629751');
INSERT INTO `dn_admin_log` VALUES ('43', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(title)，原值(12121)，新值：(121sad)', '1', '1526629872');
INSERT INTO `dn_admin_log` VALUES ('44', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(sort)，原值(1001)，新值：(311)', '1', '1526629888');
INSERT INTO `dn_admin_log` VALUES ('45', '93', '1', '2130706433', 'cms_slider', '0', '超级管理员 启用了滚动图片：121sad', '1', '1526630101');
INSERT INTO `dn_admin_log` VALUES ('46', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(urls)，原值(www.baidu.com)，新值：(www.baidu.com1)', '1', '1526631109');
INSERT INTO `dn_admin_log` VALUES ('47', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(urls)，原值(www.baidu.com1)，新值：()', '1', '1526631118');
INSERT INTO `dn_admin_log` VALUES ('48', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(www.baidu.com)', '1', '1526631125');
INSERT INTO `dn_admin_log` VALUES ('49', '44', '1', '2130706433', 'cms_slider', '4', '超级管理员 编辑了滚动图片：字段(urls)，原值(www.baidu.com)，新值：(www.baid1u.com)', '1', '1526692424');
INSERT INTO `dn_admin_log` VALUES ('50', '77', '1', '2130706433', 'cms_column', '1', '超级管理员 添加了栏目：1', '1', '1526695014');
INSERT INTO `dn_admin_log` VALUES ('51', '30', '1', '2130706433', 'admin_menu', '342', '超级管理员 添加了节点：所属模块(cms),所属节点ID(255),节点标题(短息管理),节点链接(cms/phone/index)', '1', '1527175569');
INSERT INTO `dn_admin_log` VALUES ('52', '31', '1', '2130706433', 'admin_menu', '342', '超级管理员 编辑了节点：节点ID(342)', '1', '1527176996');
INSERT INTO `dn_admin_log` VALUES ('53', '32', '1', '2130706433', 'admin_menu', '342', '超级管理员 删除了节点：节点ID(342),节点标题(短息管理),节点链接(cms/phone/index)', '1', '1527177654');
INSERT INTO `dn_admin_log` VALUES ('54', '30', '1', '2130706433', 'admin_menu', '343', '超级管理员 添加了节点：所属模块(cms),所属节点ID(255),节点标题(短信控制),节点链接(cms/phone/index)', '1', '1527177700');
INSERT INTO `dn_admin_log` VALUES ('55', '32', '1', '2130706433', 'admin_menu', '343', '超级管理员 删除了节点：节点ID(343),节点标题(短信控制),节点链接(cms/phone/index)', '1', '1527177739');
INSERT INTO `dn_admin_log` VALUES ('56', '30', '1', '2130706433', 'admin_menu', '348', '超级管理员 添加了节点：所属模块(cms),所属节点ID(255),节点标题(短信控制),节点链接(cms/phone/index)', '1', '1527177772');
INSERT INTO `dn_admin_log` VALUES ('57', '31', '1', '2130706433', 'admin_menu', '348', '超级管理员 编辑了节点：节点ID(348)', '1', '1527177821');
INSERT INTO `dn_admin_log` VALUES ('58', '7', '1', '2130706433', 'admin_role', '2', '超级管理员 添加了角色：测试', '1', '1527224486');
INSERT INTO `dn_admin_log` VALUES ('59', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：测试', '1', '1527224497');
INSERT INTO `dn_admin_log` VALUES ('60', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：测试', '1', '1527224529');
INSERT INTO `dn_admin_log` VALUES ('61', '1', '1', '2130706433', 'admin_user', '2', '超级管理员 添加了用户：测试工程师', '1', '1527224566');
INSERT INTO `dn_admin_log` VALUES ('62', '8', '1', '2130706433', 'admin_role', '2', '超级管理员 编辑了角色：测试', '1', '1527224636');
INSERT INTO `dn_admin_log` VALUES ('63', '6', '1', '2130706433', 'admin_user', '2', '超级管理员 对用户：测试工程师 进行了授权操作。详情：模块(cms)，分组(group)，授权节点ID(1)', '1', '1527225162');
INSERT INTO `dn_admin_log` VALUES ('64', '6', '1', '2130706433', 'admin_user', '2', '超级管理员 对用户：测试工程师 进行了授权操作。详情：模块(cms)，分组(group)，授权节点ID(无)', '1', '1527225170');
INSERT INTO `dn_admin_log` VALUES ('65', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(upload)', '1', '1527225228');
INSERT INTO `dn_admin_log` VALUES ('66', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(upload)', '1', '1527225259');
INSERT INTO `dn_admin_log` VALUES ('67', '45', '2', '3232236539', 'cms_slider', '5', '测试工程师 添加了滚动图片：吴多利亚的秘密', '1', '1527230503');
INSERT INTO `dn_admin_log` VALUES ('68', '45', '2', '3232236519', 'cms_slider', '6', '测试工程师 添加了滚动图片：读后感科技风科技', '1', '1527232611');
INSERT INTO `dn_admin_log` VALUES ('69', '94', '2', '3232236519', 'cms_slider', '0', '测试工程师 禁用了滚动图片：121sad、吴多利亚的秘密、读后感科技风科技', '1', '1527232624');
INSERT INTO `dn_admin_log` VALUES ('70', '93', '2', '3232236519', 'cms_slider', '0', '测试工程师 启用了滚动图片：121sad、吴多利亚的秘密、读后感科技风科技', '1', '1527232630');
INSERT INTO `dn_admin_log` VALUES ('71', '44', '2', '3232236519', 'cms_slider', '6', '测试工程师 编辑了滚动图片：字段(urls)，原值(http)，新值：(http:www.com)', '1', '1527233806');
INSERT INTO `dn_admin_log` VALUES ('72', '7', '1', '2130706433', 'admin_role', '3', '超级管理员 添加了角色：12', '1', '1527234595');
INSERT INTO `dn_admin_log` VALUES ('73', '1', '1', '2130706433', 'admin_user', '3', '超级管理员 添加了用户：21', '1', '1527234621');
INSERT INTO `dn_admin_log` VALUES ('74', '8', '1', '2130706433', 'admin_role', '3', '超级管理员 编辑了角色：字段(access)，原值(0)，新值：(true)', '1', '1527234628');
INSERT INTO `dn_admin_log` VALUES ('75', '9', '1', '2130706433', 'admin_role', '3', '超级管理员 删除了角色：12', '1', '1527234630');
INSERT INTO `dn_admin_log` VALUES ('76', '43', '2', '3232236519', 'cms_slider', '0', '测试工程师 删除了滚动图片：121sad、吴多利亚的秘密、读后感科技风科技', '1', '1527238152');
INSERT INTO `dn_admin_log` VALUES ('77', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527484953');
INSERT INTO `dn_admin_log` VALUES ('78', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527484966');
INSERT INTO `dn_admin_log` VALUES ('79', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485001');
INSERT INTO `dn_admin_log` VALUES ('80', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485008');
INSERT INTO `dn_admin_log` VALUES ('81', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485016');
INSERT INTO `dn_admin_log` VALUES ('82', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485022');
INSERT INTO `dn_admin_log` VALUES ('83', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485686');
INSERT INTO `dn_admin_log` VALUES ('84', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485697');
INSERT INTO `dn_admin_log` VALUES ('85', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485717');
INSERT INTO `dn_admin_log` VALUES ('86', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527485991');
INSERT INTO `dn_admin_log` VALUES ('87', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527486124');
INSERT INTO `dn_admin_log` VALUES ('88', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527487492');
INSERT INTO `dn_admin_log` VALUES ('89', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(develop)', '1', '1527487641');
INSERT INTO `dn_admin_log` VALUES ('90', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1527487684');
INSERT INTO `dn_admin_log` VALUES ('91', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527487781');
INSERT INTO `dn_admin_log` VALUES ('92', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527487832');
INSERT INTO `dn_admin_log` VALUES ('93', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527487968');
INSERT INTO `dn_admin_log` VALUES ('94', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527488038');
INSERT INTO `dn_admin_log` VALUES ('95', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527488101');
INSERT INTO `dn_admin_log` VALUES ('96', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1527488808');
INSERT INTO `dn_admin_log` VALUES ('97', '45', '1', '2130706433', 'cms_slider', '7', '超级管理员 添加了滚动图片：123', '1', '1527495965');
INSERT INTO `dn_admin_log` VALUES ('98', '45', '1', '2130706433', 'cms_slider', '8', '超级管理员 添加了滚动图片：asd', '1', '1527500793');
INSERT INTO `dn_admin_log` VALUES ('99', '43', '1', '2130706433', 'cms_slider', '0', '超级管理员 删除了滚动图片：123', '1', '1527500803');
INSERT INTO `dn_admin_log` VALUES ('100', '45', '1', '2130706433', 'cms_slider', '9', '超级管理员 添加了滚动图片：asd', '1', '1527500820');
INSERT INTO `dn_admin_log` VALUES ('101', '45', '1', '2130706433', 'cms_slider', '10', '超级管理员 添加了滚动图片：sda', '1', '1527500831');
INSERT INTO `dn_admin_log` VALUES ('102', '45', '1', '2130706433', 'cms_slider', '11', '超级管理员 添加了滚动图片：a', '1', '1527500854');
INSERT INTO `dn_admin_log` VALUES ('103', '45', '1', '2130706433', 'cms_slider', '12', '超级管理员 添加了滚动图片：sad', '1', '1527500867');
INSERT INTO `dn_admin_log` VALUES ('104', '45', '1', '2130706433', 'cms_slider', '13', '超级管理员 添加了滚动图片：de1', '1', '1527500878');
INSERT INTO `dn_admin_log` VALUES ('105', '30', '1', '2130706433', 'admin_menu', '355', '超级管理员 添加了节点：所属模块(cms),所属节点ID(270),节点标题(广告分类),节点链接(cms/adtype/index)', '1', '1527502406');
INSERT INTO `dn_admin_log` VALUES ('106', '44', '1', '2130706433', 'cms_slider', '11', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559540');
INSERT INTO `dn_admin_log` VALUES ('107', '44', '1', '2130706433', 'cms_slider', '8', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559542');
INSERT INTO `dn_admin_log` VALUES ('108', '44', '1', '2130706433', 'cms_slider', '10', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559544');
INSERT INTO `dn_admin_log` VALUES ('109', '44', '1', '2130706433', 'cms_slider', '9', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559545');
INSERT INTO `dn_admin_log` VALUES ('110', '44', '1', '2130706433', 'cms_slider', '12', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559547');
INSERT INTO `dn_admin_log` VALUES ('111', '44', '1', '2130706433', 'cms_slider', '13', '超级管理员 编辑了滚动图片：字段(urls)，原值()，新值：(https://www.baidu.com/)', '1', '1527559548');
INSERT INTO `dn_admin_log` VALUES ('112', '7', '1', '2130706433', 'admin_role', '4', '超级管理员 添加了角色：新超级管理员', '1', '1527674448');
INSERT INTO `dn_admin_log` VALUES ('113', '8', '1', '2130706433', 'admin_role', '4', '超级管理员 编辑了角色：新超级管理员', '1', '1527674459');
INSERT INTO `dn_admin_log` VALUES ('114', '1', '1', '2130706433', 'admin_user', '4', '超级管理员 添加了用户：test4', '1', '1527674478');
INSERT INTO `dn_admin_log` VALUES ('115', '30', '1', '2130706433', 'admin_menu', '362', '超级管理员 添加了节点：所属模块(cms),所属节点ID(254),节点标题(已售出域名),节点链接(cms/page/alreadysell)', '1', '1527908141');
INSERT INTO `dn_admin_log` VALUES ('116', '34', '1', '2130706433', 'admin_menu', '235', '超级管理员 禁用了节点：节点ID(235),节点标题(常用操作),节点链接()', '1', '1527910160');
INSERT INTO `dn_admin_log` VALUES ('117', '30', '1', '2130706433', 'admin_menu', '369', '超级管理员 添加了节点：所属模块(cms),所属节点ID(255),节点标题(邮箱控制),节点链接(cms/mail/index)', '1', '1528208713');
INSERT INTO `dn_admin_log` VALUES ('118', '31', '1', '2130706433', 'admin_menu', '369', '超级管理员 编辑了节点：节点ID(369)', '1', '1528208757');
INSERT INTO `dn_admin_log` VALUES ('119', '34', '1', '2130706433', 'admin_menu', '238', '超级管理员 禁用了节点：节点ID(238),节点标题(域名列表),节点链接(cms/page/index)', '1', '1528364262');
INSERT INTO `dn_admin_log` VALUES ('120', '33', '1', '2130706433', 'admin_menu', '238', '超级管理员 启用了节点：节点ID(238),节点标题(域名列表),节点链接(cms/page/index)', '1', '1528364264');
INSERT INTO `dn_admin_log` VALUES ('121', '34', '1', '2130706433', 'admin_menu', '238', '超级管理员 禁用了节点：节点ID(238),节点标题(域名列表),节点链接(cms/page/index)', '1', '1528364265');
INSERT INTO `dn_admin_log` VALUES ('122', '31', '1', '2130706433', 'admin_menu', '238', '超级管理员 编辑了节点：节点ID(238)', '1', '1528364283');

-- ----------------------------
-- Table structure for dn_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_menu`;
CREATE TABLE `dn_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of dn_admin_menu
-- ----------------------------
INSERT INTO `dn_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', '0', '1467617722', '1527225114', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1467618170', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', '0', '1467618273', '1489049773', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', '0', '1467618361', '1527225114', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', '0', '1467618441', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', '0', '1467618490', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', '0', '1467618618', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', '0', '1467618648', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', '0', '1467619566', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', '0', '1467619583', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', '0', '1467619609', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', '0', '1467619637', '1477710695', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', '0', '1467619882', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', '0', '1467619902', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', '0', '1467620331', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', '0', '1467620363', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', '0', '1467620386', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', '0', '1467620404', '1477710695', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1467688137', '1477710702', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module_admin', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', '0', '1480299320', '1480299320', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', '0', '1467688853', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', '0', '1467689008', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', '0', '1467689153', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', '0', '1467689173', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', '0', '1467689192', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', '0', '1467689241', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', '0', '1467689294', '1477710695', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', '0', '1467689312', '1477710695', '6', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', '0', '1467689341', '1477710695', '7', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', '0', '1467689527', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', '0', '1467689650', '1477710695', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', '0', '1467689665', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', '0', '1467689680', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', '0', '1467689730', '1477710695', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', '0', '1467689747', '1477710695', '6', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', '0', '1467689789', '1477710695', '7', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', '0', '1467689846', '1477710695', '8', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', '0', '1467690161', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', '0', '1467690240', '1489049773', '1', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', '0', '1467690334', '1477710695', '2', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', '0', '1467690352', '1477710695', '3', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', '0', '1467690369', '1477710695', '4', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', '0', '1467690396', '1477710695', '5', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', '0', '1467858065', '1477710695', '11', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', '0', '1467858092', '1477710695', '10', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', '0', '1467858421', '1477710695', '9', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', '0', '1467879016', '1477710695', '14', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', '0', '1468073039', '1477710695', '6', '1', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', '0', '1476111944', '1477710695', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', '0', '1476111992', '1477710695', '8', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', '0', '1476112326', '1477710695', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('68', '0', 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1476193348', '1527225114', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', '0', '1476236193', '1477710695', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', '0', '1476237472', '1489049773', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module_admin', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module_admin', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', '0', '1476668971', '1477710695', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', '0', '1476669006', '1477710695', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', '0', '1476669375', '1477710695', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', '0', '1476669427', '1477710695', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', '0', '1476669564', '1477710695', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', '0', '1476851362', '1477710695', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', '0', '1476851382', '1477710695', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', '0', '1476882441', '1477710695', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', '0', '1476884439', '1477710695', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', '0', '1476884464', '1477710695', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', '0', '1476884493', '1477710695', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', '0', '1476884534', '1477710695', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', '0', '1476884551', '1477710695', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', '0', '1476972746', '1477710695', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', '0', '1476972772', '1477710695', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', '0', '1476972800', '1477710695', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', '0', '1476972825', '1477710695', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', '0', '1476973457', '1477710695', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1477713981', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', '0', '1477713939', '1477713939', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', '0', '1477713808', '1477713808', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', '0', '1477713770', '1477713770', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', '0', '1489049767', '1489049773', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', '0', '1490588610', '1490588610', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('214', '68', 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', '0', '1520492129', '1520492129', '100', '0', '0', '');
INSERT INTO `dn_admin_menu` VALUES ('215', '214', 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('216', '215', 'user', '新增', '', 'module_admin', 'user/message/add', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('217', '215', 'user', '编辑', '', 'module_admin', 'user/message/edit', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('218', '215', 'user', '删除', '', 'module_admin', 'user/message/delete', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('219', '215', 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('220', '215', 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('221', '215', 'user', '快速编辑', '', 'module_admin', 'user/message/quickedit', '_self', '0', '1520492195', '1520492195', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('222', '2', 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', '0', '1520495992', '1520496254', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('223', '222', 'admin', '删除', '', 'module_admin', 'admin/message/delete', '_self', '0', '1520495992', '1520496263', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('224', '222', 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', '0', '1520495992', '1520496270', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('225', '32', 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('226', '225', 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('227', '225', 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('228', '225', 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('229', '225', 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('230', '225', 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('231', '225', 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', '0', '1520908295', '1520908295', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('232', '225', 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', '0', '1520923368', '1520923368', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('233', '225', 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', '0', '1520931908', '1520931908', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('234', '0', 'cms', '门户', 'fa fa-fw fa-newspaper-o', 'module_admin', 'cms/index/index', '_self', '0', '1525785270', '1527225114', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('235', '234', 'cms', '常用操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1525785270', '1527502443', '1', '0', '0', '');
INSERT INTO `dn_admin_menu` VALUES ('236', '235', 'cms', '仪表盘', 'fa fa-fw fa-tachometer', 'module_admin', 'cms/index/index', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('237', '235', 'cms', '发布域名', 'fa fa-fw fa-plus', 'module_admin', 'cms/page/add', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('238', '235', 'cms', '域名列表', 'fa fa-fw fa-list', 'module_admin', 'cms/page/index1', '_self', '0', '1525785270', '1528364283', '3', '0', '0', '');
INSERT INTO `dn_admin_menu` VALUES ('239', '238', 'cms', '编辑', '', 'module_admin', 'cms/document/edit', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('240', '238', 'cms', '删除', '', 'module_admin', 'cms/document/delete', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('241', '238', 'cms', '启用', '', 'module_admin', 'cms/document/enable', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('242', '238', 'cms', '禁用', '', 'module_admin', 'cms/document/disable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('243', '238', 'cms', '快速编辑', '', 'module_admin', 'cms/document/quickedit', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('244', '254', 'cms', '域名列表', 'fa fa-fw fa-file-word-o', 'module_admin', 'cms/page/index', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('245', '244', 'cms', '新增', '', 'module_admin', 'cms/page/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('246', '244', 'cms', '编辑', '', 'module_admin', 'cms/page/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('247', '244', 'cms', '删除', '', 'module_admin', 'cms/page/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('248', '244', 'cms', '启用', '', 'module_admin', 'cms/page/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('249', '244', 'cms', '禁用', '', 'module_admin', 'cms/page/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('250', '244', 'cms', '快速编辑', '', 'module_admin', 'cms/page/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('251', '235', 'cms', '回收站', 'fa fa-fw fa-recycle', 'module_admin', 'cms/recycle/index', '_self', '0', '1525785270', '1527502443', '4', '0', '0', '');
INSERT INTO `dn_admin_menu` VALUES ('252', '251', 'cms', '删除', '', 'module_admin', 'cms/recycle/delete', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('253', '251', 'cms', '还原', '', 'module_admin', 'cms/recycle/restore', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('254', '234', 'cms', '域名管理', 'fa fa-fw fa-th-list', 'module_admin', '', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('255', '234', 'cms', '营销管理', 'fa fa-fw fa-money', 'module_admin', '', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('256', '255', 'cms', '广告管理（二）', 'fa fa-fw fa-handshake-o', 'module_admin', 'cms/advert/index', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('257', '256', 'cms', '新增', '', 'module_admin', 'cms/advert/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('258', '256', 'cms', '编辑', '', 'module_admin', 'cms/advert/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('259', '256', 'cms', '删除', '', 'module_admin', 'cms/advert/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('260', '256', 'cms', '启用', '', 'module_admin', 'cms/advert/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('261', '256', 'cms', '禁用', '', 'module_admin', 'cms/advert/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('262', '256', 'cms', '快速编辑', '', 'module_admin', 'cms/advert/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('263', '256', 'cms', '广告分类', '', 'module_admin', 'cms/advert_type/index', '_self', '0', '1525785270', '1527502443', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('264', '263', 'cms', '新增', '', 'module_admin', 'cms/advert_type/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('265', '263', 'cms', '编辑', '', 'module_admin', 'cms/advert_type/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('266', '263', 'cms', '删除', '', 'module_admin', 'cms/advert_type/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('267', '263', 'cms', '启用', '', 'module_admin', 'cms/advert_type/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('268', '263', 'cms', '禁用', '', 'module_admin', 'cms/advert_type/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('269', '263', 'cms', '快速编辑', '', 'module_admin', 'cms/advert_type/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('270', '255', 'cms', '广告管理（一）', 'fa fa-fw fa-photo', 'module_admin', 'cms/slider/index', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('271', '270', 'cms', '新增', '', 'module_admin', 'cms/slider/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('272', '270', 'cms', '编辑', '', 'module_admin', 'cms/slider/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('273', '270', 'cms', '删除', '', 'module_admin', 'cms/slider/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('274', '270', 'cms', '启用', '', 'module_admin', 'cms/slider/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('275', '270', 'cms', '禁用', '', 'module_admin', 'cms/slider/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('276', '270', 'cms', '快速编辑', '', 'module_admin', 'cms/slider/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('277', '255', 'cms', '友情链接', 'fa fa-fw fa-link', 'module_admin', 'cms/link/index', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('278', '277', 'cms', '新增', '', 'module_admin', 'cms/link/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('279', '277', 'cms', '编辑', '', 'module_admin', 'cms/link/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('280', '277', 'cms', '删除', '', 'module_admin', 'cms/link/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('281', '277', 'cms', '启用', '', 'module_admin', 'cms/link/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('282', '277', 'cms', '禁用', '', 'module_admin', 'cms/link/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('283', '277', 'cms', '快速编辑', '', 'module_admin', 'cms/link/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('284', '255', 'cms', '客服管理', 'fa fa-fw fa-commenting', 'module_admin', 'cms/support/index', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('285', '284', 'cms', '新增', '', 'module_admin', 'cms/support/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('286', '284', 'cms', '编辑', '', 'module_admin', 'cms/support/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('287', '284', 'cms', '删除', '', 'module_admin', 'cms/support/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('288', '284', 'cms', '启用', '', 'module_admin', 'cms/support/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('289', '284', 'cms', '禁用', '', 'module_admin', 'cms/support/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('290', '284', 'cms', '快速编辑', '', 'module_admin', 'cms/support/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('291', '234', 'cms', '门户设置', 'fa fa-fw fa-sliders', 'module_admin', '', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('292', '291', 'cms', '栏目分类', 'fa fa-fw fa-sitemap', 'module_admin', 'cms/column/index', '_self', '1', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('293', '292', 'cms', '新增', '', 'module_admin', 'cms/column/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('294', '292', 'cms', '编辑', '', 'module_admin', 'cms/column/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('295', '292', 'cms', '删除', '', 'module_admin', 'cms/column/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('296', '292', 'cms', '启用', '', 'module_admin', 'cms/column/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('297', '292', 'cms', '禁用', '', 'module_admin', 'cms/column/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('298', '292', 'cms', '快速编辑', '', 'module_admin', 'cms/column/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('299', '291', 'cms', '内容模型', 'fa fa-fw fa-th-large', 'module_admin', 'cms/model/index', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('300', '299', 'cms', '新增', '', 'module_admin', 'cms/model/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('301', '299', 'cms', '编辑', '', 'module_admin', 'cms/model/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('302', '299', 'cms', '删除', '', 'module_admin', 'cms/model/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('303', '299', 'cms', '启用', '', 'module_admin', 'cms/model/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('304', '299', 'cms', '禁用', '', 'module_admin', 'cms/model/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('305', '299', 'cms', '快速编辑', '', 'module_admin', 'cms/model/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('306', '299', 'cms', '字段管理', '', 'module_admin', 'cms/field/index', '_self', '0', '1525785270', '1527502443', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('307', '306', 'cms', '新增', '', 'module_admin', 'cms/field/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('308', '306', 'cms', '编辑', '', 'module_admin', 'cms/field/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('309', '306', 'cms', '删除', '', 'module_admin', 'cms/field/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('310', '306', 'cms', '启用', '', 'module_admin', 'cms/field/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('311', '306', 'cms', '禁用', '', 'module_admin', 'cms/field/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('312', '306', 'cms', '快速编辑', '', 'module_admin', 'cms/field/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('313', '291', 'cms', '导航管理', 'fa fa-fw fa-map-signs', 'module_admin', 'cms/nav/index', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('314', '313', 'cms', '新增', '', 'module_admin', 'cms/nav/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('315', '313', 'cms', '编辑', '', 'module_admin', 'cms/nav/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('316', '313', 'cms', '删除', '', 'module_admin', 'cms/nav/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('317', '313', 'cms', '启用', '', 'module_admin', 'cms/nav/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('318', '313', 'cms', '禁用', '', 'module_admin', 'cms/nav/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('319', '313', 'cms', '快速编辑', '', 'module_admin', 'cms/nav/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('320', '313', 'cms', '菜单管理', '', 'module_admin', 'cms/menu/index', '_self', '0', '1525785270', '1527502443', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('321', '320', 'cms', '新增', '', 'module_admin', 'cms/menu/add', '_self', '0', '1525785270', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('322', '320', 'cms', '编辑', '', 'module_admin', 'cms/menu/edit', '_self', '0', '1525785270', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('323', '320', 'cms', '删除', '', 'module_admin', 'cms/menu/delete', '_self', '0', '1525785270', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('324', '320', 'cms', '启用', '', 'module_admin', 'cms/menu/enable', '_self', '0', '1525785270', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('325', '320', 'cms', '禁用', '', 'module_admin', 'cms/menu/disable', '_self', '0', '1525785270', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('326', '320', 'cms', '快速编辑', '', 'module_admin', 'cms/menu/quickedit', '_self', '0', '1525785270', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('327', '254', 'cms', '域名类型', 'fa fa-fw fa-key', 'module_admin', 'cms/dntype/index', '_self', '0', '1525788235', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('328', '327', 'cms', '新增', '', 'module_admin', 'cms/dntype/add', '_self', '0', '1525788235', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('329', '327', 'cms', '编辑', '', 'module_admin', 'cms/dntype/edit', '_self', '0', '1525788235', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('330', '327', 'cms', '删除', '', 'module_admin', 'cms/dntype/delete', '_self', '0', '1525788235', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('331', '327', 'cms', '启用', '', 'module_admin', 'cms/dntype/enable', '_self', '0', '1525788235', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('332', '327', 'cms', '禁用', '', 'module_admin', 'cms/dntype/disable', '_self', '0', '1525788235', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('333', '327', 'cms', '快速编辑', '', 'module_admin', 'cms/dntype/quickedit', '_self', '0', '1525788235', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('334', '255', 'cms', '用户留言', 'fa fa-fw fa-comment-o', 'module_admin', 'cms/massage/index', '_self', '0', '1525885824', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('335', '334', 'cms', '新增', '', 'module_admin', 'cms/massage/add', '_self', '0', '1525885824', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('336', '334', 'cms', '编辑', '', 'module_admin', 'cms/massage/edit', '_self', '0', '1525885824', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('337', '334', 'cms', '删除', '', 'module_admin', 'cms/massage/delete', '_self', '0', '1525885824', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('338', '334', 'cms', '启用', '', 'module_admin', 'cms/massage/enable', '_self', '0', '1525885824', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('339', '334', 'cms', '禁用', '', 'module_admin', 'cms/massage/disable', '_self', '0', '1525885824', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('340', '334', 'cms', '快速编辑', '', 'module_admin', 'cms/massage/quickedit', '_self', '0', '1525885824', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('341', '244', 'cms', '导入数据', '', 'module_admin', 'cms/page/import', '_self', '0', '1525934205', '1527502443', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('352', '348', 'cms', '启用', '', 'module_admin', 'cms/phone/enable', '_self', '0', '1527177772', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('351', '348', 'cms', '删除', '', 'module_admin', 'cms/phone/delete', '_self', '0', '1527177772', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('350', '348', 'cms', '编辑', '', 'module_admin', 'cms/phone/edit', '_self', '0', '1527177772', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('349', '348', 'cms', '新增', '', 'module_admin', 'cms/phone/add', '_self', '0', '1527177772', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('348', '255', 'cms', '短信控制', 'fa fa-fw fa-external-link', 'module_admin', 'cms/phone/index', '_self', '0', '1527177772', '1527502443', '7', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('353', '348', 'cms', '禁用', '', 'module_admin', 'cms/phone/disable', '_self', '0', '1527177772', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('354', '348', 'cms', '快速编辑', '', 'module_admin', 'cms/phone/quickedit', '_self', '0', '1527177772', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('355', '255', 'cms', '广告分类', 'fa fa-fw fa-bullhorn', 'module_admin', 'cms/adtype/index', '_self', '0', '1527502406', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('356', '355', 'cms', '新增', '', 'module_admin', 'cms/adtype/add', '_self', '0', '1527502406', '1527502443', '1', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('357', '355', 'cms', '编辑', '', 'module_admin', 'cms/adtype/edit', '_self', '0', '1527502406', '1527502443', '2', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('358', '355', 'cms', '删除', '', 'module_admin', 'cms/adtype/delete', '_self', '0', '1527502406', '1527502443', '3', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('359', '355', 'cms', '启用', '', 'module_admin', 'cms/adtype/enable', '_self', '0', '1527502406', '1527502443', '4', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('360', '355', 'cms', '禁用', '', 'module_admin', 'cms/adtype/disable', '_self', '0', '1527502406', '1527502443', '5', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('361', '355', 'cms', '快速编辑', '', 'module_admin', 'cms/adtype/quickedit', '_self', '0', '1527502406', '1527502443', '6', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('362', '254', 'cms', '已售出域名', 'fa fa-fw fa-hand-o-right', 'module_admin', 'cms/page/alreadysell', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('363', '362', 'cms', '新增', '', 'module_admin', 'cms/page/add', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('364', '362', 'cms', '编辑', '', 'module_admin', 'cms/page/edit', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('365', '362', 'cms', '删除', '', 'module_admin', 'cms/page/delete', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('366', '362', 'cms', '启用', '', 'module_admin', 'cms/page/enable', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('367', '362', 'cms', '禁用', '', 'module_admin', 'cms/page/disable', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('368', '362', 'cms', '快速编辑', '', 'module_admin', 'cms/page/quickedit', '_self', '0', '1527908141', '1527908141', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('369', '255', 'cms', '邮箱控制', 'fa fa-fw fa-square', 'module_admin', 'cms/mail/index', '_self', '0', '1528208713', '1528208757', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('370', '369', 'cms', '新增', '', 'module_admin', 'cms/mail/add', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('371', '369', 'cms', '编辑', '', 'module_admin', 'cms/mail/edit', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('372', '369', 'cms', '删除', '', 'module_admin', 'cms/mail/delete', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('373', '369', 'cms', '启用', '', 'module_admin', 'cms/mail/enable', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('374', '369', 'cms', '禁用', '', 'module_admin', 'cms/mail/disable', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');
INSERT INTO `dn_admin_menu` VALUES ('375', '369', 'cms', '快速编辑', '', 'module_admin', 'cms/mail/quickedit', '_self', '0', '1528208713', '1528208713', '100', '0', '1', '');

-- ----------------------------
-- Table structure for dn_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_message`;
CREATE TABLE `dn_admin_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid_receive` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '接收消息的用户id',
  `uid_send` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送消息的用户id',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text NOT NULL COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of dn_admin_message
-- ----------------------------

-- ----------------------------
-- Table structure for dn_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_module`;
CREATE TABLE `dn_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of dn_admin_module
-- ----------------------------
INSERT INTO `dn_admin_module` VALUES ('1', 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `dn_admin_module` VALUES ('2', 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `dn_admin_module` VALUES ('3', 'cms', '门户', 'fa fa-fw fa-newspaper-o', '门户模块', 'CaiWeiMing', 'http://www.dolphinphp.com', '{\"summary\":\"0\",\"contact\":\"\",\"meta_head\":\"\",\"meta_foot\":\"\",\"support_status\":\"1\",\"support_color\":\"rgba(0,158,232,1)\",\"support_wx\":\"\",\"support_extra\":\"\"}', '{\"group\":{\"tab_title\":\"\\u680f\\u76ee\\u6388\\u6743\",\"table_name\":\"cms_column\",\"primary_key\":\"id\",\"parent_id\":\"pid\",\"node_name\":\"name\"}}', '1.0.0', 'cms.ming.module', '0', '1525785270', '1525785270', '100', '1');

-- ----------------------------
-- Table structure for dn_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_packet`;
CREATE TABLE `dn_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- ----------------------------
-- Records of dn_admin_packet
-- ----------------------------

-- ----------------------------
-- Table structure for dn_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_plugin`;
CREATE TABLE `dn_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dn_admin_plugin
-- ----------------------------
INSERT INTO `dn_admin_plugin` VALUES ('1', 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', '0', '1477757503', '1477757503', '100', '1');
INSERT INTO `dn_admin_plugin` VALUES ('2', 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', '0', '1477755780', '1477755780', '100', '1');

-- ----------------------------
-- Table structure for dn_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_role`;
CREATE TABLE `dn_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认访问模块',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dn_admin_role
-- ----------------------------
INSERT INTO `dn_admin_role` VALUES ('1', '0', '超级管理员', '系统默认创建的角色，拥有最高权限', '', '0', '1476270000', '1468117612', '1', '1', '0');
INSERT INTO `dn_admin_role` VALUES ('2', '1', '测试', '', '[\"51\",\"213\",\"70\",\"212\",\"3\",\"2\",\"1\",\"236\",\"237\",\"239\",\"240\",\"241\",\"242\",\"243\",\"238\",\"252\",\"253\",\"251\",\"235\",\"245\",\"246\",\"247\",\"248\",\"249\",\"250\",\"341\",\"244\",\"328\",\"329\",\"330\",\"331\",\"332\",\"333\",\"327\",\"254\",\"271\",\"272\",\"273\",\"274\",\"275\",\"276\",\"270\",\"335\",\"336\",\"337\",\"338\",\"339\",\"340\",\"334\",\"349\",\"350\",\"351\",\"352\",\"353\",\"354\",\"348\",\"255\",\"234\",\"355\",\"356\",\"357\",\"358\",\"359\",\"360\",\"361\",\"362\",\"363\",\"364\",\"365\",\"366\",\"367\",\"368\"]', '100', '1527224486', '1527908141', '1', '1', '234');
INSERT INTO `dn_admin_role` VALUES ('4', '1', '新超级管理员', '', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"60\",\"61\",\"62\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\",\"183\",\"184\",\"185\",\"186\",\"187\",\"188\",\"189\",\"190\",\"191\",\"192\",\"193\",\"194\",\"195\",\"207\",\"208\",\"209\",\"210\",\"211\",\"212\",\"213\",\"214\",\"215\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"224\",\"225\",\"226\",\"227\",\"228\",\"229\",\"230\",\"231\",\"232\",\"233\",\"234\",\"235\",\"236\",\"237\",\"238\",\"239\",\"240\",\"241\",\"242\",\"243\",\"244\",\"245\",\"246\",\"247\",\"248\",\"249\",\"250\",\"251\",\"252\",\"253\",\"254\",\"255\",\"256\",\"257\",\"258\",\"259\",\"260\",\"261\",\"262\",\"263\",\"264\",\"265\",\"266\",\"267\",\"268\",\"269\",\"270\",\"271\",\"272\",\"273\",\"274\",\"275\",\"276\",\"277\",\"278\",\"279\",\"280\",\"281\",\"282\",\"283\",\"284\",\"285\",\"286\",\"287\",\"288\",\"289\",\"290\",\"291\",\"292\",\"293\",\"294\",\"295\",\"296\",\"297\",\"298\",\"299\",\"300\",\"301\",\"302\",\"303\",\"304\",\"305\",\"306\",\"307\",\"308\",\"309\",\"310\",\"311\",\"312\",\"313\",\"314\",\"315\",\"316\",\"317\",\"318\",\"319\",\"320\",\"321\",\"322\",\"323\",\"324\",\"325\",\"326\",\"327\",\"328\",\"329\",\"330\",\"331\",\"332\",\"333\",\"334\",\"335\",\"336\",\"337\",\"338\",\"339\",\"340\",\"341\",\"348\",\"349\",\"350\",\"351\",\"352\",\"353\",\"354\",\"355\",\"356\",\"357\",\"358\",\"359\",\"360\",\"361\",\"362\",\"363\",\"364\",\"365\",\"366\",\"367\",\"368\"]', '100', '1527674448', '1527908141', '1', '1', '1');

-- ----------------------------
-- Table structure for dn_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `dn_admin_user`;
CREATE TABLE `dn_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dn_admin_user
-- ----------------------------
INSERT INTO `dn_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', '0', '', '0', '0', '0.00', '0', '1', '0', '0', '1476065410', '1528681762', '1528681761', '2130706433', '100', '1');
INSERT INTO `dn_admin_user` VALUES ('2', 'test', '测试工程师', '$2y$10$5cnGbnxU0AfbjxQsdt6hzupWNJP4fRdMXkUsqZKBZgmb5gRey4jte', '2106357855@qq.com', '0', '18858585858', '0', '9', '0.00', '0', '2', '0', '0', '1527224566', '1527330638', '1527330637', '2130706433', '100', '1');
INSERT INTO `dn_admin_user` VALUES ('3', '21', '21', '$2y$10$uyu3sRHBLKRBMrJlAlEYUuVAVaO7NB9kRvlSB4BpdwL1576tO8OJm', '12@12.com', '0', '18712377078', '0', '0', '0.00', '0', '3', '0', '0', '1527234621', '1527234621', '0', '0', '100', '1');
INSERT INTO `dn_admin_user` VALUES ('4', 'test4', 'test4', '$2y$10$/aU6MOCrmYQqiY7MZWdkEeOF9nReT51LamznsC3IRe3wCGXAXYAjm', '', '0', '', '0', '0', '0.00', '0', '4', '0', '0', '1527674478', '1527674488', '1527674488', '2130706433', '100', '1');

-- ----------------------------
-- Table structure for dn_cms_adtype
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_adtype`;
CREATE TABLE `dn_cms_adtype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '单页标题',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '页面描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `istab` tinyint(2) unsigned DEFAULT '0' COMMENT '0 不设为导航  1 设为导航',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of dn_cms_adtype
-- ----------------------------
INSERT INTO `dn_cms_adtype` VALUES ('27', '第一类广告', '', '1527238743', '1527503121', '1', '0');
INSERT INTO `dn_cms_adtype` VALUES ('26', '第二类广告', '', '1527238734', '1527238734', '1', '0');
INSERT INTO `dn_cms_adtype` VALUES ('25', '第三类广告', '', '1527238730', '1527238730', '1', '1');

-- ----------------------------
-- Table structure for dn_cms_advert
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_advert`;
CREATE TABLE `dn_cms_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `tagname` varchar(30) NOT NULL DEFAULT '' COMMENT '广告位标识',
  `ad_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `timeset` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '时间限制:0-永不过期,1-在设内时间内有效',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `content` text NOT NULL COMMENT '广告内容',
  `expcontent` text NOT NULL COMMENT '过期显示内容',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of dn_cms_advert
-- ----------------------------

-- ----------------------------
-- Table structure for dn_cms_advert_type
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_advert_type`;
CREATE TABLE `dn_cms_advert_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告分类表';

-- ----------------------------
-- Records of dn_cms_advert_type
-- ----------------------------

-- ----------------------------
-- Table structure for dn_cms_column
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_column`;
CREATE TABLE `dn_cms_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档模型id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '字体图标',
  `index_template` varchar(32) NOT NULL DEFAULT '' COMMENT '封面模板',
  `list_template` varchar(32) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_template` varchar(32) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `post_auth` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '投稿权限',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `hide` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `rank_auth` int(11) NOT NULL DEFAULT '0' COMMENT '浏览权限，-1待审核，0为开放浏览，大于0则为对应的用户角色id',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '栏目属性：0-最终列表栏目，1-外部链接，2-频道封面',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of dn_cms_column
-- ----------------------------
INSERT INTO `dn_cms_column` VALUES ('1', '0', '1', '1', '', '_self', '<p>1</p>\r\n', '', '', 'list.html', 'detail.html', '1', '1526695015', '1526695015', '100', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for dn_cms_dntype
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_dntype`;
CREATE TABLE `dn_cms_dntype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '单页标题',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '页面描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `istab` tinyint(2) unsigned DEFAULT '0' COMMENT '0 不设为导航  1 设为导航',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of dn_cms_dntype
-- ----------------------------
INSERT INTO `dn_cms_dntype` VALUES ('27', '六数字', '', '1527238743', '1527238743', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('26', '五数字', '', '1527238734', '1527238734', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('25', '四数字', '', '1527238730', '1527238730', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('23', '双数字', '', '1527238703', '1527238703', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('24', '三数字', '', '1527238723', '1527238723', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('31', '双字母', '', '1527238820', '1527238820', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('28', '七数字', '', '1527238747', '1527238747', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('29', '八数字', '', '1527238753', '1527238753', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('30', '顺子', '', '1527238759', '1527238759', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('32', '三字母', '', '1527238825', '1527238825', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('33', '四字母', '', '1527238829', '1527238829', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('34', '五字母', '', '1527238833', '1527238833', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('35', '英文单词', '', '1527238850', '1527238850', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('36', '城市全拼', '', '1527238855', '1527238855', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('37', '二位杂', '', '1527238889', '1527238889', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('38', '三位杂', '', '1527238893', '1527238893', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('39', '四位杂', '', '1527238898', '1527238898', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('40', '所有中文域名', '', '1527238903', '1527238903', '1', '1');
INSERT INTO `dn_cms_dntype` VALUES ('42', '非中文域名', '', '1527238913', '1527238913', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('44', '数字', '', '1527239187', '1527239187', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('45', '字母', '', '1527239201', '1527239201', '1', '0');
INSERT INTO `dn_cms_dntype` VALUES ('46', '杂米', '', '1527239209', '1527239209', '1', '0');

-- ----------------------------
-- Table structure for dn_cms_document
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_document`;
CREATE TABLE `dn_cms_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档模型ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(32) NOT NULL DEFAULT '' COMMENT '简略标题',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `flag` set('j','p','b','s','a','f','c','h') DEFAULT NULL COMMENT '自定义属性',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `comment` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `good` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `bad` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '踩数',
  `mark` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `trash` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '回收站',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档基础表';

-- ----------------------------
-- Records of dn_cms_document
-- ----------------------------

-- ----------------------------
-- Table structure for dn_cms_document_asdasdsadas
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_document_asdasdsadas`;
CREATE TABLE `dn_cms_document_asdasdsadas` (
  `aid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档id',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='1模型扩展表';

-- ----------------------------
-- Records of dn_cms_document_asdasdsadas
-- ----------------------------

-- ----------------------------
-- Table structure for dn_cms_field
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_field`;
CREATE TABLE `dn_cms_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `fixed` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否为固定字段',
  `show` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='文档字段表';

-- ----------------------------
-- Records of dn_cms_field
-- ----------------------------
INSERT INTO `dn_cms_field` VALUES ('1', 'id', 'ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', 'ID', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480562978', '1480562978', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('2', 'cid', '栏目', 'select', 'int(11) UNSIGNED NOT NULL', '0', '', '请选择所属栏目', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480562978', '1480562978', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('3', 'uid', '用户ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563110', '1480563110', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('4', 'model', '模型ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563110', '1480563110', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('5', 'title', '标题', 'text', 'varchar(128) NOT NULL', '', '', '文档标题', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480575844', '1480576134', '1', '1');
INSERT INTO `dn_cms_field` VALUES ('6', 'shorttitle', '简略标题', 'text', 'varchar(32) NOT NULL', '', '', '简略标题', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480575844', '1480576134', '1', '1');
INSERT INTO `dn_cms_field` VALUES ('7', 'flag', '自定义属性', 'checkbox', 'set(\'j\',\'p\',\'b\',\'s\',\'a\',\'f\',\'h\',\'c\') NULL DEFAULT NULL', '', 'j:跳转\r\np:图片\r\nb:加粗\r\ns:滚动\r\na:特荐\r\nf:幻灯\r\nh:头条\r\nc:推荐', '自定义属性', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480671258', '1480671258', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('8', 'view', '阅读量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563149', '1480563149', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('9', 'comment', '评论数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563189', '1480563189', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('10', 'good', '点赞数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563279', '1480563279', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('11', 'bad', '踩数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563330', '1480563330', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('12', 'mark', '收藏数量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563372', '1480563372', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('13', 'create_time', '创建时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563406', '1480563406', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('14', 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563432', '1480563432', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('15', 'sort', '排序', 'text', 'int(11) NOT NULL', '100', '', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563510', '1480563510', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('16', 'status', '状态', 'radio', 'tinyint(2) UNSIGNED NOT NULL', '1', '0:禁用\r\n1:启用', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563576', '1480563576', '100', '1');
INSERT INTO `dn_cms_field` VALUES ('17', 'trash', '回收站', 'text', 'tinyint(2) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563576', '1480563576', '100', '1');

-- ----------------------------
-- Table structure for dn_cms_link
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_link`;
CREATE TABLE `dn_cms_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1-文字链接，2-图片链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '链接标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `logo` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '链接LOGO',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `sort` int(11) NOT NULL DEFAULT '100',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='有钱链接表';

-- ----------------------------
-- Records of dn_cms_link
-- ----------------------------

-- ----------------------------
-- Table structure for dn_cms_massage
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_massage`;
CREATE TABLE `dn_cms_massage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(64) NOT NULL DEFAULT '' COMMENT '域名',
  `service_provider` mediumtext NOT NULL COMMENT '服务商',
  `buyer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `buyer_tel` bigint(16) DEFAULT NULL COMMENT '到期时间',
  `buyer_hopeprice` varchar(50) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `instructions` text NOT NULL COMMENT '到期时间',
  `dntype` tinyint(2) DEFAULT '1' COMMENT '类型，对应着 Dntype表',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  0  在售   1 售出',
  `bake` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dn_cms_massage
-- ----------------------------
INSERT INTO `dn_cms_massage` VALUES ('87', 'sfzh.top', '阿里云2', 'zx', '18715142438', '100', 'zz', '25', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('88', 'sfzh.top', '阿里云2', '12', '12', '12', '12', '25', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('89', 'sfzh.top', '阿里云2', '12', '12', '12', '21', '25', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('90', 'sfzh.top', '阿里云2', '12', '12', '12', '12', '25', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('91', '22199.top', '阿里云5', '12', '12', '12', '12', '24', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('92', '22199.top', '阿里云5', '3', '3', '3', '3', '24', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('93', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('94', 'www.br2134.com', '八数字', '12', '1212', '1212', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('95', 'www.br2134.com', '八数字', '22', '2', '22', '2', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('96', 'www.br2135.com', '八数字', '12', '12', '12', '12', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('97', 'www.br2135.com', '八数字', '1212', '21', '12', '12', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('98', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('99', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('100', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('101', 'www.br2135.com', '八数字', '12', '12', '12', '12', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('102', 'www.br2135.com', '八数字', '12', '12', '12', '12', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('103', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('104', 'www.br2134.com', '八数字', '2', '2', '2', '2', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('105', 'www.br2134.com', '八数字', '1', '1', '1', '1', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('106', 'www.br2134.com', '八数字', '2', '2', '2', '2', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('107', 'www.br2134.com', '八数字', '21', '21', '21', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('108', 'www.br2134.com', '八数字', '2', '2', '2', '2', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('109', 'www.br2134.com', '八数字', '12', '12', '12', '', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('110', 'www.br2134.com', '八数字', '21', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('111', 'www.br2134.com', '八数字', '12', '12', '12', '', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('112', 'www.br2134.com', '八数字', '12', '12', '12', '', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('113', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('114', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('115', 'www.br2134.com', '八数字', '12', '12', '12', '12', '45', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('116', 'www.br2135.com', '八数字', '12', '12', '12', '12', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('117', 'www.br2135.com', '八数字', '1', '1', '1', '1', '46', '1', '');
INSERT INTO `dn_cms_massage` VALUES ('118', 'www.br2135.com', '八数字', '1', '1', '1', '1', '46', '1', '');

-- ----------------------------
-- Table structure for dn_cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_menu`;
CREATE TABLE `dn_cms_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '导航id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `column` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `page` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页id',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0-栏目链接，1-单页链接，2-自定义链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `css` varchar(64) NOT NULL DEFAULT '' COMMENT 'css类',
  `rel` varchar(64) NOT NULL DEFAULT '' COMMENT '链接关系网',
  `target` varchar(16) NOT NULL DEFAULT '' COMMENT '打开方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of dn_cms_menu
-- ----------------------------
INSERT INTO `dn_cms_menu` VALUES ('1', '1', '0', '0', '0', '2', '首页', 'cms/index/index', '', '', '_self', '1492345605', '1492345605', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('2', '2', '0', '0', '0', '2', '关于我们', 'http://www.dolphinphp.com', '', '', '_self', '1492346763', '1492346763', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('3', '3', '0', '0', '0', '2', '开发文档', 'http://www.kancloud.cn/ming5112/dolphinphp', '', '', '_self', '1492346812', '1492346812', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('4', '3', '0', '0', '0', '2', '开发者社区', 'http://bbs.dolphinphp.com/', '', '', '_self', '1492346832', '1492346832', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('5', '1', '0', '0', '0', '2', '二级菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347372', '1492347510', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('6', '1', '5', '0', '0', '2', '子菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347388', '1492347520', '100', '1');

-- ----------------------------
-- Table structure for dn_cms_model
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_model`;
CREATE TABLE `dn_cms_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模型名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `table` varchar(64) NOT NULL DEFAULT '' COMMENT '附加表名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '模型类别：0-系统模型，1-普通模型，2-独立模型',
  `icon` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统模型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='内容模型表';

-- ----------------------------
-- Records of dn_cms_model
-- ----------------------------
INSERT INTO `dn_cms_model` VALUES ('1', 'asdasdsadas', '1', 'dn_cms_document_asdasdsadas', '1', 'fa fa-fw fa-image', '100', '0', '1526694976', '1526694976', '1');

-- ----------------------------
-- Table structure for dn_cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_nav`;
CREATE TABLE `dn_cms_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) NOT NULL DEFAULT '' COMMENT '导航标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of dn_cms_nav
-- ----------------------------
INSERT INTO `dn_cms_nav` VALUES ('1', 'main_nav', '顶部导航', '1492345083', '1492345083', '1');
INSERT INTO `dn_cms_nav` VALUES ('2', 'about_nav', '底部关于', '1492346685', '1492346685', '1');
INSERT INTO `dn_cms_nav` VALUES ('3', 'support_nav', '服务与支持', '1492346715', '1492346715', '1');

-- ----------------------------
-- Table structure for dn_cms_page
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_page`;
CREATE TABLE `dn_cms_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(64) NOT NULL DEFAULT '' COMMENT '域名',
  `service_provider` mediumtext NOT NULL COMMENT '服务商',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `expiry_time` int(11) DEFAULT NULL COMMENT '到期时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '域名描述',
  `dntype` tinyint(2) DEFAULT '1' COMMENT '类型，对应着 Dntype表',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  1  在售   0 售出',
  `dnprice` decimal(10,2) DEFAULT NULL COMMENT '域名价格',
  `recommends` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  1  推荐   0 不推荐',
  `buyprice` decimal(10,2) DEFAULT NULL COMMENT '买入价格',
  `sellingprice` decimal(10,2) DEFAULT NULL COMMENT '售出价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of dn_cms_page
-- ----------------------------
INSERT INTO `dn_cms_page` VALUES ('164', 'www.br2135.com', '八数字', '', '1520956800', '1528125212', '1528366013', '你知道', '46', '0', '6792.00', '0', '6792.00', '6792.00');
INSERT INTO `dn_cms_page` VALUES ('163', 'www.br2134.com', '八数字', '', '1527696000', '1528125212', '1528279945', '好开心哦', '45', '0', '6791.00', '0', '6791.00', '6791.00');
INSERT INTO `dn_cms_page` VALUES ('170', 'eq5.com', '易名中国', '', '1735228800', '1528681850', '1528681850', '儿趣网，EQ网', '46', '1', '38888.00', '0', null, null);
INSERT INTO `dn_cms_page` VALUES ('169', '91bashi.com', '易名中国', '', '1532016000', '1528681850', '1528681850', '91巴士', '46', '1', null, '0', '130.00', null);
INSERT INTO `dn_cms_page` VALUES ('168', '81r.cn', '22.cn', '', '1531584000', '1528681850', '1528681850', '八一人，军事网站', '46', '1', '3888.00', '0', '280.00', null);

-- ----------------------------
-- Table structure for dn_cms_page_copy
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_page_copy`;
CREATE TABLE `dn_cms_page_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(64) NOT NULL DEFAULT '' COMMENT '域名',
  `service_provider` mediumtext NOT NULL COMMENT '服务商',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `expiry_time` int(11) DEFAULT NULL COMMENT '到期时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '到期时间',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '域名描述',
  `dntype` tinyint(2) DEFAULT '1' COMMENT '类型，对应着 Dntype表',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  1  在售   0 售出',
  `dnprice` decimal(10,2) DEFAULT NULL COMMENT '域名价格',
  `recommends` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  1  推荐   0 不推荐',
  `buyprice` decimal(10,2) DEFAULT NULL COMMENT '买入价格',
  `sellingprice` decimal(10,2) DEFAULT NULL COMMENT '售出价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of dn_cms_page_copy
-- ----------------------------
INSERT INTO `dn_cms_page_copy` VALUES ('148', 'www.testvip.com', '阿里云', '', '1528560000', '1527478211', '1528100944', '还行', '27', '1', '5.00', '0', '12.00', '2.00');
INSERT INTO `dn_cms_page_copy` VALUES ('141', 'kingtech.wang', '阿里云2', '', '1527523200', '1527241733', '1527241733', 'edu无需解释【续费十年】 ', '25', '0', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('140', 'bigstar.wang', '阿里云2', '', '1527436800', '1527241733', '1527241733', '范文网，精品双拼，行业双拼，值得收藏和投资', '25', '0', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('139', 'edu07.com', '阿里云2', '', '1528473600', '1527241733', '1527241733', '教育', '25', '1', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('138', 'sfzh.top', '阿里云2', '', '1531065600', '1527241733', '1527241733', '书法字画交易网,字画交易中心,书画交易平台,字画拍卖,书画收藏 ', '25', '1', '258.00', '1', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('137', 'fanwen.wang', '阿里云6', '', '1531411200', '1527241733', '1527241733', '国际/国内域名抢注竞价', '25', '0', '896.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('136', '22199.top', '阿里云5', '', '1531324800', '1527241733', '1527241733', '国际/国内域名抢注竞价', '24', '1', '128.00', '1', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('135', '7q8.cn', '阿里云4', '', '1533916800', '1527241733', '1527241733', '国际/国内域名抢注竞价', '24', '0', '296.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('134', '00332.cn', '阿里云3', '', '1528560000', '1527241733', '1527241733', '极品五数，已续费2年', '24', '0', '369.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('133', 'tbdk.com', '腾讯', '', '1536422400', '1527241733', '1527241733', '赛马 神马 扫码', '24', '0', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('132', '9588.vip', '阿里云', '', '1541606400', '1527241733', '1527241733', '国际/国内域名抢注竞价', '24', '1', '185.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('131', 'bl.gs', '阿里云6', '', '1841760000', '1527241647', '1527241647', '办理，玻璃，巴黎，布料，菠萝，便利，保利', '31', '1', '6793.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('130', 'mz.dog', '阿里云5', '', '1841673600', '1527241647', '1527241647', '妹子 民族', '31', '1', '6792.00', '1', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('129', 'lb.gg', '阿里云4', '', '1841587200', '1527241647', '1527241647', '老板', '31', '0', '19888.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('142', '345.world', '阿里云1', '', '1841328000', '1527241960', '1527241960', '三顺，已续费10年', '30', '1', '56789.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('128', 'rr.chat', '阿里云3', '', '1841500800', '1527241647', '1527241647', '人人', '31', '1', '1000.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('127', 'ww.cn.com', '阿里云2', '', '1841414400', '1527241647', '1527241647', '开心 科学 快讯 开学 酷讯', '31', '1', '50000.00', '1', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('124', 'u.org', '阿里云2', '', '1528560000', '1527240149', '1527240919', 'AABCC', '31', '1', '258.00', '1', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('123', '09d.cn', '阿里云2', '', '1525795200', '1527240149', '1527240149', '国际/国内域名抢注竞价', '30', '0', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('122', '5300.cn', '阿里云2', '', '1525795200', '1527240149', '1527240149', '极品四数，已续费2年', '25', '0', '258.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('143', '321.city', '阿里云2', '', '1841414400', '1527241960', '1527330707', '极品顺子', '30', '1', '18888.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('144', '876.trade', '阿里云3', '', '1841500800', '1527241960', '1527478701', '8开顺子三数极品', '30', '1', '0.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('119', 'uc4.cn', '阿里云4', '', '1532620800', '1527240149', '1527909393', '国际/国内域名抢注竞价', '24', '1', '296.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('145', '23456.win', '阿里云4', '', '1841587200', '1527241960', '1527478693', '霸气域名', '30', '0', '0.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('126', 'kx.chat', '阿里云1', '', '1841328000', '1527241647', '1527241647', '灰常好的域名，喜欢就带走', '31', '0', '300.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('146', '321.gold', '阿里云5', '', '1841673600', '1527241960', '1527478686', '精品三数！美国流量高！', '30', '0', '0.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('147', '456.cricket', '阿里云6', '', '1841760000', '1527241960', '1527478667', '续费十年极品域名 ', '30', '0', '0.00', '0', null, null);
INSERT INTO `dn_cms_page_copy` VALUES ('149', 'www.brrr4.com', '阿里云4', '', '1525968000', '1528107090', '1528107090', '好开心哦', '45', '0', '6791.00', '0', '53.00', '83.00');
INSERT INTO `dn_cms_page_copy` VALUES ('150', 'www.brrr5.com', '阿里云5', '', '1526054400', '1528107090', '1528107090', '你知道', '46', '0', '6792.00', '0', '54.00', '84.00');
INSERT INTO `dn_cms_page_copy` VALUES ('151', 'www.brrr34.com', '阿里云4', '', '1525968000', '1528107143', '1528107143', '好开心哦', '45', '0', '6791.00', '0', '53.00', '83.00');
INSERT INTO `dn_cms_page_copy` VALUES ('152', 'www.brrr35.com', '阿里云5', '', '1526054400', '1528107143', '1528107143', '你知道', '46', '0', '6792.00', '0', '54.00', '84.00');
INSERT INTO `dn_cms_page_copy` VALUES ('153', 'www.br2134.com', '阿里云4', '', '1525968000', '1528107195', '1528107195', '好开心哦', '45', '0', '6791.00', '0', '53.00', '83.00');
INSERT INTO `dn_cms_page_copy` VALUES ('154', 'www.br2135.com', '阿里云5', '', '1526054400', '1528107195', '1528107195', '你知道', '46', '0', '6792.00', '0', '54.00', '84.00');

-- ----------------------------
-- Table structure for dn_cms_phone
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_phone`;
CREATE TABLE `dn_cms_phone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(199) NOT NULL COMMENT '手机',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态  1  在售   0 售出',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of dn_cms_phone
-- ----------------------------
INSERT INTO `dn_cms_phone` VALUES ('55', '18712377078', '1');
INSERT INTO `dn_cms_phone` VALUES ('56', '1113249273@qq.com', '1');

-- ----------------------------
-- Table structure for dn_cms_slider
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_slider`;
CREATE TABLE `dn_cms_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面id',
  `urls` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `adtype` int(3) DEFAULT '1' COMMENT '广告分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='滚动图片表';

-- ----------------------------
-- Records of dn_cms_slider
-- ----------------------------
INSERT INTO `dn_cms_slider` VALUES ('11', 'a', '14', 'https://www.baidu.com/', '1527500854', '1527558289', '100', '1', '25');
INSERT INTO `dn_cms_slider` VALUES ('8', 'asd', '14', 'https://www.baidu.com/', '1527500793', '1527525102', '100', '1', '26');
INSERT INTO `dn_cms_slider` VALUES ('10', 'sda', '14', 'https://www.baidu.com/', '1527500831', '1527525135', '100', '1', '26');
INSERT INTO `dn_cms_slider` VALUES ('9', 'asd', '14', 'https://www.baidu.com/', '1527500820', '1527525124', '100', '1', '26');
INSERT INTO `dn_cms_slider` VALUES ('12', 'sad', '14', 'https://www.baidu.com/', '1527500867', '1527519240', '100', '1', '27');
INSERT INTO `dn_cms_slider` VALUES ('13', 'de1', '14', 'https://www.baidu.com/', '1527500879', '1527558297', '100', '1', '25');

-- ----------------------------
-- Table structure for dn_cms_support
-- ----------------------------
DROP TABLE IF EXISTS `dn_cms_support`;
CREATE TABLE `dn_cms_support` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '客服名称',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn` varchar(100) NOT NULL DEFAULT '' COMMENT 'msn',
  `taobao` varchar(100) NOT NULL DEFAULT '' COMMENT 'taobao',
  `alibaba` varchar(100) NOT NULL DEFAULT '' COMMENT 'alibaba',
  `skype` varchar(100) NOT NULL DEFAULT '' COMMENT 'skype',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服表';

-- ----------------------------
-- Records of dn_cms_support
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;

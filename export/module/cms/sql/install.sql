-- -----------------------------
-- 导出时间 `2018-05-16 16:09:34`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_advert`
-- -----------------------------
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

-- -----------------------------
-- 表数据 `dn_cms_advert`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_advert_type`
-- -----------------------------
DROP TABLE IF EXISTS `dn_cms_advert_type`;
CREATE TABLE `dn_cms_advert_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告分类表';

-- -----------------------------
-- 表数据 `dn_cms_advert_type`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_column`
-- -----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- -----------------------------
-- 表数据 `dn_cms_column`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_document`
-- -----------------------------
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

-- -----------------------------
-- 表数据 `dn_cms_document`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_field`
-- -----------------------------
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

-- -----------------------------
-- 表数据 `dn_cms_field`
-- -----------------------------
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

-- -----------------------------
-- 表结构 `dn_cms_link`
-- -----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='有钱链接表';

-- -----------------------------
-- 表数据 `dn_cms_link`
-- -----------------------------
INSERT INTO `dn_cms_link` VALUES ('3', '2', '一个人的哪种行为让你觉得这个人值得深交？', 'https://www.zhihu.com/question/268736076/answer/390227819', '13', '15755175517', '100', '1', '1526454798', '1526454798');
INSERT INTO `dn_cms_link` VALUES ('2', '1', '可以用 Python 编程语言做哪些神奇好玩的事情？', 'https://www.zhihu.com/question/21395276', '0', '15758596598', '100', '0', '1526454699', '1526454863');

-- -----------------------------
-- 表结构 `dn_cms_menu`
-- -----------------------------
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

-- -----------------------------
-- 表数据 `dn_cms_menu`
-- -----------------------------
INSERT INTO `dn_cms_menu` VALUES ('1', '1', '0', '0', '0', '2', '首页', 'cms/index/index', '', '', '_self', '1492345605', '1492345605', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('2', '2', '0', '0', '0', '2', '关于我们', 'http://www.dolphinphp.com', '', '', '_self', '1492346763', '1492346763', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('3', '3', '0', '0', '0', '2', '开发文档', 'http://www.kancloud.cn/ming5112/dolphinphp', '', '', '_self', '1492346812', '1492346812', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('4', '3', '0', '0', '0', '2', '开发者社区', 'http://bbs.dolphinphp.com/', '', '', '_self', '1492346832', '1492346832', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('5', '1', '0', '0', '0', '2', '二级菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347372', '1492347510', '100', '1');
INSERT INTO `dn_cms_menu` VALUES ('6', '1', '5', '0', '0', '2', '子菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347388', '1492347520', '100', '1');

-- -----------------------------
-- 表结构 `dn_cms_model`
-- -----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型表';

-- -----------------------------
-- 表数据 `dn_cms_model`
-- -----------------------------

-- -----------------------------
-- 表结构 `dn_cms_nav`
-- -----------------------------
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

-- -----------------------------
-- 表数据 `dn_cms_nav`
-- -----------------------------
INSERT INTO `dn_cms_nav` VALUES ('1', 'main_nav', '顶部导航', '1492345083', '1492345083', '1');
INSERT INTO `dn_cms_nav` VALUES ('2', 'about_nav', '底部关于', '1492346685', '1492346685', '1');
INSERT INTO `dn_cms_nav` VALUES ('3', 'support_nav', '服务与支持', '1492346715', '1492346715', '1');

-- -----------------------------
-- 表结构 `dn_cms_page`
-- -----------------------------
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- -----------------------------
-- 表数据 `dn_cms_page`
-- -----------------------------
INSERT INTO `dn_cms_page` VALUES ('61', 'www.baiduss4.com', '阿里云4', '', '1526400000', '1526448138', '1526450978', '好开心哦', '1', '1', '1.23', '0');
INSERT INTO `dn_cms_page` VALUES ('62', 'www.baiduss5.com', '阿里云5', '', '1526054400', '1526448138', '1526448138', '你知道', '2', '0', '6792.00', '0');
INSERT INTO `dn_cms_page` VALUES ('58', 'www.baiduss1.com', '阿里云1', '', '1525708800', '1526448138', '1526448138', '好', '0', '0', '6788.00', '0');
INSERT INTO `dn_cms_page` VALUES ('59', 'www.baiduss2.com', '阿里云2', '', '1525795200', '1526448138', '1526448138', '不好', '1', '1', '6789.00', '0');
INSERT INTO `dn_cms_page` VALUES ('60', 'www.baiduss3.com', '阿里云3', '', '1525881600', '1526448138', '1526448138', '很棒的', '2', '0', '6790.00', '0');
INSERT INTO `dn_cms_page` VALUES ('51', 'www.wikipedia.org', '腾讯云', 'ip,org', '1526486400', '1526373751', '1526447234', '唯一性。独特性', '2', '0', '5224.00', '0');
INSERT INTO `dn_cms_page` VALUES ('50', 'www.bai6.com', '阿里云6', '', '1526140800', '1526373680', '1526373680', '我的心', '1', '0', '6793.00', '0');
INSERT INTO `dn_cms_page` VALUES ('48', 'www.bai4.com', '阿里云4', '', '1525968000', '1526373680', '1526373680', '好开心哦', '1', '0', '6791.00', '0');
INSERT INTO `dn_cms_page` VALUES ('49', 'www.bai5.com', '阿里云5', '', '1526054400', '1526373680', '1526373680', '你知道', '2', '1', '6792.00', '0');
INSERT INTO `dn_cms_page` VALUES ('46', 'www.bai2.com', '阿里云2', '', '1525795200', '1526373680', '1526373680', '不好', '1', '0', '6789.00', '0');
INSERT INTO `dn_cms_page` VALUES ('47', 'www.bai3.com', '阿里云3', '', '1525881600', '1526373680', '1526373680', '很棒的', '2', '0', '6790.00', '0');
INSERT INTO `dn_cms_page` VALUES ('44', '16830.com', '测试服务商', '1234', '1527955200', '1526371010', '1526371010', '简单便宜', '1', '0', '2300.00', '0');
INSERT INTO `dn_cms_page` VALUES ('45', 'www.bai1.com', '阿里云1', '', '1525708800', '1526373680', '1526373680', '好', '0', '0', '6788.00', '0');
INSERT INTO `dn_cms_page` VALUES ('56', 'www.baishu6.com', '阿里云6', '', '1526140800', '1526373751', '1526373751', '我的心', '1', '0', '6793.00', '0');
INSERT INTO `dn_cms_page` VALUES ('57', 'www.ceshi.com', '2018', '', '1846080000', '1526442003', '1526442003', '测试', '2', '0', '250.00', '0');
INSERT INTO `dn_cms_page` VALUES ('63', 'www.baiduss6.com', '阿里云6', '', '1526140800', '1526448138', '1526448138', '我的心', '1', '0', '6793.00', '0');
INSERT INTO `dn_cms_page` VALUES ('64', 'www.wep.biz', '服务云', '关键刺,域名', '1526745600', '1526448988', '1526455301', '域名卖点\r\n域名卖点\r\n域名卖点\r\n域名卖点\r\n域名卖点', '9', '1', '1236.00', '0');
INSERT INTO `dn_cms_page` VALUES ('65', 'www.ppp.org', '阿里云1', '', '1525708800', '1526449225', '1526449225', '好', '0', '0', '6788.00', '0');
INSERT INTO `dn_cms_page` VALUES ('66', 'www.a.edu', '阿里云2', '', '1525795200', '1526449225', '1526449225', '不好', '1', '0', '6789.00', '0');
INSERT INTO `dn_cms_page` VALUES ('67', 'www.aa.edu', '阿里云3', '', '1525881600', '1526449225', '1526449225', '很棒的', '2', '0', '6790.00', '0');
INSERT INTO `dn_cms_page` VALUES ('68', 'www.aaa.edu', '阿里云4', '', '1525968000', '1526449225', '1526450455', '央视网消息：5月14日，四川省纪委监委在其网站刊文称，已关注到网友反映“严春风舆情”相关情况，已及时介入调查核实。\r\n“严春风舆情”？这事要从5月11日一组在网上盛传的微信群聊截图说起。截图上显示，成都金苹果爱弥儿幼稚园教师“陈某”取，且为内定生。', '1', '0', '6791.00', '0');
INSERT INTO `dn_cms_page` VALUES ('69', 'www.aab.edu', '阿里云5', '', '1526054400', '1526449225', '1526449225', '你知道', '2', '0', '6792.00', '0');
INSERT INTO `dn_cms_page` VALUES ('70', 'www.aac.edu', '阿里云6', '', '1526140800', '1526449225', '1526449225', '我的心', '1', '0', '6793.00', '0');
INSERT INTO `dn_cms_page` VALUES ('71', '1', '1', '1', '1526486400', '1526451740', '1526451740', '1111', '7', '1', '1.00', '0');

-- -----------------------------
-- 表结构 `dn_cms_slider`
-- -----------------------------
DROP TABLE IF EXISTS `dn_cms_slider`;
CREATE TABLE `dn_cms_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='滚动图片表';

-- -----------------------------
-- 表数据 `dn_cms_slider`
-- -----------------------------
INSERT INTO `dn_cms_slider` VALUES ('7', '测试测试', '10', '4', '1526452607', '1526452607', '100', '1');
INSERT INTO `dn_cms_slider` VALUES ('8', '5', '11', '5', '1526452638', '1526452638', '100', '1');

-- -----------------------------
-- 表结构 `dn_cms_support`
-- -----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客服表';

-- -----------------------------
-- 表数据 `dn_cms_support`
-- -----------------------------
INSERT INTO `dn_cms_support` VALUES ('1', '吴先生', '1034613586', '', '', '', '', '1', '100', '1526446865', '1526446865');

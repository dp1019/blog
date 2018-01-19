/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : cake

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-18 07:42:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_ad
-- ----------------------------
DROP TABLE IF EXISTS `think_ad`;
CREATE TABLE `think_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `ad_position_id` varchar(10) DEFAULT NULL COMMENT '广告位',
  `link_url` varchar(128) DEFAULT NULL,
  `images` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_ad
-- ----------------------------
INSERT INTO `think_ad` VALUES ('24', '23', '1', '123', '20170416\\363c841674371a9e730e65a085fbdf18.jpg', '0000-00-00', '0000-00-00', '1', '0', '23');
INSERT INTO `think_ad` VALUES ('25', '123', '1', '213', '20170416\\d8f2098b4846f2e087cc2c5dd1575219.jpg', '2016-10-12', '2016-10-12', '1', '0', '100');
INSERT INTO `think_ad` VALUES ('26', '345', '1', '345', '20170416\\f59059c762d959f04f9226eb0c126987.jpg', '2016-10-25', '2016-10-20', '0', '1', '127');

-- ----------------------------
-- Table structure for think_address
-- ----------------------------
DROP TABLE IF EXISTS `think_address`;
CREATE TABLE `think_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '收货人 ',
  `phone` char(13) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) DEFAULT '' COMMENT '收货地址',
  `vip_id` int(11) DEFAULT NULL COMMENT '会员',
  `is_selected` tinyint(2) DEFAULT '1' COMMENT '是否选中 1:选中 0:未选中',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_address
-- ----------------------------
INSERT INTO `think_address` VALUES ('1', 'wang', '18349275520', '四川成都成华', '14', '1');
INSERT INTO `think_address` VALUES ('2', 'ling', '15749878545', '家里舒服了客家话就是客户部分u时间了附件二', '14', '1');

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `portrait` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES ('1', 'admin', '218dbb225911693af03a713581a7227f', '20161122\\admin.jpg', '319', '127.0.0.1', '1516200036', 'admin', '1', '1', '1ac2fc424c64cdf80db98a246f439287');
INSERT INTO `think_admin` VALUES ('13', 'cake', '218dbb225911693af03a713581a7227f', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', '1797', '116.23.230.7', '1502432142', 'test', '1', '4', '4ee2e395e9921f515d00599a5f79ae3f');

-- ----------------------------
-- Table structure for think_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `think_ad_position`;
CREATE TABLE `think_ad_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_ad_position
-- ----------------------------
INSERT INTO `think_ad_position` VALUES ('22', 'abvc', '15', '1501813036', '1502294001', '1');
INSERT INTO `think_ad_position` VALUES ('23', 'aaa', '30', '1501813046', '1501813046', '1');
INSERT INTO `think_ad_position` VALUES ('25', '首页banner', '50', '1502181832', '1502181832', '1');
INSERT INTO `think_ad_position` VALUES ('26', '6168', '11', '1502182772', '1502182772', '1');

-- ----------------------------
-- Table structure for think_article
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` varchar(64) DEFAULT '' COMMENT '文章图片',
  `remark` varchar(256) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `status` tinyint(1) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '文章类型',
  `is_tui` int(1) DEFAULT '0' COMMENT '是否推荐',
  `from` varchar(16) NOT NULL DEFAULT '' COMMENT '来源',
  `writer` varchar(64) NOT NULL COMMENT '作者',
  `ip` varchar(16) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('46', 'PHP人民币金额数字转中文大写的函数代码', '5', '20170416\\8b2ef718255d495dc9668f0dec0224af.jpg', '在网上看到一个非常有趣的PHP人民币金额数字转中文大写的函数，其实质就是数字转换成中文大写，测试了一下，非常有趣，随便输个数字，就可以将其大写打印出来，新手朋友们试一下吧', '人民币转大写', '<p>在网上看到一个非常有趣的PHP人民币金额数字转中文大写的函数，其实质就是数字转换成中文大写，测试了一下，非常有趣，随便输个数字，就可以将其大写打印出来，新手朋友们试一下吧</p><pre class=\"brush:php;toolbar:false\">/**\n*数字金额转换成中文大写金额的函数\n*String&nbsp;Int&nbsp;&nbsp;$num&nbsp;&nbsp;要转换的小写数字或小写字符串\n*return&nbsp;大写字母\n*小数位为两位\n**/\nfunction&nbsp;get_amount($num){\n$c1&nbsp;=&nbsp;&quot;零壹贰叁肆伍陆柒捌玖&quot;;\n$c2&nbsp;=&nbsp;&quot;分角元拾佰仟万拾佰仟亿&quot;;\n$num&nbsp;=&nbsp;round($num,&nbsp;2);\n$num&nbsp;=&nbsp;$num&nbsp;*&nbsp;100;\nif&nbsp;(strlen($num)&nbsp;&gt;&nbsp;10)&nbsp;{\nreturn&nbsp;&quot;数据太长，没有这么大的钱吧，检查下&quot;;\n}&nbsp;\n$i&nbsp;=&nbsp;0;\n$c&nbsp;=&nbsp;&quot;&quot;;\nwhile&nbsp;(1)&nbsp;{\nif&nbsp;($i&nbsp;==&nbsp;0)&nbsp;{\n$n&nbsp;=&nbsp;substr($num,&nbsp;strlen($num)-1,&nbsp;1);\n}&nbsp;else&nbsp;{\n$n&nbsp;=&nbsp;$num&nbsp;%&nbsp;10;\n}&nbsp;\n$p1&nbsp;=&nbsp;substr($c1,&nbsp;3&nbsp;*&nbsp;$n,&nbsp;3);\n$p2&nbsp;=&nbsp;substr($c2,&nbsp;3&nbsp;*&nbsp;$i,&nbsp;3);\nif&nbsp;($n&nbsp;!=&nbsp;&#39;0&#39;&nbsp;||&nbsp;($n&nbsp;==&nbsp;&#39;0&#39;&nbsp;&amp;&amp;&nbsp;($p2&nbsp;==&nbsp;&#39;亿&#39;&nbsp;||&nbsp;$p2&nbsp;==&nbsp;&#39;万&#39;&nbsp;||&nbsp;$p2&nbsp;==&nbsp;&#39;元&#39;)))&nbsp;{\n$c&nbsp;=&nbsp;$p1&nbsp;.&nbsp;$p2&nbsp;.&nbsp;$c;\n}&nbsp;else&nbsp;{\n$c&nbsp;=&nbsp;$p1&nbsp;.&nbsp;$c;\n}&nbsp;\n$i&nbsp;=&nbsp;$i&nbsp;+&nbsp;1;\n$num&nbsp;=&nbsp;$num&nbsp;/&nbsp;10;\n$num&nbsp;=&nbsp;(int)$num;\nif&nbsp;($num&nbsp;==&nbsp;0)&nbsp;{\nbreak;\n}&nbsp;\n}\n$j&nbsp;=&nbsp;0;\n$slen&nbsp;=&nbsp;strlen($c);\nwhile&nbsp;($j&nbsp;&lt;&nbsp;$slen)&nbsp;{\n$m&nbsp;=&nbsp;substr($c,&nbsp;$j,&nbsp;6);\nif&nbsp;($m&nbsp;==&nbsp;&#39;零元&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零万&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零亿&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零零&#39;)&nbsp;{\n$left&nbsp;=&nbsp;substr($c,&nbsp;0,&nbsp;$j);\n$right&nbsp;=&nbsp;substr($c,&nbsp;$j&nbsp;+&nbsp;3);\n$c&nbsp;=&nbsp;$left&nbsp;.&nbsp;$right;\n$j&nbsp;=&nbsp;$j-3;\n$slen&nbsp;=&nbsp;$slen-3;\n}&nbsp;\n$j&nbsp;=&nbsp;$j&nbsp;+&nbsp;3;\n}&nbsp;\nif&nbsp;(substr($c,&nbsp;strlen($c)-3,&nbsp;3)&nbsp;==&nbsp;&#39;零&#39;)&nbsp;{\n$c&nbsp;=&nbsp;substr($c,&nbsp;0,&nbsp;strlen($c)-3);\n}\nif&nbsp;(empty($c))&nbsp;{\nreturn&nbsp;&quot;零元整&quot;;\n}else{\nreturn&nbsp;$c&nbsp;.&nbsp;&quot;整&quot;;\n}\n}</pre><p>最终实现效果：</p><p><img src=\"/Uploads/ueditor/2015-12-28/1451310141372440.png\" title=\"1451310141372440.png\" alt=\"1449026968974428.png\"/></p>', '1', '1', '1', '1', 'Win 8.1', '轮回', '124.152.7.106', '1449026848', '1492346057');
INSERT INTO `think_article` VALUES ('47', 'Windows下mysql忘记密码的解决方法', '1', '20170416\\f5f5aacefa23b9efb1c81895cb932572.jpg', 'Windows下mysql忘记密码的解决方法', 'mysql', '<p>方法一：</p><p>1、在DOS窗口下输入</p><pre>net&nbsp;stop&nbsp;mysql5</pre><p>&nbsp;</p><p>或</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、开一个DOS窗口，这个需要切换到mysql的bin目录。<br/>一般在bin目录里面创建一个批处理1.bat,内容是cmd.exe运行一下即可就切换到当前目录，然后输入</p><pre>mysqld-nt&nbsp;--skip-grant-tables;</pre><p>&nbsp;</p><p>3、再开一个DOS窗口</p><pre>mysql&nbsp;-u&nbsp;root</pre><p>&nbsp;</p><p>4、输入：</p><pre>use&nbsp;mysql&nbsp;\nupdate&nbsp;user&nbsp;set&nbsp;password=password(&quot;new_pass&quot;)&nbsp;where&nbsp;user=&quot;root&quot;;&nbsp;\nflush&nbsp;privileges;&nbsp;\nexit</pre><p>&nbsp;</p><p>5、使用任务管理器，找到mysqld-nt的进程，结束进程&nbsp;<br/>或下面的步骤<br/>1，停止MYSQL服务，CMD打开DOS窗口，输入 net stop mysql&nbsp;<br/>2，在CMD命令行窗口，进入MYSQL安装目录 比如E:Program FilesMySQLMySQL Server 5.0bin&nbsp;<br/>示范命令:&nbsp;<br/>输入 e:回车,&nbsp;<br/>输入cd &quot;E:Program FilesMySQLMySQL Server 5.0bin&quot;&nbsp;<br/>注意双引号也要输入,这样就可以进入Mysql安装目录了.&nbsp;<br/>3，进入mysql安全模式，即当mysql起来后，不用输入密码就能进入数据库。&nbsp;<br/>命令为：</p><pre>mysqld-nt&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>4，重新打开一个CMD命令行窗口，输入</p><p>mysql -uroot -p，使用空密码的方式登录MySQL（不用输入密码，直接按回车）</p><p>5，输入以下命令开始修改root用户的密码（注意：命令中mysql.user中间有个“点”）</p><p>mysql.user：数据库名.表名<br/>mysql&gt; update mysql.user set password=PASSWORD(&#39;新密码&#39;) where User=&#39;root&#39;;&nbsp;<br/>6，刷新权限表&nbsp;<br/>mysql&gt; flush privileges;&nbsp;<br/>7，退出&nbsp;<br/>mysql&gt; quit</p><p><br/>这样MYSQL超级管理员账号 ROOT已经重新设置好了，接下来 在任务管理器里结束掉 mysql-nt.exe 这个进程，重新启动MYSQL即可！</p><p>（也可以直接重新启动服务器）&nbsp;<br/>MYSQL重新启动后，就可以用新设置的ROOT密码登陆MYSQL了！</p><p>方法二：</p><p>首先在 MySQL的安装目录下 新建一个pwdhf.txt, 输入文本：</p><pre>SET&nbsp;PASSWORD&nbsp;FOR&nbsp;&#39;root&#39;@&#39;localhost&#39;&nbsp;=&nbsp;PASSWORD(&#39;*****&#39;);</pre><p>&nbsp;</p><p>红色部份为 需要设置的新密码&nbsp;<br/>用windows服务管理工具或任务管理器来停止MySQL服务 (任务管理器K掉 mysqld-nt 进程)&nbsp;<br/>Dos命令提示符到 MySQL安装目录下的bin目录 如我的是</p><p>D:Program FilesMySQLMySQL Server 5.1bin&nbsp;<br/>然后运行：</p><pre>mysqld-nt&nbsp;--init-file=../pwdhf.txt</pre><p>&nbsp;</p><p>执行完毕， 停止MySQL数据库服务 (任务管理器K掉 mysqld-nt 进程)，然后再重新以正常模式启动MYSQL 即可</p><hr style=\"color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p>mysql5.1或以上</p><p>1、 首先检查mysql服务是否启动，若已启动则先将其停止服务，可在开始菜单的运行，使用命令：</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、打开第一个cmd窗口，切换到mysql的bin目录，运行命令：</p><pre>mysqld&nbsp;--defaults-file=&quot;C:Program&nbsp;FilesMySQLMySQL&nbsp;Server&nbsp;5.1my.ini&quot;&nbsp;--console&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>注释：</p><p>该命令通过跳过权限安全检查，开启mysql服务，这样连接mysql时，可以不用输入用户密码。&nbsp;<br/>&nbsp;</p><p>&nbsp;</p><p>3、打开第二个cmd窗口，连接mysql：</p><p>输入命令：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>出现：</p><p>Enter password:</p><p>在这里直接回车，不用输入密码。</p><p>然后就就会出现登录成功的信息，</p><p>&nbsp;</p><p>&nbsp;</p><p>4、使用命令：</p><pre>show&nbsp;databases;</pre><p>&nbsp;</p><p>&nbsp;</p><p>5、使用命令切换到mysql数据库：</p><pre>use&nbsp;mysql;</pre><p>&nbsp;</p><p>6、使用命令更改root密码为123456：</p><pre>UPDATE&nbsp;user&nbsp;SET&nbsp;Password=PASSWORD(&#39;123456&#39;)&nbsp;where&nbsp;USER=&#39;root&#39;;</pre><p>&nbsp;</p><p>&nbsp;</p><p>7、刷新权限：</p><pre>FLUSH&nbsp;PRIVILEGES;</pre><p>&nbsp;</p><p>8、然后退出，重新登录：</p><p>quit</p><p>重新登录：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>&nbsp;</p><p>9、出现输入密码提示，输入新的密码即可登录：</p><p>Enter password: ***********</p><p>显示登录信息： 成功&nbsp; 就一切ok了</p><p>&nbsp;</p><p>10、重新启动mysql服务</p><pre>net&nbsp;start&nbsp;mysql</pre><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '0.0.0.0', '1450339377', '1492346047');
INSERT INTO `think_article` VALUES ('48', '禁止网页复制的代码', '1', '20170416\\c3646031ca540e4217d1228eefe99c4c.jpg', '禁止网页复制的代码', '网页复制', '<p>今天做一网站项目时，客户要求让用户不能复制网站内容，网上搜索了一下，总结成以下二几行代码。其实吧，要是懂的人，这些都是浮云来的，客户就是要让一般人不能复制他的内容资料。</p><pre class=\"brush:html;toolbar:false\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 9.5px; list-style: none; border: 1px solid rgb(204, 204, 204); overflow: auto; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 13px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; border-radius: 4px; background-color: rgb(245, 245, 245);\">&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;&lt;\ntitle\n&gt;禁止网页复制的代码&nbsp;&nbsp;网页禁止右键、禁止查看源代码、禁止复制的代码，试试你的右键、ctrl+c和ctrl+c吧~\n&nbsp;&nbsp;\n&nbsp;&nbsp;&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;</pre><p><br/></p>', '1', '0', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1450340150', '1492346038');
INSERT INTO `think_article` VALUES ('49', '如何使用谷歌字体', '1', '20170416\\970c587b487610a793857bc161773f2a.jpg', '如何使用谷歌字体', '谷歌字体', '<p style=\"text-align:center\"><img src=\"/Uploads/ueditor/2015-12-28/1451233062718458.png\" title=\"1451233062718458.png\" alt=\"QQ截图20151228001616.png\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">国内网站使用谷歌字体是不方便的，解决办法如下<br style=\"padding: 0px; margin: 0px;\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">1、将谷歌的地址换成360的</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><a href=\"http://fonts.googleapis.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.googleapis.com</a>&nbsp;换成&nbsp;<a href=\"http://fonts.useso.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.useso.com</a></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">2、只做了第一步还是有问题的，会报错：</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">No &#39;Access-Control-Allow-Origin&#39; header is present on the requested resource</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">解决办法是给html页面添加头信息</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><span style=\"padding: 0px; margin: 0px; color: rgb(70, 70, 70); font-family: Arial，; font-size: 14px; line-height: 21px;\"><meta http-equiv=\"Access-Control-Allow-Origin\" content=\"*\"/></span></p><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '0.0.0.0', '1450764484', '1492346031');
INSERT INTO `think_article` VALUES ('50', 'winForm窗体关闭按钮实现托盘后台运行（类似QQ托盘区运行）', '4', '20170416\\50929a5bfd0a8ecd4e0883172c9814cc.jpg', '今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。 对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。', 'winForm', '<p>今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。</p><p>&nbsp;</p><p>对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。</p><p>&nbsp;</p><p>其实，这个在网上也有很多的实现方法，但是我试了试有些直接复制过来并不能直接运行，或者能运行的吧又没有注释。今天在这里就给大家贴一下我的代码，也有不足之处，希望大家给出意见.</p><p style=\"text-align:center\"><img src=\"/Uploads/ueditor/2015-12-28/1451309750351569.png\" title=\"1451309750351569.png\" alt=\"1450926662631174.png\"/></p><pre class=\"brush:c#;toolbar:false\">using&nbsp;System;\nusing&nbsp;System.Collections.Generic;\nusing&nbsp;System.ComponentModel;\nusing&nbsp;System.Data;\nusing&nbsp;System.Drawing;\nusing&nbsp;System.Linq;\nusing&nbsp;System.Text;\nusing&nbsp;System.Windows.Forms;\nusing&nbsp;System.Windows;\nnamespace&nbsp;winform窗体托盘后台运行\n{\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;partial&nbsp;class&nbsp;Form1&nbsp;:&nbsp;Form&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里在窗体上没有拖拽一个NotifyIcon控件，而是在这里定义了一个变量\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;NotifyIcon&nbsp;notifyIcon&nbsp;=&nbsp;null;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Form1()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitializeComponent();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//调用初始化托盘显示函数\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitialTray();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_Load(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里写其他代码\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;窗体关闭的单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_FormClosing(object&nbsp;sender,&nbsp;FormClosingEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Cancel&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//通过这里可以看出，这里的关闭其实不是真正意义上的“关闭”，而是将窗体隐藏，实现一个“伪关闭”\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;InitialTray()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//隐藏主窗体\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//实例化一个NotifyIcon对象\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon&nbsp;=&nbsp;new&nbsp;NotifyIcon();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标气泡显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.BalloonTipText&nbsp;=&nbsp;&quot;正在后台运行&quot;;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Text&nbsp;=&nbsp;&quot;窗体托盘后台运行测试程序&quot;;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注意：下面的路径可以是绝对路径、相对路径。但是需要注意的是：文件必须是一个.ico格式\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Icon&nbsp;=&nbsp;new&nbsp;System.Drawing.Icon(&quot;E:/ASP项目/images/3.5&nbsp;inch&nbsp;Floppy.ico&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//true表示在托盘区可见，false表示在托盘区不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//气泡显示的时间（单位是毫秒）\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ShowBalloonTip(2000);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.MouseClick&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.MouseEventHandler(notifyIcon_MouseClick);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////设置二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting1&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单1&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting2&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单2&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;一级菜单&quot;,&nbsp;new&nbsp;MenuItem[]{setting1,setting2});\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//帮助选项，这里只是“有名无实”在菜单上只是显示，单击没有效果，可以参照下面的“退出菜单”实现单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;help&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;帮助&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//关于选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;about&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;关于&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出菜单项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;exit&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;退出&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exit.Click&nbsp;+=&nbsp;new&nbsp;EventHandler(exit_Click);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////关联托盘控件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注释的这一行与下一行的区别就是参数不同，setting这个参数是为了实现二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{&nbsp;setting,&nbsp;help,&nbsp;about,&nbsp;exit&nbsp;};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{help,about,exit};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ContextMenu&nbsp;=&nbsp;new&nbsp;ContextMenu(childen);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//窗体关闭时触发\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.FormClosing&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;鼠标单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;notifyIcon_MouseClick(object&nbsp;sender,&nbsp;System.Windows.Forms.MouseEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//鼠标左键单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(e.Button&nbsp;==&nbsp;MouseButtons.Left)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果窗体是可见的，那么鼠标左击托盘区图标后，窗体为不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(this.Visible&nbsp;==&nbsp;true&nbsp;)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Activate();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;退出选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;exit_Click(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出程序\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.Environment.Exit(0);&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '124.152.7.106', '1450926579', '1492346022');
INSERT INTO `think_article` VALUES ('67', '太难', '2', '20170810\\cd115e0dd64732861ad62ebd75fd5e15.jpg', '', 'PHP', '<p>W 发士大夫但是</p>', '1', '1', '1', '0', '', '', '', '1501597084', '1502341187');
INSERT INTO `think_article` VALUES ('68', '54254254', '2', '20170824\\dfade61edda20cfd4e10962259466150.png', '5254', '242424', '<p><br/></p><p>2145254254254</p>', '1', '1', '1', '1', '', '', '', '1503569472', '1503569472');

-- ----------------------------
-- Table structure for think_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `think_article_cate`;
CREATE TABLE `think_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article_cate
-- ----------------------------
INSERT INTO `think_article_cate` VALUES ('1', '大鼻孔', '1', '1477140627', '1502266891', '1');
INSERT INTO `think_article_cate` VALUES ('2', '生活随笔', '2', '1477140627', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('3', '热点分享', '3', '1477140604', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('4', '.NET', '4', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('5', 'PHP', '5', '1477140627', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('6', 'Java', '6', '1477140627', '1477140627', '0');

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '1', '', '1446535750', '1446535750');
INSERT INTO `think_auth_group` VALUES ('4', '系统测试员', '1', '5,6,7,8,27,28,29,24,25,40,41,43,26,44,45,47', '1446535750', '1515261608');

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('13', '4');

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', 'fa fa-gear', '', '0', '1', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/user/index', '用户管理', '1', '1', '', '', '1', '10', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '1', '', '', '1', '20', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('4', 'admin/menu/index', '菜单管理', '1', '1', '', '', '1', '30', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('5', '#', '数据库管理', '1', '1', 'fa fa-database', '', '0', '2', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '1', '', '', '5', '50', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/data/optimize', '优化表', '1', '1', '', '', '6', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/data/repair', '修复表', '1', '1', '', '', '6', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/user/useradd', '添加用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/user/useredit', '编辑用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/user/userdel', '删除用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/user/user_state', '用户状态', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('13', '#', '日志管理', '1', '0', 'fa fa-tasks', '', '0', '6', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/log/operate_log', '行为日志', '1', '1', '', '', '13', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('22', 'admin/log/del_log', '删除日志', '1', '1', '', '', '14', '50', '1477312169', '1477316778');
INSERT INTO `think_auth_rule` VALUES ('24', '#', '文章管理', '1', '1', 'fa fa-paste', '', '0', '4', '1477312169', '1515261889');
INSERT INTO `think_auth_rule` VALUES ('25', 'admin/article/index_cate', '文章分类', '1', '1', '', '', '24', '10', '1477312260', '1515261868');
INSERT INTO `think_auth_rule` VALUES ('26', 'admin/article/index', '文章列表', '1', '1', '', '', '24', '20', '1477312333', '1477312333');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/data/import', '数据库还原', '1', '1', '', '', '5', '50', '1477639870', '1477639870');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/data/revert', '还原', '1', '1', '', '', '27', '50', '1477639972', '1477639972');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/data/del', '删除', '1', '1', '', '', '27', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/role/roleAdd', '添加角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/role/roleEdit', '编辑角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/role/roleDel', '删除角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/role/role_state', '角色状态', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/role/giveAccess', '权限分配', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/menu/add_rule', '添加菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/menu/edit_rule', '编辑菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/menu/del_rule', '删除菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('38', 'admin/menu/rule_state', '菜单状态', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/menu/ruleorder', '菜单排序', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('40', 'admin/article/add_cate', '添加分类', '1', '1', '', '', '25', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('41', 'admin/article/edit_cate', '编辑分类', '1', '1', '', '', '25', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('42', 'admin/article/del_cate', '删除分类', '1', '1', '', '', '25', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('43', 'admin/article/cate_state', '分类状态', '1', '1', '', '', '25', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('44', 'admin/article/add_article', '添加文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('45', 'admin/article/edit_article', '编辑文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('46', 'admin/article/del_article', '删除文章', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('47', 'admin/article/article_state', '文章状态', '1', '1', '', '', '26', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('48', '#', '广告管理', '1', '0', 'fa fa-image', '', '0', '5', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('49', 'admin/ad/index_position', '广告位', '1', '1', '', '', '48', '10', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('50', 'admin/ad/add_position', '添加广告位', '1', '1', '', '', '49', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('51', 'admin/ad/edit_position', '编辑广告位', '1', '1', '', '', '49', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('52', 'admin/ad/del_position', '删除广告位', '1', '1', '', '', '49', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('53', 'admin/ad/position_state', '广告位状态', '1', '1', '', '', '49', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('54', 'admin/ad/index', '广告列表', '1', '1', '', '', '48', '20', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('55', 'admin/ad/add_ad', '添加广告', '1', '1', '', '', '54', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('56', 'admin/ad/edit_ad', '编辑广告', '1', '1', '', '', '54', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('57', 'admin/ad/del_ad', '删除广告', '1', '1', '', '', '54', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('58', 'admin/ad/ad_state', '广告状态', '1', '1', '', '', '54', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('61', 'admin/config/index', '配置管理', '1', '1', '', '', '1', '50', '1479908607', '1479908607');
INSERT INTO `think_auth_rule` VALUES ('62', 'admin/config/index', '配置列表', '1', '1', '', '', '61', '50', '1479908607', '1487943813');
INSERT INTO `think_auth_rule` VALUES ('63', 'admin/config/save', '保存配置', '1', '1', '', '', '61', '50', '1479908607', '1487943831');
INSERT INTO `think_auth_rule` VALUES ('70', '#', '会员管理', '1', '1', 'fa fa-users', '', '0', '3', '1484103066', '1484103066');
INSERT INTO `think_auth_rule` VALUES ('71', 'admin/member/group', '会员组', '1', '0', '', '', '70', '10', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('72', 'admin/member/add_group', '添加会员组', '1', '1', '', '', '71', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('73', 'admin/member/edit_group', '编辑会员组', '1', '1', '', '', '71', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('74', 'admin/member/del_group', '删除会员组', '1', '1', '', '', '71', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('75', 'admin/member/index', '会员列表', '1', '1', '', '', '70', '20', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('76', 'admin/member/add_member', '添加会员', '1', '1', '', '', '75', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('77', 'admin/member/edit_member', '编辑会员', '1', '1', '', '', '75', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('78', 'admin/member/del_member', '删除会员', '1', '1', '', '', '75', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('79', 'admin/member/member_status', '会员状态', '1', '1', '', '', '75', '50', '1484103304', '1487937671');
INSERT INTO `think_auth_rule` VALUES ('80', 'admin/member/group_status', '会员组状态', '1', '1', '', '', '71', '50', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('83', '#', '示例', '1', '1', 'fa fa-paper-plane', '', '0', '50', '1505281878', '1505281878');
INSERT INTO `think_auth_rule` VALUES ('84', 'admin/demo/sms', '发送短信', '1', '1', '', '', '83', '50', '1505281944', '1505281944');
INSERT INTO `think_auth_rule` VALUES ('85', '#', '商品管理', '1', '1', 'fa fa-user', '', '0', '50', '1515262496', '1515323117');
INSERT INTO `think_auth_rule` VALUES ('86', 'admin/product/index', '产品列表', '1', '1', '', '', '85', '50', '1515262564', '1515262564');
INSERT INTO `think_auth_rule` VALUES ('87', 'admin/product/index_cate', '产品分类', '1', '1', '', '', '85', '50', '1515262634', '1515265575');
INSERT INTO `think_auth_rule` VALUES ('88', 'admin/product/index_code', '优惠卷', '1', '1', 'fa fa-user', '', '85', '50', '1515272967', '1515323077');
INSERT INTO `think_auth_rule` VALUES ('89', '#', '订单管理', '1', '1', 'fa fa-user', '', '0', '50', '1516200108', '1516200108');
INSERT INTO `think_auth_rule` VALUES ('90', 'admin/order/index', '订单列表', '1', '1', '', '', '89', '50', '1516200150', '1516200150');

-- ----------------------------
-- Table structure for think_code
-- ----------------------------
DROP TABLE IF EXISTS `think_code`;
CREATE TABLE `think_code` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL COMMENT '满多少',
  `reduce` decimal(10,2) DEFAULT NULL COMMENT '减多少',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_code
-- ----------------------------
INSERT INTO `think_code` VALUES ('1', '满2件1', '1', '1477140627', '1515316844', '1', '100.00', '90.00');
INSERT INTO `think_code` VALUES ('2', '31', '2', '1477140627', '1477140627', '0', '100.00', '3.00');
INSERT INTO `think_code` VALUES ('3', '14', '3', '1477140604', '1477140627', '0', '100.00', '6.00');
INSERT INTO `think_code` VALUES ('4', '.15', '4', '1477140627', '1477140627', '1', '200.00', '20.00');
INSERT INTO `think_code` VALUES ('5', '100,2', '5', '1477140627', '1477140627', '0', '400.00', '50.00');
INSERT INTO `think_code` VALUES ('21', '给我个', '100', '1515322843', '1515322843', null, '0.00', '0.00');

-- ----------------------------
-- Table structure for think_config
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES ('1', 'web_site_title', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('2', 'web_site_description', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('3', 'web_site_keyword', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('4', 'web_site_icp', '陇ICP备15002349号-1');
INSERT INTO `think_config` VALUES ('5', 'web_site_cnzz', '');
INSERT INTO `think_config` VALUES ('6', 'web_site_copy', 'Copyright © 2017 轮回后台管理系统 All rights reserved.');
INSERT INTO `think_config` VALUES ('7', 'web_site_close', '1');
INSERT INTO `think_config` VALUES ('8', 'list_rows', '10');
INSERT INTO `think_config` VALUES ('9', 'admin_allow_ip', null);
INSERT INTO `think_config` VALUES ('10', 'alisms_appkey', '');
INSERT INTO `think_config` VALUES ('11', 'alisms_appsecret', '');
INSERT INTO `think_config` VALUES ('12', 'alisms_signname', '');

-- ----------------------------
-- Table structure for think_log
-- ----------------------------
DROP TABLE IF EXISTS `think_log`;
CREATE TABLE `think_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4387 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_log
-- ----------------------------
INSERT INTO `think_log` VALUES ('4337', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469529');
INSERT INTO `think_log` VALUES ('4338', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469560');
INSERT INTO `think_log` VALUES ('4339', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469632');
INSERT INTO `think_log` VALUES ('4340', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469748');
INSERT INTO `think_log` VALUES ('4341', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469749');
INSERT INTO `think_log` VALUES ('4342', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469801');
INSERT INTO `think_log` VALUES ('4343', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469853');
INSERT INTO `think_log` VALUES ('4344', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503470004');
INSERT INTO `think_log` VALUES ('4345', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503470488');
INSERT INTO `think_log` VALUES ('4346', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503473610');
INSERT INTO `think_log` VALUES ('4347', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503569426');
INSERT INTO `think_log` VALUES ('4348', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505098116');
INSERT INTO `think_log` VALUES ('4349', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505281421');
INSERT INTO `think_log` VALUES ('4350', '1', 'admin', '用户【admin】添加菜单成功', '0.0.0.0', '1', '1505281878');
INSERT INTO `think_log` VALUES ('4351', '1', 'admin', '用户【admin】添加菜单成功', '0.0.0.0', '1', '1505281944');
INSERT INTO `think_log` VALUES ('4352', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505283850');
INSERT INTO `think_log` VALUES ('4354', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505291620');
INSERT INTO `think_log` VALUES ('4355', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515260122');
INSERT INTO `think_log` VALUES ('4356', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515260351');
INSERT INTO `think_log` VALUES ('4357', '1', 'admin', '用户【test】编辑成功', '127.0.0.1', '1', '1515260517');
INSERT INTO `think_log` VALUES ('4358', '13', 'test', '用户【test】登录失败：该账号被禁用', '127.0.0.1', '2', '1515260529');
INSERT INTO `think_log` VALUES ('4359', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515260534');
INSERT INTO `think_log` VALUES ('4360', '1', 'admin', '用户【cake】编辑成功', '127.0.0.1', '1', '1515261543');
INSERT INTO `think_log` VALUES ('4361', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515261656');
INSERT INTO `think_log` VALUES ('4362', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515261868');
INSERT INTO `think_log` VALUES ('4363', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515261889');
INSERT INTO `think_log` VALUES ('4364', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1515262496');
INSERT INTO `think_log` VALUES ('4365', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1515262564');
INSERT INTO `think_log` VALUES ('4366', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1515262634');
INSERT INTO `think_log` VALUES ('4367', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515262658');
INSERT INTO `think_log` VALUES ('4368', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515265575');
INSERT INTO `think_log` VALUES ('4369', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1515272967');
INSERT INTO `think_log` VALUES ('4370', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1515315516');
INSERT INTO `think_log` VALUES ('4371', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515323077');
INSERT INTO `think_log` VALUES ('4372', '1', 'admin', '用户【admin】编辑菜单成功', '127.0.0.1', '1', '1515323117');
INSERT INTO `think_log` VALUES ('4373', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1515337379');
INSERT INTO `think_log` VALUES ('4374', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515379158');
INSERT INTO `think_log` VALUES ('4375', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1515547036');
INSERT INTO `think_log` VALUES ('4376', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1515547043');
INSERT INTO `think_log` VALUES ('4377', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1515547052');
INSERT INTO `think_log` VALUES ('4378', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515547055');
INSERT INTO `think_log` VALUES ('4379', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515566570');
INSERT INTO `think_log` VALUES ('4380', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515653921');
INSERT INTO `think_log` VALUES ('4381', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515687262');
INSERT INTO `think_log` VALUES ('4382', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1515812300');
INSERT INTO `think_log` VALUES ('4383', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1516074218');
INSERT INTO `think_log` VALUES ('4384', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1516200036');
INSERT INTO `think_log` VALUES ('4385', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1516200108');
INSERT INTO `think_log` VALUES ('4386', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1516200150');

-- ----------------------------
-- Table structure for think_member
-- ----------------------------
DROP TABLE IF EXISTS `think_member`;
CREATE TABLE `think_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `password` char(32) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `head_img` varchar(128) DEFAULT NULL COMMENT '头像',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `create_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后一次登录',
  `login_num` varchar(15) DEFAULT NULL COMMENT '登录次数',
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常  0 禁用',
  `closed` tinyint(1) DEFAULT '0' COMMENT '0正常，1删除',
  `token` char(32) DEFAULT '0' COMMENT '令牌',
  `session_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212066 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_member
-- ----------------------------
INSERT INTO `think_member` VALUES ('1', '18809321929', '醉凡尘丶Wordly', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\admin.jpg', '92960', '73', '18809321929', '1476762875', '1476762875', '0', '1', '0', '0', '');
INSERT INTO `think_member` VALUES ('2', '1217037610', 'XiMi丶momo', '2', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\ab9f9c492871857e1a6c5bc1c658ef7f.jpg', '300', '200', '18809321956', '1476779394', '1476779394', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('3', '1217037610', '紫陌轩尘', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', '400', '434', '49494', '1476676516', '1476676516', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('4', '', 'fag', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\8a69f4c962e26265fd9f12efbff65013.jpg', '24', '424', '242', '1476425833', '1476425833', '0', '0', '1', '0', '');
INSERT INTO `think_member` VALUES ('5', '18809321928', '空谷幽兰', '2', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\admin.jpg', '53', '3636', '3636', '1476676464', '1476676464', '0', '1', '0', '0', '');
INSERT INTO `think_member` VALUES ('6', '', '787367373', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\ab9f9c492871857e1a6c5bc1c658ef7f.jpg', '414', '9', '73737373', '1476425750', '1476425750', '0', '0', '1', '0', '');
INSERT INTO `think_member` VALUES ('7', '18809321929', 'XMi丶呵呵', '2', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', '373373', '33', '73', '1476692255', '1476692255', '0', '0', '0', '0', '');
INSERT INTO `think_member` VALUES ('8', '1246470984', 'XY', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\8a69f4c962e26265fd9f12efbff65013.jpg', '7383', '73737373', '7373', '1476692123', '1476692123', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('9', '18793189097', '25773', '1', 'd41d8cd98f00b204e9800998ecf8427e', '1', '20161122\\admin.jpg', '7373737', '77', '7373733', '1476433452', '1476433452', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('10', '1246470984', 'XiYu', '2', 'e10adc3949ba59abbe56e057f20f883e', '1', '20161122\\ab9f9c492871857e1a6c5bc1c658ef7f.jpg', '100', '100', '18793189091', '1476694831', '1476694831', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('11', '', '烟勤话少脾气好', '0', '', '1', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', '0', '0', '', '1488030906', '0', '0', '0', '0', '0', '');
INSERT INTO `think_member` VALUES ('12', '1246470984', 'XiYu', '2', 'e10adc3949ba59abbe56e057f20f883e', '1', '20161122\\8a69f4c962e26265fd9f12efbff65013.jpg', '100', '100', '18793189091', '1488030906', '1476694831', '0', '1', '1', '0', '');
INSERT INTO `think_member` VALUES ('212065', '111', '111', '0', 'deb2a3420354e40d55a1b0cb3a947cd0', '121', '<!doctype html>\n<html>\n<head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n    <title>跳转提示</title>\n', '0', '0', '', '1502341127', '1502341127', null, null, '0', '0', null);

-- ----------------------------
-- Table structure for think_member_group
-- ----------------------------
DROP TABLE IF EXISTS `think_member_group`;
CREATE TABLE `think_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言Id',
  `group_name` varchar(32) NOT NULL COMMENT '留言评论作者',
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '留言回复时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of think_member_group
-- ----------------------------
INSERT INTO `think_member_group` VALUES ('1', '系统组', '0', '1441616559', '1502341098');
INSERT INTO `think_member_group` VALUES ('2', '游客组', '1', '1441617195', '1502281865');
INSERT INTO `think_member_group` VALUES ('3', 'VIP', '1', '1441769224', null);

-- ----------------------------
-- Table structure for think_order
-- ----------------------------
DROP TABLE IF EXISTS `think_order`;
CREATE TABLE `think_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` int(4) NOT NULL COMMENT '购买者账号id',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '配送地址',
  `total_price` int(11) NOT NULL COMMENT '订单总价',
  `status` tinyint(4) NOT NULL COMMENT '订单状态，0待支付1已支付2配送中3待评论4已完成',
  `order_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户留言',
  `created_time` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '下单时间',
  `day` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '配送日期',
  `time` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '配送时间段',
  `code_id` int(11) DEFAULT NULL,
  `candle` int(11) DEFAULT NULL COMMENT '蜡烛数量',
  `card` tinyint(1) DEFAULT '0' COMMENT '随机贺卡 0：不需要 1：需要',
  `consignee` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货人',
  `receiving_telephone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货电话',
  `urge` tinyint(1) DEFAULT '0' COMMENT '0:正常 1:催单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of think_order
-- ----------------------------
INSERT INTO `think_order` VALUES ('169', '1', '测试地址二', '24600', '3', '2018011801303717677', '', '2018-01-18 01:30', '2018-01-18', '14:00-17:00', '2', '40', '0', 'json1', '18184642498', '0');
INSERT INTO `think_order` VALUES ('170', '1', '测试地址二', '280', '0', '2018011801361669234', '', '2018-01-18 01:36', '2018-03-22', '14:00-17:00', '2', '30', '0', 'json1', '18184642498', '0');
INSERT INTO `think_order` VALUES ('171', '1', '测试地址一', '12', '0', '2018011801392843700', '', '2018-01-18 01:39', '2018-01-18', '14:00-17:00', '2', '0', '0', 'json', '18184642584', '0');
INSERT INTO `think_order` VALUES ('172', '1', '测试地址三', '198', '0', '2018011801572675364', '', '2018-01-18 01:57', '2018-01-18', '14:00-17:00', '2', '0', '0', 'json2', '18184642154', '0');
INSERT INTO `think_order` VALUES ('173', '1', '四川成都市金牛区测试地址二', '198', '0', '2018011802063459378', '', '2018-01-18 02:06', '2018-01-18', '14:00-17:00', '2', '0', '0', 'json1', '18184642498', '0');
INSERT INTO `think_order` VALUES ('174', '1', '云南省大理市58区测试地址三', '594', '0', '2018011802075476111', '', '2018-01-18 02:07', '2018-01-18', '14:00-17:00', '2', '30', '0', 'json2', '18184642154', '0');

-- ----------------------------
-- Table structure for think_orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `think_orderdetails`;
CREATE TABLE `think_orderdetails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) NOT NULL COMMENT '商品id',
  `standard` int(11) NOT NULL COMMENT '规格id',
  `num` int(11) NOT NULL COMMENT '数量',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `cake_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `standard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格名称',
  `nowPrice` float DEFAULT NULL COMMENT '购买时价格',
  `img` text COLLATE utf8_unicode_ci COMMENT '产品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of think_orderdetails
-- ----------------------------
INSERT INTO `think_orderdetails` VALUES ('193', '91', '67', '6', '169', '测试添加优惠券', '3寸', '4100', 'http://cake.com/uploads/images/20180111/659b5703ef22ea02e22752ab91bf1821.jpg');
INSERT INTO `think_orderdetails` VALUES ('194', '49', '64', '1', '170', '如何使用谷歌字体', '2寸3人', '280', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg');
INSERT INTO `think_orderdetails` VALUES ('195', '73', '50', '1', '171', '测试数据', '好好玩啊', '12.5', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg');
INSERT INTO `think_orderdetails` VALUES ('196', '69', '59', '1', '172', '呵呵呵呵', '5寸好吃', '198', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg');
INSERT INTO `think_orderdetails` VALUES ('197', '69', '59', '1', '173', '呵呵呵呵', '5寸好吃', '198', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg');
INSERT INTO `think_orderdetails` VALUES ('198', '69', '59', '3', '174', '呵呵呵呵', '5寸好吃', '198', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg');

-- ----------------------------
-- Table structure for think_point
-- ----------------------------
DROP TABLE IF EXISTS `think_point`;
CREATE TABLE `think_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `point` int(11) DEFAULT NULL COMMENT '积分',
  `vip_id` int(11) DEFAULT NULL COMMENT '用户',
  `type` tinyint(2) DEFAULT '1' COMMENT '获得类型 1:消费.积分增加  0:兑换,积分减少',
  `order_id` int(11) DEFAULT NULL COMMENT '关联订单表 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_point
-- ----------------------------
INSERT INTO `think_point` VALUES ('1', '500', '1', '1', null);
INSERT INTO `think_point` VALUES ('2', '50', '1', '1', null);
INSERT INTO `think_point` VALUES ('3', '-500', '1', '0', null);

-- ----------------------------
-- Table structure for think_product
-- ----------------------------
DROP TABLE IF EXISTS `think_product`;
CREATE TABLE `think_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `productcate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` text COMMENT '产品图片',
  `remark` varchar(256) DEFAULT '' COMMENT '商品介绍',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '上下架 0:下架 1：上架',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `standard_id` int(11) DEFAULT '1' COMMENT '规格',
  `code_id` int(11) DEFAULT '1' COMMENT '优惠券',
  `store` int(11) DEFAULT '0' COMMENT '库存',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '软删除',
  `integral` bigint(20) DEFAULT '0' COMMENT '积分',
  `sale` int(11) DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_product
-- ----------------------------
INSERT INTO `think_product` VALUES ('46', 'PHP人民币金额数字转中文大写的函数代码', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '在网上看到一个非常有趣的PHP人民币金额数字转中文大写的函数，其实质就是数字转换成中文大写，测试了一下，非常有趣，随便输个数字，就可以将其大写打印出来，新手朋友们试一下吧', '人民币转大写', '<p>11222</p>', '1', '1515331644', '1515274420', '1', '5', '2', '7', '1', '0', '2');
INSERT INTO `think_product` VALUES ('47', 'Windows下mysql忘记密码的解决方法', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', 'Windows下mysql忘记密码的解决方法', 'mysql', '<p>方法一：</p><p>1、在DOS窗口下输入</p><pre>net&nbsp;stop&nbsp;mysql5</pre><p>&nbsp;</p><p>或</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、开一个DOS窗口，这个需要切换到mysql的bin目录。<br/>一般在bin目录里面创建一个批处理1.bat,内容是cmd.exe运行一下即可就切换到当前目录，然后输入</p><pre>mysqld-nt&nbsp;--skip-grant-tables;</pre><p>&nbsp;</p><p>3、再开一个DOS窗口</p><pre>mysql&nbsp;-u&nbsp;root</pre><p>&nbsp;</p><p>4、输入：</p><pre>use&nbsp;mysql&nbsp;\nupdate&nbsp;user&nbsp;set&nbsp;password=password(&quot;new_pass&quot;)&nbsp;where&nbsp;user=&quot;root&quot;;&nbsp;\nflush&nbsp;privileges;&nbsp;\nexit</pre><p>&nbsp;</p><p>5、使用任务管理器，找到mysqld-nt的进程，结束进程&nbsp;<br/>或下面的步骤<br/>1，停止MYSQL服务，CMD打开DOS窗口，输入 net stop mysql&nbsp;<br/>2，在CMD命令行窗口，进入MYSQL安装目录 比如E:Program FilesMySQLMySQL Server 5.0bin&nbsp;<br/>示范命令:&nbsp;<br/>输入 e:回车,&nbsp;<br/>输入cd &quot;E:Program FilesMySQLMySQL Server 5.0bin&quot;&nbsp;<br/>注意双引号也要输入,这样就可以进入Mysql安装目录了.&nbsp;<br/>3，进入mysql安全模式，即当mysql起来后，不用输入密码就能进入数据库。&nbsp;<br/>命令为：</p><pre>mysqld-nt&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>4，重新打开一个CMD命令行窗口，输入</p><p>mysql -uroot -p，使用空密码的方式登录MySQL（不用输入密码，直接按回车）</p><p>5，输入以下命令开始修改root用户的密码（注意：命令中mysql.user中间有个“点”）</p><p>mysql.user：数据库名.表名<br/>mysql&gt; update mysql.user set password=PASSWORD(&#39;新密码&#39;) where User=&#39;root&#39;;&nbsp;<br/>6，刷新权限表&nbsp;<br/>mysql&gt; flush privileges;&nbsp;<br/>7，退出&nbsp;<br/>mysql&gt; quit</p><p><br/>这样MYSQL超级管理员账号 ROOT已经重新设置好了，接下来 在任务管理器里结束掉 mysql-nt.exe 这个进程，重新启动MYSQL即可！</p><p>（也可以直接重新启动服务器）&nbsp;<br/>MYSQL重新启动后，就可以用新设置的ROOT密码登陆MYSQL了！</p><p>方法二：</p><p>首先在 MySQL的安装目录下 新建一个pwdhf.txt, 输入文本：</p><pre>SET&nbsp;PASSWORD&nbsp;FOR&nbsp;&#39;root&#39;@&#39;localhost&#39;&nbsp;=&nbsp;PASSWORD(&#39;*****&#39;);</pre><p>&nbsp;</p><p>红色部份为 需要设置的新密码&nbsp;<br/>用windows服务管理工具或任务管理器来停止MySQL服务 (任务管理器K掉 mysqld-nt 进程)&nbsp;<br/>Dos命令提示符到 MySQL安装目录下的bin目录 如我的是</p><p>D:Program FilesMySQLMySQL Server 5.1bin&nbsp;<br/>然后运行：</p><pre>mysqld-nt&nbsp;--init-file=../pwdhf.txt</pre><p>&nbsp;</p><p>执行完毕， 停止MySQL数据库服务 (任务管理器K掉 mysqld-nt 进程)，然后再重新以正常模式启动MYSQL 即可</p><hr style=\"color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p>mysql5.1或以上</p><p>1、 首先检查mysql服务是否启动，若已启动则先将其停止服务，可在开始菜单的运行，使用命令：</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、打开第一个cmd窗口，切换到mysql的bin目录，运行命令：</p><pre>mysqld&nbsp;--defaults-file=&quot;C:Program&nbsp;FilesMySQLMySQL&nbsp;Server&nbsp;5.1my.ini&quot;&nbsp;--console&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>注释：</p><p>该命令通过跳过权限安全检查，开启mysql服务，这样连接mysql时，可以不用输入用户密码。&nbsp;<br/>&nbsp;</p><p>&nbsp;</p><p>3、打开第二个cmd窗口，连接mysql：</p><p>输入命令：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>出现：</p><p>Enter password:</p><p>在这里直接回车，不用输入密码。</p><p>然后就就会出现登录成功的信息，</p><p>&nbsp;</p><p>&nbsp;</p><p>4、使用命令：</p><pre>show&nbsp;databases;</pre><p>&nbsp;</p><p>&nbsp;</p><p>5、使用命令切换到mysql数据库：</p><pre>use&nbsp;mysql;</pre><p>&nbsp;</p><p>6、使用命令更改root密码为123456：</p><pre>UPDATE&nbsp;user&nbsp;SET&nbsp;Password=PASSWORD(&#39;123456&#39;)&nbsp;where&nbsp;USER=&#39;root&#39;;</pre><p>&nbsp;</p><p>&nbsp;</p><p>7、刷新权限：</p><pre>FLUSH&nbsp;PRIVILEGES;</pre><p>&nbsp;</p><p>8、然后退出，重新登录：</p><p>quit</p><p>重新登录：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>&nbsp;</p><p>9、出现输入密码提示，输入新的密码即可登录：</p><p>Enter password: ***********</p><p>显示登录信息： 成功&nbsp; 就一切ok了</p><p>&nbsp;</p><p>10、重新启动mysql服务</p><pre>net&nbsp;start&nbsp;mysql</pre><p><br/></p>', '1', '1515331644', '1515280188', '1', '1', '3', '1', '1', '0', '4');
INSERT INTO `think_product` VALUES ('48', '禁止网页复制的代码', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '禁止网页复制的代码', '网页复制', '<p>今天做一网站项目时，客户要求让用户不能复制网站内容，网上搜索了一下，总结成以下二几行代码。其实吧，要是懂的人，这些都是浮云来的，客户就是要让一般人不能复制他的内容资料。</p><pre class=\"brush:html;toolbar:false\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 9.5px; list-style: none; border: 1px solid rgb(204, 204, 204); overflow: auto; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 13px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; border-radius: 4px; background-color: rgb(245, 245, 245);\">&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;&lt;\ntitle\n&gt;禁止网页复制的代码&nbsp;&nbsp;网页禁止右键、禁止查看源代码、禁止复制的代码，试试你的右键、ctrl+c和ctrl+c吧~\n&nbsp;&nbsp;\n&nbsp;&nbsp;&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;</pre><p><br/></p>', '1', '1515331644', '1515280185', '1', '1', '4', '2', '1', '0', '0');
INSERT INTO `think_product` VALUES ('49', '如何使用谷歌字体', '1', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180111/b948de8774b8946c053de1c25e25aed6.jpg|', '如何使用谷歌字体', '谷歌字体', '<p style=\"text-align:center\"><img src=\"http://cake.com/ueditor/php/upload/image/20180110/1515575916.jpg\" title=\"1515575916.jpg\" alt=\"1.jpg\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">国内网站使用谷歌字体是不方便的，解决办法如下<br style=\"padding: 0px; margin: 0px;\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">1、将谷歌的地址换成360的</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><a href=\"http://fonts.googleapis.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.googleapis.com</a>&nbsp;换成&nbsp;<a href=\"http://fonts.useso.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.useso.com</a></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">2、只做了第一步还是有问题的，会报错：</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">No &#39;Access-Control-Allow-Origin&#39; header is present on the requested resource</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">解决办法是给html页面添加头信息</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><span style=\"padding: 0px; margin: 0px; color: rgb(70, 70, 70); font-family: Arial，; font-size: 14px; line-height: 21px;\"><meta http-equiv=\"Access-Control-Allow-Origin\" content=\"*\"/></span></p><p><br/></p>', '1', '1515331644', '1515277332', '1', '1', '5', '3', '0', '400', '8');
INSERT INTO `think_product` VALUES ('50', 'winForm窗体关闭按钮实现托盘后台运行（类似QQ托盘区运行）', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。 对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。', 'winForm', '<p>今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。</p><p>&nbsp;</p><p>对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。</p><p>&nbsp;</p><p>其实，这个在网上也有很多的实现方法，但是我试了试有些直接复制过来并不能直接运行，或者能运行的吧又没有注释。今天在这里就给大家贴一下我的代码，也有不足之处，希望大家给出意见.</p><p style=\"text-align:center\"><img src=\"/Uploads/ueditor/2015-12-28/1451309750351569.png\" title=\"1451309750351569.png\" alt=\"1450926662631174.png\"/></p><pre class=\"brush:c#;toolbar:false\">using&nbsp;System;\nusing&nbsp;System.Collections.Generic;\nusing&nbsp;System.ComponentModel;\nusing&nbsp;System.Data;\nusing&nbsp;System.Drawing;\nusing&nbsp;System.Linq;\nusing&nbsp;System.Text;\nusing&nbsp;System.Windows.Forms;\nusing&nbsp;System.Windows;\nnamespace&nbsp;winform窗体托盘后台运行\n{\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;partial&nbsp;class&nbsp;Form1&nbsp;:&nbsp;Form&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里在窗体上没有拖拽一个NotifyIcon控件，而是在这里定义了一个变量\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;NotifyIcon&nbsp;notifyIcon&nbsp;=&nbsp;null;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Form1()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitializeComponent();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//调用初始化托盘显示函数\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitialTray();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_Load(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里写其他代码\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;窗体关闭的单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_FormClosing(object&nbsp;sender,&nbsp;FormClosingEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Cancel&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//通过这里可以看出，这里的关闭其实不是真正意义上的“关闭”，而是将窗体隐藏，实现一个“伪关闭”\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;InitialTray()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//隐藏主窗体\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//实例化一个NotifyIcon对象\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon&nbsp;=&nbsp;new&nbsp;NotifyIcon();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标气泡显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.BalloonTipText&nbsp;=&nbsp;&quot;正在后台运行&quot;;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Text&nbsp;=&nbsp;&quot;窗体托盘后台运行测试程序&quot;;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注意：下面的路径可以是绝对路径、相对路径。但是需要注意的是：文件必须是一个.ico格式\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Icon&nbsp;=&nbsp;new&nbsp;System.Drawing.Icon(&quot;E:/ASP项目/images/3.5&nbsp;inch&nbsp;Floppy.ico&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//true表示在托盘区可见，false表示在托盘区不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//气泡显示的时间（单位是毫秒）\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ShowBalloonTip(2000);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.MouseClick&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.MouseEventHandler(notifyIcon_MouseClick);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////设置二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting1&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单1&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting2&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单2&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;一级菜单&quot;,&nbsp;new&nbsp;MenuItem[]{setting1,setting2});\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//帮助选项，这里只是“有名无实”在菜单上只是显示，单击没有效果，可以参照下面的“退出菜单”实现单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;help&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;帮助&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//关于选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;about&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;关于&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出菜单项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;exit&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;退出&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exit.Click&nbsp;+=&nbsp;new&nbsp;EventHandler(exit_Click);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////关联托盘控件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注释的这一行与下一行的区别就是参数不同，setting这个参数是为了实现二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{&nbsp;setting,&nbsp;help,&nbsp;about,&nbsp;exit&nbsp;};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{help,about,exit};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ContextMenu&nbsp;=&nbsp;new&nbsp;ContextMenu(childen);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//窗体关闭时触发\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.FormClosing&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;鼠标单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;notifyIcon_MouseClick(object&nbsp;sender,&nbsp;System.Windows.Forms.MouseEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//鼠标左键单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(e.Button&nbsp;==&nbsp;MouseButtons.Left)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果窗体是可见的，那么鼠标左击托盘区图标后，窗体为不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(this.Visible&nbsp;==&nbsp;true&nbsp;)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Activate();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;退出选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;exit_Click(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出程序\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.Environment.Exit(0);&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre><p><br/></p>', '1', '1515331644', '1492346022', '1', '1', '6', '4', '1', '0', '0');
INSERT INTO `think_product` VALUES ('67', '太难', '1', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '', 'PHP', '<p>W 发士大夫但是</p>', '1', '1515331644', '1502341187', '1', '3', '1', '5', '1', '0', '7');
INSERT INTO `think_product` VALUES ('68', '54254254', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '5254', '242424', '<p><br/></p><p>2145254254254</p>', '1', '1515331644', '1503569472', '1', '5', '3', '6', '1', '0', '10');
INSERT INTO `think_product` VALUES ('69', '呵呵呵呵', '2', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '男的女的', '呵呵呵', '<p>1111</p>', '1', '1515321241', '1515321241', '1', '5', '20', '250', '0', '600', '0');
INSERT INTO `think_product` VALUES ('70', '111111', '1', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '', '', '', '1', '1515331644', '1515321472', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `think_product` VALUES ('71', '111111111', '1', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '', '', '', '1', '1515321700', '1515321700', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `think_product` VALUES ('72', '产品测试', '5', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '我哈哈我', '好吃的', '<p>1254</p>', '1', '1515329239', '1515329239', '1', '5', '100', '200', '0', '0', '0');
INSERT INTO `think_product` VALUES ('73', '测试数据', '5', 'http://cake.com/uploads/images/20180107/663795fe3760ec91d0d35785239785c9.jpg|http://cake.com/uploads/images/20180107/3ede65ccdf2550a86803dadbedd888bb.png|', '1111', '1111', '<p>·111</p>', '1', '1515331644', '1515332253', '1', '5', '1111', '1000', '0', '300', '0');
INSERT INTO `think_product` VALUES ('74', '14151', '5', 'http://cake.com/uploads/images/20180107/316566e879af37c19a4598f81f2842b7.png|', '111', '14', '<p>111</p>', '1', '1515334092', '1515334092', '1', '2', '23', '10', '0', '100', '0');
INSERT INTO `think_product` VALUES ('75', '14151', '5', 'http://cake.com/uploads/images/20180107/cc8f779ba989303201cdba675a6a80ce.png|', '111', '14', '<p>111</p>', '1', '1515334236', '1515334236', '1', '2', '23', '10', '0', '0', '0');
INSERT INTO `think_product` VALUES ('76', '14151', '5', 'http://cake.com/uploads/images/20180107/cc8f779ba989303201cdba675a6a80ce.png|', '111', '14', '<p>111</p>', '1', '1515334296', '1515334296', '1', '1', '23', '10', '0', '0', '0');
INSERT INTO `think_product` VALUES ('77', '14151', '5', 'http://cake.com/uploads/images/20180107/cc8f779ba989303201cdba675a6a80ce.png|', '111', '14', '<p>111</p>', '1', '1515334387', '1515334387', '1', '1', '23', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('78', '11', '5', 'http://cake.com/uploads/images/20180107/5e5146657148df94f0207261f2cbf304.png|', '1111', '111', '<p>111</p>', '1', '1515334415', '1515334415', '1', '1', '111', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('79', '111', '5', 'http://cake.com/uploads/images/20180107/4551492f3bc626390e529ff997897403.png|', '555', '444', '<p>111</p>', '1', '1515334550', '1515334550', '1', '5', '23', '220', '0', '800', '0');
INSERT INTO `think_product` VALUES ('80', '1333', '1', 'http://cake.com/uploads/images/20180107/2897bf2f493334b9bf712a8629c7011a.jpg|', '跟我玩', '626', '<p>我刚刚</p>', '1', '1515335508', '1515335508', '1', '1', '42', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('81', '1333', '1', 'http://cake.com/uploads/images/20180107/d6b9083fa443c96029d7b2d725053a16.png|', '跟我玩', '626', '<p>我刚刚</p>', '1', '1515336160', '1515336160', '1', '1', '42', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('82', '11', '1', 'http://cake.com/uploads/images/20180107/9b7d24ed0e8d738aa67c1afaf3f602f0.png|', '1111', '111', '<p>111</p>', '1', '1515336345', '1515336345', '1', '1', '11', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('83', '1111', '1', 'http://cake.com/uploads/images/20180107/3cc823e57b27154223370be5fe67ba83.png|', '1111', '111', '<p>11</p>', '1', '1515336527', '1515336527', '1', '3', '151', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('84', '11111呵呵', '1', 'http://cake.com/uploads/images/20180107/8dced5b4fc9d36d756368cc722948f1b.png|', '1411', '111', '<p>141</p>', '0', '1515336788', '1515379556', '1', '5', '14', '987', '0', '150', '0');
INSERT INTO `think_product` VALUES ('85', '测试商品', '1', 'http://cake.com/uploads/images/20180108/f34151c134a28ce8be4a9b47f99a5ac1.png|', '好好好好', '好吃好玩', '<p>12312312</p>', '0', '1515379975', '1515379975', '1', '5', '1000', '1200', '0', '700', '0');
INSERT INTO `think_product` VALUES ('86', '蛋糕', '21', 'http://cake.com/uploads/images/20180110/16716173d910a10b13b849d549206c9b.png|http://cake.com/uploads/images/20180110/7391f96420cac26db3ee83287d8b73d6.png|', '刚问过我跟我无关', '给我问过我刚刚', '<p>赫尔呵呵</p>', '1', '1515549657', '1515549657', '1', '2', '100', '900', '0', '120', '0');
INSERT INTO `think_product` VALUES ('87', '测试测试', '1', 'http://cake.com/uploads/images/20180111/4d3ace2e2606c3ddce2075c7745cc6d4.jpg|', '给我给我给我', '哥哥热', '<p>刚问过</p>', '1', '1515659244', '1515659244', '1', '1', '200', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('88', '测试测试', '1', 'http://cake.com/uploads/images/20180111/4d3ace2e2606c3ddce2075c7745cc6d4.jpg|', '给我给我给我', '哥哥热', '<p>刚问过</p>', '1', '1515659250', '1515659250', '1', '1', '200', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('89', '测试测试', '1', 'http://cake.com/uploads/images/20180111/4d3ace2e2606c3ddce2075c7745cc6d4.jpg|', '给我给我给我', '哥哥热', '<p>刚问过</p>', '1', '1515659624', '1515659624', '1', '1', '200', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('90', '测试测试', '1', 'http://cake.com/uploads/images/20180111/4d3ace2e2606c3ddce2075c7745cc6d4.jpg|', '给我给我给我', '哥哥热', '<p>刚问过</p>', '1', '1515659667', '1515659667', '1', '1', '200', '10', '1', '0', '0');
INSERT INTO `think_product` VALUES ('91', '测试添加优惠券', '1', 'http://cake.com/uploads/images/20180111/659b5703ef22ea02e22752ab91bf1821.jpg|', '给我给我', '给我给我', '<p>刚问过</p>', '1', '1515659977', '1515659977', '1', '1', '200', '10', '0', '800', '0');
INSERT INTO `think_product` VALUES ('92', '积分商城', '1', 'http://cake.com/uploads/images/20180112/a01dbc794415969f77681670a4c0a7b4.png|', '个我给给我个', '给我个', '<p>恩恩</p>', '1', '1515695071', '1515695071', '1', '1', '100', '10', '0', '500', '0');
INSERT INTO `think_product` VALUES ('93', '积分商城600积分', '1', 'http://cake.com/uploads/images/20180112/282428f5cb29299198fac9c21fc6adf6.png|', '给我', '怪我怪我', '<p>给我个</p>', '1', '1515695167', '1515695167', '1', '1', '200', '10', '0', '600', '0');

-- ----------------------------
-- Table structure for think_product_cate
-- ----------------------------
DROP TABLE IF EXISTS `think_product_cate`;
CREATE TABLE `think_product_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_product_cate
-- ----------------------------
INSERT INTO `think_product_cate` VALUES ('1', '大鼻孔', '1', '1477140627', '1502266891', '1');
INSERT INTO `think_product_cate` VALUES ('2', '生活随笔', '2', '1477140627', '1477140627', '0');
INSERT INTO `think_product_cate` VALUES ('4', '.NET', '4', '1477140627', '1477140627', '1');
INSERT INTO `think_product_cate` VALUES ('5', 'PHP', '5', '1477140627', '1477140627', '0');
INSERT INTO `think_product_cate` VALUES ('21', '西式蛋糕1', '50', '1515317834', '1515318053', null);

-- ----------------------------
-- Table structure for think_product_code
-- ----------------------------
DROP TABLE IF EXISTS `think_product_code`;
CREATE TABLE `think_product_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_product_code
-- ----------------------------
INSERT INTO `think_product_code` VALUES ('10', '91', '1');
INSERT INTO `think_product_code` VALUES ('11', '91', '2');
INSERT INTO `think_product_code` VALUES ('12', '91', '3');
INSERT INTO `think_product_code` VALUES ('13', '91', '4');
INSERT INTO `think_product_code` VALUES ('14', '91', '5');
INSERT INTO `think_product_code` VALUES ('15', '91', '21');
INSERT INTO `think_product_code` VALUES ('22', '49', '1');
INSERT INTO `think_product_code` VALUES ('23', '49', '2');
INSERT INTO `think_product_code` VALUES ('24', '49', '3');
INSERT INTO `think_product_code` VALUES ('25', '49', '5');
INSERT INTO `think_product_code` VALUES ('27', '76', '1');
INSERT INTO `think_product_code` VALUES ('39', '92', '1');
INSERT INTO `think_product_code` VALUES ('40', '92', '2');
INSERT INTO `think_product_code` VALUES ('42', '93', '1');
INSERT INTO `think_product_code` VALUES ('43', '93', '2');
INSERT INTO `think_product_code` VALUES ('44', '93', '3');
INSERT INTO `think_product_code` VALUES ('55', '85', '1');
INSERT INTO `think_product_code` VALUES ('56', '85', '2');
INSERT INTO `think_product_code` VALUES ('57', '85', '3');
INSERT INTO `think_product_code` VALUES ('58', '85', '4');
INSERT INTO `think_product_code` VALUES ('59', '85', '5');

-- ----------------------------
-- Table structure for think_standard
-- ----------------------------
DROP TABLE IF EXISTS `think_standard`;
CREATE TABLE `think_standard` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `price` decimal(10,2) unsigned DEFAULT NULL COMMENT '价格',
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员专享价',
  `pid` int(11) DEFAULT NULL COMMENT '所属商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_standard
-- ----------------------------
INSERT INTO `think_standard` VALUES ('1', '6寸2尺98给我', '30', '1477140627', '1515332204', '501.23', '498.00', '46');
INSERT INTO `think_standard` VALUES ('2', '7寸2尺', '2', '1477140627', '1477140627', '200.00', '100.00', '46');
INSERT INTO `think_standard` VALUES ('3', '8寸2尺', '3', '1477140604', '1477140627', '300.00', '200.00', '46');
INSERT INTO `think_standard` VALUES ('4', '9寸2尺', '4', '1477140627', '1477140627', '200.00', '150.00', '46');
INSERT INTO `think_standard` VALUES ('5', '12寸2尺', '5', '1477140627', '1477140627', '12.00', '10.00', '46');
INSERT INTO `think_standard` VALUES ('6', '1寸22', '6', '1477140627', '1477140627', '25.00', '20.00', '46');
INSERT INTO `think_standard` VALUES ('22', '好好吃', '100', '1515334570', '1515334570', '56.00', '48.00', '79');
INSERT INTO `think_standard` VALUES ('23', '好好吃oooooo', '100', '1515335469', '1515567516', '80.00', '65.00', '79');
INSERT INTO `think_standard` VALUES ('24', '怪我怪我', '100', '1515335518', '1515335518', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('25', '怪我怪我', '100', '1515335827', '1515335827', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('26', '怪我怪我', '100', '1515335867', '1515335867', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('27', '怪我怪我', '100', '1515335981', '1515335981', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('28', '怪我怪我', '100', '1515336021', '1515336021', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('29', '怪我怪我', '100', '1515336099', '1515336099', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('30', '怪我怪我', '100', '1515336138', '1515336138', '15.00', '12.00', '80');
INSERT INTO `think_standard` VALUES ('31', '111', '100', '1515336168', '1515336168', '1111.00', '11.00', '81');
INSERT INTO `think_standard` VALUES ('32', '111', '100', '1515336314', '1515336314', '1111.00', '11.00', '81');
INSERT INTO `think_standard` VALUES ('33', '1515', '100', '1515336363', '1515336363', '151.00', '14.00', '82');
INSERT INTO `think_standard` VALUES ('34', '1515', '100', '1515336383', '1515336383', '151.00', '14.00', '82');
INSERT INTO `think_standard` VALUES ('35', '1111', '100', '1515336403', '1515336403', '111.00', '11.00', '81');
INSERT INTO `think_standard` VALUES ('36', '1515', '100', '1515336475', '1515336475', '151.00', '14.00', '82');
INSERT INTO `think_standard` VALUES ('37', '151', '100', '1515336536', '1515336536', '15151.00', '141.00', '83');
INSERT INTO `think_standard` VALUES ('38', '151', '100', '1515336556', '1515336556', '15151.00', '141.00', '83');
INSERT INTO `think_standard` VALUES ('39', '151', '100', '1515336577', '1515336577', '15151.00', '141.00', '83');
INSERT INTO `think_standard` VALUES ('40', '151', '100', '1515336599', '1515336599', '15151.00', '141.00', '83');
INSERT INTO `think_standard` VALUES ('41', '151', '100', '1515336798', '1515336798', '151.00', '14.00', '84');
INSERT INTO `think_standard` VALUES ('42', '151', '100', '1515336916', '1515336916', '151.00', '14.00', '84');
INSERT INTO `think_standard` VALUES ('43', '151', '100', '1515336928', '1515336928', '151.00', '14.00', '84');
INSERT INTO `think_standard` VALUES ('44', '151', '100', '1515336945', '1515336945', '151.00', '14.00', '84');
INSERT INTO `think_standard` VALUES ('50', '好好玩啊', '100', '1515338803', '1515338803', '1000.00', '12.50', '73');
INSERT INTO `think_standard` VALUES ('53', '呵呵', '100', '1515340329', '1515340329', '268.00', '250.00', '74');
INSERT INTO `think_standard` VALUES ('54', '好吃点', '100', '1515340661', '1515340661', '256.00', '224.00', '75');
INSERT INTO `think_standard` VALUES ('55', '2寸5人', '100', '1515380033', '1515380033', '100.00', '80.00', '85');
INSERT INTO `think_standard` VALUES ('57', '2寸', '100', '1515549669', '1515549669', '100.00', '90.00', '86');
INSERT INTO `think_standard` VALUES ('58', '3寸', '100', '1515549683', '1515549683', '150.00', '120.00', '86');
INSERT INTO `think_standard` VALUES ('59', '5寸好吃', '100', '1515563005', '1515563005', '200.00', '198.00', '69');
INSERT INTO `think_standard` VALUES ('60', '6寸', '100', '1515563027', '1515563027', '300.00', '250.00', '72');
INSERT INTO `think_standard` VALUES ('61', '2寸好吃', '100', '1515563044', '1515563044', '120.00', '100.00', '72');
INSERT INTO `think_standard` VALUES ('62', '2寸2人', '100', '1515563536', '1515563536', '150.00', '120.00', '76');
INSERT INTO `think_standard` VALUES ('63', '3寸4人', '100', '1515563546', '1515563546', '200.00', '180.00', '76');
INSERT INTO `think_standard` VALUES ('64', '2寸3人', '100', '1515563632', '1515563632', '300.00', '280.00', '49');
INSERT INTO `think_standard` VALUES ('65', '4寸6人', '100', '1515563643', '1515563643', '600.00', '500.00', '49');
INSERT INTO `think_standard` VALUES ('66', '2寸', '100', '1515659988', '1515659988', '200.00', '120.00', '91');
INSERT INTO `think_standard` VALUES ('67', '3寸', '100', '1515659998', '1515659998', '5000.00', '4100.00', '91');
INSERT INTO `think_standard` VALUES ('68', '6寸', '100', '1515687318', '1515687318', '200.00', '180.00', '49');
INSERT INTO `think_standard` VALUES ('69', '7寸', '100', '1515687327', '1515687327', '300.00', '280.00', '49');
INSERT INTO `think_standard` VALUES ('70', '8寸', '100', '1515687335', '1515687335', '600.00', '500.00', '49');
INSERT INTO `think_standard` VALUES ('71', '好东西', '100', '1515695086', '1515695086', '200.00', '100.00', '92');
INSERT INTO `think_standard` VALUES ('72', '好好吃啊', '100', '1515695177', '1515695177', '500.00', '400.00', '93');
INSERT INTO `think_standard` VALUES ('73', '好玩得到', '100', '1515722501', '1515722501', '600.00', '500.00', '49');
INSERT INTO `think_standard` VALUES ('74', '好吃的111', '100', '1515722511', '1515722511', '700.00', '600.00', '49');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL COMMENT '认证的手机号码',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `password` char(32) DEFAULT NULL,
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) DEFAULT NULL COMMENT '1激活  0 未激活',
  `token` varchar(255) DEFAULT '0' COMMENT '令牌',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', '18180425030', 'abc', 'e10adc3949ba59abbe56e057f20f883e', 'http://123.56.237.22:8888/group1/M00/00/08/ezjtFlj4IHyAcjlzAABDms0T3Kk671.jpg', '1', 'LWBYIiLWinNiulNXYD1UzGgfynNx+gy/zmq5Ega0E0we4a0WyB8UaG4x+VKRoc9CG4e1BXrqZww=');
INSERT INTO `think_user` VALUES ('2', '18993075721', '账号1', 'e10adc3949ba59abbe56e057f20f883e', 'http://opgkfon0o.bkt.clouddn.com/108.png', '1', 'VslU7gKYuddZFPq4ssWLZCNYBsi3YQIicyG1jm5pUfvZHI4qw03b3A2sygA4efLyWHRkYBQX8LAscwsA7sLzhg==');
INSERT INTO `think_user` VALUES ('3', '15095340657', '呼丽华', 'e10adc3949ba59abbe56e057f20f883e', 'http://123.56.237.22:8888/group1/M00/00/00/ezjtFliGwvWAaYeXAABu1D1rZNo655.jpg', '1', '2d8471d156a9e6db155145571cedea5a');

-- ----------------------------
-- Table structure for think_vip
-- ----------------------------
DROP TABLE IF EXISTS `think_vip`;
CREATE TABLE `think_vip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` char(10) NOT NULL DEFAULT '' COMMENT '昵称',
  `phone` char(12) NOT NULL DEFAULT '' COMMENT '手机号码',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `point_id` int(11) NOT NULL DEFAULT '0' COMMENT '积分  对应积分表',
  `gender` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别 1 男 0 女',
  `conpon_id` int(255) NOT NULL DEFAULT '0' COMMENT '优惠券 对应优惠券表',
  `address_id` int(11) NOT NULL COMMENT '地址 对应地址表',
  `order_num_id` int(11) NOT NULL COMMENT '订单号 对应订单号表',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1：开启 0：关闭',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `avatarUrl` varchar(255) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_vip
-- ----------------------------
INSERT INTO `think_vip` VALUES ('1', 'wang', '18349275521', '1990-10-30', '0', '1', '0', '0', '0', null, '1', '50', '');
INSERT INTO `think_vip` VALUES ('3', 'chen', '13880450203', '2018-01-01', '0', '1', '0', '0', '0', null, '1', '0', '');
INSERT INTO `think_vip` VALUES ('14', '无语问苍天', '18349275520', '0000-00-00', '0', '1', '0', '0', '0', '1516185154', '1', '0', 'http://wx.qlogo.cn/mmhead/BfRL3E0G1pfLRH5kt35C8wh43JFibqTvEZREy8zQydE9RicoURTicKTjw/132');
INSERT INTO `think_vip` VALUES ('15', '', '', '0000-00-00', '0', '1', '0', '0', '0', '1516214190', '1', '0', '');
INSERT INTO `think_vip` VALUES ('16', '', '', '0000-00-00', '0', '1', '0', '0', '0', '1516214443', '1', '0', '');
INSERT INTO `think_vip` VALUES ('17', '', '', '0000-00-00', '0', '1', '0', '0', '0', '1516214597', '1', '0', '');
INSERT INTO `think_vip` VALUES ('18', '', '', '0000-00-00', '0', '1', '0', '0', '0', '1516219807', '1', '0', '');
INSERT INTO `think_vip` VALUES ('19', '', '', '0000-00-00', '0', '1', '0', '0', '0', '1516219821', '1', '0', '');

-- ----------------------------
-- Table structure for think_vip_code
-- ----------------------------
DROP TABLE IF EXISTS `think_vip_code`;
CREATE TABLE `think_vip_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vip_id` int(11) DEFAULT NULL COMMENT '会员',
  `code_id` int(11) DEFAULT NULL COMMENT '优惠券',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_vip_code
-- ----------------------------

-- ----------------------------
-- Event structure for ceshi
-- ----------------------------
DROP EVENT IF EXISTS `ceshi`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ceshi` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-07-19 09:51:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE think_user set status='2' where id='1'
;;
DELIMITER ;

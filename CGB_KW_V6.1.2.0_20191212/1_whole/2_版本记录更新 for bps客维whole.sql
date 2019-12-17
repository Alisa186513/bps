-- 表的结构 `versionno`
-- 

CREATE TABLE IF NOT EXISTS `versionno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `script` varchar(255) DEFAULT NULL COMMENT '补丁版本号',
  `version` varchar(255) DEFAULT NULL COMMENT '基于执行版本',
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `versionno`
-- 

INSERT INTO `versionno` (`script`, `version`, `timestamp`) VALUES ('CGB_KW_V6.1.2.0_20191212', 'CGB_KW_V6.1.2.0_20191212',current_timestamp());


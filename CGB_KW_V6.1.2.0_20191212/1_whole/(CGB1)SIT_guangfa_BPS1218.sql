-- 2013-12-18 修订

-- 1、修改事件post连接
UPDATE `bus_mapping` SET `eb_url` = 'http://{{host}}/event/?' ;

-- 2、修改客维业务数据库连接

UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id` = 1 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfa_bps' WHERE `db_id` =2 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|internet_ipcc' WHERE `db_id` = 3 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id` = 6 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id` =8 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|biz_data_kw2' WHERE `db_id` =9 ;

-- 连接老电营的数据库201511202加的，注意查看是否正确再执行
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.205|root|hefeiXN123|guangfatmnew_biz' WHERE `db_id`=15; -- 电营业务数据库(从库-读)
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.205|root|hefeiXN123|guangfatmnew_biz' WHERE `db_id`=16; -- 电营业务数据库(主库-写)

-- 2013-12-18
-- 仅用于数据迁移(id=10是迁出库,id=11是迁入库)
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id` = 10 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id` = 11 ;

-- 二期-日志库（电营-jyy20160513）
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.206|root|hefeiXN123|guangfatm_data_center' WHERE `db_id`=17;

-- 20160628读写分离68从库 方乐乐提供
 
UPDATE `service_dbconn`  SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE  `service_dbconn`.`db_id` = 21;
UPDATE `service_dbconn`  SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE  `service_dbconn`.`db_id` = 29;
UPDATE `service_dbconn`  SET `dbconn_value` = '192.168.0.170|root|hefeiXN123|guangfatmbiz_zh' WHERE  `service_dbconn`.`db_id` = 30;
UPDATE `service_dbconn`  SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|internet_ipcc' WHERE  `service_dbconn`.`db_id` = 31;
UPDATE `service_dbconn`  SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|internet_ipcc' WHERE  `service_dbconn`.`db_id` = 32;
UPDATE `serviceinterface` SET   `dbconn` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps'  WHERE   `db_id` = 21;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.208|root|hefeiXN123|guangfabiz_bps' WHERE `db_id`=23;

-- 3、修改流程调度服务器地址、端口
update  `template_property`  set `property_value` = '80' WHERE `property_name` = '默认子流程服务器端口' ;
update  `template_property`  set `property_value` = '192.168.1.217' WHERE `property_name` = '默认子流程服务器地址' ;

-- 4、修改传文件服务器地址、端口
update `ui_property` set `ui_propertyvalue` = '192.168.1.217' WHERE `ui_propertyname` = 'domain';
update `ui_property` set `ui_propertyvalue`='80' where `ui_propertyname`='port';

-- 5、修改应用级memcache服务器连接
update `template_property` set `property_value`='192.168.1.208:11255' where `property_name`='服务器URL' ;

-- 7、更新redis连接
UPDATE `redis_conn` set `host` = '192.168.1.208',`port`= '6380',`password`='redis@infobird.net123456' where id in ('1','22','23','24','25','26','27','28','29');
-- 23、 进件redis_conn修改，来自方乐乐修改 20160607
UPDATE `redis_conn` SET  `name` = '报批客户队列', `host` = '192.168.1.208', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 1, `timeout` = '1' WHERE  `redis_conn`.`id` = 30; -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-过程流转服务', `host` = '192.168.1.206', `port` = 6382, `password` = '', `db` = 7, `timeout` = '36000' WHERE  `redis_conn`.`id` = 31; -- `host`、`port`、`password`（除db=7）复用老电营redis_conn表中id=40进件环境参数,为实现与电营共用一套进件环境
UPDATE `redis_conn` SET  `name` = '二期-表单审核后内部处理流转', `host` = '192.168.1.205', `port` = 6380, `password` = 'redis@infobird.net123456', `db` = 12, `timeout` = '1' WHERE  `redis_conn`.`id` = 32; -- `host`、`port`、`password`、`db` 复用老电营redis_conn表中id=41进件环境参数,为实现与电营共用一套流水号
UPDATE `redis_conn` SET  `name` = '二期-内部日志队列', `host` = '192.168.1.208', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 3, `timeout` = '1' WHERE  `redis_conn`.`id` = 33; -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-实时进件批次队列', `host` = '192.168.1.208', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 3, `timeout` = '1' WHERE  `redis_conn`.`id` = 34;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '旧批次号队列', `host` = '192.168.1.208', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 4, `timeout` = '1' WHERE  `redis_conn`.`id` = 35;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-实时进件校验队列', `host` = '192.168.1.208', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 5, `timeout` = '1' WHERE  `redis_conn`.`id` = 36;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-内部日志队列(电营)', `host` = '192.168.1.205', `port` = 6380, `password` = 'redis@infobird.net123456', `db` = 12, `timeout` = '1' WHERE  `redis_conn`.`id` = 37; -- `host`、`port`、`password`、`db` 复用老电营redis_conn表中id=42进件环境参数,为实现与电营共用一套批次号

-- 6、修改录音集成服务器IP
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.com' WHERE `urlstr` = 'http://10.122.74.189:86' ;
-- 8、修改龙行业务报表集成服务器IP
-- update@2013-11-05
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://10.122.74.195:89","http://10.122.74.186:89") where  `eal_inputparam` LIKE "%http://10.122.74.195:89/seachDevice%";
-- 9、修改龙行业务报表集成服务器IP(new)
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://58.68.237.232:81/seachDevice/","http://10.122.74.186:89/seachDevice/") where  `eal_inputparam` LIKE "%http://58.68.237.232:81/seachDevice/usetense%";
-- 10、更新留言信箱
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://yewu1.guangfa.com/voice","http://yewu1.guangfa.com/voice") where  `eal_inputparam` LIKE "%http://yewu1.guangfa.com/voice%";

-- 11、催激活数据清洗
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"218.91.46.205:86","192.168.10.193:87") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%218.91.46.205:86%' ;
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"keweiqx.guangfa.com","192.168.10.193:87") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%keweiqx.guangfa.com%';

-- 12、EPPC业务工单数据筛选
UPDATE `serviceinterface` SET `templatename` = 'http://192.168.0.189:87/statistic/index/@method' WHERE `si_id` =4190 ;

-- 13、未结案数据导出，路径更改,需将web服务器路径和数据库服务器相应的文件路径设置共享
-- 1)将 @mysqldownload1 替换成要更改数据库服务器路径
UPDATE `template_property` SET `property_value` = '''/www/htdocs/code/html/upload/mysqldownload''.''/''.@csv' WHERE `template_property`.`property_id` =94479 LIMIT 1 ;

-- 2)将 @mysqldownload2 替换成要更改web服务器路径
UPDATE `template_property` SET `property_value` = '''/www/htdocs/code/html/upload/mysqldownload/''.@csv' WHERE `template_property`.`property_id` =128102 LIMIT 1 ;
UPDATE `template_property` SET `property_value` = '"/www/htdocs/code/html/upload/mysqldownload/"' WHERE `template_property`.`property_id` =94545 LIMIT 1 ;

-- 3)将 @path1 替换成要更改更改web服务器路径
UPDATE `template_property` SET `property_value` = '"/www/htdocs/code/html/upload/mysqldownload/".@csv' WHERE `template_property`.`property_id` =130592 LIMIT 1 ;

-- 4)改未结案导出56模版变量值
UPDATE `template_property` SET `property_value` = '@filepath2' WHERE `template_property`.`flow_id` =190 and `template_property`.`template_id`='56' and `template_property`.`property_name`='导入文件名变量' LIMIT 1 ;

-- 14、更改客维二期访问地址及端口
UPDATE `template_property` SET `property_value` = '''http://192.168.0.189:85/login/connect.do?username=''.@username.''&enterprise_name=''.@enterprise_name.''&loginsign=''.@loginsign' WHERE `template_id` =4
AND `flow_id` =2696 AND `property_name` ='表达式' ;


-- 15、屏蔽内部邮件
update `nav_navigate` set `appid`=`appid`+100 WHERE  `navname` LIKE  '内部邮件';


-- 2013-12-18
-- 17、客维1期调用2期的signkey
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"longxinginfobird","infoagentbird") WHERE `template_id` =3 AND `flow_id` =2696 AND `property_name` = '表达式' AND `property_value` LIKE '%longxinginfobird%';
-- 2015-11-30
-- 18、邮件附件路径
UPDATE `template_property` SET `property_value` = '/www/htdocs/code/html/mailfiles/' WHERE `template_id` =1 AND `flow_id` =3050 AND property_name='附件路径';

-- 19.短信发送参数的设置 2015-12-11蒋媛媛加入
UPDATE `serviceinterface` SET `urlstr` = 'http://10.2.164.169:8080/GfSmsWeb/sms.do?' WHERE `serviceinterface`.`si_id` =6139 LIMIT 1 ;


-- 20、客维报文地址 蒋媛媛 20160428 
 UPDATE `serviceinterface` SET `urlstr` = 'http://192.168.1.207:93'  WHERE  `serviceinterface`.`si_id` = 6967 LIMIT 1 ;
 
  -- updata@20160829 夏海玲
 update `template_property` set `property_value`=replace(`property_value`,'/data0/htdocs/baowen','/usr/local/www/baowen') where `property_value`like'%/data0/htdocs/baowen%';
 
 UPDATE `template_property` SET `property_value` = 'http://21.96.165.43:8113/GFJJ/SSJJservlet'  WHERE `template_id` =24  AND `flow_id` =3502 and property_name ='url';

-- 21、客维进件生成txt地址 蒋媛媛 20160513 
 UPDATE `serviceinterface` SET `urlstr` = 'http://192.168.0.163:81/Createtxt'  WHERE  `serviceinterface`.`si_id` = 6861 LIMIT 1 ;
 
-- 22、图像打包 蒋媛媛 20160523
 UPDATE `serviceinterface` SET `urlstr` = 'http://192.168.0.163:88/TransImages.php?' WHERE `serviceinterface`.`si_id` =6934 LIMIT 1 ;
 

-- 24、ods 文件路径配置   夏伟 20161114
-- /var/ftp/ods_cmdata/ 为ods文件存放的位置，各环境可以自己配置。
UPDATE `template_property` SET `property_value` = '@file=''/var/ftp/ods_cmdata/''.date(''Ymd'').''/WBS''' WHERE `template_id` = 33 and `flow_id` = 3946 and `property_name` = '表达式';

-- BPS客维配置脚本20180207
/* 满意度调研报表 */
UPDATE `template_property` SET `property_value` = '192.168.0.198' WHERE `template_id` = 10 and `flow_id` = 4537 and `property_name` = '默认子流程服务器地址';
UPDATE `template_property` SET `property_value` = '89' WHERE `template_id` = 10 and `flow_id` = 4537 and `property_name` = '默认子流程服务器端口';


UPDATE `template_property`  SET property_value=REPLACE(property_value,'http://192.168.1.213:8888/IBReport','http://192.168.1.208:8888/IBReport') WHERE  `property_value` LIKE '%http://192.168.1.213:8888/IBReport%';
UPDATE `template_property`  SET property_value=REPLACE(property_value,'http://192.168.1.232:8888/KeWeiBusinessReport','http://192.168.1.208:8888/KeWeiBusinessReport') WHERE  `property_value` LIKE '%http://192.168.1.232:8888/KeWeiBusinessReport%';


-- 25、修改报文连接地址     刘彦宾20180920
UPDATE `serviceinterface` SET urlstr='http://192.168.1.207:93'  WHERE si_id=12707;




-- 27、BPS实时报表，参数3为BPS报表程序所在服务器及端口    孙伟 20181019
UPDATE template_property SET property_value = replace(property_value,'192.168.1.232:8888','192.168.1.232:8888');

-- 28、bpo报表下载问题     孙伟 20190514
UPDATE `template_property` SET `property_value` = '''http://192.168.1.217:80''' WHERE `template_id` = 10 and `flow_id` = 3155 and `property_name` = '表达式';
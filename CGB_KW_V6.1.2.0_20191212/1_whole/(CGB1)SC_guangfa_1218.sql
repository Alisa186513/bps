-- 2016-03-29 修订

-- 1、修改事件post连接
UPDATE `bus_mapping` SET `eb_url` = 'http://longxing.guangfa.com/event/?' ;

-- 2、修改客维业务数据库连接

UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.39|root|applogic@123|guangfabiz' WHERE `db_id` = 1 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.39|root|applogic@123|guangfa' WHERE `db_id` =2 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.34|root|applogic@123|internet_ipcc' WHERE `db_id` = 3 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.12|root|applogic@123|guangfabiz' WHERE `db_id` = 6 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.252|root|applogic@123|guangfabiz' WHERE `db_id` =8 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.39|root|applogic@123|biz_data_kw2' WHERE `db_id` =9 ;


-- 连接老电营的数据库201511202加的，注意查看是否正确再执行
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.37|root|applogic@123|guangfatm_biz' WHERE `db_id`=16; -- 电营业务数据库(主库-写)
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.38|root|applogic@123|guangfatm_biz' WHERE `db_id`=15; -- 电营业务数据库(从库-读)

-- 2013-12-18
-- 仅用于数据迁移(id=10是迁出库,id=11是迁入库)
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.39|root|applogic@123|guangfabiz' WHERE `db_id` = 10 ;
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.xx|root|applogic@123|guangfabiz' WHERE `db_id` = 11 ;

-- 二期-日志库（电营-jyy20160513）
UPDATE `service_dbconn` SET `dbconn_value` = '192.168.1.37|root|applogic@123|guangfatm_data_center' WHERE `db_id`=17;

-- 3、修改流程调度服务器地址、端口
update  `template_property`  set `property_value` = '80' WHERE `property_name` = '默认子流程服务器端口' ;
update  `template_property`  set `property_value` = 'longxing.guangfa.com' WHERE `property_name` = '默认子流程服务器地址' ;

-- 4、修改传文件服务器地址、端口
update `ui_property` set `ui_propertyvalue` = 'longxing.guangfa.com' WHERE `ui_propertyname` = 'domain';
update `ui_property` set `ui_propertyvalue`="80" where `ui_propertyname`='port';

-- 5、修改应用级memcache服务器连接
update `template_property` set `property_value`='127.0.0.1:11211' where `property_name`='服务器URL' ;

-- 6、修改录音集成服务器IP
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.com' WHERE `urlstr` = 'http://58.68.237.241:86' ;

-- 7、更新redis连接
update  `redis_conn`  set `host` = '192.168.1.43',`port`= '6379' ;

-- 8、修改龙行业务报表集成服务器IP
-- update@2013-11-05
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://10.122.74.195:89","http://yewu8.guangfa.com") where  `eal_inputparam` LIKE "%http://10.122.74.195:89/seachDevice%";

-- 9、修改龙行业务报表集成服务器IP(new)
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://58.68.237.232:81/seachDevice/","http://report.guangfa.com/seachDevice/") where  `eal_inputparam` LIKE "%http://58.68.237.232:81/seachDevice/usetense%";

-- 10、更新留言信箱
update eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://yewu1.guangfa.com/voice","http://yewu1.guangfa.com/voice") where  `eal_inputparam` LIKE "%http://yewu1.guangfa.com/voice%";

-- 11、催激活数据清洗
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"218.91.46.205:86","keweiqx.guangfa.com") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%218.91.46.205:86%' ;
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"keweiqx.guangfa.com","keweiqx.guangfa.com") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%keweiqx.guangfa.com%';

-- 12、EPPC业务工单数据筛选
UPDATE `serviceinterface` SET `templatename` = 'http://keweiqx.guangfa.com/statistic/index/@method' WHERE `si_id` =4190 ;

-- 13、未结案数据导出，路径更改,需将web服务器路径和数据库服务器相应的文件路径设置共享
-- 1)将 @mysqldownload1 替换成要更改数据库服务器路径
UPDATE `guangfa`.`template_property` SET `property_value` = '''/backup/mysqldownload''.''/''.@csv' WHERE `template_property`.`property_id` =94479 LIMIT 1 ;

-- 2)将 @mysqldownload2 替换成要更改web服务器路径
UPDATE `guangfa`.`template_property` SET `property_value` = '''/usr/local/www/code/html/mysqldownload/''.@csv' WHERE `template_property`.`property_id` =128102 LIMIT 1 ;
UPDATE `guangfa`.`template_property` SET `property_value` = '"/usr/local/www/code/html/mysqldownload"' WHERE `template_property`.`property_id` =94545 LIMIT 1 ;

-- 3)将 @path1 替换成要更改更改web服务器路径
UPDATE `guangfa`.`template_property` SET `property_value` = '"/usr/local/www/code/html/mysqldownload/".@csv' WHERE `template_property`.`property_id` =130592 LIMIT 1 ;

-- 4)改未结案导出56模版变量值
UPDATE `guangfa`.`template_property` SET `property_value` = '@filepath2' WHERE `template_property`.`flow_id` =190 and `template_property`.`template_id`='56' and `template_property`.`property_name`='导入文件名变量' LIMIT 1 ;

-- 14、更改客维二期访问地址及端口
UPDATE `template_property` SET `property_value` = '''http://longxing.guangfa.com:8080/login/connect.do?username=''.@username.''&enterprise_name=''.@enterprise_name.''&loginsign=''.@loginsign' WHERE `template_id` =4 AND `flow_id` =2696 AND `property_name` ='表达式' ;

-- 15、屏蔽内部邮件
update `nav_navigate` set `appid`=`appid`+100 WHERE  `navname` LIKE  '内部邮件';

-- 16、客维报表工单删除队列
UPDATE `guangfa`.`redis_conn` SET `host` = '192.168.1.25',`port` = '6388',`password` = '',`db` = '10' WHERE `name` ='工单删除队列' ;



-- 2013-12-18
-- 17、客维1期调用2期的signkey
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"longxinginfobird","longxinginfobird") WHERE `template_id` =3 AND `flow_id` =2696 AND `property_name` = '表达式' AND `property_value` LIKE '%longxinginfobird%';

-- 2015-11-30
-- 18、邮件附件路径
UPDATE `template_property` SET `property_value` = '/usr/local/www/code/html/mailfiles/' WHERE `template_id` =1 AND `flow_id` =3050 AND property_name='附件路径';

-- 19.短信发送参数的设置 2015-12-11蒋媛媛加入
UPDATE `serviceinterface` SET `urlstr` = 'http://10.2.174.47:8080/GfSmsWeb/sms.do?' WHERE `serviceinterface`.`si_id` =6139 LIMIT 1 ;

-- 20客维报文地址 蒋媛媛 20160428 
 UPDATE `serviceinterface` SET `urlstr` = 'http://baowen.guangfa.com'  WHERE  `serviceinterface`.`si_id` = 6967 LIMIT 1 ;
 
-- 21、客维进件生成txt地址 蒋媛媛 20160513 
 UPDATE `serviceinterface` SET `urlstr` = 'http://biao.infobird.com/Createtxt'  WHERE  `serviceinterface`.`si_id` = 6861 LIMIT 1 ;
 
-- 22、图像打包 蒋媛媛 20160523
 UPDATE `serviceinterface` SET `urlstr` = 'http://jinjian.infobird.com/TransImages.php?' WHERE `serviceinterface`.`si_id` =6934 LIMIT 1 ;
 
-- 23、ods 文件路径配置   夏伟 20161114
-- /var/ftp/ods_cmdata/ 为ods文件存放的位置，各环境可以自己配置。
UPDATE `template_property` SET `property_value` = '@file=''/var/ftp/ods_cmdata/''.date(''Ymd'').''/WBS''' WHERE `template_id` = 33 and `flow_id` = 3946 and `property_name` = '表达式';

-- @address 各个环境对应地址  夏伟 20170213

UPDATE `template_property` SET `property_value` = REPLACE (`property_value` , '10.122.74.226:81' , '@address' )
-- 24、修改报文连接地址     刘彦宾20180920
UPDATE `serviceinterface` SET urlstr='修改成报文部署地址'  WHERE si_id=12707;
UPDATE `serviceinterface` SET urlstr='修改成报文部署地址'  WHERE si_id=13236;

-- 27、生成短链接地址	刘彦宾20190619
UPDATE `template_property`  SET property_value=REPLACE(property_value,'10.2.37.21:8082','10.2.111.69:8113') WHERE  `property_value` LIKE '%10.2.37.21:8082%';
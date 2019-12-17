-- 2013-12-18 修订

-- 1、修改事件post连接
UPDATE `bus_mapping` SET `eb_url` = 'http://{{host}}/event/?' ;

-- 2、修改客维业务数据库连接

UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE `db_id` = 1 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfa3' WHERE `db_id` =2 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|internet_ipcc' WHERE `db_id` = 3 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE `db_id` = 6 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE `db_id` =8 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|biz_data_kw4' WHERE `db_id` =9 ;

-- 连接老电营的数据库201511202加的，注意查看是否正确再执行
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|tm_second_biz' WHERE `db_id`=15; -- 电营业务数据库(主库-写)
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|tm_second_biz' WHERE `db_id`=16; -- 电营业务数据库(从库-读)

-- 二期-日志库（电营-jyy20160513）
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|guangfatm_data_center' WHERE `db_id`=17;
-- 2013-12-18
-- 仅用于数据迁移(id=10是迁出库,id=11是迁入库)
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE `db_id` = 10 ;
UPDATE `service_dbconn` SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE `db_id` = 11 ;

-- 20160628读写分离68从库 方乐乐提供
 
UPDATE `service_dbconn`  SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE  `service_dbconn`.`db_id` = 21;

-- 20171023整合新增db
UPDATE `service_dbconn`  SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3' WHERE  `service_dbconn`.`db_id` = 29;
UPDATE `service_dbconn`  SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|tm_second_biz' WHERE  `service_dbconn`.`db_id` = 30;
UPDATE `service_dbconn`  SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|internet_ipcc' WHERE  `service_dbconn`.`db_id` = 31;
UPDATE `service_dbconn`  SET `dbconn_value` = '10.2.164.172|guangfa|guangfapwd|internet_ipcc' WHERE  `service_dbconn`.`db_id` = 32;

UPDATE `serviceinterface` SET   `dbconn` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3'  WHERE   `db_id` = 21;
UPDATE `serviceinterface` SET   `dbconn` = '10.2.164.172|guangfa|guangfapwd|bps_guangfabiz3'  WHERE   `db_id` = 23;




-- 3、修改流程调度服务器地址、端口
UPDATE  `template_property`  set `property_value` = '80' WHERE `property_name` = '默认子流程服务器端口' ;
UPDATE  `template_property`  set `property_value` = 'yewu2.guangfa.uat' WHERE `property_name` = '默认子流程服务器地址' ;

-- 4、修改传文件服务器地址、端口
UPDATE `ui_property` set `ui_propertyvalue` = 'yewu2.guangfa.uat' WHERE `ui_propertyname` = 'domain' ;
UPDATE `ui_property` set `ui_propertyvalue`="80" where `ui_propertyname`='port' ;

-- 5、修改应用级memcache服务器连接
UPDATE `template_property` set `property_value`='10.2.164.170:11289' where `property_name`='服务器URL' ;

-- 6、修改录音集成服务器IP
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.uat' WHERE `urlstr` = 'http://58.68.237.241:86' ;

-- 7、更新redis连接
UPDATE `redis_conn` set `host` = '10.2.164.170',`port`= '6399',`password`='redis@infobird.net123456' where id in ('1','22','23','24','25','26','27','28','29','30');
UPDATE `redis_conn` set `host` = '10.2.164.170',`port`= '6384',`password`='redis@infobird.net123456' where id = '31';
UPDATE `redis_conn` set `host` = '10.2.164.170',`port`= '6383',`password`='redis@infobird.net123456',db = '12' where id in ('32','33','34','35','36','37');

-- 8、修改龙行业务报表集成服务器IP(KF->UAT)
-- update@2013-11-05
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://10.122.74.195:89","http://yewu2.guangfa.uat") where  `eal_inputparam` LIKE "%http://10.122.74.195:89/seachDevice%";

-- 9、修改龙行业务报表集成服务器IP(new)
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://58.68.237.232:81/seachDevice/","http://report.guangfa.uat/seachDevice/") where `eal_inputparam` LIKE "%http://58.68.237.232:81/seachDevice/usetense%";

-- 10、更新留言信箱
UPDATE eve_actionlist  set `eal_inputparam` = replace(`eal_inputparam`,"http://yewu1.guangfa.com/voice","http://yewu1.guangfa.uat/voice") where  `eal_inputparam` LIKE "%http://yewu1.guangfa.com/voice%";

-- 11、催激活数据清洗
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"218.91.46.205:86","keweiqx.guangfa.uat") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%218.91.46.205:86%' ;
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"keweiqx.guangfa.com","keweiqx.guangfa.uat") WHERE `template_id` =50 AND  `flow_id` = 1830 AND `property_name` = '表达式' AND `property_value` LIKE '%keweiqx.guangfa.com%' ;

-- 12、EPPC业务工单数据筛选
UPDATE `serviceinterface` SET `templatename` = 'http://keweiqx.guangfa.uat/statistic/index/@method' WHERE `si_id` =4190 ;

-- 13、未结案数据导出，路径更改,需将web服务器路径和数据库服务器相应的文件路径设置共享
-- 1)将 @mysqldownload1 替换成要更改数据库服务器路径
UPDATE `template_property` SET `property_value` = '''/backup/mysqldownload''.''/''.@csv' WHERE `template_property`.`property_id` =94479 LIMIT 1 ;

-- 2)将 @mysqldownload2 替换成要更改web服务器路径
UPDATE `template_property` SET `property_value` = '''/usr/local/www/bps3/code/html/mysqldownload/''.@csv' WHERE `template_property`.`property_id` =128102 LIMIT 1 ;
UPDATE `template_property` SET `property_value` = '"/usr/local/www/bps3/code/html/mysqldownload"' WHERE `template_property`.`property_id` =94545 LIMIT 1 ;

-- 3)将 @path1 替换成要更改更改web服务器路径
UPDATE `template_property` SET `property_value` = '"/usr/local/www/bps3/code/html/mysqldownload/".@csv' WHERE `template_property`.`property_id` =130592 LIMIT 1 ;

-- 4)改未结案导出56模版变量值
UPDATE `template_property` SET `property_value` = '@filepath2' WHERE `template_property`.`flow_id` =190 and `template_property`.`template_id`='56' and `template_property`.`property_name`='导入文件名变量' LIMIT 1 ;

-- 14、更改客维二期访问地址及端口
UPDATE `template_property` SET `property_value` = '''http://yewu2.guangfa.uat:8282/login/connect.do?username=''.@username.''&enterprise_name=''.@enterprise_name.''&loginsign=''.@loginsign' WHERE `template_id` =4 AND `flow_id` =2696 AND `property_name` ='表达式' ;

-- 15、屏蔽内部邮件
update `nav_navigate` set `appid`=`appid`+100 WHERE  `navname` LIKE  '内部邮件';

-- 16、客维报表工单删除队列(UAT环境不具备)
UPDATE `redis_conn` SET `host` = '10.2.164.170',`port` = '6388',`password` = '',`db` = '10' WHERE `name` ='工单删除队列' ;

-- 2013-12-18
-- 17、客维1期调用2期的signkey
UPDATE `template_property` SET `property_value` = REPLACE(`property_value`,"longxinginfobird","longxinginfobird") WHERE `template_id` =3 AND `flow_id` =2696 AND `property_name` = '表达式' AND `property_value` LIKE '%longxinginfobird%';

-- 2015-11-30
-- 18、邮件附件路径
UPDATE `template_property` SET `property_value` = '/usr/local/www/code/html/mailfiles/' WHERE `template_id` =1 AND `flow_id` =3050 AND property_name='附件路径';

-- 19.短信发送参数的设置 2015-12-11蒋媛媛加入
-- UPDATE `serviceinterface` SET `urlstr` = 'http://10.2.164.169:8080/GfSmsWeb/sms.do?' WHERE `serviceinterface`.`si_id` =6139 LIMIT 1 ;
UPDATE `serviceinterface` SET `urlstr` = 'http://10.2.164.181:8080/GfSmsWeb/sms.do?' WHERE `serviceinterface`.`si_id` =6139 LIMIT 1 ;

-- 20客维报文地址 蒋媛媛 20160428 
 UPDATE `serviceinterface` SET `urlstr` = 'http://baowen.guangfa.uat'  WHERE  `serviceinterface`.`si_id` = 6967 LIMIT 1 ;
 
  -- updata@20160829 夏海玲
 update `template_property` set `property_value`=replace(`property_value`,'/data0/htdocs/baowen','/usr/local/www/baowen') where `property_value`like'%/data0/htdocs/baowen%';
 
 UPDATE `template_property` SET `property_value` = 'http://21.96.165.43:8113/GFJJ/SSJJservlet'  WHERE `template_id` =24  AND `flow_id` =3502 and property_name ='url';
 
-- 21、客维进件生成txt地址 蒋媛媛 20160513 
 UPDATE `serviceinterface` SET `urlstr` = 'http://10.2.164.169:81/Createtxt'  WHERE  `serviceinterface`.`si_id` = 6861 LIMIT 1 ;
 
-- 22、图像打包 蒋媛媛 20160523
 UPDATE `serviceinterface` SET `urlstr` = 'http://transimage.guangfa.uat/TransImages.php?' WHERE `serviceinterface`.`si_id` =6934 LIMIT 1 ;
 
 -- 23、 进件redis_conn修改，来自方乐乐修改 20160607
UPDATE `redis_conn` SET  `name` = '报批客户队列', `host` = '10.2.164.170', `port` = 6393, `password` = '', `db` = 1, `timeout` = '1' WHERE  `redis_conn`.`id` = 30; -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-过程流转服务', `host` = '10.2.164.170', `port` = 6384, `password` = 'redis@infobird.net123456', `db` = 7, `timeout` = '36000' WHERE  `redis_conn`.`id` = 31; -- `host`、`port`、`password`（除db=7）复用老电营redis_conn表中id=40进件环境参数,为实现与电营共用一套进件环境
UPDATE `redis_conn` SET  `name` = '二期-表单审核后内部处理流转', `host` = '10.2.164.170', `port` = 6383, `password` = 'redis@infobird.net123456', `db` = 12, `timeout` = '1' WHERE  `redis_conn`.`id` = 32; -- `host`、`port`、`password`、`db` 复用老电营redis_conn表中id=41进件环境参数,为实现与电营共用一套流水号

UPDATE `redis_conn` SET  `name` = '二期-内部日志队列', `host` = '10.2.164.170', `port` = 6393, `password` = '', `db` = 3, `timeout` = '1' WHERE  `redis_conn`.`id` = 33; -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-实时进件批次队列', `host` = '10.2.164.170', `port` = 6393, `password` = '', `db` = 3, `timeout` = '1' WHERE  `redis_conn`.`id` = 34;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '旧批次号队列', `host` = '10.2.164.170', `port` = 6393, `password` = '', `db` = 4, `timeout` = '1' WHERE  `redis_conn`.`id` = 35;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致
UPDATE `redis_conn` SET  `name` = '二期-实时进件校验队列', `host` = '10.2.164.170', `port` = 6393, `password` = '', `db` = 5, `timeout` = '1' WHERE  `redis_conn`.`id` = 36;  -- `host`、`port`、`password`、`db` 为新建redis信息，其中`db`可以不用修改与开发环境一致

UPDATE `redis_conn` SET  `name` = '二期-内部日志队列(电营)', `host` = '10.2.164.170', `port` = 6383, `password` = 'redis@infobird.net123456', `db` = 12, `timeout` = '1' WHERE  `redis_conn`.`id` = 37; -- `host`、`port`、`password`、`db` 复用老电营redis_conn表中id=42进件环境参数,为实现与电营共用一套批次号


-- ods 文件路径配置   夏伟 20161114
-- /var/ftp/ods_cmdata/ 为ods文件存放的位置，各环境可以自己配置。
UPDATE `template_property` SET `property_value` = '@file=''/var/sftp/ods_cmdata/''.date(''Ymd'').''/WBS''' WHERE `template_id` = 33 and `flow_id` = 3946 and `property_name` = '表达式';

-- 10.2.164.170:92 添加核心报表连接 gjt
update `template_property` set property_value = '\'http://10.2.164.170:92/hwywreport/index?agent=\'.@a;' WHERE  property_id =277345;
update `template_property` set property_value = '\'http://10.2.164.170:92/huawureport/index?agent=\'.@a;' WHERE  property_id =277328;
update `template_property` set property_value = '\'http://10.2.164.170:92/kwbusiness/index?agent=\'.@a;'WHERE  property_id =277311;
update `template_property` set property_value = '\'http://10.2.164.170:92/huawureport/index?agent=\'.@a;'WHERE  property_id =277217;
update `template_property` set property_value = '\'http://10.2.164.170:92/hwywreport/index?agent=\'.@a;'WHERE  property_id =277184;
update `template_property` set property_value = '\'http://10.2.164.170:92/kwbusiness/index?agent=\'.@a;'WHERE  property_id =277111;
update `template_property` set property_value = '\'http://10.2.164.170:92/kwbusiness/index?agent=\'.@a;'WHERE  property_id =277070;

-- 通用脚本 gjt
UPDATE  `service_dbconn` as a INNER JOIN serviceinterface as b on a.db_id=b.db_id SET b.dbconn=dbconn_value;

-- 刘丹丹  20170426  监控台
-- 各环境修改成对应环境地址
-- 例sit环境@mon_console=http://10.2.164.181:8888/IBReport/monitor/jsp/kewei.jsp?username=
-- UPDATE `template_property` SET `property_value` = '''http://10.2.164.181:8888/IBReport/monitor/jsp/kewei.jsp?username=''.@a;' WHERE  `template_id` = 3 AND `flow_id` = 4263 AND `property_name` = '表达式';
-- UPDATE `template_property` SET `property_value` = '''http://10.2.164.181:8888/IBReport/monitor/jsp/kewei.jsp?username=''.@a;' WHERE `template_id` = 2 AND `flow_id` = 4264 AND `property_name` = '表达式';
-- UPDATE `template_property` SET `property_value` = '''http://10.2.164.181:8888/IBReport/monitor/jsp/kewei.jsp?username=''.@a;' WHERE `template_id` = 3 AND `flow_id` = 4283 AND `property_name` = '表达式';

-- 禁呼UAT启通宝链接
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.uat'  WHERE  `serviceinterface`.`si_id` = 7748;
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.uat'  WHERE  `serviceinterface`.`si_id` = 7766;
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.uat'  WHERE  `serviceinterface`.`si_id` = 12606;
UPDATE `serviceinterface` SET `urlstr` = 'http://yewu.guangfa.uat'  WHERE  `serviceinterface`.`si_id` = 12624;

UPDATE `template_property`  SET property_value=REPLACE(property_value,'http://192.168.1.213:8888/IBReport','http://10.2.164.181:8888/IBReport') 
WHERE  `property_value` LIKE '%http://192.168.1.213:8888/IBReport%';
UPDATE `template_property`  SET property_value=REPLACE(property_value,'http://192.168.1.213:8887/IBReport','http://10.2.164.181:8888/IBReport') 
WHERE  `property_value` LIKE '%http://192.168.1.213:8887/IBReport%';
UPDATE `serviceinterface` SET urlstr='http://www.telesalesweb.guangfa.com:93'  WHERE si_id=12707;


-- 25、乐享财智金相关配置    刘彦宾20180920
UPDATE `serviceinterface` SET urlstr='http://www.telesalesweb.guangfa.com:93'  WHERE si_id=12707;
UPDATE `serviceinterface` SET urlstr='http://www.telesalesweb.guangfa.com:93'  WHERE si_id=13236;

UPDATE `template_property` SET `template_id` = 7,`flow_id` = 4677,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="gdbNbr">(.*?)<\\/gateway:field>/'',@output6,@p6);@gdbNbr7=isset(@p6[1][0])?@p6[1][0]:'''';preg_match_all(''/<gateway:field name="errorCode">(.*?)<\\/gateway:field>/'',@output6,@q6);@errorCode7=isset(@q6[1][0])?@q6[1][0]:'''';preg_match_all(''/<gateway:field name="errorMsg">(.*?)<\\/gateway:field>/'',@output6,@r6);@errorMsg7=isset(@r6[1][0])?@r6[1][0]:'''';@flag7=@gdbNbr7==""?''011'':''111'';' WHERE `template_id` = 7 AND `flow_id` = 4677 AND `property_name` = '表达式';
UPDATE `template_property` SET `template_id` = 14,`flow_id` = 4677,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="responseCode">(.*?)<\\/gateway:field>/'',@output20,@z20);@responseCode14=isset(@z20[1][0])?@z20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_limit">(.*?)<\\/gateway:field>/'',@output20,@y20);@p2p_limit14=isset(@y20[1][0])?@y20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_pro_name">(.*?)<\\/gateway:field>/'',@output20,@x20);@num14=count(@x20);preg_match_all(''/<gateway:field name="p2p_cust_group">(.*?)<\\/gateway:field>/'',@output20,@a20);@p2p_cust_group14=isset(@a20[1][0])?@a20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_risk_group">(.*?)<\\/gateway:field>/'',@output20,@b20);@p2p_risk_group14=isset(@b20[1][0])?@b20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_limit">(.*?)<\\/gateway:field>/'',@output20,@c20);@p2p_limit14=isset(@c20[1][0])?@c20[1][0]:'''';preg_match_all(''/<gateway:field name="proj_of_des">(.*?)<\\/gateway:field>/'',@output20,@d20);@proj_of_des14=isset(@d20[1][0])?@d20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_pro_name">(.*?)<\\/gateway:field>/'',@output20,@e20);@market_disc_pro_name14=isset(@e20[1][0])?@e20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_periods">(.*?)<\\/gateway:field>/'',@output20,@f20);@market_disc_periods14=isset(@f20[1][0])?@f20[1][0]:'''';preg_match_all(''/<gateway:field name="btepay_catipal_sign">(.*?)<\\/gateway:field>/'',@output20,@g20);@btepay_catipal_sign14=isset(@g20[1][0])?@g20[1][0]:'''';preg_match_all(''/<gateway:field name="btepay_catipal">(.*?)<\\/gateway:field>/'',@output20,@h20);@btepay_catipal14=isset(@h20[1][0])?@h20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_btepay_sign">(.*?)<\\/gateway:field>/'',@output20,@i20);@fee_btepay_sign14=isset(@i20[1][0])?@i20[1][0]:'''';preg_match_all(''/<gateway:field name="fixed_fee_money">(.*?)<\\/gateway:field>/'',@output20,@j20);@fixed_fee_money14=isset(@j20[1][0])?@j20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate1">(.*?)<\\/gateway:field>/'',@output20,@k20);@cfee_rate114=isset(@k20[1][0])?@k20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent1">(.*?)<\\/gateway:field>/'',@output20,@l20);@fee_catipal_percent114=isset(@l20[1][0])?@l20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate2">(.*?)<\\/gateway:field>/'',@output20,@m20);@cfee_rate214=isset(@m20[1][0])?@m20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent2">(.*?)<\\/gateway:field>/'',@output20,@n20);@fee_catipal_percent214=isset(@n20[1][0])?@n20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate_bperiods_2">(.*?)<\\/gateway:field>/'',@output20,@o20);@cfee_rate_bperiods_214=isset(@o20[1][0])?@o20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate3">(.*?)<\\/gateway:field>/'',@output20,@p20);@cfee_rate314=isset(@p20[1][0])?@p20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent3">(.*?)<\\/gateway:field>/'',@output20,@aa20);@fee_catipal_percent314=isset(@aa20[1][0])?@aa20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate_bperiods_3">(.*?)<\\/gateway:field>/'',@output20,@ab20);@cfee_rate_bperiods_314=isset(@ab20[1][0])?@ab20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_from">(.*?)<\\/gateway:field>/'',@output20,@ac20);@cfee_reduction_from14=isset(@ac20[1][0])?@ac20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_to">(.*?)<\\/gateway:field>/'',@output20,@ad20);@cfee_reduction_to14=isset(@ad20[1][0])?@ad20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_per">(.*?)<\\/gateway:field>/'',@output20,@ae20);@cfee_reduction_per14=isset(@ae20[1][0])?@ae20[1][0]:'''';preg_match_all(''/<gateway:field name="buckle_pre">(.*?)<\\/gateway:field>/'',@output20,@af20);@buckle_pre14=isset(@af20[1][0])?@af20[1][0]:'''';preg_match_all(''/<gateway:field name="deduct_pre1">(.*?)<\\/gateway:field>/'',@output20,@ag20);@deduct_pre114=isset(@ag20[1][0])?@ag20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod1">(.*?)<\\/gateway:field>/'',@output20,@ah20);@fine_mod114=isset(@ah20[1][0])?@ah20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod_value1">(.*?)<\\/gateway:field>/'',@output20,@ai20);@fine_mod_value114=isset(@ai20[1][0])?@ai20[1][0]:'''';preg_match_all(''/<gateway:field name="deduct_pre2">(.*?)<\\/gateway:field>/'',@output20,@aj20);@deduct_pre214=isset(@aj20[1][0])?@aj20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod2">(.*?)<\\/gateway:field>/'',@output20,@ak20);@fine_mod214=isset(@ak20[1][0])?@ak20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod_value2">(.*?)<\\/gateway:field>/'',@output20,@al20);@fine_mod_value214=isset(@al20[1][0])?@al20[1][0]:'''';preg_match_all(''/<gateway:field name="market_discount">(.*?)<\\/gateway:field>/'',@output20,@am20);@market_discount14=isset(@am20[1][0])?@am20[1][0]:'''';preg_match_all(''/<gateway:field name="base_fee_ratio">(.*?)<\\/gateway:field>/'',@output20,@an20);@base_fee_ratio14=isset(@an20[1][0])?@an20[1][0]:'''';preg_match_all(''/<gateway:field name="base_rtn_mths">(.*?)<\\/gateway:field>/'',@output20,@ao20);@base_rtn_mths14=isset(@ao20[1][0])?@ao20[1][0]:'''';@flag14=@p2p_limit14<500?2:1;' WHERE `template_id` = 14 AND `flow_id` = 4677 AND `property_name` = '表达式';
UPDATE `template_property` SET `template_id` = 6,`flow_id` = 4736,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="errorCode">(.*?)<\\/gateway:field>/'',@output5,@q5);@errorCode6=isset(@q5[1][0])?@q5[1][0]:'''';preg_match_all(''/<gateway:field name="errorMsg">(.*?)<\\/gateway:field>/'',@output5,@r5);@errorMsg6=isset(@r5[1][0])?@r5[1][0]:'''';' WHERE `template_id` = 6 AND `flow_id` = 4736 AND `property_name` = '表达式';

UPDATE `template_property` SET property_value=REPLACE(property_value,'url4677','http://21.96.165.43:8113') WHERE flow_id='4677' AND template_id='2' AND property_name='表达式';
UPDATE `template_property` SET property_value=REPLACE(property_value,'url4677','http://21.96.165.43:8113') WHERE flow_id='4677' AND template_id='12' AND property_name='表达式';
UPDATE `template_property` SET property_value=REPLACE(property_value,'url4736','http://21.96.165.43:8113') WHERE flow_id='4736' AND template_id='2' AND property_name='表达式';



-- 26、20181030
UPDATE `template_property`  SET property_value=REPLACE(property_value,'http://192.168.1.232:8888/KeWeiBusinessReport','http://10.2.164.181:8081/KeWeiBusinessReport') WHERE  `property_value` LIKE '%http://192.168.1.232:8888/KeWeiBusinessReport%';

UPDATE `template_property` SET `property_value` = '''http://yewu2.guangfa.uat''' WHERE `template_id` = 10 and `flow_id` = 3155 and `property_name` = '表达式';


-- 27、生成短链接地址
UPDATE `template_property`  SET property_value=REPLACE(property_value,'10.2.37.21:8082','21.96.165.43:8113') WHERE  `property_value` LIKE '%10.2.37.21:8082%';
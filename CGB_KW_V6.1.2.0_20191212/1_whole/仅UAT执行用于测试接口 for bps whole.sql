UPDATE `template_property` SET `template_id` = 7,`flow_id` = 4677,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="gdbNbr">(.*?)<\\/gateway:field>/'',@output6,@p6);@gdbNbr7=isset(@p6[1][0])?@p6[1][0]:'''';preg_match_all(''/<gateway:field name="errorCode">(.*?)<\\/gateway:field>/'',@output6,@q6);@errorCode7=isset(@q6[1][0])?@q6[1][0]:'''';preg_match_all(''/<gateway:field name="errorMsg">(.*?)<\\/gateway:field>/'',@output6,@r6);@errorMsg7=isset(@r6[1][0])?@r6[1][0]:'''';@flag7=@gdbNbr7==""?''011'':''111'';' WHERE `template_id` = 7 AND `flow_id` = 4677 AND `property_name` = '表达式';
UPDATE `template_property` SET `template_id` = 14,`flow_id` = 4677,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="responseCode">(.*?)<\\/gateway:field>/'',@output20,@z20);@responseCode14=isset(@z20[1][0])?@z20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_limit">(.*?)<\\/gateway:field>/'',@output20,@y20);@p2p_limit14=isset(@y20[1][0])?@y20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_pro_name">(.*?)<\\/gateway:field>/'',@output20,@x20);@num14=count(@x20);preg_match_all(''/<gateway:field name="p2p_cust_group">(.*?)<\\/gateway:field>/'',@output20,@a20);@p2p_cust_group14=isset(@a20[1][0])?@a20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_risk_group">(.*?)<\\/gateway:field>/'',@output20,@b20);@p2p_risk_group14=isset(@b20[1][0])?@b20[1][0]:'''';preg_match_all(''/<gateway:field name="p2p_limit">(.*?)<\\/gateway:field>/'',@output20,@c20);@p2p_limit14=isset(@c20[1][0])?@c20[1][0]:'''';preg_match_all(''/<gateway:field name="proj_of_des">(.*?)<\\/gateway:field>/'',@output20,@d20);@proj_of_des14=isset(@d20[1][0])?@d20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_pro_name">(.*?)<\\/gateway:field>/'',@output20,@e20);@market_disc_pro_name14=isset(@e20[1][0])?@e20[1][0]:'''';preg_match_all(''/<gateway:field name="market_disc_periods">(.*?)<\\/gateway:field>/'',@output20,@f20);@market_disc_periods14=isset(@f20[1][0])?@f20[1][0]:'''';preg_match_all(''/<gateway:field name="btepay_catipal_sign">(.*?)<\\/gateway:field>/'',@output20,@g20);@btepay_catipal_sign14=isset(@g20[1][0])?@g20[1][0]:'''';preg_match_all(''/<gateway:field name="btepay_catipal">(.*?)<\\/gateway:field>/'',@output20,@h20);@btepay_catipal14=isset(@h20[1][0])?@h20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_btepay_sign">(.*?)<\\/gateway:field>/'',@output20,@i20);@fee_btepay_sign14=isset(@i20[1][0])?@i20[1][0]:'''';preg_match_all(''/<gateway:field name="fixed_fee_money">(.*?)<\\/gateway:field>/'',@output20,@j20);@fixed_fee_money14=isset(@j20[1][0])?@j20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate1">(.*?)<\\/gateway:field>/'',@output20,@k20);@cfee_rate114=isset(@k20[1][0])?@k20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent1">(.*?)<\\/gateway:field>/'',@output20,@l20);@fee_catipal_percent114=isset(@l20[1][0])?@l20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate2">(.*?)<\\/gateway:field>/'',@output20,@m20);@cfee_rate214=isset(@m20[1][0])?@m20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent2">(.*?)<\\/gateway:field>/'',@output20,@n20);@fee_catipal_percent214=isset(@n20[1][0])?@n20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate_bperiods_2">(.*?)<\\/gateway:field>/'',@output20,@o20);@cfee_rate_bperiods_214=isset(@o20[1][0])?@o20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate3">(.*?)<\\/gateway:field>/'',@output20,@p20);@cfee_rate314=isset(@p20[1][0])?@p20[1][0]:'''';preg_match_all(''/<gateway:field name="fee_catipal_percent3">(.*?)<\\/gateway:field>/'',@output20,@aa20);@fee_catipal_percent314=isset(@aa20[1][0])?@aa20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_rate_bperiods_3">(.*?)<\\/gateway:field>/'',@output20,@ab20);@cfee_rate_bperiods_314=isset(@ab20[1][0])?@ab20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_from">(.*?)<\\/gateway:field>/'',@output20,@ac20);@cfee_reduction_from14=isset(@ac20[1][0])?@ac20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_to">(.*?)<\\/gateway:field>/'',@output20,@ad20);@cfee_reduction_to14=isset(@ad20[1][0])?@ad20[1][0]:'''';preg_match_all(''/<gateway:field name="cfee_reduction_per">(.*?)<\\/gateway:field>/'',@output20,@ae20);@cfee_reduction_per14=isset(@ae20[1][0])?@ae20[1][0]:'''';preg_match_all(''/<gateway:field name="buckle_pre">(.*?)<\\/gateway:field>/'',@output20,@af20);@buckle_pre14=isset(@af20[1][0])?@af20[1][0]:'''';preg_match_all(''/<gateway:field name="deduct_pre1">(.*?)<\\/gateway:field>/'',@output20,@ag20);@deduct_pre114=isset(@ag20[1][0])?@ag20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod1">(.*?)<\\/gateway:field>/'',@output20,@ah20);@fine_mod114=isset(@ah20[1][0])?@ah20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod_value1">(.*?)<\\/gateway:field>/'',@output20,@ai20);@fine_mod_value114=isset(@ai20[1][0])?@ai20[1][0]:'''';preg_match_all(''/<gateway:field name="deduct_pre2">(.*?)<\\/gateway:field>/'',@output20,@aj20);@deduct_pre214=isset(@aj20[1][0])?@aj20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod2">(.*?)<\\/gateway:field>/'',@output20,@ak20);@fine_mod214=isset(@ak20[1][0])?@ak20[1][0]:'''';preg_match_all(''/<gateway:field name="fine_mod_value2">(.*?)<\\/gateway:field>/'',@output20,@al20);@fine_mod_value214=isset(@al20[1][0])?@al20[1][0]:'''';preg_match_all(''/<gateway:field name="market_discount">(.*?)<\\/gateway:field>/'',@output20,@am20);@market_discount14=isset(@am20[1][0])?@am20[1][0]:'''';preg_match_all(''/<gateway:field name="base_fee_ratio">(.*?)<\\/gateway:field>/'',@output20,@an20);@base_fee_ratio14=isset(@an20[1][0])?@an20[1][0]:'''';preg_match_all(''/<gateway:field name="base_rtn_mths">(.*?)<\\/gateway:field>/'',@output20,@ao20);@base_rtn_mths14=isset(@ao20[1][0])?@ao20[1][0]:'''';@flag14=@p2p_limit14<500?2:1;' WHERE `template_id` = 14 AND `flow_id` = 4677 AND `property_name` = '表达式';
UPDATE `template_property` SET `template_id` = 6,`flow_id` = 4736,`property_name` = '表达式',`property_value` = 'preg_match_all(''/<gateway:field name="errorCode">(.*?)<\\/gateway:field>/'',@output5,@q5);@errorCode6=isset(@q5[1][0])?@q5[1][0]:'''';preg_match_all(''/<gateway:field name="errorMsg">(.*?)<\\/gateway:field>/'',@output5,@r5);@errorMsg6=isset(@r5[1][0])?@r5[1][0]:'''';' WHERE `template_id` = 6 AND `flow_id` = 4736 AND `property_name` = '表达式';
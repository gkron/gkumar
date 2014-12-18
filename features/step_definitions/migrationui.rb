#require 'logger'
#require 'date'
#require 'win32ole'
#require 'spreadsheet'
#require 'csv'
#require 'rubygems'

# log = Logger.new('showfacetuilogs.txt')
# rlog = Logger.new('rdppuilogs.txt')
# Given(/^showfacets ui testing against saturn and stella Data Bases randomly$/) do
  # loginpage($yml_file['url'],$loc['login_module'],$loc['login_user'],$loc['login_password'],$loc['login_button'])
  # verifyElemetPresent($loc['navigation_search'],$loc['menu_1'])
  # steps %{
    # Given I connect to the database
    # Then I connect to the stella database
    # Then I connect to attribute data base
  # }
  # results = $dbhstella.execute("select * from (select * from(select category_id from category
# intersect
# select distinct category_id from category_facet where end_date >= to_timestamp(sysdate) and inheritance_flag = 'N'
# union
# (select child.category_id category_id from category parent,category child where parent.category_id = child.parent_category_id and
# parent.faceted_category_flag ='Y' )) order by dbms_random.value ) where ROWNUM <=10")
  # results.fetch do |row|
    # begin
      # $saturn_rows = Array.new
      # $stella_rows = Array.new
      # $facet_ids  =   Array.new
      # $uivalues = Array.new
      # @catid=row[0].to_int()
      # @rulename = "#{@catid}_CatHierarchy_Facets"
      # #puts @catid
      # saturn_results = $dbhsaturn.execute("select df.sequence_number,df.facet_name,df.dest_display_name,df.collapse_flag,to_char(df.start_date,'mm/dd/YYYY'),to_char(df.end_date,'mm/dd/YYYY') from display_facet df, display_facet_action dfa,
# merch_action ma,merch_rule mr,merch_rule_action_assn mraa where
# mr.merch_rule_id = mraa.merch_rule_id and
# mraa.merch_action_id = ma.merch_action_id and
# ma.merch_action_id = dfa.merch_action_id and
# dfa.display_facet_action_id = df.display_facet_action_id and
# mr.merch_rule_name = '#{@rulename}' and
# mr.site_tenant='MCOM' order by sequence_number")
      # saturn_results.fetch do |row|
        # $saturn_rows <<  "#{row[0].to_int()}"
        # $saturn_rows << "#{row[1]}"
        # $saturn_rows <<  "#{row[3]}"
        # $saturn_rows <<  "#{row[4]}"
        # $saturn_rows <<  "#{row[5]}"
      # end
# 
      # context_att =  $dbhsaturn.execute("select count(*) from context_trig_value ctv ,merch_rule mr,merch_rule_trigger_assn mrta,context_trig ct where
# ct.context_trig_id = ctv.context_trig_id and
# ct.merch_trig_id = mrta.merch_trig_id and
# 
# mr.merch_rule_id = mrta.merch_rule_id and
# mr.merch_rule_name ='#{@rulename}'")
# 
      # context_att.fetch do |row|
        # $cnt_att =  row[0].to_int()
      # end
# 
      # inherit_type_cate_id =  $dbhsaturn.execute("select frt.inherit_type_id,frgv.data_value from merch_rule mr,
# merch_rule_trigger_assn mrta,facet_refine_trig frt,facet_refine_group frg,facet_refine_group_value frgv where
# mr.merch_rule_id = mrta.merch_rule_id and
# mrta.merch_trig_id = frt.merch_trig_id and
# frg.facet_refine_trig_id = frt.facet_refine_trig_id and
# frg.facet_refine_group_id = frgv.facet_refine_group_id and
# mr.merch_rule_name ='#{@rulename}'")
# 
      # inherit_type_cate_id.fetch do |row|
        # $inherit_type =  row[0].to_int()
        # $catgory_id ="#{row[1]}"
      # end
# 
      # stella_results = $dbhstella.execute("select distinct sequence,facet_id,collapsed_flag,to_char(start_date,'mm/dd/YYYY'),to_char(end_date,'mm/dd/YYYY') from category_facet where category_id ='#{@catid}' and end_date >= sysdate and INHERITANCE_FLAG='N' order by sequence")
      # stella_results.fetch do |row|
        # $stella_rows << "#{row[0].to_int()}"
        # $facet_ids << "#{row[1].to_int()}"
        # $stella_rows << "#{row[2]}"
        # $stella_rows << "#{row[3]}"
        # $stella_rows << "#{row[4]}"
      # end
# 
      # @j=1
# 
      # $facet_ids.each do |i|
        # facetids = $dbattri.execute("select distinct attribute_name from attribute_def where attribute_id ='#{i}' and tenant_id='MCOM'")
        # facetids.fetch do |row|
          # $stella_rows.insert(@j, "#{row[0]}")
          # @j=@j+5
        # end
      # end
# 
      # if(($saturn_rows - $stella_rows) && ($stella_rows-$saturn_rows)).empty?
# 
        # fill_in "globalSrchField", :with => @rulename
        # page.driver.browser.action.send_keys(:tab).perform
        # click_button("Go")
        # sleep 3
        # find("//table/tbody/tr/td[1]/a").click
        # waitUntilElementvisible("//table[@id='displayFacetsTable']/tbody/tr")
        # sleep 6
        # @cfact=page.all("//table[@id='displayFacetsTable']/tbody/tr").count
# 
        # for z in 1..@cfact
          # for v in 1..5
            # if v!=2
              # attempts=0
              # begin
                # $uivalues << find("//table[@id='displayFacetsTable']/tbody/tr[#{z}]/td[not(position()=3)][#{v}]/input").value
                # sleep 3
              # rescue Capybara::ElementNotFound => e
                # attempts=attempts+1
                # retry unless attempts > 10
              # ensure
                # if(attempts > 10)
                # #raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
                # end
              # end
            # else
              # $uivalues << find("//table[@id='displayFacetsTable']/tbody/tr[#{z}]/td[not(position()=3)][#{v}]").text
            # end
          # end
        # end
# 
        # for k in 0..$uivalues.length
          # if $uivalues[k] == "on"
            # $uivalues[k] = "Y"
          # elsif $uivalues[k] == "off"
            # $uivalues[k] = "N"
          # end
        # end
# 
        # if ($uivalues <=> $saturn_rows)==0
          # log.info "Compared UI against saturn DB and test is Pass"
          # log.info "values in Saturn UI : #{$uivalues}"
          # page.should have_xpath("//select[@id='inheritTypeDropdown0']/option[@value='#{$inherit_type}' and @disabled='disabled']")
          # find("//input[@id='inputCategoryID0']").value.eql? $catgory_id.to_s
# 
          # if ($cnt_att==125)
            # puts "context attr check boxes checked"
          # else
            # raise "context attri not checked"
          # end
        # else
          # log.error "Compared UI against saturn DB and test is Fail"
          # log.info "values in Saturn UI : #{$uivalues}"
        # end
# 
      # else
        # log.error "Compared Saturn DB aganist Stella DB and test is fail for rule name -#{@rulename}"
        # log.info "values in Stella DB is : #{$stella_rows}"
        # log.info "values in Saturn DB is : #{$saturn_rows}"
      # end
    # rescue Exception => exc
      # log.fatal(exc)
    # ensure
      # log.info "=================================================================================="
    # end
  # end
# end
# 
# Given(/^rdpp ui testing against saturn and stella Data Bases randomly$/) do
  # loginpage($yml_file['url'],$loc['login_module'],$loc['login_user'],$loc['login_password'],$loc['login_button'])
  # verifyElemetPresent($loc['navigation_search'],$loc['menu_1'])
# 
  # steps %{
# Given I connect to the database
# Then I connect to the stella database
# }
  # results = $dbhstella.execute("select * from(select category_id from rdpp_rule_category where end_date > to_timestamp(sysdate)order by dbms_random.value ) where ROWNUM <=3000")
 # #select * from (select category_id from rdpp_rule_category where end_date > to_timestamp(sysdate)) where ROWNUM <=1")
  # results.fetch do |row|
    # begin
      # $saturn_rows = Array.new
      # $stella_rows = Array.new
      # $rdpp_rule_ids  =   Array.new
      # @catid=row[0].to_int()
      # @rulename = "#{@catid}_CatHierarchy_RDPP"
      # saturn_results = $dbhsaturn.execute("select rdpp_rule_id , to_char(to_date(effective_date,'dd-mon-yy'),'mm/dd/yyyy'),to_char(to_date(expiration_date,'dd-mon-yy'),'mm/dd/yyyy') from rdpp_assignment ra,
# merch_rule mr,merch_rule_action_assn mraa,merch_action ma
# where mr.merch_rule_id = mraa.merch_rule_id and
# ma.merch_action_id = mraa.merch_action_id and
# ma.merch_action_id = ra.merch_action_id and
# mr.site_tenant='MCOM' and
# merch_rule_name = '#{@rulename}'")
      # saturn_results.fetch do |row|
        # $rdpp_rule_ids <<  "#{row[0].to_int()}"
        # $saturn_rows <<  "#{row[1]}"
        # $saturn_rows <<  "#{row[2]}"
      # end
# 
      # @rd=0
# 
      # $rdpp_rule_ids.each do |i|
        # rdpp_rule_name=$dbhstella.execute("select rule_name from rdpp_rule where rdpp_rule_id=#{i}")
        # rdpp_rule_name.fetch do |drow|
          # $saturn_rows.insert(@rd, "#{i} - #{drow[0]}")
          # @rd=@rd+3
        # end
      # end
# 
      # context_att =  $dbhsaturn.execute("select count(*) from context_trig_value ctv ,merch_rule mr,merch_rule_trigger_assn mrta,context_trig ct where
# ct.context_trig_id = ctv.context_trig_id and
# ct.merch_trig_id = mrta.merch_trig_id and
# 
# mr.merch_rule_id = mrta.merch_rule_id and
# mr.merch_rule_name ='#{@rulename}'")
# 
      # context_att.fetch do |row|
        # $cnt_att =  row[0].to_int()
      # end
# 
      # inherit_type_cate_id =  $dbhsaturn.execute("select frt.inherit_type_id,frgv.data_value from merch_rule mr,
# merch_rule_trigger_assn mrta,facet_refine_trig frt,facet_refine_group frg,facet_refine_group_value frgv where
# mr.merch_rule_id = mrta.merch_rule_id and
# mrta.merch_trig_id = frt.merch_trig_id and
# frg.facet_refine_trig_id = frt.facet_refine_trig_id and
# frg.facet_refine_group_id = frgv.facet_refine_group_id and
# mr.merch_rule_name ='#{@rulename}'")
# 
      # inherit_type_cate_id.fetch do |row|
        # $inherit_type =  row[0].to_int()
        # $catgory_id ="#{row[1]}"
      # end
# 
      # stella_results = $dbhstella.execute("select rr.rdpp_rule_id ||' - '|| rr.rule_name ,to_char(rrc.start_date,'mm/dd/yyyy'),to_char(rrc.end_date,'mm/dd/yyyy') from rdpp_rule_category rrc,rdpp_rule rr where rrc.rdpp_rule_id = rr.rdpp_rule_id and
# rrc.category_id = '#{@catid}' and rrc.end_date > to_timestamp(sysdate)")
      # stella_results.fetch do |row|
        # $stella_rows << "#{row[0]}"
        # $stella_rows << "#{row[1]}"
        # $stella_rows << "#{row[2]}"
      # end
    # end
# 
    # begin
      # if(($saturn_rows - $stella_rows) && ($stella_rows-$saturn_rows)).empty?
# 
        # rlog.info "Compared Saturn DB aganist Stella DB and test is pass for rule name -#{@rulename}"
        # rlog.info "values in Stella DB is : #{$stella_rows}"
        # rlog.info "values in Saturn DB is : #{$saturn_rows}"
# 
        # fill_in "globalSrchField", :with => @rulename
        # page.driver.browser.action.send_keys(:tab).perform
        # click_button("Go")
        # sleep 3
        # find("//table/tbody/tr/td[1]/a").click
        # waitUntilElementvisible("//select[@id='inheritTypeDropdown0']")
        # sleep 6
# 
        # page.should have_xpath("//select[@id='inheritTypeDropdown0']/option[@value='#{$inherit_type}' and @disabled='disabled']")
        # find("//input[@id='inputCategoryID0']").value.eql? $catgory_id.to_s
        # if ($cnt_att==120)
          # puts "context attr check boxes checked"
        # else
          # raise "context attri not checked"
        # end
# 
        # page.driver.browser.execute_script("var x = document.getElementById('dropdownRDPPRule0').selectedIndex;
      # var y = document.getElementById('dropdownRDPPRule0').options;
       # return y[x].text").eql? $saturn_rows[0]
# 
        # find("//input[@id='startDateValue0']").value.eql? $saturn_rows[1]
        # find("//input[@id='endDateValue0']").value.eql? $saturn_rows[2]
# 
      # else
# 
        # rlog.error "Compared Saturn DB aganist Stella DB and test is fail for rule name -#{@rulename}"
        # rlog.info "values in Stella DB is : #{$stella_rows}"
        # rlog.info "values in Saturn DB is : #{$saturn_rows}"
      # end
    # rescue Exception => exc
      # rlog.fatal(exc)
    # ensure
      # rlog.info "=================================================================================="
    # end
  # end
# end
# 
# Given(/^facet value sequence ui verification against given cvs file$/) do
  # # steps %{
# # Given I connect to the database
# # }
  # loginpage($yml_file['url'],$loc['login_module'],$loc['login_user'],$loc['login_password'],$loc['login_button'])
  # verifyElemetPresent($loc['navigation_search'],$loc['menu_1'])
  # csv = CSV.read('BCOM_BRAND_SEQUENCE_LIST_March2014_updated.csv', :headers=>true)
  # nodup = csv['CAT_ID'].uniq
  # #puts nodup
#   
  # for d in 51..nodup.count-1
   # begin
    # att_values = Array.new
    # exp_seq_num  = Array.new
    # act_seq_num  = Array.new
    # facet_sequence_ui_values = Array.new
    # row = $sheetfsv.row($fsv)
    # # saturn_results = $dbhsaturn.execute("select * from facet_value where facet_value_action_id=(select facet_value_action_id from facet_value_action where merch_action_id=(SELECT merch_action_id FROM merch_rule_action_assn WHERE MERCH_RULE_ID =(select MERCH_RULE_ID from merch_rule where merch_rule_name = '#{nodup[d]}_CatHierarchy_Facets')))")
      # # saturn_results.fetch do |row|
        # # act_seq_num <<  "#{row[1].to_int()}"
        # # facet_sequence_ui_values <<  "#{row[2]}"
      # # end
# #       
      # #puts act_seq_num
     # # puts facet_sequence_ui_values
    # fill_in "globalSrchField", :with => nodup[d]+"_CatHierarchy_Facets"
    # page.driver.browser.action.send_keys(:tab).perform
    # click_button("Go")
    # sleep 3
    # find("//table/tbody/tr/td[1]/a").click
    # waitUntilElementvisible("//select[@id='inheritTypeDropdown0']")
    # sleep 6
    # cnt =page.all("//table[@id='facetValueSequenceTable']/tbody/tr").count
    # for u in 1..cnt
      # act_seq_num << find("//table[@id='facetValueSequenceTable']/tbody/tr[#{u}]/td/input").value
      # facet_sequence_ui_values << find("//table[@id='facetValueSequenceTable']/tbody/tr[#{u}]/td[2]").text
    # end
    # for k in 0..csv['CAT_ID'].count
      # if csv['CAT_ID'][k]==nodup[d]
        # exp_seq_num << csv['SEQ_NBR'][k]
        # att_values << csv['ATTR_VALUE'][k]
      # end
    # end
# 
      # puts att_values.map!{ |element| element[1..-2] }
      # #puts att_values
      # #puts facet_sequence_ui_values
      # #facet_sequence_ui_values.map!{ |element| element.gsub(/'/, '') }
    # if (facet_sequence_ui_values.count==att_values.count)
      # for s in 0..facet_sequence_ui_values.count-1
          # if (facet_sequence_ui_values[s] ==  att_values [s]) && (act_seq_num[s] ==  exp_seq_num[s])
            # row = $sheetfsv.row($fsv)
            # row[0] = nodup[d]
            # row[1] = att_values[s]
            # row[2] = facet_sequence_ui_values[s]
            # row[3] = "PASS"
            # row.set_format(3, $gformat)
            # row[4] = exp_seq_num[s]
            # row[5] = act_seq_num[s]
            # row[6] = "PASS"
            # row.set_format(6, $gformat)
            # $fsv =$fsv+1
          # elsif (att_values[s].force_encoding("UTF-8").length == facet_sequence_ui_values[s].length) && (act_seq_num[s] ==  exp_seq_num[s])
            # row = $sheetfsv.row($fsv)
            # row[0] = nodup[d]
            # #row[1] = att_values[s]
            # #row[2] = facet_sequence_ui_values[s]
            # row[3] = "PASS"
            # row.set_format(3, $gformat)
            # row[4] = exp_seq_num[s]
            # row[5] = act_seq_num[s]
            # row[6] = "PASS"
            # row.set_format(6, $gformat)
            # $fsv =$fsv+1
          # else
            # row = $sheetfsv.row($fsv)
            # row[0] = nodup[d]
            # row[1] = att_values[s]
            # row[2] = facet_sequence_ui_values[s]
            # row[3] = "FAIL"
            # row.set_format(3, $rformat)
            # row[4] = exp_seq_num[s]
            # row[5] = act_seq_num[s]
            # row[6] = "FAIL"
            # row.set_format(6, $rformat)
            # $fsv =$fsv+1
          # end
      # end
      # $bookfsv.write $fsv_result_excel
    # end
     # rescue Exception => exc
#        
    # ensure
    # end
  # end
# 
# end
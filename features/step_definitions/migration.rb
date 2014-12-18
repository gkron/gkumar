# require 'logger'
# require 'date'
# require 'spreadsheet'
# 
# log = Logger.new('showfacetslogs.txt')
# rlog = Logger.new('rdpplogs.txt')
# mlog = Logger.new('mrslogs.txt')
# Given(/^showfacets migration testing in saturn and stella data bases$/) do
  # $tested_fileds =["sequence_number","facet_name","collapse_flag","start_date","end_date"]
  # steps %{
    # Given I connect to the database
    # Then I connect to the stella database
    # Then I connect to attribute data base
  # }
  # results = $dbhstella.execute("select category_id from category
# intersect
# select distinct category_id from category_facet where end_date >= to_timestamp(sysdate) and inheritance_flag = 'N'
# union
# (select child.category_id category_id from category parent,category child where parent.category_id = child.parent_category_id and
# parent.faceted_category_flag ='Y' )")
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
        # log.info "Compared Saturn DB aganist Stella DB and test is pass for rule name -#{@rulename}"
        # log.info "values in Stella DB is : #{$stella_rows}"
        # log.info "values in Saturn DB is : #{$saturn_rows}"
# 
        # format = Spreadsheet::Format.new :color => :green,
        # :weight => :bold,
        # :size => 10
# 
        # format1 = Spreadsheet::Format.new :color => :red,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmi.row($mir)
        # row[0] = @rulename
        # row[1] = "PASS"
        # row.set_format(1, format)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
        # if(($saturn_rows.empty?) && ($stella_rows.empty?))
          # checking_parent = $dbhstella.execute("select category_id,faceted_category_flag from category where category_id =(select parent_category_id from category where category_id = #{@catid})")
          # checking_parent.fetch do |prow|
            # if "#{prow[1]}" == "Y"
              # log.info "#{prow[0].to_int} is parent category of #{@catid} and faceted_category_flag is #{prow[1]}"
              # row[4] = "#{prow[1]}"
            # row.set_format(4, format)
            # else
              # row[4] = "#{prow[1]}"
              # row.set_format(4, format1)
              # log.error "#{prow[0].to_int} is parent category of #{@catid} and faceted_category_flag is #{prow[1]}"
            # end
          # end
        # end
# 
        # if($cnt_att==125)
          # log.info "context attribute count is #{$cnt_att}"
          # row[5] = "#{$cnt_att}"
        # else
          # row[5] = "#{$cnt_att}"
          # row.set_format(5, format1)
          # log.error "context attribute count not matching....."
        # end
# 
        # row[6] = "Category Hierarchy"
# 
        # if($inherit_type==2)
          # log.info "Inherit type is FROM Parent"
          # row[7] = "#{$inherit_type}"
        # else
          # row[7] = "#{$inherit_type}"
          # row.set_format(7, format1)
          # log.error "Inherit type is not matching....."
        # end
# 
        # if($catgory_id.to_i==@catid)
          # log.info "Catrgory id is #{$catgory_id} "
          # row[8] = "#{$catgory_id}"
        # else
          # row[8] = "#{$catgory_id}"
          # row.set_format(8, format1)
          # log.error "category id is not matching....."
        # end
# 
      # else
# 
        # format = Spreadsheet::Format.new :color => :green,
        # :weight => :bold,
        # :size => 10
# 
        # format1 = Spreadsheet::Format.new :color => :red,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmi.row($mir)
        # row[0] = @rulename
        # row[1] = "FAIL"
        # row.set_format(2, format1)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
        # log.error "Compared Saturn DB aganist Stella DB and test is fail for rule name -#{@rulename}"
        # log.info "values in Stella DB is : #{$stella_rows}"
        # log.info "values in Saturn DB is : #{$saturn_rows}"
      # end
      # #print $uivalues
    # rescue Exception => exc
      # log.fatal(exc)
    # ensure
      # $bookmi.write $mi_result_excel
      # $mir =$mir+1
      # log.info "=================================================================================="
    # end
  # end
# end
# 
# Given(/^rdpp migration testing in saturn and stella data bases$/) do
  # steps %{
# Given I connect to the database
# Then I connect to the stella database
# }
  # results = $dbhstella.execute("select category_id from rdpp_rule_category where end_date > to_timestamp(sysdate)")
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
        # format = Spreadsheet::Format.new :color => :green,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmid.row($mird)
        # row[0] = @rulename
        # row[1] = "PASS"
        # row.set_format(1, format)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
        # if($cnt_att==120)
          # rlog.info "context attribute count is #{$cnt_att}"
          # row[4] = "#{$cnt_att}"
        # else
          # row[4] = "#{$cnt_att}"
          # row.set_format(4, format1)
          # rlog.error "context attribute count not matching....."
        # end
# 
        # row[5] = "Category Hierarchy"
# 
        # if($inherit_type==2)
          # rlog.info "Inherit type is FROM Parent"
          # row[6] = "#{$inherit_type}"
        # else
          # row[6] = "#{$inherit_type}"
          # row.set_format(6, format1)
          # rlog.error "Inherit type is not matching....."
        # end
# 
        # if($catgory_id.to_i==@catid)
          # rlog.info "Catrgory id is #{$catgory_id} "
          # row[7] = "#{$catgory_id}"
        # else
          # row[7] = "#{$catgory_id}"
          # row.set_format(7, format1)
          # rlog.error "category id is not matching....."
        # end
# 
      # else
# 
        # rlog.error "Compared Saturn DB aganist Stella DB and test is fail for rule name -#{@rulename}"
        # rlog.info "values in Stella DB is : #{$stella_rows}"
        # rlog.info "values in Saturn DB is : #{$saturn_rows}"
# 
        # format = Spreadsheet::Format.new :color => :red,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmid.row($mird)
        # row[0] = @rulename
        # row[1] = "FAIL"
        # row.set_format(1, format)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
      # end
    # rescue Exception => exc
      # rlog.fatal(exc)
    # ensure
      # $bookmid.write $mid_result_excel
      # $mird =$mird+1
      # rlog.info "=================================================================================="
    # end
  # end
# end
# 
# Given(/^modified result set migration testing in saturn and stella data bases$/) do
  # steps %{
# Given I connect to the database
# Then I connect to the stella database
# }
  # results = $dbhstella.execute("select category_id from category
# intersect
# (select distinct business_id from static_saved_set_owner where owner_type in('CATEGORY_NAV','CATEGORY_REGISTRY_FEATURED_PRODUCTS','CATEGORY_FEATURED_PRODUCTS')
# union
# select distinct business_id from dynamic_saved_set_owner where owner_type in('CATEGORY_NAV'))")
  # results.fetch do |row|
    # begin
      # $saturn_rows = Array.new
      # $stella_rows = Array.new
      # $rdpp_rule_ids  =   Array.new
      # @catid=row[0].to_int()
      # @rulename = "#{@catid}_CatHierarchy_ModifiedResults"
      # saturn_results = $dbhsaturn.execute("select distinct content_id from modify_result_set mrs,modify_result_set_action mrsa,merch_rule_action_assn mraa,merch_rule mr
# where
# mr.merch_rule_id = mraa.merch_rule_id and
# mrsa.merch_action_id = mraa.merch_action_id and
# mrs.modify_result_set_action_id = mrsa.modify_result_set_action_id and
# merch_rule_name ='#{@rulename}'")
      # saturn_results.fetch do |row|
        # $saturn_rows <<  row[0].to_int()
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
      # stella_results = $dbhstella.execute("select distinct static_saved_set_id from static_saved_set_owner where business_id = #{@catid} and owner_type in ('CATEGORY_REGISTRY_FEATURED_PRODUCTS','CATEGORY_FEATURED_PRODUCTS','CATEGORY_NAV')
# union
# (select distinct dynamic_saved_set_id from dynamic_saved_set_owner where business_id = #{@catid} and owner_type = 'CATEGORY_NAV')")
      # stella_results.fetch do |row|
        # $stella_rows << row[0].to_int()
      # end
    # end
# 
    # begin
      # if(($saturn_rows - $stella_rows) && ($stella_rows-$saturn_rows)).empty?
# 
        # mlog.info "Compared Saturn DB aganist Stella DB and test is pass for rule name -#{@rulename}"
        # mlog.info "values in Stella DB is : #{$stella_rows}"
        # mlog.info "values in Saturn DB is : #{$saturn_rows}"
# 
        # format = Spreadsheet::Format.new :color => :green,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmids.row($mirds)
        # row[0] = @rulename
        # row[1] = "PASS"
        # row.set_format(1, format)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
        # if($cnt_att==125)
          # mlog.info "context attribute count is #{$cnt_att}"
          # row[4] = "#{$cnt_att}"
        # else
          # row[4] = "#{$cnt_att}"
          # row.set_format(4, format1)
          # mlog.error "context attribute count not matching....."
        # end
# 
        # row[5] = "Category Hierarchy"
# 
        # if($inherit_type==3)
          # mlog.info "Inherit type is FROM Child"
          # row[6] = "#{$inherit_type}"
        # else
          # row[6] = "#{$inherit_type}"
          # row.set_format(6, format1)
          # mlog.error "Inherit type is not matching....."
        # end
# 
        # if($catgory_id.to_i==@catid)
          # mlog.info "Catrgory id is #{$catgory_id} "
          # row[7] = "#{$catgory_id}"
        # else
          # row[7] = "#{$catgory_id}"
          # row.set_format(7, format1)
          # mlog.error "category id is not matching....."
        # end
# 
      # else
# 
        # mlog.error "Compared Saturn DB aganist Stella DB and test is fail for rule name -#{@rulename}"
        # mlog.info "values in Stella DB is : #{$stella_rows}"
        # mlog.info "values in Saturn DB is : #{$saturn_rows}"
# 
        # format = Spreadsheet::Format.new :color => :red,
        # :weight => :bold,
        # :size => 10
# 
        # row = $sheetmids.row($mirds)
        # row[0] = @rulename
        # row[1] = "FAIL"
        # row.set_format(1, format)
        # row[2] = "#{$stella_rows.join(" ")}"
        # row[3] = "#{$saturn_rows.join(" ")}"
# 
      # end
    # rescue Exception => exc
      # mlog.fatal(exc)
    # ensure
      # $bookmids.write $mids_result_excel
      # $mirds =$mirds+1
      # mlog.info "=================================================================================="
    # end
  # end
# end

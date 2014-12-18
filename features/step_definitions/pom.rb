require 'date'
include Test::Unit::Assertions
include CommonMethods

Given(/^I have logged into Stella as a Merchandise Manager$/) do
  visit_page StellaLoginPage
  on_page StellaLoginPage do |page|
  page.login_for("superbauser","haht")
  end
end

Given(/^I have logged into Stella as a Merchandise Manager as mmuser$/) do
  visit_page StellaLoginPage
  on_page StellaLoginPage do |page|
    page.login_for("mmuser","haht")
  end
end

Given(/^I have logged into Saturn as a Merchandise user$/) do
  visit_page SaturnLoginPage
  on_page SaturnLoginPage do |page|
    if @browser.find_element(:xpath,"//span[@class='ui-button-text']").text == "Go"
      page.wait_for_ajax
      else
      page.login_in_saturn("mmuser","haht")
    end
  end
end

Given(/^I have logged into Saturn as a Merchandise user as mmuser$/) do
  visit_page SaturnLoginPage
  on_page SaturnLoginPage do |page|
    if @browser.find_element(:xpath,"//span[@class='ui-button-text']").text == "Go"
      on(SaturnLoginPage).link_element(:xpath => "//*[@id='mUser']/a").click
      sleep 5
      page.login_in_saturn("mmuser","haht")
      else
      page.login_in_saturn("mmuser","haht")
    end
  end
  
end

Then(/^I should see same "(.*?)" in both the saturn and stella data bases$/) do |content|
  if(($saturn_rows - $stella_rows) && ($stella_rows-$saturn_rows)).empty?
  else
  end
end

Then(/^I should see same "(.*?)" in saturn UI and stella UI$/) do |content|
  if content.include?("Rdpp_rule")
    if ($stella_rows - $rdppuivalues).empty?
    else
      raise "Mismatching rddp actions..."
    end
  end

  if content.include?("Display name,Effective Date,Expiration Date")
  end

  if content.include?("Saved Set ID, Saved Query ID")
    if(($ssqid - $stella_rows) && ($stella_rows-$ssqid)).empty?
    else
      raise "expected facets missing...."
    end
  end

end

When(/^I enter "(.*?)" as "(.*?)" for "(.*?)" facet name$/) do |indate,eindate,facetname|
  on_page CategoryOverview do |page|
    page.enterDate(eindate)
  end
end

When(/^I enter "(.*?)" as "(.*?)" for the facet "(.*?)"$/) do |displayname,displaytext,facetname|
if facetname=="which Inherited type is Y" && displayname=="sequence"
on(CategoryOverview).text_field_element(:xpath => "//table/tbody[@class='yui-dt-data']/tr[#{@typen+1}]/td[1]/div/input").value=displaytext
elsif facetname=="which Inherited type is Y" && displayname=="displayname"
on(CategoryOverview).text_field_element(:xpath => "//table/tbody[@class='yui-dt-data']/tr[#{@typen+2}]/td[3]/div/input").value=displaytext  
else
on(SaturnCreateRulePage).text_field_element(:xpath => "//td[@id='colC']/input[preceding::td[1][text()='#{facetname}']]").value=displayname
end
end

When(/^I click the "(.*?)" button and click on "(.*?)" button$/) do |add,done|
  on_page CategoryOverview do |page|
    page.clickAddandDone
  end
end

Then(/^I should not see rule name as "(.*?)"$/) do |cid|
  on_page SaturnRulesListPage do |page|
    page.norulesfound
  end
end

When(/^I search for rule name with created category id in Stella as "(.*?)"$/) do |rulename|
  on_page SaturnHomePage do |page|
    if rulename.include?("RDPP_Rule")
      @rulename = rulename
    page.search_for_rule(rulename)
    elsif rulename.include?("subcategoryid")
      page.search_for_rule("#{$subcategory}_CatHierarchy_Facets")
    elsif rulename.include?("parentcategoryid")
      page.search_for_rule("#{$parentcategory}_CatHierarchy_Facets")
    else
      page.search_for_rule(rulename)
      #("#{$dbcid}_#{rulename[11..-1]}")
    end
  end
end

When(/^I search for "(.*?)" as "(.*?)" from "(.*?)"$/) do |searchoption, searchvalue,searchmodule|
if @current_rule_name.nil?
on(SaturnHomePage).search_for_rule(searchvalue)
else
if @current_rule_name.include?(searchvalue)
on(SaturnHomePage).search_for_rule(@current_rule_name)
end  
end
end

When(/^I search "(.*?)" as "(.*?)" in "(.*?)"$/) do |tgn,tgv,page|
on(FindTriggerGroup).findtriggergroup_element.select("Trigger Group Name")
on(FindTriggerGroup).wait_for_ajax
on(FindTriggerGroup).triggergroupname=tgv
on(FindTriggerGroup).wait_for_ajax
@browser.action.send_keys(:tab).perform
on(FindTriggerGroup).gobutton_element.click
on(FindTriggerGroup).wait_for_ajax
sleep 20
end


When(/^I click "(.*?)" from rulelisting page$/) do |ruleid|
  on_page SaturnRulesListPage do |page|
    page.waitforruledetailpage
  end
end

Then(/^I should see rule name as "(.*?)"$/) do |rulename|
  on_page SaturnRuleDetailPage do |page|
   if !page.rddpnoresults?
    if rulename.include?("CatHierarchy_Facets")
    page.getFacetDetails
    elsif rulename.include?("CatHierarchy_RDPP")
    page.getRdppDetails
    elsif rulename.include?("CatHierarchy_ModifyResults")
    page.getSavedSetQueryDetails
    end
  end
 end 
end

Then(/^I should see "(.*?)" in saturn UI as same as stella$/) do |con,table|
acfacet = Array.new
table.raw.each do |at|
  acfacet << at.join("")
end

if ((acfacet - $suivalues).empty?) && ($suivalues.length/5 == acfacet.length)
  
  for i in 0..$suivalues.length-1
  if $stella_rows.include?($suivalues[i])
  else
    raise "facets values not matching...."
  end
  end 
  
else
  raise "facets missing..."
end
end

When(/^I select "(.*?)" from below Create drop down and click go button$/) do |ct|
  on_page StellaHomePage do |page|
    page.create_item(ct)
  end
end

When(/^I remove "(.*?)" facets$/) do |facetname|
  on_page CategoryOverview do |page|
    page.removefacet(facetname)
  end
end

When(/^I remove "(.*?)" RDPPs$/) do |actionname|
  on_page CategoryOverview do |page|
    page.removefacet(actionname)
  end
end

Then(/^I should see "(.*?)" pages$/) do |ct|
  on_page StellaHomePage do |page|
    page.verifyPageElement
  end
end

When(/^I create a category as "(.*?)" in stella$/) do |cn|
  steps %{
    Then I connect to the stella database
  }

  if cn.include?("parentcategory")
    $parent_category_name="#{cn}"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  $category_name =  $parent_category_name
  elsif cn.include?("childcategory")
    $child_category_name="#{cn}"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  $category_name = $child_category_name
  elsif cn.include?("createsubcategory")
    $subcategoryname ="#{cn}"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  $category_name =$subcategoryname
  else
    $category_name="#{cn}"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  end
  on_page StellaHomePage do |page|
    page.create_category($category_name)
  end
end

When(/^I create a category as "(.*?)" in stella with "(.*?)" as "(.*?)"$/) do |cn,browvalue,browtype|
  $category_name="#{cn}"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  sleep 5
  $arc ="Associate Reference Category"
  on_page StellaHomePage do |page|
    page.selectbrowsertype(browvalue)
    page.create_category($category_name)
  end
end

When(/^I click on "(.*?)" link$/) do |editlink|

end

Then(/^I should see Category name crated with unique "(.*?)" in stella$/) do |categoryid|
  on_page CategoryOverview do |page|
    page.verifycategoryoverciew
  end
end

When(/^I Hover "(.*?)" in Category home page and add "(.*?)"$/) do |link1,link2|
  on_page CategoryOverview do |page|
    page.createFacet(link1,link2)
  end
end



When(/^I select "(.*?)" from Select Facets list box$/) do |facet,table|
  on_page CategoryOverview do |page|
    table.raw.each do |fn|
      page.addingSelectedFacets(fn.join(""))
    end
  end
end

When(/^I select "(.*?)" from Business Rules drop down with following "(.*?)" and "(.*?)"$/) do |attribute,sd,ed,table|
  $dt =1
  on_page CategoryOverview do |page|
    table.raw.each do |at,sde,ede|

      @browser.find_element(:xpath,"//*[@id='add-rdpp-action']/img").click
      sleep 4
      page.addingRpddattributes(at,sde,ed)
    end
  end
end

When(/^I Hover "(.*?)" in Category home page and select "(.*?)"$/) do |cp,rp|
  on_page CategoryOverview do |page|
    page.createRdpp(cp,rp)
  end
end

When(/^I remove "(.*?)" by clicking "(.*?)" link under action column$/) do |text1,text2,table|
  on_page CategoryOverview do |page|
    table.raw.each do |fn|
      page.removefacet(fn.join(""))
    end
  end
end

When(/^I save facets$/) do
  on_page CategoryOverview do |page|
    page.savefacet
  end
end

When(/^I click "(.*?)" button to save "(.*?)"$/) do |save,actiontype|
  $saturn_rows = Array.new
  $stella_rows = Array.new
  $facet_ids  =   Array.new
  if !save.include?("home tab")
    on_page CategoryOverview do |page|
      page.savefacet
      sleep 5
  end
  end
end

When(/^I save the selected facets$/) do
  on_page CategoryOverview do |page|
    page.savefacet
    $saturn_rows = Array.new
    $stella_rows = Array.new
    $facet_ids  =   Array.new
    steps %{
    Given I connect to the database
    Then I connect to the stella database
    Then I connect to attribute data base
  }

    saturn_results = $dbhsaturn.execute("select df.sequence_number,df.facet_name,df.dest_display_name,df.collapse_flag,to_char(df.start_date,'mm/dd/YYYY'),to_char(df.end_date,'mm/dd/YYYY') from display_facet df, display_facet_action dfa,
merch_action ma,merch_rule mr,merch_rule_action_assn mraa where
mr.merch_rule_id = mraa.merch_rule_id and
mraa.merch_action_id = ma.merch_action_id and
ma.merch_action_id = dfa.merch_action_id and
dfa.display_facet_action_id = df.display_facet_action_id and
mr.merch_rule_name = '#{$dbcid}_CatHierarchy_Facets' and
mr.site_tenant='MCOM' order by sequence_number")
    saturn_results.fetch do |row|
      $saturn_rows <<  "#{row[0].to_int()}"
      $saturn_rows << "#{row[1]}"
      $saturn_rows <<  "#{row[3]}"
      $saturn_rows <<  "#{row[4]}"
      $saturn_rows <<  "#{row[5]}"
    end
    ##{$dbcid}

    stella_results = $dbhstella.execute("select distinct sequence,facet_id,collapsed_flag,to_char(start_date,'mm/dd/YYYY'),to_char(end_date,'mm/dd/YYYY') from category_facet where category_id ='#{$dbcid}' and end_date >= sysdate and INHERITANCE_FLAG='N' order by sequence")
    stella_results.fetch do |row|
      $stella_rows << "#{row[0].to_int()}"
      $facet_ids << "#{row[1].to_int()}"
      $stella_rows << "#{row[2]}"
      $stella_rows << "#{row[3]}"
      $stella_rows << "#{row[4]}"
    end

    @j=1

    $facet_ids.each do |i|
      facetids = $dbattri.execute("select distinct attribute_name from attribute_def where attribute_id ='#{i}' and tenant_id='MCOM'")
      facetids.fetch do |row|
        $stella_rows.insert(@j, "#{row[0]}")
        @j=@j+5
      end
    end
  end
end

When(/^I search for "(.*?)" with "(.*?)" and "(.*?)"$/) do |mp,ip,sp|
  on_page StellaHomePage do |page|
    if ip !="category_id"
    page.searchforcategoriesfromstella(mp,ip,sp)
    else  
    page.seachingforcategorywithtype(mp,sp,ip)
    end
  end
end

When(/^I add "(.*?)" on child window by selecting "(.*?)" and entering "(.*?)" and clicking on "(.*?)" button$/) do |assq,ssid,ssvalue,find|
  # steps %{
    # Then I connect to the stella database
  # }
#   
# if ssid == "Saved Set Name"
# @query = "select set_name from dynamic_saved_set where rownum<=1 order by dynamic_saved_set_id desc"
# elsif ssid == "Saved Query Name"
# @query = "select query_name from dynamic_saved_set_query where rownum<=1 order by dynamic_saved_set_query_id desc" 
# end
# results = $dbhstella.execute(@query)
# results.fetch do |row|
  # @ssvalue="#{row.join}"
# end

  on_page CategoryOverview do |page|
    page.add_associate_saveedset_or_query(ssid,ssvalue,assq)
  end
end

When(/^I select "(.*?)" by checked check box for first page and click "(.*?)"$/) do |id,addselected|
  on_page CategoryOverview do |page|
    page.select_saved_set_checkbox_id(id)
  end
end

Then(/^I should see trigger type as "(.*?)"$/) do |triggertype|
 on(SaturnRuleDetailPage).triggertype_element.selected?(triggertype).should be_true
end

Then(/^I should see category id as "(.*?)"$/) do |categoryid|
on(SaturnCreateRulePage).addtrigger(@scnt).enter_category_ids?.should == true
end

Then(/^I should see Inherit as "(.*?)"$/) do |inherittype|
  on(SaturnRuleDetailPage).inherittypes_element.selected?(inherittype).should be_true
end

Then(/^I should see Effective Date as "(.*?)"$/) do |startdate|
  if @browser.find_element(:xpath, "//input[@id='startDate']").attribute('value').eql? DateTime.now.strftime('%m/%d/%Y')
    else
    raise "start date not matching..."
  end
end

Then(/^I should see Expiration Date as "(.*?)"$/) do |enddate|
  if @browser.find_element(:xpath, "//input[@id='endDate']").attribute('value').eql? enddate
    else
    raise "end date not matching..."
  end
end

Then(/^I should see action type as "(.*?)"$/) do |actiontype|
  on(SaturnRuleDetailPage).actiontypes_element.selected?(actiontype).should be_true
end
Then(/^I should see select option as "(.*?)"$/) do |operator|
  if @browser.execute_script("var x = document.getElementById('selectOperator0').selectedIndex;
  var y = document.getElementById('selectOperator0').options;
  return y[x].text").eql? operator
    else
    raise "operator not matching..."
  end
end

Then(/^I should see Context Attributes Trigger created with default values$/) do
  on_page SaturnRuleDetailPage do |page|
    page.contextattributecheck
  end
end

Then(/^I should see Rule Priority as "(.*?)"$/) do |priorityvalue|
  @browser.find_element(:xpath, "//select[@id='rulePriority']/option[@selected='selected' and @value='#{priorityvalue}']").displayed?
end

Then(/^I should see created rule in read only mode$/) do
  on(SaturnRuleDetailPage).editinrulesdetailed_element.should be_disabled
end

Then(/^I should see Publish Flag "(.*?)"$/) do |publishflag|
  on(SaturnRuleDetailPage).button_element(:xpath => "//button[@id='rulePublish' and text()='#{publishflag}']").should exist
end

Then(/^I should see KEEP_EXISTING_FLAG as "(.*?)" in display_facet_action TABLE  if the selected$/) do |status|
  steps %{
    Given I connect to the database
  }

  saturn_inherit = $dbhsaturn.execute("select keep_existing_flag from display_facet_action where merch_action_id=
    (SELECT merch_action_id FROM merch_rule_action_assn WHERE MERCH_RULE_ID=
    (SELECT MERCH_RULE_ID FROM merch_rule WHERE MERCH_RULE_name='#{$dbcid}_CatHierarchy_Facets'))")
  saturn_inherit.fetch do |row|
    $inherit_status = "#{row[0]}"
  end
  if $inherit_status .eql? status
    else
    raise "keep_existing_flag not matching...."
  end
end

Then(/^I should not see "(.*?)" as facet which is not associated to "(.*?)"$/) do |facetname, categoryid|
end

Then(/^I should see KEEP_EXISTING_FLAG as "(.*?)" in display_facet_action TABLE for "(.*?)"$/) do |status,catename|

  if catename.include?("createsubcategory")

  @val = $subcategory

  elsif catename.include?("parentcategory")
  @val = $parentcategory
  
  end

  steps %{
    Given I connect to the database
  }

  saturn_inherit = $dbhsaturn.execute("select keep_existing_flag from display_facet_action where merch_action_id=
    (SELECT merch_action_id FROM merch_rule_action_assn WHERE MERCH_RULE_ID=
    (SELECT MERCH_RULE_ID FROM merch_rule WHERE MERCH_RULE_name='#{@val}_CatHierarchy_Facets'))")
  saturn_inherit.fetch do |row|
    $inherit_status = "#{row[0]}"
  end
  if $inherit_status .eql? status
    else
    raise "keep_existing_flag not matching...."
  end
end

Then(/^I should see "(.*?)" only checked by default which is under "(.*?)" context attribute type$/) do |contextatt, contextatttype|
  if($cnt_att==120)
    else
    raise "context attribute count is not matching..."
  end
end

When(/^I click START EDITING Button$/) do
  @browser.find_element(:xpath,"//ul[@id='title-buttons']/li[3]/a/img").click
  on(CategoryOverview).wait_for_ajax
  sleep 7
  # attempts=0
  # begin
    # @browser.find_element(:xpath,"//span[text()='#{$gct}']").click
    # sleep 6
  # rescue Selenium::WebDriver::Erro => e
    # attempts=attempts+1
    # retry unless attempts > 10
  # ensure
    # if(attempts > 10)
      # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    # end
  # end
end

When(/^I checked "(.*?)" option in Overview section$/) do |facetstop|
  on_page CategoryOverview do |page|
    page.stopfacet
  end
end

When(/^I click SAVE CHANGES Button$/) do
  on_page CategoryOverview do |page|
    page.savefacet
  end
end

When(/^I navigate to stella "(.*?)" Page$/) do |homepage|
  on_page StellaHomePage do |page|
    page.stellahome
  end
end

When(/^I click "(.*?)" link to add "(.*?)"$/) do |findlink,parentcat|
  on_page CategoryOverview do |page|
    page.findparentcategory
  end
end

Then(/^I should see rule which is not associated with any of one the facets$/) do
  @browser.find_element(:xpath, "//table[@id='displayFacetsTable']/tbody[count(tr)=1]").displayed?
end

When(/^I enter display name as "(.*?)"$/) do |displayname|
  on_page CategoryOverview do |page|
    page.enterdisplayname(displayname)
  end
end

Then(/^I should see Displayname as "(.*?)"$/) do |displayname|
  if @browser.find_element(:xpath, "//table[@id='displayFacetsTable']/tbody/tr/td[text()='Brand']/following-sibling::td[1]/input").attribute('value').eql? displayname
    else
    raise "display name not matching..."
  end
end

When(/^I search for "(.*?)" through "(.*?)" link and selecting "(.*?)"$/) do |categoryname,ads,categorytype|
  on_page CategoryOverview do |page|
    page.advancedsearchcategory
  end
end

Then(/^I should see "(.*?)" with "(.*?)" in advanced search page$/) do |catlist,actions|
 if catlist.include?("rddp")
 $stella_rows = Array.new
 actiontype ="CatHierarchy_RDPP"
  steps %{
Given I connect to the database
Then I connect to the stella database
Then I connect to attribute data base
}


context_att =  $dbhsaturn.execute("select count(*) from context_trig_value ctv ,me$dbcidrch_rule mr,merch_rule_trigger_assn mrta,context_trig ct where
ct.context_trig_id = ctv.context_trig_id and
ct.merch_trig_id = mrta.merch_trig_id and

mr.merch_rule_id = mrta.merch_rule_id and
mr.merch_rule_name ='#{$dbcid}_#{actiontype}'")

  context_att.fetch do |row|
    $cnt_att =  row[0].to_int()
  end

    stella_results = $dbhstella.execute("select rr.rdpp_rule_id ||' - '|| rr.rule_name ,to_char(rrc.start_date,'mm/dd/yyyy'),to_char(rrc.end_date,'mm/dd/yyyy') from rdpp_rule_category rrc,rdpp_rule rr where rrc.rdpp_rule_id = rr.rdpp_rule_id and
rrc.category_id = '#{$dbcid}' and rrc.end_date > to_timestamp(sysdate)")
    stella_results.fetch do |row|
      $stella_rows << "#{row[0]}"
      $stella_rows << "#{row[1]}"
      $stella_rows << "#{row[2]}"
    end
else 
  on_page StellaAdvancedPage do |page|
    page.waitforAdvanced_Search_page
  end
end
end

When(/^I create "(.*?)" by selecting "(.*?)" from Actions with rddp algorithm type as "(.*?)" and effective date as "(.*?)" and expiration data as "(.*?)"$/) do |rdpp,cha,rdppalg,startdate,enddate|
  on_page StellaAdvancedPage do |page|
    page.createdrdppbyadvancedsearch(rdppalg,enddate)
  end
end

When(/^I add "(.*?)" from Advanced Search by clicking "(.*?)" with "(.*?)" action type$/) do |actiontype,chaatt,action,table|
  facet_vals = table.raw
  on_page StellaAdvancedPage do |page|
    page.createfacetsbyadvancedsearch(facet_vals,action)
  end
end

Then(/^I should see rule as "(.*?)"$/) do |rulename|
  if @browser.find_element(:xpath, "//input[@id='name']").attribute('value').eql? rulename
    else
    raise "rule name not matching..."
  end
end

Then(/^I should see row inserted into "(.*?)" for "(.*?)" as values respectively "(.*?)"$/) do |tablename,fields,values|
  steps %{
    Given I connect to the database
    Then I connect to the stella database
  }

  $saturn_rows = Array.new
  $rdpp_rule_ids  =   Array.new
  saturn_results = $dbhsaturn.execute("select rdpp_rule_id ,publish_flag,to_char(to_date(effective_date,'dd-mon-yy'),'mm/dd/yyyy'),to_char(to_date(expiration_date,'dd-mon-yy'),'mm/dd/yyyy') from rdpp_assignment ra,
merch_rule mr,merch_rule_action_assn mraa,merch_action ma
where mr.merch_rule_id = mraa.merch_rule_id and
ma.merch_action_id = mraa.merch_action_id and
ma.merch_action_id = ra.merch_action_id and
mr.site_tenant='MCOM' and
merch_rule_name = '#{@rulename}'")
  saturn_results.fetch do |row|
    $rdpp_rule_ids <<  "#{row[0].to_int()}"
    $saturn_rows <<  "#{row[1]}"
    $saturn_rows <<  "#{row[2]}"
    $saturn_rows <<  "#{row[3]}"
  end

  @rd=0

  $rdpp_rule_ids.each do |i|
    rdpp_rule_name=$dbhstella.execute("select rule_name from rdpp_rule where rdpp_rule_id=#{i}")
    rdpp_rule_name.fetch do |drow|
      $saturn_rows.insert(@rd, "#{i} - #{drow[0]}")
      @rd=@rd+3
    end
  end

  if ($saturn_rows - values.split(",")).empty?
  else
    raise "Failed"
  end

  catcnt= $dbhsaturn.execute("select count(*) from context_trig_value ctv ,merch_rule mr,merch_rule_trigger_assn mrta,context_trig ct where
ct.context_trig_id = ctv.context_trig_id and
ct.merch_trig_id = mrta.merch_trig_id and

mr.merch_rule_id = mrta.merch_rule_id and
mr.merch_rule_name ='#{@rulename}' and mr.site_tenant= 'MCOM'")
  catcnt.fetch do |row|
    $cnt_att =  row[0].to_int()
  end

end

Then(/^I should see row inserted into "(.*?)" for number of checked context attributes would be "(.*?)" and "(.*?)" only checked$/) do |cnt,num,checkedatt|
  if($cnt_att==120)
    @browser.find_element(:xpath, "//input[@checked='checked']/following-sibling::span[text()='#{checkedatt}']").displayed?
  else
    raise "context attribute count is not matching..."
  end
end

Then(/^I select "(.*?)" from "(.*?)" drop down and enter categoryname as "(.*?)" and click "(.*?)" button$/) do |catename,findb,cate2name,findb2|
  on_page CategoryOverview do |page|
    page.selectCategoryFromFindCategory
  end
end

When(/^I connect to "(.*?)" database$/) do |dbname|
end

When(/^I unchecked "(.*?)" option in Overview section$/) do |facetstop|
  on_page CategoryOverview do |page|
    page.uncheckfacet
  end
end

Then(/^I should see selected Rdpp algorithm as "(.*?)"$/) do |rdppalgo|
   @browser.execute_script("var x = document.getElementById('dropdownRDPPRule0_0').selectedIndex;
      var y = document.getElementById('dropdownRDPPRule0_0').options;
       return y[x].text")
end

Then(/^I should see Owner as "(.*?)"$/) do |user|
  @browser.find_element(:xpath,"//div[@class='rowOne']/div[2]/label").text.eql? user
end

Then(/^I should see Modified By as "(.*?)"$/) do |user|
  @browser.find_element(:xpath,"//div[@id='modifiedBy']/div[2]/label").text.eql? user
end

When(/^I click start editing button$/) do
  @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
  sleep 3
  on(CategoryOverview).categotyid_element.when_present
end

When(/^I click add saved set button$/) do
  #@browser.find_element("//a[@id='add-savedset-action']/img").click
  #sleep 4
end

When(/^I add saved set from Add Saved Set window by selecting "(.*?)" with "(.*?)" than cliking "(.*?)" button and checking "(.*?)" check box$/) do |savedsetname,val,findbutton,savedsetid|
   on_page CategoryOverview do |page|
    page.createsavedsetname(savedsetname,val,findbutton,savedsetid)
  end
end

Then(/^I should see featured products created$/) do
  sleep 9
end

Then(/^I should see saved set ID as the id which is selected checkbox from Add saved set menu in stella$/) do
  stellassid = Array.new
  $ssid.each do |i|
    stellassid << i.to_i
  end
  if(stellassid-$ssqid).empty?
  else
    raise "saved set ids miss mtching....."
  end
end

When(/^I click Registry tab$/) do
  @browser.find_element(:xpath,"//li[@id='registry-tab']/a").click
end

When(/^I remove "(.*?)" from "(.*?)"$/) do |remove,men|
   if men=="sequence text field"
     on(SaturnCreateRulePage).addaction[@mrs].sequence_element.clear
   elsif men=="showfaces displaying table"
     on(SaturnRuleDetailPage).checkbox_elements(:xpath => "//input[contains(@id,'cbox_testing') and @checked='checked']").each{|c| c.uncheck}
   elsif men=="stella facet page which Inherited type is N"
     on(CategoryOverview).link_element(:xpath => "//*[@id='yui-rec2']/td[8]/div/a").click
     sleep 2
     on(CategoryOverview).button_element(:xpath => "//div[@class='ft']/span/span/span/button[text()='Yes']").click
   else
   @browser.find_element(:xpath,"//div[@id='dotcom-table' or @id='registry-table']/table/tbody[@class='yui-dt-data']/tr[1]/td/div/a[text()='remove']").click
   sleep 3
   end
end

When(/^I remove "(.*?)" from "(.*?)" for "(.*?)"$/) do |displayname,dnfield,facet|
  on(SaturnCreateRulePage).text_field_element(:xpath => "//td[text()='#{facet}']/following-sibling::td/input[not(@*)]").clear
end

Then(/^I should see "(.*?)" removed from "(.*?)"$/) do |ssid,sc|
 if sc.include?("display name section")
 on(CategoryOverview).getindex[ssid].display_name_removal_element.should_not be_visible
 else
 $ssid=Array.new
  @mrscount=@browser.find_elements(:xpath, "//div[@id='dotcom-table' or @id='registry-table']/table/tbody[@class='yui-dt-data']/tr").size
    for l in 1..@mrscount
      $ssid << @browser.find_element(:xpath, "//div[@id='dotcom-table' or @id='registry-table']/table/tbody[@class='yui-dt-data']/tr[#{l}]/td[1]/div/a").text
    end
   end 
end

When(/^I remove "(.*?)" from rddp details child window$/) do |rddptype|
  on(StellaAdvancedPage).deleterdppbyadvancedsearch(rddptype)
end

Then(/^I should see selected rdpp algorithm as "(.*?)" and rdpp effective data as "(.*?)" and rdpp expiration data as "(.*?)"$/) do |rdpps,rdppstart,rdppend|
   on(SaturnRuleDetailPage).search_results
   if rdpps.include?(",")
     nrdpps =rdpps.split(",")
   for i in 0..nrdpps.length-1
     on(StellaAdvancedPage).checkConditions($exprdd.join(" ,").include?nrdpps[i])
   end
   for i in 0..$expsedates.length-1
     on(StellaAdvancedPage).checkConditions($stella_rows.include?$expsedates[i])
   end
   else
     on(StellaAdvancedPage).checkConditions($exprdd.join(" ,").include?rdpps)
     for i in 0..$expsedates.length-1
     on(StellaAdvancedPage).checkConditions($stella_rows.include?$expsedates[i])
   end  
       
   end
end

When(/^I reomve the subcategories from stella$/) do
  on(CategoryOverview).deletesubcategory_element.click
  @browser.action.send_keys(:return).perform
end

When(/^I navigate to "(.*?)" from "(.*?)"$/) do |lr,mr|
   if mr=="trigger group detail page"
     sleep 6
   elsif mr =="rules detailed page"
   on(SaturnCreateRulePage).wait_for_ajax   
     sleep 5
     wait_for_js_pom
   else    
   on(SaturnHomePage).NavigateToRulesListing
   end
end

Then(/^I should see "(.*?)" as defult filter option$/) do |filteroption|
  on(SaturnRulesListing).filteroptions_element.selected?(filteroption).should be_true
end

Then(/^I should see "(.*?)" filter options available in Merchandising Rules page$/) do |filteroptions|
   @rulenames = Hash.new
   steps %{
            Given I connect to the database
    }
   
   filteroptions.split(",").each do |s|
   on(SaturnRulesListing).filteroptions_element.should include s
   results = $dbhsaturn.execute("select * from (select merch_rule_name from merch_rule where site_tenant='#{$yml_file['sitetenant']}' and nav_type_name = '#{s.upcase}') where ROWNUM =1")
   results.fetch do |row|
    @rulenames[s]="#{row.join}"
   end
   end
end

When(/^I search for "(.*?)" as "(.*?)" by filter options as "(.*?)"$/) do |iv,filtertype,filteroption|
  sleep 5
  if @current_trigger_group.empty?
  on(SaturnRulesListing).FilterByoptions(filtertype,iv,filteroption)
  else
  iv=@current_trigger_group
  on(SaturnRulesListing).FilterByoptions(filtertype,iv,filteroption)
  end
end

When(/^I navigate to rule detail page by clicking one of rule id$/) do
    on(SaturnRulesListing).clickruleid_element.click
    on(SaturnRulesListing).wait_for_ajax
    sleep 4
end

When(/^I click Return to Merchandising Rule link$/) do
  on(SaturnRuleDetailPage).rtmr_element.click
  on(SaturnRulesListing).wait_for_ajax
  sleep 4
end

Then(/^I Should see "(.*?)" in Display Name drop down$/) do |displaynames|
  displaynames.split(",").each do |s|
   on(CategoryOverview).displaynames_element.should include s
   end
   @index=0
end

When(/^I select "(.*?)" from drop down and I enter "(.*?)" as value in text field$/) do |dp,dv|
  on(CategoryOverview).dropdown[@index].display_name_element.select(dp)
  on(CategoryOverview).dropdown[@index].display_name_text = dv
end

When(/^I uncheck "(.*?)" in "(.*?)"$/) do |val1,page|
if page=="select attribute values window"
  uncheckattributes=val1.split(",")
  for i in 0..uncheckattributes.length-1
  on(SaturnCreateRulePage).addaction[uncheckattributes[i]].checkattributevalues_element.uncheck
  end
elsif page=="select facet window"
 on(SaturnCreateRulePage).addaction[val1].facetvalue_element.uncheck
else
on(SaturnCreateRulePage).addtrigger[@scnt].uncheck_include_all_children
end
end

When(/^I check "(.*?)" in "(.*?)"$/) do |val1,page|
on(SaturnCreateRulePage).addtrigger[@scnt].check_include_all_children
end

When(/^I click "(.*?)" in "(.*?)"$/) do |anlink,cpage|
  if anlink.include?("Add another")
  on(CategoryOverview).addanother_element.click
  @index =@index+1
  elsif anlink.include?("Save Changes")
    on(CategoryOverview).savechanges_element.click
    on(CategoryOverview).wait_for_ajax
    on(CategoryOverview).categotyid_element.when_present
    sleep 4
  elsif cpage=="context change window"
    on(SaturnCreateRulePage).button_element(:xpath => "//div[contains(@class,'ui-dialog ui-widget') and contains(@style,'display: block;')]/div/div/button[child::span[text()='#{anlink}']]").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif anlink=="Apply to all non-media actions to uncheck"
     on(ContextActions).check_apply_to_all_non_media_actions(@context,"Apply to all non-media actions").uncheck
  elsif anlink=="trigger group name link"
    $mytr=1
    on(FindTriggerGroup).link_element(:xpath => "//table[@id='TBLtrigger']/tbody/tr[1]/td[1]/a").click
    on(FindTriggerGroup).wait_for_ajax
    sleep 3
  elsif anlink=="All Mobile"
    on(ContextActions).image_element(:xpath => "//img[following-sibling::label[text()='#{anlink}'] and ancestor::div[@id='divActionContextContainer#{@context}']]").click
  elsif anlink=="trigger group clear link"
    on(FindTriggerGroup).span_element(:xpath => "//span[text()='[clear]']").click
    on(FindTriggerGroup).wait_for_ajax
  elsif cpage=="Select Facet Window in AutoSuggestion page"
    on(SaturnAutoSuggestionRule).button_element(:xpath => "//div[@id='editFacets']/following-sibling::div/div/button/span[text()='#{anlink}']").click
    sleep 2
  elsif cpage=="Select Facets and Text Window in AutoSuggestion page"
    on(SaturnAutoSuggestionRule).button_element(:xpath => "//div[@id='editDisplayPattern']/following-sibling::div/div/button/span[text()='#{anlink}']").click
    sleep 2   
  elsif anlink=="context container"
    if cpage=="RDPP Algorithm action"
     if @val.nil?
     on(ContextActions).contextservice[@rdpp].context_container_element.click
      @context = @rdpp
      sleep 2
      else
      on(ContextActions).contextservice[@context].context_container_element.click
      sleep 3
      end
    elsif cpage=="Show Media action"
     if @val.nil?
     on(ContextActions).contextservice[@sm].context_container_element.click
     @context = @sm
      sleep 2
      else
      on(ContextActions).contextservice[@context].context_container_element.click
      sleep 3
      end
    elsif cpage=="URL Redirect action"
     on(ContextActions).contextservice[@ur].context_container_element.click
     @context = @ur
      sleep 2
    elsif cpage=="Display Message action"
     if @val.nil?
     on(ContextActions).contextservice[@dm].context_container_element.click
     @context = @dm
      sleep 2
      else
      on(ContextActions).contextservice[@context].context_container_element.click
      sleep 3
      end
     elsif cpage=="Show Master or Member Products action"
     if @val.nil?
     on(ContextActions).contextservice[@smp].context_container_element.click
     @context = @smp
      sleep 2 
      else
      on(ContextActions).contextservice[@context].context_container_element.click
      sleep 3
      end
     elsif cpage=="Modify Result Set action"
     if @val.nil?
     on(ContextActions).contextservice[@mrs].context_container_element.click
     @context = @mrs
      sleep 2  
      else
      on(ContextActions).contextservice[@context].context_container_element.click
      sleep 3
      end
    end
  elsif anlink=="Next pagination link"
      if @flag
      on(FindTriggerGroup).span_element(:id => "TBLtrigger_next").click
      on(FindTriggerGroup).wait_for_ajax
      end
 elsif anlink=="autosuggestion template id"
   on(SaturnAutoSuggestionRule).link_element(:xpath => "//*[@id='tblTemplates']/tbody/tr[1]/td[1]/a").click
   on(SaturnAutoSuggestionRule).wait_for_ajax
   sleep 4 
 elsif anlink=="Include Synonyms checkbox"
   on(SaturnAutoSuggestionRule).synonmstag_element.check
 elsif anlink=="autosuggestion publish checkbox"
   on(SaturnAutoSuggestionRule).publishtag_element.uncheck
 elsif cpage=="display pattern facet cross mark"
   on(SaturnAutoSuggestionRule).button_element(:xpath => "//td[child::span[text()='#{anlink}']]/following-sibling::td/input[@class='closeImage']").click
 elsif anlink=="apply rule facet edit button"
   on(SaturnAutoSuggestionRule).link_element(:id => "applyRuleEditLink").click
   on(SaturnAutoSuggestionRule).wait_for_ajax
   sleep 4 
 elsif anlink=="autosuggestion Go button"
   on(SaturnAutoSuggestionRule).button_element(:id => "templatesFilterBtn").click
   on(SaturnAutoSuggestionRule).wait_for_ajax 
 elsif anlink=="trigger group add button"
    on(FindTriggerGroup).button_element(:id => "addTriggerBtn").click
    on(FindTriggerGroup).wait_for_ajax
 elsif anlink=="Apply Rule Add Facet button"
   on(SaturnAutoSuggestionRule).applyruleaddfacet
   on(SaturnAutoSuggestionRule).wait_for_ajax
 elsif anlink=="Display Pattern Add Facet button"
   on(SaturnAutoSuggestionRule).displaypatternaddfacet
   on(SaturnAutoSuggestionRule).wait_for_ajax
 elsif anlink=="Add Rule"
   on(SaturnAutoSuggestionRule).addrule
   on(SaturnAutoSuggestionRule).wait_for_ajax
 elsif anlink=="autosuggestion save button"
   on(SaturnAutoSuggestionRule).savesuggestionrule
   on(SaturnAutoSuggestionRule).wait_for_ajax
   sleep 4
 elsif anlink=="autosuggestion cancel button"
   on(SaturnAutoSuggestionRule).ascancel
   on(SaturnAutoSuggestionRule).wait_for_ajax
   sleep 4  
 elsif anlink=="Add Filter"
   on(SaturnCreateRulePage).button_element(:id => "buttonAddFilterId#{@en}").click
   on(SaturnCreateRulePage).wait_for_ajax
   sleep 5
 elsif anlink=="append flag check box"
   on(SaturnRuleDetailPage).checkbox_element(:id => "appendFlag#{@en}").click
 elsif anlink=="Last pagination link"
   if @flag
      on(FindTriggerGroup).span_element(:id => "TBLtrigger_last").click
      on(FindTriggerGroup).wait_for_ajax
      sleep 4
      end
 elsif anlink=="First pagination link"
   if @flag
      on(FindTriggerGroup).span_element(:id => "TBLtrigger_first").click
      on(FindTriggerGroup).wait_for_ajax
      sleep 4
      end
 elsif anlink=="2nd pagination link"
     if @flag
      on(FindTriggerGroup).span_element(:xpath => "//*[@id='TBLtrigger_paginate']/span[3]/span[#{anlink[0..0]}]").click
      on(FindTriggerGroup).wait_for_ajax
      sleep 4
      end
  elsif anlink=="Previous pagination link"
      if @flag
      on(FindTriggerGroup).span_element(:id => "TBLtrigger_previous").click
      on(FindTriggerGroup).wait_for_ajax
      sleep 4
      end
  elsif anlink=="rules detail cancel button"
    on(SaturnRuleDetailPage).button_element(:id => "triggerGroupCancel").click
    on(SaturnRuleDetailPage).wait_for_ajax
  elsif anlink=="See rules using this Trigger Group"
    on(TriggerGroupDetail).tgassociatewithrule_element.click
    on(TriggerGroupDetail).wait_for_ajax
  elsif anlink=="View Rules Details"
    on(TriggerGroupDetail).link_element(:id => "callListRules").click
    on(TriggerGroupDetail).wait_for_ajax
  elsif anlink=="trigger group name"
    on(SaturnRulesListPage).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr/td[10]/a").click
    on(SaturnRulesListPage).wait_for_ajax
    sleep 3
  elsif cpage=="find trigger groups list page"
    on(FindTriggerGroup).span_element(:xpath => "//div[text()='Trigger Group Name']/span").click
    on(FindTriggerGroup).wait_for_ajax
    sleep 5
  elsif anlink=="cancel to remove show media action"
    on(SaturnRuleDetailPage).button_element(:id => "buttonDeleteAction#{@sm}").click 
  elsif anlink=="boost attribute value cross mark"
    on(SaturnCreateRulePage).link_element(:xpath => "//span[text()='#{cpage}']/child::a").click
  elsif cpage=="facets window to make it uncheck"
    on(SaturnCreateRulePage).checkbox_element(:xpath => "//div/label[text()='#{anlink}']/following-sibling::input").uncheck
  elsif cpage=="Trigger Group Alert popup"
    on(SaturnRuleDetailPage).span_element(:xpath => "//div[starts-with(@class,'ui-dialog ui-widget ui-widget-content') and starts-with(@style,'display: block;')]/div/div/button/span[text()='#{anlink}']").click
    on(SaturnRuleDetailPage).wait_for_ajax
  elsif anlink=="facets value cross mark"
    on(SaturnCreateRulePage).link_element(:xpath => "//span[text()='#{cpage}']/child::a").click
  elsif cpage=="select facet window"
    on(SaturnCreateRulePage).span_element(:xpath => "//div[starts-with(@class,'ui-dialog ui-widget ui-widget-conten') and contains(@style,'display: block;')]/child::div/div/button/span[text()='#{anlink}']").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif anlink=="cancel button to remove the changes from actions"
    on(SaturnCreateRulePage).button_element(:id => "buttonDeleteAction#{@myac-1}").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif anlink=="cross mark"
    on(SaturnRuleDetailPage).button_element(:id => "removeButton#{@crp-1}").click
    sleep 3
  elsif anlink=="trigger button"
     on(SaturnCreateRulePage).addtrigger[0].savetrigger
     on(SaturnCreateRulePage).wait_for_ajax   
  elsif cpage=="trigger global operator"
    on(SaturnRuleDetailPage).checkbox_element(:xpath => "//input[@id='triggerGlobalOperator#{anlink}' and following-sibling::label[1][text()='#{anlink.upcase}']]").check
    #on(SaturnRuleDetailPage).checkbox_element(:xpath => "//input[@id='triggerGlobalOperatorAnd' and following-sibling::label[1][text()='#{anlink}']]").check
  elsif anlink=="start editing button"
    @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
    on(StellaHomePage).wait_for_ajax
    sleep 3
  elsif anlink=="cancel button in trigger group usage window"
    on(TriggerGroupDetail).button_element(:xpath => "//div[child::span[text()='Trigger Group Usage']]/following-sibling::div/div/button/span[text()='Cancel']").click
  elsif anlink=="Inherited link"
    on(StellaHomePage).link_element(:xpath => "//*[@id='yui-dt0-th-inherited-liner']/span/a").click
    sleep 2
    @typen = @browser.find_elements(:xpath, "//td[@class='yui-dt0-col-inherited yui-dt-col-inherited yui-dt-asc yui-dt-sortable']/div[text()='N']").size
    sleep 3
  elsif anlink=="addAttributeValue"
    if @plus.nil?
    on(SaturnCreateRulePage).addaction[@mrs].addattributevalue_element.click
    else
      on(SaturnCreateRulePage).button_element(:id => "addAttributeValue_#{@mrs}_#{@plus}").click
    end
    on(SaturnCreateRulePage).wait_for_ajax  
    #sleep 3
  elsif anlink=="ok in select attribute value window" 
    on(SaturnCreateRulePage).okonselecattwindow_element.click
  elsif anlink=="ok on select attribute value window"
   on(SaturnCreateRulePage).okonselect_element.click
  elsif anlink=="boost attribute window ok button"
   on(SaturnCreateRulePage).span_element(:xpath => "//div[@id='editBoostValues']/following-sibling::div/div/button/span[text()='Ok']").click  
  elsif anlink=="cancel in select attribute value window"
    on(SaturnCreateRulePage).cancelonselecattwindow_element.click
  elsif cpage=="select attribute values window"
    on(SaturnCreateRulePage).select_attribute_key_element.select(anlink)
    on(SaturnCreateRulePage).wait_for_ajax 
    sleep 3
  elsif anlink=="show facet product type find button"
    on(SaturnCreateRulePage).button_element(:id => "showFacetFindButtonProduct#{@sf}").click
    on(SaturnCreateRulePage).wait_for_ajax 
  elsif anlink=="showfacet find button"
    on(SaturnCreateRulePage).addaction[@sf].showfacetfindbutton
    on(SaturnCreateRulePage).wait_for_ajax 
  elsif anlink=="add attributes plus"
    on(SaturnCreateRulePage).button_element(:id => "id_add#{@mrs}_#{@plus}").click
    sleep 2
    @plus=@plus+1
  elsif anlink=="includes" || anlink=="excludes"
    on(SaturnCreateRulePage).contextattributescondition_element.click
  elsif anlink=="Include all children and grandchildren etc check box"
    
  elsif anlink=="Go" && cpage=="category home page"
    on(StellaHomePage).searchgo
    wait_for_js_pom
    sleep 7
  elsif anlink=="filter trigger go button"
    on(FindTriggerGroup).gobutton_element.click
    on(FindTriggerGroup).wait_for_ajax
  elsif anlink=="Copy button"
    on(SaturnRuleDetailPage).copybutton_element.click
    on(SaturnRuleDetailPage).wait_for_ajax
  elsif anlink=="edit action"
   if @myac.nil?
   on(SaturnCreateRulePage).addaction[0].saveaction
   on(SaturnCreateRulePage).wait_for_ajax
   else
   on(SaturnCreateRulePage).addaction[@myac-1].saveaction
   on(SaturnCreateRulePage).wait_for_ajax
   end 
   elsif anlink=="cancel action"
   if @myac.nil?
   on(SaturnCreateRulePage).button_element(:xpath => "//*[@id='buttonDeleteAction0']").click
   on(SaturnCreateRulePage).wait_for_ajax
   else
   on(SaturnCreateRulePage).button_element(:xpath => "//*[@id='buttonDeleteAction#{@myac-1}']").click
   on(SaturnCreateRulePage).wait_for_ajax
   end 
  elsif anlink=="Create" && cpage=="create from results window"
    on(StellaAdvancedPage).scrcreatebtn_element.click
    wait_for_js_pom
    sleep 5
  elsif anlink=="triggergroup link"
    on(SaturnRulesListing).link_element(:text => "#{@current_trigger_group}").click
    on(SaturnRulesListPage).wait_for_ajax
  #elsif anlink=="ruleid" 
    #mrs=Array.new
   #on(SaturnRulesListing).cell_elements(:xpath => "//*[@id='TBLrules']/tbody/tr/td[contains(text(),'_CatHierarchy_Facets') or contains(text(),'_CatHierarchy_RDPP')]/preceding-sibling::td").each{ |c| mrs << c.link_element.text}
   #on(SaturnRulesListing).link_element(:xpath => "//a[text()='#{mrs[0]}']").click
   #on(SaturnRulesListPage).wait_for_ajax
  elsif anlink=="ruleid"
   #mrs=Array.new
   #on(SaturnRulesListing).cell_elements(:xpath => "//*[@id='TBLrules']/tbody/tr/td[contains(text(),'_CatHierarchy_ModifiedResults')]/preceding-sibling::td").each{ |c| mrs << c.link_element.text}
   if @current_rule_name.nil?
   on(SaturnRulesListing).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[1]/a").click
   on(SaturnRulesListPage).wait_for_ajax
   sleep 4
   else
   on(SaturnRulesListing).link_element(:xpath => "//*[@id='TBLrules']/tbody/tr/td[child::a/span[text()='#{@current_rule_name}']]/preceding-sibling::td/a").click
   on(SaturnRulesListPage).wait_for_ajax
   sleep 4
   end
  elsif anlink=="Go to" && cpage=="category home page"
    on(StellaHomePage).goto_element.check
  elsif anlink=="General" && cpage=="category overview page"
    #on(CategoryOverview).general_list_element.when_present.fire_event("onmouseover")
  elsif cpage=="navigation type context attributes"
    on(SaturnCreateRulePage).addtrigger[anlink].navigationcontextattribute_element.check
  elsif anlink.include?("START EDITING")
    on(CategoryOverview).starteditinglink_element.click
    on(CategoryOverview).categotyid_element.when_present
    sleep 4
  elsif  anlink == "start editing button"
     on(CategoryOverview).starteditinglink_element.click
     sleep 4
  elsif anlink.include?("Priority")
    on(SaturnRulesListPage).span_element(:xpath => "//span[parent::div[text()='Priority']]").click
    on(SaturnRulesListPage).wait_for_ajax
  elsif anlink.include?("Create Rule")
   on(SaturnHomePage).NavigateToCreateRulePage 
   elsif anlink.include?("add trigger")
     on(SaturnCreateRulePage).addtriggerbtn_element.click
     on(SaturnCreateRulePage).wait_for_ajax
   elsif anlink=="add action"
      on(SaturnCreateRulePage).addactionbtn
      on(SaturnCreateRulePage).wait_for_ajax 
   elsif anlink=="select facet button"
     on(SaturnCreateRulePage).addaction[@cr].selectfacetbtn_element.click
     on(SaturnCreateRulePage).wait_for_ajax
  elsif anlink=="trigger group radio button"
    #on(SaturnCreateRulePage).triggergroup_element.check
    on(SaturnCreateRulePage).addtrigger[@tgc].triggergroupcheckbox_checked?.should be_false
    on(SaturnCreateRulePage).addtrigger[@tgc].triggergroupcheckbox_element.check
    #@tgc =@tgc+1
  elsif anlink=="trigger radio button"
    on(SaturnCreateRulePage).addtrigger[@tgc].check_trigger_radio_button_checked?.should be_false
    on(SaturnCreateRulePage).addtrigger[@tgc].check_trigger_radio_button_element.check
  elsif anlink=="plusicon"
    on(SaturnCreateRulePage).addtrigger[@scnt].addbtn
    on(SaturnCreateRulePage).wait_for_ajax 
    @scnt = @scnt+1     
  elsif anlink=="plusicon in rdpp algorithm"
    on(SaturnCreateRulePage).addaction[@crp].addactiontype
    @crp=@crp+1
  elsif anlink=="plus"
    on(SaturnCreateRulePage).button_element(:id => "buttonAdd#{$mytr}_#{@amt}").click
    on(SaturnCreateRulePage).wait_for_ajax 
    sleep 3
    @amt = @amt+1 
  elsif anlink.include?("Edit Rule")
    on(SaturnRuleDetailPage).editinrulesdetailed
  elsif anlink.include?("Edit trigger")
    if @mytri.nil?
    on(SaturnRuleDetailPage).addtrigger[0].edittrigger
    on(SaturnCreateRulePage).wait_for_ajax
    else
    on(SaturnRuleDetailPage).addtrigger[@mytri-1].edittrigger
    on(SaturnCreateRulePage).wait_for_ajax
    end
  elsif anlink=="edit"
    on(SaturnRuleDetailPage).addtrigger[@scnt].edittrigger
  elsif anlink=="cancel to remove action"
    on(SaturnCreateRulePage).button_element(:id => "buttonDeleteAction#{@myac}").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif anlink=="cancel"
    on(SaturnRuleDetailPage).addtrigger[@scnt].canceltrigger
  elsif anlink=="rdpp algorithm plus"
    on(SaturnCreateRulePage).addaction[0].addactiontype
  elsif anlink=="trigger Group Edit"
    on(TriggerGroupDetail).triggergroupedit
    on(TriggerGroupDetail).wait_for_ajax
  elsif cpage=="popup window"
    on(SaturnCreateRulePage).button_element(:xpath => "//div[@class='ui-dialog-buttonset']/button[child::span[text()='#{anlink}'] and preceding::div[@id='msgDialog']]").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif cpage=="pdm create trigger group"
  on(SaturnCreateRulePage).addtrigger[@scnt].addbtn_1_element.click
  on(SaturnCreateRulePage).wait_for_ajax 
  @scnt = @scnt+1  
  elsif cpage=="result set create trigger group"
  on(SaturnCreateRulePage).addtrigger[@scnt].addbtn_2_element.click
  on(SaturnCreateRulePage).wait_for_ajax 
  @scnt = @scnt+1
  end  
end

Then(/^I should see "(.*?)" option selected in drop down with following "(.*?)" in category overview section$/) do |dn,dv,table|
table.raw.each do | displayname, displayvalue |
on(CategoryOverview).select_list_element(:xpath => "//select[contains(@id,'categoryOverviewCommand.displayNames')]/option[text()='#{displayname}' and @selected='selected']").should be_true
on(CategoryOverview).text_field_element(:xpath => "//input[contains(@id,'categoryOverviewCommand.displayNames') and @value='#{displayvalue}']").should be_true
end
end

Then(/^I should see "(.*?)" row stored in "(.*?)" table for "(.*?)"$/) do |cnt,arg2,arg3|
steps %{
    Then I connect to the stella database
  }
  results = $dbhstella.execute("select count(*) from CATEGORY_ATTRIBUTE where category_id='#{$dbcid}'")
  results.fetch do |row|
    if row[0].to_int() == cnt.to_i
    else
    raise "mismatching displaynames in DB & UI"
    end
  end
end

When(/^I remove "(.*?)" by clicking "(.*?)" in "(.*?)"$/) do |displaynames,removelink,cp|
    on(CategoryOverview).getindex[displaynames].display_name_removal_element.click
end

When(/^I remove "(.*?)" which has "(.*?)" as "(.*?)" from "(.*?)"$/) do |displaynametype,displynametext,text,page|
  on(CategoryOverview).link_element(:xpath => "//a[1][preceding-sibling::select/option[text()='#{displaynametype}' and @selected='selected']]").click
end

Then(/^I should see "(.*?)" as "(.*?)" for the facet "(.*?)" in "(.*?)"$/) do |displayname,displaytext,facetname,cpage|
on(SaturnCreateRulePage).cell_element(:xpath => "//td[@id='colC']/input[preceding::td[1][text()='#{facetname}']]").value.should == displayname
end

Then(/^I should see "(.*?)" as "(.*?)" in "(.*?)"$/) do |colname,colvalue,pagetype|
if colname=="Priority"
on(SaturnRulesListPage).tblruleid_element[0][2].text.should == colname
elsif colvalue=="Highest to Lowest"
steps %{
  Given I connect to the database
}
 
results =$dbhsaturn.execute("select MERCH_TRIG_GROUP_NAME from (WITH rule_first_trigger_groups
     AS (SELECT r.*,
                g.MERCH_TRIG_GROUP_NAME,
                ROW_NUMBER ()
                OVER (PARTITION BY r.MERCH_RULE_ID
                      ORDER BY g.merch_trig_group_name desc)
                   AS rownumber
           FROM MERCH_RULE r
                LEFT JOIN merch_rule_trigger_assn rga
                   ON rga.MERCH_RULE_ID = r.MERCH_RULE_ID
                LEFT JOIN merch_trig_group g
                   ON g.MERCH_TRIG_GROUP_ID = rga.MERCH_TRIG_GROUP_ID)
  SELECT *
    FROM rule_first_trigger_groups r
   WHERE rownumber = 1 AND r.site_tenant = '#{$yml_file['sitetenant']}'
ORDER BY LOWER (merch_trig_group_name) desc) where ROWNUM=1")
results.fetch do |row|
if "#{row.join}".empty?
on(FindTriggerGroup).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[10]/a").should_not exist
else
on(FindTriggerGroup).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[10]/a").text.should == "#{row.join}"
end
end

elsif colname=="Canvas ID or Name"
on(SaturnCreateRulePage).addaction[@ca].enter_canvas_id_element.value.should == colvalue
elsif colvalue=="expanded with sub values"
  on(ContextActions).div_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div[@style='display: block;' and preceding-sibling::div/label[text()='#{colname}']]").should be_true
elsif colname=="Apply to all non-media actions"
  if colvalue=="checked by default"
  on(ContextActions).check_apply_to_all_non_media_actions(@context,colname).checked?.should be_true
  elsif colvalue=="checked"
   on(ContextActions).check_apply_to_all_non_media_actions(@context,colname).checked?.should be_true 
  elsif colvalue == "unchecked" 
  on(ContextActions).check_apply_to_all_non_media_actions(@context,colname).checked?.should be_false
  elsif colvalue=="unchecked by default and disabled"
  on(ContextActions).label_element(:xpath => "//*[@id='divActionContextAllNonMedia#{@context}']/label[text()='#{colname}' and preceding-sibling::input[@disabled='disabled' and not(@checked)]]").should be_true
  end
elsif colname=="rule displayed"
  on(SaturnRulesListing).link_element(:xpath => "//*[@id='TBLrules']/tbody/tr/td[child::a/span[text()='#{@current_rule_name}']]/preceding-sibling::td/a").should be_true
elsif colvalue=="disabled showacet operator"
  on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='showFacetOperator#{@sf}']/option[text()='#{colname}']").should be_disabled
elsif colname=="All Mobile"
  if colvalue=="checked"
  on(ContextActions).check_all_mobile_device(@context,colname).checked?.should be_true
  elsif colvalue == "unchecked" 
  on(ContextActions).check_all_mobile_device(@context,colname).checked?.should be_false
  end
elsif colvalue=="unchecked context action"
  @flag=true
elsif colname=="Domestic - US"
  if colvalue=="checked"
  on(ContextActions).check_domestic_value(@context,pagetype,colname).checked?.should be_true
  elsif colvalue == "unchecked" 
  on(ContextActions).check_domestic_value(@context,pagetype,colname).checked?.should be_false
  end  
elsif colname=="Rule Effective State"
  on(SaturnRuleDetailPage).span_element(:id => "ruleStatusField").text.should==colvalue
elsif colname=="default checked inventory assortment type"
  on(SaturnRuleDetailPage).checkbox_element(:xpath => "//div[@id='inventory']/div/input[following-sibling::span[text()='#{colvalue}']]").checked?.should be_true
elsif colname=="rdpp effective date"
  if colvalue=="today date"
  if @crp.nil?
  on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue#{@rdpp}_0").value.should== (Time.now).strftime("%m/%d/%Y")
  else
   on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue0_#{@crp}").value.should== (Time.now).strftime("%m/%d/%Y")
  end
  elsif colvalue=="yesterday date"
  if @crp.nil?
  on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue#{@rdpp}_0").value.should== (Time.now-24*60*60).strftime("%m/%d/%Y")
  else
   on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue0_#{@crp}").value.should== (Time.now-24*60*60).strftime("%m/%d/%Y")
  end  
  else
  on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue#{@rdpp}_0").value.should== colvalue
  end
elsif colname=="Rule Effective State in"
  @eff=on(SaturnRuleDetailPage).text_field_element(:id => "startDate").value
  @exp=on(SaturnRuleDetailPage).text_field_element(:id => "endDate").value
  if Date.parse(@exp) < Date.today
    on(SaturnRuleDetailPage).span_element(:id => "ruleStatusField").text.should=="Expired"
  else
    on(SaturnRuleDetailPage).span_element(:id => "ruleStatusField").text.should=="Effective"
  end
elsif colvalue=="next days of previous rdpp dates"
  on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue#{@rdpp}").value.should== @eff_date_rdpp_2
  on(SaturnRuleDetailPage).text_field_element(:id => "endDateValue#{@rdpp}").value.should== @expi_date_rdpp_2
elsif colname=="rdpp expiration date"
  if colvalue=="tommorow date"
  if @crp.nil?
  on(SaturnRuleDetailPage).text_field_element(:id => "endDateValue#{@rdpp}_0").value.should==(Time.now+24*60*60).strftime("%m/%d/%Y")
  else
  on(SaturnRuleDetailPage).text_field_element(:id => "endDateValue0_#{@crp}").value.should==(Time.now+24*60*60).strftime("%m/%d/%Y")
  @crp=@crp+1
  end
  elsif colvalue=="today date"
  if @crp.nil?
  on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue#{@rdpp}_0").value.should== (Time.now).strftime("%m/%d/%Y")
  else
   on(SaturnRuleDetailPage).text_field_element(:id => "startDateValue0_#{@crp}").value.should== (Time.now).strftime("%m/%d/%Y")
   @crp=@crp+1
  end
  else
  on(SaturnRuleDetailPage).text_field_element(:id => "endDateValue#{@rdpp}_0").value.should==colvalue
  end
elsif colname=="selected action type"
    if !@myac.nil?
    on(SaturnRuleDetailPage).select_list_element(:id=> "dropdownActionType#{@myac-1}").selected?(colvalue).should be_true
    else
    on(SaturnRuleDetailPage).select_list_element(:id=> "dropdownActionType0").selected?(colvalue).should be_true
    end
elsif colname == "selected navigation type"
     on(SaturnRuleDetailPage).checkbox_element(:xpath => "//input[following-sibling::span[text()='#{colvalue}']]").checked?.should be_true
elsif colname == "Rule Detail Edit button"
     on(SaturnRuleDetailPage).button_element(:id => "editRuleBtn").should be_enabled
elsif colname == "Rule Detail Copy button"
    on(SaturnRuleDetailPage).button_element(:id => "copyRuleBtn").should be_enabled
elsif colname =="Rule Owner"
   on(SaturnRuleDetailPage).label_element(:xpath => "//div[@id='ruleOwner']/div[2]/label").text.should==colvalue
elsif colname == "default rule priority"
  on(SaturnCreateRulePage).select_list_element(:id => "rulePriority").selected?(colvalue).should be_true
elsif colname == "rule priority"
  on(SaturnCreateRulePage).select_list_element(:id => "rulePriority").selected?(colvalue).should be_true  
elsif colname=="Canvas media type"
on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='mediaTypeDropdown#{@ca}']/option[text()='Canvas']").should be_disabled
elsif colname == "show media type"
  @newdate=Array.new
 on(SaturnCreateRulePage).text_field_elements(:xpath => "//input[contains(@id,'mediaLocationPoolId')]").each{|c|  @newdate << c.value} 
elsif colname=="media pool id"
elsif colname=="Select Media Type"
on(SaturnCreateRulePage).addaction[@ca].selectshowmediatype_element.selected?(colvalue).should be_true
elsif colvalue=="Lowest to Highest"
steps %{
  Given I connect to the database
}
 
results =$dbhsaturn.execute("select MERCH_TRIG_GROUP_NAME from (WITH rule_first_trigger_groups
     AS (SELECT r.*,
                g.MERCH_TRIG_GROUP_NAME,
                ROW_NUMBER ()
                OVER (PARTITION BY r.MERCH_RULE_ID
                      ORDER BY g.merch_trig_group_name ASC)
                   AS rownumber
           FROM MERCH_RULE r
                LEFT JOIN merch_rule_trigger_assn rga
                   ON rga.MERCH_RULE_ID = r.MERCH_RULE_ID
                LEFT JOIN merch_trig_group g
                   ON g.MERCH_TRIG_GROUP_ID = rga.MERCH_TRIG_GROUP_ID)
  SELECT *
    FROM rule_first_trigger_groups r
   WHERE rownumber = 1 AND r.site_tenant = '#{$yml_file['sitetenant']}'
ORDER BY LOWER (merch_trig_group_name) ASC) where ROWNUM=1")
results.fetch do |row|
if "#{row.join}".empty?
on(FindTriggerGroup).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[10]/a").should_not exist  
else  
on(FindTriggerGroup).link_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[10]/a").text.should == "#{row.join}"
end
end

elsif colvalue=="Lowest Priority to Highest"
steps %{
  Given I connect to the database
}
results = $dbhsaturn.execute("select * from (select rule_priority from merch_rule where site_tenant='#{$yml_file['sitetenant']}' ORDER BY rule_priority desc) where ROWNUM=1 ")
results.fetch do |row|
on(SaturnRulesListPage).cell_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[3]").text.should == "#{row.join}"
end    
elsif colvalue=="default showacet operator"
  on(SaturnCreateRulePage).addaction[@sf].showfacetoperator_element.selected?(colname).should be_true
elsif colvalue=="Highest Priority to Lowest"
steps %{
  Given I connect to the database
}
results = $dbhsaturn.execute("select * from (select rule_priority from merch_rule where site_tenant='#{$yml_file['sitetenant']}' ORDER BY rule_priority) where ROWNUM=1 ")
results.fetch do |row|
on(SaturnRulesListPage).cell_element(:xpath => "//table[@id='TBLrules']/tbody/tr[1]/td[3]").text.should == "#{row.join}"
end  
elsif colname=="default globaloperator"
  on(SaturnCreateRulePage).checkbox_element(:id => "triggerGlobalOperator#{colvalue}").checked?.should be_true
  #on(SaturnCreateRulePage).globaloperator_element.checked?.should be_true  
elsif colname=="Search Query"
  on(SaturnCreateRulePage).select_list_element(:id => "searchQueryId#{@en}").selected?(colvalue).should be_true
elsif colname=="append flag text"
  on(SaturnCreateRulePage).label_element(:id => "chkBoxLabel#{@en}").text.should include colvalue  
elsif colname=="Add Text to Autosuggest Phrase value"
  on(SaturnAutoSuggestionRule).select_list_element(:xpath => "//*[@id='displayPatternTable']/tbody/tr/td/select[child::option[text()='Select Text']]").selected?(colvalue).should be_true
elsif colname=="Display Pattern facet and facet syntax"
  @facet = colvalue.split(",")
  on(SaturnAutoSuggestionRule).select_list_element(:xpath => "//*[@id='displayPatternTable']/tbody/tr/td[child::span[text()='#{@facet[0]}']]/following-sibling::td[1]/select").selected?(@facet[1]).should be_true
elsif colname=="autosuggestion rule name"
  @asr =on(SaturnAutoSuggestionRule).asrulename_element.value
  on(SaturnAutoSuggestionRule).asrulename_element.value.should include colvalue
elsif colname=="autosuggestion rank"
  on(SaturnAutoSuggestionRule).asrank_element.value.should include colvalue
elsif colname=="Apply rule facet and facet value"
  @facet = colvalue.split(",")
  on(SaturnAutoSuggestionRule).span_element(:xpath => "//span[@id='applyValuesFacet' and text()='#{@facet[0]}']/following-sibling::span[@id='applyValuesValue' and text()='#{@facet[1]}']").should be_true
elsif colname=="append flag check box"
  if colvalue=="unchecked"
    on(SaturnCreateRulePage).checkbox_element(:id => "appendFlag#{@en}").checked?.should be_false
  else
    on(SaturnCreateRulePage).checkbox_element(:id => "appendFlag#{@en}").checked?.should be_true
  end
elsif colname=="autosuggestion publish checkbox"
  on(SaturnAutoSuggestionRule).publishtag_element.checked?.should be_true
elsif colname=="Include Synonyms checkbox"
  if colvalue=="unchecked"
  on(SaturnAutoSuggestionRule).synonmstag_element.checked?.should be_false  
  else
  on(SaturnAutoSuggestionRule).synonmstag_element.checked?.should be_true
  end
elsif colname=="trigger operator"
  on(SaturnCreateRulePage).checkbox_element(:xpath => "//input[contains(@id,'triggerGlobalOperator') and following-sibling::label[text()='#{colvalue}']]").checked?.should be_true             
elsif colname=="triggers globaloperator text"
  on(SaturnCreateRulePage).label_element(:id => "labelGlobalOperator").text.should include colvalue
elsif colname =="Merchandising Rules page with the previous filter selected"
  on(SaturnRulesListPage).select_list_element(:id => "filterTypeList").selected?(colvalue).should be_true
  sleep 4
elsif colname=="trigger group name filtered"
  steps %{
  Given I connect to the database
}
results =$dbhsaturn.execute("select count(merch_trig_group_name) from merch_trig_group where merch_trig_group.MERCH_TRIG_GROUP_NAME like '#{colvalue}%' and site_tenant='#{$yml_file['sitetenant']}'")
results.fetch do |row|
 @tglistcount =row[0].to_int()
end
if @tglistcount > 50
  @flag=true
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_next").should be_enabled
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_last").should be_enabled
else
  #assert_equal(true,@browser.execute_script("var x = document.getElementById('TBLtrigger_next').disabled; return x"))
  #assert_equal(true,@browser.execute_script("var x = document.getElementById('TBLtrigger_last').disabled; return x"))
  #on(FindTriggerGroup).span_element(:id => "TBLtrigger_next").should_not be_enabled
  #on(FindTriggerGroup).span_element(:id => "TBLtrigger_last").should_not be_enabled
end
elsif colname=="trigger groups list which are filtered by description"
  on(FindTriggerGroup).cell_element(:xpath => "//*[@id='TBLtrigger']/tbody/tr[1]/td[text()='#{colvalue}']").should be_true
elsif colname=="Max Five Rulename - Ruleid"
 @rule_id_name << "More rules shown via link"
  on(TriggerGroupDetail).div_element(:id => "msgDialog").unordered_list_element.list_item_elements.each{|c| @rule_id_name.should include c.text}
elsif colname=="boostlabel"
  on(SaturnCreateRulePage).label_element(:text => "#{colvalue}").should be_true
elsif colvalue=="selected show facet operator"
on(SaturnRuleDetailPage).select_list_element(:id => "showFacetOperator#{@sf}").selected?(colname).should be_true  
elsif colname=="Creation Date"
on(SaturnRuleDetailPage).creationdate_element.text.should include Time.now.strftime("%m/%d/%Y")
elsif pagetype=="select facet window"
  facetvalue=colvalue.split("&")
  on(SaturnCreateRulePage).cell_element(:xpath => "//td[@id='colA' and text()='#{facetvalue[0]}']").should be_true
  on(SaturnCreateRulePage).cell_element(:xpath => "//td[@id='colA' and text()='#{facetvalue[1]}']").should be_true
elsif colname =="select facet button"
on(SaturnCreateRulePage).addaction[@cr].selectfacetbtn_element.should be_disabled  
elsif colname=="navigation type"
  on(SaturnRuleDetailPage).addtrigger[colvalue].navigationtype_checked?.should be_true
elsif colname=="smm product type"
  sleep 6
  on(SaturnRuleDetailPage).select_list_element(:id => "actionValuesDropdown#{@smp}").selected?(colvalue).should be_true
elsif colname=="keep_existing_flag"
  steps %{
    Given I connect to the database
  }
  keep_existing_flag_status=$dbhsaturn.execute("select keep_existing_flag from display_facet_action where merch_action_id= (select merch_action_id from merch_rule_action_assn where merch_rule_id='#{@ruleid}')")
  keep_existing_flag_status.fetch do |row|
    "#{row[0]}".should == colvalue
  end
elsif colname=="facets and values displayed"
  actval = colvalue.split(",")
  on(SaturnCreateRulePage).span_element(:xpath => "//span[text()='#{actval[0]}']").should be_true
  on(SaturnCreateRulePage).span_element(:xpath => "//span[text()='#{actval[1]}']").should be_true
elsif colname=="enter url"
  sleep 5
  on(SaturnRuleDetailPage).text_field_element(:id => "inputURLRedirect#{@ur}").value.should == colvalue
  on(SaturnRuleDetailPage).wait_for_ajax
elsif colname=="media group id"
  @newdate.should include colvalue
  #sleep 4
  #on(SaturnRuleDetailPage).text_field_element(:id => "mediaLocationPoolId#{@sm}_0").value.should==colvalue
  #on(SaturnRuleDetailPage).wait_for_ajax
elsif colname=="mrs action type"
  if @mrsactions.nil?
    
    #on(SaturnRuleDetailPage).select_list_element(:xpath => "//select[contains(@id,'selectOperator0')]").selected?(colvalue).should be_true
  else  
  @mrs=@mrsactions.index(colvalue)
  @myac=@mrs+1
  end
  on(SaturnRuleDetailPage).select_list_element(:id => "selectOperator#{@mrs}").selected?(colvalue).should be_true
elsif colname=="show media actions"
  sleep 3
  @showmedia=Array.new
  on(SaturnCreateRulePage).select_list_elements(:xpath => "//select[contains(@id,'mediaTypeDropdown')]").each{|c| @showmedia << c.selected_options.join("")}
  @sm=@showmedia.index(colvalue)
  @myac=@sm+1
elsif colname=="media group location"
  on(SaturnRuleDetailPage).select_list_element(:id => "mediaLocationDropdown#{@sm}_0").selected?(colvalue).should be_true
elsif colname=="pdpid"
  sleep 4
  on(SaturnRulesListPage).text_field_element(:id => "inputPDPID#{@pdp}").value.should == colvalue
elsif colname =="Add Action"
  on(SaturnCreateRulePage).button_element(:id => "addActionBtn").should be_disabled
elsif colname=="add attribute values plus icon"
  @plus=0
elsif colname=="sequence"
  # if @plus.nil?
  # on(SaturnCreateRulePage).addaction[@mrs].sequence_element.value.should==colvalue
  # else
  # on(SaturnCreateRulePage).addaction[@mrs].sequence_element.value.should==colvalue
  on(SaturnCreateRulePage).text_field_element(:id => "boostAttributeSequence_#{@mrs}_#{@plus}").value.should==colvalue
  #end
elsif colname=="rdpp algorithm type"
  if @crp.nil?
  colvalue = on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='dropdownRDPPRule#{@rdpp}_0']/option[starts-with(text(),'#{colvalue[0..colvalue.index("-")-2]}')]").text
  on(SaturnRuleDetailPage).addaction[@rdpp].rdpp_algorithm_type_element.selected?(colvalue).should be_true
  else
  colvalue = on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='dropdownRDPPRule0_#{@crp}']/option[starts-with(text(),'#{colvalue[0..colvalue.index("-")-2]}')]").text
  on(SaturnRuleDetailPage).select_list_element(:xpath => "//select[@id='dropdownRDPPRule0_#{@crp}']").selected?(colvalue).should be_true
  end
elsif colname=="effective date"
  on(SaturnRuleDetailPage).addaction[@rdpp].effective_date_element.value.should==@eff_date
elsif colname=="product data match attribute type and attribute value"
val=colvalue.split(",")
$trigger_detail_page.should include "\"PDMGroupTypeName\":\"#{val[0]}\",\"PDMGroupValues\":[\"#{val[1]}\"]}"
elsif colname=="keyword searching value"
$trigger_detail_page.should include "\"type\":\"Keyword\",\"value\":\"Contains::#{colvalue}\""
elsif colname=="result set attribute type and attribute value and logical op"
val=colvalue.split(",")
$trigger_detail_page.should include "\"resultSetGroupType\":\"#{val[0]}\""
$trigger_detail_page.should include "\"resultSetGroupOperator\":\"#{val[1]}\""
$trigger_detail_page.should include "\"resultSetGroupValues\":[\"#{val[2]}\"]"
elsif colname=="facet refinement attribute type and attribute value"
val=colvalue.split(",")
$trigger_detail_page.should include "\"facetValues\":[\"#{val[1]}\"],\"facetType\":\"#{val[0]}\""
elsif colvalue=="selected" && pagetype=="trigger drop down"
  @mytri=0
elsif colname=="result count type and value"
val=colvalue.split(",")
if val[0]=="Greater Than"
@op = ">"
else
@op = "<"
end
$trigger_detail_page.should include "\"type\":\"Result Count\",\"value\":{\"valueInput\":#{val[1]},\"operator\":\"#{@op}\""
elsif colname=="category id value"
$trigger_detail_page.should include "\"type\":\"Category Ids\",\"value\":{\"catIDs\":\"[#{colvalue}]\""
elsif colname=="keyword pattern attributetype and attributevalue"
val=colvalue.split(",")
$trigger_detail_page.should include "\"keywordGroupType\":\"#{val[0]}\",\"keywords\":[\"#{val[1]}\"]"
elsif colname=="addAttributeValue"
  on(SaturnCreateRulePage).addaction[@mrs].addattributevalue_element.element.attribute("type").should== colvalue
elsif colname=="select attribute"
  on(SaturnCreateRulePage).selectattributevalue?.should == true
elsif colvalue=="showfacet filter by option"
  on(SaturnCreateRulePage).addaction[@sf].filterby_element.selected?(colname).should be_true
elsif colvalue=="context atrributes value"
  on(SaturnCreateRulePage).contextattributescondition_element.text.should include colname
elsif colname=="product id"
  on(SaturnCreateRulePage).addaction[@mrs].product_id_element.value.should == colvalue
elsif colname=="saved set query id"  
on(SaturnCreateRulePage).addaction[@mrs].savedsetqueryid_element.value.should == colvalue
elsif colname=="category ids"
  on(SaturnCreateRulePage).addtrigger[@scnt].enter_category_ids_element.value.should == colvalue
elsif colname=="category ids and their children"
  arr1=colvalue.split(",")
  arr2=on(SaturnCreateRulePage).addtrigger[@scnt].expect_cateids_their_children_element.value.split(",")
  @comp=arr1.collect(&:strip)-arr2.collect(&:strip)
  if @comp.empty?
  else
    raise "category ids and their children not matching..."
  end
elsif colvalue=="Greyed out"
  on(SaturnCreateRulePage).select_list_element(:xpath => "//*[@id='dropdownTriggerType0']/option[text()='#{colname}' and @disabled='disabled']").should be_disabled
elsif colvalue=="action disabled"
  on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='dropdownActionType#{@myac}']/option[text()='#{colname}']").should be_disabled
elsif colvalue=="in read only mode"
   @browser.execute_script("var x = document.getElementById('editRuleBtn').disabled; return x")
elsif colname=="All Countries"
  on(SaturnCreateRulePage).allcountries_selected?.should be_true
elsif colname=="All Countries" && colvalue=="unchecked"
  on(SaturnCreateRulePage).allcountries_selected?.should be_false  
elsif colname=="rulename"
  @current_rule_name=on(SaturnRuleDetailPage).rulename
  if @newrule.nil?
  on(SaturnRuleDetailPage).rulename.should include colvalue
  else
  on(SaturnRuleDetailPage).rulename.should include @newrule   
  end
elsif colname=="description"
if @desc.nil?
on(SaturnRuleDetailPage).desc.should include colvalue
else  
on(SaturnRuleDetailPage).desc.should include @desc
end
elsif colname=="effectivedate"
on(SaturnRuleDetailPage).effectivedate.should include @eff_date
elsif colname=="expirationdate"
on(SaturnRuleDetailPage).expirationdate.should include @expi_date
elsif colvalue =="default option" && pagetype=="create from results window"
  on(StellaAdvancedPage).scr_element.selected?(colname).should be_true
elsif colname=="Include all children and grandchildren etc"
    if colvalue=="unchecked by default"
    on(SaturnCreateRulePage).addtrigger[@scnt].include_all_children_checked?.should be_false
    elsif colvalue=="checked by default"
    on(SaturnCreateRulePage).addtrigger[@scnt].include_all_children_checked?.should be_true
    end
elsif colname=="Except for these Category IDs and their children"
  if colvalue=="disabled"
      assert_equal(true,@browser.execute_script("var x = document.getElementById('textareaCategoryID#{@scnt}').readOnly; return x"))
      #on(SaturnCreateRulePage).addtrigger[@scnt].expect_cateids_their_children_element.should be_enabled
  elsif colvalue=="enabled"
      assert_equal(false,@browser.execute_script("var x = document.getElementById('textareaCategoryID#{@scnt}').readOnly; return x"))
     #on(SaturnCreateRulePage).addtrigger[@scnt].expect_cateids_their_children_element.should be_enabled
  end
elsif colvalue=="attribute values"
@expectedvalues=colname.split(",")
@triggertype =colvalue[0..colvalue.index("attribute")-2]
on(SaturnRuleDetailPage).addtrigger[@triggertype].dresultsetvalue_element.text.should include @expectedvalues[0]
on(SaturnCreateRulePage).addtrigger[@triggertype].dselectlogicaloperator_element.selected?(@expectedvalues[1])
on(SaturnCreateRulePage).addtrigger[@triggertype].dpercentage.should include @expectedvalues[2]
elsif colname=="trigger group header"
  on(TriggerGroupDetail).trigergroupheader?.should == true
  @checktriggerorder = Array.new
  cnt=@browser.find_elements(:xpath => "//select[starts-with(@id,'dropdownTriggerType')]").size
  for i in 0..cnt-1
  @checktriggerorder << on(TriggerGroupDetail).select_list_element(:id => "dropdownTriggerType#{i}").selected_options[0]
  end
  $hash = Hash[@checktriggerorder.map.with_index.to_a]
elsif colname=="trigger details header"
  @checktriggerorder = Array.new
  cnt=@browser.find_elements(:xpath => "//select[starts-with(@id,'dropdownTriggerType')]").size
  for i in 0..cnt-1
  @checktriggerorder << on(TriggerGroupDetail).select_list_element(:id => "dropdownTriggerType#{i}").selected_options[0]
  end
  $hash = Hash[@checktriggerorder.map.with_index.to_a]
elsif colname=="trigger group name"
  $current_trigger_group=on(SaturnRuleDetailPage).rulename
  on(SaturnRuleDetailPage).rulename.should include colvalue
elsif colname =="trigger group description"
  on(TriggerGroupDetail).desc.should include colvalue
elsif colname=="Keyword trigger search value"
  on(TriggerGroupDetail).getKeywordTrigger("Keyword",colvalue) 
elsif colname=="Keyword Pattern attributes"
  val = colvalue.split(",")
  on(TriggerGroupDetail).getKeywordPatternTrigger("Keyword Pattern",val[0],val[1])   
elsif colname=="Result Set attributes"
  val = colvalue.split(",")
  on(TriggerGroupDetail).getResultSetTrigger("Result Set",val[0],val[1],val[2])  
elsif colname=="Facet Refinement attributes"
  val = colvalue.split(",")
  on(TriggerGroupDetail).getFacetRefinementTrigger("Facet Refinement",val[0],val[1])  
elsif colname=="Product Data Match atrributes"
   val = colvalue.split(",")
  on(TriggerGroupDetail).getProductDataMatchTrigger("Product Data Match",val[0],val[1])
elsif colname == "Effective Date,Expiration Date,Sequence,Collapse flag,facetname"
  expval = colvalue.split(",")
  for i in 0..expval.length-1
  if $suivalues.include?(expval[i])
  else
    raise "#{expval[i]} not matching in UI for #{$gct}"
  end
  end
elsif colname=="saved facets"
  testfacet = colvalue.split(",")
  for i in 0..testfacet.length-1
    on(CategoryOverview).checkfacetsaved(testfacet[i])
  end 
elsif colname=="saved rdpps"
  testfacet = colvalue.split(",")
  for i in 0..testfacet.length-1
  on(CategoryOverview).checkrdppssaved(testfacet[i])
  end    
 elsif colname=="triggergroup button"
   @tgc=2
 elsif colname=="pdm attrubute type and attribute value"
  actval=colvalue.split(",")
  on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].pdm_attribute_type_element.selected?(actval[0]).should be_true
  actval.should include on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].pdm_attributevalue_element.text.delete("X\n") #.should include actval[1]
  actval.should include on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].pdm_attributevalue_ad_element.text.delete("X\n") #.should include actval[1]
 elsif colname=="keyword pattern attrubute type and attribute value"
  actval=colvalue.split(",") 
  on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]+":"]+1].keyword_pattern_attribute_type_element.text.should include actval[0]
  @element =on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]+":"]+1].keyword_pattern_attribute_value_element.span_elements(:class => "tagBox-item")
  if @element.size ==actval.length-1
  @element.each{ |c| actval.should include c.span_element(:class => "tagBox-item-content").text}
  else
    raise "keyword pattern attributes not saved properly...."
  end
 elsif colname=="result cout type and value"
  actval =colvalue.split(",")
  on(TriggerGroupDetail).triggergroupdetail[@scnt].select_result_count_type_element.selected?(actval[0]).should be_true
  on(TriggerGroupDetail).triggergroupdetail[@scnt].enter_result_count_val.should == actval[1]    
 elsif colvalue=="selected by default"
    on(CreateTriggerGroup).creatingtriggers[@scnt].select_result_count_type_element.selected?(colname).should be_true
 elsif colname=="facet type and facet value"
  actval =colvalue.split(",")
   on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].facet_type_element.text.should include actval[0]
   actval.should include on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].facet_value_element.text #.should include actval[1]
   on(TriggerGroupDetail).triggergroupdetail[$hash[actval[0]]].facet_value_ad_element.text #.should include actval[2]
 elsif colname=="trigger group"
   if @trigger_group_name.include? colvalue
     on(SaturnRuleDetailPage).gettriggergroup.should == @trigger_group_name
 else
   on(SaturnRuleDetailPage).gettriggergroup.should include colvalue
 end
 elsif colname=="keyword search value"
  actval=colvalue.split(",") 
  @element =on(TriggerGroupDetail).triggergroupdetail[@scnt].search_query_value_element.span_elements(:class => "tagBox-item")
  if @element.size ==actval.length
  @element.each{ |c| actval.should include c.span_element(:class => "tagBox-item-content").text}
  else
    raise "keywords not saved properly...."
  end
 elsif colname=="selected dropdown value from autosuggeston"
   on(CreateTriggerGroup).creatingtriggers[@scnt].removefacet_element.click 
 elsif colname=="trigger group radio button"
   @tgc=0
 elsif  colname=="trigger radio button"
   @tgc=@tgc-1 
   $mytr=@tgc
end
end
Then(/^I should see "(.*?)" in Merchandising Rules listing page$/) do |listingresults|
  if listingresults.include?("only CatHierarchy rules")
    on(SaturnRulesListing).ruleslisting_element[1][1].text.should include "_CatHierarchy_"
  elsif listingresults.include?("No Records")
  on(SaturnRulesListing).ruleslisting_element[1][0].text.should == listingresults
  elsif listingresults == "Trigger Group Name highlighed in Yellow"
    @current_trigger_group=""
  elsif listingresults=="search_by_filter_triggergroup"
    on(SaturnRulesListing).cell_element(:xpath => "//*[@id='TBLrules']/tbody/tr[1]/td[9]").text.include listingresults
  elsif listingresults.include?("no CatHierarchy rules displayed")
    if on(SaturnRulesListing).ruleslisting_element[1][0].text == "No Records"
    else  
    cnt= on(SaturnRulesListing).table_elements(:id => "TBLrules").size
    for i in 1..cnt
    on(SaturnRulesListing).ruleslisting_element[i][2].text.should_not include "_CatHierarchy_"
    end
   end 
  end
end

When(/^I click clear link$/) do
  on(SaturnRulesListing).clearlink_element.click
  on(SaturnRulesListing).wait_for_ajax
end

Then(/^I should see "(.*?)" set to "(.*?)"$/) do |filterby,filteroption|
   on(SaturnRulesListing).filtertype_element.selected?(filteroption).should be_true
end

When(/^I click "(.*?)" button to make "(.*?)" as "(.*?)" by unchecking check box and "(.*?)" button$/) do |editheader,publishflag,pubtype,saveb|
  on(CategoryOverview).makepublishflagONOROFF
end

Then(/^I should see publish_flag as checked by default$/) do 
    on(CategoryOverview).publishflag_checked?.should be_true
end

When(/^I check "(.*?)"$/) do |arg1,table|
  if arg1=="following context attribute"
  table.hashes.each do |row|  #row[:values]
   if row[:attributesvalue].include?(",")
   cavs=row[:attributesvalue].split(",")
   for i in 0..cavs.length-1
   on(SaturnCreateRulePage).checkbox_element(:xpath => "//div[@id='#{row[:attributesname]}']/div/input[following-sibling::span[text()='#{cavs[i]}']]").click
   #.div_element(:id => row[:attributesname]).div_elements.checkbox_element(:index => i).check
   end
   else
   on(SaturnCreateRulePage).addtrigger[row[:attributesvalue]].context_attribute_val.check  
   end
   end
  elsif arg1=="following attribute values in select attribute values window"
      table.raw.each do |attv|
       on(SaturnCreateRulePage).addaction[attv.join("")].checkattributevalues_element.check
     end
  end
end


Then(/^I should see "(.*?)" from "(.*?)"$/) do |ddo,ddn,table|
 if ddn=="resultset trigger dropdown"
  @scnt =0
 table.raw.each do |attribute|
 on(SaturnCreateRulePage).addtrigger[0].selecresultsettrigger_element.should include attribute.join("")
 end
 elsif ddo == "following rule priorities"
   table.raw.each do |rps|
     on(SaturnCreateRulePage).select_list_element(:id => "rulePriority").should include rps.join("")
   end
 elsif ddo=="following action has been created in rule detail page"
   @created_actions = Array.new
   on(SaturnRuleDetailPage).select_list_elements(:xpath => "//select[contains(@id,'dropdownActionType')]").each{|c| @created_actions << c.selected_options.join("")}
   table.raw.each do |actions|
    @created_actions.should include actions.join("")
   end
 elsif ddo=="context action values disabled"
  table.raw.each do |cd|
  if cd.join("")=="Desktop" || cd.join("")=="Tablet" || cd.join("")=="Domestic - US"
  on(ContextActions).label_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked' and @disabled='disabled']]").should be_true
  elsif cd.join("")=="All Mobile" || cd.join("")=="International - ALL" 
  on(ContextActions).label_element(:xpath => ".//*[@id='divActionContextContainer#{@context}']/div/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked' and @disabled='disabled']]").should be_true  
  else
  on(ContextActions).label_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked' and @disabled='disabled']]").should be_true
  end
  end
  elsif ddo=="context action values enabled & checked"
  table.raw.each do |cd|
  if cd.join("")=="Desktop" || cd.join("")=="Tablet" || cd.join("")=="Domestic - US"
  on(ContextActions).label_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked']]").should be_true
  elsif cd.join("")=="All Mobile" || cd.join("")=="International - ALL" 
  on(ContextActions).label_element(:xpath => ".//*[@id='divActionContextContainer#{@context}']/div/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked']]").should be_true  
  else
  on(ContextActions).label_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/label[text()='#{cd.join("")}' and preceding-sibling::input[@checked='checked']]").should be_true
  end
  end
 elsif ddo=="following context devices checked"
   table.raw.each do |cd|
     on(ContextActions).check_device_type(@context,cd.join("")).checked?.should be_true
   end
 
 elsif ddo=="following rddp displayed"
   @selected_rddps = Array.new
    on(SaturnRuleDetailPage).select_list_elements(:xpath => "//select[contains(@id,'dropdownRDPPRule')]").each{|c| @selected_rddps << c.selected_options.join("")}
 elsif ddo=="following context devices unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_device_type(@context,cd.join("")).checked?.should be_false
   end  
 elsif ddn=="All Mobile"
   if ddo=="following all mobile sub values in read mode and checked"
   table.raw.each do |cd|
     on(ContextActions).check_all_mobile_sub_values(@context,ddn,cd.join("")).checked?.should be_true
   end
   elsif ddo=="following all mobile sub values in read mode and unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_all_mobile_sub_values(@context,ddn,cd.join("")).checked?.should be_false
   end
   end
 elsif ddo=="following rdpps displayed with respective effective & expiration dates"
    # @selected_rddps = Array.new
    # on(SaturnRuleDetailPage).select_list_elements(:xpath => "//select[contains(@id,'dropdownRDPPRule0')]").each{|c| @selected_rddps << c.selected_options.join("")}
    # table.raw.each do |cd|
       # @selected_rddps.should include cd.join("")
   # end
   table.hashes.each do |row|  #row[:values]
   
   end
 elsif ddn=="Shopping Mode"
    if ddo=="following values checked"
   table.raw.each do |cd|
     on(ContextActions).check_shopping_mode_values(@context,ddn,cd.join("")).checked?.should be_true
   end
   elsif ddo=="following values unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_shopping_mode_values(@context,ddn,cd.join("")).checked?.should be_false
   end
   end
  elsif ddn =="Navigation"
     if ddo=="following values checked"
   table.raw.each do |cd|
     on(ContextActions).check_navigation_values(@context,ddn,cd.join("")).checked?.should be_true
   end
   elsif ddo=="following values unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_navigation_values(@context,ddn,cd.join("")).checked?.should be_false
   end
   end
  elsif ddn =="Customer Experimentation"
     if ddo=="following values checked"
   table.raw.each do |cd|
     on(ContextActions).check_customer_experimentation_values(@context,ddn,cd.join("")).checked?.should be_true
   end
   elsif ddo=="following values unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_customer_experimentation_values(@context,ddn,cd.join("")).checked?.should be_false
   end
   end 
  elsif ddn =="International - ALL"
     if ddo=="following international all sub values in read mode and checked"
   table.raw.each do |cd|
     on(ContextActions).check_international_all_sub_value(@context,ddn,cd.join("")).checked?.should be_true
   end
   elsif ddo=="following international all sub values in read mode and unchecked"
   table.raw.each do |cd|
     on(ContextActions).check_international_all_sub_value(@context,ddn,cd.join("")).checked?.should be_false
   end
   end  
 elsif ddo=="following inventory assortment types unchecked"
    table.raw.each do |inve|
    on(SaturnRuleDetailPage).checkbox_element(:xpath => "//div[@id='inventory']/div/input[following-sibling::span[text()='#{inve.join("")}']]").checked?.should be_false
   end
 elsif ddo=="following selected attribute values"
   table.raw.each do |attribute|
    @browser.find_element(:xpath, "//table[contains(@id,'boostAttributeTable')]/tbody/tr/td[text()='#{ddn}']/following-sibling::span/span/span/span[text()='#{attribute.join("")}']").should be_displayed
   end 
  elsif ddo =="following display names"
    table.raw.each do |dsname|
    on(CategoryOverview).displaynames_element.should include dsname.join("")
    end
    @index=0
  elsif ddn=="display pattern text dropdown"
    table.raw.each do |text|
      on(SaturnAutoSuggestionRule).select_list_element(:xpath => "//*[@id='displayPatternTable']/tbody/tr/td/select[child::option[text()='Select Text']]").should include text.join("")
    end
  elsif ddo=="following mrs operators disabled"
 table.raw.each do |op|
   on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='selectOperator#{@mrs}' and child::option[text()='#{op.join("")}' and @disabled='disabled']]").should exist
 end
 elsif ddo=="following trigger group options"
 table.raw.each do |filteroption|
   on(FindTriggerGroup).findtriggergroup_element.should include filteroption.join("")
 end
 elsif ddo=="following facets and facet values"
 table.raw.each do |facet,facetval|
  @val= facetval.split(",")
 for i in 0..@val.length-1
   on(SaturnRuleDetailPage).cell_element(:xpath => "//div[@class='mDialog noFloatLayout total']/div/table[@id='displayFacetsRefinement']/tbody/tr/td[text()='#{facet}']/following-sibling::span/span/span/span[text()='#{@val[i]}']").should be_true
 end
 end
 elsif ddo =="following facets and facet values in select filter window"
   table.raw.each do |facet,facetval|
   on(SaturnRuleDetailPage).cell_element(:xpath => "//table[@id='displayFacetsRefinement']/tbody/tr/td[text()='#{facet}']/following-sibling::td[text()='#{facetval}']").should be_true
 end
 elsif ddo=="following facets with sequence numbers and displayname"
    table.raw.each do |facetname,seq,displayname|
    on(SaturnCreateRulePage).cell_element(:xpath => "//td[@id='colC']/input[preceding::td[1][text()='#{facetname}']]").value.should == displayname
    on(SaturnCreateRulePage).cell_element(:xpath => "//td[@id='colA']/input[following::td[1][text()='#{facetname}']]").value.should == seq
    end
 elsif ddo=="following showfacet operators"
   table.raw.each do |sfo|
    on(SaturnCreateRulePage).addaction[@sf].showfacetoperator_element.should include sfo.join("")
   end
 elsif ddo=="following triggers has been saved"
   triggers=Array.new
   on(SaturnRuleDetailPage).select_list_elements(:xpath => "//select[contains(@id,'dropdownTriggerType')]").each{ |c| triggers << c.selected_options.join("")}
   table.raw.each do |op|
   triggers.should include op.join("")  
   end
 elsif ddo =="following triggers enabled"
   table.raw.each do |attribute|
   on(SaturnCreateRulePage).select_list_element(:xpath => "//*[@id='dropdownTriggerType#{@mytri}']/option[text()='#{attribute.join("")}']").should be_enabled
   end
 elsif ddo =="following actions enabled"
   table.raw.each do |attribute|
   on(SaturnCreateRulePage).select_list_element(:xpath => "//*[@id='dropdownActionType#{@myac}']/option[text()='#{attribute.join("")}']").should be_enabled
   end
 elsif ddo =="following actions disabled"
   table.raw.each do |attribute|
   on(SaturnCreateRulePage).select_list_element(:xpath => "//*[@id='dropdownActionType#{@myac}']/option[text()='#{attribute.join("")}']").should be_disabled
  end  
 elsif ddo =="following triggers disabled"
   table.raw.each do |attribute|
   on(SaturnCreateRulePage).select_list_element(:xpath => "//*[@id='dropdownTriggerType#{@mytri}']/option[text()='#{attribute.join("")}']").should be_disabled
   end   
 elsif ddo =="following context attribute values checked"
   table.hashes.each do |row|  #row[:values]
   if row[:attributesvalue].include?(",")
   cavs=row[:attributesvalue].split(",")
   for i in 0..cavs.length-1
   on(SaturnCreateRulePage).checkbox_element(:xpath => "//div[@id='#{row[:attributesname]}']/div/input[following-sibling::span[text()='#{cavs[i]}'] and @checked]").should be_visible
   #on(SaturnCreateRulePage).addtrigger[cavs[i]].context_attribute_val_checked?.should be_true  
   end
   else
   on(SaturnCreateRulePage).addtrigger[row[:attributesvalue]].context_attribute_val_checked?.should be_true   
   end
   end
  elsif ddo =="following context attribute values unchecked"
   table.hashes.each do |row|  #row[:values]
   if row[:attributesvalue].include?(",")
   cavs=row[:attributesvalue].split(",")
   for i in 0..cavs.length-1
   on(SaturnCreateRulePage).checkbox_element(:xpath => "//div[@id='#{row[:attributesname]}']/div/input[following-sibling::span[text()='#{cavs[i]}'] and not(@checked)]").should be_visible
   #on(SaturnCreateRulePage).addtrigger[cavs[i]].context_attribute_val_checked?.should be_false 
   end
   else
   on(SaturnCreateRulePage).addtrigger[row[:attributesvalue]].context_attribute_val_checked?.should be_true   
   end
   end  
 elsif ddn == "Rules navigation bar"
 on(SaturnHomePage).ruleslink_element.fire_event("onmouseover")
   table.raw.each do |rlink|
   on(SaturnHomePage).link_element(:xpath => ".//*[@id='nav']/li[child::a[text()='RULES']]/ul/li/a[text()='#{rlink.join("")}']").should exist  
   end 
  elsif ddn=="product data match trigger dropdown"
 @scnt =0
 table.raw.each do |attribute|
 on(SaturnCreateRulePage).addtrigger[0].selecpdmtrigger_element.should include attribute.join("")
 end   
elsif ddn =="keyword pattern trigger dropdown"
@scnt =1
table.raw.each do |attribute|
 on(SaturnCreateRulePage).addtrigger[0].selectkeywordpattern_element.should include attribute.join("")
end  
elsif ddn == "Result Count trigger dropdown"
 @scnt =0
 table.raw.each do |attribute|
 on(CreateTriggerGroup).creatingtriggers[@scnt].select_result_count_type_element.should include attribute.join("")
end 
elsif ddo=="following filter options"
 table.hashes.each do |row|
  on(SaturnRulesListing).filtertype_element.should include row[:Filter_Options]
 end
else
  table.raw.each do |deviceoption|
  on(CategoryOverview).devicepublish_element.should include deviceoption.join(" ")
  end
 end 
end

Then(/^I should see "(.*?)" selected from "(.*?)" in "(.*?)"$/) do |dropdownoption, dropdownname, currentpage|
  if dropdownname.include?("result set dropdown")
  #on(SaturnRuleDetailPage).addtrigger[0].selecresultsettrigger_element.selected?(dropdownoption).should be_true
  else
  on(CategoryOverview).devicepublish_element.selected?(dropdownoption).should be_true
  end
end

Then(/^I should not see "(.*?)" unselected from "(.*?)" in "(.*?)"$/) do |dropdownoption, dropdownname, currentpage|
  on(CategoryOverview).devicepublish_element.selected?(dropdownoption).should be_false
end

When(/^I select "(.*?)" from "(.*?)" in "(.*?)"$/) do |dropdownoption, dropdownname, currentpage|
  if dropdownname.include?("select trigger dropdown")
  on(SaturnCreateRulePage).addtrigger[0].selecttrigger_element.select(dropdownoption)
  on(SaturnCreateRulePage).wait_for_ajax 
  elsif dropdownname=="show facet filter by drop down"
  on(SaturnCreateRulePage).addaction[@sf].filterby_element.select(dropdownoption)  
  @browser.action.send_keys(:tab).perform
  #on(SaturnCreateRulePage).wait_for_ajax 
  sleep 4
  elsif dropdownname =="Autosuggestion drop down"
    on(CreateTriggerGroup).checkautosuggestions(dropdownoption, dropdownname, currentpage)
  elsif dropdownoption=="any other action"
    @myac=0
  elsif  dropdownname =="rules priority drop down"
    on(SaturnCreateRulePage).select_list_element(:id => "rulePriority").select(dropdownoption)
  elsif dropdownname=="result set trigger dropdown"
  on(SaturnCreateRulePage).addtrigger[@pt].result_set_price_type_element.select(dropdownoption)
  on(SaturnCreateRulePage).wait_for_ajax
  elsif  dropdownname=="facet suggestion dropdown"
    on(SaturnAutoSuggestionRule).facet_element.value=dropdownoption
    sleep 2
    on(SaturnAutoSuggestionRule).link_element(:xpath => "//li[@rel='#{dropdownoption}']/a").click
    on(SaturnAutoSuggestionRule).wait_for_ajax
    sleep 4
  elsif dropdownoption=="Add Text to Autosuggest Phrase"
    on(SaturnAutoSuggestionRule).checkbox_element(:id => "chkAutosuggestPhrase").check
  elsif  dropdownname=="Price Type Filter Groups"
    on(SaturnCreateRulePage).addtrigger[dropdownoption].select_price_type_filter_group_element.check
  elsif  dropdownname=="display pattern text dropdown"
     on(SaturnAutoSuggestionRule).select_list_element(:xpath => "//*[@id='displayPatternTable']/tbody/tr/td/select[child::option[text()='Select Text']]").select(dropdownoption)
  elsif dropdownname =="Select Synatx"
     on(SaturnAutoSuggestionRule).select_list_element(:xpath => "//td[child::span[text()='#{currentpage}']]/following-sibling::td[1]/select").select(dropdownoption)
  elsif dropdownname =="autosuggestion filter dropdown"
    on(SaturnAutoSuggestionRule).select_list_element(:id => "templatesFilterType").select(dropdownoption)
    on(SaturnAutoSuggestionRule).wait_for_ajax
  elsif dropdownname =="select facets and Text window"
    @facets=dropdownoption.split(",")
    for i in 0..@facets.length-1
    on(SaturnAutoSuggestionRule).checkbox_element(:xpath => "//label[text()='#{@facets[i]}']/preceding-sibling::input[1]").check
    #on(SaturnAutoSuggestionRule).selectdpfacets_element.value=@facets[i]
    #sleep 2
    #on(SaturnAutoSuggestionRule).link_element(:xpath => "//li[@rel='#{dropdownoption}']/a").click
    #sleep 3
    end
  elsif dropdownname == "facet value suggestion dropdown"
    on(SaturnAutoSuggestionRule).facetvalue_element.value=dropdownoption
    sleep 2
    on(SaturnAutoSuggestionRule).link_element(:xpath => "//li[@rel='#{dropdownoption}']/a").click
    sleep 4
    #on(SaturnAutoSuggestionRule).selectfacetval_element.select(dropdownoption)
  elsif currentpage=="Key in Attribute window"
    on(CreateTriggerGroup).checkautosuggestions(dropdownoption, dropdownname, currentpage)
    on(SaturnCreateRulePage).wait_for_ajax 
  elsif dropdownname =="Search Query"
    on(SaturnCreateRulePage).select_list_element(:id => "searchQueryId#{@en}").select(dropdownoption)
  elsif dropdownname =="trigger group name autosuggestion drop down"
    on(FindTriggerGroup).triggergroupname_element.clear
    on(FindTriggerGroup).triggergroupname_element.value=dropdownoption
    sleep 2
    on(CreateTriggerGroup).checkautosuggestions(dropdownoption, dropdownname, currentpage)
  elsif dropdownname =="trigger group drop down"
    on(FindTriggerGroup).select_list_element(:id => "filterTypeList").select(dropdownoption)
    on(FindTriggerGroup).wait_for_ajax
  elsif  dropdownname=="boost attribute autosuggestion"
    on(SaturnCreateRulePage).text_field_element(:id => "input_facet_autosuggest").value= dropdownoption
    sleep 2
    on(SaturnCreateRulePage).link_element(:xpath => "//li[@rel='#{dropdownoption}']/a").click
    on(SaturnCreateRulePage).wait_for_ajax
  elsif dropdownname=="show facet operators drop down"
    on(SaturnCreateRulePage).select_list_element(:id => "showFacetOperator#{@sf}").select(dropdownoption)
    sleep 2
  elsif dropdownname =="facet autosuggestion drop down"
    on(SaturnCreateRulePage).text_field_element(:id => "input_facet_autosuggest").value=dropdownoption
    sleep 2
    on(SaturnCreateRulePage).link_element(:xpath => "//li[@rel='#{dropdownoption}']/a").click
    on(SaturnCreateRulePage).wait_for_ajax
    sleep 4
  elsif dropdownname =="facet value frame"
    @vals=dropdownoption.split(",")
    for i in 0..@vals.length-1
    on(SaturnCreateRulePage).checkbox_element(:xpath => "//label[text()='#{@vals[i]}']/preceding-sibling::input[1]").check
    end
  elsif dropdownname=="rdpp algorithm type drop down"
    on(SaturnCreateRulePage).wait_for_ajax 
    sleep 7
    if @crp.nil?
    dropdownoption=on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='dropdownRDPPRule#{@rdpp}_0']/option[starts-with(text(),'#{dropdownoption[0..dropdownoption.index("-")-2]}')]").text
    on(SaturnCreateRulePage).addaction[@rdpp].rdpp_algorithm_type_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax 
    else
    dropdownoption=on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='dropdownRDPPRule0_#{@crp}']/option[starts-with(text(),'#{dropdownoption[0..dropdownoption.index("-")-2]}')]").text
    on(SaturnCreateRulePage).select_list_element(:id => "dropdownRDPPRule0_#{@crp}").select(dropdownoption)
    #on(SaturnCreateRulePage).addaction[@crp].rdpp_algorithm_type_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax 
    end
  elsif dropdownname=="media group location"
    on(SaturnCreateRulePage).addaction[@sm].select_location_element.select(dropdownoption)
    sleep 2
  elsif dropdownname=="select display drop down"
    on(SaturnCreateRulePage).addaction[@smp].select_display_type_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax 
  elsif dropdownname=="mrs action menu"
    on(SaturnCreateRulePage).addaction[@mrs].select_action_menu_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax 
  elsif  dropdownname=="select media type dropdown"
    on(SaturnCreateRulePage).addaction[@sm].selectshowmediatype_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax 
    sleep 2
    @browser.action.send_keys(:tab).perform
    if dropdownoption=="Banners"
      @banrs=@sm
    elsif dropdownoption=="Zero Results Media"
      if @zrm.nil?
      @zrm = @sm
      else
      @zrm1=@sm
      end
    elsif dropdownoption=="Copy Block Media"
      @cbm=@sm
    elsif  dropdownoption == "Canvas"
      @ca=@sm
    end
  elsif dropdownname=="show facets drop down"
  @facets=dropdownoption.split(",")
  for i in 0..@facets.length-1
  on(SaturnCreateRulePage).addaction[@facets[i]].check_selectfacet
  end
  elsif dropdownname=="trigger drop down"
    if dropdownoption=="Facet Refinement"
     @fr=@mytri
     @scnt=@fr
     @mytri=@mytri+1
     elsif dropdownoption=="Keyword" 
      @kd=@mytri
     @mytri=@mytri+1
     elsif dropdownoption=="Keyword Pattern" 
      @kdp=@mytri
     @mytri=@mytri+1
     @scnt=@mytri
     elsif dropdownoption=="Result Set" 
      @rs=@mytri
      @scnt=@rs
     @mytri=@mytri+1
     elsif dropdownoption=="Product Data Match" 
      @pdm=@mytri
     @scnt=@pdm
     @mytri=@mytri+1
     elsif dropdownoption=="Result Count" 
      @rc=@mytri
      @scnt=@rc
     @mytri=@mytri+1
     elsif dropdownoption=="Category Ids" 
     @cid=@mytri
     @scnt=@cid
     @mytri=@mytri+1
    end
    on(SaturnCreateRulePage).addtrigger[@mytri-1].selecttrigger_element.select(dropdownoption)
    on(SaturnCreateRulePage).wait_for_ajax
  elsif dropdownname=="action drop down"
    if dropdownoption=="Category Redirect"
      @cr=@myac
      @myac=@myac+1
    elsif dropdownoption=="URL Redirect"
      @ur=@myac
      @myac=@myac+1
    elsif dropdownoption=="Execute New Search"
    @en=@myac
    @myac=@myac+1
    elsif dropdownoption=="Modify Result Set"
    @mrs=@myac
    @myac=@myac+1
    elsif dropdownoption=="Show Facets"
    @sf=@myac
    @myac=@myac+1
    elsif  dropdownoption=="RDPP Algorithm"
    @rdpp=@myac
    @myac=@myac+1
    elsif dropdownoption=="Display Message"
    @dm=@myac
    @myac=@myac+1  
    elsif dropdownoption=="PDP Redirect"
    @pdp=@myac
    @myac=@myac+1  
    elsif dropdownoption=="Show Media"
    @sm=@myac
    @myac=@myac+1 
    elsif dropdownoption=="Show Master or Member Products"
    @smp=@myac
    @myac=@myac+1
    end
    on(SaturnCreateRulePage).addaction[@myac-1].selectaction_element.select(dropdownoption)
    on(SaturnRulesListing).wait_for_ajax
    sleep 6
    #wait_for_ajax_call
   elsif dropdownname=="action dropdown"
    on(SaturnCreateRulePage).addaction[@myac].selectaction_element.select(dropdownoption)
    on(SaturnRulesListing).wait_for_ajax    
 elsif dropdownname==""   
 elsif dropdownoption=="Change Attribute" && currentpage=="Advanced category page"
   on(StellaAdvancedPage).check_selecheck
    menu =@browser.find_element(:xpath,"//form[1]/div/div[3]/div[4]/div/div[2]/ul/li/a")
    @browser.action.move_to(menu).click(menu).perform
    @browser.find_element(:xpath,"//a[text()='Change Attribute ']").click
    #wait_for_js_pom
 elsif dropdownname=="filter navigation dropdown"
   on(SaturnRulesListing).filteroptions_element.select(dropdownoption)
   on(SaturnRulesListing).wait_for_ajax
 elsif dropdownoption=="Change Attributes" && currentpage=="saved set page"
    sleep 5
    on(StellaAdvancedPage).savedsetcheck_element.click
    on(StellaAdvancedPage).link_element(:xpath => "//*[@id='saved-set-content']/div[2]/ul/li/a").fire_event("onmouseover")
    @browser.find_element(:xpath,"//a[text()=' Change Attribute ']").click
    wait_for_js_pom   
 elsif dropdownoption=="create" && currentpage=="category listing page"
   @browser.find_element(:xpath,"//*[@id='yui-rec0']/td[1]/div/input").click
   on(StellaAdvancedPage).link_element(:xpath => "//*[@id='category-results']/div/div[1]/ul/li/a").fire_event("onmouseover")
   @browser.find_element(:xpath,"//*[@id='category-results']/div/div[1]/ul/li/ul/li/a[text()='Create']").click
    wait_for_js_pom   
    sleep 4
 elsif dropdownname=="facet sub window"
   on(SaturnCreateRulePage).categoryfacettype_element.select(dropdownoption)
on(SaturnCreateRulePage).wait_for_ajax 
elsif dropdownname=="search dropdown" && currentpage=="category home page"
  on(StellaHomePage).search_category_element.select(dropdownoption)
  sleep 3
elsif dropdownname=="facet value sub window"
  if dropdownoption.include?(",")
  facetvales=dropdownoption.split(",")
  for i in 0..facetvales.length-1
  on(SaturnCreateRulePage).addaction[facetvales[i]].facetvalue_element.check
  on(SaturnCreateRulePage).wait_for_ajax
  end
  #on(SaturnCreateRulePage).span_element(:xpath => "//span[text()='Ok']").click
  #on(SaturnCreateRulePage).wait_for_ajax
  else
  on(SaturnCreateRulePage).addaction[dropdownoption].facetvalue_element.check
  #on(SaturnCreateRulePage).addaction[1].okorcancelbtnonselectfacetwindow_element.click
  #on(SaturnCreateRulePage).span_element(:xpath => "//span[text()='Ok']").click
  on(SaturnCreateRulePage).wait_for_ajax
  end
elsif dropdownname =="trigger group autosuggestion drop down"
on(CreateTriggerGroup).checkautosuggestions(dropdownoption, dropdownname, currentpage)  
@trigger_group_name=on(SaturnCreateRulePage).addtrigger[@tgc].enter_trigger_group_name
elsif dropdownoption =="search_by_filter_triggergroup"
elsif dropdownname =="device publish dropdown"
   on(CategoryOverview).devicepublish_element.select dropdownoption
 end
end

When(/^I select "(.*?)" from select trigger dropdown in "(.*?)"$/) do |arg1,arg2|
on(SaturnCreateRulePage).addtrigger[@scnt].selecttrigger_element.select(arg1)
#wait_for_js_pom
#@wait.until { @browser.execute_script("return (window.jQuery != null) && (jQuery.active === 0);")}
on(SaturnCreateRulePage).wait_for_ajax 
#sleep 4
end

When(/^I unselect "(.*?)" from "(.*?)" in "(.*?)"$/) do |dropdownoption, dropdownname, currentpage|
  if dropdownname =="action drop down"
    on(SaturnCreateRulePage).select_list_element(:id => "dropdownActionType#{@myac}").select_value("")
  elsif  dropdownname=="select facets and Text window"
    on(SaturnAutoSuggestionRule).checkbox_element(:xpath => "//label[text()='#{dropdownoption}']/preceding-sibling::input[1]").uncheck
  elsif dropdownname=="device publish dropdown"
  on(CategoryOverview).devicepublish_element.select dropdownoption
  end
end

When(/^I create category redirect action$/) do
@fv ="10 Strawberry Street"
@newrule="rulestesting"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
@eff_date =(Time.now-24*60*60).strftime("%m/%d/%Y")
@expi_date =(Time.now+24*60*60).strftime("%m/%d/%Y")
@categoryid="121"
@facettype ="Brand"
@actiontype = "Category Redirect"
@desc ="category redirect test"
on(SaturnHomePage).NavigateToCreateRulePage
on(SaturnCreateRulePage).rulename_element.value = @newrule
on(SaturnCreateRulePage).desc_element.value = @desc
on(SaturnCreateRulePage).effectivedate = @eff_date
on(SaturnCreateRulePage).expirationdate = @expi_date
on(SaturnCreateRulePage).addactionbtn
on(SaturnCreateRulePage).addaction[0].selectaction_element.select(@actiontype)
on(SaturnCreateRulePage).addaction[0].entercategoryid_element.value =@categoryid
on(SaturnCreateRulePage).addaction[0].selectfacetbtn_element.click
on(SaturnCreateRulePage).wait_for_ajax
on(SaturnCreateRulePage).categoryfacettype_element.select(@facettype)
on(SaturnCreateRulePage).wait_for_ajax
on(SaturnCreateRulePage).addaction[@fv].facetvalue_element.check
on(SaturnCreateRulePage).addaction[1].okorcancelbtnonselectfacetwindow_element.click
on(SaturnCreateRulePage).addaction[0].saveaction
on(SaturnCreateRulePage).wait_for_ajax
on(SaturnCreateRulePage).saverule
on(SaturnCreateRulePage).wait_for_ajax
end

Then(/^I should see as expected$/) do
on(SaturnRuleDetailPage).rulename.should include @newrule
on(SaturnRuleDetailPage).desc.should include @desc
on(SaturnRuleDetailPage).effectivedate.should include @eff_date
on(SaturnRuleDetailPage).expirationdate.should include @expi_date
on(SaturnRuleDetailPage).addaction[0].selectaction_element.selected?(@actiontype).should be_true
on(SaturnRuleDetailPage).addaction[0].entercategoryid.should include @categoryid
on(SaturnRuleDetailPage).tablefacet_element[0][0].text.should == @facettype
on(SaturnRuleDetailPage).tablefacet_element[0][1].text.should == @fv
end

When(/^I create "(.*?)" with "(.*?)" and the value as "(.*?)"$/) do |triggertype, attributename, attributevalue|
if triggertype=="result set trigger"
@inputvalues =attributevalue.split(",")
on(SaturnCreateRulePage).addtrigger[@scnt].selecresultsettrigger_element.select(attributename)
on(SaturnCreateRulePage).addtrigger[@scnt].resultsetvalue = @inputvalues[0]
on(SaturnCreateRulePage).addtrigger[@scnt].selectlogicaloperator_element.select_value(@inputvalues[1])
on(SaturnCreateRulePage).addtrigger[@scnt].percentage=@inputvalues[2]
elsif triggertype=="product data macth trigger"
on(SaturnCreateRulePage).addtrigger[@scnt].selecpdmtrigger_element.select(attributename)
on(SaturnCreateRulePage).addtrigger[@scnt].enterpdmvalue = attributevalue 
@browser.action.send_keys(:tab).perform  
elsif triggertype=="keyword pattern trigger dropdown"
on(CreateTriggerGroup).creatingtriggers[@scnt].select_keyword_pattern_type_element.select(attributename)
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_keyword_pattern_value=attributevalue
@browser.action.send_keys(:tab).perform
elsif triggertype=="result count trigger"
on(CreateTriggerGroup).creatingtriggers[@scnt].select_result_count_type_element.select(attributename)
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_result_count_val = attributevalue  
elsif triggertype=="facet refinement trigger"
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_facet_type= attributename
@browser.action.send_keys(:tab).perform
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_facet_value= attributevalue 
@browser.action.send_keys(:tab).perform  
elsif triggertype=="Keyword trigger"
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_search_keyword=attributevalue  
@browser.action.send_keys(:tab).perform 
end
end

When(/^I save the "(.*?)" with "(.*?)"$/) do |section,page|
if section=="trigger"
if !$mytr.nil?
on(SaturnCreateRulePage).addtrigger[$mytr-1].savetrigger
on(SaturnCreateRulePage).wait_for_ajax
else
on(SaturnCreateRulePage).addtrigger[0].savetrigger
on(SaturnCreateRulePage).wait_for_ajax
end
elsif section =="create trigger"
on(SaturnCreateRulePage).addtrigger[$mytr].savetrigger
on(SaturnCreateRulePage).wait_for_ajax  
elsif section=="creating rule page"
on(SaturnCreateRulePage).saverule
#@wait.until { @browser.execute_script("return document.readyState;") == "complete" }
on(SaturnCreateRulePage).wait_for_ajax 
sleep 5
elsif section=="category ids trigger"
on(SaturnCreateRulePage).addtrigger[@scnt].savetrigger
on(SaturnCreateRulePage).wait_for_ajax
#wait_for_js_pom  
#sleep 4
elsif section=="updated trigger groups"
on(SaturnCreateRulePage).addtrigger[@scnt].savetrigger
on(SaturnCreateRulePage).wait_for_ajax 
elsif section=="rules details page"
on(SaturnRuleDetailPage).saverulesdetailed
on(CreateTriggerGroup).wait_for_ajax 
#wait_for_ajax_call
#wait_for_page_load
elsif section=="create trigger group page"
on(CreateTriggerGroup).savecreatetriggergroup
on(CreateTriggerGroup).wait_for_ajax
sleep 8
elsif section=="Result set trigger"
on(SaturnCreateRulePage).savetrigers
on(CreateTriggerGroup).wait_for_ajax
elsif section=="product data match trigger"
on(SaturnCreateRulePage).savetrigers
on(CreateTriggerGroup).wait_for_ajax 
elsif section=="keyword pattern trigger"
on(SaturnCreateRulePage).savetrigers
on(CreateTriggerGroup).wait_for_ajax  
elsif section=="result count trigger"
on(SaturnCreateRulePage).savetrigers
#wait_for_ajax_call
#wait_for_page_load
on(CreateTriggerGroup).wait_for_ajax
elsif section=="facet refinement trigger"
on(SaturnCreateRulePage).savetrigers
on(CreateTriggerGroup).wait_for_ajax 
elsif section=="keyword trigger"
on(SaturnCreateRulePage).savetrigers
on(CreateTriggerGroup).wait_for_ajax   
elsif section=="trigger group details page"
on(TriggerGroupDetail).savetriggergroupdetailpage 
#wait_for_ajax_call
on(TriggerGroupDetail).wait_for_ajax     
elsif page=="selected autosuggestion dropdown values"
on(CreateTriggerGroup).savetriggerbtn_element.click
on(CreateTriggerGroup).wait_for_ajax 
elsif section=="trigger group"
on(SaturnCreateRulePage).addtrigger[@tgc].savetrigger
on(SaturnCreateRulePage).wait_for_ajax 
@tgc=@tgc+1
elsif section=="triggers"
on(SaturnCreateRulePage).addtrigger[@mytri-1].savetrigger
on(SaturnCreateRulePage).wait_for_ajax 
#wait_for_ajax_call
on(SaturnCreateRulePage).wait_for_ajax  
elsif section=="action"
if @myac.nil?
on(SaturnCreateRulePage).addaction[0].saveaction
on(SaturnCreateRulePage).wait_for_ajax  
sleep 2
else  
on(SaturnCreateRulePage).addaction[@myac-1].saveaction
on(SaturnCreateRulePage).wait_for_ajax
sleep 2
end 
#wait_for_page_load
elsif section=="triggergroup"
on(SaturnCreateRulePage).addtrigger[@tgc].savetrigger
on(SaturnCreateRulePage).wait_for_ajax 
end
end

When(/^I enter "(.*?)" as "(.*?)" in "(.*?)"$/) do |field,value,page|
if field=="rulename"
@newrule=value+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
on(SaturnCreateRulePage).rulename_element.value =  @newrule
elsif field=="canvas id or name"
on(SaturnCreateRulePage).addaction[@sm].enter_canvas_id_element.value=value
on(SaturnCreateRulePage).wait_for_ajax   

elsif value=="rdpp algorithm effective date"
sleep 5
if field =="today's date"
 if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue#{@rdpp}_0").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]").click
else
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue0_#{@crp}").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]").click
end
elsif field =="yesterday's date"
if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue#{@rdpp}_0").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/preceding::td/a[text()='#{(Time.now-24*60*60).strftime("%d").gsub(/^0+/, '')}']").click  
else
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue0_#{@crp}").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/preceding::td/a[text()='#{(Time.now-24*60*60).strftime("%d").gsub(/^0+/, '')}']").click    
end
elsif field =="valid date"
if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue#{@rdpp}_0").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td/a[text()='#{(Time.now+24*60*60).strftime("%d").gsub(/^0+/, '')}']").click  
else
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue0_#{@crp}").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td/a[text()='#{(Time.now+24*60*60).strftime("%d").gsub(/^0+/, '')}']").click    
end
end
elsif value=="rdpp algorithm expiration date"
if field=="tommorow's date"
if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "endDateValue#{@rdpp}_0").click 
@browser.find_element(:xpath,"//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td[1]/a").click
else
on(SaturnCreateRulePage).text_field_element(:id => "endDateValue0_#{@crp}").click 
@browser.find_element(:xpath,"//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td[1]/a").click
end
elsif field =="today's date"
 if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue#{@rdpp}_0").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]").click
else
on(SaturnCreateRulePage).text_field_element(:id => "startDateValue0_#{@crp}").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]").click
end
elsif field =="valid date"
if @crp.nil?
on(SaturnCreateRulePage).text_field_element(:id => "endDateValue#{@rdpp}_0").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td/a[text()='#{(Time.now+48*60*60).strftime("%d").gsub(/^0+/, '')}']").click  
else
on(SaturnCreateRulePage).text_field_element(:id => "endDateValue0_#{@crp}").click
@browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'ui-datepicker-today')]/following::td/a[text()='#{(Time.now+48*60*60).strftime("%d").gsub(/^0+/, '')}']").click    
end
end
elsif field=="canvas id"
on(SaturnCreateRulePage).addaction[@sm].enter_canvas_id_element.value=value
sleep 2
elsif field =="canvas name"
on(SaturnCreateRulePage).addaction[@sm].enter_canvas_id_element.value=value
sleep 2  
elsif field=="autosuggestion rulename"
@asr= value+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
on(SaturnAutoSuggestionRule).asrulename_element.clear
on(SaturnAutoSuggestionRule).asrulename_element.value=@asr
elsif field=="autosuggestion rank"
on(SaturnAutoSuggestionRule).asrank_element.clear
on(SaturnAutoSuggestionRule).asrank_element.value=value 
elsif field=="duplicate rulename"
on(SaturnCreateRulePage).rulename_element.value =  @newrule 
elsif field=="suggestion rule name"
on(SaturnAutoSuggestionRule).text_field_element(:id => "templatesFilterVal").clear
on(SaturnAutoSuggestionRule).text_field_element(:id => "templatesFilterVal").value= @asr  
elsif field=="triggergroup name"
on(FindTriggerGroup).triggergroupname_element.clear
if @current_trigger_group.nil?
on(FindTriggerGroup).triggergroupname_element.value=value
@browser.action.send_keys(:tab).perform
else
on(FindTriggerGroup).triggergroupname_element.value=@current_trigger_group
@browser.action.send_keys(:tab).perform
end
on(FindTriggerGroup).wait_for_ajax  
elsif field=="trigger group description"
on(FindTriggerGroup).triggergroupname_element.clear
on(FindTriggerGroup).triggergroupname_element.value=value
on(FindTriggerGroup).wait_for_ajax
elsif field=="duplicate triger group name"
on(SaturnCreateRulePage).rulename_element.value =  @newrule 
elsif field=="new_trigger_group_name"
on(SaturnCreateRulePage).rulename_element.value =  @newrule+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
elsif field=="show facet product type"
  on(SaturnCreateRulePage).text_field_element(:id => "inputProductType#{@sf}").value=value
  on(SaturnCreateRulePage).wait_for_ajax
elsif field.include?("description")
@desc=value
on(SaturnCreateRulePage).desc_element.value = @desc
elsif value =="current date for rdpp algorithm"
  @rdpp_eff_date =(Time.now-24*60*60).strftime("%m/%d/%Y")
  if @crp.nil?
  on(SaturnCreateRulePage).addaction[@rdpp].effective_date_element.clear
  on(SaturnCreateRulePage).addaction[@rdpp].effective_date_element.value=@rdpp_eff_date
  on(SaturnCreateRulePage).wait_for_ajax 
  else
  on(SaturnCreateRulePage).addaction[@crp].effective_date=@rdpp_eff_date
  on(SaturnCreateRulePage).wait_for_ajax 
  end 
elsif field=="sequence number"
  
elsif value=="future date for rdpp algorithm"
  @rdpp_expi_date =(Time.now+24*60*60).strftime("%m/%d/%Y")
  if @crp.nil?
  on(SaturnCreateRulePage).addaction[@rdpp].expiration_date_element.clear
  on(SaturnCreateRulePage).addaction[@rdpp].expiration_date_element.value=@rdpp_expi_date
  on(SaturnCreateRulePage).wait_for_ajax  
  else
  on(SaturnCreateRulePage).addaction[@crp].expiration_date=@rdpp_expi_date
  on(SaturnCreateRulePage).wait_for_ajax 
  #@browser.action.send_keys(:tab).perform   
  end  
elsif value=="date which are different from previous for rdpp algorithm"
  @eff_date_rdpp_2 =(Time.now+48*60*60).strftime("%m/%d/%Y")
  @expi_date_rdpp_2 =(Time.now+72*60*60).strftime("%m/%d/%Y")
  on(SaturnCreateRulePage).addaction[@crp].effective_date=@eff_date_rdpp_2
  on(SaturnCreateRulePage).wait_for_ajax 
  on(SaturnCreateRulePage).addaction[@crp].expiration_date=@expi_date_rdpp_2
  on(SaturnCreateRulePage).wait_for_ajax 
  
elsif page=="sequence text field"
on(SaturnCreateRulePage).addaction[@mrs].sequence=value
elsif field=="display message"
  on(SaturnCreateRulePage).addaction[@dm].enter_display_message=value
  sleep 2
elsif field =="media group id"
  on(SaturnCreateRulePage).addaction[@sm].enter_media_group_id=value
elsif field=="pdp id"
  on(SaturnCreateRulePage).addaction[@pdp].enter_pdp_id=value
elsif page=="Key in Attribute window"
on(SaturnCreateRulePage).enter_key_attri_element.clear
on(SaturnCreateRulePage).enter_key_attri=field
on(SaturnCreateRulePage).wait_for_ajax  
elsif field=="url"
on(SaturnCreateRulePage).addaction[@ur].enter_url_for_redirect=value
elsif field=="facet name and facet value"
act=value.split(",")
on(CreateTriggerGroup).creatingtriggers[@fr].enter_facet_type_mul= act[0]
@browser.action.send_keys(:tab).perform
on(CreateTriggerGroup).creatingtriggers[@fr].enter_facet_value_mul= act[1]
@browser.action.send_keys(:tab).perform 
elsif field=="keyword search value"
on(CreateTriggerGroup).creatingtriggers[@kd].enter_search_keyword=value
sleep 3
elsif field=="product id"
  on(SaturnCreateRulePage).addaction[@mrs].product_id=value
elsif field=="saved set query id"
  on(SaturnCreateRulePage).addaction[@mrs].savedsetqueryid=value
elsif field.include?("effectivedate")
@eff_date=(Time.now-24*60*60).strftime("%m/%d/%Y")
on(SaturnCreateRulePage).effectivedate = @eff_date
elsif field=="category input value"
@browser.find_element(:xpath,"//input[@id='inputId']").send_keys value  
elsif field.include?("expirationdate")
@expi_date=(Time.now+24*60*60).strftime("%m/%d/%Y")
on(SaturnCreateRulePage).expirationdate = @expi_date
elsif field=="category ids"
  on(SaturnCreateRulePage).addtrigger[@scnt].enter_category_ids=value
elsif field=="category ids and their children"
  on(SaturnCreateRulePage).addtrigger[@scnt].expect_cateids_their_children_element.value=value
elsif field=="name" && page=="create from results window"
  on(StellaAdvancedPage).scrname=value
elsif field=="TriggerGroupName"
@newrule=value+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
on(SaturnCreateRulePage).rulename_element.value =  @newrule  
elsif field=="trigger group name"
if @current_trigger_group.nil?
on(SaturnCreateRulePage).addtrigger[@tgc].enter_trigger_group_name=value  
else
on(SaturnCreateRulePage).addtrigger[@tgc].enter_trigger_group_name=@current_trigger_group
sleep 4
end
#on(SaturnCreateRulePage).enter_trigger_group=value

sleep 2
elsif field=="trigger group name" && page=="find rules page"
  on(SaturnRulesListing).inputvalue_element.clear
  on(SaturnRulesListing).inputvalue =value
  sleep 3
elsif field=="duplicate trigger group name"
on(SaturnCreateRulePage).addtrigger[@tgc].enter_trigger_group_name=@trigger_group_name
elsif field=="category id"
on(SaturnCreateRulePage).addaction[@cr].entercategoryid_element.value =value
on(SaturnCreateRulePage).wait_for_ajax
elsif field=="replace with term"
 on(SaturnCreateRulePage).addaction[@en].replace_with_term=value
end
end

When(/^I select "(.*?)" from "(.*?)" than I see "(.*?)" and "(.*?)"$/) do |arg1, arg2, msg, arg4,table|
if arg2=="resultset trigger dropdown"
on(SaturnCreateRulePage).addtrigger[@scnt].addbtn
on(SaturnCreateRulePage).wait_for_ajax 
@scnt=@scnt+1
table.raw.each do |attribute|
on(SaturnCreateRulePage).addtrigger[@scnt].selecresultsettrigger_element.select(attribute.join(""))
on(SaturnRuleDetailPage).addtrigger[1].popupmsg_element.text.should include "The group type #{attribute.join("")} is already selected. Each group type must be selected only once." 
on(SaturnRuleDetailPage).msgbtn
end
on(SaturnCreateRulePage).addtrigger[0].savetrigger
on(SaturnRuleDetailPage).addtrigger[1].popupmsg_element.text.should include "You must select > or <." 
on(SaturnRuleDetailPage).addtrigger[2].popupmsg_element.text.should include "Please select the attribute to save the Trigger." 
on(SaturnRuleDetailPage).msgbtn
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute
elsif arg2=="product data match trigger dropdown"
on(SaturnCreateRulePage).addtrigger[@scnt].addbtn
on(SaturnCreateRulePage).wait_for_ajax 
@scnt=@scnt+1
table.raw.each do |attribute|
on(SaturnCreateRulePage).addtrigger[@scnt].selecpdmtrigger_element.select(attribute.join(""))
on(SaturnRuleDetailPage).addtrigger[1].popupmsg_element.text.should include "The group type #{attribute.join("")} is already selected. Each group type must be selected only once." 
on(SaturnRuleDetailPage).msgbtn
end
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute
elsif arg2=="keyword pattern trigger dropdown"
on(SaturnCreateRulePage).addtrigger[@scnt].addbtn
on(SaturnCreateRulePage).wait_for_ajax 
@scnt=@scnt+1
table.raw.each do |attribute| 
on(CreateTriggerGroup).creatingtriggers[@scnt].select_keyword_pattern_type_element.select(attribute.join(""))
on(SaturnRuleDetailPage).addtrigger[1].popupmsg_element.text.should include "The group type #{attribute.join("")} is already selected. Each group type must be selected only once." 
on(SaturnRuleDetailPage).msgbtn
end
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute  
elsif arg2=="facet refinement trigger"
on(SaturnCreateRulePage).addtrigger[@scnt].addbtn
on(SaturnCreateRulePage).wait_for_ajax 
@scnt=@scnt+1
table.raw.each do |attribute|
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_facet_type= attribute.join("")
@browser.action.send_keys(:tab).perform
on(CreateTriggerGroup).creatingtriggers[0].savetrigger
on(SaturnRuleDetailPage).addtrigger[1].popupmsg_element.text.should include "Duplicate Facets are not allowed." 
on(SaturnRuleDetailPage).msgbtn 
on(CreateTriggerGroup).creatingtriggers[@scnt].removefacet_element.click
end 
sleep 4
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute  
end
end

When(/^I upload file "(.*?)"$/) do |xlsfile|
  @file_path=File.expand_path("../../../#{xlsfile}", __FILE__).gsub("/","\\")
  if xlsfile.include?("Lingutics_Bulk_upload")
  on(SaturnHomePage).NavigateTolinguisticsupload
  elsif xlsfile.include?("LinguticsBulkupload_error_validation")
   on(SaturnHomePage).NavigateTolinguisticsupload 
  elsif xlsfile.include?("Vocabulary_Bulk1")
  on(SaturnHomePage).NavigateToVocabularyBulkUpload
  elsif xlsfile.include?("Rules_Bulk_Upload")
  on(SaturnHomePage).NavigateToRulesBulkUpload
  elsif xlsfile.include?("RulesBulkUpload_error_validation.xls")
  on(SaturnHomePage).NavigateToRulesBulkUpload 
  end
  on(SaturnBulkUploadPage).file_field_element(:id => "uploadFile").focus
  on(SaturnBulkUploadPage).execute_script("document.getElementById('uploadFile').click();")
  window = RAutomation::Window.new(:title => /File Upload/i)
  if window.exists? 
  window.activate
  window.text_field(:class => "Edit", :index => 0).set @file_path
  button = window.button(:value => "&Open")
   if button.exists?
      button.click
   end
 end
 on(SaturnBulkUploadPage).import
 on(POMCommonSteps).wait_for_ajax
if xlsfile.include?("Lingutics_Bulk_upload")
on(SaturnBulkUploadPage).fileuploadmsg_element.wait_until do
on(SaturnBulkUploadPage).msgokbtn_element.click
end
book = Spreadsheet.open @file_path
sheet = book.worksheet 0
@data_row = Hash.new
i=1
sheet.each do |row|
  if !sheet.row(i).to_a.empty?
  @data_row[i] =sheet.row(i).to_a
  i=i+1
 end
end
elsif xlsfile.include?("Rules_Bulk_Upload")
on(SaturnBulkUploadPage).fileuploadmsg_element.wait_until do
on(SaturnBulkUploadPage).msgokbtn_element.click
end  
book = Spreadsheet.open @file_path
sheet = book.worksheet 0
@data_row = Hash.new
i=1
sheet.each do |row|
  if !sheet.row(i).to_a.empty?
  @suggestionrulename =sheet.cell(i,0)
  @data_row[@suggestionrulename] =sheet.row(i).to_a.delete_if {|x| x == nil}
  i=i+1
  end
end
attempts=0
    begin
    on(SaturnBulkUploadPage).pendingstatus?.should == false
    rescue Exception => exc
    attempts=attempts+1
    retry unless attempts > 20
    ensure
    #raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
#on(SaturnBulkUploadPage).wait_until do
#on(SaturnBulkUploadPage).pendingstatus_element.when_not_visible 
#end
end
end

Then(/^I should see "(.*?)" with "(.*?)"$/) do |data, xls|
if data.include?("Dictionary got created")
on(SaturnHomePage).global_search("Dictionary Names",@data_row[1][0])
on(SaturnDictionaryListingPage).wait_for_ajax
on(SaturnDictionaryListingPage).viewdetails_element.click
on(SaturnDictionaryListingPage).wait_for_ajax
elsif data=="Copy Block Media"
  id=@showmedia.index(data)
  val=xls.split(",")
  on(SaturnRuleDetailPage).text_field_element(:id => "mediaLocationPoolId#{id}_0").value.should==val[0]
  on(SaturnRuleDetailPage).label_element(:id => "mediaLocationName#{id}_0").text.should==val[1]
elsif data=="Zero Results Media"
  id=@showmedia.index(data)
  on(SaturnRuleDetailPage).text_field_element(:id => "mediaLocationPoolId#{id}_0").value.should==xls
elsif data=="Banners"    
  id=@showmedia.index(data)
  val=xls.split(",")
  on(SaturnRuleDetailPage).text_field_element(:id => "mediaLocationPoolId#{id}_0").value.should==val[0]
elsif data.include?("suggestion rule got created")
steps %{ Then I connect to attribute data base}
  on(SuggestionRulePage).getSuggestionRuleDetailPage("Rule Name",@data_row.keys[0])
  on(SuggestionRulePage).getSuggestionRuleData(@data_row)  
end
end

Then(/^I should see "(.*?)" is equals to "(.*?)"$/) do |xls,saturnui|
on(SaturnDictionaryListingPage).wait_for_ajax
if saturnui.include?("dictionary in saturn UI")
@data= @data_row.keys
@relation_ship_type = Hash.new
@relation_ship_type["SIM"]="Similar"
@relation_ship_type["EQ"]="Equals"
@relation_ship_type["HPR"]="Hypernym"
@relation_ship_type["DTA"]="Do Not Associate"
@relation_ship_type["STO"]="Stemming Override"
@relation_ship_type["SW"]="Stop Word"
@relation_ship_type["PHR"]="Phrase"
@relation_ship_type["KO"]="Keep Original"
@relation_ship_type["SYN"]="One Way Synonym"
for i in 0..@data.length-1
  on(SaturnDictionaryListingPage).dicname.should == @data_row[@data[i]][0]
  on(SaturnDictionaryListingPage).dictype_element.selected?(@data_row[@data[i]][1]).should be_true
  on(SaturnDictionaryListingPage).tbrelation_element[i+1][0].text.should == @data_row[@data[i]][3]
  on(SaturnDictionaryListingPage).tbrelation_element[i+1][1].text.should include @relation_ship_type[@data_row[@data[i]][2]]
  if !@data_row[@data[i]][4].nil?
  on(SaturnDictionaryListingPage).tbrelation_element[i+1][2].text.should == @data_row[@data[i]][4]
  end
end
elsif saturnui.include?("suggestion rule in saturn UI")
  
end
end

Then(/^I should see "(.*?)" messages$/) do |arg1, table|
  if arg1=="following create trigger group errors"
  @errormsg =Array.new
  on(CreateTriggerGroup).errortriggergroupvalidation_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  on(CreateTriggerGroup).button_element(:xpath => "//div[@class='ui-dialog-buttonset']/button/span").click
  elsif arg1=="following popup error"
  @errormsg =Array.new
  on(CreateTriggerGroup).errortriggergroupvalidation_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  elsif arg1=="following popup content"
  @errormsg =Array.new
  on(CreateTriggerGroup).errortriggergroupvalidation_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  elsif arg1=="following rules bulk upload errors"
  @errormsg =Array.new
  on(SaturnBulkUploadPage).errorlist_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  elsif arg1=="following Trigger Group Usage"
    on(TriggerGroupDetail).div_element(:xpath => "//div[child::span[text()='Trigger Group Usage']]/following-sibling::div[child::div[text()='Changes to trigger group affects the following rules:'] and child::a[text()='View Rules Details']]").should be_true
  elsif arg1=="following Trigger Group Alert"
   on(TriggerGroupDetail).div_element(:xpath => "//div[child::span[text()='Trigger Group Alert']]/following-sibling::div[child::div[text()='Changes to trigger group affects the following rules:'] and child::a[text()='View Rules Details'] and child::div[text()='Continue with Save?']]").should be_true 
  elsif arg1=="following delete trigger"
   @errormsg =Array.new
   @errormsg << on(CreateTriggerGroup).popmsg_element.text
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  elsif arg1=="following attributes error"
  @errormsg =Array.new
  sleep 3
  on(CreateTriggerGroup).errormessages_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  elsif arg1=="following error"
  @errormsg =Array.new
  on(CreateTriggerGroup).errormessages_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end 
  elsif arg1=="following duplicate trigger group error"
  @tgc=@tgc-1
  @errormsg =Array.new
  on(CreateTriggerGroup).errormessages_element.list_item_elements.each{ |c| @errormsg << c.text}
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end 
  elsif arg1=="popup error"
   @errormsg =Array.new
   @errormsg << on(CreateTriggerGroup).popmsg_element.text
  table.raw.each do |msg|
   @errormsg.should include msg.join("")  
  end
  end
end

Then(/^I check rules bulk upload$/) do
  steps %{ Then I connect to attribute data base}
  on(SaturnHomePage).NavigateToSuggestionRulePage
  on(SuggestionRulePage).getSuggestionRuleDetailPage("Rule Name",@data_row.keys[1])
  on(SuggestionRulePage).getSuggestionRuleData(@data_row)  
end

Then(/^I should see "(.*?)" record created in each table "(.*?)"$/) do |numofrecords,tables|
 steps %{ Given I connect to the database}
 on(SuggestionRulePage).checkrecordsexists(numofrecords)
end

When(/^I click "(.*?)" from "(.*?)"$/) do |submenu,menu|
on(SaturnHomePage).NavigateToSubPages(submenu,menu)
end

Then(/^I should see "(.*?)" displayed$/) do |currentpage|
  if currentpage=="Create Trigger Group page"
  $mytr=0
  elsif currentpage=="Create Rule page"
   $mytr=0
  end
end

When(/^I select "(.*?)" trigger with "(.*?)" as "(.*?)"$/) do |triggertype, triggervalue,triggerdesc|
  if triggertype=="Keyword"
    if !@amt.nil?
    on(CreateTriggerGroup).setKeywordTrigger(triggertype,triggervalue,$mytr)
    @mkw=$mytr
    else
    on(CreateTriggerGroup).setKeywordTrigger(triggertype,triggervalue,$mytr)
    $mytr =$mytr+1
    end
  elsif triggertype=="Keyword Pattern"
    if !@amt.nil?
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).select_list_element(:id => "dropdownKeywordPatternCriteria#{$mytr}_#{@amt}").select(kpv[0])
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//div[@id='divCriteriaA#{$mytr}_#{@amt}']/span[2]/input").value=kpv[1]
    on(CreateTriggerGroup).wait_for_ajax
    @browser.action.send_keys(:tab).perform
    @mkwp = $mytr
    else     
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).setKeywordPatternTrigger(triggertype,kpv[0],kpv[1],$mytr)
    $mytr =$mytr+1
    end
  elsif triggertype=="Result Set"
    if !@amt.nil?
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).select_list_element(:id => "dropdownResultSetTrigger#{$mytr}_#{@amt}").select(kpv[0])
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//div[@id='divSubCriteriaA#{$mytr}_#{@amt}']/span/input").value=kpv[1]
    @browser.action.send_keys(:tab).perform
    on(CreateTriggerGroup).select_list_element(:id => "logicalDropdownResultSetTrigger#{$mytr}_#{@amt}").select(kpv[2])
    on(CreateTriggerGroup).wait_for_ajax
    @mrs=$mytr
    else
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).setResultSetTrigger(triggertype,kpv[0],kpv[1],kpv[2],$mytr)
    $mytr =$mytr+1
    end
  elsif triggertype=="Facet Refinement"
    if !@amt.nil?
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//div[@id='divSubCriteriaA#{$mytr}_#{@amt}']/span[1]/input").value=kpv[0]
    #on(CreateTriggerGroup).wait_for_ajax
    @browser.action.send_keys(:tab).perform
    on(CreateTriggerGroup).text_field_element(:xpath => "//div[@id='divSubCriteriaA#{$mytr}_#{@amt}']/span[2]/input").value=kpv[1]
    #on(CreateTriggerGroup).wait_for_ajax
    @browser.action.send_keys(:tab).perform
    @mfr =$mytr
    else
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).setFacetRefinementTrigger(triggertype,kpv[0],kpv[1],$mytr)
    $mytr =$mytr+1
    end
  elsif triggertype=="Result Count"
     if !@amt.nil?
     kpv=triggervalue.split(",")
     on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
     on(CreateTriggerGroup).wait_for_ajax
     on(CreateTriggerGroup).select_list_element(:id => "numDropdown#{$mytr}").select(kpv[0])
     on(CreateTriggerGroup).wait_for_ajax
     on(CreateTriggerGroup).text_field_element(:id => "numInput#{$mytr}").value=kpv[1]
     @mrc=$mytr
   else
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).setResultCountTrigger(triggertype,kpv[0],kpv[1],$mytr)
    $mytr =$mytr+1  
    end 
  elsif triggertype =="Category Ids"
    if !@amt.nil?
    on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//input[@id='inputCategoryID' or @id='inputCategoryID#{$mytr}' and preceding-sibling::label[@id='labelCategoryIDs#{$mytr}']]").value=triggervalue
    sleep 2   
    @mci=$mytr
    else
    on(CreateTriggerGroup).setCategoryIDSTrigger(triggertype,triggervalue,$mytr)
    $mytr =$mytr+1  
    end
  elsif triggertype=="Product Data Match"
    if !@amt.nil?
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).select_list_element(:id => "dropdownTriggerType#{$mytr}").select(triggertype)
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).select_list_element(:id => "dropdownProductDataMatch#{$mytr}_#{@amt}").select(kpv[0])
    on(CreateTriggerGroup).wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//div[@id='divCriteriaA#{$mytr}_#{@amt}']/span/input").value=kpv[1]
    on(CreateTriggerGroup).wait_for_ajax
    #@browser.action.send_keys(:tab).perform
    @mpdm =$mytr
    else
    kpv=triggervalue.split(",")
    on(CreateTriggerGroup).setProductDataMatchTrigger(triggertype,kpv[0],kpv[1],$mytr)
    $mytr =$mytr+1
   end 
  end
end

When(/^I select "(.*?)" in "(.*?)"$/) do |triggertype,trigger|
  on(CreateTriggerGroup).selecttrigger_element.select(triggertype)
  on(CreateTriggerGroup).wait_for_ajax
end

Then(/^I should see "(.*?)" in "(.*?)"$/) do |function,page|
  
if function=="result set trigger saved"
@scnt=@scnt-1

elsif function=="facets displayed" && page=="stella facet page"
  @stella_data = Array.new
  for i in 1..@typen
    for j in 1..4
    if j!=2 
    @stella_data << @browser.find_element(:xpath, "//table/tbody[@class='yui-dt-data']/tr[#{i}]/td[#{j}]/div/input").attribute("value")
    elsif j==2
     @stella_data << @browser.find_element(:xpath, "//table/tbody[@class='yui-dt-data']/tr[#{i}]/td[#{j}]/div").text
    else
      
    end
    end
  end
elsif function=="RDDP allowed to create more than one"
  @crp=nil
elsif function=="rdpp got saved as new action"
  @crp=nil
  @rdpp = @myac-1
elsif function=="RDPP Action"
  @context=@rdpp
  @myac=@rdpp+1
elsif function=="context actions values disabled"
  if @selected_rddps.nil?
  @val=@created_actions.index(page)
  @context=@val
  @myac=@val+1
  elsif !@selected_rddps.nil?
  @context= @selected_rddps.index( @selected_rddps.detect{ |e| e.match( /#{page[0..1]}/ ) } )
  end
elsif function=="Show Media Action"
  @context=@sm
  @myac=@sm+1
elsif function=="Enabled Canvas media type"
  on(SaturnCreateRulePage).select_list_element(:xpath => "//select[@id='mediaTypeDropdown#{@sm}']/option[text()='Canvas']").should be_enabled
elsif function=="context container enabled"
  on(ContextActions).contextservice[@context].context_container_element.should be_enabled
elsif function=="context container expanded"
  on(ContextActions).div_element(:xpath => "//div[@style='display: block;' and preceding-sibling::p[text()='Context']]").should be_true
elsif function=="context container collapsed"
  on(ContextActions).div_element(:xpath => "//div[@style='display: none;' and preceding-sibling::p[text()='Context']]").should be_true
elsif function=="context container greyed out"
  on(ContextActions).contextservice[@context].context_container_element.should be_disabled
elsif function=="show media action presents with select media type actions"
  @showmedia=Array.new
  on(SaturnCreateRulePage).select_list_elements(:xpath => "//select[contains(@id,'mediaTypeDropdown')]").each{|c| @showmedia << c.selected_options.join("")}
elsif function=="Rdpp Algorithm action displayed"
  @myac=1
  @rdpp=0
elsif function=="show media action with canvas"
  @myac=3
elsif function=="Autosuggestion drop down with maximum five values"
  num_paragraphs=5
  on(CreateTriggerGroup).autosuggestions_element.list_item_elements.size.should <= num_paragraphs.to_i
elsif function=="No Autosuggestion drop down"
  on(CreateTriggerGroup).autosuggestions_element.should_not exist
elsif function=="canvas replaced with zero result media"
  @sm=0
elsif function==/trigger is selectable$/
  $mytr=$mytr+1
elsif page=="select facet summary panel"
  @facets = function.split(",")
  on(SaturnAutoSuggestionRule).label_element(:xpath => "//td[child::label[text()='#{@facets[0]}']]/following-sibling::td[1]/label[text()='#{@facets[1]}']").should be_true
elsif function=="triggers enabled"
  $mytr=1
  @amt=1
elsif function=="Autosuggestion drop down refreshed"
  @autosuggestion = Array.new
  on(CreateTriggerGroup).autosuggestions_element.list_item_elements.each{ |c| @autosuggestion << c.text}
  assert_not_same(@autosuggestion,@autosuggestions)
elsif function=="execute new search action has been updated"
  sleep 7
elsif function=="trigger group name has been selected from autosuggestion"
 # on(FindTriggerGroup)
elsif function=="Price Type option available"
  @pt=0
elsif function=="trigger group listings which are filtered by searching value"
   sleep 6
elsif function=="max five unique values in autosuggestion"
  on(FindTriggerGroup).wait_for_ajax
  sleep 3
elsif function=="Autocomplete Suggestion Rules Lists page"
  sleep 5
elsif function=="trigger group listings displayed currently"
elsif function=="trigger group listing displayed in first page"
  steps %{
    Then I should see "trigger grops sorted" as "Highest to Lowest" in "find trigger groups list page"
  }
elsif function=="trigger group listing displayed in last page"  
steps %{
  Given I connect to the database
}
 
results =$dbhsaturn.execute("select * from (select merch_trig_group_name from merch_trig_group where site_tenant='#{$yml_file['sitetenant']}' order by merch_trig_group_name) where ROWNUM=1")
results.fetch do |row|
on(FindTriggerGroup).link_element(:xpath => "//*[@id='TBLtrigger']/tbody/tr[last()]/td[1]/a").text.should == "#{row.join}"
end
elsif function=="page loads with all the listings"
  steps %{
  Given I connect to the database
}
results =$dbhsaturn.execute("select count(merch_trig_group_name) from merch_trig_group where site_tenant='#{$yml_file['sitetenant']}'")
results.fetch do |row|
 @tglistcount =row[0].to_int()
end
if @tglistcount > 50
  @flag=true
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_next").should be_enabled
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_last").should be_enabled
  on(FindTriggerGroup).span_element(:xpath => "//*[@id='TBLtrigger_paginate']/span[3]/span[2]").should be_enabled
else
  @flag=false
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_next").should_not be_enabled
  on(FindTriggerGroup).span_element(:id => "TBLtrigger_last").should_not be_enabled
end
elsif function=="rdpp table displayed"
  @myac=1
  @rdpp=0
elsif function=="multiple rddps displayed"
  @rdpp=@rdpp+1
elsif page=="trigger group drop down"
  @scnt=0
elsif function=="ruleid"
  @ruleid = on(SaturnRuleDetailPage).div_element(:xpath => "//div[@class='hText']").text.scan(/\d+/).join
elsif function=="all the rules which are associated with TG"
  @rule_ids_list = Array.new
  @rule_names_list = Array.new
  on(SaturnRulesListPage).link_elements(:xpath => "//table[@id='TBLrules']/tbody/tr/td[2]/a").each {|c| @rule_names_list << c.text }
  on(SaturnRulesListPage).link_elements(:xpath => "//table[@id='TBLrules']/tbody/tr/td[1]/a").each {|c| @rule_ids_list << c.text.concat(" - ")}
  for i in 0..@rule_ids_list.length-1
    @rule_id_name.should include @rule_ids_list[i].concat(@rule_names_list[i])
  end
elsif function=="rules detailed page with TG"
  @rule_id_name=Array.new
elsif function=="keyword pattern attributes displayed"
  @scnt =1
elsif function=="rulename,ruleid"
  @rule_id_name << on(SaturnRuleDetailPage).div_element(:xpath => "//div[@id='mPage']/div[3]/div[@class='hText bold']").text.gsub(' (Draft)','').gsub(" ", " - ")
elsif function=="See rules using this Trigger Group"
  on(TriggerGroupDetail).tgassociatewithrule_element.text.should==function
elsif function=="keyword pattern attribute options"
  @scnt=1
elsif function=="trigger criteria displayed"
  @amt=0
elsif function=="showfacet action table displayed"
  @sf=0
  @myac=1
elsif function=="showfacet actions displayed"
  sleep 6
elsif function=="facets displayed"
@checktriggerorder = Array.new
cnt=@browser.find_elements(:xpath => "//div[starts-with(@id,'divSubCriteriaA')]/span[1]/span/span/span[2]").size
for i in 0..cnt-1
@checktriggerorder << on(TriggerGroupDetail).span_element(:xpath => "//div[@id='divSubCriteriaA0_#{i}']/span[1]/span/span/span[2]").text
end
$hash = Hash[@checktriggerorder.map.with_index.to_a]   
elsif function=="show media Banner"
  @sm=@banrs
  @myac=@sm+1
elsif function=="modified result set actions"
  sleep 3
  @mrsactions=Array.new
  on(SaturnRuleDetailPage).select_list_elements(:xpath => "//select[contains(@id,'selectOperator')]").each{ |c| @mrsactions << c.selected_options.join("")}
elsif function =="show media zero results media"
  @sm=@zrm
  @myac=@sm+1
 @newdate=Array.new
 on(SaturnCreateRulePage).text_field_elements(:xpath => "//input[contains(@id,'mediaLocationPoolId')]").each{|c|  @newdate << c.value} 
elsif function=="multiple zero results media created"
  @sm=2
elsif function=="show media copy block media"
  @sm=@cbm
  @myac=@sm+1
elsif function=="Edit & Copy buttons enabled for actions"
  @myac=1
  @rdpp=0
  @crp=nil
elsif function=="actions enabled in drop down"
 @myac=@myac-1
elsif function=="trigger group radio button enabled to include with triggers"
@tgc=$mytr
elsif function=="RDPP Algorithm drop down,effective,expiration,plusicon and cross mark"
  @crp =0
elsif function=="all the combination of triggers"
sleep 10
ele= @browser.find_element(:xpath, "//div[@id='helpMenuContext']/following-sibling::script[1]")
$trigger_detail_page =@browser.execute_script("return arguments[0].innerHTML", ele)
elsif function=="attributes and attribute values has been selected"
  $mytr=$mytr+1
elsif function=="trigger criteria display" && page=="keyword pattern"
  @amt=1
elsif function=="rdpp displayed" && page=="stella facet page"
  #cnt=0
  sleep 10
  @browser.find_elements(:xpath, "//table/tbody[@class='yui-dt-data']/tr/td[3]/div/input").each do | description_cell |
   end
elsif function=="category ids enabled"
  @scnt=0
elsif function=="trigger group radio button is enabled"
  @tgc=@scnt
elsif function=="same display_name, facet,sequence,collapsed"
elsif function=="new rulename" || function=="duplicate rulename"
  sleep 4
elsif function=="facets added with user defined display name" || function=="facets added with default display name"
  sleep 5
elsif function=="Key in Attribute window"
  on(CreateTriggerGroup).autosuggestions_element.should exist
elsif function=="select trigger drop down displayed"
  @mytri=0
elsif function=="product data match trigger saved"
@scnt=@scnt-1 
elsif function=="trigger group autosuggestion dropdown"
  #@trigger_group_name=on(SaturnCreateRulePage).addtrigger[@tgc].enter_trigger_group_name_element.value
elsif function=="category ids in trigger dropdown"
  @scnt=1
elsif function=="facets option available in dropdown"
  @scnt=1
elsif function =="category ids trigger selected with category ids"
  @scnt=0 
  #@mrs=0
  on(SaturnCreateRulePage).addtrigger[@scnt].selecttrigger_element.selected?("Category Ids").should be_true
elsif function=="modify result set action selected"
  @mrs=0
elsif function=="keyword pattern trigger saved"
@scnt=@scnt-1  
elsif function=="product data match triggers displayed"
@checktriggerorder = Array.new
cnt=@browser.find_elements(:xpath => "//*[starts-with(@id,'dropdownProductDataMatch0_') or starts-with(@id,'dropdownProductDataMatch#{@mpdm}_')]").size
for i in 0..cnt-1
@checktriggerorder << on(TriggerGroupDetail).select_list_element(:xpath => "//*[@id='dropdownProductDataMatch0_#{i}' or @id='dropdownProductDataMatch#{@mpdm}_#{i}']").selected_options[0]
end
$hash = Hash[@checktriggerorder.map.with_index.to_a]
elsif function=="category listings" && page=="category search page"
on(StellaAdvancedPage).categorylistings_element[2].should_not be_nil  
elsif function=="keyword pattern triggers displayed"
sleep 4
@checktriggerorder = Array.new
cnt=@browser.find_elements(:xpath => "//*[starts-with(@id,'labelKeywordPatternCriteria')]").size
for i in 1..cnt
@checktriggerorder << on(TriggerGroupDetail).label_element(:id => "labelKeywordPatternCriteria0_#{i}").text
end
$hash = Hash[@checktriggerorder.map.with_index.to_a]  
elsif function=="refine by following facets displayed"
@scnt=0
elsif function=="pdm displayed"
@scnt=@scnt-1  
elsif function=="resultset displayed"
@scnt=0  
elsif function=="pdm saved which were selected from autosuggestions"
@scnt=2  
elsif function=="facets saved which were selected from autosuggestions"
@scnt=@scnt+1  
elsif function=="facet refinement trigger saved"
 @scnt=@scnt-1
elsif function=="keyword trigger section displayed"
  @scnt=0
elsif function=="select action drop down displayed"
  @myac=0  
elsif function=="trigger group checkbox enabled" && page=="trigger detail page"
  @tgc=2  
elsif function=="trigger group created"
  @tgc=0
  @scnt=0
  $mytr=1
elsif function=="trigger group displayed"
  sleep 5
  @current_trigger_group=on(SaturnRuleDetailPage).rulename_element.value
  sleep 5
end
end 

When(/^I validate "(.*?)" from "(.*?)"$/) do |attributetype,triggertype,table|
@scnt=0
if triggertype=="product data match trigger"
table.raw.each do |msg1,msg2|
steps %{
When I create "product data macth trigger" with "#{msg1}" and the value as "#{msg2}"
When I click "plusicon" in "create rule page"
}
end
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute 
elsif triggertype =="Result Set trigger"
table.raw.each do |msg1,msg2|
steps %{
When I create "result set trigger" with "#{msg1}" and the value as "#{msg2},>,70"
When I click "plusicon" in "create rule page"
}
end
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute   
elsif triggertype =="Facet Refinement trigger"
table.raw.each do |msg1,msg2|
steps %{
When I create "facet refinement trigger" with "#{msg1}" and the value as "#{msg2}"
When I click "plusicon" in "create rule page"
}
end
on(SaturnRuleDetailPage).addtrigger[@scnt].removeattribute
elsif attributetype =="following context action values by checking checkboxes"
  table.raw.each do |cd|
  if cd.join("")=="Desktop" || cd.join("")=="Tablet" || cd.join("")=="Domestic - US"
  on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").check
  elsif cd.join("")=="All Mobile" || cd.join("")=="International - ALL" 
  on(ContextActions).checkbox_element(:xpath => ".//*[@id='divActionContextContainer#{@context}']/div/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").check 
  else
  puts "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]"
  on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").check
  end
 end
elsif attributetype =="following context action values by unchecking checkboxes"
  table.raw.each do |cd|
  if cd.join("")=="Desktop" || cd.join("")=="Tablet" || cd.join("")=="Domestic - US"
  on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").uncheck
  elsif cd.join("")=="All Mobile" || cd.join("")=="International - ALL" 
  on(ContextActions).checkbox_element(:xpath => ".//*[@id='divActionContextContainer#{@context}']/div/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").uncheck 
  else
  on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/input[following-sibling::label[text()='#{cd.join("")}']]").uncheck
  end
 end
end 
end

When(/^I unselect "(.*?)" context action and select "(.*?)" in "(.*?)"$/) do |contextactionvalue1,contextactionvalue2,actiontype|
on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/input[following-sibling::label[text()='#{contextactionvalue1}']]").uncheck
if @flag
on(ContextActions).checkbox_element(:xpath => "//*[@id='divActionContextContainer#{@context}']/div/div/div/div/div/input[following-sibling::label[text()='#{contextactionvalue2}']]").check  
end
end

When(/^I edit "(.*?)" with "(.*?)" and the value as "(.*?)"$/) do |triggertype,arg1,arg2|
if triggertype=="facet refinement trigger"
  on(CreateTriggerGroup).creatingtriggers[@scnt].editbutton_element.click
  on(CreateTriggerGroup).wait_for_ajax
  on(CreateTriggerGroup).creatingtriggers[@scnt].removefacettype
  on(CreateTriggerGroup).creatingtriggers[@scnt].removefacet
  sleep 3
  steps %{
    When I create "facet refinement trigger" with "#{arg1}" and the value as "#{arg2}"
  }
 elsif triggertype=="keyword trigger"
   steps %{
     When I create "Keyword trigger" with "keywords" and the value as "#{arg2}"
   } 
elsif  triggertype=="trigger group"
  on(CreateTriggerGroup).creatingtriggers[@scnt].editbutton_element.click
  on(CreateTriggerGroup).wait_for_ajax
   steps %{
     When I enter "trigger group name" as "#{arg2}" in "create trigger group page"
     When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
   }
elsif triggertype=="keyword pattern trigger" && arg1=="create trigger group"
    on(CreateTriggerGroup).creatingtriggers[1].editbutton_element.click 
  on(CreateTriggerGroup).wait_for_ajax
  steps %{
    When I click "trigger group radio button" in "create rule page"
  }
end
end

When(/^I cancel the "(.*?)" with "(.*?)"$/) do |triggertype,value|
  if triggertype=="create trigger group" 
  sleep 5
  on(CreateTriggerGroup).creatingtriggers[@tgc].cancelbutton_element.fire_event('onfocus').click
  on(CreateTriggerGroup).wait_for_ajax 
  elsif  triggertype=="trigger group"
  sleep 5
  on(CreateTriggerGroup).creatingtriggers[@tgc].cancelbutton_element.click
  on(CreateTriggerGroup).wait_for_ajax   
  else
  on(CreateTriggerGroup).creatingtriggers[@scnt].cancelbutton_element.click
  on(CreateTriggerGroup).wait_for_ajax 
  end
end

When(/^I delete the "(.*?)" with "(.*?)"$/) do |triggertype,value|
  if value=="modify result set attribute values"
  sleep 3
  @browser.find_element(:xpath,"//table/tbody/tr/td[text()='#{triggertype}']/following::div[2]/input[2]").click
  @plus=@plus-1
  else
  on(CreateTriggerGroup).creatingtriggers[@scnt].deletebutton_element.click
  on(CreateTriggerGroup).wait_for_ajax
  end 
end

When(/^I delete the "(.*?)" from "(.*?)"$/) do |triggertype,trigger|
on(SaturnCreateRulePage).button_element(:id => "buttonDeleteTrigger#{$mytr-1}").click
end

When(/^I enter "(.*?)" as "(.*?)" and select "(.*?)"$/) do |arg1,arg2,arg3|
if arg2=="facet name"
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_facet_type= arg1
sleep 2
on(CreateTriggerGroup).checkautosuggestions(arg1,arg2,arg3)
elsif arg2=="facet value"
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_facet_value= arg1
sleep 2
on(CreateTriggerGroup).checkautosuggestions(arg1,arg2,arg3)  
elsif arg3.include? "pdm"
on(CreateTriggerGroup).creatingtriggers[@scnt].select_pdm_type_1_element.select(arg2)
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_pdm_value_1= arg1
sleep 2
on(CreateTriggerGroup).checkautosuggestions(arg1,arg2,arg3)
elsif arg3 .include? "result set"
on(CreateTriggerGroup).creatingtriggers[@scnt].select_result_set_type_2_element.select(arg2)
on(CreateTriggerGroup).creatingtriggers[@scnt].enter_result_set_value_2=arg1
sleep 2
on(CreateTriggerGroup).checkautosuggestions(arg1,arg2,arg3)
on(CreateTriggerGroup).creatingtriggers[@scnt].chooselogicalop_2_element.select("  >") 
end  
end

Then(/^I should not see "(.*?)" in "(.*?)"$/) do |options,menu,table|
if menu=="General menu"
on(CategoryOverview).general_list_element.when_present.fire_event("onmouseover")
table.raw.each do |op|
on(CategoryOverview).link_element(:xpath => "//div[@id='overviewmenu']/div/ul/li/a[text()='#{op.join("")}']").should_not exist
end
elsif menu=="home page dropdown"
table.raw.each do |op|
on(StellaHomePage).subpage_element.should_not include op.join("")
end
elsif menu =="advanced category page" 
table.raw.each do |op|
on(StellaAdvancedPage).div_element(:xpath => "//div[@id='pagenav']/ul/li/a/div[text()='#{op.join("")}']").should_not exist
end  
elsif menu =="saved set category page"
table.raw.each do |op|
on(StellaAdvancedPage).div_element(:xpath => "//div[@id='pagenav']/ul/li/a/div[text()='#{op.join("")}']").should_not exist
end 
end
end

When(/^I replace "(.*?)" with "(.*?)" from "(.*?)" in "(.*?)"$/) do |rattribute,aattribute,triggertype,cpage|
id=on(TriggerGroupDetail).triggergroupdetail[rattribute].get_input_id_element.element.attribute("id")
on(TriggerGroupDetail).triggergroupdetail[rattribute].removeattribute_element.click  
on(TriggerGroupDetail).text_field_element(:id => id).value = aattribute
@browser.action.send_keys(:tab).perform
end

When(/^I sort the "(.*?)" from "(.*?)"$/) do |colname,page|
if colname=="Trigger Group Name"
 on(SaturnRulesListing).div_element(:xpath => "//*[@id='TBLrules']/thead/tr/th/div[text()='#{colname}']").click
 on(SaturnRulesListing).wait_for_ajax
end
end

Then(/^I should not see "(.*?)" at "(.*?)"$/) do |value,menu|
  on(CreateTriggerGroup).autosuggestions_element.should_not exist
end  

When(/^I edit "(.*?)" with "(.*?)" in "(.*?)"$/) do |op1,op2,page|
  @mrs=@mrsactions.index(op1)
  @myac=@mrs+1
end

When(/^I enter "(.*?)" as "(.*?)" for "(.*?)" in "(.*?)"$/) do |seq,num,value,page|
  on(SaturnCreateRulePage).text_field_element(:xpath => "//td[text()='#{value}']/preceding-sibling::td/input").value=num
end

When(/^I search "(.*?)" as "(.*?)" with "(.*?)"$/) do |filtervalue,filtertype,viewtype|
  on(SaturnRulesListing).FilterByoptions(filtertype,filtervalue,viewtype)
end

When(/^I search "(.*?)" as "(.*?)" with "(.*?)" as "(.*?)" in "(.*?)"$/) do |filtevalue,filtertype,filteroption,filtertext,page|
  if filtertype == "Rule Name"
  filtevalue=@rulenames[filteroption]
   on(SaturnRulesListing).FilterByoptions(filtertype,filtevalue,filteroption)
  @creator =on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[2]").text  
  @created_date =on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[3]").text
  @modifier=  on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[4]").text
  @modifier_date=  on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[5]").text
  @start_date=  on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[6]").text
  @end_date= on(SaturnRulesListing).cell_element(:xpath => "//tr[1]/td[child::span[text()='#{@rulenames[filteroption]}'] or child::a/span[text()='#{@rulenames[filteroption]}']]/following-sibling::td[7]").text
  elsif filtertype =="rule name type"
    if @current_rule_name.include? filtevalue
    on(SaturnRulesListing).FilterByoptions("Rule Name",@current_rule_name,filteroption)
    else
    on(SaturnRulesListing).FilterByoptions("Rule Name",filtevalue,filteroption)
    end
  elsif filtertype == "Creator"
   on(SaturnRulesListing).FilterByoptions(filtertype,@creator,filteroption) 
  elsif filtertype == "Created Date"
   on(SaturnRulesListing).FilterByoptions(filtertype,@created_date,filteroption) 
  elsif filtertype == "Modifier"
   on(SaturnRulesListing).FilterByoptions(filtertype,@modifier,filteroption)
  elsif filtertype == "Modified Date"
   on(SaturnRulesListing).FilterByoptions(filtertype,@modifier_date,filteroption) 
  elsif filtertype == "Effective Date - Expiration Date"
  on(SaturnRulesListing).filtertype_element.select(filtertype)
  @browser.action.send_keys(:tab).perform
  on(SaturnRulesListing).inputvalue_element.clear
  on(SaturnRulesListing).inputvalue = @start_date
  @browser.action.send_keys(:tab).perform
  on(SaturnRulesListing).inputvaluem_element.clear
  on(SaturnRulesListing).inputvaluem = @end_date
  on(SaturnRulesListing).filteroptions_element.select(filteroption)
  on(SaturnRulesListing).wait_for_ajax
  sleep 5
 end
end

When(/^I append "(.*?)" with "(.*?)" in the "(.*?)"$/) do |tgname,appendvalue,page|
if tgname=="existing suggestion rule"
  on(SaturnAutoSuggestionRule).asrulename_element.append appendvalue
elsif page == "canvas id or name field"
on(SaturnCreateRulePage).addaction[@sm].enter_canvas_id_element.append appendvalue
sleep 2  
else  
on(FindTriggerGroup).triggergroupname_element.append appendvalue
sleep 2
end
end

When(/^I enter "(.*?)" as "(.*?)" to have "(.*?)"$/) do |tgname,val,page|
@autosuggestions=Array.new
on(FindTriggerGroup).triggergroupname_element.clear
on(FindTriggerGroup).triggergroupname_element.value=val
sleep 6
on(CreateTriggerGroup).autosuggestions_element.list_item_elements.each{ |c| @autosuggestions << c.text}
end

When(/^I replace the "(.*?)" with "(.*?)" in "(.*?)"$/) do |tr1,tr2,tr|
on(SaturnCreateRulePage).button_element(:id => "buttonSaveTrigger#{$mytr-1}").click
$mytr=$mytr-1
end

When(/^I edit the "(.*?)" with "(.*?)" in "(.*?)"$/) do |trigger,triggertype,page|
if trigger == "Canvas media type"
  @sm=@ca
  @myac=@ca+1
  on(SaturnRuleDetailPage).button_element(:id => "buttonSaveAction#{@sm}").click
elsif trigger == "category id"
  on(SaturnRuleDetailPage).text_field_element(:xpath => "//input[@id='inputCategoryID0' or @id='inputCategoryID']").value=triggertype
else  
on(SaturnCreateRulePage).wait_for_ajax
sleep 4
$mytr=0
@amt=nil
on(SaturnCreateRulePage).button_element(:id => "buttonSaveTrigger#{$mytr}").click
end
end  

Then(/^I should see "(.*?)" with "(.*?)" with respective values "(.*?)"$/) do |numofrows,colname,colvalue|
  steps %{
    Given I connect to the database
  }
  inputs = colvalue.split(",")
  default_site_rdpp_rule = $dbhsaturn.execute("select count(*) from rdpp_assignment where merch_action_id = (select merch_action_id from merch_rule_action_assn where merch_rule_id =(select merch_rule_id from merch_rule where MERCH_RULE_NAME='#{inputs[0]}' and SITE_TENANT = '#{inputs[1]}' and PUBLISH_FLAG='#{inputs[2]}') )")
  default_site_rdpp_rule .fetch do |row|
   assert_equal(row[0].to_int,1)
  end
end

When(/^I select the "(.*?)" more than one from "(.*?)"$/) do |actiontype, action|
  if actiontype =="RDPP Algorithm"
    @rdpp1=@rdpp
  end
  
end

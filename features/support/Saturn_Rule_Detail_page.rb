class SaturnRuleDetailPage < Test::Unit::TestCase
  attr_accessor :instance
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  
  text_field(:rulename, :id => "name")
  text_field(:desc, :id => "description")
  text_field(:effectivedate, :id => "startDate")
  text_field(:expirationdate, :id=> "endDate")
  button(:addactionbtn, :id => "addActionBtn")
  table(:tablefacet,:id => "tableFacet")
  select_list(:categoryfacettype, :id => "catfacetlist")
  checkbox(:facetvalue, :id => "cbox_testing0")
  button(:saverule, :id => "ruleSave")
  text_field(:facetscount, :xpath => "//table[@id='displayFacetsTable']/tbody/tr/td[1]/input")
  div(:context_attributes_check, :xpath => "//div[@id='contextAttr']/div/div[2][child::div/input[@checked='checked']]/following-sibling::div[position()=1 and following-sibling::div[@id='inventory']][child::div/input[@checked='checked']]")
  select_list(:rdppdb, :id => "dropdownRDPPRule0")
  text_field(:efd, :id => "startDateValue0")
  element(:rdpps, :xpath => "//select[contains(@id,'dropdownRDPPRule')]")
  select_list(:triggertype, :id => "dropdownTriggerType0")
  text_field(:rddpnoresults, :xpath => "//table[@id='displayFacetsTable']/tbody/tr/td[1][not(child::input)]")
  link(:rtmr, :text => "< Return to Merchandising Rules")
  select_list(:inherittypes, :id => "inheritTypeDropdown0")
  select_list(:actiontypes, :id => "dropdownActionType0")
  button(:editinrulesdetailed, :id => "editRuleBtn")
  list_item(:popupmsg, :xpath => "//*[@id='msgDialog']/div/ul/li")
  button(:msgbtn, :xpath => "//div[@class='ui-dialog-buttonset']/button/span")
  button(:saverulesdetailed, :id => "ruleDetailSave")
  label(:creationdate, :id => "creationDate")
  button(:copybutton, :xpath => "//*[@id='triggerGroupCopy' or @id='copyRuleBtn']")
  text_field(:gettriggergroup,:xpath => "//input[contains(@id,'inputTriggerGroupText') and preceding-sibling::input[not(@disabled)]]")
   div(:ruleid, :xpath => "//*[@id='editRuleForm']/div[1]/div[1]")
   indexed_property(:cart_contents, [
    [:select_list, :title, {:id => 'dropdownRDPPRule%s'}],
  ])  
   indexed_property :addaction, [[:select_list, :selectaction, {:id => "divActionType%s"}],
                                [:text_field, :entercategoryid, {:id => "inputCategoryID%s"}],
                                [:button, :selectfacetbtn, {:id => "buttonCategoryID%s"}],
                                [:button, :okorcancelbtnonselectfacetwindow, {:xpath => "//div[@class='ui-dialog-buttonset']/button[%s]/span"}],
                                [:button, :saveaction, {:id => "buttonSaveAction%s"}],
                                [:checkbox, :facetvalue, {:xpath => "//label[text()='%s']/preceding-sibling::input[1]"}],
                                [:table, :mrsattributetype, {:xpath => "//*[@id='boostAttributeTable%s_0']"}],
                                [:select_list, :rdpp_algorithm_type, {:id => "dropdownRDPPRule%s_0"}],
                                [:text_field, :effective_date, {:id => "startDateValue%s_0"}],
                                
] 
  
 indexed_property :addtrigger, [[:select_list, :selecttrigger, {:id => "dropdownTriggerType%s"}],
                                 [:select_list, :selecresultsettrigger, {:id => "dropdownResultSetTrigger0_%s"}],
                                 [:text_field, :resultsetvalue, {:xpath => "//select[@id='dropdownResultSetTrigger0_%s']/following-sibling::span/input"}],
                                 [:select_list, :selectlogicaloperator, {:id => "logicalDropdownResultSetTrigger0_%s"}],
                                 [:button, :addbtn, {:id => "buttonAdd0_%s"}], 
                                 [:button, :savetrigger, {:id => "buttonSaveTrigger%s"}],
                                 [:text_field, :percentage, {:id => "inputPercent0_%s"}],
                                 [:button, :canceltrigger, {:id => "buttonDeleteTrigger%s"}],
                                 [:button, :edittrigger, {:id => "buttonSaveTrigger%s"}],
                                 [:list_item, :popupmsg, {:xpath => "//*[@id='msgDialog']/div/ul/li[%s]"}],
                                 [:button, :removeattribute, {:id => "buttonRemove0_%s"}],
                                 [:checkbox, :navigationtype, {:xpath => "//div[@id='navigation']/div/span[text()='%s']/preceding-sibling::input"}],
                                 [:text_field, :dresultsetvalue, {:xpath => "//select[child::option[@selected='selected' and text()='%s']]/following-sibling::span/span/span/span[2]"}],
                                 [:select_list, :dselectlogicaloperator, {:xpath => "//select[child::option[@selected='selected' and text()='%s']]/following-sibling::select/option[@disabled='disabled']"}],
                                 [:text_field, :dpercentage, {:xpath => "//select[child::option[@selected='selected' and text()='%s']]/following-sibling::input[starts-with(@id,'inputPercent')]"}]
       ] 
  
  def search_results
    $exprdd = Array.new
    $expsedates = Array.new
    self.select_list_elements(:xpath => "//select[contains(@id,'dropdownRDPPRule')]").each{ |c| $exprdd << c.selected_options}
    self.text_field_elements(:xpath => "//input[contains(@id,'startDateValue')]").each{ |c| $expsedates << c.element.attribute("value")}
    self.text_field_elements(:xpath => "//input[contains(@id,'endDateValue')]").each{ |c| $expsedates << c.element.attribute("value")}
  end
  
  def comparingValues(act,exp)
  
  end
 
  def checkstarus(input)
    assert_true(input)
  end
 
 def contextattributecheck
   self.context_attributes_check?.should be_true
 end
 
  def getSavedSetQueryDetails
    $ssqid = Array.new
    attempts=0
    begin
      @browser.find_element(:xpath,"//div[@id='actions' and count(child::div)>=1]").click
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end

    @ssqc =@browser.find_elements(:xpath, "//div[@id='actions']/div").size
    for k in 1..@ssqc
      $sqv=@browser.find_element(:xpath,"//div[@id='actions']/div[#{k}]/div[4]/textarea").attribute('value')
      $ssqid =$sqv.split(",").map { |x| x.to_i }
    end
    #puts $ssqid
    #puts "=============================="
  end

  def getRdppDetails
    $rdppuivalues =Array.new
    attempts=0
    begin
      @browser.find_element(:xpath,"//div[@id='actions' and count(child::div)>=1]").click
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end
    @rdppc =@browser.find_elements(:xpath, "//div[@id='actions']/div").size
    for k in 1..@rdppc
      $rdppuivalues <<  @browser.execute_script("var x = document.getElementById('dropdownRDPPRule0').selectedIndex;
      var y = document.getElementById('dropdownRDPPRule0').options;
       return y[x].text")
      $rdppuivalues << @browser.find_element(:xpath,"//div[@id='actions']/div[#{k}]/div[3]/div/input[preceding-sibling::label][1]").attribute('value')
      $rdppuivalues << @browser.find_element(:xpath,"//div[@id='actions']/div[#{k}]/div[3]/div/input[preceding-sibling::label][2]").attribute('value')
    end
  end

  def getFacetDetails
    $suivalues = Array.new
    attempts=0
    begin
      @browser.find_element(:xpath,"//table[@id='displayFacetsTable']/tbody/tr").click
      sleep 6
    rescue Selenium::WebDriver::Error => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end
    @nsf= @browser.find_elements(:xpath,"//table[@id='displayFacetsTable']/tbody/tr").size
    for z in 1..@nsf
      for v in 1..4
        if v!=2
          $suivalues << @browser.find_element(:xpath,"//table[@id='displayFacetsTable']/tbody/tr[#{z}]/td[#{v}]/input").attribute('value')
        else
          $suivalues << @browser.find_element(:xpath,"//table[@id='displayFacetsTable']/tbody/tr[#{z}]/td[not(position()=3)][#{v}]").text
        end
      end
    end

    for k in 0..$suivalues.length
      if $suivalues[k] == "on"
        $suivalues[k] = "true"
      elsif $suivalues[k] == "off"
        $suivalues[k] = "false"
      end
    end

  end
end


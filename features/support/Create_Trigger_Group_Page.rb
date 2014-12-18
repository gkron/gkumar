class CreateTriggerGroup < Test::Unit::TestCase
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery
  text_field(:triggergroupname,:id => "name")
  text_area(:desc,:id => "description")
  button(:addtrigger,:id => "addTriggerBtn")
  button(:savecreatetriggergroup,:id => "triggerGroupSave")
  unordered_list(:errortriggergroupvalidation,:xpath => "//*[@id='msgDialog']/div/ul")
  unordered_list(:errormessages,:class => "errorList")
  unordered_list(:autosuggestions,:xpath => "//ul[@class='ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all' and contains(@style,'display: block;')]")
  select_list(:selecttrigger, :id => "dropdownTriggerType0")
  div(:popmsg, :xpath => "//*[@id='msgDialog']/div")
  button(:savetriggerbtn, :xpath => "//div[starts-with(@id,'divTrigger')]/input[@value='save'][last()]")
  indexed_property :creatingtriggers, [[:select_list, :select_trigger_dropdown, {:id => "dropdownTriggerType%s"}],
                           [:text_field, :enter_search_keyword, {:xpath => "//div[@id='divCriteriaB%s_0']/span/input"}],
                           [:select_list, :select_keyword_pattern_type, {:id => "dropdownKeywordPatternCriteria0_%s"}],
                           [:text_field, :enter_keyword_pattern_value, {:xpath => "//div[@id='divCriteriaA0_%s']/span[2]/input"}],
                           [:select_list, :select_result_set_type, {:id => "dropdownResultSetTrigger0_%s"}],
                           [:select_list, :select_result_set_type_2, {:id => "dropdownResultSetTrigger2_%s"}],
                           [:text_field, :enter_result_set_value_2, {:xpath => "//div[@id='divSubCriteriaA2_%s']/span/input"}],
                           [:select_list, :chooselogicalop_2, {:id => "logicalDropdownResultSetTrigger2_%s"}],
                           [:text_field, :enter_result_set_value, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span/input"}],
                           [:select_list, :chooselogicalop, {:id => "logicalDropdownResultSetTrigger0_%s"}],
                           [:button, :savetrigger, {:id => "buttonSaveTrigger%s"}],
                           [:select_list, :select_pdm_type, {:id => "dropdownProductDataMatch0_%s"}],
                           [:select_list, :select_pdm_type_1, {:id => "dropdownProductDataMatch1_%s"}],
                           [:text_field, :enter_pdm_value, {:xpath => "//div[@id='divCriteriaA0_%s']/span/input"}],
                           [:text_field, :enter_pdm_value_1, {:xpath => "//div[@id='divCriteriaA1_%s']/span/input"}],
                           [:text_field, :enter_facet_type, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[1]/input"}],
                           [:text_field, :enter_facet_value, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[2]/input"}],
                           [:select_list, :select_result_count_type, {:id => "numDropdown%s"}],
                           [:text_field, :enter_result_count_value, {:id => "numInput1"}],
                           [:select_list, :select_keyword_pattern_type_mul, {:id => "dropdownKeywordPatternCriteria%s_1"}],
                           [:text_field, :enter_keyword_pattern_value_mul, {:xpath => "//div[@id='divCriteriaA%s_1']/span[2]/input"}],
                           [:select_list, :select_result_count_type, {:id => "numDropdown%s"}],
                           [:text_field, :enter_result_count_val, {:id => "numInput%s"}],
                           [:link, :removefacet, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[1]/span/span/span[2]/a"}],
                           [:link, :removefacettype, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[2]/span/span/span[2]/a"}],
                           [:select_list, :select_result_set_type_mul, {:id => "dropdownResultSetTrigger%s_0"}],
                           [:text_field, :enter_result_set_value_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span/input"}],
                           [:select_list, :chooselogicalop_mul, {:id => "logicalDropdownResultSetTrigger%s_0"}],
                           [:select_list, :select_pdm_type_mul, {:id => "dropdownProductDataMatch%s_0"}],
                           [:text_field, :enter_pdm_value_mul, {:xpath => "//div[@id='divCriteriaA%s_0']/span/input"}],
                           [:text_field, :enter_facet_type_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span[1]/input"}],
                           [:text_field, :enter_facet_value_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span[2]/input"}],
                           [:button, :editbutton, {:id => "buttonSaveTrigger%s"}],
                           [:button, :cancelbutton, {:id => "buttonDeleteTrigger%s"}],
                           [:button, :deletebutton, {:id => "buttonDeleteTrigger%s"}],
                           ]
  def checkautosuggestions(sval,stype,cpage)
    @autosuggestions =Array.new
    begin
      on(CreateTriggerGroup).autosuggestions_element.list_item_elements.each{ |c| @autosuggestions << c.text}
      @num=rand(@autosuggestions.size)
      if @autosuggestions.uniq.length==@autosuggestions.length
        on(CreateTriggerGroup).autosuggestions_element.list_item_element(:index => @num).link_element.click
      end
    rescue
    end
  end

  def setKeywordTrigger(triggertype,val,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.creatingtriggers[index].enter_search_keyword=val
    @browser.action.send_keys(:tab).perform
  end

  def setKeywordPatternTrigger(triggertype,attributetype,attributevalue,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    self.creatingtriggers[index].select_keyword_pattern_type_mul_element.select(attributetype)
    self.wait_for_ajax
    self.creatingtriggers[index].enter_keyword_pattern_value_mul=attributevalue
    @browser.action.send_keys(:tab).perform
  end

  def setResultCountTrigger(triggertype,attributetype,attributevalue,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    self.select_list_element(:id => "numDropdown#{index}").select(attributetype)
    self.wait_for_ajax
    self.text_field_element(:id => "numInput#{index}").value=attributevalue
  end

  def setCategoryIDSTrigger(triggertype,attributevalue,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    on(CreateTriggerGroup).text_field_element(:xpath => "//input[@id='inputCategoryID' or @id='inputCategoryID#{$mytr}' and preceding-sibling::label[@id='labelCategoryIDs#{$mytr}']]").value=attributevalue
  end

  def setResultSetTrigger(triggertype,attributetype,attributevalue,logicalop,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    self.creatingtriggers[index].select_result_set_type_mul_element.select(attributetype)
    self.wait_for_ajax
    @browser.action.send_keys(:tab).perform
    self.creatingtriggers[index].enter_result_set_value_mul=attributevalue
    @browser.action.send_keys(:tab).perform
    self.creatingtriggers[index].chooselogicalop_mul_element.select(logicalop)
    @browser.action.send_keys(:tab).perform
  end

  def setProductDataMatchTrigger(triggertype,attributetype,attributevalue,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    self.creatingtriggers[index].select_pdm_type_mul_element.select(attributetype)
    self.wait_for_ajax
    @browser.action.send_keys(:tab).perform
    self.creatingtriggers[index].enter_pdm_value_mul=attributevalue
    @browser.action.send_keys(:tab).perform
  end

  def setFacetRefinementTrigger(triggertype,facettype,facetvalue,index)
    self.creatingtriggers[index].select_trigger_dropdown_element.select(triggertype)
    self.wait_for_ajax
    self.creatingtriggers[index].enter_facet_type_mul=facettype
    self.wait_for_ajax
    @browser.action.send_keys(:tab).perform
    self.creatingtriggers[index].enter_facet_value_mul=facetvalue
    self.wait_for_ajax
    @browser.action.send_keys(:tab).perform
  end

end
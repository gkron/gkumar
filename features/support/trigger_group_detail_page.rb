class TriggerGroupDetail < CreateTriggerGroup
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery
  button(:triggergroupedit,:id => "triggerGroupEdit")
  div(:trigergroupheader,:text => "Trigger Group:")
  select_list(:numtriggers,:xpath => "//*[starts-with(@id,'dropdownTriggerType')]")
  button(:savetriggergroupdetailpage, :id => "triggerGroupDetailSave")
  link(:tgassociatewithrule, :id => "linkAssociatedRules")
  indexed_property :triggergroupdetail, [[:select_list, :select_trigger_dropdown, {:id => "dropdownTriggerType%s"}],
                                         [:text_field, :get_input_id, {:xpath => "//a[@title='Remove Tag' and parent::span[text()='%s']]/ancestor::span/input"}],
                                         [:link, :removeattribute, {:xpath => "//a[@title='Remove Tag' and parent::span[text()='%s']]"}],
                                         [:span,:search_query_value, {:xpath => "//div[@id='divCriteriaA%s']/div[2]/span/span"}],
                                         [:label,:keyword_pattern_attribute_type, {:id => "labelKeywordPatternCriteria0_%s"}],
                                         [:span, :keyword_pattern_attribute_value, {:xpath => "//div[@id='divCriteriaA0_%s']/span[2]/span"}],
                                         [:select_list, :resultset_type, {:id => "dropdownResultSetTrigger0_%s"}],
                                         [:span, :resultset_value, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span/span/span/span[2]"}],
                                         [:select_list, :resultset_logicalop, {:id => "logicalDropdownResultSetTrigger0_%s"}],
                                         [:text_field, :resultset_percentage, {:id => "inputPercent0_%s"}],
                                         [:span, :facet_type, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span/span/span/span[2]"}],
                                         [:span, :facet_value, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[2]/span/span[1]/span[2]"}],
                                         [:span, :facet_value_ad, {:xpath => "//div[@id='divSubCriteriaA0_%s']/span[2]/span/span[2]/span[2]"}],
                                         [:select_list, :pdm_attribute_type, {:id=> "dropdownProductDataMatch0_%s"}],
                                         [:span, :pdm_attributevalue, {:xpath => "//div[@id='divCriteriaA0_%s']/span/span/span[1]/span[2]"}],
                                         [:span, :pdm_attributevalue_ad, {:xpath => "//div[@id='divCriteriaA0_%s']/span/span/span[2]/span[2]"}],
                                         [:select_list, :select_result_count_type, {:id => "numDropdown%s"}],
                                         [:text_field, :enter_result_count_val, {:id => "numInput%s"}],
                                         [:label,:keyword_pattern_attribute_type_mul, {:id => "labelKeywordPatternCriteria%s_1"}],
                                         [:span, :keyword_pattern_attribute_value_mul, {:xpath => "//div[@id='divCriteriaA%s_1']/span[2]/span/span/span[2]"}],
                                         [:select_list, :resultset_type_mul, {:id => "dropdownResultSetTrigger%s_0"}],
                                         [:span, :resultset_value_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span/span/span/span[2]"}],
                                         [:select_list, :resultset_logicalop_mul, {:id => "logicalDropdownResultSetTrigger%s_0"}],
                                         [:text_field, :resultset_percentage_mul, {:id => "inputPercent%s_0"}],
                                         [:span, :facet_type_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span/span/span/span[2]"}],
                                         [:span, :facet_value_mul, {:xpath => "//div[@id='divSubCriteriaA%s_0']/span[2]/span/span/span[2]"}],
                                         [:select_list, :pdm_attribute_type_mul, {:id=> "dropdownProductDataMatch%s_0"}],
                                         [:span, :pdm_attributevalue_mul, {:xpath => "//div[@id='divCriteriaA%s_0']/span/span/span/span[2]"}],

   ]
  def getKeywordTrigger(triggertype,val)
    self.triggergroupdetail[$hash[triggertype]].select_trigger_dropdown_element.selected?(triggertype).should be_true
    self.triggergroupdetail[$hash[triggertype]].search_query_value_element.text.should==val
  end

  def getKeywordPatternTrigger(triggertype,attributetype,attributevalue)
    self.triggergroupdetail[$hash[triggertype]].select_trigger_dropdown_element.selected?(triggertype).should be_true
    self.triggergroupdetail[$hash[triggertype]].keyword_pattern_attribute_type_mul_element.text.should include attributetype
    self.triggergroupdetail[$hash[triggertype]].keyword_pattern_attribute_value_mul_element.text.should include attributevalue
  end

  def getResultSetTrigger(triggertype,attributetype,attributevalue,logicalop)
    self.triggergroupdetail[$hash[triggertype]].select_trigger_dropdown_element.selected?(triggertype).should be_true
    self.triggergroupdetail[$hash[triggertype]].resultset_type_mul_element.selected?(attributetype).should be_true
    self.triggergroupdetail[$hash[triggertype]].resultset_value_mul_element.text.should include attributevalue
    self.triggergroupdetail[$hash[triggertype]].resultset_logicalop_mul_element.selected?(logicalop).should be_true
  end

  def getProductDataMatchTrigger(triggertype,attributetype,attributevalue)
    self.triggergroupdetail[$hash[triggertype]].select_trigger_dropdown_element.selected?(triggertype).should be_true
    self.triggergroupdetail[$hash[triggertype]].pdm_attribute_type_mul_element.selected?(attributetype).should be_true
    self.triggergroupdetail[$hash[triggertype]].pdm_attributevalue_mul_element.text.should include attributevalue
  end

  def getFacetRefinementTrigger(triggertype,facettype,facetvalue)
    self.triggergroupdetail[$hash[triggertype]].select_trigger_dropdown_element.selected?(triggertype).should be_true
    self.triggergroupdetail[$hash[triggertype]].facet_type_mul_element.text.should include facettype
    self.triggergroupdetail[$hash[triggertype]].facet_value_mul_element.text.should include facetvalue
  end

end
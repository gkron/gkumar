class SaturnRulesListing
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  select_list(:filteroptions, :id => "filterNavType")
  select_list(:filtertype, :id => "filterTypeList")
  text_field(:inputvalue, :id => "filterRuleVal")
  text_field(:inputvaluem, :id => "filterRuleVal2")
  button(:clickgo, :id => "filterRuleBtn")
  link(:clickruleid, :xpath => "//*[@id='TBLrules']/tbody/tr[1]/td[1]/a")
  link(:triggergrouplink, :xpath => "//*[@id='TBLrules']/tbody/tr/td[10]/a")
  table(:ruleslisting, :id => "TBLrules")
  span(:clearlink, :id =>"filterRuleClearLink")
  unordered_list(:autosuggestions, :xpath => "//ul[contains(@class,'ui-autocomplete') and contains(@style,'display: block;')]")
  def FilterByoptions(filtertypes,iv,filteroption)
    self.filtertype_element.select(filtertypes)
    @browser.action.send_keys(:tab).perform
    self.inputvalue_element.clear
    self.inputvalue =iv
    if self.autosuggestions?
      on(CreateTriggerGroup).checkautosuggestions(filtertypes,iv,filteroption)
    end
    self.filteroptions_element.select(filteroption)
    self.clickgo_element.click
    self.wait_for_ajax
    sleep 5
  end
end
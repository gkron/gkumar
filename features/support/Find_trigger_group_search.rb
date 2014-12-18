class FindTriggerGroup < Test::Unit::TestCase
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery
  
  select_list(:findtriggergroup,:id => "filterTypeList")
  text_field(:triggergroupname,:id => "filterRuleVal")
  button(:gobutton,:id => "filterTriggerBtn")
end
class SaturnHomePage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  text_field(:glbsearchbox, :id => "globalSrchField")
  button(:go, :xpath => "//button/span[text()='Go']")
  table(:searchlist, :id => "TBLrules")
  link(:ruleslink, :text => "RULES")
  link(:ruleslisting, :text => "Merchandising Rules")
  select_list(:searchtype, :id => "searchCommand.typeKey")
  text_field(:gbid, :id =>"inputId")
  link(:createrule, :text => "Create Rule")
  link(:linguistics, :text => "LINGUISTICS")
  link(:LinguisticsBulkUpload, :text => "Linguistics Bulk Upload")
  link(:autocomplete, :text => "AUTOCOMPLETE")
  link(:RulesBulkUpload, :text => "Rules Bulk Upload")
  link(:VocabularyBulkUpload, :text => "Vocabulary Bulk Upload")
  select_list(:globalsearch,:id => "globalSrchList")
  link(:suggestionrule, :text => "Suggestion Rules")
  unordered_list(:rulemenuslinks, :class => "level2")

  indexed_property :menu, [[:link, :menu_link_name, {:xpath => "//*[text()='%s']"}],
                           [:link, :submenu_link_name, {:xpath => "//*[text()='%s']"}]
  ]
  def  global_search(option,name)
    self.globalsearch_element.select(option)
    self.glbsearchbox = name
    self.wait_for_ajax
    self.go
    self.wait_for_ajax
  end

  def search_for_rule(rulename)
    self.glbsearchbox=rulename
    @browser.action.send_keys(:tab).perform
    self.go
    self.wait_for_ajax
    sleep 5
    # attempts=0
    # begin
      # self.searchlist?
    # rescue Exception => exc
    # attempts=attempts+1
    # retry unless attempts > 10
    # ensure
    # #raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    # end
  end

  def ElementPresent
    #self.searchlist?.should be_true
  end

  def NavigateToRulesListing
    self.ruleslink_element.hover
    self.ruleslisting_element.click
    self.wait_for_ajax
  end

  def NavigateToCreateRulePage
    self.ruleslink_element.hover
    self.createrule_element.click
    self.wait_for_ajax
  end

  def NavigateTolinguisticsupload
    self.linguistics_element.hover
    self.LinguisticsBulkUpload_element.click
    sleep 5
  #self.wait_for_ajax
  end

  def NavigateToVocabularyBulkUpload
    self.autocomplete_element.hover
    self.VocabularyBulkUpload_element.click
    self.wait_for_ajax
  end

  def NavigateToRulesBulkUpload
    self.autocomplete_element.fire_event("onmouseover")
    self.RulesBulkUpload_element.click
    self.wait_for_ajax
  end

  def NavigateToSuggestionRulePage
    self.autocomplete_element.fire_event("onmouseover")
    self.suggestionrule_element.click
    self.wait_for_ajax
  end

  def NavigateToSubPages(sp,mp)
    self.menu[mp].menu_link_name_element.fire_event("onmouseover")
    self.menu[sp].submenu_link_name_element.click
    self.wait_for_ajax
    sleep 6
  end

end
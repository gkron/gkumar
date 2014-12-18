class SaturnCreateRulePage < Test::Unit::TestCase
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  text_field(:rulename, :id => "name")
  text_field(:desc, :id => "description")
  text_field(:effectivedate, :id => "startDate")
  text_field(:expirationdate, :id=> "endDate")
  button(:addactionbtn, :id => "addActionBtn")
  select_list(:categoryfacettype, :id => "catfacetlist")
  checkbox(:facetvalue, :id => "cbox_testing0")
  button(:saverule, :id => "ruleSave")
  button(:addtriggerbtn, :id => "addTriggerBtn")
  button(:savetrigers, :id => "buttonSaveTrigger0")
  button(:pluslink, :xpath => "//input[contains(@id,'buttonAdd')]")
  checkbox(:triggergroup, :xpath => "//input[following-sibling::label[text()='Trigger Group:'] and not(@disabled)]")
  text_field(:enter_trigger_group, :xpath => "//input[following-sibling::label[text()='Trigger Group:'] and not(@disabled)]/following-sibling::input[4]")
  label(:contextattributescondition, :id => "cALabelCondition")
  radio_button(:allcountries, :id => "country_0")
  select_list(:select_attribute_key, :id => "catfacetlist")
  unordered_list(:selectattributevalue, :id => "catFacetCBox")
  span(:okonselecattwindow, :xpath => "//div[@class='ui-dialog-buttonset']/button/span[text()='Ok']")
  span(:cancelonselecattwindow, :xpath => "//div[@class='ui-dialog-buttonset']/button/span[text()='Cancel']")
  span(:okonselect, :xpath => "//div[6]/div[11]/div/button[1]")
  text_field(:enter_key_attri, :id => "input_facet_autosuggest")
  checkbox(:globaloperator, :id => "triggerGlobalOperatorOr") 
  checkbox(:globaloperatorand, :id => "triggerGlobalOperatorAnd")
  
  indexed_property :addaction, [[:select_list, :selectaction, {:id => "divActionType%s"}],
                                [:text_field, :entercategoryid, {:id => "inputCategoryID%s"}],
                                [:button, :selectfacetbtn, {:id => "buttonCategoryID%s"}],
                                [:button, :okorcancelbtnonselectfacetwindow, {:xpath => "//div[@class='ui-dialog-buttonset']/button[%s]/span"}],
                                [:button, :saveaction, {:id => "buttonSaveAction%s"}], 
                                [:checkbox, :facetvalue, {:xpath => "//label[text()='%s']/preceding-sibling::input[1]"}],
                                [:text_field, :enter_url_for_redirect, {:id => "inputURLRedirect%s"}],
                                [:text_field, :replace_with_term, {:id => "inputTextTermId%s"}],
                                [:text_area, :product_id, {:id => "inputProductID%s_0"}],
                                [:text_area, :savedsetqueryid, {:id => "inputSavedSet%s_0"}],
                                [:select_list, :filterby, {:id => "showFacetFiltersDropdown%s"}],
                                [:button, :showfacetfindbutton, {:id => "showFacetFindButton%s"}],
                                [:checkbox, :selectfacet, {:xpath => "//input[preceding-sibling::label[text()='%s']]"}],
                                [:cell, :displayed_facets, {:xpath => "//td[@id='colB' and text()='%s']"}],
                                [:select_list, :select_action_menu, {:id => "selectOperator%s"}],
                                [:text_field, :sequence, {:id => "boostAttributeSequence_%s_0"}],
                                [:button, :addattributevalue, {:id => "addAttributeValue_%s_0"}],
                                [:cell, :viewattributevalue, {:xpath => "//*[@id='boostAttributeTable%s_0']/tbody/tr/td[3]"}],
                                [:checkbox, :checkattributevalues, {:xpath => "//label[text()='%s']/preceding-sibling::input[1]"}],
                                [:select_list, :selectshowmediatype, {:id => "mediaTypeDropdown%s"}],
                                [:text_area, :enter_display_message, {:id => "textDisplayMessage%s"}],
                                [:select_list, :rdpp_algorithm_type, {:id => "dropdownRDPPRule%s_0"}],
                                [:text_field, :effective_date, {:id => "startDateValue%s_0"}],
                                [:text_field, :expiration_date, {:id => "endDateValue%s_0"}],
                                [:text_field, :enter_pdp_id, {:id => "inputPDPID%s"}],
                                [:text_field, :enter_media_group_id, {:id => "mediaLocationPoolId%s_0"}],
                                [:select_list, :select_location, {:id => "mediaLocationDropdown%s_0"}],
                                [:select_list, :select_display_type, {:id => "actionValuesDropdown%s"}],
                                [:button, :addactiontype, {:id => "addButton0_%s"}],
                                [:select_list, :showfacetoperator, {:id => "showFacetOperator%s"}],
                                [:text_field, :enter_canvas_id, {:id => "mediaCanvasId%s"}]
                                 ]
  indexed_property :addtrigger, [[:select_list, :selecttrigger, {:id => "dropdownTriggerType%s"}],
                                 [:select_list, :selecresultsettrigger, {:id => "dropdownResultSetTrigger0_%s"}],
                                 [:text_field, :resultsetvalue, {:xpath => "//select[@id='dropdownResultSetTrigger0_%s']/following-sibling::span/input"}],
                                 [:select_list, :selectlogicaloperator, {:id => "logicalDropdownResultSetTrigger0_%s"}],
                                 [:button, :addbtn, {:id => "buttonAdd0_%s"}],
                                 [:button, :addbtn_1, {:xpath => "//*[@id='buttonAdd1_%s']"}],
                                 [:button, :addbtn_2, {:xpath => "//*[@id='buttonAdd2_%s']"}],
                                 [:button, :savetrigger, {:id => "buttonSaveTrigger%s"}],
                                 [:text_field, :percentage, {:id => "inputPercent0_%s"}],
                                 [:select_list, :selecpdmtrigger, {:id => "dropdownProductDataMatch0_%s"}],
                                 [:text_field, :enterpdmvalue, {:xpath => "//div[@id='divCriteriaA0_%s']/span/input"}],
                                 [:select_list, :selectkeywordpattern, {:id => "dropdownKeywordPatternCriteria%s_1"}],
                                 [:checkbox, :navigationcontextattribute, {:xpath => "//div[@id='navigation']/div/input[following-sibling::span[text()='%s']]"}],
                                 [:checkbox, :triggergroupcheckbox, {:id => "radioTriggerGroup%s"}],
                                 [:text_field, :enter_trigger_group_name, {:id => "inputTriggerGroupText%s"}],
                                 [:checkbox, :check_trigger_radio_button, {:id => "radioTrigger%s"}],
                                 [:checkbox, :context_attribute_val, {:xpath => "//div/input[following-sibling::span[text()='%s']]"}],
                                 [:text_field, :enter_category_ids, {:xpath => "//input[@id='inputCategoryID%s']"}],
                                 [:checkbox, :include_all_children, {:xpath => "//input[@id='cboxCategoryID%s']"}],
                                 [:text_area, :expect_cateids_their_children, {:id => "textareaCategoryID%s"}],
                                 [:select_list, :result_set_price_type, {:id => "dropdownResultSetTrigger%s_0"}],
                                 [:checkbox,   :select_price_type_filter_group, {:xpath => "//span[text()='%s']/preceding-sibling::input[1]"}]
                                 


       ]

  #//input[@id='inputCategoryID0' and preceding-sibling::label[@id='labelCategoryIDs%s']]
  # //input[@id='cboxCategoryID0' and preceding-sibling::label[@id='labelCategoryIDs%s']]
  #[:text_area, :expect_cateids_their_children, {:xpath => "//textarea[@id='textareaCategoryID%s' and parent::div[@id='div2nd%s']]"}],
  
end
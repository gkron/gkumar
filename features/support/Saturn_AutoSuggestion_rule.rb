class SaturnAutoSuggestionRule < Test::Unit::TestCase
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery
  
  checkbox(:publishtag, :id => "aSPublish")
  checkbox(:synonmstag, :id => "aSSyn")
  button(:savesuggestionrule, :id => "addSave")
  text_field(:asrulename, :id => "aSName")
  text_field(:asrank, :id => "aSRank")
  button(:addrule, :xpath => "//button[child::span[text()='Add Rule']]")
  button(:applyruleaddfacet, :id => "applyRuleBtn")
  button(:displaypatternaddfacet, :id => "displayPatternBtn")
  text_field(:facet, :id => "input_facet_autosuggest")
  text_field(:facetvalue, :id => "input_value_autosuggest")
  select_list(:selectfacetval, :id => "catvaluelist")
  text_field(:selectdpfacets, :id => "input_autosuggest_DisplayPattern")
  button(:ascancel, :id => "addCancel")
end
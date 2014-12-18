class SaturnDictionaryListingPage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  
  link(:viewdetails, :text => "View Details")
  text_field(:dicname,:id => "name")
  select_list(:dictype,:id => "typelist")
  table(:tbrelation,:id => "TBLrelationships")
  
end
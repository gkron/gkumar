class SaturnBulkUploadPage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  button(:import, :id => "uploadBtn")
  list_item(:fileuploadmsg, :text => "The file was successfully uploaded !")
  button(:msgokbtn,:xpath => "//div[@class='ui-dialog-buttonset']/button/span")
  unordered_list(:errorlist, :class => "errorList")
  cell(:pendingstatus,:text =>"Pending")
  list_item(:duplicateerrors, :text => "Row 2: rule name is a duplicate name to an already saved rule. Please change the name.")
end
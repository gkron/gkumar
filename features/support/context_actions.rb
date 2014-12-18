class ContextActions
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory

  indexed_property :contextservice, [[:div, :context_container, {:id => "divActionContextContainer%s"}]]
  def check_device_type(index,value)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/input[following-sibling::label[text()='#{value}']]")
  end

  def check_all_mobile_device(index,value)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div/input[following-sibling::label[text()='#{value}']]")
  end

  def check_all_mobile_sub_values(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div[child::label[text()='#{parent}']]/following-sibling::div/div/input[following-sibling::label[text()='#{child}'] and @disabled='disabled']")
  end

  def check_shopping_mode_values(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div[text()='#{parent}']/following-sibling::div/div/input[following-sibling::label[text()='#{child}']]")
  end

  def check_customer_experimentation_values(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div[text()='#{parent}']/following-sibling::div/div/input[following-sibling::label[text()='#{child}']]")
  end

  def check_navigation_values(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div[text()='#{parent}']/following-sibling::div/div/input[following-sibling::label[text()='#{child}']]")
  end

  def check_domestic_value(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div[child::label[text()='#{parent}']]/following-sibling::div/input[following-sibling::label[text()='#{child}']]")
  end

  def check_international_all_value(index,parent,child)
    self.checkbox_element(:xpath => "[@id='divActionContextContainer#{index}']/div/div/div[child::label[text()='#{parent}']]/following-sibling::div/div/input[following-sibling::label[text()='#{child}']]")
  end

  #//*[@id='divActionContextContainer0']/div/div/div/div[child::label[text()='International - ALL']]/following-sibling::div/div/input[following-sibling::label[text()='Europe']]

  def check_international_all_sub_value(index,parent,child)
    self.checkbox_element(:xpath => "//*[@id='divActionContextContainer#{index}']/div/div/div/div[child::label[text()='#{parent}']]/following-sibling::div/div/input[following-sibling::label[text()='#{child}'] and @disabled='disabled']")
  end

  #//*[@id='divActionContextAllNonMedia0']/input[following-sibling::label[text()='Apply to all non-media actions']]

  def check_apply_to_all_non_media_actions(index,val)
    self.checkbox_element(:xpath => "//*[@id='divActionContextAllNonMedia#{index}']/input[following-sibling::label[text()='#{val}']]")
  end

end
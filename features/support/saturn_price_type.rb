class PriceTypeTriggerpage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  select_list     :attribute_type,          :xpath => "//select[@class='triggerResultSetType']/option[contains(.,'Price Type')]"
  div             :verify_price_spec_price, :xpath => "//span[contains(text(),'Price Type Filter Groups')]//following::span[contains(text(),'Specific Price Types')]"
  div             :verify_msg_val,          :xpath => "//div[@id='msgDialog']//ul"
  button          :button_ok,               :xpath => "//span[contains(text(),'Ok')]"
  select_list     :trigger_logic,           :xpath => "//select[@class='triggerResultSetLogical']/option[contains(.,'>')]"
  select_list     :trigger_logic_dis,       :xpath => "//select[@class='triggerResultSetLogical']"
  text_field      :trigger_percentage,      :xpath => "//select[@class='triggerResultSetLogical']/following::input[1]"
  text_field      :trig_percen,             :xpath => "//select[@class='triggerResultSetLogical']/following::input[1]//@disabled='disabled'"
  link            :clear_selection_btn,     :xpath => "//a[text()='clear selection']"
  button          :cancel_trigger_btn,      :xpath => "(//input[@value='cancel'])[1]"
  button          :save_btn_edit,           :xpath => "//input[@id='ruleDetailSave']"
  div             :trigger_type_rs,         :xpath => "//select[@class='triggerType']/option[contains(.,'Result Set')]"
  indexed_property :price_type_sequence, [[:checkbox, :price_type_group, :xpath => "(//div[@class='priceTypeFilter']//input)[%s]"]]
  indexed_property :price_type_uncheck, [[:checkbox, :price_type_seq, :xpath => "//span[text()='%s']/..//input"]]
  
  def select_attribute()
    attribute_type_element.click
  end

  def verify_price_spe_price()
    verify_price_spec_price.should be_true
    sleep 5
  end

  def verify_error_msg(error_msg)
    @browser.switch_to.window(@browser.window_handles.last)
    print verify_msg_val
    verify_msg_val.include? error_msg
    button_ok_element.click
    @browser.switch_to.window(@browser.window_handles.last)
  end

  def select_price_group()
    price_divnum = 1
    for i in 0..6
      price_type_sequence[price_divnum.to_s].price_type_group_element.click
      price_divnum = price_divnum+1
    end
  end

  def trigger_logic_select()
    trigger_logic_element.click
  end

  def price_type_percent(val)
    print val
    trigger_percentage_element.clear
    trigger_percentage_element.send_keys [val]
    print trigger_percentage
  end

  def click_clear_selction()
    clear_selection_btn_element.click
  end

  def cancel_trigger()
    cancel_trigger_btn_element.click
  end

  def verify_trigger_type()
    trigger_type_rs.should be_true
  end

  def verify_logic_percentage_val()
    sleep 3
    trigger_logic_dis.should be_true
    trigger_percentage.should be_true
  end

  def verify_uncheck_values(table)
    exp=table.hashes
    (0...(exp.length)).each do |i|
      p exp[i]['values']
      price_type_uncheck[exp[i]['values']].price_type_seq_element.checked?.should be_false
    end
  end

  def verify_check_values(table)
    exp=table.hashes
    (0...(exp.length)).each do |i|
      p exp[i]['values']
      price_type_uncheck[exp[i]['values']].price_type_seq_element.checked?.should be_true
    end
  end

  def save_rule_edit()
  save_btn_edit_element.click
  end

end
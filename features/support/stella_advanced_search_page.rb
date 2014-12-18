class StellaAdvancedPage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory

  link(:actionstype, :text => "Change Attribute ")
  link(:selectall, :xpath => "//div[@id='yui-dt0-th-selected-liner']/span")
  div(:rdppcontenttype, :id => "menucategoryitemRDPP")
  div(:rdppheadline, :xpath => "//div[@id='mass-details']/strong[text()='RDPP Details']")
  select_list(:businessrule, :id => "copy-left")
  link(:addbusinessrule, :id => "addbutton")
  button(:submitchange, :xpath => "//button[text()='Submit Change']")
  div(:confirmdialogbox, :id => "change-confirm-box")
  span(:checkselectall, :xpath => "//span[text()='Select All']")
  select_list(:changeaction, :id => "change-action-type")
  checkbox(:selecheck, :xpath => "//*[@id='yui-rec0']/td[1]/div/input")
  element(:checkresults, :xpath => "//*[@id='category-table']/table/tbody[1]/tr/td/div[text()='No records found.']")
  link(:calleft, :class => "calnavleft") 
  link(:sf,:id => "toggle-fields")
  unordered_list(:removefacetrdpp, :xpath => "//div[@id='pagenav']/ul")
  table(:categorylistings,:xpath => "//*[@id='category-table']/table")
  select_list(:scr, :id => "select-create-results")
  button(:scrcreatebtn, :xpath => "//button[text()='Create' and preceding::form[@id='create-results-form']]")
  text_field(:scrname, :id => "createSavedSetCommand.savedSetName")
  span(:savedsetcheck,:xpath => "//*[@id='yui-dt1-th-selected-liner']/span")
  
  def waitforAdvanced_Search_page
    puts "On Advanced Search Page....."
  end

   def checkConditions(cond)
     if cond
     else
       raise "not equal..."
     end
   end


  def createfacetsbyadvancedsearch(facetvals,action)
    self.check_selecheck
    sleep 3
    menu =@browser.find_element(:xpath,"//form[1]/div/div[3]/div[4]/div/div[2]/ul/li/a")
    @browser.action.move_to(menu).click(menu).perform
    sleep 2
    @browser.find_element(:xpath,"//a[text()='Change Attribute ']").click
    sleep 8
    if action.include?("Add/update")
      self.changeaction="Add/Update"
      sleep 4
    end

    if action.include?("Remove")
      self.changeaction="Remove"
      sleep 4
    end

    for i in 0..facetvals.length-1
      @browser.find_element(:xpath,"//select[@id='copy-left']/option[text()='#{facetvals[i].join("")}']").click
      self.addbusinessrule
    end
    sleep 5
    self.submitchange
    sleep 10

  # attempts=0
  # begin
  # @browser.find_element(:xpath,"//div[@id='change-confirm-box']").tag_name
  # sleep 6
  # rescue Selenium::WebDriver::Erro => e
  # attempts=attempts+1
  # retry unless attempts > 10
  # ensure
  # if(attempts > 10)
  # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
  # end
  # end
  #
  # # wait_until(90, "category module loading....") do
  # # self.confirmdialogbox?.should be_true
  # # end
  # @browser.execute_script("window.confirm = function() {return true}")
  # @browser.action.send_keys(:return).perform
  #
  # attempts=0
  # begin
  # @browser.find_element(:xpath,"//span[text()='Select All']").tag_name
  # sleep 6
  # rescue Selenium::WebDriver::Erro => e
  # attempts=attempts+1
  # retry unless attempts > 10
  # ensure
  # if(attempts > 10)
  # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
  # end
  # end
  #
  # # wait_until(90, "category module loading....") do
  # # self.checkselectall?.should be_true
  # # end
  # sleep 4
  # $dbcid = @browser.find_element(:xpath,"//a[@class='navigated-link']").text
  end
  
  

  def deleterdppbyadvancedsearch(rdpptype)
    self.check_selecheck
    sleep 3
    menu =@browser.find_element(:xpath,"//form[1]/div/div[3]/div[4]/div/div[2]/ul/li/a")
    @browser.action.move_to(menu).click(menu).perform
    sleep 2
    @browser.find_element(:xpath,"//a[text()='Change Attribute ']").click
    wait_until(90, "category module loading....") do
      self.rdppcontenttype?.should be_true
    end
    sleep 3
    @browser.find_element(:xpath,"//table/tbody/tr/td[1]/div[2]/ul/li[3]/a/div").click
    wait_until(90, "category module loading....") do
      self.rdppheadline?.should be_true
    end
    sleep 3
    self.changeaction ="Remove"
    sleep 6
    delerdpp=rdpptype.split(",")
    for i in 0..delerdpp.length
      begin
        self.businessrule = delerdpp[i]
        sleep 4
        self.addbusinessrule
        sleep 5
        self.submitchange
      rescue
        puts "#{delerdpp[i]} is not there"
      end
    end
    attempts=0
    begin
      @browser.find_element(:xpath,"//div[@id='change-confirm-box']").tag_name
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end

    # wait_until(90, "category module loading....") do
    # self.confirmdialogbox?.should be_true
    # end
    @browser.execute_script("window.confirm = function() {return true}")
    @browser.action.send_keys(:return).perform
  end

  def createdrdppbyadvancedsearch(rdpptype,enddate)
    self.check_selecheck
    menu =@browser.find_element(:xpath,"//form[1]/div/div[3]/div[4]/div/div[2]/ul/li/a")
    @browser.action.move_to(menu).click(menu).perform
    @browser.find_element(:xpath,"//a[text()='Change Attribute ']").click
    wait_until(90, "category module loading....") do
      self.rdppcontenttype?.should be_true
    end
    sleep 3
    @browser.find_element(:xpath,"//table/tbody/tr/td[1]/div[2]/ul/li[3]/a/div").click
    wait_until(90, "category module loading....") do
      self.rdppheadline?.should be_true
    end
    sleep 3
    if !enddate.include?("invalid enddate")
    @browser.action.send_keys(:tab).perform
    @browser.action.send_keys(:tab).perform
    @browser.find_element(:xpath,"//table/tbody/tr/td[contains(@class,'today selectable')]/following::td[#{$rd}]").click
    $rd=$rd+1
    @browser.action.send_keys(:tab).perform
    @browser.action.send_keys(:tab).perform
    @browser.find_element(:xpath,"//table/tbody/tr/td[contains(@class,'today selectable')]/following::td[#{$rd}]").click
    $rd=$rd+1
    else
    $srd=1
    @browser.action.send_keys(:tab).perform
    @browser.action.send_keys(:tab).perform
    self.calleft_element.click
    @browser.find_element(:xpath,"//table/tbody/tr[3]/td[#{$srd}]/a").click
    @browser.action.send_keys(:tab).perform
    @browser.action.send_keys(:tab).perform
    #self.calleft_element.click
    $srd=$srd+1
    @browser.find_element(:xpath,"//table/tbody/tr[3]/td[#{$srd}]/a").click
    end
    rdppcnt =rdpptype.split(",")
    print rdppcnt
    for i in 0..rdppcnt.length
      begin
        self.businessrule = rdppcnt[i]
        sleep 4
        self.addbusinessrule
        sleep 5
        self.submitchange
      rescue
        puts "#{rdppcnt[i]} not found..."
      end
    end
    attempts=0
    begin
      @browser.find_element(:xpath,"//div[@id='change-confirm-box']").tag_name
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end

    # wait_until(90, "category module loading....") do
    # self.confirmdialogbox?.should be_true
    # end
    @browser.execute_script("window.confirm = function() {return true}")
    @browser.action.send_keys(:return).perform

    attempts=0
    begin
      @browser.find_element(:xpath,"//span[text()='Select All']").tag_name
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end

    # wait_until(90, "category module loading....") do
    # self.checkselectall?.should be_true
    # end
    sleep 4
    $dbcid = @browser.find_element(:xpath,"//a[@class='navigated-link']").text
  end
end
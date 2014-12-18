class StellaHomePage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory

  select_list(:create, :xpath => "//*[@id='create-select']")
  button(:go, :id => 'create-action')
  div(:headline, :text => 'Create Category')
  text_field(:category_name, :id => 'createCategoryCommand.category.name')
  button(:createbutton, :id=> 'createCategorySubmit')
  select_list(:search_category, :id => "searchCommand.typeKey")
  text_field(:categoryid, :id => "inputId")
  select_list(:subpage, :id => "subpageDropdown")
  checkbox(:goto, :id => 'checkGoto')
  button(:searchgo, :id => 'searchButton')
  link(:home, :id => "nav-Home")
  select_list(:bt, :id => "browse-type-select")
  def selectbrowsertype(op)
    self.bt=op
  end

  def stellahome
    self.home
    attempts=0
    begin
      @browser.find_element(:xpath,"//select[@id='create-select']").click
      sleep 6
    rescue Selenium::WebDriver::Erro => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end
  end

  def create_item(createtype)
    sleep 3
    self.create = createtype
    self.go
    wait_until(60, "stella home page loading....") do
      self.title.include? "STELLA - Create Category"
    end
    sleep 4
  end

  def verifyPageElement
    self.headline?.should be_true
  end

  def create_category(categoryname)
    self.category_name=categoryname
    sleep 3
    self.createbutton
    sleep 3
    wait_until(60, "stella overview page loading....") do
      self.title.include? "STELLA - Category Overview"
    end
    self.wait_for_ajax
    sleep 4
    results=$dbhstella.execute("select CATEGORY_ID from category where category_name='#{$category_name}'")
    results.fetch do |data|
      $dbcid=data[0].to_int()
    end

    if categoryname.include?("createsubcategory")
    $subcategory = $dbcid
    end

    if categoryname.include?("parentcategory")
    $parentcategory = $dbcid
    end

    $gct="Category ID: #{$dbcid} (Live)"
    print "=========================================="
    print $gct
    print "=========================================="
  end

  def searchforcategoriesfromstella(category,categoryid,categorytype)
    $gct = "Category ID: #{categoryid} (Live)"
    $dbcid = "#{categoryid}"
    self.wait_for_ajax
    sleep 4
    self.search_category=category
    @browser.action.send_keys(:tab).perform
    @browser.find_element(:xpath,"//input[@id='inputId']").send_keys "#{$dbcid}"
    @browser.action.send_keys(:tab).perform
    self.subpage=categorytype
    check_goto
    self.searchgo
    self.wait_for_ajax
    sleep 3
  end

  def seachingforcategorywithtype(type1,type2,type3)
    $gct = "Category ID: 61863 (Live)"
    $dbcid = "61863"
    puts "Category id is : #{$dbcid}"
    sleep 8
    self.search_category=type1
    @browser.action.send_keys(:tab).perform
    @browser.find_element(:xpath,"//input[@id='inputId']").send_keys "#{$dbcid}"
    #self.categoryid= "#{$dbcid}"
    self.subpage=type2
    check_goto
    self.searchgo
    attempts=0
    begin
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").tag_name
      sleep 6
    rescue Capybara::ElementNotFound => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end
    if !type3.include?("category_id")
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
      on(CategoryOverview).categotyid_element.when_present
      sleep 3
    end
  end
end

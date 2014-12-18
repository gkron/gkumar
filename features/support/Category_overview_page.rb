class CategoryOverview
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory

  unordered_list(:general_menu_list,:xpath => "//ul[@class='first-of-type']/li/a[text()='General']/following-sibling::div/div/ul")
  span(:categotyid, :text => "#{$gct}")
  div(:facetmodule, :xpath => "//*[@id='category-facets']/div/div[text()='Facets']")
  div(:addfacetbutton, :xpath => "//div/a[@id='add-facet-action']/img")
  div(:addfacetmodule, :id =>"afb-content")
  select_list(:facetlabel, :id => "copy-left")
  table(:facettable, :xpath => "//table/tbody/tr/td/a[@id='add-button']/img")
  button(:done, :id => "yui-gen15-button")
  table(:createdfacets, :xpath => "//table/tbody/tr[@id='yui-rec0']/td/div/input")
  div(:remove, :xpath => "//div[@class='yui-dt-liner' and text()='Brand']/parent::td/following-sibling::td/div/a[text()='Remove']")
  div(:confirmdialogbox, :id => "confirmation-dialog-box")
  div(:alertdialogbox, :id => "alert-dialog-box")
  div(:rdppid, :id => "category-rdpp")
  select_list(:rdpptype, :xpath => "//table/tbody[2]/tr[last()]/td/div/select")
  text_field(:startDate, :name => "startDate")
  text_field(:endDate, :name => "endDate")
  div(:categorysaveset, :id => "category-savedset")
  div(:addsavedsets, :id => "add-savedset-box")
  select_list(:savesetid, :id => "search-by")
  text_field(:searchvalue, :id => "search-value")
  div(:finder, :class => "boxresults")
  checkbox(:ssqid, :xpath => "//tr[1]/td[3]/div/input")
  button(:addselected, :id => "add-selected")
  div(:setsummary, :xpath => "//div[text()='Sets']/parent::div[following-sibling::div/div/div/table/tbody[@class='yui-dt-data']/tr/td[1]/div/a]")
  div(:querysummary, :xpath => "//div[text()='Queries']/parent::div[following-sibling::div/div/div/table/tbody[@class='yui-dt-data']/tr/td[1]/div/a]")
  link(:general_list, :text => "General")
  link(:starteditinglink, :xpath => "//a[@id='edit-button']/img")
  checkbox(:facetstop, :xpath => "//form/div/div[14]/input[2]")
  checkbox(:savedsetid, :xpath => "//tr[@id='yui-rec0' or @id='yui-rec1']/td[3]/div/input")
  checkbox(:onemoresavedsetid, :xpath => "//tr[@id='yui-rec2']/td[3]/div/input")
  link(:findparent, :text => "Find category")
  text_field(:searchvalue, :id => "search-value")
  link(:parentfindlink, :id => "find-button")
  link(:addsavedsetlink, :id=> "add-savedset-action")
  radio_button(:fcr, :name => "selectedItems")
  #button(:addselected, :id => "add-selected")
  text_field(:dispn, :xpath => "//table/tbody[2]/tr/td[3]/div/input")
  link(:advancedsearch, :text => "Advanced Search")
  select_list(:selectype, :id => "advancedSearchCommand.typeKey")
  text_field(:categoryname, :xpath => "//form[1]/div/div[1]/div[3]/div[1]/div[2]/div/div/input[4]")
  button(:submitbutton, :class => "buttonsubmitsml")
  link(:selectall, :xpath => "//div[@id='yui-dt0-th-selected-liner']/span")
  text_field(:productlabel, :id => "advancedSearchCommand.selectionValues[3].values[0]")
  select_list(:categorymodule, :id => "search-by")
  text_field(:categoryvalue, :id => "search-value")
  #image(:findbutton, :alt => "Find")
  table(:searchcategory, :xpath => "//table/tbody[@class='yui-dt-data']/tr[1]/td[3]/div/input")
  div(:noresults, :xpath => "//*[@id='category-table']/table/tbody[1]/tr/td/div[text()='No records found.']")
  element(:resultpresnt, :xpath => "//*[@id='category-table']/table/tbody[1]/tr/td/div/img")
  #button(:addselected, :id => "add-selected")
  link(:showfiled, :id => "toggle-fields")
  button(:resubmit, :xpath => "//*[@id='search-fields']/div[2]/input[1]")
  text_field(:categoryidsearch, :id => "advancedSearchCommand.selectionValues[0].values[0]")
  link(:deletesubcategory, :class => "delete")
  select_list(:displaynames, :id => "categoryOverviewCommand.displayNames[0].attributeId")
  link(:editheader, :text => "Edit header")
  checkbox(:publishflag, :id => "publish-check")
  link(:editheadersave, :xpath => "//a[@id='save-category']/img")
  link(:addanother, :xpath => "//a[@id='removable-displayNames']/following-sibling::a")
  link(:savechanges, :xpath => "//*[@id='save-button']/img")
  select_list(:devicepublish, :xpath => "//*[@id='createCategoryCommand.category.devicePublish' or @id='categoryOverviewCommand.devicePublish']")

  indexed_property :dropdown, [[:select_list, :display_name, {:id => 'categoryOverviewCommand.displayNames[%s].attributeId'}],
  [:text_field, :display_name_text, {:id => 'categoryOverviewCommand.displayNames[%s].varcharValue'}],]
  [:link, :display_name_remove, {:xpath => "//*[@id='categoryOverviewCommand.displayNames[%s].attributeId']/following-sibling::a"}]

  indexed_property :getindex, [[:link, :display_name_removal, {:xpath => "//option[@selected='selected' and text()='%s']/following::a[1]"}],
                               [:element, :display_name_selected, {:xpath => "//option[@selected='selected' and text()='%s']"}],
                               [:text_field, :display_name_value, {:xpath => "//input[@value='%s']"}]]

  indexed_property :getrulename, [[:cell, :rule_name, {:xpath => "//*[@id='TBLrules']/tbody/tr[%s]/td[2]"}]]
  indexed_property :selectdevicepublish, [[:select_list, :devicepublish, {:xpath => "//*[@id='createCategoryCommand.category.devicePublish' or @id='categoryOverviewCommand.devicePublish']/option[text()='%s']"}]]

  def checkfacetsaved(facetname)
    self.cell_element(:xpath => "//td[@headers='yui-dt0-th-attributeName' and child::div[text()='#{facetname}']]").should be_true
  end

  def checkrdppssaved(rdpp)
    self.select_list_element(:xpath => "//option[text()='#{rdpp}' and @selected]").should be_true
  end

  def makepublishflagONOROFF
    self.editheader_element.click
    self.editheadersave_element.when_present
    self.publishflag_element.click
    self.editheadersave_element.click
    self.editheader_element.when_present
  end

  def selectCategoryFromFindCategory
    self.categorymodule ="Category Name"
    self.categoryvalue = $subcategoryname
    @browser.find_element(:xpath, "//img[@alt='Find']").click
    attempts=0
    begin
      @browser.find_element(:xpath, "//table/tbody[@class='yui-dt-data']/tr[1]/td[3]/div/input").tag_name
      sleep 4
    rescue Selenium::WebDriver::Error => e
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      if(attempts > 10)
        raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      end
    end
    @browser.find_element(:xpath, "//table/tbody[@class='yui-dt-data']/tr[1]/td[3]/div/input").click
    self.addselected
    sleep 7
  end

  def advancedsearchcategory
    self.advancedsearch
    # wait_for_js_pom
    # wait_until(90, "category module loading....") do
      # self.productlabel?.should be_true
    # end
    self.wait_for_ajax
    sleep 9
    self.selectype ="Categories"
    # wait_for_js_pom
    # wait_until(90, "category module loading....") do
      # self.categoryname?.should be_true
    # end
    self.wait_for_ajax
    sleep 6
    #self.categoryidsearch=$dbcid
    print "category name as #{$category_name} in overview....."
    self.categoryname= $category_name
    sleep 4
    self.submitbutton
    wait_until(90, "advanced search page loading......") do
      self.selectall?.should be_true
    end
    sleep 4
    loop do
      if self.noresults?
        self.advancedsearch
        # wait_for_js_pom
        # wait_until(90, "category module loading....") do
          # self.productlabel?.should be_true
        # end
        self.wait_for_ajax
        sleep 9
        self.selectype ="Categories"
        self.wait_for_ajax
        # wait_for_js_pom
        # wait_until(90, "category module loading....") do
          # self.categoryname?.should be_true
        # end
        sleep 6
        #self.categoryidsearch=$dbcid
        print "category name as #{$category_name} in overview....."
        self.categoryname= $category_name
        sleep 4
      self.submitbutton
      self.wait_for_ajax
      sleep 6
    else
    break
    end
    end
  # self.advancedsearch
  # wait_until(90, "category module loading....") do
  # self.productlabel?.should be_true
  # end
  # sleep 6
  # self.selectype ="Categories"
  # wait_until(90, "category module loading....") do
  # self.categoryname?.should be_true
  # end
  # sleep 3
  # #self.categoryidsearch=$dbcid
  # self.categoryname= $category_name
  # sleep 4
  # self.submitbutton
  # wait_until(90, "advanced search page loading......") do
  # self.selectall?.should be_true
  # end
  # sleep 4
  # self.showfiled_element.click
  # self.resubmit_element.click
  # sleep 4
  # self.resultpresnt_element.element.when_present(6)
  #end
  end

  def enterdisplayname(name)
    self.dispn=name
  end

  def stopfacet
    self.check_facetstop
  end

  def uncheckfacet
    self.uncheck_facetstop
  end

  def enterDate(newdate)
    @cnt= @browser.find_elements(:xpath,"//input[@name='endDate']").size
    for i in 1..@cnt
      @browser.find_element(:xpath,"//table/tbody[@class='yui-dt-data']/tr[#{i}]/td/div/input[@name='endDate']").send_keys [:control, 'a'], newdate
    end
  end

  def verifycategoryoverciew
    self.categotyid?.should be_true
  end

  def select_saved_set_checkbox_id(sqid)
    @checkcount=@browser.find_elements(:xpath, "//table/tbody[@class='yui-dt-data']/tr/td/div/input").size

    for i in 1..@checkcount
      @browser.find_element(:xpath, "//table/tbody[@class='yui-dt-data']/tr[#{i}]/td/div/input").click
    end
    sleep 3

    menu =@browser.find_element(:xpath,"//button[@id='add-selected']")
    @browser.action.move_to(menu).click(menu).perform
    
    self.wait_for_ajax
    sleep 6

    #@browser.find_element(:xpath, "//button[@id='add-selected']").click
    #@browser.action.send_keys(:return).perform
    # attempts=0
# 
    # begin
      # @browser.find_element(:xpath,"//table/thead[child::tr/th/div/span/a[text()='#{sqid}']]/following-sibling::tbody[2]/tr[1]/td[2][child::div]/following-sibling::td").click
      # sleep 6
    # rescue Selenium::WebDriver::Error => e
      # attempts=attempts+1
      # retry unless attempts > 10
    # ensure
      # if(attempts > 10)
        # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      # end
    # end

  end

  def createsavedsetname(ssn,sv,fb,ssi)
    $ssid=Array.new
    @browser.find_element(:xpath,"//a[@id='add-savedset-action']/img").click
    # attempts=0
    # begin
    # @browser.find_element(:xpath,"//div[@id='add-savedset-box' and contains(@style,'visibility')]").tag_name
    # sleep 6
    # rescue Selenium::WebDriver::Error => e
    # attempts=attempts+1
    # retry unless attempts > 10
    # ensure
    # if(attempts > 10)
    # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    # end
    # end
    sleep 10
    self.savesetid = ssn
    self.searchvalue = sv
    self.parentfindlink
    sleep 4
    self.check_savedsetid
    @browser.action.send_keys(:return).perform
    #@browser.find_element(:xpath,"//div/button[@id='add-selected']").click
    sleep 6
    #self.addselected
    # attempts=0
    # begin
    # @browser.find_element(:xpath,"//table/tbody[2]/tr/td[1]/div/a").click
    # sleep 6
    # rescue Selenium::WebDriver::Error => e
    # attempts=attempts+1
    # retry unless attempts > 10
    # ensure
    # if(attempts > 10)
    # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    # end
    # end
    @mrscount=@browser.find_elements(:xpath, "//div[@id='dotcom-table' or @id='registry-table']/table/tbody[@class='yui-dt-data']/tr").size
    for l in 1..@mrscount
      $ssid << @browser.find_element(:xpath, "//div[@id='dotcom-table' or @id='registry-table']/table/tbody[@class='yui-dt-data']/tr[#{l}]/td[1]/div/a").text
    end
  end

  def createFacet(p,c)
    self.general_list_element.when_present.fire_event("onmouseover")
    @browser.action.send_keys(:arrow_down).perform
    if self.link_element(:xpath => "//a[text()='#{c}']").visible?
      self.link_element(:xpath => "//a[text()='#{c}']").when_present.click
    else
      self.div_element(:xpath => "//*[@id='overviewmenu']/div[3]").fire_event("onmouseover")
      self.link_element(:xpath => "//a[text()='#{c}']").when_present.click
    end

    if c.include?("Overview")
      sleep 7
    # @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
    # sleep 3
    # @browser.find_element(:xpath, "//input[@id='categoryOverviewCommand.registryBrowseTypeObjects[0].endDate']").click
    # @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]/following::td[1]").click
    # @browser.find_element(:xpath,"//*[@id='save-button']/img").click
    # sleep 7
    end

    if c.include?("Featured Products")
      attempts=0
      begin
        @browser.find_element(:xpath,"//div[@id='category-savedset']/div/div/div[text()='Featured Products']").click
        sleep 6
      rescue Selenium::WebDriver::Error => e
        attempts=attempts+1
        retry unless attempts > 10
      ensure
        if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
        end
      end
    end

    if c.include?("Facets")
      attempts=0
      begin
        @browser.find_element(:xpath,"//*[@id='category-facets']/div/div[text()='Facets']").click
        sleep 6
      rescue Selenium::WebDriver::Error => e
        attempts=attempts+1
        retry unless attempts > 10
      ensure
        if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
        end
      end
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
      self.addfacetbutton?.should be_true
      @browser.find_element(:xpath,"//div/a[@id='add-facet-action']/img").click
      wait_until(80, "add facet module loading....") do
        self.addfacetmodule?.should be_true
        self.facetlabel?.should be_true
      end
    elsif c.include?("Subcategories")
      attempts=0
      begin
        @browser.find_element(:xpath,"//div[@id='category-category']/div/div[text()='Subcategories']").click
        sleep 6
      rescue Selenium::WebDriver::Error => e
        attempts=attempts+1
        retry unless attempts > 10
      ensure
        if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
        end
      end
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
      sleep 3
      if $arc.include?("Associate Reference Category")
        @browser.find_element(:xpath,"//img[@alt='Associate Reference Category']").click
      else
        @browser.find_element(:xpath,"//img[@alt='Associate Subcategory']").click
      end

      wait_until(60, "add saved sets & queries module loading....") do
        self.categorymodule?.should be_true
      end
      sleep 4
    end
  end

  def createRdpp(pp,cp)
     #self.general_list_element.when_present.fire_event("onmouseover")
     #self.wait_for_ajax
     #@browser.action.send_keys(:arrow_down).perform
     #sleep 5
    # if self.link_element(:xpath => "//a[text()='#{cp}']").visible?
      # self.link_element(:xpath => "//a[text()='#{cp}']").when_present.click
    # else
      #self.div_element(:xpath => "//*[@id='overviewmenu']/div[3]").fire_event("onmouseover")
     menu =@browser.find_element(:xpath,"//a[text()='General']")      
     @browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
     self.link_element(:xpath => "//a[text()='#{cp}']").when_present.click
    #end

    #self.general_list
    #menu =@browser.find_element(:xpath,"//a[text()='#{cp}']")
    #@browser.action.move_to(menu).click(menu).perform
    if cp.include?("RDPP")
      attempts=0
      begin
        @browser.find_element(:xpath,"//div[@id='category-rdpp']/div/div[text()='RDPP']").click
        sleep 6
      rescue Selenium::WebDriver::Error => e
        attempts=attempts+1
        retry unless attempts > 10
      ensure
        if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
        end
      end
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
      sleep 2
    #@browser.find_element(:xpath,"//*[@id='add-rdpp-action']/img").click
    #sleep 4
    # wait_until(80, "add rdpp module loading....") do
    # self.rdpptype?.should be_true
    # end
    elsif cp.include?("Saved Sets & Queries")
      attempts=0
      begin
        @browser.find_element(:xpath,"//div[@class='pagetitlebar']/div[text()='Saved Sets & Queries']").click
        sleep 6
      rescue Selenium::WebDriver::Error => e
        attempts=attempts+1
        retry unless attempts > 10
      ensure
        if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
        end
      end
      @browser.find_element(:xpath,"//*[@id='edit-button']/img").click
    end
  end

  def addingRpddattributes(attributetype,sdate,edate)
    self.rdpptype=attributetype

    if edate.include?("invalid End Date")
      @browser.action.send_keys(:tab).perform
      @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]/preceding::td[#{$iend}]").click
      $iend =$iend-1
      @browser.action.send_keys(:tab).perform
      @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]/preceding::td[#{$iend}]").click
    else
      @browser.action.send_keys(:tab).perform
      if $dt==1
        @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]").click
      else
        @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]/following::td[#{$dt}]").click
      $dt =$dt+1
      end
      @browser.action.send_keys(:tab).perform
      @browser.find_element(:xpath, "//table/tbody/tr/td[contains(@class,'today selectable')]/following::td[#{$dt}]").click
    $dt =$dt+1
    end
  end

  def add_associate_saveedset_or_query(ssid,ssvalue,qid)
    # attempts=0
    # begin
      # @browser.find_element(:xpath,"//*[@id='add-savedset-action']/img").click
      # sleep 6
    # rescue Selenium::WebDriver::Error => e
      # attempts=attempts+1
      # retry unless attempts > 10
    # ensure
      # if(attempts > 10)
        # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      # end
    # end
    self.wait_for_ajax
    sleep 6
    @browser.find_element(:xpath,"//*[@id='add-savedset-action']/img").click
    self.wait_for_ajax
    # wait_until(80, "add saved sets & queries module loading....") do
      # self.addsavedsets?.should be_true
    # end
     sleep 7
    self.savesetid =ssid
    self.searchvalue =ssvalue
    @browser.find_element(:xpath,"//*[@id='find-button']/img").click
    self.wait_for_ajax
    # wait_until(90, "add saved sets & queries module loading....") do
      # self.finder?.should be_true
    # end
     sleep 7
  end

  def addingSelectedFacets(facetname)
    begin
      self.facetlabel=facetname
    rescue
    end
  end

  def clickAddandDone
    @browser.find_element(:xpath,"//*[@id='add-button']/img").click
    self.done
    sleep 3
  end

  def savefacet
    @browser.find_element(:xpath,"//*[@id='save-button']/img").click
    sleep 9
  end

  def removefacet(facetname)
    if facetname == "all"
      @rf=@browser.find_elements(:xpath,"//table/tbody[@class='yui-dt-data']/tr/td/div/a[text()='Remove']").size
      for i in 1..@rf
        @browser.find_element(:xpath,"//table/tbody[@class='yui-dt-data']/tr[1]/td/div/a[text()='Remove']").click
        self.confirmdialogbox?.should be_true
        @browser.execute_script("window.confirm = function() {return true}")
        @browser.action.send_keys(:return).perform
      end
    else
      @browser.find_element(:xpath,"//table/tbody[@class='yui-dt-data']/tr/td[child::div[text()='#{facetname}']]/following-sibling::td/div/a[text()='Remove']").click
      self.confirmdialogbox?.should be_true
      @browser.execute_script("window.confirm = function() {return true}")
      @browser.action.send_keys(:return).perform
    end
  end

  def removemrs(savedset)

  end

  def findparentcategory()
    self.findparent
    self.wait_for_ajax
    sleep 7
    # attempts=0
    # begin
      # @browser.find_element(:xpath,"//select[@id='search-by']/option[text()='Category Name']").click
      # sleep 6
    # rescue Selenium::WebDriver::Erro => e
      # attempts=attempts+1
      # retry unless attempts > 10
    # ensure
      # if(attempts > 10)
        # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
      # end
    # end
    @browser.find_element(:xpath,"//select[@id='search-by']/option[text()='Category Name']").click
    self.searchvalue =$parent_category_name
    self.parentfindlink
    sleep 6
    self.select_fcr
    self.addselected
    sleep 5
    self.alertdialogbox?.should be_true
    @browser.execute_script("window.confirm = function() {return true}")
    @browser.action.send_keys(:return).perform
  end
end 
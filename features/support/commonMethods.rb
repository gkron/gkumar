module CommonMethods
  def getRandomNumber(count)
    if count > 0
      SecureRandom.random_number(count-1)+1
    else
      raise "count should be > 0"
    end
  end

  def loginpage(url,mod,user,password,loginbutton)
    page.driver.browser.navigate.to url
    #visit url
    within(mod) do
      fill_in(user,:with => "mmuser")
      fill_in(password,:with => "haht")
      click_button(loginbutton)
    end
  end

  def verifyAlerts(alertmsg)
    if !alertmsg.include?("you want to delete")
      if !alertmsg.include?(",")
      page.has_xpath?("//div[@id='msgDialog']/div/ul/li",:text => "#{alertmsg}",:visible => true).should be_true
      click_link_or_button("Ok")
      else
       @multiplemessages=Array.new
       @multiplemessages=alertmsg.split(",")
       for @i in @multiplemessages
         page.has_xpath?("//div[@id='msgDialog']/div/ul/li",:text => "#{@i}",:visible => true).should be_true
       end
       click_link_or_button("Ok")
      end
    elsif alertmsg.include?("you want to delete")
      page.has_xpath?("//div[@id='msgDialog']/div",:text => alertmsg,:visible => true).should be_true
      click_link_or_button("Ok")
    else
      print "no alert message"
    end
  end
  

  def verifyAlertsonChildWindows(alertmsg)
    if !alertmsg.include?("you want to delete")
      puts "#{alertmsg}"
      page.has_xpath?("//div[@id='msgDialog']/div/ul/li",:text => "#{alertmsg}",:visible => true).should be_true
      find("//div[@id='msgDialog']/following-sibling::div/div/button/span").click
    elsif alertmsg.include?("you want to delete")
      page.has_xpath?("//*[@id='deleteConfirm']",:text => alertmsg,:visible => true).should be_true
      click_link_or_button("Ok")
    elsif alertmsg.include?("Delete this relationship/designation ?")
      page.has_xpath?("//*[@id='deleteConfirm']",:text => alertmsg,:visible => true).should be_true
      click_link_or_button("Ok")
    else
      print "no alert message"
    end
  end

  def verifyAlertswithCancel(alertmsg)
    if alertmsg.match(/^Are you sure you want to delete this/)
      page.has_xpath?("//*[@id='deleteConfirm']",:text => alertmsg,:visible => true).should be_true
      #click_on("Cancel")
    elsif alertmsg.include?("Delete this relationship/designation ?")
      page.has_xpath?("//*[@id='deleteConfirm']",:text => alertmsg,:visible => true).should be_true
    elsif !alertmsg.match(/^Are you sure you want to delete the/)
      page.has_xpath?("//div[@id='msgDialog']/div/ul/li",:text => alertmsg,:visible => true).should be_true
      #ele=page.driver.browser.find_element(:xpath,"//div[6]/div[11]/div/button[2]")
      #page.driver.browser.action.move_to(ele).click(ele).perform
    elsif alertmsg.match(/^Are you sure you want to delete the/)
      page.has_xpath?("//div[@id='msgDialog']/div",:text => alertmsg,:visible => true).should be_true
       #ele=page.driver.browser.find_element(:xpath,"//div[6]/div[11]/div/button[2]")
       #page.driver.browser.action.move_to(ele).click(ele).perform
    else
       print "no alert message"
    end
  end

  def verifyAttributeTypeAndValue(arg1,arg2)
     page.has_xpath?("//*[text()='#{arg1}' and @disabled='disabled' or text()='#{arg1}' and @selected='selected']").should be_true
    if(arg2.include? ",")
      names=arg2.split(",")
      names.length.times do |i|
         page.has_xpath?("//span/span[2][text()='#{names[i]}']").should be_true
      end
    else
       page.has_xpath?("//span/span[2][text()='#{arg2}']").should be_true
    end
  end

  def verifyElemetPresent(parent,menu)
     within(parent) do
       page.has_xpath?("//*[contains(text(),'#{menu}')]",:visible => true).should be_true
    end
  end

  def verifyPagecontent(att,data)
     page.has_xpath?("//*[@id='#{att}' and @value='#{data}']",:visible => true).should be_true
  end

  def verifyPageTextPresnt(att,data)
     page.has_xpath?("//*[@*='#{att}']",:text => data,:visible => true).should be_true
  end

  def verifyText(loc,data)
     page.has_xpath?(loc,:text => data,:visible => true).should be_true
  end

  def VerifyIsSelected(att,data)
     page.has_selector?(:xpath,"//*[@id='#{att}']",:text => data,:visible => true).should be_true
  end

  def VerifyIsDisabled(att,data)
     page.has_xpath?("//*[@id='#{att}' and @disabled='disabled']",:text => data,:visible => true).should be_true
  end

  def selectoption(parent,option,loc)
     within(parent) do
       select option, :from => loc
    end
  end

  def findaction(att,i,data)
     find("//*[@*='#{att}'+'#{i}']/*[text()='#{data}']").click
  end

  def verifyElementNotVisible(att,data)
     page.has_no_xpath?("//*[@*='#{att}']",:text => data,:visible => true).should be_true
  end

  def  findelement(parent,id)
     within(parent) do
      return  find_by_id(id).text
    end
  end

  def fill(parent,loc,data)
     within(parent) do
       fill_in(loc,:with=>data)
    end
  end

  def waitUntilElementvisible(element)
     wait_until(90) do
       page.should have_xpath(element)
    end
  end
  
   def waitUntilElementvisibleforincasesensitive(element,con)
     wait_until(30) do
       page.should have_xpath(element,:text=>/#{con}/i)
    end
  end
  
  
   def waitUntilElementCountvisible(element,counts)
     wait_until(30) do
       page.should have_xpath(element,:count=>counts)
    end
  end
  
  def waitAndclick(element)
     wait_until(30) do
       page.should have_xpath(element)
       find(element).click
    end
  end
  
  def waitUntilElementnotvisible(element)
     wait_until(30) do
       page.should have_xpath(element)
    end
  end

  def AddTriggerAttributes(a1,type,value,logical,percentage)
    parent = "divSubCriteriaA0_#{a1}"
    selectid ="dropdownResultSetTrigger0_#{a1}"
    resultset_logical = "logicalDropdownResultSetTrigger0_#{a1}"
    percentage_field = "inputPercent0_#{a1}"

     within("//div[@id='#{parent}']") do
       select type,:from =>selectid
       find(:xpath,"//div[@id='#{parent}']/span[@class='tagBox-container']/input[contains(@id,'tagBox-input')]").set(value)
       select logical,:from => resultset_logical
       fill_in percentage_field, :with => percentage
    end
  end

  def AddTriggerAttributeswithProductDataMatch(a1,type,value)
    parent = "divCriteriaA0_#{a1}"
    selectid ="dropdownProductDataMatch0_#{a1}"
     within("//div[@id='#{parent}']") do
       select type,:from =>selectid
       find(:xpath,"//div[@id='#{parent}']/span[@class='tagBox-container']/input[contains(@id,'tagBox-input')]").set(value)
    end
  end

  def global_search(searchtype,keyword)
     within("//*[@id='mSearch']") do
       VerifyIsSelected("navSelRule","Rule Names")
       select searchtype, :from =>"globalSrchList"
       fill_in "globalSrchField", :with => keyword
       click_button("Go")
    end
  end

  def verifyPresenceofRefinefacet(id)
     within("//div[@id='divSubCriteriaA0_#{id}']") do
       page.has_xpath?("span[1]/input").should be_true
       page.has_xpath?("span[2]/input").should be_true
    end
  end

  def createRefineFacet(id,mydata)
    parent ="divSubCriteriaA0_#{id}"
    parent1 ="divSubCriteriaA#{id}_0"
    if mydata.size<=2
       find("//div[@id='#{parent}' or @id='#{parent1}']/span[1]/input").set(mydata[0])
       page.driver.browser.action.send_keys(:tab).perform
       find("//div[@id='#{parent}' or @id='#{parent1}']/span[2]/input").set(mydata[1])
       page.driver.browser.action.send_keys(:tab).perform
    elsif mydata.size>2
      mydata.each_with_index {|val, index|
        if index==0
        find("//div[@id='#{parent}' or @id='#{parent1}']/span[1]/input").set(val)
        page.driver.browser.action.send_keys(:tab).perform
        elsif index>0
        find("//div[@id='#{parent}' or @id='#{parent1}']/span[2]/input").set(val)
        page.driver.browser.action.send_keys(:tab).perform
        end
    }
    end  
  end

  def verifyContextArttributeValuesAndNames(attname,values,status)
    if status=="checked"
     if (values.include?(","))   
      values.split(",").each do |val|
         find("//div[@id='#{attname}']/div/span[text()='#{val}']/preceding-sibling::input").should be_checked
      end
      else
          find("//div[@id='#{attname}']/div/span[text()='#{values}']/preceding-sibling::input").should be_checked
      end
    elsif status=="unchecked"
      if (values.include?(","))   
      values.split(",").each do |val|
         find("//div[@id='#{attname}']/div/span[text()='#{val}']/preceding-sibling::input").should_not be_checked
      end
      else
          find("//div[@id='#{attname}']/div/span[text()='#{values}']/preceding-sibling::input").should_not be_checked
      end
    end
  end

  def checkAndUncheckContextAtrributes(attname,values,status)
    if status=="unchecked"
       if (values.include?(","))
       values.split(",").each do |val|
         find("//div[@id='#{attname}']/div/span[text()='#{val}']/preceding-sibling::input").set(false)
      end
      else
        find("//div[@id='#{attname}']/div/span[text()='#{values}']/preceding-sibling::input").set(false)
      end
    elsif status=="checked"
       if (values.include?(","))
       values.split(",").each do |val|
         find("//div[@id='#{attname}']/div/span[text()='#{val}']/preceding-sibling::input").set(true)
      end
      else
        find("//div[@id='#{attname}']/div/span[text()='#{values}']/preceding-sibling::input").set(true)
      end
    end
  end

  def verifyContextAtrributes(attname,val,status)
    if status=="unchecked"
       page.has_xpath?("//div[@id='#{attname}']/div/span[text()='#{val}']/preceding-sibling::input",:checked =>false).should be_true
    end
  end
  
   def element_present?(how, what)
    page.driver.browser.find_element(how, what)
    true
    rescue Selenium::WebDriver::Error::NoSuchElementError
    false
   end

  def createHypernym(term1,term2,numofhops)
     find("//span[text()='Add']").click
     wait_for_js
     sleep 7
     fill_in "term1",:with=>"#{term1}"
     select "Hypernym",:from=>"operatorList"
     fill_in "term2",:with=>"#{term2}"
     click_button("Save")
     waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='Hypernym']")
     sleep 5
     page.should have_xpath("//td[text()='#{term1}']/following-sibling::td[text()='Hypernym']/following-sibling::td[text()='#{term2}']")
    $ie=$ie+1
  end

  def calculatedrelationshipsinDB(term1,term2,numofhops)
    results= $dbhsaturn.execute("select count(*) from linguistic_relationship where linguistic_rel_id in (select linguistic_rel_id from relationship_term_assn where linguistic_term_id in(select linguistic_term_id from linguistic_term where linguistic_term_value in('#{term1}','#{term2}'))
group by linguistic_rel_id having count (linguistic_rel_id) > 1) and dictionary_id=(select dictionary_id from dictionary where dictionary_name='#{$dy}') and num_hops=#{numofhops}
    ")
    results.fetch do |row|
      if row[0].to_int()>=1
         puts "passed..."
      else
         puts "failed...."
         page.should have_xpath("//td[text()='#{term1}']/following-sibling::td[text()='Hypernym']/following-sibling::td[text()='#{term2}']")
      end
    end
  end

  def nocalculatedrelationshipsinDB(term1,term2,numofhops)
    results= $dbhsaturn.execute("select count(*) from linguistic_relationship where linguistic_rel_id in(select linguistic_rel_id from relationship_term_assn where linguistic_term_id in(select linguistic_term_id from linguistic_term where linguistic_term_value in('#{term1}','#{term2}'))
group by linguistic_rel_id having count (linguistic_rel_id) > 1) and dictionary_id=(select dictionary_id from dictionary where dictionary_name='#{$dy}') and num_hops=#{numofhops}
    ")
    results.fetch do |row|
      if row[0].to_int()==0
         puts "passed..."
      else
         puts "failed...."
         print page.should have_xpath("//table[@id='TBLrelationships']/tbody/tr[#{$ie}]/td[text()='#{term1}']/following-sibling::td[1][text()='Hypernym']/following-sibling::td[text()='#{term2}']")
      end
    end
  end

  def errorverificationForRelationShips(term1,term2)
     waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
     sleep 5
     fill_in "term1",:with=>"#{term1}"
     select "Hypernym",:from=>"operatorList"
     fill_in "term2",:with=>"#{term2}"
     click_button("Save")
  end

  def edithypernym(term1,term2,term3,term4)
     waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='Hypernym']")
     sleep 5
     page.has_xpath?("//td[text()='#{term1}']/following-sibling::td[text()='#{term2}']/following-sibling::td/a[text()='Edit']").should be_true
     sleep 5
     find("//td[text()='#{term1}']/following-sibling::td[text()='#{term2}']/following-sibling::td/a[text()='Edit']").click
     #waitUntilElementvisible("//div[7][contains(@style,'display: block')]")
     sleep 9
     fill_in "term1",:with=>"#{term3}"
     fill_in "term2",:with=>"#{term4}"
     click_button("Save")
     waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr[last()]/td[4][text() or not(text())]")
  end

  def deleteHyperNym(term1,term2)
     waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='Hypernym']")
     sleep 6
     page.has_xpath?("//td[text()='#{term1}']/following-sibling::td[text()='#{term2}']/following-sibling::td/a[text()='Delete']").should be_true
     sleep 6
     find("//td[text()='#{term1}']/following-sibling::td[text()='#{term2}']/following-sibling::td/a[text()='Delete']").click
    $ie=$ie-1
     waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
     sleep 6
     page.has_xpath?("//span[text()='#{term1}']/following-sibling::span[text()='Hypernym']/following-sibling::span[text()='#{term2}']").should be_true
     find("//span[text()='Ok']/parent::button[contains(@class,'ui-button ui-widget')]").click
     waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='Hypernym']")
     sleep 9
     page.has_xpath?("//td[text()='#{term1}']/following-sibling::td[text()='#{term2}']/following-sibling::td/a[text()='Delete']").should be_false
  end

  def addingfilteroptionsforens(facetname,facetvalues)
     wait_for_js
     #waitUntilElementvisible("//*[@id='catfacetlist']/option[text()='#{facetname}']")
     find("//*[@id='catfacetlist']/option[text()='#{facetname}']").click
     #waitUntilElementvisible("//ul[@id='catFacetCBox']/li")
     #sleep 7
     wait_for_js
    for ftv in facetvalues
      ds="//ul[@id='catFacetCBox']/label[text()='#{ftv}']"
      if page.has_xpath?("#{ds}")
         find("#{ds}"+"/preceding-sibling::input[position()=1]").click
      else
         print "//ul[@id='catFacetCBox']/label[text()='#{ftv}']/preceding-sibling::input[position()=1] is not available"
      end
    end
  end

  def verifydisplayfacets(facetname,facetvalues)
  @val=find("//table[@id='displayFacetsRefinement']/tbody/tr/td[text()='#{facetname}']/following-sibling::td[1]").text
  if  @val.gsub(" ","").split(",").all?{|z| facetvalues.gsub(" ","").split(",").include?(z)} 
  page.should have_xpath("//table[@id='displayFacetsRefinement']/tbody/tr/td[text()='#{facetname}']/following-sibling::td[text()='#{@val}']")
  else
    raise "facet value count not matching............"
  end
  end

  def verifydisplayfacetsinDB(facetname,facetvalue)
    results= $dbhsaturn.execute("select count(*) from new_search_group_value where data_value='#{facetvalue}' and new_search_group_id=(select new_search_group_id from new_search_group where facet_name='#{facetname}' and new_search_action_id=(select new_search_action_id from new_search_action where merch_action_id=(select merch_action_id from merch_rule_action_assn where merch_rule_id=(select merch_rule_id from merch_rule where merch_rule_name='#{$randomstr}'))))")
    results.fetch do |row|
      puts "=========="
      puts row[0].to_int()
      puts "=========="
      # if row[0].to_int()==0
         # puts "passed..."
      # else
         # raise "#{facetvalue} is not selected for #{facetname}"
      # end
    end
  end
  
  def verifyAutoSuggesitions(id,autosuggesitionlist,ele)
       waitUntilElementvisible("//*[@id='#{id}']")
      for ftv in autosuggesitionlist 
       find("//*[@id='#{id}']").set("#{ftv}")
     if page.has_xpath?("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
      num_of_auto_suggestions = page.all("//ul[2]/li/a").count
      num_of_auto_suggestions.should be <= 5
      num=SecureRandom.random_number(num_of_auto_suggestions)+1
      find("//ul[2]/li[#{num}]/a").click
      waitUntilElementvisible(ele)
      sleep 3
      end
      end
  end
  
  def verifyGlobalautosuggestion(searchitem,searchinputvalue)
    even_num=0
    select searchitem,:from=>"globalSrchList"
    fill_in "globalSrchField", :with=> searchinputvalue
    sleep 2
    if page.has_xpath?("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
      num_of_auto_suggestions = page.all("//html/body/ul/li/a").count
      puts num_of_auto_suggestions
      num_of_auto_suggestions.should be <= 5
      actulnames=page.all("//html/body/ul/li/a").collect(&:text)
      puts actulnames
      if actulnames.uniq.length == actulnames.length then 
        num=rand(num_of_auto_suggestions)+1
        find("//html/body/ul/li[#{num}]/a").click
        #find("//*[@id='mSearch']/button").click
        waitUntilElementvisible("//*[@id='TBLfindDict' or @id='TBLrelationships' or @id='TBLterms' and count(child::tbody/tr)>=1]")
        #page.should have_xpath("//*[@id='TBLfindDict' or @id='TBLrelationships']/tbody/tr/td[1]/span[text()='#{actulnames[num+1]}']")
      end
    else
      puts "No autosuggestion for two or less than two chars"
      end
  end
  
  def verifyAutoSuggestions()
    waitUntilElementvisible("//ul[starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]")
    cnt =page.all("//ul[starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]/li").count
     if cnt<=5
       find("//ul[starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]/li[#{rand(cnt)+1}]").click
     end
  end
  
  def verifyNoAutoSuggestions(asg)
    page.should have_xpath("//ul[starts-with(@class,'ui-#{asg}') and contains(@style,'display: none;')]")
  end
  
  def createDictionaryRelationships(term1,relationship,term2)
    if relationship.include?("Hypernym")
    find("//span[text()='Add']").click
    sleep 8
    $ht1="#{term1+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")}"
    $ht2="#{term2+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")}"
    fill_in "term1",:with=>$ht1
    select "#{relationship}",:from=>"operatorList"
    fill_in "term2",:with=>$ht2
    sleep 4
    click_button("Save")
    attempts=0
    begin
    find("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='#{relationship}']").click
    sleep 3
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
    else
    find("//span[text()='Add']").click
    sleep 8
    fill_in "term1",:with=>"#{term1}"
    select "#{relationship}",:from=>"operatorList"
    fill_in "term2",:with=>"#{term2}"
    sleep 4
    click_button("Save")
    waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='#{relationship}']")
    sleep 5
    end
  end
  
  def makereltiondesignation(term1,relationship,term2)
    fill_in "term1",:with=>"#{term1}"
    select "#{relationship}",:from=>"operatorList"
    fill_in "term2",:with=>"#{term2}"
    sleep 4
    $ps=0
  end
  
  def phrasespecificpresence()
    find("//input[@id='phraseRelationship']").should_not be_checked
    find("//input[@id='phraseRelationship']").click
    page.has_select?('applyTo', :options => ["Apply To", "Don't Apply To"]).should be_true
    page.has_select?("applyTo", :selected => "Apply To").should be_true
  end
  
  
  def addphrasespecific()
    
  end
  
  def createDesignation(term,designation)
    find("//span[text()='Add']").click
    sleep 8
    fill_in "term1",:with=>"#{term}"
    select "#{designation}",:from=>"operatorList"
    sleep 4
    click_button("Save")
    waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='#{designation}']")
    sleep 5
  end
  

def wait_for_ajax_requests(wait_start = 10)
    result = page.driver.browser.execute_async_script(<<-JS)
      var callback = arguments[arguments.length - 1];
      if (window.wait_for_ajax_requests_hit_fallback) {
        callback(0);
      } else if (typeof($) == 'undefined') {
        callback(-1);
      } else {
        var fallbackCallback = window.setTimeout(function() {
          // technically, we should cancel the other timeouts that we've set up at this
          // point, but we're going to be raising an exception anyway when this happens,
          // so it's not a big deal.
          window.wait_for_ajax_requests_hit_fallback = 1;
          callback(-2);
        }, 55000);
        var doCallback = function(value) {
          window.clearTimeout(fallbackCallback);
          callback(value);
        }
        var waitForAjaxStop = function(value) {
          $(document).bind('ajaxStop.canvasTestAjaxWait', function() {
            $(document).unbind('.canvasTestAjaxWait');
            doCallback(value);
          });
        }
        if ($.active == 0) {
          // if there are no active requests, wait {wait_start}ms for one to start
          var timeout = window.setTimeout(function() {
            $(document).unbind('.canvasTestAjaxWait');
            doCallback(0);
          }, #{wait_start});
          $(document).bind('ajaxStart.canvasTestAjaxWait', function() {
            window.clearTimeout(timeout);
            waitForAjaxStop(2);
          });
        } else {
          waitForAjaxStop(1);
        }
      }
    JS
    if result == -2
      raise "Timed out waiting for ajax requests to finish. (This might mean there was a js error in an ajax callback.)"
    end
    wait_for_js
    result
  end
  
def wait_for_js
    page.driver.browser.execute_script <<-JS
      window.selenium_wait_for_js = false;
      setTimeout(function() { window.selenium_wait_for_js = true; });
    JS
    keep_trying_until { page.driver.browser.execute_script('return window.selenium_wait_for_js') == true }
  end
  
def wait_for_js_pom
    @browser.execute_script <<-JS
      window.selenium_wait_for_js = false;
      setTimeout(function() { window.selenium_wait_for_js = true; });
    JS
    keep_trying_until { @browser.execute_script('return window.selenium_wait_for_js') == true }
  end  

def keep_trying_until(seconds = 45)
    val = false
    seconds.times do |i|
      puts "trying #{seconds - i}" if i > 6
      val = false
      begin
        val = yield
        break if val
      rescue => e
        raise if i == seconds - 1
      end
      sleep 1
    end
    raise "Unexpected #{val.inspect}" unless val
    val
  end  
end

def wait_for_dom_ready
    page.driver.browser.execute_script(<<-JS)
     var callback = arguments[arguments.length - 1];
     var pollForJqueryAndRequire = function(){
        if (window.jQuery && window.require && !window.requirejs.s.contexts._.defQueue.length) {
          jQuery(function(){
            setTimeout(callback, 1);
          });
        } else {
          setTimeout(pollForJqueryAndRequire, 1);
        }
      }
      pollForJqueryAndRequire();
    JS
  end
  
def waitforYUIload
  dir_to_jquery = Dir.pwd + '/features/support/ajax_resources'
  prototypestring = File.open("#{dir_to_jquery}/jQuerify.js").read
  @browser.manage.timeouts.script_timeout = 10
  @browser.execute_async_script(prototypestring)
  max_time_wait = Time.now + 30
  until Time.now > max_time_wait
    break if @browser.execute_script("var inProgress=0 for(var i=0; i < YAHOO.util.Connect._transaction_id; i++) {if(YAHOO.util.Connect.isCallInProgress(i)) inProgress++;} return inProgress;") == 0
    sleep 0.5
  end
  
  
def wait_for_ajax_requests(wait_start = 0)
    result = @browser.execute_async_script(<<-JS)
var callback = arguments[arguments.length - 1];
if (window.wait_for_ajax_requests_hit_fallback) {
callback(0);
} else if (typeof($) == 'undefined') {
callback(-1);
} else {
var fallbackCallback = window.setTimeout(function() {
// technically, we should cancel the other timeouts that we've set up at this
// point, but we're going to be raising an exception anyway when this happens,
// so it's not a big deal.
window.wait_for_ajax_requests_hit_fallback = 1;
callback(-2);
}, 55000);
var doCallback = function(value) {
window.clearTimeout(fallbackCallback);
callback(value);
}
var waitForAjaxStop = function(value) {
$(document).bind('ajaxStop.canvasTestAjaxWait', function() {
$(document).unbind('.canvasTestAjaxWait');
doCallback(value);
});
}
if ($.active == 0) {
// if there are no active requests, wait {wait_start}ms for one to start
var timeout = window.setTimeout(function() {
$(document).unbind('.canvasTestAjaxWait');
doCallback(0);
}, #{wait_start});
$(document).bind('ajaxStart.canvasTestAjaxWait', function() {
window.clearTimeout(timeout);
waitForAjaxStop(2);
});
} else {
waitForAjaxStop(1);
}
}
JS
    if result == -2
      raise "Timed out waiting for ajax requests to finish. (This might mean there was a js error in an ajax callback.)"
    end
    wait_for_js_pom
    result
  end  
end

def wait_for_page_load
  @wait.until { @browser.execute_script("return document.readyState;") == "complete" }
  sleep 5
end
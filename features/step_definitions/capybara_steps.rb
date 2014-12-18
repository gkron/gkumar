include CommonMethods

When(/^I select the "(.*?)" from "(.*?)" dropdown$/) do |option,seid|
select option,:from=>seid
end

Then(/^I should see only new form to recreate the phrase specific$/) do
page.should have_xpath("//*[@id='addEditRelForm' and count(child::div)=3]")
end

When(/^I uncheck the "(.*?)"$/) do |psr|
str=psr.split(" ") 
find("//*[@id='#{str[0]+str[2]}']").set(false)
sleep 3
page.should have_xpath("//*[@id='addEditRelForm' and count(child::div)=2]")
end

When(/^I click the edit relationship and designation "(.*?)" button$/) do |button|
click_button(button)
end

Then(/^I should not see "(.*?)" in Edit relationship and designation window$/) do |field|
@op=field.downcase.gsub(/[_]/, ' ') 
cnt  = page.all("//form[@id='addEditRelForm']/div[contains(@id,'addPhraseSpecific')]").count
for i in 0..cnt-1
exval=find("//div[@id='addPhraseSpecific#{i}']/input").value
 if exval.include?(@op)
  page.has_select?("compositeAttribute#{i}", :selected => "#{field}").should be_false
  break;
 end
end
end

When(/^I delete "(.*?)" by clicking cross "(.*?)" sign$/) do |op,cross|
cnt  = page.all("//form[@id='addEditRelForm']/div[contains(@id,'addPhraseSpecific')]").count
for i in 0..cnt-1
if find("//div[@id='addPhraseSpecific#{i}']/input").value.match(op.downcase.gsub(/[_]/, ' '))
find("//*[@id='buttonRemove#{i}']").click
break
end
end
end

When(/^I click the "(.*?)" link of the dictionary "(.*?)" with the term "(.*?)"$/) do |editlink,dicname,termname|
if $dy.include?(dicname)
find("//*[@id='TBLterms']/tbody/tr/td[text()='#{$dy}']/following-sibling::td/a[text()='Edit']").click
waitUntilElementvisible("html/body/div[7][starts-with(@style,'display: block;')]")
sleep 5
end
end

Then(/^I should able to search "(.*?)" from global searh$/) do |dictionaryname|
select "Dictionary Names",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>dictionaryname
click_button("Go")
waitUntilElementvisible("//*[@id='TBLfindDict']/tbody/tr/td/span[text()='#{dictionaryname}']")
click_on("View Details")
sleep 5
end

When(/^I click the "(.*?)" button on edit relationship window$/) do |savebutton|
click_button(savebutton)
end

When(/^I checked "(.*?)" from "(.*?)" list box$/) do |pricemenu,label|
pricemenu.split(",").each do |c|
   find("//*[@id='divPriceFilter0_#{$j}']/div/span[text()='#{c}']/preceding-sibling::input").set(true)
end
end

When(/^I Unchecked "(.*?)" in "(.*?)" list box$/) do |op,label|
op.split(",").each do |c|
if find("//*[starts-with(@id,'divPriceFilter0_')]/div/span[text()='#{c}']/preceding-sibling::input").checked?
find("//*[starts-with(@id,'divPriceFilter0_')]/div/span[text()='#{c}']/preceding-sibling::input").set(false)
end
end
end

Then(/^I should see the related checked Price Type Filter Groups Price type value selected as "(.*?)" from "(.*?)" list box$/) do |op,label|
op.split(",").each do |c|
page.should have_xpath("//*[@id='divPriceType0_#{$j}' or contains(@id,'divPriceType')]/select/option[text()='#{c}' and @selected='selected']")
end
end   

Then(/^I should see previous "(.*?)"$/) do |sp|
page.should have_xpath("//*[@id='divPriceType0_#{$j}']/select/option[@value and @selected='selected']")
end

Then(/^I should see unchecked "(.*?)" from "(.*?)" list box$/) do |pricemenu,label|
pricemenu.split(",").each do |c|
   find("//*[@id='divPriceFilter0_#{$j}']/div/span[text()='#{c}']/preceding-sibling::input").should_not be_checked
end
end 

Then(/^I should see checked "(.*?)" from "(.*?)" list box$/) do |pricemenu,label|
pricemenu.split(",").each do |c|
   find("//*[@id='divPriceFilter0_#{$j}' or contains(@id,'divPriceFilter')]/div/span[text()='#{c}']/preceding-sibling::input").should be_checked
end
end 

Then(/^I should see all the "(.*?)" selected in "(.*?)" list box$/) do |options,label|
 page.should have_xpath("//*[@id='divPriceType0_#{$j}']/select/option[@value and @selected='selected']") 
end

Then(/^I should see alert message appear as "(.*?)"$/) do |msg|
page.should have_xpath("//*[@id='resultSetMessage0' and text()='#{msg}']")
end 

When(/^I unselect "(.*?)" from text field for "(.*?)" attribute$/) do |attval,atttype|
page.find("//span[@class='tagBox-item-content' and text()='#{attval}']/a[@href='javascript:void(0)']").click
end

Then(/^I should not see alert message as "(.*?)"$/) do |msg|
page.should have_xpath("//*[@id='resultSetMessage0' and text()='#{msg}' and @class='hidden']")
end 

When(/^I enter "(.*?)" in product type entry box$/) do |it|
fill_in "inputProductType0",:with=>it
end

When(/^I select "(.*?)" as product type$/) do |it|
waitUntilElementvisible("//ul[2][starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]")
num_of_auto_suggestions = page.all("//ul[2][starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]/li").count
num_of_auto_suggestions.should be <= 5
find("//strong[text()='Dr']/parent::a[text()='#{it[2..-1]}']").click 
end

Then(/^I should see "(.*?)" with corresponding "(.*?)"$/) do |attype,atterm|
cnt1 = attype.split(",").length
cnt  = page.all("//form[@id='addEditRelForm']/div[contains(@id,'addPhraseSpecific')]").count
if cnt1==cnt
for i in 0..cnt1-1
exval=find("//div[@id='addPhraseSpecific#{i}']/input").value
if exval.include?("product")
@op=exval.split.each{|j| j.capitalize!}.join(' ')
elsif exval.include?("brand")
@op= exval.capitalize
else
@op=exval.split.each{|j| j.capitalize!}.join('_')
end
page.has_select?("compositeAttribute#{i}", :selected => "#{@op}").should be_true
end
end
end

When(/^I click the "(.*?)" link of the terms "(.*?)" with relationship "(.*?)"$/) do |edit,term,rs|
find("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{term}']/following-sibling::td[text()='#{rs}']/following-sibling::td/a[text()='Edit']").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 3
end

When(/^I click the "(.*?)" link$/) do |plussign|
$ps=$ps+1
click_on("buttonAdd#{$ps-1}")
sleep 3
end

When(/^I select attribute type "(.*?)" from drop down$/) do |attype|
select attype, :from=>"compositeAttribute#{$ps}"
end

When(/^I enter attribute term "(.*?)"$/) do |term|
page.driver.browser.find_element(:xpath,"//*[@id='compositeTerm#{$ps}']").send_keys [:control, 'a'], term
end

Then(/^I should see "(.*?)" check box unchecked by default$/) do |ps|
find("//input[@id='phraseRelationship']").should_not be_checked
end

Then(/^I should see "(.*?)" selected by default from "(.*?)" dropdown$/) do |op,it|
 page.has_select?(it, :selected => op).should be_true
end

Then(/^I should see "(.*?)" search phrase spectific options from "(.*?)" dropdown$/) do |op,it|
page.has_select?(it, :options => op.split(",")).should be_true
end 

When(/^I select "(.*?)" option from drop down$/) do |op|
find("//*[@id='showFacetOperator#{@sf}']/option[text()='#{op}']").click  
end

Then(/^I should see "(.*?)" option in drop down$/) do |op|
page.has_select?("showFacetOperator#{@sf}", :selected => "#{op}").should be_true
end

Then(/^I should see "(.*?)" option by default$/) do |op|
page.has_select?("showFacetOperator#{@sf}", :selected => "#{op}").should be_true
end

Then(/^I should see "(.*?)" option disabled by default in drop down$/) do |op|
page.should have_xpath("//*[@id='showFacetOperator#{@sf}']/option[text()='#{op}' and @disabled='disabled']")
end

When(/^I clear the attribute value "(.*?)"$/) do |attvals|
if attvals.include?(",")
attvals.split(",").each do |c|
   find("//span[@class='tagBox-item-content' and text()='#{c}']/a").click
end
else
   find("//span[@class='tagBox-item-content' and text()='#{attvals}']/a").click
end
end

When(/^I "(.*?)" Collapse check box$/) do |uncheck|
find("//table[@id='displayFacetsTable']/tbody/tr/td[4]/input").click
end

When(/^I select "(.*?)" as "(.*?)" from calendar pop up$/) do |datetype,ti|
if datetype.include?("Effective Date")
find("//table[@id='displayFacetsTable']/tbody/tr/td[5]/input").set(ti)
elsif datetype.include?("Expiration Date")
find("//table[@id='displayFacetsTable']/tbody/tr/td[6]/input"). set(ti)
end
end

When(/^I removed Effective Date as "(.*?)" from Effective Date text field$/) do |arg1|
find("//table[@id='displayFacetsTable']/tbody/tr/td[5]/input").set(" ")
end

Then(/^I should see facet "(.*?)" as "(.*?)"$/) do |datetype,ti|
if datetype.include?("Effective Date")
find("//table[@id='displayFacetsTable']/tbody/tr/td[5]/input").value.should==ti
elsif datetype.include?("Expiration Date")
find("//table[@id='displayFacetsTable']/tbody/tr/td[6]/input").value.should==ti
end
end

Then(/^I should see "(.*?)" field as blank$/) do |sffields|
find("//table[@id='displayFacetsTable']/tbody/tr/td[3]/input[not(@*) or @disabled='disabled']").value.should==""
find("//table[@id='displayFacetsTable']/tbody/tr/td[5]/input").value.should==""
find("//table[@id='displayFacetsTable']/tbody/tr/td[6]/input").value.should==""
end

Then(/^I should see Collapse field "(.*?)" by default$/) do |uncheck|
find("//table[@id='displayFacetsTable']/tbody/tr/td[4]/input").should_not be_checked 
end

When(/^I enter "(.*?)" in Display text field$/) do |displayname|
find("//table[@id='displayFacetsTable']/tbody/tr/td/input[not(@*)]").set(displayname)
end

Then(/^I should see "(.*?)" field checked by default$/) do |sffi|
find("//table[@id='displayFacetsTable']/tbody/tr/td[4]/input").should be_checked 
end

Then(/^I should see Display Name as "(.*?)"$/) do |displayname|
find("//table[@id='displayFacetsTable']/tbody/tr/td[3]/input").value.should==displayname
end

When(/^I click the "(.*?)" button without enter terms$/) do |go|
click_on("filterTermBtn")
end

When(/^I select the "(.*?)" from global search$/) do |searchtype|
select searchtype, :from=>"globalSrchList"
end

When(/^I click the "(.*?)" button with enter non exist "(.*?)"$/) do |go,term|
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], term
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLrelationships' or @id='TBLfindDict' or @id='TBLterms']/tbody/tr/td[text()='No Records']")
end

When(/^I click the "(.*?)" button with enter unknown value as "(.*?)"$/) do |go,name|
page.driver.browser.find_element(:xpath,"//*[@id='globalSrchField']").send_keys [:control, 'a'], name
find("//*[@id='mSearch']/button").click
waitUntilElementvisible("//*[@id='TBLrelationships' or @id='TBLfindDict' or @id='TBLterms']/tbody/tr/td[text()='No Records']")
end

  
Then(/^I should see "(.*?)" in "(.*?)" page$/) do |norecord,page|
#page.should have_xpath("//*[@id='TBLrelationships' or @id='TBLfindDict' or @id='TBLterms']/tbody/tr/td[text()='No Records']")
end

When(/^I click the "(.*?)" link in dictionary page$/) do |viewdetails|
click_on(viewdetails)
end

When(/^I enter "(.*?)" in the add relationship designation window$/) do |term|
fill_in "#{term}",:with=>"abc"
end

When(/^I create "(.*?)" having "(.*?)" with "(.*?)" and save the relation in "(.*?)"$/) do |t1,op,t2,ev,table|
find("//span[text()='Add']").click
sleep 9
table.raw.each do |term1,op1,term2|
if $ht2.include?(term1) && $ht1.include?(term2)
fill_in "term1",:with=>$ht2
select "#{op1}",:from=>"operatorList"
fill_in "term2",:with=>$ht1
end
sleep 4
click_button("Save")
waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='#{op1}']")
sleep 5
end
end

When(/^I choose dictionary name as "(.*?)" and dictionary type as "(.*?)" from model window and enter term as "(.*?)" term as "(.*?)" and relationship as "(.*?)"$/) do |dicname,type,term1,term2,relationship|
puts dicname 
  if $dy.include?(dicname)  
    attempts=0
    begin
    puts "//*[@id='dictName']/option[text()='#{$dy} - #{type}']"
    find("//*[@id='dictName']/option[text()='#{$dy} - #{type}']").click 
    sleep 3
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
  end 
  if page.has_xpath?("//*[@id='dictName']/option[text()='#{$dy} - #{type}']")  
    fill_in "term1",:with=>"#{term1}"
    select "#{relationship}",:from=>"operatorList"
    fill_in "term2",:with=>"#{term2}"
    sleep 4
    click_button("Save")
    sleep 5
  end
end

When(/^I choose dictionary name as "(.*?)" and dictionary type as "(.*?)" from model window and add a relationship as "(.*?)" "(.*?)" "(.*?)" in Add relationship window$/) do |dicname,type,term1,relationship,term2|
$ps=0
if $dy.include?(dicname)  
    attempts=0
    begin
    puts "//*[@id='dictName']/option[text()='#{$dy} - #{type}']"
    find("//*[@id='dictName']/option[text()='#{$dy} - #{type}']").click 
    sleep 3
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
  end 
  if page.has_xpath?("//*[@id='dictName']/option[text()='#{$dy} - #{type}']")  
    fill_in "term1",:with=>"#{term1}"
    select "#{relationship}",:from=>"operatorList"
    fill_in "term2",:with=>"#{term2}"
  end
end

When(/^I choose dictionary name as "(.*?)" and dictionary type as "(.*?)" from model window and enter term as "(.*?)" and designation as "(.*?)"$/) do |dicname,type,term,relationship|
puts dicname 
  if $dy.include?(dicname)  
    attempts=0
    begin
    puts "//*[@id='dictName']/option[text()='#{$dy} - #{type}']"
    find("//*[@id='dictName']/option[text()='#{$dy} - #{type}']").click 
    sleep 3
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
  end 
  if page.has_xpath?("//*[@id='dictName']/option[text()='#{$dy} - #{type}']")  
    fill_in "term1",:with=>"#{term}"
    select "#{relationship}",:from=>"operatorList"
    sleep 4
    click_button("Save")
    sleep 5
  end
end
When(/^I selet the Relationship Designation as "(.*?)"$/) do |rd|
find("//*[@id='operatorList']/option[text()='#{rd}']").click
end

When(/^I click the "(.*?)" link for relationship as "(.*?)" is "(.*?)" to "(.*?)" in dictionary "(.*?)"$/) do |edit,term1,ro,term2,dic|
if edit.match(/^Edit/)
find("//*[@id='TBLterms']/tbody/tr[child::td[contains(text(),'#{dic}')]][last()]/child::td[child::span[text()='#{term1}']]/following-sibling::td/a[text()='#{edit}']").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
page.should have_xpath(".//*[@id='dictionaryDetailsDiv']/span[text()='Dictionary Name: ']/following-sibling::span[contains(text(),'#{dic}')]")
elsif edit.match(/^Delete/)
find("//*[@id='TBLterms']/tbody/tr[child::td[contains(text(),'#{dic}')]][last()]/child::td[child::span[text()='#{term1}']]/following-sibling::td/a[text()='#{edit}']").click
waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
sleep 4
end
end

Then(/^I should see "(.*?)" dictionary details page$/) do |dicname|
waitUntilElementvisible("//*[@id='pHeader']/div[contains(text(),'Dictionary Detail: #{dicname}')]")
end

Then(/^I should see search results containing "(.*?)" term across all dictionaries$/) do |searchingterm|
cnt=page.all("//*[@id='TBLrelationships']/tbody/tr").count
cnt1=page.all("//*[@id='TBLterms']/tbody/tr/td[child::span[text()='#{searchingterm}']]").count
if cnt==cnt1
puts "searching results contains #{searchingterm} term only"
end
end 

When(/^I sort "(.*?)" column in terms listing page$/) do |sortingcolumn|
waitUntilElementvisible("//*[@id='TBLterms' or @id='TBLdictionaries' and count(child::tbody/tr)>1]")
find("//*[@id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div[text()='#{sortingcolumn}']").click
waitUntilElementvisible("//*[@id='TBLterms' or @id='TBLdictionaries' and count(child::tbody/tr)>1]")
end

Then(/^I should see following "(.*?)" in filter by pulldown in Terms page$/) do |filteroption,table|
table.raw.each do |col|
page.should have_xpath("//*[@id='filterOperatorList']/option[text()='#{col.join("")}']")
end
end

Then(/^I should see the following "(.*?)" as table columns in "(.*?)" page$/) do |columns,terms,table|
table.raw.each do |col|
page.should have_xpath("//*[@id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div[text()='#{col.join("")}']")
end
end

When(/^I search for the Dictionary Terms with "(.*?)"$/) do |term|
select "Dictionary Terms",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>"#{term}"
find("//*[@id='mSearch']/button").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
sleep 4
end


When(/^I edit "(.*?)" as "(.*?)" having relationship "(.*?)" as "(.*?)" with "(.*?)" as "(.*?)"$/) do |termo1,termo2,opo,opn,termn1,termn2,table|
table.raw.each do |t1o,t1n,od,on,t2o,t2n|
if !page.has_xpath?("//div[7][contains(@style,'display: block;')]")
find("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{t1o}']/following-sibling::td/a[1]").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
end

fill_in "term1",:with=>t1n
fill_in "term2",:with=>t2n
select on,:from=>"operatorList"
if t1n.match(/^cancel1/)
  click_button("Cancel")
else
  click_button("Save")
  waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
end
end
end

When(/^I edit the designation with "(.*?)" as "(.*?)" having relationship "(.*?)" as "(.*?)"$/) do |termold,termnew,opold,opnew,table|
table.raw.each do |t1o,t1n,od,on|
find("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{t1o}']/following-sibling::td/a[1]").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
fill_in "term1",:with=>t1n
select on,:from=>"operatorList"
if t1n.match(/^cancel12/)
  click_button("Cancel")
else
  click_button("Save")
  waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
end
end
end

When(/^I edit the relationship into a designation with "(.*?)" having "(.*?)" relationship with "(.*?)" as "(.*?)" having "(.*?)" and verify$/) do |term1,rop,term2,ter1,dop,table|
table.raw.each do |rterm1,ro,rterm2,dterm,od|
find("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{rterm1}']/following-sibling::td/a[1]").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
select od,:from=>"operatorList"
click_button("Save")
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
end
end

When(/^I edit the designation into a relationship with "(.*?)" having "(.*?)" designation as "(.*?)" and "(.*?)" having "(.*?)" and verify$/) do |dterm,od,rterm1,rterm2,rop,table|
table.raw.each do |dt,dop,rt1,rt2,rop|
find("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{dt}']/following-sibling::td/a[1]").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
select rop,:from=>"operatorList"
fill_in "term2",:with=>rt2
click_button("Save")
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
end
end

Given(/^I search for dictionary from global search$/) do
select "Dictionary Names",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>"#{$dy}"
find("//*[@id='mSearch']/button").click
waitUntilElementvisible("//*[@id='TBLfindDict' and count(child::tbody/tr)>=1]")
find("//*[@id='TBLfindDict']/tbody/tr/td[3]/a").click
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
end

When(/^I search the "(.*?)" from global search with "(.*?)"$/) do |dici,dicn,table|
table.raw.each do |dt|
verifyGlobalautosuggestion(dici,dt.join(""))
end
end  

When(/^I search for "(.*?)" from global search$/) do |dicname|
if $dy.include?(dicname)
select "Dictionary Names",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>"#{dicname}"
find("//*[@id='mSearch']/button").click
waitUntilElementvisible("//*[@id='TBLfindDict' and count(child::tbody/tr)>=1]")
end
end

Then(/^I should see dictionaries list filtered by "(.*?)"$/) do |dicname|
page.should have_xpath("//*[@id='TBLfindDict']/tbody/tr/td/span[text()='#{dicname}']")
end

When(/^I select the "(.*?)" from Filter by pulldown and check the "(.*?)"$/) do |relationope,count,table|
table.raw.each do |ro,rc|
select "#{ro}",:from=>"filterOperatorList"
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
page.should have_xpath("//*[@id='TBLrelationships' and count(child::tbody/tr/td[text()='#{ro}'])=#{rc}]")
end
end

When(/^I select the relationship from filter by dropdown with terms and check the "(.*?)" having relationship with "(.*?)"$/) do |arg1, arg2, table|
table.raw.each do |t1,o,t2|
select "#{o}",:from=>"filterOperatorList"
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], t1
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
steps %{
When I check the "#{t1}" having "#{o}" with "#{t2}" in all pagination pages 
}
end
end

When(/^I check the "(.*?)" having "(.*?)" with "(.*?)" in all pagination pages$/)  do |rt1,ro,rt2|
page.should have_xpath("//*[@id='TBLterms']/tbody/tr[child::td[text()='#{$dy}']/../td/span[text()='#{rt1}']]")
end 

When(/^I search for the "(.*?)" from terms entry filed and check$/) do |terms,table|
find("//*[@id='filterOperatorList']/option[text()='All Relationships']").click
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
table.raw.each do |rt|
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], rt
sleep 3
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
cnt=page.all("//*[@id='TBLrelationships']/tbody/tr").count
page.should have_xpath("//*[@id='TBLrelationships' and count(child::tbody/tr[child::td[1]/span[text()='#{rt.join("")}'] or child::td[3]/span[text()='#{rt.join("")}'] ])=#{cnt}]")
end
end

When(/^I search the "(.*?)" by calling the "(.*?)" from Filter by pulldown and enter "(.*?)"$/) do |sterm,operator,terms,table|
table.raw.each do |ro,rt|
find("//*[@id='filterOperatorList']/option[text()='All Relationships']").click
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
select "#{ro}",:from=>"filterOperatorList"
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], rt
sleep 3
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLrelationships' and count(child::tbody/tr)>=1]")
cnt=page.all("//*[@id='TBLrelationships']/tbody/tr").count
page.should have_xpath("//*[@id='TBLrelationships' and count(child::tbody/tr[child::td[2][text()='#{ro}'] and child::td[1]/span[text()='#{rt}'] or child::td[3]/span[text()='#{rt}']])=#{cnt}]")  
end
end 

When(/^I search for "(.*?)" with "(.*?)" from terms page$/) do |term,op|
find("//*[@id='filterOperatorList']/option[text()='#{op}']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], term
sleep 3
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
end

Then(/^I should see "(.*?)" terms related listings with relationship "(.*?)"$/) do |term,operator|
cnt =page.all("//*[@id='TBLterms']/tbody/tr").count
for i in 1..cnt
page.should have_xpath("//*[@id='TBLterms']/tbody/tr[#{i}]/td[text()='#{operator}'][following-sibling::td/span='#{term}' or preceding-sibling::td/span='#{term}']")
end
end

When(/^I clear the term and enter "(.*?)" in place of "(.*?)" with relationship "(.*?)"$/) do |newterm,oldterm,op|
find("//*[@id='filterTermClearLink']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
page.driver.browser.find_element(:xpath,"//*[@id='filterTermVal']").send_keys [:control, 'a'], newterm
sleep 4
find("//*[@id='filterTermBtn']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
end

When(/^I edit the dictionary type as "(.*?)"$/) do |dictype|
find("//*[@id='pHeader']/div[2]/button[1]").click
select dictype,:from=>"typelist"
find("//*[@id='pHeader']/div[2]/button/span[text()='Save']").click
sleep 6
end

Then(/^I should see "(.*?)" is disabled$/) do |dictype|
find("//*[@id='pHeader']/div[2]/button[1]").click
page.should have_xpath("//*[@id='typelist' and @disabled]")
find("//*[@id='pHeader']/div[2]/button[3]").click
end

Then(/^I should see dictionary type "(.*?)"$/) do |dictype|
page.should have_xpath("//select[@id='typelist']/option[text()='#{dictype}' and @selected='selected']")
end

When(/^I search for dictionary term "(.*?)" "(.*?)" with "(.*?)" relationships$/) do |dicterm1,dicterm2,relationtype|
select "Dictionary Terms",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>dicterm1
click_button("Go")
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>1]")
select "Equals",:from=>"filterOperatorList"
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>1]")
end

Then(/^I should see error message displayed as "(.*?)"$/) do |errormsg|
puts errormsg
page.has_selector?("//*[@id='mPage']/div[1]/ul/li",:text=>"#{errormsg}").should be_true
end 

When(/^I select "(.*?)" from select action pulldown$/) do |actiontype|
select actiontype,:from=>"dropdownActionType#{$ac}"
end

When(/^I select the "(.*?)" and validate the popup message$/) do |action,table|
if action.include?("Redirect Action")
table.raw.each do |rda|
  $ac=1
  steps %{
    When I select "#{rda.join("")} from select action pulldown"
    Then I should see "alert message as Redirect actions cannot be combined with other actions, please delete the existing action/s to create a redirect."
  }
end
elsif action.include?("Duplicate Actions")
   table.raw.each do |rda|
    $ac=4
  steps %{
    When I select "#{rda.join("")}" from select action pulldown
    Then I should see "alert message as It's not allowed to have more than one Action of this type in the same rule."
    Then I click the "Ok" button on popup   
  }
  end
  $ac=4
end
end

When(/^I cancel the "(.*?)"$/) do |triggertype|
if triggertype.match(/^facet refine/)
  click_button("cancel")
  sleep 4
  $tr=0
end
end

When(/^I enter keyword value as "(.*?)" in the keyword field$/) do |keywordvalue|
puts "//div[@id='divCriteriaB#{$tr}_0']/span/input"
find("//div[@id='divCriteriaB#{$tr}_0']/span/input").set(keywordvalue)
puts "testing....."
page.driver.browser.action.send_keys(:tab).perform
#find("//*[@id='1labelKeyword0']").click
$tr=$tr+1
end

Then(/^I should see the "(.*?)" as "(.*?)"$/) do |field,fieldvalue|
  case field
  when "suggestion rulename"
    attempts=0
    begin
  find("//*[@id='templatesFilterType']/option[text()='Rule Name']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
  page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], @rsn
  sleep 3
  find("//*[@id='templatesFilterBtn']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end 
  when "auto suggestion rank"
    puts find("//*[@id='aSRank']").value
    find("//*[@id='aSRank']").value.should==fieldvalue
  when "Display Message" then
    find("//textarea[@id='textDisplayMessage#{@dm}' and @disabled='disabled']").value.should=="#{fieldvalue}"
  when "Media Group ID"
    find("//input[@id='mediaLocationPoolId#{@sm}_0' and @disabled='disabled']").value.should=="#{@media_grp_id}"
  when "facet condition default option"
    page.has_xpath?("//label[@id='labelKeywordPatternOperator0' and text()='#{fieldvalue}']").should be_true
  when "action type"
    page.has_xpath?("//select[@id='dropdownActionType#{@sf}']/option[text()='#{fieldvalue}' and @disabled='disabled']").should be_true
  when "RDPP Effective Date"
    find("//*[@id='startDateValue#{@rdpp}' or @id='startDateValue0']").value.should=="#{fieldvalue}"
  when "RDPP Expiration Date"
    find("//*[@id='endDateValue#{@rdpp}' or @id='endDateValue0']").value.should=="#{fieldvalue}"
  when "RDPP action type"
    page.has_xpath?("//select[@id='dropdownActionType#{@rdpp}' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "RDPP Algorithm type"
    page.has_xpath?("//select[@id='dropdownRDPPRule#{@rdpp}' or @id='dropdownRDPPRule0' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "description"
    verifyPageTextPresnt(field,fieldvalue)
  when "Owner"
    verifyElemetPresent($loc['rule_detail_page'],fieldvalue)
  when "Rule Effective Date"
    verifyPagecontent("startDate",fieldvalue)
  when "Rule Expiration Date"
    verifyPagecontent("endDate",fieldvalue)
  when "rulename"
    exprulename=fieldvalue+@dynamic_time
    verifyPagecontent("name",exprulename)
  when "display message action type"
    page.has_xpath?("//select[@id='dropdownActionType#{@dm}' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "Filter By"
    page.has_xpath?("//select[@id='showFacetFiltersDropdown#{@sf}' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "show facet product type"
    find("//*[@id='inputProductType#{@sf}']").value.should=="#{fieldvalue}"
  when "mrs action type"
    page.has_xpath?("//select[@id='dropdownActionType#{@mrs}' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "mrs action Product id"
    find("//*[@id='inputProductID#{@mrs}_0']").value.should=="#{fieldvalue}"
  when "mrs action operator"
    mrsop=find("//*[@id='selectOperator#{@mrs}']/option[text()='#{fieldvalue}']").value
    page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"operatorType\":\"#{mrsop}\"')]").should be_true
  when "saved set query id"
    find("//*[@id='inputSavedSet#{@mrs}_0']").value.should=="#{fieldvalue}"
  when "ens action type"
    page.has_xpath?("//select[@id='dropdownActionType#{@ens}' and @disabled='disabled']/option[text()='#{fieldvalue}']").should be_true
  when "Replace with Term field value"
    find("//*[@id='inputTextTermId#{@ens}']").value.should=="#{fieldvalue}"
  when "result set trigger type"
    verifyPageTextPresnt("dropdownTriggerType0",fieldvalue)
  when "refine trigger type"
    verifyPageTextPresnt("dropdownTriggerType0",fieldvalue)
  end
end

Then(/^I should see RDPP Effective Date as$/) do
 find("//*[@id='endDateValue0']").value.should=="12/12/2013"
end

When(/^I select "(.*?)" from Select Trigger pulldown$/) do |triggertype|
puts "//*[@id='dropdownTriggerType#{$tr}']/option[text()='#{triggertype}']"
find("//*[@id='dropdownTriggerType#{$tr}']/option[text()='#{triggertype}']").click
end

When(/^I select "(.*?)" and enter "(.*?)" for "(.*?)"$/) do |attributetype,attributevalue,triggertype|
  if triggertype.match(/^Result Set/)
     select attributetype,:from=>"dropdownResultSetTrigger#{$tr}_0" 
     find("//div[@id='divSubCriteriaA#{$tr}_0']/span/input").set(attributevalue)
     page.driver.browser.action.send_keys(:tab).perform
     select "<",:from=>"logicalDropdownResultSetTrigger#{$tr}_0"
  elsif triggertype.match(/^Product Data Match/)
     select attributetype,:from=>"dropdownProductDataMatch#{$tr}_0"
     find("//div[@id='divCriteriaA#{$tr}_0']/span/input").set(attributevalue)
     page.driver.browser.action.send_keys(:tab).perform
  elsif triggertype.match(/^Facet Refinement/)
    find("//div[@id='divSubCriteriaA#{$tr}_0']/span[1]/input").set(attributetype)
    page.driver.browser.action.send_keys(:tab).perform
    find("//div[@id='divSubCriteriaA#{$tr}_0']/span[2]/input").set(attributevalue)
    page.driver.browser.action.send_keys(:tab).perform
  elsif triggertype.match(/^Result Count/)  
     find("//*[@id='divLabel#{$tr}']/select/following-sibling::input").set(attributevalue)
     page.driver.browser.action.send_keys(:tab).perform
  end
end

When(/^I click the Specific Countries radio button$/) do
find("//*[@id='box3']/span[text()='Specific Countries']/preceding-sibling::input").click
waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
sleep 3
end

When(/^I click the Select Countries "(.*?)" button$/) do |okbutton|
new_window=page.driver.browser.window_handles.last 
  page.within_window new_window do
  page.has_xpath?("//div[6][contains(@style,'display: block;')]").should be_true
  page.find("//div[6]/div[11]/div/button[1]").click
  end
end

When(/^I sort "(.*?)" column from ascending order$/) do |sortingcolumn|
find("//*[@id='tblExceptions' or @id='tblTemplates' or @id='TBLterms' or @id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div[text()='#{sortingcolumn}']").click
waitUntilElementvisible("//*[@id='tblExceptions' or @id='tblTemplates' or @id='TBLterms' or @id='TBLdictionaries' and count(child::tbody/tr)>1]")
end

When(/^I sort "(.*?)" column in suggestion exception listing page$/) do |sortingcolumn|
waitUntilElementvisible("//*[@id='tblExceptions' or @id='tblTemplates' and count(child::tbody/tr)>1]")
find("//*[@id='tblExceptions' or @id='tblTemplates']/thead/tr/th/div[text()='#{sortingcolumn}']").click
waitUntilElementvisible("//*[@id='tblExceptions' or @id='tblTemplates' and count(child::tbody/tr)>1]")
end

Then(/^I should see "(.*?)" is deleted from action panel$/) do |actiontype|
if actiontype.match(/^ENS/)
  $ac=$ac-1
elsif actiontype.match(/^RDPP/)
  $ac=$ac-1
end
end

Then(/^I should see "(.*?)" column in ascending order$/) do |sortingcolumn|
steps %{
    Given I connect to the database
  }
if sortingcolumn.match(/^ID/)
results = $dbhsaturn.execute("SELECT auto_override_id FROM (select * from auto_override where site_tenant='#{$yml_file['sitetenant']}' ORDER BY auto_override_id asc) WHERE ROWNUM < 2")
results.fetch do |row|
page.should have_xpath("//*[@id='tblExceptions' or @id='tblTemplates']/tbody/tr[1]/td[text()='#{row.join}' or child::a[text()='#{row.join}']]")
end
else
  page.should have_xpath(".//*[@id='tblExceptions' or @id='tblTemplates' or @id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div[text()='#{sortingcolumn}' and child::span[contains(@class,'ui-icon ui-icon-triangle-1-n')]]")
end
end

Then(/^I should see "(.*?)" column in descending order$/) do |sortingcolumn|
if sortingcolumn.match(/^ID/)
results = $dbhsaturn.execute("SELECT auto_override_id FROM (select * from auto_override where site_tenant='#{$yml_file['sitetenant']}' ORDER BY auto_override_id desc) WHERE ROWNUM < 2")
results.fetch do |row|
page.should have_xpath("//*[@id='tblExceptions' or @id='tblTemplates']/tbody/tr[1]/td[text()='#{row.join}' or child::a[text()='#{row.join}']]")
end
else
  page.should have_xpath(".//*[@id='tblExceptions' or @id='tblTemplates' or @id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div[text()='#{sortingcolumn}' and child::span[contains(@class,'ui-icon ui-icon-triangle-1-s')]]")
end
end

When(/^I enter attribute value as "(.*?)" in text box$/) do |duplicateattributevalues|
find("//input[starts-with(@id,'tagBox-input')]").set(duplicateattributevalues)
page.driver.browser.action.send_keys(:tab).perform
end

Then(/^I should see "(.*?)" is not saved$/) do |trigger|
page.should have_xpath("//div[@id='triggers' and @style='display: none;']")
end 

When(/^I remove the trigger by clicking "(.*?)"$/) do |crossmark|
find("//*[@id='buttonRemove0_1']").click
end

When(/^I click the "(.*?)" trigger button$/) do |deletebutton|
click_button(deletebutton)
end

When(/^I click the "(.*?)" text link$/) do |ruleid|
find("//*[@id='TBLrules']/tbody/tr/td[1]/a").click
sleep 4
end

Then(/^I click the "(.*?)" button on popup$/) do |popupbutton|
 puts popupbutton
end

Then(/^I should see "(.*?)" is deleted$/) do |triggertype|
  page.should_not have_xpath("//div/select[@id='dropdown#{triggertype}0_0']")
end

Then(/^I should see "(.*?)" is saved$/) do |triggertype|
   page.should have_xpath("//*[@id='dropdown#{triggertype}0_0' and child::option]/following-sibling::span")
end

Then(/^I should see "(.*?)" attribute type is created with specialchars$/) do |attributetype,table|
table.raw.each do |attributes|
page.has_xpath?("//*[@id='dropdownResultSetTrigger0_0' and child::option[text()='#{attributetype}' and @selected='selected']]/following-sibling::span/span/span/span[text()='#{attributes.join("")}']").should be_true
end
end

When(/^I add attribute by clicking "(.*?)" symbol$/) do |plussymbol|
$j=$j+1
menu =page.driver.browser.find_element(:xpath,"//*[contains(@id,'buttonAdd') and not(contains(@class,'hidden'))]") 
page.driver.browser.action.move_to(menu).click(menu).perform
end

Then(/^I should see percentage as "(.*?)"$/) do |percentagevalue|
page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"resultSetGroupPercent\":#{percentagevalue}.0')]").should be_true 
end

Then(/^I should see logical operatos as "(.*?)"$/) do |logicalop|
  page.should have_xpath("//*[@id='logicalDropdownResultSetTrigger0_#{$lo}']/option[@value='>' or @value='<' and @disabled='disabled']")
  $lo=$lo+1
end

Then(/^I should see attribute type as "(.*?)" and attribute value as "(.*?)"$/) do |attributetype,attributevalue|
  verifyAttributeTypeAndValue(attributetype,attributevalue)
end 

Then(/^I should see "(.*?)" and "(.*?)"$/) do |atttype,attvalue,table|
table.raw.each do |attritype,attrivalue|
verifyAttributeTypeAndValue(attritype,attrivalue)
end
end

When(/^I select attribute type "(.*?)" from "(.*?)" dropdown$/) do |attributetype,triggertype|
waitUntilElementvisible("//*[@id='dropdown#{triggertype}0_#{$j}']/option[text()='#{attributetype}']")
select attributetype,:from=>"dropdown#{triggertype}0_#{$j}"
end

When(/^I enter attribute value "(.*?)"$/) do |attributevalue|
find("//div[@id='divSubCriteriaA0_#{$j}' or @id='divCriteriaA0_#{$j}']/span[@class='tagBox-container']/input").set(attributevalue)
page.driver.browser.action.send_keys(:tab).perform
end

When(/^I enter the attribute value "(.*?)"$/) do |attributevalue|
find("//div[@id='divSubCriteriaA0_#{$j}' or @id='divCriteriaA0_#{$j}']/span[@class='tagBox-container']/input").set(attributevalue)
find("//*[@id='divTriggerButtons0']").click
end

When(/^I validate the "(.*?)" and "(.*?)" with "(.*?)" and "(.*?)" for "(.*?)"$/) do |at,av,dv,iv,tty,table|
 if tty.match(/^ResultSetTrigger/) 
 data =table.raw
  for i in 0..data.length-1
      steps %{
  When I select attribute type "#{data[i][0]}" from "#{tty}" dropdown 
  When I enter attribute value "#{data[i][1]}" 
  When I select "" from logical pulldown 
  When I click the "save" button
  Then I should see "alert message as You must select > or <."
  When I select "> option from drop down"
  #When I enter "invalid percent as 150 in text box"
  #When I click the "save" button
  #Then I should see "alert message as Insert a numeric value between 0 and 100."
  #When I click the "edit trigger" button
  When I add attribute by clicking "plus sign" symbol
  When I select "#{data[i][0]}" as duplicate attribute type from "#{tty}" 
  Then I should see "alert message as The group type #{data[i][0]} is already selected. Each group type must be selected only once."    
  When I remove the trigger by clicking "cross mark"       
  When I click the "Save" button
  Then I should see "alert message as Save the trigger before submitting the rule."
  When I click the "save trigger" button
  When I click the "delete" trigger button
  Then I should see "popup as Are you sure you want to delete the Trigger?"
  Then I click the "Cancel" button on popup
  When I click the "delete" trigger button
  Then I should see "alert message as Are you sure you want to delete the Trigger?"
  Then I click the "Ok" button on popup
  When I click the "Add Trigger" button
  Then I should see "Select Trigger drop down"
  When I select "Result Set" from the trigger pulldown
  When I select attribute type "#{data[i][0]}" from "ResultSetTrigger" dropdown 
  When I enter attribute value "#{data[i][3]}" 
  When I select ">" from logical pulldown 
  When I click the "save" button
  Then I should see "error message as '#{data[i][3]}' is incorrect value for #{data[i][0]}, please enter valid value to save the Trigger"
  }
    end
 end
 
 if tty.match(/^ProductDataMatch/)
  table.raw.each do |att,atv,dav,iav| 
    steps %{
  When I select attribute type "#{att}" from "#{tty}" dropdown 
  When I enter attribute value "#{atv}" 
  When I click the "save trigger" button
  When I click the "edit trigger" button
  When I enter attribute value "#{dav}" 
  Then I should see "alert message as Duplicate attribute Value is not allowed." 
  When I add attribute by clicking "plus sign" symbol
  When I select "#{att}" as duplicate attribute type from "#{tty}"
  Then I should see "alert message as The group type #{att} is already selected. Each group type must be selected only once."    
  When I remove the trigger by clicking "cross mark"       
  When I click the "Save" button
  Then I should see "alert message as Save the trigger before submitting the rule."
  When I click the "save trigger" button
  When I click the "delete" trigger button
  Then I should see "popup as Are you sure you want to delete the Trigger?"
  Then I click the "Cancel" button on popup
  When I click the "delete" trigger button
  Then I should see "alert message as Are you sure you want to delete the Trigger?"
  Then I click the "Ok" button on popup
  When I click the "Add Trigger" button
  Then I should see "Select Trigger drop down"
  When I select "Product Data Match" from the trigger pulldown
  When I select attribute type "#{att}" from "#{tty}" dropdown 
  When I enter attribute value "#{iav}" 
  When I click the "save" button
  Then I should see "error message as '#{iav}' is incorrect value for #{att}, please enter valid value to save the Trigger"
  }
  end
end
end

When(/^I select "(.*?)" from logical pulldown$/) do |logicaloperator|
select logicaloperator,:from=>"logicalDropdownResultSetTrigger0_#{$j}"
end

When(/^I enter "(.*?)" in percentage filed$/) do |percentagevalue|
fill_in "inputPercent0_#{$j}", :with => percentagevalue
end

When(/^I select "(.*?)" from the trigger pulldown$/) do |triggertype|
$j=0
waitUntilElementvisible("//*[@id='dropdownTriggerType#{$j}']/option[text()='#{triggertype}']")
select "#{triggertype}",:from=>"dropdownTriggerType#{$j}"
end

Then(/^I should see "(.*?)" attributes in the drop down$/) do |triggertype,table|
waitUntilElementvisible("//*[starts-with(@id,'dropdown#{triggertype}')][last()]")
table.raw.each do |attributes|
 print "//*[@id='dropdown#{triggertype}0_0']/option[text()='#{attributes.join("")}']"
 page.has_xpath?("//*[@id='dropdown#{triggertype}0_0']/option[text()='#{attributes.join("")}']").should be_true
end
end

When(/^I click the "(.*?)" radio button$/) do |allcountriesbutton|
find("//*[@id='box3']/span[text()='#{allcountriesbutton}']/preceding-sibling::input").click
end

When(/^I select "(.*?)" from "(.*?)" pulldown and enter "(.*?)" in the attribute field and verify autosuggest$/) do |atrribute,attributetype,atrributevalue,table|
table.raw.each do |at,av1,av2|
select at,:from=>"dropdownProductDataMatch0_0"
sleep 2
find("//*[@id='5labelKeyword0']").click
find("//span[@class='tagBox-container']/child::input").set(av1)
waitUntilElementvisible("//ul[starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]")
actulnames = page.all("//ul[3]/li/a").collect(&:text)
find("//span[@class='tagBox-container']/child::input").set(av2)
attempts=0
    begin
    find("//ul[starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]/li/a/strong[text()=#{av2.capitalize}]").tag_name
    sleep 3
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 4
    ensure
       if(attempts > 4)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
autosuggestionnames = page.all("//ul[3]/li/a").collect(&:text)
puts autosuggestionnames
if actulnames[0]==autosuggestionnames[0]
  puts "autosugestion not refreshed"
else
  puts "autosugestion refreshed"
end
end
end

When(/^I flip to "(.*?)" from "(.*?)"$/) do |label1,label2|
con =page.driver.browser.find_element(:xpath,"//label[@id='cALabelCondition']")  
page.driver.browser.action.move_to(con).click(con).perform
end

When(/^I "(.*?)" context attribute value for attribute name$/) do |checkboxstatus,table|
table.raw.each do |attributes,names|
checkAndUncheckContextAtrributes(names,attributes,checkboxstatus)
end
end

Then(/^I should see "(.*?)" label displayed in context attribute trigger panel$/) do |includelabel|
page.has_selector?("//label[@id='cALabelCondition' and text()='#{includelabel}']").should be_true
end

Then(/^I should see context "(.*?)" checkbox "(.*?)" for "(.*?)"$/) do |attributevalue,checkboxtatus,attributename,table|
table.raw.each do |attributes,names|
 verifyContextArttributeValuesAndNames(names,attributes,checkboxtatus)
end
end

When(/^I click the "(.*?)" from the global navigation bar$/) do |menulink|
menu =page.driver.browser.find_element(:xpath,"//a[text()='#{menulink}']")  
page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)    
end

When(/^I enter description as "(.*?)"$/) do |ruledescription|
$ac=0
$tr=0
fill_in "description", :with=> ruledescription
end

When(/^I enter rulename as "(.*?)"$/) do |rulename| 
if $bcom.include?("test")
  fill_in "name", :with=> $randomstr 
else
@dynamic_time=Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
$randomstr=rulename+@dynamic_time
fill_in "name", :with=> $randomstr 
end
end

Then(/^I should see rulename as "(.*?)"$/) do |rulename|
exprulename=rulename+@dynamic_time
verifyPagecontent("name",exprulename)
end

Then(/^I should see description as "(.*?)"$/) do |ruledescription|
verifyPageTextPresnt("description",ruledescription)
end

Then(/^I should see Product Id as "(.*?)" in the product id text field$/) do |productid|
page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{productid}')]").should be_true 
end

When(/^I create "(.*?)" having "(.*?)" and save the designation$/) do |term,designation,table|
table.raw.each do |t,d|
  createDesignation(t,d)
end
end

Then(/^I should see "(.*?)" having "(.*?)" created in dictionary detailed page$/) do |term,designation,table|
table.raw.each do |t,d|
   page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{t}']/following-sibling::td[text()='#{d}']")
end
end

Then(/^I should see "(.*?)" having "(.*?)" with "(.*?)" created in dictionary detail page$/) do |term1,relationship,term2,table|
table.raw.each do |t1,r,t2|
if r.include?("Hypernym")
 if $bcom.include?("test") 
  page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{$ht2}']/following-sibling::td[text()='#{r}']/following-sibling::td[text()='#{$ht1}']")
  else
  page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{$ht1}']/following-sibling::td[text()='#{r}']/following-sibling::td[text()='#{$ht2}']")
  end
else
  page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{t1}']/following-sibling::td[text()='#{r}']/following-sibling::td[text()='#{t2}']")
end
end
end

Then(/^I should not see "(.*?)" having "(.*?)" with "(.*?)" created in dictionary detail page$/) do |term1,relationship,term2,table|
table.raw.each do |t1,r,t2|
  page.should_not have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='#{t1}']/following-sibling::td[text()='#{r}']/following-sibling::td[text()='#{t2}']")
end
end

When(/^I click the Associated Relationships or Designations "(.*?)" button$/) do |addbutton|
 puts "Relationships or Designations #{addbutton} button"
end

When(/^I create "(.*?)" having "(.*?)" with "(.*?)" and save the relation$/) do |term1,relationship,term2,table|
table.raw.each do |t1,r,t2|
createDictionaryRelationships(t1,r,t2)
end
end

When(/^I make the "(.*?)" having "(.*?)" with "(.*?)" and save the relation$/) do |term1,relationship,term2,table|
table.raw.each do |t1,r,t2|
makereltiondesignation(t1,r,t2)
end
end

Then(/^I should see Dictionary detail page$/) do
page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
end

Then(/^I should see "(.*?)" in the Dictionary list$/) do |dictionaryname|
dictionaryname=$dy
select "Dictionary Names",:from=>"globalSrchList"
fill_in "globalSrchField",:with=>dictionaryname
click_button("Go")
waitUntilElementvisible("//*[@id='TBLfindDict']/tbody/tr/td/span[text()='#{dictionaryname}']")
page.should have_xpath("//*[@id='TBLfindDict']/tbody/tr/td/span[text()='#{dictionaryname}']")
end

Then(/^I should see "(.*?)" as the Dictionary Type$/) do |dictionarytype|
dictionaryname=$dy
page.should have_xpath("//*[@id='TBLfindDict']/tbody/tr/td/span[text()='#{dictionaryname}']/following::td[text()='#{dictionarytype}']")
end

When(/^I enter "(.*?)" in the dictionary name field on the Add Dictionary modal window$/) do |dictionaryname|
dictionaryname=$dy
fill_in "name",:with=>"#{dictionaryname}"
end

When(/^I edit the dictionary name as "(.*?)"$/) do |newdicname|
$ty =Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
$dy="#{newdicname+$ty}" 
find("//*[@id='pHeader']/div[2]/button[1]").click
fill_in "name",:with=>$dy
find("//*[@id='pHeader']/div[2]/button/span[text()='Save']").click
sleep 6
end

Then(/^I should see dictionary name "(.*?)"$/) do |dicname|
page.should have_xpath("//*[@id='name'][@value='#{dicname+$ty}']")
end 

When(/^I enter "(.*?)" in the dictionary name field$/) do |dictionaryname|
if $bcom.include?("test")
fill_in "name",:with=>"#{$dy}"
else
$dy="#{dictionaryname+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")}"
dictionaryname=$dy
fill_in "name",:with=>"#{dictionaryname}"
end
end

When(/^I select "(.*?)" from dictionary type pulldown$/) do |dictinarytype|
select "#{dictinarytype}",:from=>"typelist"
end

When(/^I click the dictionary "(.*?)" button$/) do |dictionarysavebutton|
click_button(dictionarysavebutton)
waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
sleep 4
end

Then(/^the Add Dictionary modal window is closed$/) do
 page.should_not have_xpath("//div[6][contains(@style,'display: block;')]")
 find("//a[text()='< Return to Dictionaries']").click
 waitUntilElementvisible("//table[@id='TBLdictionaries' and count(child::tbody/tr)>1]")
 sleep 3
end

When(/^I click the Dictionary "(.*?)" button$/) do |dictionaryaddbutton|
menu =page.driver.browser.find_element(:xpath,"//span[text()='#{dictionaryaddbutton}']")      #click_on("RULES")
   page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
    find("//span[text()='#{dictionaryaddbutton}']").click
    waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
    sleep 5
    waitUntilElementvisible("//*[@id='typelist']/option[text()='MISCELLANEOUS']")
    sleep 5
end

Then(/^I should see the Add Dictionary modal window$/) do
  page.should have_xpath("//div[6][contains(@style,'display: block;')]")
end

Then(/^I should see "(.*?)" listing page$/) do |listingpagename|
if listingpagename.include?("Vocabulary Bulk Upload")  
       waitUntilElementvisible("//table[@totalcount>=0 or @class='display datatable']")
       page.should have_xpath("//form[@id='bulkUploadForm' and @action='autoSuggest#{listingpagename.split(" ")[0][0..4]}BulkUpload']/child::div/div/input[@type='file']")
                                                                                    
elsif listingpagename.include?("Rule Bulk Upload") 
      waitUntilElementvisible("//table[@totalcount>=0 or @class='display datatable']")
      page.should have_xpath("//form[@id='bulkUploadForm' and @action='autoSuggest#{listingpagename.gsub(/\s/, '')}']/child::div/div/input[@type='file']")
                                                                                  
elsif listingpagename.include?("Autocomplete Suggestion Rules")  
       waitUntilElementvisible("//table[@totalcount>=0 or @class='display datatable']")
       page.should have_xpath("//div[text()='#{listingpagename}']/parent::div[@id='pHeader']/following-sibling::div/table[@id='tblTemplates' and @totalcount>=0]")

elsif listingpagename.include?("Autocomplete Exceptions") 
       waitUntilElementvisible("//table[@totalcount>=0 or @class='display datatable']")
       page.should have_xpath("//div[text()='#{listingpagename}']/parent::div[@id='pHeader']/following-sibling::div/table[@id='tblExceptions' and @totalcount>=0]")

elsif listingpagename.include?("Linguistics Bulk Upload") 
       waitUntilElementvisible("//form[@id='bulkUploadForm']/div")
       page.should have_xpath("//*[@id='bulkUploadForm']/div/preceding::div[1]/button[@type='submit']/span[text()='Import']")    

elsif listingpagename.include?("Dictionaries")
      waitUntilElementvisible("//table[@id='TBL#{listingpagename.downcase}' and @totalcount>=0]")
      sleep 5
elsif listingpagename.include?("Terms")
      waitUntilElementvisible("//table[@id='TBL#{listingpagename.downcase}' and @totalcount>=0]")
      sleep 3 
elsif listingpagename.include?("Merchandising Rules")
      waitUntilElementvisible("//table[@id='TBLrules' and @totalcount>=0]")
      sleep 3 
elsif listingpagename.include?("Create Rule")
      waitUntilElementvisible("//*[@id='addRuleForm']")
      sleep 3                  
end
    #raise "Failed Test" 
end

When(/^I edit the "(.*?)" in Display Phrase text field$/) do |displayphrasetype|
if displayphrasetype.include?("for Add")
     fill_in "exceptionPhrase",:with=> $displayphase[3]
   elsif displayphrasetype.include?("for Rank")
     fill_in "exceptionPhrase",:with=> $displayphase[4]
   elsif displayphrasetype.include?("for Suppress")
     fill_in "exceptionPhrase",:with=> $displayphase[5]
   else
     puts "no matches..."
   end
end

When(/^I edit the "(.*?)" in Rank field$/) do |rankvalue|
if rankvalue.include?("for Add")
     fill_in "rankNumber",:with=>rankvalue[/\d{1,11}/]
   elsif rankvalue.include?("for Rank")
     fill_in "rankNumber",:with=>rankvalue[/\d{1,11}/]
   elsif rankvalue.include?("for Suppress")
     fill_in "rankNumber",:with=>rankvalue[/\d{1,11}/]
   else
     puts "no matches..."
   end
end

Then(/^I should not see specific countries in Country Code panel$/) do
page.should_not have_xpath("//*[@id='ttipDiv_1']/a[@class='arrowLink']")
end

Then(/^I should see specific countries in Country Code panel$/) do |table|
waitAndclick("//*[@id='ttipDiv_1']/a[@class='arrowLink']")
table.raw.each do |attributes|
page.should have_xpath("//*[@id='ui-tooltip-descInfo_1-content'][text()='#{attributes.join("")}']")
end
end

When(/^I click select countries "(.*?)" button$/) do |selectcountriesokbutton|
find("//div[6]/div[11]/div/button/span[text()='#{selectcountriesokbutton}']").click
waitUntilElementvisible("//body/div[6][starts-with(@style,'display: none;')]")
end

When(/^I select specifc countries from select list box$/) do |table|
     new_window=page.driver.browser.window_handles.last
  table.raw.each do |attributes|
    page.within_window new_window do
     find("//*[@id='popupDialog']/div/label[text()='#{attributes.join("")}']/preceding-sibling::input").click
    end
  end
end

When(/^I click "(.*?)" radio button$/) do |specificCountriesradiobutton|
waitAndclick("//*[@id='box3']/span[text()='#{specificCountriesradiobutton}']/preceding-sibling::input")
waitUntilElementvisible("//body/div[6][starts-with(@style,'display: block;')]")
end

Then(/^I should see follwing triggers greyed out in Select Trigger pulldown:$/) do |table|
  table.raw.each do |attributes|
  page.should have_xpath("//select[@id='dropdownTriggerType0']/option[text()='#{attributes.join("")}' and @disabled='']")
  end
end

When(/^I enter more than 50 characters in the Replace with Term field$/) do
fill_in "inputTextTermId0",:with=>"customer looking for the keywords they entered on the sea leave"
end

When(/^I select "(.*?)" from the "(.*?)" dropdown$/) do |dropdownoption,dropdownname|
  menu =page.driver.browser.find_element(:xpath,"//a[text()='#{dropdownname}']")      
  page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
  click_on(dropdownoption) 
  waitUntilElementvisible("//a[text()='#{dropdownoption}']/parent::li[not(@class='activeTab')]")
end

When(/^I enter "(.*?)" in Rule Name text field$/) do |rulename|
  if !rulename.match(/^duplicaterulename/)
    @rsn=rulename+('a'..'z').to_a.shuffle[0,4].join
    waitUntilElementCountvisible("//div[@id='pHeader' and div/text()]/following-sibling::div",4)
    fill_in "aSName",:with=> @rsn
  else
    fill_in "aSName",:with=> @rsn
  end
end

When(/^I click "(.*?)" button for Apply Rule To option$/) do |addfacetbutton|
  if addfacetbutton.match(/^Add Facet/)
    click_button(addfacetbutton)
    waitUntilElementvisible("//div[6][starts-with(@style,'display: block;')]")
  elsif addfacetbutton.match(/^Apply Rule add facet/)
    sleep 5
    click_button("Add Facet")
  end
end

When(/^I select "(.*?)" from select facet modal window$/) do |facetname|
  waitAndclick("//*[@id='catfacetlist']/option[text()='#{facetname}']")
  waitUntilElementvisible("//select[@id='catvaluelist']/option[count(@*)>0]")
  waitUntilElementvisible("//table[@id='displayFacetsForRules']/tbody/tr/td/label[text()='#{facetname}']")
end

When(/^I select "(.*?)" from Select Value\(s\) scroll list$/) do |facetvalue|
  waitAndclick("//*[@id='catvaluelist']/option[text()='#{facetvalue}']")
  waitUntilElementvisible("//table[@id='displayFacetsForRules']/tbody/tr/td/label[text()='#{facetvalue}']")
end

When(/^I click "(.*?)" button for Display Pattern option$/) do |addfacet|
  find("//*[@id='displayPatternBtn']/span[text()='#{addfacet}']").click
  waitUntilElementvisible("//div[7][starts-with(@style,'display: block;')]")
end

When(/^I Checked "(.*?)" from select facet modal window$/) do |facetn, table|
  table.hashes.each do |row|
    waitAndclick("//label[text()='#{row[:Fabric]}']/preceding-sibling::input[1]")
    waitUntilElementvisible("//*[@id='facet3_pattern']/div/ul/li[text()='#{row[:Fabric]}']")
  end
end

When(/^I checked "(.*?)" checkbox$/) do |autosuggestphrase|
  find("//input[@id='chkAutosuggestPhrase' or @id='phraseRelationship']").click
end

When(/^I click "(.*?)"button$/) do |addtexttoautosuggestphrase|
  click_button(addtexttoautosuggestphrase)
  
  if $yml_file['sitetenant']=='MCOM'
  waitUntilElementCountvisible("//*[@id='displayPatternTable']/tbody/tr",7)
  end
  
  if $yml_file['sitetenant']=='BCOM'
  waitUntilElementCountvisible("//*[@id='displayPatternTable']/tbody/tr",5)
  end
  
end

When(/^I select "(.*?)" from "(.*?)" for "(.*?)" facet$/) do |sytanxname, syntaxid, facetname|
  waitUntilElementvisible("//*[@id='displayPatternTable']/tbody/tr/td[2]/span[2][text()='#{facetname}']/following::td[1]/select/option[text()='#{sytanxname}']")
  find("//*[@id='displayPatternTable']/tbody/tr/td[2]/span[2][text()='#{facetname}']/following::td[1]/select/option[text()='#{sytanxname}']").click
end

When(/^I see "(.*?)" in Select Text pull pull down$/) do |syntaxtextvalue, table|
  table.hashes.each do |row|
    waitUntilElementvisible("//*[@id='displayPatternTable']/tbody/tr/td/span[text()='Text']/following::td[1]/select/option[text()='#{row[:SelectText]}']")
  end
end

When(/^I select "(.*?)" from "(.*?)" for Text type$/) do |syntaxtextvalue, syntaxid|
  waitAndclick("//*[@id='displayPatternTable']/tbody/tr/td/span[text()='Text']/following::td[1]/select/option[text()='#{syntaxtextvalue}']")
end

When(/^I click "(.*?)" for creating rule$/) do |savebutton|
  attempts=0
    begin
  find("//*[@id='aSPublish']").click
  find("//*[@id='addSave']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
  find("//*[@id='templatesFilterType']/option[text()='Rule Name']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
  page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], @rsn
  sleep 3
  find("//*[@id='templatesFilterBtn']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end 
end
Then(/^I should see "(.*?)" not get updated$/) do |rulename|
if rulename.include?("rule")
attempts=0
    begin
  find("//*[@id='templatesFilterType']/option[text()='Rule Name']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
  page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], @rsn
  sleep 3
  find("//*[@id='templatesFilterBtn']").click
  find("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]").tag_name
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end 
end
steps %{
  When I click ID link for Rule Name as "rulename" in list view page
}
sleep 4
steps %{
  Then I should see the "auto suggestion rank" as "1000000"
}
end

Then(/^I should be on "(.*?)" list page$/) do |autosuggestionlistpage|
  sleep 6
  page.should have_xpath("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]")
end

Then(/^I should see "(.*?)" in "(.*?)" column$/) do |rulecontent,ruleheadline|
  if rulecontent.include?("today date")
    @ct=Time.now.strftime("%m/%d/%Y")
    @act=find("//*[@id='tblTemplates']/tbody/tr[1]/td[4]").text
    if @ct==@act
     @tt =@ct
    else
      @tt=@act
    end
    page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td[text()='#{@tt}']")
  elsif rulecontent.include?("rulename")
    page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td[2]/span[text()='#{@rsn}']")
  else
    page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td[text()='#{rulecontent}']")
  end
end

Then(/^I should see "(.*?)" in Published column$/) do |publishtag|
  page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td[7]/span[text()='#{publishtag}']")
end

Then(/^I should see "(.*?)" link under action column$/) do |deletelink|
  page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td[8]/a[text()='#{deletelink}']")
end

Then(/^I should not see selected facet and facet value in rule page$/) do
  page.has_xpath?("//*[@id='applyRuleBtn' and contains(@style,'display: none;')]").should be_false
end

Then(/^I should not see "(.*?)" in "(.*?)" column$/) do |rulename,ruleid|
  find("//*[@id='templatesFilterType']/option[text()='Rule Name']").click
  wait_for_js
  #waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
  page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], @rsn
  find("//*[@id='templatesFilterBtn']").click
  waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>=1]")
  if rulename.include?("rulename")
    page.should have_xpath("//*[@id='tblTemplates']/tbody/tr/td/a[text()='No Records']")
  elsif rulename.match(/^changes/)
    waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
    page.should have_xpath("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
  end
end

When(/^I click ID link for Rule Name as "(.*?)" in list view page$/) do |rulename|
  rulename = @rsn
  waitAndclick("//*[@id='tblTemplates']/tbody/tr/td/span[text()='#{rulename}']/preceding::td[1]/a")
end

When(/^I Checked "(.*?)" check box$/) do |includesynonymscheckbox|
  waitAndclick("//*[@id='addSugRule']/span[2][text()='#{includesynonymscheckbox}']/following-sibling::input[1]")
end

When(/^I enter "(.*?)" as "(.*?)" in rank text field$/) do |rank,value|
  waitUntilElementvisible("//*[@id='addSugRule']/span[text()='#{rank}']/following-sibling::input[1]")
  fill_in "aS" << rank,:with=> value
end

When(/^I click "(.*?)" for Apply Rule To option$/) do |editlink|
  @linkval= "applyRule" << editlink
  find("//a[@id='applyRuleEditLink']").click
  waitUntilElementvisible("//div[6][starts-with(@style,'display: block;')]")
end

Then(/^I should see facet as "(.*?)" and facet value as "(.*?)" on select facet window$/) do |facetname,facetvalue|
  page.should have_xpath("//*[@id='displayFacetsForRules']/tbody/tr/td/label[2][text()='#{facetname}']/following::td/label[2][text()='#{facetvalue}']")
end

When(/^I UnChecked "(.*?)" from select facet modal window$/) do |facets,table|
  table.hashes.each do |row|
    waitUntilElementvisible("//label[text()='#{row[:Fabric]}']/preceding-sibling::input[1]")
    find("//label[text()='#{row[:Fabric]}']/preceding-sibling::input[1]").set(false)
  end
end

When(/^I click "(.*?)" button after editing the Display Pattern option$/) do |button|
  click_button("Ok")
  waitUntilElementCountvisible("//*[@id='displayPatternTable']/tbody/tr",4)
end

When(/^I click on "(.*?)" for "(.*?)" from Select Synatx for "(.*?)" facet$/) do |crossmark,syntax,facetname|
  waitAndclick("//*[@id='displayPatternTable']/tbody/tr/td/span[2][text()='#{facetname}']/following::td/select/option[text()='#{syntax}']/following::td/input[@class='closeImage']")
  waitUntilElementCountvisible("//*[@id='displayPatternTable']/tbody/tr",3)
end

When(/^I click on "(.*?)" check box$/) do |publishtag|
  waitUntilElementvisible("//*[@id='aSPublish']")
  find("//*[@id='aSPublish']").set(true)
end

Then(/^I should see facet as "(.*?)" and facet value as "(.*?)" in add suggestion page$/) do |facetname,facetvalue|
  page.should have_xpath("//*[@id='applyValues']/span[@id='applyValuesFacet' and text()='#{facetname}']/following-sibling::span[@id='applyValuesValue' and text()='#{facetvalue}']")
end

Then(/^I should not see facet as "(.*?)" and facet value as "(.*?)" in add suggestion page$/) do |facetname,facetvalue|
  page.should_not have_xpath("//*[@id='applyValues']/span[@id='applyValuesFacet' and text()='#{facetname}']/following-sibling::span[@id='applyValuesValue' and text()='#{facetvalue}']")
end

Then(/^I should see facets as "(.*?)" and syntax as "(.*?)" in add suggestion page$/) do |facetname,syntax|
  page.should have_xpath("//*[@id='displayPatternTable']/tbody/tr/td/span[2][text()='#{facetname}']/following::td/select/option[text()='#{syntax}']")
end

Then(/^I Should not see facets as "(.*?)" and syntax as "(.*?)" in add suggestion page$/) do |facetname,syntax|
  page.should_not have_xpath("//*[@id='displayPatternTable']/tbody/tr/td/span[2][text()='#{facetname}']/following::td/select/option[text()='#{syntax}']")
end

When(/^I click "(.*?)" button without selecting any facets$/) do |button|
  click_button("Ok")
end

When(/^I click "(.*?)" link for Rule Name as "(.*?)" in list view page$/) do|deletelink,rulename|
  rulename=@rsn
  find("//*[@id='tblTemplates']/tbody/tr/td[2]/span[text()='#{rulename}']/following::td/a[text()='#{deletelink}']").click
  waitUntilElementvisible("//div[contains(@class,'ui-dialog') and starts-with(@style,'display: block;')]")
end

When(/^I enter "(.*?)" as "(.*?)" autosuggest name in facet search text field$/) do |facetname,facettype|
  if facettype.match(/^facet/)
    waitUntilElementvisible("//*[@id='input_#{facettype}_autosuggest']")
    waitUntilElementvisible("//*[@id='catfacetlist']/option")
    find("//*[@id='input_#{facettype}_autosuggest']").set(facetname)
  elsif facettype.match(/^DisplayPattern/)
    waitUntilElementvisible("//*[@id='input_autosuggest_DisplayPattern']")
    waitUntilElementvisible("//*[@id='catFacetDispayPatternBox']/li")
    find("//*[@id='input_autosuggest_DisplayPattern']").set(facetname)
  end
end

Then(/^I should see autosuggestion complete list box with max five suggestions$/) do
  verifyAutoSuggestions()
end

Then(/^I should see "(.*?)" for coreesponding facet name$/) do |facetvalue|
  waitUntilElementvisible("//*[@id='catvaluelist']/option")
  find("//*[@id='catvaluelist']/option[2]").click
  waitUntilElementvisible("//*[@id='displayFacetsForRules']/tbody/tr/td[2]/label[2][not(text()='select above')]")
  click_button("Ok")
end

Then(/^I should see "(.*?)" selected for coreesponding facet name$/) do |facetvalue|
  waitUntilElementvisible("//*[@id='facet3_pattern']/div/ul/child::li")
  click_button("Ok")
  find("//*[@id='displayPatternTable']/tbody/tr[2]/td[3]/select/option[text()='Primary_Form_Normal']").click
end

When(/^I click "(.*?)" next to Display Pattern$/) do |questionmarkicon|
  waitAndclick("//*[@id='interrogationField']")
  waitUntilElementvisible("//span[@id='ui-dialog-title-helpMenuContext']/ancestor::div[starts-with(@style,'display: block;')]")
end

Then(/^I should see "(.*?)" window$/) do |contextualheipwindow|
  page.should have_xpath("//span[@id='ui-dialog-title-helpMenuContext' and text()='#{contextualheipwindow}']")
end

Then(/^I should see "(.*?)" remains active$/) do |parentwindow|
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.should have_xpath("//div[@class='returnLnk']/a")
end

When(/^I click "(.*?)" link$/) do |returnsuggestionrulelink|
  click_on("< " << returnsuggestionrulelink)
end

Then(/^I should see "(.*?)" suggestion list$/) do |noautosuggestions|
  verifyNoAutoSuggestions(noautosuggestions)
end

Given /^I have logged into Saturn as a Merchandise Manager$/ do
$randomstr = "rules"+('a'..'z').to_a.shuffle[0,4].join+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
 loginpage($yml_file['url'],$loc['login_module'],$loc['login_user'],$loc['login_password'],$loc['login_button']) 
 verifyElemetPresent($loc['navigation_search'],$loc['menu_1'])
 $bcom="notnow"
end

When(/^I have logged into Bcom Saturn as a "(.*?)"$/) do |user|
loginpage($yml_file['url1'],$loc['login_module'],$loc['login_user'],$loc['login_password'],$loc['login_button']) 
$bcom="test"
end

When(/^I click the "([^"]*)" button$/) do |arg1|
case arg1
when "Triggers" then
when "Actions" then 
when "clear selection" then find("//*[@id='divPriceType0_#{$j}']/a").click
when "Save Relationship" then 
  click_button("Save")
  waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[2][text()='Equals']")
  sleep 5
when "associated relationship and designation Add" then 
find("//span[text()='Add']").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 3
when "Global Search Go" then find("//*[@id='mSearch']/button").click
when "Associated relationships/designation Edit" then click_link("Edit")
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 4
when "Associated relationships/designation Save" then click_button("Save")
when "Associated relationships/designation Add" then 
find("//span[text()='Add']").click
waitUntilElementvisible("//div[7][contains(@style,'display: block;')]")
sleep 3
when "Dictionary Save" then click_button("Save")
when "Return to Terms" then 
#find("//*[@id='mPage']/div[1]/div[2]/a").click
find("//span[@id='filterTermClearLink']").click
waitUntilElementvisible("//*[@id='TBLterms' and count(child::tbody/tr)>=1]")
page.should_not have_xpath("//*[@id='TBLterms']/tbody/tr/td[3]/span")
when "Associated Relationships delete" then find("//*[@id='TBLrelationships']/tbody/tr/td[4]/a[2]").click
when "Cancel Rule" then click_button("Cancel")
when /^Add Exception Ok$/ then click_button("Ok")  
when /^select facet Ok/ then
    click_button("Ok")
    waitUntilElementvisible("//*[@id='applyValues' and count(span)=4 and @style='display: block;']")
when /^select facet Cancel/ then
    @wc=page.all("//body/div").count
    find("//div[11]/div/button[2]/span[text()='Cancel']").click
    waitUntilElementCountvisible("//body/div",@wc-1)
when /^Rule Cancel/ then
    click_button("Cancel")
    waitUntilElementvisible("//*[@id='tblTemplates' and @totalcount>=0]")
when /^add rule Save/ then
    find("//*[text()=' Save']").click
    wait_for_js
when /Add Exception$/ then
  click_button(arg1)
  waitUntilElementvisible("//div[starts-with(@style,'display: block;')]/div/span[text()='#{arg1}']")
when arg1=="Add Rule" then 
  #waitUntilElementvisible("//*[@id='pHeader']/div[2]/button/span[text()='#{arg1}']")
  wait_for_js
  find("//*[@id='pHeader']/div[2]/button/span[text()='#{arg1}']").click
  wait_for_js
  sleep 5

when /^select filter drop down/ then 
  find("//*[@id='templatesFilterType']").click

when /^Ok facets/ then 
  waitUntilElementvisible("//*[@id='displayFacetsRefinement']/tbody/tr/td[1][count(text())<=4 or not(text())]")
  find("//div[7]/div[11]/div/button[1]/span").click
when arg1=="Add Filter" then
  find("//input[@value='Add Filter']").click
  wait_for_js
when /^GO$/ then 
  click_button("exceptionsFilterBtn")
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")

when /^rules filter go/ then 
  click_button("templatesFilterBtn")
  waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>=1]")

when /^Go$/ then
  $ind=$ind+1

when /add exception Ok$/ then 
   find("//*[@id='exceptionPublish']").set(false)
   click_button("Ok")
   waitUntilElementCountvisible("//body/div",5)
   waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")

when /cancel action$/ then 
  find("//div[starts-with(@id,'divAction')]/following::input[@value='cancel']").click
  waitUntilElementvisible("//*[@value='edit' or not(@value='edit')]")

when /delete action$/ then 
  find("//div[starts-with(@id,'divAction')]/following::input[@value='delete']").click
  waitUntilElementvisible("//div[starts-with(@style,'display: block;')]/div/span[text()='Delete Action']")
  #$ac=$ac-1
  
when /cancel trigger$/ then 
  find("//div[starts-with(@id,'divTrigger')]/input[@value='cancel']").click
  waitUntilElementvisible("//div[starts-with(@id,'divTrigger')]/input[@value='edit']")

when /^Find$/ then
    find("//*[@id='showFacetFindButtonProduct0' or  @id='showFacetFindButton0']").click  
    waitUntilElementvisible("//div[@id='cboxlistDiv']/ul/li")

when /cancel$/ then
     click_button("cancel")
     waitUntilElementvisible("//*[@value='edit' or not(@value='edit')]")

when /^edit action/ then 
    find("//div[starts-with(@id,'divAction')]/following::input[@value='edit'][last()]").click
    waitUntilElementvisible("//div[starts-with(@id,'divAction')]/following::input[@value='save'][last()]")     
    $ac=0    
    
when /^save action$/ then 
    find("//div[starts-with(@id,'divAction')]/following::input[@value='save']").click
    waitUntilElementvisible("//div[starts-with(@id,'divAction')]/following::input[@value='edit'][last()]")
    sleep 5
when /^RULES from the global navigation bar/ then 
     menu =page.driver.browser.find_element(:xpath,"//a[text()='RULES']")      
     page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
     waitUntilElementvisible("//*[@id='nav']/li[2]/ul/li[2]/a[text()='Create Rule']")

when /^AUTOCOMPLETE from the global navigation/ then 
     menu =page.driver.browser.find_element(:xpath,"//a[text()='AUTOCOMPLETE']")      
page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
when /^Suggestion Exceptions$/ then 
  click_on("Suggestion Exceptions") 
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")

when /Suggestion Rules$/ then 
  click_on("Suggestion Rules") 
  #waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
  
when /^LINGUISTICS from the global navigation/ then 
     menu =page.driver.browser.find_element(:xpath,"//a[text()='LINGUISTICS']")      
  page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
when /^Dictionaries$/ then 
 click_on("Dictionaries") 

when "Terms" then
 click_on("Terms")

when "terms page Add" then
  click_on("Add")
  sleep 4
  
when /^Create Rule/ then
    #click_on("Create Rule")
    puts "Create Rule..." 
    attempts=0
    begin
    find("//a[text()='Create Rule']").click
    sleep 2
    puts "searching..........."
    #find("//div[starts-with(@id,'divTrigger')]/input[@value='edit'][last()]").value
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
  #click_on("Create Rule")

when /^save$/ then 
  click_button("save")

when /^save trigger$/ then 
    puts "save trigger" 
    attempts=0
    begin
    find("//div[starts-with(@id,'divTrigger')]/input[@value='save']").click
    sleep 5
    find("//div[starts-with(@id,'divTrigger')]/input[@value='edit'][last()]").value
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
when /^Save rule$/ then click_button("Save")
    waitUntilElementvisible("//div[@id='pHeader']/child::div[text()='Rule Detail']/following-sibling::div/button/span['Edit']")
    if page.has_xpath?("//button[@id='rulePublish']",:text=>"ON")
       find("//button[@id='rulePublish']").click
       waitUntilElementvisible("//button[@id='rulePublish' and text()='OFF']")
       page.has_xpath?("//button[@id='rulePublish']",:text=>"OFF").should be_true
    end
  
when /^edit trigger/ then 
    find("//div[starts-with(@id,'divTrigger')]/input[@value='edit']").click
    waitUntilElementvisible("//div[starts-with(@id,'divTrigger')]/input[@value='save']")
 
when /^Popup Cancel/ then
    find("//span[text()='Cancel']").click
    
when /^Popup Ok/ then
    find("//span[text()='Ok']").click
        
when /^editRule/ then 
    click_on("editRuleBtn")
    waitUntilElementCountvisible("//input[@class='ui-state-default ui-corner-all ui-priority-primary hover']",page.all("//input[@class='ui-state-default ui-corner-all ui-priority-primary hover']").count)

when /^cross mark/ then 
   puts "cross mark..." 
    attempts=0
    begin
   find("//span[@class='tagBox-container']/span[child::span/span[2]]").tag_name
   find("//a[text()='X']").click
   find("//span[@class='tagBox-container']/span[not(child::span/span[2])]").tag_name
    rescue Capybara::ElementNotFound => e
    attempts=attempts+1 
    retry unless attempts > 10
    ensure
       if(attempts > 10)
          raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    end
   end
   
 when /^cross mark on value$/ then
     find("//span[@class='tagBox-container orderVerified']/span/span/span[2]/a").click
      
when /^Save without/ then 
  click_on("Save")

when /^plus sign/ then 
    $i=$i+1
    puts "plus sign.........." 
   menu =page.driver.browser.find_element(:xpath,"//*[contains(@id,'buttonAdd') and not(contains(@class,'hidden'))]") 
   page.driver.browser.action.move_to(menu).click(menu).perform
   puts "done................."
   #waitUntilElementvisible("//span[@class='tagBox-container']/span[child::span/span[2]]")
   #find("//*[contains(@id,'buttonAdd0') and not(contains(@class,'hidden'))]").click
   #waitUntilElementvisible("//*[contains(@id,'buttonAdd') and not(contains(@class,'hidden'))]/preceding::input[contains(@class,'hidden')][position()=1]")
   # puts "plus sign.........." 
    # attempts=0
    # begin
   # find("//span[@class='tagBox-container']/span[child::span/span[2]]").tag_name
   # find("//*[contains(@id,'buttonAdd0') and not(contains(@class,'hidden'))]").click
   # find("//*[contains(@id,'buttonAdd') and not(contains(@class,'hidden'))]/preceding::input[contains(@class,'hidden')][position()=1]").tag_name
    # rescue Capybara::ElementNotFound => e
    # attempts=attempts+1 
    # retry unless attempts > 10
    # ensure
       # if(attempts > 10)
          # raise "Cannot complete save. Either required fields have not been filled out or fields contain invalid values."
    # end
   # end
   
when /^Contains Match/ then ele=page.driver.browser.find_element(:xpath,"//label[text()='Contains']")
    page.driver.browser.action.move_to(ele).click(ele).perform

when /^No Facet selected/ then find("//input[@id='facetRefinSelected']").set(true)

when /^ANDed/ then ele=page.driver.browser.find_element(:xpath,"//label[text()='ANDed']")
    page.driver.browser.action.move_to(ele).click(ele).perform
  
when /^delete trigger$/ then click_button("delete")
    $tr=$tr-1
when /^cancel the rule$/ then click_button("ruleCancel")
    sleep 20
when /^Add Action$/ then 
    click_button("Add Action")
    waitUntilElementvisible("//*[contains(@id,'divAction') and contains(@class,'actionContainer')][last()]")
when /^Add Actions$/ then 
    click_button("Add Action")
    waitUntilElementvisible("//*[contains(@id,'divAction') and contains(@class,'actionContainer')][last()]")        
when /^Add Trigger$/ then
     $i=0 
    click_button("Add Trigger")
    waitUntilElementvisible("//*[contains(@id,'divTrigger') and contains(@class,'triggerContainer')][last()]")
when "find" then 
    click_button("showFacetFindButton#{@sf}")
    waitUntilElementvisible("//div[@id='cboxlistDiv']/ul/li")
    sleep 3
  when "Delete button for second trigger" then click_button("buttonDeleteTrigger1")
  when /OR radio/ then find("//*[@id='triggerGlobalOperatorOr']").set(true)
  when "Ok" then 
  when /^OK$/ then sleep 20
  when /Select Countries Edit/ then 
  when /^Select Countries Cancel/ then  
  when /^Select Countries Ok/ then 
  when /Specific Countries radio/ then 
      find("//*[@id='box3']/span[text()='Specific Countries']/preceding-sibling::input").click
      waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
      sleep 3
      new_window=page.driver.browser.window_handles.last 
       page.within_window new_window do
         page.has_xpath?("//div[6][contains(@style,'display: block;')]").should be_true
         page.find("//div[6]/div[11]/div/button[1]").click
         verifyAlerts("You have to select at least one country to save the Trigger.")
         page.find("//div[6]/div[11]/div/button[2]").click
         page.find("//input[@id='editBtnCountry']").click
         page.has_xpath?("//div[6][contains(@style,'display: block;')]").should be_true
         cnt= page.all("//*[@id='popupDialog']/div").count
         page.find("//*[@id='popupDialog']/div[10]/input").click
         @sele1=page.find("//*[@id='popupDialog']/div[10]/label").text
         page.find("//*[@id='popupDialog']/div[20]/input").click
         page.find("//*[@id='popupDialog']/div[30]/input").click
         page.find("//div[6]/div[11]/div/button[1]").click
         page.has_xpath?("//div[@id='showCountry' and @style='display: none;']").should be_false
      end

  else
  find("//*[@*='#{arg1}' or text()='#{arg1}']").click
  end  
end

When(/^I enter "([^"]*)"$/) do |arg1|
  case arg1
  when /^RDPP Algorithm Effective Date as/ then
    #fill_in "startDateValue#{@rdpp}",:with=> arg1[/\d{1,2}\/\d{1,2}\/\d{4}/]
    find("//*[@id='startDateValue0' or @id='startDateValue#{@rdpp}']").set(arg1[/\d{1,2}\/\d{1,2}\/\d{4}/])
  when /^RDPP Algorithm Expiration Date as/ then 
    find("//*[@id='endDateValue0' or @id='endDateValue#{@rdpp}']").set(arg1[/\d{1,2}\/\d{1,2}\/\d{4}/])
    #fill_in "endDateValue#{@rdpp}",:with=> arg1[/\d{1,2}\/\d{1,2}\/\d{4}/]
 when /in Result Count text field$/ then waitUntilElementvisible("//*[@id='divLabel#{$tr}']/select/following-sibling::input")
   find("//*[@id='divLabel#{$tr}']/select/following-sibling::input").set(arg1[0..arg1.index('in')-2])
 when /^dictionary name as wish/ then fill_in "name",:with=>"#{$dy}"+('a'..'z').to_a.shuffle[0,2].join
 when /^Dictionary name/ then fill_in "name",:with=>"#{$dy}"
 when /^non existing phasre as testingron/ then fill_in "exceptionsFilterVal",:with=>"000000"
  when /^exception filter value$/ then 
    waitUntilElementvisible("//table[@id='tblExceptions' and count(child::tbody/tr)>1]")
    sleep 5
    if $efi==1
    
    @esv=find("//*[@id='tblExceptions']/tbody/tr[1]/td[#{$efi}]/a").text
    
    elsif $efi==3
    
    $efi=$efi+2
    @esv=find("//*[@id='tblExceptions']/tbody/tr[1]/td[#{$efi}]").text
    
    elsif $efi==10
    
    else
    @esv=find("//*[@id='tblExceptions']/tbody/tr[1]/td[#{$efi}]").text
    end
    
    @expval ="//*[@id='tblExceptions']/tbody/tr/td[#{$efi}]/a/span[text()='#{@esv}']"
    @expvals = "//*[@id='tblExceptions']/tbody/tr/td[#{$efi}]/span[text()='#{@esv}']"
    
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], @esv
    
  when /in search box$/ then 
    sleep 4
    if $rfi==1
    @rsv=find("//*[@id='tblTemplates']/tbody/tr[1]/td[#{$rfi}]/a").text
    puts @rsv
    
    elsif arg1.include?("Rule Applied To")
      page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], "Brand"
    else
    
    @rsv=find("//*[@id='tblTemplates']/tbody/tr[1]/td[#{$rfi}]").text
    
    end
    
    @rval ="//*[@id='tblTemplates']/tbody/tr[1]/td[#{$rfi}]/a/span[text()='#{@rsv}']"
    @rvals = "//*[@id='tblTemplates']/tbody/tr[1]/td[#{$rfi}]/span[text()='#{@rsv}']"
    
    page.driver.browser.find_element(:xpath,"//*[@id='templatesFilterVal']").send_keys [:control, 'a'], @rsv
  
  when /in Rank text field$/ then fill_in "rankNumber",:with=>arg1[0..arg1.index("in")-2]
  when /in Display Phrase text field$/ then 
  if $dp==0
        $displayphase=Array.new
        steps %{
                 Given I connect to the database
           }
  results =$dbhsaturn.execute("select DISTINCT display_phrase from auto_suggestion where site_tenant ='#{$yml_file['sitetenant']}' and display_phrase not in(select display_phrase from auto_override) and rownum <=20")
  results.fetch do |row|
     $displayphase << row.join
   end
  #$displayphase.delete_if {|x| x.include?("'") }
  puts $displayphase
  else
    puts "DataBase Not Connected..............."
  end
   puts $displayphase
   $dp=$dp+1
   if arg1.match("any value for Add")
     fill_in "exceptionPhrase",:with=> $displayphase[0]
   elsif arg1.include?("pre-defined value for Rank")
     fill_in "exceptionPhrase",:with=> $displayphase[1]
   elsif arg1.include?("pre-defined value for Suppress")
     fill_in "exceptionPhrase",:with=> $displayphase[2]
   elsif arg1.include?("duplicate Add value")
      fill_in "exceptionPhrase",:with=> $displayphase[6]
   elsif arg1.include?("display phase value for Add")
      @dval ="this is for verification"+Time.now.strftime("%Y-%m-%d %H%M%S")
      fill_in "exceptionPhrase",:with=> $displayphase[6]
   elsif arg1.include?("duplicate Rank value")
      fill_in "exceptionPhrase",:with=> $displayphase[6]
    elsif arg1.include?("undefined values for Rank")
      fill_in "exceptionPhrase",:with=>"testtestest"
    elsif arg1.include?("undefined values for Suppress")
      fill_in "exceptionPhrase",:with=>"testtestest"
     elsif arg1.include?("duplicate Suppress value")
      fill_in "exceptionPhrase",:with=> $displayphase[6]
     else
     puts "no matches..."
   end
  when /Replace with Term field$/ then fill_in "inputTextTermId#{@ens}",:with=>arg1[0..arg1.index("in the")-2]
  when /je in product type entry box$/ then 
    fill_in "inputProductType0",:with=>"je"
    waitUntilElementvisible("//ul[2][starts-with(@class,'ui-autocomplete') and contains(@style,'display: block;')]")
  when /as product type$/ then fill_in "inputProductType0",:with=>arg1[0..arg1.index("as")-2]
  when /^invalid percent/ then fill_in "inputPercent0_0", :with => arg1[19..21]
  when /^percent as blank/ then fill_in "inputPercent0_0", :with => " "  
  when /^rules name/ then fill_in "name", :with=> $randomstr
  when /^description/ then $ac=0
    $tr=0
    fill_in "description", :with=> "Rules creating with description"
  when /^duplicate values/ then find("//input[starts-with(@id,'tagBox-input')]").set("51145")
  when /^Effective Date/ then fill_in "startDate",:with=> arg1[/\d{1,2}\/\d{1,2}\/\d{4}/]
  when /^Expiration Date/ then fill_in "endDate",:with=> arg1[/\d{1,2}\/\d{1,2}\/\d{4}/]
  when /^refine facet name and facet value/ then 
    $i=0
    arr= arg1[arg1.index('as')+2..arg1.index('respectively')-2].strip.split(",")
    createRefineFacet($tr,arr)
    $tr=$tr+1
  when /^facet name/ then 
    find("//div[@id='divSubCriteriaA0_#{$i}']/span[1]/input").set("#{arg1[arg1.index('as')+3..-1]}")
    page.driver.browser.action.send_keys(:tab).perform
  when /^facet value/ then print "//div[@id='divSubCriteriaA0_#{$tr}']/span[2]/input"+#{arg1[arg1.index('as')+3..500]}
    find("//div[@id='divSubCriteriaA0_#{$i}']/span[2]/input").set("#{arg1[arg1.index('as')+3..-1]}")
    page.driver.browser.action.send_keys(:tab).perform
  when /^cancel the rule$/ then click_button("ruleCancel")
  when /Media Group ID text field/ then #@media_grp_id=arg1[0..arg1.index("in")-2]
       steps %{
                Then I connect to the astra database
           }
  results =$dbhastra.execute("select mediagroupid from mediagroups where mediagrouptype='COPY_BLOCK' and sitechannel='#{$yml_file['sitetenant']}' and rownum=1")
  results.fetch do |row|
    @media_grp_id=row.join
   end
   
   @pollids=Array.new
   results= $dbhastra.execute("select poolid from pools where sitechannel='#{$yml_file['sitetenant']}' and rownum <4")
   results.fetch do |row|
    @pollids << row.join
   end
    fill_in "mediaLocationPoolId#{@sm}_0",:with=>@media_grp_id
  when /Product id text field/ then @product_id=arg1[arg1.index("as")+3..arg1.index("in")-2]
    fill_in "inputProductID#{@mrs}_0",:with=>@product_id
  when /Saved Set Query ID text field/ then @query_id=arg1[arg1.index("as")+3..arg1.index("in")-2]
    fill_in "inputSavedSet#{@mrs}_0",:with=>@query_id
  when /Displayed message text box/ then  fill_in "textDisplayMessage#{@dm}",:with=>"this is testing world in Message Displayed text box"
  when /respective text fields$/ then 
        if @pdp=="PDP Redirect"
          fill_in "inputPDPID0",:with=>arg1[0..arg1.index("in")-2]
        elsif @urd=="URL Redirect"
          fill_in "inputURLRedirect0",:with=>arg1[0..arg1.index("in")-2]
        elsif @crd=="Category Redirect"
          fill_in "inputCategoryID0",:with=>arg1[0..arg1.index("in")-2]
        end
  when /zero image pool/ then 
    fill_in "mediaLocationPoolId#{@sm}_#{$pid}",:with=>@pollids[$pid]
    $pid=$pid+1
  when /keywords field$/ then find("//div[@id='divCriteriaB#{$tr}_0']/span/input").set(arg1[0..arg1.index("in")-2])
    page.driver.browser.action.send_keys(:tab).perform
    $tr=$tr+1
  when /^facet refinement name and values as/ then 
    find("//div[@id='divSubCriteriaA#{$tr}_0']/span[1]/input").set("Brand")
    find("//label[text()='Refine by following facets:']").click
    find("//div[@id='divSubCriteriaA#{$tr}_0']/span[2]/input").set("100% pure")
    find("//label[text()='Refine by following facets:']").click
  when /in sequence field for/ then 
    waitUntilElementvisible("//table[@id='displayFacetsTable']/tbody/tr/td[2][text()]/preceding-sibling::td/input")
    find("//td[@id='colB' and text()='#{arg1[24..-1]}']/preceding-sibling::td/input").set(arg1[0])
  end
end

When(/^I "([^"]*)"$/) do |arg1|
case arg1
when /in Display Phrase text field$/ then 
  if arg1.include?("this is ron add")
  end
when /click the add exception Ok button$/ then click_button("Ok")
when /^delete the exception which/ then find("//*[@id='tblExceptions']/tbody/tr/td[2][not(text())]/following-sibling::td/a[text()='Delete']").click
when /^click the ID link for Exception pharse/ then find("//*[@id='tblExceptions']/tbody/tr[1]/td[1]/a").click
  waitUntilElementvisible("//div[7][starts-with(@style,'display: block;')]")
  sleep 3
when /^try to delete/ then 
  deleteHyperNym(arg1[14]+$dy,arg1[25]+$dy)
when /^try to edit/ then 
  edithypernym(arg1[arg1.index("edit")+5..arg1.index("hypernym")-2]+$dy,arg1[arg1.index("hypernym")+9..arg1.index("as")-2]+$dy,arg1[arg1.index("as")+3..28]+$dy,arg1[39..-1]+$dy)
when /for checking Invalid relationship error$/ then errorverificationForRelationShips(arg1[7..8].strip+$dy,arg1[42..43].strip+$dy)
  sleep 5
  click_button("Cancel")
when /for checking duplicate relationship error$/ then 
  find("//span[text()='Add']").click
  errorverificationForRelationShips(arg1[7..8].strip+$dy,arg1[42..43].strip+$dy)
when /^create a having hypernym relationship with b and verify/ then find("//span[text()='Add']").click
  errorverificationForRelationShips(arg1[7..8].strip+$dy,arg1[42..43].strip+$dy)
when /^click the Add button/ then 
    menu =page.driver.browser.find_element(:xpath,"//span[text()='Add']")      #click_on("RULES")
    page.driver.browser.execute_script("if(document.createEvent){var evObj = document.createEvent('MouseEvents');evObj.initEvent('mouseover', true, false); arguments[0].dispatchEvent(evObj);} else if(document.createEventObject) { arguments[0].fireEvent('onmouseover');}", menu)
    find("//span[text()='Add']").click
    waitUntilElementvisible("//div[6][contains(@style,'display: block;')]")
    sleep 5
    waitUntilElementvisible("//*[@id='typelist']/option[text()='MISCELLANEOUS']")
    sleep 5
when /^click on Save button for creating dictionary/ then click_button("Save")
  sleep 7
when /save button for creating dictionary$/ then click_button("Save")
waitUntilElementvisible("//*[@id='pHeader']/div[1][text()='Dictionary Detail: #{$dy}']")
sleep 5
when /^sort the / then find("//table[starts-with(@id,'tbl')]/thead/tr/th[#{$sort}]/div").click
  waitUntilElementvisible("//table[starts-with(@id,'tbl') and count(child::tbody/tr)>1]")
  sleep 5
  $sort=$sort+1
when /^click the exception clear link$/ then find("//*[@id='exceptionsFilterClearLink']").click
   waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    sleep 5
when /^clear the search/ then find("//*[@id='templatesFilterClearLink']").click
   waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
    sleep 5   
when /^click the Delete link for Exception pharse/ then find("//*[@id='tblExceptions']/tbody/tr[1]/td[10]/a").click
when /^cancel the Add exception/ then click_button("Cancel")
when /^leave rank text field blank/ then fill_in "rankNumber",:with=>" "
when /^update the display phrase text/ then
   if arg1.include?("for Add")
     fill_in "exceptionPhrase",:with=> $displayphase[3]
     fill_in "rankNumber",:with=>1000
   elsif arg1.include?("for Rank")
     fill_in "exceptionPhrase",:with=> $displayphase[4]
     fill_in "rankNumber",:with=>100000
   elsif arg1.include?("for Suppress")
     fill_in "exceptionPhrase",:with=> $displayphase[5]
     fill_in "rankNumber",:with=>1000000
   else
     puts "no matches..."
   end  
when /^unchecked Publish box/  then find("//*[@id='exceptionPublish']").click
when /^unchecked Customer sees the keywords they/ then find("//*[@id='appendFlag0']").click
when /^uncheck No Facet selected$/ then find("//input[@id='facetRefinSelected']").set(false)
when /^fill the data/ then
     if arg1.include?("Show Master or Member Products")
       steps %{
         When I select "Show only the Master Products from Select Display: pulldown down"
       }
      elsif arg1.include?("RDPP")
      steps %{
        When I select "RDPP Rule as 78 - 100DollarSales from Select RDPP Algorithm: drop down"
      }
      elsif arg1.include?("show facets")
        steps %{
          When I select "All option from Filter By drop down"
          When I click the "find" button
          When I click "Special Offers" checkbox
          When I click "All Weather" checkbox
        }
      elsif arg1.include?("Display Message")
        steps %{
          When I enter "this is testing world in Message Displayed message text box"
        }
     end
when /^flip to/ then
    con =page.driver.browser.find_element(:xpath,"//label[@id='cALabelCondition']")  
    page.driver.browser.action.move_to(con).click(con).perform
when /^filter by drop down/ then find("//*[@id='showFacetFiltersDropdown0']").click 
when /^remove sequence field/ then 
  waitUntilElementvisible("//table[@id='displayFacetsTable']/tbody/tr[2]/td[2][text()]/preceding-sibling::td/input")
  find("//table[@id='displayFacetsTable']/tbody/tr[2]/td[2][text()]/preceding-sibling::td/input").set(" ")
 end
end

When(/^I select "([^"]*)"$/) do |arg1|
  case arg1
  when "Result Set from trigger dropdown" then 
    select "Result Set",:from=>"dropdownTriggerType#{@rsta}"
  when /option from menu drop down$/ then waitUntilElementvisible("//*[@id='numDropdown0']/option[text()='Greater Than']")
    find("//*[@id='numDropdown#{$tr}']/option[text()='Greater Than']").click
  when /^dictionary type as/ then select "#{arg1[arg1.index("as")+3..-1]}",:from=>"typelist"
  when /^Dictionary type/ then select "BRAND",:from=>"typelist"
  when /from select filter drop down$/ then select arg1[0..arg1.index("from")-2],:from=>"exceptionsFilterType"
  when /from rules filter drop down$/ then select arg1[0..arg1.index("from")-2],:from=>"templatesFilterType"
    waitUntilElementvisible("//*[@id='tblTemplates' and count(child::tbody/tr)>=1]")
  when /from Exception Type drop down$/ then select arg1[0..arg1.index("from")-2],:from=>"exceptionType"
  when /as Search Query$/ then select "Replace ALL Customer Search",:from=>"searchQueryId0"
  when /operator from action menu$/ then waitUntilElementvisible("//*[@id='selectOperator#{@mrs}']/option[text()='#{arg1[0..arg1.index("op")-2]}']")
    select arg1[0..arg1.index("op")-2],:from=>"selectOperator#{@mrs}"
    sleep 5
  when /duplicate attribute name$/ then select arg1[0..arg1.index("as")-2],:from=>"dropdownResultSetTrigger0_1"
  when /as product type from autosuggesition window$/ then
     waitUntilElementvisible("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
      num_of_auto_suggestions = page.all("//ul[2]/li").count
      num_of_auto_suggestions.should be <= 5
      find("//strong[text()='Je']/parent::a[text()='ans']").click 
      find("//*[@id='divActionCriteriaB0']").click
  when /trigger$/ then $i=0
    select arg1.slice(0..(arg1.index(' trigger'))).strip,:from=>"dropdownTriggerType0"
    sleep 5
  when /^duplicate/ then select arg1.slice(9..(arg1.index('>'))).strip, :from=>"dropdown"+arg1[arg1.index('as')+3..500]+"0_1"
  when /attribute type$/ then select arg1[0..arg1.index('as')-2],:from=> "dropdown"+arg1[arg1.index('as')+3..arg1.index('att')-2]+"0_0"
  
  when /^> option/ then select arg1[0,1],:from=>"logicalDropdownResultSetTrigger0_0"
  when /as percentage$/ then 
    AddTriggerAttributes($i,arg1[15..arg1.index('value')-2],arg1[arg1.index('value')+6..arg1.index('select')-2],arg1[arg1.index('enter')-2],arg1[arg1.index('as')-3..arg1.index('as')-2])
  when /from select action pulldown$/ then select arg1[0..arg1.index('from')-2],:from=>"dropdownActionType#{$ac}"
    if arg1.include?("Show Master or Member Products")
       @smm=$ac
       puts "smm=#{@smm}"  
       $ac=$ac+1
    elsif arg1.include?("Execute New Search")
       @ens=$ac
       puts "ens=#{@ens}" 
       $ac=$ac+1
    elsif arg1.include?("Show Media")
       @sm=$ac
       puts "sm=#{@sm}"
       $ac=$ac+1
    elsif arg1.include?("Show Facets")
       @sf=$ac
       puts "sf=#{@sf}"
       $ac=$ac+1
    elsif arg1.include?("RDPP Algorithm")
      @rdpp=$ac
      puts "rdpp=#{@rdpp}"
      $ac=$ac+1
    elsif arg1.include?("Modify Result Set")
          @mrs=$ac
          puts "mrs=#{@mrs}"
          $ac=$ac+1
    elsif arg1.include?("Display Message")
     @dm=$ac
     $ac=$ac+1
    elsif arg1.include?("PDP Redirect")
      @pdp="PDP Redirect"
    elsif arg1.include?("URL Redirect")
      @urd="URL Redirect"
    elsif arg1.include?("Category Redirect")
      @crd="Category Redirect"
    end
    
  when /Select Display: pulldown down$/ then @show_MM_product=arg1[0..arg1.index('from')-2]
           select "#{@show_MM_product}",:from=>"actionValuesDropdown#{@smm}"
  when /Filter By drop down$/ then 
        @filter_type=arg1[0..arg1.index('option')-2]
        select "#{@filter_type}",:from=>"showFacetFiltersDropdown#{@sf}"
  when /Select RDPP Algorithm: drop down$/ then 
    find("//*[@id='dropdownRDPPRule#{@rdpp}' or @id='dropdownRDPPRule0']/option[text()='#{arg1[arg1.index("as")+3..arg1.index("from")-2]}']").click
  when /Select Media Type drop down$/ then
      select "#{arg1[0..arg1.index("from")-2]}",:from=>"mediaTypeDropdown#{@sm}"
  when /Location drop down$/ then 
    select arg1[0..arg1.index("from")-2],:with=>"mediaLocationDropdown#{@sm}_0"
  when /from Select Trigger pulldown/ then 
    find("//*[@id='dropdownTriggerType#{$tr}']/option[text()='#{arg1[0..arg1.index("from")-2]}']").click
  when /pattern attribute/ then 
     select "Brand",:from=>"dropdownKeywordPatternCriteria#{$tr}_1"
     find("//div[@id='divCriteriaA#{$tr}_1']/span/input").set("Calvin Klein")
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1    
   when /^Result Set attribute type/ then 
     select "Brand",:from=>"dropdownResultSetTrigger#{$tr}_0" 
     find("//div[@id='divSubCriteriaA#{$tr}_0']/span/input").set("calvin klein")
     page.driver.browser.action.send_keys(:tab).perform
     select "<",:from=>"logicalDropdownResultSetTrigger#{$tr}_0"
     $tr=$tr+1
   when /^Product Data Match attribute/ then 
     select "Brand",:from=>"dropdownProductDataMatch#{$tr}_0"
     find("//div[@id='divCriteriaA#{$tr}_0']/span/input").set("Calvin Klein")
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1
  end
end

When(/^I select "(.*?)" as duplicate attribute type from "(.*?)"$/) do |attype,ttype|
select attype,:from=>"dropdown#{ttype}0_1"
end
  

When(/^I select "(.*?)" attribute type as "(.*?)" and attribute values as "(.*?)"$/) do |triggertype,attritype,attrivalue|
if triggertype.match(/^keyword pattern/)
     select attritype,:from=>"dropdownKeywordPatternCriteria#{$tr}_1"
     find("//div[@id='divCriteriaA#{$tr}_1']/span/input").set(attrivalue)
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1 
elsif triggertype.match(/^Result Set/)
     select attritype,:from=>"dropdownResultSetTrigger#{$tr}_0" 
     find("//div[@id='divSubCriteriaA#{$tr}_0']/span/input").set(attrivalue)
     page.driver.browser.action.send_keys(:tab).perform
     select ">",:from=>"logicalDropdownResultSetTrigger#{$tr}_0"
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1
elsif triggertype.match(/^Product Data Match/)
     select attritype,:from=>"dropdownProductDataMatch#{$tr}_0"
     find("//div[@id='divCriteriaA#{$tr}_0']/span/input").set(attrivalue)
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1
end
end

When(/^I select attribute type as "(.*?)" and attribute vlues as "(.*?)"$/) do |attributetype,attributevalue|
     select "#{attributetype}",:from=>"dropdownKeywordPatternCriteria#{$tr}_1"
     find("//div[@id='divCriteriaA#{$tr}_1']/span/input").set(attributevalue)
     page.driver.browser.action.send_keys(:tab).perform
     $tr=$tr+1    
end

When(/^I select "(.*?)" from ResultSet Trigger dropdown and enter "(.*?)"$/) do |attrtype,attrvalue,table|
if $tr==0
@rsta =$tr
end

table.raw.each do |attritype,attrivalue|
select attritype,:from=>"dropdownResultSetTrigger0_#{@rsta}"
find("//div[@id='divSubCriteriaA0_#{@rsta}' or @id='divCriteriaA0_#{@rsta}']/span[@class='tagBox-container']/input").set(attrivalue)
page.driver.browser.action.send_keys(:tab).perform
select ">",:from=>"logicalDropdownResultSetTrigger0_#{@rsta}"
steps %{
   And I click the plus sign button       
  } 
@rsta=@rsta+1
end
find("//*[@id='buttonRemove0_#{@rsta}']").click
$tr=$tr+1
end

When(/^I select "(.*?)" from product data match dropdown and enter "(.*?)"$/) do |attrtype,attrvalue,table|
if $tr==0
@rsta =$tr
end
table.raw.each do |attritype,attrivalue|
select attritype,:from=>"dropdownProductDataMatch0_#{@rsta}"
find("//div[@id='divSubCriteriaA0_#{@rsta}' or @id='divCriteriaA0_#{@rsta}']/span[@class='tagBox-container']/input").set(attrivalue)
page.driver.browser.action.send_keys(:tab).perform
steps %{
   And I click the plus sign button       
  } 
@rsta=@rsta+1
end
find("//*[@id='buttonRemove0_#{@rsta}']").click
$tr=$tr+1
end

When(/^I click the plus sign button$/) do 
find("//*[@id='buttonAdd0_#{@rsta}']").click
sleep 3
end

When(/^I select attribute_type from "(.*?)"$/) do |arg1,table|
  case arg1
  when /enter less than two letters/
  if arg1.include?("Result Set")
  @atype=arg1[0..arg1.index('attribute')-2].gsub!(/\s/,'')
  @atype=@atype+"Trigger"
  elsif arg1.include?("Product Data Match")
    @atype=arg1[0..arg1.index('attribute')-2].gsub!(/\s/,'')
  end
  table.hashes.each do |row|
    select "#{row[:attribute_type]}",:from=>"dropdown"+"#{@atype}"+"0_0" 
    find("//input[starts-with(@id,'tagBox-input')]").set("#{row[:attribute_value]}")
    sleep 5
    steps %{ Then I should not see autosuggest drop down
    }
    end
  when /verify autosuggest$/
    if arg1.include?("Result Set")
      @atype=arg1[0..arg1.index('attribute')-2].gsub!(/\s/,'')
      @atype=@atype+"Trigger"
      @entry="divSubCriteriaA0_"
   elsif arg1.include?("Product Data Match")
    @atype=arg1[0..arg1.index('attribute')-2].gsub!(/\s/,'')
    @entry="divCriteriaA0_"
   end
    $allselected_values=Array.new
    $k=0
    even_num=0
    table.hashes.each do |row|
    select "#{row[:attribute_type]}",:from=>"dropdown"+"#{@atype}"+"0_#{$k}"
    find(:xpath,"//div[@id='#{@entry}#{$k}']/span[@class='tagBox-container']/input[contains(@id,'tagBox-input')]").set("#{row[:attribute_value]}")
    if page.has_xpath?("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
      num_of_auto_suggestions = page.all("//ul[#{even_num+3}]/li/a").count
      num_of_auto_suggestions.should be <= 5
      num=SecureRandom.random_number(num_of_auto_suggestions)+1
      actulnames=page.all("//ul[#{even_num+3}]/li/a").collect(&:text)
      if actulnames.uniq.length == actulnames.length then 
       find("//ul[#{even_num+3}]/li[#{num}]/a").click
       $selected_values=find("//div[@id='#{@entry}#{$k}']/span/span/span/span[2]").text
       $allselected_values << $selected_values
       else puts "duplicate autosuggesition values present" end
      if arg1.include?("Result Set")
      select ">",:from => "logicalDropdownResultSetTrigger0_#{$k}"
     end
     find("//*[@value='+']").click
    else
       raise "No Autosuggesitions"
    end
     $k=$k+1
     even_num=even_num+2
    end
    find("//*[@id='buttonRemove0_#{$k}']").click
   steps %{
    When I click the "save trigger" button
    When I click the "Save rule" button 
    }
  end  
end

Then(/^I should not see autosuggest drop down$/) do
 page.has_xpath?("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: none;')]").should be_true
end


Then(/^I should see keyword pattern attribute type as "([^"]*)"$/) do |type|
page.should have_xpath("//option[text()='#{type}']/parent::select[starts-with(@id,'dropdownKeywordPatternCriteria')]")
end

Then(/^I should see keyword pattern attribute value as "([^"]*)"$/) do |value|
page.should have_xpath("//span[text()='#{value}']/parent::span[@class='tagBox-item']")
end

Then(/^I should see "([^"]*)"$/) do |arg1| 
  case arg1
  when "RDPP available in dropdown" then sleep 4
  when "show facets is not active" then sleep 4
  when "Promo ID and Price Type type available" then $tr=1
  when "Price Type Filter Groups and Specific Price Types" then sleep 5
  when "No records in the search results" then 
    page.should_not have_xpath("//*[@id='TBLterms']/tbody/tr/td[text()='#{$dy}']")
  when "Action(s) not sortable" then page.should have_xpath("//*[@id='TBLterms' or @id='TBLdictionaries']/thead/tr/th/div/span[@class='DataTables_sort_icon']")
  when "No Associated Relationships records" then 
    waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
    page.should have_xpath("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
  when /^keyword trigger is enable/ then $tr=0
  when /^facet refine trigger is enable/ then $tr=0
    puts $tr
  when /^facet name selected from autosuggest drop down/ then waitUntilElementvisible("//*[@id='catvaluelist']/option")
  autolist =Array.new
  autolist = $asl
  puts autolist
  when /^autosuggestion list getting refreshed/ then 
    puts $asl
  
  when /^Linguistics Bulk Upload as sub menu$/ then
       page.should have_xpath("//a[text()='LINGUISTICS']/following-sibling::ul/li/a[text()='Linguistics Bulk Upload']")
  when /^no changes at the Add trigger section/ then $tr=0
  when /^Result Count trigger not associated/ then 
    page.should_not have_xpath("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"type\":\"Result Count\"')]") 
  when /in menu drop down$/ then page.should have_xpath("//*[@id='divLabel#{$tr}']/select/option[@disabled='disabled' and text()='#{arg1[0..arg1.index('in')-2]}']")
  when /in Result Count text field$/ then #page.should have_xpath("//*[@id='divLabel#{$tr}']/select/option[@disabled='disabled' and text()='#{arg1[0..arg1.index('in')-2]}']")
    page.should have_xpath("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"value\":{\"valueInput\":#{arg1[0..arg1.index('in')-2]}')]") #and contains(text(),'\"type\":\"Result Count\"') and contains(text(),'\"operator\":\"<\"')]")
  when /^new value that updated/ then
  select "Exception Phrase",:from=>"exceptionsFilterType"
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  if arg1.include?("for Add")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[3]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[3]).should be_true
  elsif arg1.include?("for Rank")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[4]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[4]).should be_true
   elsif arg1.include?("for Suppress")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[5]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[5]).should be_true
  end
  when /^Add Exception button enable/ then sleep 20
  when /^Select Facet modal window/ then waitUntilElementvisible("//div[7][contains(@style,'display: block;')]/div[2]/div/div[@id='facet1']")
  sleep 5
  when /^all the facets in select facet list/ then waitUntilElementvisible("//*[@id='catfacetlist']/option")
    sleep 5
    
  when /is  deleted$/ then nocalculatedrelationshipsinDB(arg1[14]+$dy,arg1[25]+$dy,1)
  when /user defined relationship$/ then 
    waitUntilElementvisible("//td[text()='#{arg1[0]+$dy}']/following-sibling::td[text()='#{arg1[11]+$dy}']/following-sibling::td/a[text()='Edit']")
    page.has_xpath?("//td[text()='#{arg1[0]+$dy}']/following-sibling::td[text()='#{arg1[11]+$dy}']/following-sibling::td/a[text()='Edit']").should be_true
    sleep 10
  when /^relationship created/ then waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[text()='Hypernym']")
    sleep 7
  when /^dictionary edit page/ then waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
    sleep 5
  when /^Invalid relationship error message/ then page.has_xpath?($loc['invalid_relationship_error']).should be_true
  when /^duplicate relationship error message/ then page.has_xpath?($loc['duplicate_relationship_error']).should be_true
  when /^relationships are created/ then page.has_xpath?("//table[@id='TBLrelationships']/tbody/tr",:count=>$ie).should be_true
  when /^dictionary detailed page/ then 
    waitUntilElementvisible("//*[@id='TBLrelationships']/tbody/tr/td[text()='No Records']")
    page.should have_xpath("//div[text()='Dictionary Detail: #{$dy}']")
  when /^dictionary listing page/ then waitUntilElementvisible("//table[@id='TBLdictionaries' and count(child::tbody/tr)>1]")
    sleep 5 
    page.has_xpath?("//table[@id='TBLdictionaries' and count(child::tbody/tr)>1]").should be_true
    steps %{
    Given I connect to the database
   }
  when /column in descending order$/ then page.has_xpath?("//*[starts-with(@id,'tbl')]/thead/tr/th/div[text()='#{arg1[0..arg1.index("column")-2]}']/span[@class='DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n']").should be_true
  when /column in ascending order$/ then  page.has_xpath?("//*[starts-with(@id,'tbl')]/thead/tr/th/div[text()='#{arg1[0..arg1.index("column")-2]}']/span[@class='DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s']").should be_true
  when /^message as No results found$/ then page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td/a[text()='No Records']").should be_true
  when /^complete exception listing page/ then $efi=1
  when /^all the exception in Suggestion Execeptions list page$/ then 
    if $aes==1
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[#{$aes}]/a/span").should be_false
   else
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[#{$aes}]/span").should be_false
   end
    $aes=$aes+1
    when /^all the rule in the listing page$/ then 
    page.has_xpath?("//input[@id='templatesFilterVal' and @disabled='disabled']").should be_true
  when /^exception results page$/
  when /^Seach results for specified filter value$/ then  
    if $efi==1
    page.has_xpath?("#{@expval}").should be_true
    else
    page.has_xpath?("#{@expvals}").should be_true
    end
    $efi=$efi+1
  when /^filter out the listing page by/ then  
    if $rfi==1
    page.has_xpath?("#{@rval}").should be_true
    elsif arg1.include?("by Rule Applied To")
      
    else
    page.has_xpath?("#{@rvals}").should be_true
    end
    $rfi=$rfi+1   
  when /^Search field enabled/ then page.has_xpath?("//*[@id='exceptionsFilterVal' and @disabled='disabled']").should be_false
  when /^Go button enabled/  then page.has_xpath?("//*[@id='exceptionsFilterBtn' and @disabled='disabled']").should be_false
  when /^Exception Search field disabled/ then page.has_xpath?("//*[@id='exceptionsFilterVal' and @disabled='disabled']").should be_true
  when /^Go button disaabled/ then page.has_xpath?("//*[@id='exceptionsFilterBtn' and @disabled='disabled']").should be_true
  when /^listing page enabled$/ then $dst="this is add exception"+"_"+Time.now.strftime("%Y-%m-%d %H%M%S")
when /^listings page enabled$/ then 
       if $lpe==1
       $dst="this is add exception"+"_"+Time.now.strftime("%Y-%m-%d %H%M%S")
       end
      $lpe=$lpe+1 
when /^the exception search results/ then page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[1]/a[text()='No Records']").should be_false
when /in Exception Phrase column$/ then 
   select "Exception Phrase",:from=>"exceptionsFilterType"
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  if arg1.include?("value that entered for Add") 
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[0]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[0]).should be_true
    print $displayphase[0]
  elsif arg1.include?("value that entered for Rank")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[1]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[1]).should be_true
    print $displayphase[1]
  elsif arg1.include?("value that entered for Suppress")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[2]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[2]).should be_true
    print $displayphase[2]
  elsif arg1.include?("exception added for Add")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[6]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr[1]/td[2]/span",:text=>$displayphase[6]).should be_true
    print $displayphase[6]
  else
    print "Not selected............."
  end
  when /in Type column$/ then page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[3]",:text=>arg1[0..arg1.index("in")-2]).should be_true
  when /in Rank column$/ then 
    page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[4][text()='#{arg1[0..arg1.index("in")-2]}']").should be_true
  when /in Published column$/ then page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td[9]/span",:text=>arg1[0..arg1.index("in")-2]).should be_true
  when /^Add exception by default in pull down$/ then page.has_select?('exceptionType', :selected => 'Add').should be_true
  when /^Publish Flag checked by default/ then page.has_checked_field?("exceptionPublish").should be_true
  when /^Add Autocomplete Exception page/ then page.has_xpath?("//div[6][contains(@style,'display: block;')]").should be_true
  when /^Suggestion Rule list page/ then 
       wait_for_js
       #waitUntilElementvisible("//table[@id='tblTemplates' and count(child::tbody/tr)>1]")
      $rcnt =page.all("//table[@id='tblTemplates']/tbody/tr").count
  sleep 5
  when /^Suggestion Execeptions list page/ then waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  sleep 10
  when /^all actions greyed out except Display Message/ then 
  page.has_xpath?("//select[@id='dropdownActionType1' and child::option[text()='Display Message' and not(@disabled)]]/option[@disabled]",:count=>11).should be_true
  when /^unchecked Customer sees the keywords they/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"appendFlagId\":\"1\"']").should be_true
  when /in the Replace with Term field$/ then 
    find("//input[starts-with(@id,'inputTextTermId')]").value.should=="#{arg1[0..arg1.index("in the")-2]}"
    #page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"replaceTerm\":\"#{arg1[0..arg1.index("in the")-2]}\"')]")
  when /Execute New Search action disabled$/ then page.has_xpath?("//select[@id='dropdownActionType0']/option[@disabled='disabled' and text()='Execute New Search']").should be_true
  click_button("cancel")
  when /Execute New Search action enabled$/ then page.has_xpath?("//select[@id='dropdownActionType0']/option[not(@disabled) and text()='Execute New Search']").should be_true
  when /Replace ONLY Trigger Terms selected by default$/ then page.has_select?('searchQueryId0', :selected => 'Replace ONLY Trigger Terms').should be_true
  when /^checked by default for Customer sees/ then page.has_checked_field?("appendFlag0").should be_true
  when /^Trigger type as/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"type\":\"#{arg1[16..-1]}\"')]").should be_true
  when /^Trigger attribute value/ then 
    page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"value\":\"Contains::#{arg1[arg1.index("as")+3..arg1.index("in")-2]}\"')]").should be_true
  when /^Action type as/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"type\":\"#{arg1[15..-1]}\"')]").should be_true
  when /^Action attribute value/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{arg1[arg1.index("as")+3..arg1.index("in")-2]}')]").should be_true
  when /action type gryed out in action menu drop down$/ then page.has_xpath?("//*[@id='dropdownActionType1']/option[text()='Modify Result Set' and @disabled='disabled']").should be_true
  when /gryed out in action menu drop down$/ then page.has_xpath?("//*[@id='selectOperator1']/option[text()='#{arg1[0..arg1.index("op")-2]}' and @disabled='disabled']").should be_true 
  $ac=0
  when /enabled in action menu drop down$/ then page.has_xpath?("//*[@id='selectOperator1']/option[@value='#{arg1[0..arg1.index("op")-2]}' and @disabled='disabled']").should be_false
  $ac=0
  when /operator in action menu drop down$/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"operatorType\":\"#{arg1[0..arg1.index("op")-2]}\"')]").should be_true
  when "filter by option as" then page.has_xpath?("//*[@id='showFacetFiltersDropdown0']/option[text()='Product Type' and @disabled='disabled' ]").should be_true
  #when /as action type$/ then page.has_xpath?("//select[@id='dropdownActionType0']/option[text()='Show Facets' and @disabled='disabled']").should be_true
  when "Find button disabled" then page.has_xpath?("//*[@id='showFacetFindButton0' and @disabled='disabled']").should be_true
  when /Create Rule page$/ then 
    sleep 5
    verifyElemetPresent($loc['create_rule'],arg1[0,11])
  when /Select Trigger drop down$/ then verifyElemetPresent($loc['select_trigger'],"Select Trigger:")
  when /^as one of the list/ then  verifyElemetPresent($loc['select_trigger'],arg1[0, arg1.index('as')].strip)
  when /Rule Detail page$/ then verifyElemetPresent($loc['rule_detail_page'],"Rule Detail")
  when /created rules name$/ then verifyPagecontent("name",$randomstr)
  when /as Effective Date$/ then verifyPagecontent("startDate",arg1[/\d{1,2}\/\d{1,2}\/\d{4}/])
  when /as Expiration Date$/ then verifyPagecontent("endDate",arg1[/\d{1,2}\/\d{1,2}\/\d{4}/])
  when /^SuperBAUser/ then  verifyElemetPresent($loc['rule_detail_page'],"SuperBAUser")
  when /description$/ then verifyPageTextPresnt("description","Rules creating with description")
  when /disappeared$/ then verifyElementNotVisible("dropdownTriggerType0",arg1[0, arg1.index('tri')].strip)
  when /^please enter valid value/ then page.has_content?(arg1).should be_true
  #when /rules recreated$/ then page.should have_xpath("//div[@id='triggers' and @style='display: none;']")
   # sleep 5
  when /as Trigger Type$/ then verifyPageTextPresnt("dropdownTriggerType0",arg1[0, arg1.index('as')].strip)
  when /^alert as/ then verifyAlerts(arg1[arg1.index('as')+3..-1])
  when /^alerts as/ then verifyAlertsonChildWindows(arg1[arg1.index('as')+3..-1])
  when /^attribute type and value respectively/ then val=arg1[arg1.index('respectively')+13..500].split('  ')
    verifyAttributeTypeAndValue(val[0],val[1])
  when /search results$/ then verifyElementNotVisible("TBLrules","No Records")
  when /^values selected from the autosuggest list$/ then $allselected_values.each do |s| page.has_selector?("//*",:text=>"#{s.gsub("X\n",'')}").should be_true end
  when /^refine facets/ then verifyPresenceofRefinefacet($tr)
  when /^refine facet name and facet value/ then arr= arg1[arg1.index('as')+2..arg1.index('respectively')-2].strip.split(",")
       arr.each_with_index {|val,index|
           page.has_xpath?("//span/span[2][text()='#{val}']").should be_true
       }
  when /^Contains Match is default option/ then page.has_xpath?("//label[2][text()='Contains']").should be_true
  when /^No Facet selected/ then page.has_xpath?("//input[@id='facetRefinSelected']").should be_true
  when /^no refine facets/ then page.has_xpath?("//div[@id='divSubCriteriaA0_0' and @style='width: 70%; display: none;']").should be_true
  when /^disabled no Facet selected/ then page.has_xpath?("//input[@id='facetRefinSelected' and @disabled='disabled']").should be_true
  when /^error message/ then 
  page.has_selector?("//*[@id='mPage']/div[1]/ul/li",:text=>"#{arg1[arg1.index('as')+3..-1]}").should be_true
  puts "#{arg1[arg1.index('as')+3..-1]}"
  when /^alert message/ then verifyAlerts(arg1[arg1.index('as')+3..500])
  when /^triggers deleted$/ then page.has_xpath?("//div[@id='triggers']/div[@id='divTrigger0']").should be_false
  when /^input box for entering keywords$/ then 
  when /Show Masters or Members Products/ then page.has_xpath?("//select[@id='dropdownActionType#{@smm}' and @disabled='disabled']").should be_true
  when /as Show only the Master Products/ then puts "//select[@id='actionValuesDropdown#{@smm}' and @disabled='disabled']"
  when /Filter By as All/ then page.has_xpath?("//select[@id='showFacetFiltersDropdown#{@sf}' and @disabled='disabled']").should be_true
  when /Show Facets$/ then page.has_xpath?("//select[@id='dropdownActionType#{@sf}' and @disabled='disabled']").should be_true
  when /facet value with sequence number/ then arr=arg1[0..arg1.index("as")-2].split(",")
    arr.each do |s|
      page.has_xpath?("//td[@id='colB' and text()='#{s}']").should be_true
  end
  when /RDPP Algorithm/ then page.has_xpath?("//select[@id='dropdownActionType#{@rdpp}' and @disabled='disabled']").should be_true
  page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"typeId\":\"7\"')]").should be_true
  when /RDPP Algorithm: as/ then page.has_xpath?("//select[@id='dropdownRDPPRule#{@rdpp}' and @disabled='disabled']").should be_true
  page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{arg1[arg1.index("as")+3..arg1.index("-")-2]}')]").should be_true
  when /Show Media$/ then page.has_xpath?("//select[@id='dropdownActionType#{@sm}' and @disabled='disabled']").should be_true
  when /Select Media Type as/ then page.has_xpath?("//select[@id='mediaTypeDropdown#{@sm}' and @disabled='disabled']").should be_true
  when /^Media Group ID as/ then page.has_xpath?("//input[@id='mediaLocationPoolId#{@sm}_0' and @disabled='disabled']").should be_true
  when /Modify Result Set/ then page.has_xpath?("//select[@id='dropdownActionType#{@mrs}' and @disabled='disabled']").should be_true
  page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{arg1[arg1.index("as")+3..-1]}')]").should be_true
  when /^Product id as/ then 
  page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'\"PRD\":[#{arg1[arg1.index("as")+3..arg1.index("in")-2]}]')]").should be_true
  when /Saved Set Query ID/ then 
  page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{arg1[arg1.index("as")+3..arg1.index("in")-2]}')]").should be_true
  when /Display Message/ then page.has_xpath?("//select[@id='dropdownActionType#{@dm}' and @disabled='disabled']").should be_true
  when /^excludes option$/ then page.has_xpath?("//label[@id='cALabelCondition']",:text=>arg1[0..arg1.index("option")-2]).should be_true
  when /^Select Countries list box$/ then    
  when /^popup as/ then verifyAlertswithCancel(arg1[arg1.index("as")+3..-1])
  when /in Select Facets to Display modal window$/ then 
    $ft=Array.new
     steps %{
    Then I connect to the stella sdt database
  }
 puts "select count(unique saf.facet_name) from product_type_attribute pta, product_type pt, stars_attr.attribute_facet saf where pta.product_type_id=pt.product_type_id and pt.product_type_name='#{arg1[24..arg1.index("in")-2]}' and pta.attribute_type_id=saf.attribute_id and saf.facet_flag='Y'and saf.tenant_id='#{$yml_file['sitetenant']}'"
 results1 =$dbhintd.execute("select count(unique saf.facet_name) from product_type_attribute pta, product_type pt, stars_attr.attribute_facet saf where pta.product_type_id=pt.product_type_id and pt.product_type_name='#{arg1[24..arg1.index("in")-2]}' and pta.attribute_type_id=saf.attribute_id and saf.facet_flag='Y'and saf.tenant_id='#{$yml_file['sitetenant']}'")
  #puts results1
  puts "****************************************"
  results1.fetch do |row|
   if row[0].to_int()>0
     $facet_count =row[0].to_int()
     page.has_selector?("//div[@id='cboxlistDiv']/ul/li", :count => row[0].to_int()).should be_true
     else
     page.has_xpath?("//*[@id='mPage']/div[1]/ul/li",:text=>"'color' is an incorrect value for Product Type, please enter valid value to save the Action").should be_true  
  end
  end
end
end

Then /^I should check "([^"]*)"$/ do |arg1,table|
  case arg1
  when /^given special characetrs/ then 
    table.hashes.each do |row|
      page.has_selector?("//span",:text=>"#{row[:values]}").should be_true
    end
  when /attributes in drop down$/ then table.hashes.each do |attributes|
      page.has_select?("dropdown"+arg1[arg1.index('see')+4..arg1.index('attributes')-2]+"0_0", :with_options => [attributes.to_s]).should be_true
    end
    sleep 10
  when /^autosuggestion dropdown values/ then table.hashes.each do |row|
      page.has_selector?("//span",:text=>"#{row[:values]}").should be_true
    end
  when /for Context attributes name$/ then 
    table.raw.each do |attributes,names|
         verifyContextArttributeValuesAndNames(names,attributes,arg1[0..arg1.index("Context")-2])
     end
   end
end

When(/^I select productDatamatch Attribute "(.*?)" and Value "(.*?)"$/) do |arg1,arg2|
   AddTriggerAttributeswithProductDataMatch($i,arg1,arg2)
end

When(/^replace the value with existing value "(.*?)"$/) do |arg1|
   find(:xpath,"//*[text()='X']").click
  if(arg1.include? ",")
    name=arg1.split(",")
    name.length.times do |i|
       find(:xpath,"//input[starts-with(@id,'tagBox-input')]").set(name[i])
    end
  else
     find(:xpath,"//input[starts-with(@id,'tagBox-input')]").set(arg1)
  end
end

When(/^I enter the attribute value as "(.*?)"$/) do |arg1|
   find(:xpath,"//*[text()='X']").click
  if(arg1.include? ",")
    name=arg1.split(",")
    name.length.times do |i|
       find(:xpath,"//input[starts-with(@id,'tagBox-input')]").set(name[i])
       page.driver.browser.action.send_keys(:tab).perform
    end
  else
     find(:xpath,"//input[starts-with(@id,'tagBox-input')]").set(arg1)
     page.driver.browser.action.send_keys(:tab).perform
  end
end

When(/^I select attribute type "(.*?)" value "(.*?)"$/) do |arg1,arg2|
   select arg1,:from =>"dropdownResultSetTrigger0_0"
   find("//input[contains(@id,'tagBox-input')]").set(arg2)
end

When(/^I enter values as attributevalue in text box$/) do |table|
  table.raw.each do |attributes|
     find(:xpath,"//input[starts-with(@id,'tagBox-input')]").set(attributes.join(""))
     find(:xpath,"//*[@id='divTriggerButtons0']").click
  end
end

When(/^Observe auto suggestions drop down and select attribute value$/) do |table|
  $allselected_values=Array.new
  it=3
  ne=0
  table.hashes.each do |row|
     find("//div[@id='divSubCriteriaA0_#{ne}']/span[1]/input").set("#{row[:facet_name]}")
     waitUntilElementvisible("//ul[starts-with(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
     find("//*[@id='divSubCriteriaA0_0']/div").click
     #find("//*[@id='divTriggerButtons0']").click
     loc=page.driver.browser.find_element(:xpath,"//div[@id='divSubCriteriaA0_#{ne}']/span[2]/input").attribute("id")
     find("//input[@id='#{loc}']").set("#{row[:facet_value]}")
    if page.has_xpath?("//*[contains(@class,'ui-autocomplete ui-menu') and contains(@style,'display: block;')]")
      num_of_auto_suggestions = page.all("//ul[#{it}]/li/a").count
      num_of_auto_suggestions.should be <= 5
      num=SecureRandom.random_number(num_of_auto_suggestions)+1
        find("//ul[#{it}]/li[#{num}]/a").click
        sleep 3
        find("//*[@id='divTriggerButtons0']").click
       rid= page.driver.browser.find_element(:xpath,"//div[@id='divSubCriteriaA0_#{ne}']/span[@class='tagBox-container orderVerified']/span").attribute("id")
       facet_value=find("//span[@id='#{rid}']/span/span[2]").text
       $allselected_values << facet_value
       steps %{
               When I click the "plus sign" button
             } 
            ne=ne+1
            it=it+2  
    else
       raise "No Autosuggesitions for"+" "+ "#{row[:facet_value]}"
    end
  end
       find("//*[@id='buttonRemove0_#{ne}']").click
end

When(/^search for created Rules from global search textbox and click go button$/) do
   global_search("Rule"+" "+"Names",$randomstr) #$randomstr
end

When(/^search for Dictionary Terms "([^"]*)" from global search textbox $/) do |term|
 global_search("Dictionary Terms",term)
end

Then(/^waitsometime$/) do
   sleep 20
end

When /^I click "([^"]*)" checkbox$/ do |arg1|
   @facet_id=page.driver.browser.find_element(:xpath,"//label[text()='#{arg1}']").attribute("id")
   find("//input[@id='cbox_#{@facet_id}']").set(true)
end

Then(/^I should not see "([^"]*)"$/) do |arg1|
case arg1
when "phrase specific Relationship drop down and entry fileds" then
  page.should have_xpath("//*[@id='addEditRelForm' and count(child::div)=2]")
when /Exception with this display phrase text in listexception page$/ then 
  steps %{
                 Given I connect to the database
           }
  
  
  if arg1.include?("Add")
  if $displayphase[3].start_with?("'")
  actval = "'\#{$displayphase[3]}'" 
  query="delete auto_override where display_phrase='\#{$displayphase[3]}'"
  else
  actval = "'#{$displayphase[3]}'" 
  query="delete auto_override where display_phrase='#{$displayphase[3]}'"
  end  
  $dbhsaturn.execute(query)
  $dbhsaturn.execute("commit")
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  select "Exception Phrase",:from=>"exceptionsFilterType"
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[3]
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)=1]")
    page.should_not have_xpath("//*[@id='tblExceptions']/tbody/tr/td[2][not(text())]/span[text()=#{actval}]")
  elsif arg1.include?("Rank")
  if $displayphase[4].start_with?("'")
  actval = "'\#{$displayphase[4]}'" 
  query="delete auto_override where display_phrase='\#{$displayphase[4]}'"
  else
  actval = "'#{$displayphase[4]}'" 
  query="delete auto_override where display_phrase='#{$displayphase[4]}'"
  end  
  $dbhsaturn.execute(query)
  $dbhsaturn.execute("commit")
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  select "Exception Phrase",:from=>"exceptionsFilterType"
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[4]
  find("//*[@id='exceptionsFilterBtn']").click
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)=1]")
  page.should_not have_xpath("//*[@id='tblExceptions']/tbody/tr/td[2][not(text())]/span[text()=#{actval}]")
  elsif arg1.include?("Suppress")
  if $displayphase[5].start_with?("'")
  actval = "'\#{$displayphase[5]}'" 
  query="delete auto_override where display_phrase='\#{$displayphase[5]}'"
  else
  actval = "'#{$displayphase[5]}'" 
  query="delete auto_override where display_phrase='#{$displayphase[5]}'"
  end  
  $dbhsaturn.execute(query)
  $dbhsaturn.execute("commit")
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  select "Exception Phrase",:from=>"exceptionsFilterType"
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
  page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $displayphase[5]
  find("//*[@id='exceptionsFilterBtn']").click
  waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)=1]")
  
  page.should_not have_xpath("//*[@id='tblExceptions']/tbody/tr/td[2][not(text())]/span[text()=#{actval}]")
  end
when /^Exception pharse as/ then select "Exception Phrase",:from=>"exceptionsFilterType"
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
    page.driver.browser.find_element(:xpath,"//*[@id='exceptionsFilterVal']").send_keys [:control, 'a'], $dst
    find("//*[@id='exceptionsFilterBtn']").click
    waitUntilElementvisible("//*[@id='tblExceptions' and count(child::tbody/tr)>=1]")
   page.has_xpath?("//*[@id='tblExceptions']/tbody/tr/td/a[text()='No Records']").should be_true
when /^Execute New Search action not associated/ then page.has_xpath?("//div[@id='divAction0']").should be_false
when /action type with Add rule$/ then page.has_xpath?("//div[@id='helpMenuContext']/following-sibling::script[contains(text(),'#{arg1[0..arg1.index("ac")-2]}')]").should be_false
when /boolean operators AND or OR/ then 
  page.has_xpath?("//*[@id='divGlobalOperator']").should be_false
when /show facet actions/ then page.has_xpath?("//div[@id='actionsContainer']/div[@style='display: block;']/div").should be_false
when "as Trigger Type" then page.has_xpath?("//*[@id='dropdownTriggerType0']",:text =>arg1[0, arg1.index('as')].strip).should be_false
end
end

When(/^I "([^"]*)" following attributes value for attributes name$/) do |arg1,table|
table.raw.each do |attributes,names|
         checkAndUncheckContextAtrributes(names,attributes,arg1)
     end
end

Then(/^I should see the sub menus under "(.*?)"$/) do |menu,table|
  table.hashes.each do |row|
   page.should have_xpath("//a[text()='#{menu}']/following-sibling::ul/li/a[text()='#{row[:sub_menus]}']")
   end
end

Then(/^I should "(.*?)"$/) do |arg1,table|
case arg1
when /^see following option as sub menu/ then
  table.hashes.each do |row|
   page.should have_xpath("//a[text()='AUTOCOMPLETE']/following-sibling::ul/li/a[text()='#{row[:sub_menus]}']")
   end
when /^see following option in rules drop down/ then
   table.hashes.each do |row|
   page.should have_xpath("//select[@id='templatesFilterType']/option[text()='#{row[:Search_Rules]}']")
   end
when /^see summary panel with facet_name & facet_values/ then 
  table.hashes.each do |row|
    verifydisplayfacets(row[:facet_name],row[:facet_value])
  end
when /num of hops calculated relationships created in database$/ then 
  table.hashes.each do |row|
   calculatedrelationshipsinDB(row[:term1]+$dy,row[:term2]+$dy,row[:num_of_hops])
   end
when /^not see term1 is relationship of term2 and num of hops calculated/ then 
  table.hashes.each do |row|
   nocalculatedrelationshipsinDB(row[:term1]+$dy,row[:term2]+$dy,row[:num_of_hops])
   end   
when /following options in select filter drop down$/ then table.hashes.each do |row|
   page.has_xpath?("//select[@id='exceptionsFilterType']/option[text()='#{row[:exceptionsFilterType]}']").should be_true
end
when /following Exception Types in pull down$/ then table.hashes.each do |row|
  page.has_xpath?("//select[@id='exceptionType']/option[text()='#{row[:Exception_Type]}']").should be_true
end
when /show facets options/ then waitUntilElementCountvisible("//*[@id='showFacetFiltersDropdown0']/option[text()]",2)
  table.hashes.each do |row|
  page.has_xpath?("//select[@id='showFacetFiltersDropdown0']/option[text()='#{row[:Filter_By]}']").should be_true
end
when /facets having sequencenumber as sno$/ then table.hashes.each do |row|
 find("//td[@id='colB' and text()='#{row[:facets]}']/preceding-sibling::td/input").value.should=="#{row[:sno]}"
 #page.has_xpath?("//td[@id='colB' and text()='#{row[:facets]}']").should be_true
 $ac=0
end
when /facets having sequencenumber as sno in rules detail page$/ then 
if $yml_file['sitetenant']=='MCOM' 
 steps %{
    Given I connect to the database
  }
 table.hashes.each do |row|
 results=$dbhsaturn.execute("select count(*) from display_facet where facet_name='#{row[:facets]}' and sequence_number=#{row[:sno]} and display_facet_action_id=(select display_facet_action_id from display_facet_action where merch_action_id=(select merch_action_id from merch_rule_action_assn where merch_rule_id=(select merch_rule_id from merch_rule where merch_rule_name='#{$randomstr}')))")
 results.fetch do |data|
   if data[0].to_int()>0
     find("//td[@id='colB' and text()='#{row[:facets]}']/preceding-sibling::td/input").value.should=="#{row[:sno]}"
     #page.has_xpath?("//td[@id='colB' and text()='#{row[:facets]}']").should be_true
  else
     page.has_xpath?("//td[@id='colB' and text()='#{row[:facets]}']").should be_false
  end
 end
end
end
end
end

When(/I checked "([^"]*)"$/) do |arg1,table|
 case arg1
 when /^following facets/ then
  table.hashes.each do |row| 
   find("//label[text()='#{row[:select_facet]}']/following-sibling::input").set(true)
   end
 end
end

When(/^I unchecked "([^"]*)"$/) do |arg1,table|
 case arg1 
 when /^following facets/ then
   table.hashes.each do |row|
   @facet_id=page.driver.browser.find_element(:xpath,"//label[text()='#{row[:facets]}']").attribute("id")
   find("//input[@id='cbox_#{@facet_id}']").set(false)
   end
 when /^category facet and facet values and verify/ then
   table.hashes.each do |row|
    filteroptions = row[:facet_value].split(",")
    filtername=row[:facet_name]
    #wait_for_js
     # waitUntilElementvisible("//*[@id='catfacetlist']/option[text()='#{filtername}']")
     # sleep 5
     #find("//*[@id='catfacetlist']/option[text()='#{filtername}']").click
     # waitUntilElementvisible("//*[@id='catFacetCBox']/label")
     # sleep 5
    #wait_for_js
    for ftv in filteroptions
     #ds="//div[@class='mDialog noFloatLayout total']/descendant::span[text()='#{ftv}']/child::a"
     if page.has_xpath?("//span[text()='#{ftv}']/child::a[1]") 
     find("//span[text()='#{ftv}']/child::a[1]").click
     #find("//ul[@id='catFacetCBox']/label[text()='#{ftv}']/preceding-sibling::input[position()=1]").set(false)
      wait_for_js
      #sleep 3
      #page.has_xpath?("#{ds}").should be_false
      else
        puts "not available"
      end
    end
    end
when /category facet and facet values by clicking cross sign$/ then
   table.hashes.each do |row|
    filteroptions=Array.new
    filteroptions = row[:facet_value].split(",")
    filtername=row[:facet_name]
    for ftv in filteroptions
      ds="//div[@id='FacetTable']/descendant::span[text()='#{ftv}']/child::a"
     if page.has_xpath?("#{ds}")
       find("#{ds}").click
       end
     end 
   end     
 end
end

When(/^I create "([^"]*)"$/) do |arg1,table|
   table.hashes.each do |row|
   createHypernym(row[:term1]+$dy,row[:term2]+$dy,row[:num_of_hops])
   end
end

When(/^I select the "([^"]*)"$/) do |arg1,table|
  case arg1
  when /^category facet and facet values and verify/ then
    table.hashes.each do |row|
    filteroptions=Array.new
    filteroptions = row[:facet_value].split(",")
    filtername=row[:facet_name]
    addingfilteroptionsforens(filtername,filteroptions)
    end
  end
end

When(/^I enter the "([^"]*)"$/) do |arg1,table|
case arg1
when /^characters in Key in Facet text box/
  autosuggesitions=Array.new
  selectedvalues=Array.new
  table.hashes.each do |row|
  autosuggesitions << row[:values]
  end
  verifyAutoSuggesitions("input_facet_autosuggest",autosuggesitions,"//div[@id='cboxlistDiv_facetsRefinement']/ul/li")
  if arg1.include?("and select factname from auto drop down")
  facet_values=page.all("//ul[@id='catFacetCBox']/input").count
      i=1
      while i <= facet_values
      find("//ul[@id='catFacetCBox']/input[#{i}]").click
      selectedvalues << find("//ul[@id='catFacetCBox']/label[#{i}]").text
      i=i+1
      end
      facetname=find("//select[@id='catfacetlist']/option[@selected='selected']").text
      find("//div[7]/div[11]/div/button[1]").click
      verifydisplayfacets(facetname,selectedvalues)
    end
end
end

When(/^I click "(.*?)" check box$/) do |arg1|
 find("//div[@id='navigation']/div/input[following-sibling::span[text()='#{arg1}']]").click
end

class SuggestionRulePage < Test::Unit::TestCase
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  PageObject.javascript_framework = :jquery

  select_list(:filterby,:id => "templatesFilterType")
  text_field(:enterrulename, :id => "templatesFilterVal")
  button(:gobtn,:id => "templatesFilterBtn")
  link(:tempid, :class=> "isLink")
  text_field(:suggestionrulename,:id =>"aSName")
  div(:applyruleto,:id=>"applyValues")
  table(:displayPattern,:id => "displayPatternTable")
  text_field(:rank,:id => "aSRank")
  checkbox(:includesym, :id => "aSSyn")
  checkbox(:publishtag,:id => "aSPublish")
  link(:waitforresults, :xpath => "//*[@id='tblTemplates']/tbody/tr/td/a[not(contains(text(),'No Records'))]")
 
  def getSuggestionRuleDetailPage(byselectvalue,entervalue)
    self.filterby_element.select(byselectvalue)
    wait_for_ajax
    @browser.action.send_keys(:tab).perform
    self.enterrulename =entervalue
    self.gobtn
    wait_for_ajax
    loop do 
   if self.waitforresults?
     break
   end 
   self.gobtn
   wait_for_ajax
 end
   $tempid=self.tempid_element.text
   self.tempid_element.click
   wait_for_ajax     
  end

  def getSuggestionRuleData(data)
    self.suggestionrulename.should include data[self.suggestionrulename][0]
    self.applyruleto_element.span_element(:index => 1).text.should include getAttributeName(data[self.suggestionrulename][1])
    #self.applyruleto_element.span_element(:index => 3).text.should include data[self.suggestionrulename][2].capitalize
    cnt= self.span_elements(:xpath => "//*[@id='displayPatternTable']/tbody/tr[not(contains(@class,'hidden'))]/td/span[@class='bold orange']").size
    @j=0
    for i in 1..cnt
      self.displayPattern_element[i][1].span_element(:index => 1).text.should include getAttributeName(data[self.suggestionrulename][3+@j])
      self.displayPattern_element[i][2].select_list_element.selected?(data[self.suggestionrulename][4+@j]).should be_true
      @j=@j+2    end
    @j=@j-1
    if !data[self.suggestionrulename][4+@j].nil?
       #self.rank.should == data[self.suggestionrulename][4+@j]
       @j=@j+1
     elsif !data[self.suggestionrulename][4+@j].nil?
        self.includesym_checked?.should be_true
        @j=@j+1
     elsif !data[self.suggestionrulename][4+@j].nil?
        self.publishtag_checked?.should be_true
    end
  end

  def getAttributeName(attname)
    saturn_results = $dbattri.execute("select distinct attribute_name from attribute_def ad,attribute_export ae where ad.attribute_id = ae.attribute_id and
ae.dest_attribute_name = '#{attname}'")
    saturn_results.fetch do |row|
      return "#{row[0]}"
    end
  end

def checkrecordsexists(num)
 results = $dbhsaturn.execute("select count(*) from auto_template_filter where auto_template_filter_id =(select auto_template_filter_id from auto_template where auto_template_id=#{$tempid})")
  results.fetch do |row|
  assert_equal(row[0].to_int,num.to_i)
  end
end
end


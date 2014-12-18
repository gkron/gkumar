class SaturnRulesListPage
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory

  link(:ruleid, :xpath => "//table[@id='TBLrules']/tbody/tr/td[1]/a")
  div(:ruledetail, :text => "Rule Detail")
  link(:noresults, :text => "No Records")
  table(:tblruleid, :id => "TBLrules")  
  def waitforruledetailpage
    sleep 4
    self.ruleid
    attempts=0
    begin
      self.ruledetail?
    rescue Exception => exc
      attempts=attempts+1
      retry unless attempts > 10
    ensure
      sleep 6
    end
  end
  def norulesfound
    self.noresults?.should be_true
  end
end


@capybara
Feature: To test whether the build is acceptable or not

@BAT_Extend_Mcom
Scenario: As a user I am able to create rule with PDP Redirect action 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "PDP Redirect from select action pulldown"
  And I enter "4199 in the respective text fields"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
  Then I should see "Rule Detail page"
   And I should see "Action type as PDP Redirect"
   And I should see Product Id as "4199" in the product id text field
   And I should see the "rulename" as "newrule"
   And I should see the "Rule Effective Date" as "12/12/2012"
   And I should see the "Rule Expiration Date" as "12/12/2013"
   #And I should see the "Owner" as "SuperBAUser"
   And I should see the "description" as "Automation test"
  
@BAT_Extend_Mcom  
Scenario: As a user I am able to create rule with Display Message action
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Display Message from select action pulldown"
  And I enter "this is testing world in Message Displayed message text box"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
  Then I should see "Rule Detail page"
  And I should see the "rulename" as "newrule"
  And I should see the "Rule Effective Date" as "12/12/2012"
  And I should see the "Rule Expiration Date" as "12/12/2013"
  #And I should see the "Owner" as "SuperBAUser"
  And I should see the "description" as "Automation test"
  And I should see the "display message action type" as "Display Message"
  And I should see the "Display Message" as "this is testing world in Message Displayed text box" 
 
@BAT_Extend_Mcom
Scenario: As a user I am able to create a rule with show facets action 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Show Facets from select action pulldown"
  And I select "All option from Filter By drop down"
  And I click the "find" button
  And I checked "following facets from Select Facets to Display: modal window" 
                         | select_facet     |
                         | Accent           |
                         | Accessories Type |
                         | Age Groups       |
                         | Department       | 
                         | Grill Type       |
Then I should "see summary pane with facets having sequencenumber as sno"
 | facets           | sno |
 | Accent           | 1   |
 | Accessories Type | 2   |
 | Age Groups       | 3   |
 | Department       | 4   |
 | Grill Type       | 5   |
When I click the "save action" button
And I click "Browse" check box
 And I click the "Save rule" button				
Then I should see "Rule Detail page"
  And I should see the "rulename" as "newrule"
  And I should see the "Rule Effective Date" as "12/12/2012"
  And I should see the "Rule Expiration Date" as "12/12/2013"
  #And I should see the "Owner" as "SuperBAUser"
  And I should see the "description" as "Automation test"
  And I should see the "action type" as "Show Facets"
  And I should see the "Filter By" as "All"
Then I should "see summary pane with facets having sequencenumber as sno in rules detail page"
 | facets           | sno |
 | Accent           | 1   |
 | Accessories Type | 2   |
 | Age Groups       | 3   |
 | Department       | 4   |
 | Grill Type       | 5   |
 
@BAT_Extend_Mcom
Scenario: As a user I am able to create a rule with show facets action with product type 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Show Facets from select action pulldown"
Then I should see "Find button disabled"  
When I select "Product Type option from Filter By drop down"
Then I should see "Select Product Type entry filed" 
When I enter "JEANS as product type"
  And I click the "Find" button
When I checked "following facets from Select Facets to Display: modal window" 
                         | select_facet |
                         | Brand        |
                         | Gender       |
                         | Special Size |
                         | Type         |
     And I click the "save action" button
     And I click "Browse" check box
     And I click the "Save rule" button
Then I should see "Rule Detail page"
     And I should see the "rulename" as "newrule"
     And I should see the "Rule Effective Date" as "12/12/2012"
     And I should see the "Rule Expiration Date" as "12/12/2013"
     #And I should see the "Owner" as "SuperBAUser"
     And I should see the "description" as "Automation test"
     And I should see the "action type" as "Show Facets"
     And I should see the "Filter By" as "Product Type"
     And I should see the "show facet product type" as "Jeans"
     And I should "see summary pane with facets having sequencenumber as sno in rules detail page"
	      | facets       | sno |
	      | Brand        | 1   |
	      | Gender       | 2   |
	      | Special Size | 3   |
	      | Type         | 4   |

@BAT_Extend_Mcom
Scenario: As a user I am able to create a rule with modify result set action type with Boost operator 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Modify Result Set from select action pulldown"
  And I select "Action menu drop down"
  #And I select "Boost operator from action menu"
  And I enter "valid Product Id as 4199 in Product id text field on the Create Rule page"
  And I enter "valid Saved Set/Query ID as 1519109 in Saved Set Query ID text field on the Create Rule page"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see the "rulename" as "newrule"
    And I should see the "Rule Effective Date" as "12/12/2012"
    And I should see the "Rule Expiration Date" as "12/12/2013"
    #And I should see the "Owner" as "SuperBAUser"
    And I should see the "description" as "Automation test"
    And I should see the "mrs action type" as "Modify Result Set"
    And I should see the "mrs action operator" as "Boost"
    And I should see the "mrs action Product id" as "4199"
    And I should see the "saved set query id" as "1519109"
	
@BAT_Extend_Mcom	
Scenario: As a user I am able to create a rule with modify result set with Remove operator 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Modify Result Set from select action pulldown"
  And I select "Action menu drop down"
  And I select "Remove operator from action menu"
  And I enter "valid Product Id as 4199 in Product id text field on the Create Rule page"
  And I enter "valid Saved Set/Query ID as 1519109 in Saved Set Query ID text field on the Create Rule page"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see the "rulename" as "newrule"
    And I should see the "Rule Effective Date" as "12/12/2012"
    And I should see the "Rule Expiration Date" as "12/12/2013"
    #And I should see the "Owner" as "SuperBAUser"
    And I should see the "description" as "Automation test"
    And I should see the "mrs action type" as "Modify Result Set"
    And I should see the "mrs action operator" as "Remove"
    And I should see the "mrs action Product id" as "4199"
    And I should see the "saved set query id" as "1519109"  

@BAT_Extend_Mcom
Scenario: As a user I am able to create modify result set with Replace operator 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
  And I select "Modify Result Set from select action pulldown"
  And I select "Action menu drop down"
  And I select "Replace operator from action menu"
  And I enter "valid Product Id as 4199 in Product id text field on the Create Rule page"
  And I enter "valid Saved Set/Query ID as 1519109 in Saved Set Query ID text field on the Create Rule page"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see the "rulename" as "newrule"
    And I should see the "Rule Effective Date" as "12/12/2012"
    And I should see the "Rule Expiration Date" as "12/12/2013"
    #And I should see the "Owner" as "SuperBAUser"
    And I should see the "description" as "Automation test"
    And I should see the "mrs action type" as "Modify Result Set"
    And I should see the "mrs action operator" as "Replace"
    And I should see the "mrs action Product id" as "4199"
    And I should see the "saved set query id" as "1519109"

@BAT_Extend_Mcom
Scenario: I am able to create rule with Execute New Search action 
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
Then I should see "Execute New Search action disabled"  
When I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Keyword" from Select Trigger pulldown
  And I enter keyword value as "ck" in the keyword field
  And I click the "save trigger" button 
  And I click the "Add Action" button
  And I select "Execute New Search from select action pulldown"
Then I should see "Execute New Search action enabled"
  And I should see "checked by default for Customer sees the keywords they entered on the search results page check box"
  And I should see "Replace ONLY Trigger Terms selected by default"
When I enter "Wine Glasses in the Replace with Term field"
  And I click the "save action" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see "Trigger type as Keyword"
    And I should see "Trigger attribute value as ck in the keywords field"
    And I should see the "rulename" as "newrule"
    And I should see the "Rule Effective Date" as "12/12/2012"
    And I should see the "Rule Expiration Date" as "12/12/2013"
    #And I should see the "Owner" as "SuperBAUser"
    And I should see the "description" as "Automation test"
    And I should see the "ens action type" as "Execute New Search"
    And I should see the "Replace with Term field value" as "Wine Glasses"
    
@BAT_Extend_Mcom
Scenario: As a user I am able to add muliple facet and facet values to my New Search Action in rule create page
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Actions" button
  And I click the "Add Action" button
Then I should see "Execute New Search action disabled"  
When I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Keyword Pattern from Select Trigger pulldown"
  And I select "keyword pattern attribute type as Brand with attribute values as Calvin Klein"
  And I click the "save trigger" button
  And I click the "Add Actions" button
  And I select "Execute New Search from select action pulldown"
Then I should see "Execute New Search action enabled" 
When I click the "Add Filter" button
Then I should see "Select Facet modal window"
  And I should see "all the facets in select facet list"
When I select the "category facet and facet values and verify"  
 | facet_name      | facet_value                                                                                                                                                                                       |
 | Special Offers  | Free Shipping,Sales & Discounts,Gift with Purchase,Special Purchase,Flat Free Shipping,Clearance/Closeout,Lowest Price of the Season,Everyday Value                                               |
 | Department Type | Activewear,Sweatshirt,Sports Bra,Coats,Dresses,Jackets,Jeans,Pants,Shorts,Skirts,Suits,Sweaters,Swim,Tops,Accessories,Shoes,Toys & Games,Baby Sets,Outfits,Bodysuits & Coveralls,Shirts,Baby Gear |
 And I click the "Ok facets" button 
When I click the "save action" button
And I click "Browse" check box
When I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see the "rulename" as "newrule"
    And I should see the "Rule Effective Date" as "12/12/2012"
    And I should see the "Rule Expiration Date" as "12/12/2013"
    #And I should see the "Owner" as "SuperBAUser"
    And I should see the "description" as "Automation test"
    And I should see the "ens action type" as "Execute New Search"
    And I should see "Trigger type as Keyword Pattern"
    And I should "see summary panel with facet_name & facet_values in detail page" 
 | facet_name      | facet_value                                                                                                                                                                                       |
 | Special Offers  | Free Shipping,Sales & Discounts,Gift with Purchase,Special Purchase,Flat Free Shipping,Clearance/Closeout,Lowest Price of the Season,Everyday Value                                               |
 | Department Type | Activewear,Sweatshirt,Sports Bra,Coats,Dresses,Jackets,Jeans,Pants,Shorts,Skirts,Suits,Sweaters,Swim,Tops,Accessories,Shoes,Toys & Games,Baby Sets,Outfits,Bodysuits & Coveralls,Shirts,Baby Gear |

@BAT_Extend_Mcom
Scenario: As a user I am able to create rule with Keyword Trigger type
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Keyword from Select Trigger pulldown"
  And I enter "CK in the keywords field" 
  And I click the "save trigger" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"
  And I should see "Trigger type as Keyword"
  And I should see "Trigger attribute value as ck in the keywords field"
  
@BAT_Extend_Mcom
Scenario: As a user I am able to create rule with Keyword Pattern Trigger type
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Keyword Pattern from Select Trigger pulldown"
  And I select attribute type as "Brand" and attribute vlues as "Calvin Klein"
  And I click the "save trigger" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"
  And I should see "Trigger type as Keyword Pattern"
  And I should see keyword pattern attribute type as "Brand"
  And I should see keyword pattern attribute value as "calvin klein"
  
@BAT_Extend_Mcom
Scenario: checking rules getting created for all result set attributes
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
#Then I should see "Select Trigger drop down"
When I select "Result Set" from the trigger pulldown
  And I select "<attribute type>" from ResultSet Trigger dropdown and enter "<attribute value>"
             | Category       | 65292           |
             | Product Type   | Beauty Tools    |
             | Brand          | Joop!           |
             | Product Noun   | food storage    |
             | Normal Color   | Blue            |      
  And I select "> from logical pulldown" 
  And I enter "75 in percentage filed"       
  And I click the "save trigger" button
  And I click "Browse" check box
  And I click the "Save rule" button 
Then I should see "Rule Detail page"
     And I should see rulename as "newrule" 
     And I should see "12/12/2012 as Effective Date"
     And I should see "12/12/2013 as Expiration Date"
     #And I should see "SuperBAUser as Owner"
     And I should see description as "Automation test"
     And I should see "Result Set as Trigger Type"
	 And I should see "<attribute type>" and "<attribute value>"
	         | Category       | 65292           |
             | Product Type   | Beauty Tools    |
             | Brand          | Joop!           |
             | Product Noun   | food storage    |
             | Normal Color   | Blue            |
 
@BAT_Extend_Mcom
Scenario: I am able to create a rule with all product data match attributes
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
#Then I should see "Select Trigger drop down"
When I select "Product Data Match" from the trigger pulldown
     And I select "<attribute type>" from product data match dropdown and enter "<attribute value>"
           | Search_Type     | V-Neck              |
           | Search_Occasion | Wedding/Anniversary |
           | Search_Material | Leather             |
           | Search_Gender   | Adult               |
           | Search_Color    | Blue                |
           | Search_Style    | Relaxed             |
           | Product Noun    | food storage        |
           | Product Type    | T-shirts            |
           | Brand           | Joop!               |
     And I click the "save trigger" button
     And I click "Browse" check box
     And I click the "Save rule" button 
Then I should see "Rule Detail page"
     And I should see rulename as "newrule" 
     And I should see "12/12/2012 as Effective Date"
     And I should see "12/12/2013 as Expiration Date"
     #And I should see "SuperBAUser as Owner"
     And I should see description as "Automation test"
     And I should see "Product Data Match as Trig1ger Type"
     And I should see "<attribute type>" and "<attribute value>"
	       | Search_Type     | V-Neck              |
           | Search_Occasion | Wedding/Anniversary |
           | Search_Material | Leather             |
           | Search_Gender   | Adult               |
           | Search_Color    | Blue                |
           | Search_Style    | Relaxed             |
           | Product Noun    | food storage        |
           | Product Type    | T-shirts            |
           | Brand           | Joop!               |
           
@BAT_Extend_Mcom         
Scenario Outline: As a user I am able to create a rule with trigger type Facet Refinement
Given I have logged into Saturn as a Merchandise Manager
When I click the "RULES from the global navigation bar" button
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter "rules name as <rulename>" 
	And I enter "Effective Date as <startdate>"
	And I enter "Expiration Date as <enddate>"
    And I enter "description as <description>"
    And I click the "Triggers" button
	And I click the "Add Trigger" button
#Then I should see "Select Trigger drop down"
When I select "Facet Refinement from Select Trigger pulldown"
Then I should see "Contains Match is default option on the Trigger"
   And I should see "disabled no Facet selected checkbox"
   And I should see "ANDed Match is default option on the Trigger"
When I enter "refine facet name and facet value as Brand,calvin klein respectively"
     And I click the "save trigger" button
     And I click "Browse" check box
     And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see "rules as created rules name" 
     And I should see "<startdate> as Effective Date"
     And I should see "<enddate> as Expiration Date"
     #And I should see "SuperBAUser as Owner"
     And I should see "Rules creating with description as description"
     And I should see "Facet Refinement as Trigger Type"
     And I should see "refine facet name and facet value as Brand,Calvin Klein respectively"
Examples:
 | rulename         | startdate  | enddate    | description      |
 | Facet Refinement | 01/15/2012 | 02/15/2012 | Facet Refinement |          
 
 
@BAT_Extend_Mcom
Scenario: As a user I am able to create rule with Result Count Trigger type
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"  
  And I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Result Count from Select Trigger pulldown"
  And I enter "10 in Result Count text field"
  And I click the "save trigger" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"
  And I should see "Trigger type as Result Count"
  And I should see "Less Than in menu drop down"
  And I should see "10 in Result Count text field"

@BAT_Extend_Mcom
Scenario: As a user I am able to create rule with result counter with greeater than
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test" 
  And I click the "Triggers" button
  And I click the "Add Trigger" button
  And I select "Result Count from Select Trigger pulldown"
  And I enter "10 in Result Count text field"
  And I click the "save trigger" button
  And I click the "edit trigger" button
  And I select "Greater Than option from menu drop down"
  And I enter "1 in Result Count text field" 
  And I click the "save trigger" button
  And I click "Browse" check box
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"
  And I should see "Trigger type as Result Count"
  And I should see "Greater Than in menu drop down"
  And I should see "1 in Result Count text field"
  
@BAT_Extend_Mcom
Scenario: As a user I am able to Add a new suggestion rule
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Rules" button
Then I should see "Suggestion Rule list page"
When I click the "Add Rule" button
  And I enter "rulename" in Rule Name text field
  And I click "Add Facet" button for Apply Rule To option
  And I select "Brand" from select facet modal window
  And I select "1888 Mills" from Select Value(s) scroll list
  And I click the "select facet Ok" button
  And I click "Add Facet" button for Display Pattern option
  And I Checked "<values>" from select facet modal window
                | Fabric              |
                | Brand               |
                | Product Type        |
                | Accessories Type    |
                | Active Apparel Type |
                | Age                 |
  And I checked "Add Text to Autosuggest Phrase" checkbox				
  And I click "Ok"button
  And I select "Primary_Form_Normal" from "Select Synatx" for "Brand" facet
  And I select "Primary_Form_Noun_Compound_Plural" from "Select Synatx" for "Product Type" facet
  And I select "Primary_Form_Noun_Mod" from "Select Synatx" for "Accessories Type" facet
  And I select "Primary_Form_Noun_Plural" from "Select Synatx" for "Active Apparel Type" facet
  And I select "Primary_Form_Noun_Possessive" from "Select Synatx" for "Age" facet   
  And I see "<following value>" in Select Text pull pull down
              | SelectText  |
              | in          |
              | for         |
              | by          |
              | -           |
  And I select "in" from "Select Text" for Text type
  And I click "save button" for creating rule
Then I should be on "Autocomplete Suggestion Rules" list page
 And I should see "rulename" in "Suggestion Rule" column
 #And I should see "superbauser" in "Created By" column
 And I should see "today date" in "Creation Date" column
 #And I should see "superbauser" in "Modified By" column
 And I should see "today date " in "Modified Date" column
 And I should see "OFF" in Published column
 And I should see "Delete" link under action column

@BAT_Extend_Mcom
Scenario: As a user I am able to Add,edit and delete the exception for Add exception type
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
When I click the "Add Exception" button
  And I select "Add from Exception Type drop down"
  And I enter "any value for Add in Display Phrase text field"
  #And I enter "1000 in Rank text field"  
  And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"
	And I should see "value that entered for Add in Exception Phrase column"
	And I should see "Add in Type column"
	And I should see "1000000 in Rank column"
	And I should see "OFF in Published column"
When I "click the ID link for Exception pharse in list view page"
Then I should see "Add Exception child window"
When I edit the "display phrase text for Add" in Display Phrase text field
     And I edit the "rank value for Add as 1000" in Rank field
     And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"   
    And I should see "new value that updated for Add in Exception Phrase column"
	And I should see "Add in Type column"
	And I should see "1000 in Rank column"
	And I should see "OFF in Published column"	
When I "delete the exception which was created in the above steps"
Then I should see "alerts as Are you sure you want to delete this exception?"
When I "click on OK button"
Then I should not see "Add Exception with this display phrase text in listexception page" 
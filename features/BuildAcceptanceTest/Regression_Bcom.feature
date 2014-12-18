@capybara
Feature: To test whether the build is acceptable or not

@regression_bcom
Scenario: As a user I am able to Add,edit and delete the exception for Rank exception type 
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
When I click the "Add Exception" button
  And I select "Rank from Exception Type drop down"
  And I enter "pre-defined value for Rank in Display Phrase text field"
  And I enter "1000 in Rank text field"  
  And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"
	And I should see "value that entered for Rank in Exception Phrase column"
	And I should see "Rank in Type column"
	And I should see "1000 in Rank column"
	And I should see "OFF in Published column"
When I "click the ID link for Exception pharse in list view page"
Then I should see "Add Exception child window"
When I edit the "display phrase text for Rank" in Display Phrase text field
     And I edit the "rank value for Rank as 100000" in Rank field
#When I "update the display phrase text and rankvalue for Rank which are created in the above steps"
   And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"   
    And I should see "new value that updated for Rank in Exception Phrase column"
	And I should see "Rank in Type column"
	And I should see "100000 in Rank column"
	And I should see "OFF in Published column"	
When I "delete the exception which was created in the above steps"
Then I should see "alerts as Are you sure you want to delete this exception?"
When I "click on OK button"
Then I should not see "Rank Exception with this display phrase text in listexception page" 

@regression_bcom
Scenario: As a user I am able to Add,edit and delete the exception for Suppress exception type
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
When I click the "Add Exception" button
  And I select "Suppress from Exception Type drop down"
  And I enter "pre-defined value for Suppress in Display Phrase text field"
  And I enter "10000 in Rank text field"  
  And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"
	And I should see "value that entered for Suppress in Exception Phrase column"
	And I should see "Suppress in Type column"
	And I should see "OFF in Published column"
When I "click the ID link for Exception pharse in list view page"
Then I should see "Add Exception child window"
When I edit the "display phrase text for Suppress" in Display Phrase text field
   And I edit the "rank value for Suppress as 100000" in Rank field
#When I "update the display phrase text and rankvalue for Suppress which are created in the above steps"
   And I click the "add exception Ok" button
Then I should see "Suggestion Execeptions list page"   
    And I should see "new value that updated for Suppress in Exception Phrase column"
	And I should see "Suppress in Type column"
	And I should see "OFF in Published column"	
When I "delete the exception which was created in the above steps"
Then I should see "alerts as Are you sure you want to delete this exception?"
When I "click on OK button"
Then I should not see "Suppress Exception with this display phrase text in listexception page"

@regression_bcom
Scenario: As a User I am able to verify all the error validation & not able to delete if cancel
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
Then I should see "Suggestion Execeptions list page"
    And I should see "listing page enabled"
When I click the "Add Exception" button
    And I click the "Add Exception Ok" button
Then I should see "alerts as Exception Display is required" 
When I enter "display phase value for Add in Display Phrase text field" 
   And I click the "Add Exception Ok" button	
Then I should see "Suggestion Execeptions list page"
    And I should see "Add Exception button enable"
    And I should see "exception added for Add in Exception Phrase column"
	And I should see "Add in Type column"
When I "delete the exception which was created in the above steps"
Then I should see "popup as Are you sure you want to delete this exception?"
When I click the "Popup Cancel" button 
Then I should see "Suggestion Execeptions list page"	
When I click the "Add Exception" button
 And I enter "duplicate Add value in Display Phrase text field"
 And I click the "Add Exception Ok" button
Then I should see "alerts as This Phrase already exists" 
When I enter "duplicate Rank value in Display Phrase text field"
  And I select "Rank from Exception Type drop down" 
And I click the "Add Exception Ok" button 
Then I should see "alerts as Rank is required"   
When I enter "10000 in Rank text field"
  And I click the "Add Exception Ok" button 
Then I should see "alerts as This Phrase already exists"
When I enter "undefined values for Rank in Display Phrase text field"
   And I click the "Add Exception Ok" button
Then I should see "alerts as This Phrase does not exist. Please Add this phrase to Rank it"    
When I select "Suppress from Exception Type drop down" 
 And I enter "duplicate Suppress value in Display Phrase text field"
And I click the "Add Exception Ok" button 
Then I should see "alerts as This Phrase already exists"
When I enter "undefined values for Suppress in Display Phrase text field"
And I click the "Add Exception Ok" button
Then I should see "alerts as This Phrase does not exist. Please Add this phrase to Suppress it" 
And I should see "Suggestion Execeptions list page" 

@regression_bcom
Scenario: As a user I am able to sort all the columns except delete column in rules listing page
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Rules" button
Then I should see "Suggestion Rule list page"
When I sort "Template ID" column in suggestion exception listing page
Then I should see "Template ID" column in ascending order 
When I sort "Template ID" column from ascending order
Then I should see "Template ID" column in descending order
When I sort "Suggestion Rule" column in suggestion exception listing page
Then I should see "Suggestion Rule" column in ascending order 
When I sort "Suggestion Rule" column from ascending order
Then I should see "Suggestion Rule" column in descending order
When I sort "Created By" column in suggestion exception listing page
Then I should see "Created By" column in ascending order 
When I sort "Created By" column from ascending order
Then I should see "Created By" column in descending order
When I sort "Creation Date" column in suggestion exception listing page
Then I should see "Creation Date" column in ascending order 
When I sort "Creation Date" column from ascending order
Then I should see "Creation Date" column in descending order
When I sort "Modified By" column in suggestion exception listing page
Then I should see "Modified By" column in ascending order 
When I sort "Modified By" column from ascending order
Then I should see "Modified By" column in descending order
When I sort "Modified Date" column in suggestion exception listing page
Then I should see "Modified Date" column in ascending order 
When I sort "Modified Date" column from ascending order
Then I should see "Modified Date" column in descending order

@regression_bcom
Scenario: As a user able to search a Exception by exception filter and should see all the exceptions if click on clear link
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
Then I should see "Suggestion Execeptions list page"
Then I should see "complete exception listing page"
When I select "ID from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Exception Phrase from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Creator from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Create Date from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Modifier from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Modify Date from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"
When I select "Published from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I "click the exception clear link"
Then I should see "all the exception in Suggestion Execeptions list page"

@regression_bcom
Scenario: As a user I am able to verify verious error message on Suggestion Execeptions list page
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
Then I should see "Suggestion Execeptions list page"
When I select "ID from select filter drop down"
  And I click the "GO" button
Then I should see "alert as Filter value must be 1 character or more"
And I enter "non existing phasre as testingron in search text field"  
  And I click the "GO" button
Then I should see "message as No results found"
When I select "Create Date from select filter drop down"  	
  And I click the "GO" button
Then I should see "alert as Please enter the date in mm/dd/yyyy format"
           
@regression_bcom           
Scenario: As a user I am able to select specific countries from select Countries list box in rule create page
Given I have logged into Saturn as a Merchandise Manager
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
	And I enter "Effective Date as 12/12/2012"
	And I enter "Expiration Date as 12/12/2013"
    And I enter description as "Automation test"
    And I click "Specific Countries" radio button 
Then I should see "Select Countries list box"
When I select specifc countries from select list box
              | Anguilla            |
              | Antigua And Barbuda |
              | India               |
              | Netherlands         |
              | Switzerland         |
   And I click select countries "Ok" button
   And I click "Browse" check box
   And I click the "Save rule" button
Then I should see "Rule Detail page"
    And I should see rulename as "newrule"
    And I should see "12/12/2012 as Effective Date"
    And I should see "12/12/2013 as Expiration Date"
    And I should see "SuperBAUser as Owner"
    And I should see description as "Automation test"
    And I should see specific countries in Country Code panel
              | Anguilla            |
              | Antigua And Barbuda |
              | India               |
              | Netherlands         |
              | Switzerland         |

@regression_bcom
Scenario: As a user I am able to search a Exception by exception filter
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
Then I should see "Suggestion Execeptions list page"
When I select "ID from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Exception Phrase from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Creator from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Create Date from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Modifier from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Modify Date from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"
When I select "Published from select filter drop down"
  And I enter "exception filter value"
  And I click the "GO" button
Then I should see "Seach results for specified filter value"	

@regression_bcom
Scenario: As a User I am able to see three types of exception and Add exception by default in pull down
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
When I click the "Add Exception" button
Then I should see "Add Autocomplete Exception page"
Then I should "see following Exception Types in pull down"
                  | Exception_Type |
                  | Add            |
                  | Rank           |
                  | Suppress       |
    And I should see "Add exception by default in pull down"
	And I should see "Publish Flag checked by default"

@regression_bcom 
Scenario: As a user I am able to see following options in select filter drop down
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Rules" button
Then I should see "Suggestion Rule list page"
When I click the "select filter drop down" button
Then I should "see following option in rules drop down"
                  | Search_Rules    |
                  | ID              |
                  | Rule Name       |
                  | Rule Applied To |
                  | Created By      |
                  | Creation Date   |
                  | Modified By     |
                  | Modified Date   |

@regression_bcom     
Scenario: As a user I am able to sort all the columns except delete column
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
And I click the "Suggestion Exceptions" button
Then I should see "Suggestion Execeptions list page"
When I sort "ID" column in suggestion exception listing page
Then I should see "ID" column in ascending order 
When I sort "ID" column from ascending order
Then I should see "ID" column in descending order
When I sort "Exception Phrase" column in suggestion exception listing page
Then I should see "Exception Phrase" column in ascending order 
When I sort "Exception Phrase" column from ascending order
Then I should see "Exception Phrase" column in descending order
When I sort "Type" column in suggestion exception listing page
Then I should see "Type" column in ascending order 
When I sort "Type" column from ascending order
Then I should see "Type" column in descending order
When I sort "Rank" column in suggestion exception listing page
Then I should see "Rank" column in ascending order 
When I sort "Rank" column from ascending order
Then I should see "Rank" column in descending order
When I sort "Created By" column in suggestion exception listing page
Then I should see "Created By" column in ascending order 
When I sort "Created By" column from ascending order
Then I should see "Created By" column in descending order
When I sort "Creation Date" column in suggestion exception listing page
Then I should see "Creation Date" column in ascending order 
When I sort "Creation Date" column from ascending order
Then I should see "Creation Date" column in descending order
When I sort "Modified By" column in suggestion exception listing page
Then I should see "Modified By" column in ascending order 
When I sort "Modified By" column from ascending order
Then I should see "Modified By" column in descending order
When I sort "Modified Date" column in suggestion exception listing page
Then I should see "Modified Date" column in ascending order 
When I sort "Modified Date" column from ascending order
Then I should see "Modified Date" column in descending order
When I sort "Published" column in suggestion exception listing page
Then I should see "Published" column in ascending order 
When I sort "Published" column from ascending order
Then I should see "Published" column in descending order

@regression_bcom
@jregression_bcom_3.12_16878
Scenario: As a user I am able to see and add Price Type option in result set trigger drop down and able to add multiple price type value and i should see error message if we save result set trigger without value
Given I have logged into Saturn as a Merchandise Manager
When I click the "RULES from the global navigation bar" button
 And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter "rules name" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter "description"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
When I select "Result Set" from the trigger pulldown
 And I select attribute type "Price Type" from "ResultSetTrigger" dropdown     
Then I should see "Price Type Filter Groups and Specific Price Types"
 And I click the "save" button
Then I should see "alert as You must select > or <.,Please select at least one Price Type before saving the Trigger."
When I checked "Non Ticket,Clearance or Closeout,Perm Markdown,Non-clearance,Additional off perm,Promo Sale,Promo Event" from "Price Type Filter Groups" list box
Then I should see all the "Price type value" selected in "Specific Price Types" list box
 And I select ">" from logical pulldown 
 And I enter "75" in percentage filed
 And I click the "save trigger" button
 And I click the "edit trigger" button
 And I click the "clear selection" button
Then I should see unchecked "Non Ticket,Clearance or Closeout,Perm Markdown,Non-clearance,Promo Event" from "Price Type Filter Groups" list box
When I click the "cancel trigger" button
Then I should see previous "Specific Price Types selected"
When I click "Search" check box
 And I click the "Save rule" button 
Then I should see "Rule Detail page"
 And I should see "rules as created rules name" 
 And I should see "12/12/2012 as Effective Date"
 And I should see "12/12/2013 as Expiration Date"
 And I should see "SuperBAUser as Owner"
 And I should see "Rules creating with description as description"
 And I should see "Result Set as Trigger Type"
 And I should see logical operatos as ">"
 And I should see percentage as "75"
 And I should see all the "Price type value" selected in "Specific Price Types" list box
When I click the "editRule" button 
 And I click the "edit trigger" button         
 And I click the "clear selection" button
Then I should see unchecked "Non Ticket,Clearance or Closeout,Perm Markdown,Non-clearance,Additional off perm,Promo Sale,Promo Event" from "Price Type Filter Groups" list box
When I click the "cancel trigger" button
Then I should see previous "Specific Price Types selected"
When I click the "edit trigger " button
 And I Unchecked "Non Ticket,Clearance or Closeout,Perm Markdown,Non-clearance,Promo Event" in "Price Type Filter Groups" list box   
When I click the "save trigger" button
 And I click the "Save rule" button  
Then I should see "Rule Detail page"
 And I should see "rules as created rules name" 
 And I should see "12/12/2012 as Effective Date"
 And I should see "12/12/2013 as Expiration Date"
 And I should see "SuperBAUser as Owner"
 And I should see "Rules creating with description as description"
 And I should see "Result Set as Trigger Type"
 And I should see unchecked "Non Ticket,Clearance or Closeout,Perm Markdown,Non-clearance,Promo Event" from "Price Type Filter Groups" list box
 And I should see checked "Additional off perm,Promo Sale" from "Price Type Filter Groups" list box
 And I should see the related checked Price Type Filter Groups Price type value selected as "Additional Off Perm,Promo Sale Price" from "Specific Price Types" list box  
 
@regression_bcom 
@jregression_bcom_3.12_16046
Scenario: As a user add one or multiple Promo ID option and error validation for duplicate promos
Given I have logged into Saturn as a Merchandise Manager
When I click the "RULES from the global navigation bar" button
 And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter "rules name" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter "description"
  And I click the "Triggers" button
  And I click the "Add Trigger" button
When I select "Result Set" from the trigger pulldown
  And I select attribute type "Promo ID" from "ResultSetTrigger" dropdown 
  And I click the "save" button
Then I should see "alert as Please input the Promo IDs to save the trigger.,You must select > or <."
  And I enter attribute value "10808764,10808785,10809573" 
  And I select ">" from logical pulldown 
  And I enter "75" in percentage filed
  And I click the "save trigger" button
  And I click the "edit trigger" button
  When I clear the attribute value "10808764,10808785,10809573"
  And I enter attribute value "10808764,10808764"
Then I should see "alert as Duplicate attribute Value is not allowed."
When I clear the attribute value "10808764"
 And I enter attribute value "1233,33333,2222"
 And I click the "save" button
Then I should see "error message as '1233', '2222', '33333' are incorrect values for Promo ID, please enter valid values to save the Trigger"
When I click the "cancel trigger" button
 And I click "Search" check box
  And I click the "Save rule" button 
Then I should see "Rule Detail page"
     And I should see "rules as created rules name" 
     And I should see "12/12/2012 as Effective Date"
     And I should see "12/12/2013 as Expiration Date"
     And I should see "SuperBAUser as Owner"
     And I should see "Rules creating with description as description"
     And I should see "Result Set as Trigger Type"
     And I should see attribute type as "Promo ID" and attribute value as "10808764" 

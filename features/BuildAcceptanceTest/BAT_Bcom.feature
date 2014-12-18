@capybara
Feature: To test whether the build is acceptable or not

@BAT_Bcom
Scenario: As a user I am able to see and navaigte sub menus from Automcomplete menu
Given I have logged into Saturn as a Merchandise Manager
When I click the "AUTOCOMPLETE from the global navigation bar" button
Then I should see the sub menus under "AUTOCOMPLETE"
               | sub_menus              |
               | Suggestion Rules       |
               | Suggestion Exceptions  |
               | Vocabulary Bulk Upload |
               | Rules Bulk Upload      |
When I select "Vocabulary Bulk Upload" from the "AUTOCOMPLETE" dropdown
Then I should see "Vocabulary Bulk Upload" listing page
When I select "Rules Bulk Upload" from the "AUTOCOMPLETE" dropdown
Then I should see "Rule Bulk Upload" listing page
When I select "Suggestion Rules" from the "AUTOCOMPLETE" dropdown 
Then I should see "Autocomplete Suggestion Rules" listing page
When I select "Suggestion Exceptions" from the "AUTOCOMPLETE" dropdown
Then I should see "Autocomplete Exceptions" listing page

@BAT_Bcom
Scenario: As a user I am able to see and navaigte sub menus from Linguistics menu
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
Then I should see the sub menus under "LINGUISTICS"
               | sub_menus               |
               | Dictionaries            |
               | Terms                   |
               | Linguistics Bulk Upload |
When I select "Linguistics Bulk Upload" from the "LINGUISTICS" dropdown
Then I should see "Linguistics Bulk Upload" listing page
When I select "Dictionaries" from the "LINGUISTICS" dropdown
Then I should see "Dictionaries" listing page
When I select "Terms" from the "LINGUISTICS" dropdown
Then I should see "Terms" listing page

@BAT_Bcom
Scenario: As a user I am able to see and navaigte sub menus from Rules menu
Given I have logged into Saturn as a Merchandise Manager
When I click the "RULES from the global navigation bar" button
Then I should see the sub menus under "RULES"
               | sub_menus           |
               | Find Rules          |
               | Create Rule         |
When I select "Create Rule" from the "RULES" dropdown
Then I should see "Create Rule" listing page
When I select "Find Rules" from the "RULES" dropdown
Then I should see "Find Rules" listing page

@BAT_Bcom
Scenario Outline: As a User I am able to create a dictionary  
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "<dictionary name>" in the dictionary name field on the Add Dictionary modal window
    And I select "<dictionary type>" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then the Add Dictionary modal window is closed
	And I should see "<dictionary name>" in the Dictionary list
	And I should see "<dictionary type>" as the Dictionary Type
	
Examples:
 | dictionary name | dictionary type |
 | New_Dictionary  | MISCELLANEOUS   |

@BAT_Bcom
Scenario: As a saturn user, I should able to add relationship and designations with all operators
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "dictionary name" in the dictionary name field on the Add Dictionary modal window
    And I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	
When I click the Associated Relationships or Designations "Add" button
 And I create "<term1>" having "<relationship>" with "<term2>" and save the relation
 | Orange    | Equals           | Nector       |
 | Mango     | Similar          | fruit        |
 | Apple     | Do Not Associate | Oranges      |
 | Sofa      | One Way Synonym  | Couch        |
 | furniture | Hypernym         | coffee table |
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
 | orange    | Equals           | nector       |
 | mango     | Similar          | fruit        |
 | apple     | Do Not Associate | oranges      |
 | sofa      | One Way Synonym  | couch        |
 | furniture | Hypernym         | coffee table |
When I create "<term>" having "<designation>" and save the designation
 | channel       | Keep Original     |
 | run           | Stemming Override |
 | I want        | Stop Word         |
 | running shoes | Phrase            |
Then I should see "<term>" having "<designation>" created in dictionary detailed page
 | channel       | Keep Original     |
 | run           | Stemming Override |
 | i want        | Stop Word         |
 | running shoes | Phrase            |

@BAT_Bcom
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
  And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"
  And I should see "Trigger type as Keyword"
  And I should see "Trigger attribute value as ck in the keywords field"
 
@BAT_Bcom  
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
   And I should see the "Owner" as "SuperBAUser"
   And I should see the "description" as "Automation test"
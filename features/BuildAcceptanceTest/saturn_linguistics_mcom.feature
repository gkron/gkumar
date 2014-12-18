@capybara
Feature: To test whether the build is acceptable or not

@jregression_mcom_ling
Scenario: As a saturn user, I should able to add,delete and cancel the relationship and designations with all operators
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
    And I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	
And I should see dictionary type "BRAND"
When I edit the dictionary type as "COLOR"
  And I edit the dictionary name as "new_edit_dic_name"
Then I should see dictionary type "COLOR"
  And I should see dictionary name "new_edit_dic_name"
When I click the Associated Relationships or Designations "Add" button
 And I create "<term1>" having "<relationship>" with "<term2>" and save the relation
 | Mango     | Similar          | fruit        |
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
 | mango     | Similar          | fruit        |
  And I should see "dictionary type" is disabled
When I click the "Associated Relationships delete" button
Then I should see "popup as Delete this relationship/designation ?"
When I click the "Popup Cancel" button 
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
 | mango     | Similar          | fruit        |
When I click the "Associated Relationships delete" button
Then I should see "popup as Delete this relationship/designation ?"
When I click the "Popup Ok" button 
Then I should see "No Associated Relationships records"
When I edit the dictionary type as "BRAND"
Then I should see dictionary type "BRAND"
When I create "<term>" having "<designation>" and save the designation
 | channel       | Keep Original     |
Then I should see "<term>" having "<designation>" created in dictionary detailed page
 | channel       | Keep Original     |
 And I should see "dictionary type" is disabled
When I click the "Associated Relationships delete" button
Then I should see "popup as Delete this relationship/designation ?"
When I click the "Popup Cancel" button  
Then I should see "<term>" having "<designation>" created in dictionary detailed page
 | channel       | Keep Original     |
When I click the "Associated Relationships delete" button
Then I should see "popup as Delete this relationship/designation ?"
When I click the "Popup Ok" button 
Then I should see "No Associated Relationships records"
 And I should see dictionary type "BRAND"
When I edit the dictionary type as "COLOR"
Then I should see dictionary type "COLOR"

@jregression_mcom_ling
Scenario: As a User I able to filter by operator inside of a dictionary by all operators available
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
    |	blue			|	Equals				|	cyan				|	
	|	orange			|	Equals				|	Naranjas			|	
	|	okra			|	Equals				|	bhindi				|	
	|	after shave		|	Similar				|	after shave lotion	|   
	|	antipersparant	|	Similar				|	deodarant 			|	
	|	croc			|	Do Not Associate	|	crock				|	
	|	Dress			|	Do Not Associate	|	Dressing			|	
	|	Pocket			|	Do Not Associate	|	Pouch				|	
	|	Slippers		|	Do Not Associate	|	Bootie				|	
	|	furniture		|	Hypernym			|	coffee table		|	
	|   antiwrinkle		|	Hypernym			|	wrinkle				|	
	|   cosmetic		|   Hypernym			|	nail enamel			|	
	|   makeup			|   Hypernym			| 	Mascara				|
	|   sofa            | One Way Synonym       |   couch               |	
When I create "<term>" having "<designation>" and save the designation
    |   I Want			|	Stop Word			|							
	|   Find			|	Stop Word		 	|							
	|	sunny			|	Stemming Override	|							
	|	running			|	Stemming Override	|							
	|	axis			|	Keep Original		|							
	|	channel			|  	Keep Original		|							
	| alexandar mcquine	|	Phrase				|
Then I should see following "<elements>" in filter by pulldown in Terms page
    |	Equals				|
	|	Similar				|
	|	Keep Original		|
	|	Do Not Associate	|
	|	Stemming Override	|
	|	Stop Word			|
	|	One Way Synonym		|
	|	Phrase				|
	|	Hypernym			|
When I select the "<operator>" from Filter by pulldown and check the "<relationshipcount>"
	|	Equals				|3|
	|	Similar				|2|
	|	Keep Original		|2|
	|	Do Not Associate	|4|
	|	Stemming Override	|2|
	|	Stop Word			|2|
	|	One Way Synonym		|1|
	|   Phrase              |1|
	|   Hypernym            |4|
When I search for the "<terms>" from terms entry filed and check
  | blue          | 
  | after shave   |   
  | croc          | 
  | furniture     | 
  | i want        |
  | sunny         |
  | axis          |
When I search the "terms" by calling the "<operator>" from Filter by pulldown and enter "<terms>"
    |	Equals				|blue               |
	|	Similar				|after shave        |
	|	Keep Original		|axis               |
	|	Do Not Associate	|croc               |
	|	Stemming Override	|sunny              |
	|	Stop Word			|i want             |
	|	One Way Synonym		|sofa               |
	|   Phrase              |alexandar mcquine  |

@jregression_mcom_ling
Scenario: As a User I am able to edit a relationship and designations containing in a dictionary 
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
  | Mango     | Do Not Associate  | fruit        |
  |	after shave		|	Similar				|	after shave lotion	|
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
  | mango     | Do Not Associate  | fruit        |
  |	after shave		|	Similar				|	after shave lotion	| 
When I edit "<term1old>" as "<term1new>" having relationship "<operatorold>" as "<operatornew>" with "<term2old>" as "<term2new>" 
   |	 mango	        |	orange	        |	Do Not Associate	    |	Equals	|	fruit	            |	lemons	            | 
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   | orange     | Equals | lemons        |
When I create "<term>" having "<designation>" and save the designation
   |	channel				|	Keep Original		|
Then I should see "<term>" having "<designation>" created in dictionary detailed page
   | channel       | Keep Original     |     
When I edit the designation with "<termold>" as "<termnew>" having relationship "<operatorold>" as "<operatornew>"
   |	channel		|	oxygen	|	Keep Original	|	Stemming Override	|  
Then I should see "<term>" having "<designation>" created in dictionary detailed page
   | oxygen       | Stemming Override     |       
When I edit the relationship into a designation with "<term1>" having "<operator>" relationship with "<term2>" as "<term1>" having "<designation>" and verify
   |	after shave	|	Similar	|	after shave lotion	|	after shave	|	Keep Original|
Then I should see "<term>" having "<designation>" created in dictionary detailed page
   | after shave       | Keep Original     |      
When I edit the designation into a relationship with "<term>" having "<operator>" designation as "<term1>" and "<term2>" having "<relationship>" and verify
   | after shave       | Keep Original     |  after shave| after shave lotion|Similar|
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
  | after shave     | Similar  | after shave lotion |
When I edit "<term1old>" as "<term1new>" having relationship "<operatorold>" as "<operatornew>" with "<term2old>" as "<term2new>" 
   |	after shave	        |	cancel1        |	Similar	    |	Equals	|	after shave lotion	            |	cancel2   |
  And I cancel the "editing relationship"
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
  | after shave     | Similar  | after shave lotion |    
When I edit the designation with "<termold>" as "<termnew>" having relationship "<operatorold>" as "<operatornew>"
   |	oxygen		|	cancel12	|	Stemming Override	|	Keep Original	|  
  And I cancel the "editing relationship"
Then I should see "<term>" having "<designation>" created in dictionary detailed page
   | oxygen       | Stemming Override     |    

@jregression_mcom_ling
Scenario: As a User I am able to navigate to terms page from term search results page and able to sort all columns
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I search for the Dictionary Terms with "a"
 And I click the "Return to Terms" button
Then I should see the following "<elements>" as table columns in "Terms" page
	|	Dictionary Name				|
	|	Type						|
	|	Term1						|
	|	Designation / Relationship	|
	|	Term2						|
	|	Action(s)					|
  And I should see "Dictionary Name" column in ascending order
  And I should see "Action(s) not sortable"	
When I sort "Type" column in terms listing page
Then I should see "Type" column in ascending order 
When I sort "Type" column from ascending order
Then I should see "Type" column in descending order
When I sort "Term1" column in terms listing page
Then I should see "Term1" column in ascending order 
When I sort "Term1" column from ascending order
Then I should see "Term1" column in descending order
When I sort "Designation / Relationship" column in terms listing page
Then I should see "Designation / Relationship" column in ascending order 
When I sort "Designation / Relationship" column from ascending order
Then I should see "Designation / Relationship" column in descending order
When I sort "Term2" column in terms listing page
Then I should see "Term2" column in ascending order 
When I sort "Term2" column from ascending order
Then I should see "Term2" column in descending order

@jregression_mcom_ling
Scenario: As a User I am able to add,delete,cancel,edit and search a relationship and designations from term search results page
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
    And I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	 
When I click the "LINGUISTICS" from the global navigation bar
   And I click the "Terms" button 
When I click the "terms page Add" button
When I choose dictionary name as "edit_rel_term_search" and dictionary type as "BRAND" from model window and enter term as "Mango" term as "fruit" and relationship as "Equal"
When I click the "LINGUISTICS" from the global navigation bar
   And I click the "Terms" button 	
When I click the "terms page Add" button
When I choose dictionary name as "edit_rel_term_search" and dictionary type as "BRAND" from model window and enter term as "abc" and designation as "Keep Original"
When I click the "LINGUISTICS" from the global navigation bar
   And I click the "Terms" button 
Then I should see following "<elements>" in filter by pulldown in Terms page
    |	Equals				|
	|	Similar				|
	|	Keep Original		|
	|	Do Not Associate	|
	|	Stemming Override	|
	|	Stop Word			|
	|	One Way Synonym		|
	|	Phrase				|
	|	Hypernym			|
When I select the relationship from filter by dropdown with terms and check the "<terms>" having relationship with "<relationship>"
	|	mango			|	Equals				|	fruit				|	
When I search for the Dictionary Terms with "mango"
Then I should see search results containing "mango" term across all dictionaries 
When I click the "Edit" link for relationship as "mango" is "Equals" to "fruit" in dictionary "edit_rel_term_search"      
When I edit "<term1old>" as "<term1new>" having relationship "<operatorold>" as "<operatornew>" with "<term2old>" as "<term2new>" 
   |	 mango	        |	orange	        |	Equals	    |	Do Not Associate	|	fruit	            |	lemons	            | 
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   | orange     | Do Not Associate | lemons        |
When I edit "<term1old>" as "<term1new>" having relationship "<operatorold>" as "<operatornew>" with "<term2old>" as "<term2new>" 
   |	orange	        |	cancel1        |	Do Not Associate	    |	Equals	|	lemons	            |	cancel2   |
  And I cancel the "editing relationship"
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   | orange     | Do Not Associate | lemons        |
When I search for the "<terms>" from terms entry filed and check
  | orange          | 
When I search the "terms" by calling the "<operator>" from Filter by pulldown and enter "<terms>"
    |	Do Not Associate				| orange    |  
When I click the "LINGUISTICS" from the global navigation bar
   And I click the "Terms" button 
When I search for "orange" with "Do Not Associate" from terms page
Then I should see "orange" terms related listings with relationship "Do Not Associate"
When I clear the term and enter "lemons" in place of "orange" with relationship "Do Not Associate" 
Then I should see "lemons" terms related listings with relationship "Do Not Associate"
When I search for the Dictionary Terms with "orange"
Then I should see search results containing "orange" term across all dictionaries
When I click the "Delete" link for relationship as "orange" is "Do Not Associate" to "lemons" in dictionary "edit_rel_term_search"
When I click the "Popup Cancel" button
When I click the "Delete" link for relationship as "orange" is "Do Not Associate" to "lemons" in dictionary "edit_rel_term_search"
When I click the "Popup Ok" button
Then I should see "edit_rel_term_search" dictionary details page
Then I should not see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   | orange     | Do Not Associate | lemons        |

@jregression_mcom_ling
Scenario: Error message validation for missing fields/invalid data to save the designation/relationship
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "Global Search Go" button
Then I should see "alert as Search value must be at least 1 character"
 And I click the "Ok" button on popup
When I select the "Dictionary Names" from global search
When I click the "Go" button with enter unknown value as "dic_name_fhjhsb"
Then I should see "No Records" in "dictionary" page
When I select the "Dictionary Terms" from global search
When I click the "Go" button with enter unknown value as "term_name_hgfdjhj"
Then I should see "No Records" in "term" page
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I click the "Dictionary Save" button
Then I should see "alert as Name is required,Type is required"
 And I click the "Ok" button on popup
When I enter "edit_rel_term_search" in the dictionary name field
 And I click the "Dictionary Save" button
Then I should see "alert as Type is required"
 And I click the "Ok" button on popup 
When I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	
When I click the "Go" button without enter terms
Then I should see "alert as Filter value must be at least 1 character"
 And I click the "Ok" button on popup
When I click the "Go" button with enter non exist "term-nfklseiuberj"
Then I should see "No Associated Relationships records"
When I click the "Associated relationships/designation Add" button
When I click the "Associated relationships/designation Save" button
Then I should see "alert as Term 1 is required,Term 2 is required,Relationship/Designation is required"
 And I click the "Ok" button on popup
When I enter "term1" in the add relationship designation window
When I click the "Associated relationships/designation Save" button
Then I should see "alert as Term 2 is required,Relationship/Designation is required"
 And I click the "Ok" button on popup
When I enter "term2" in the add relationship designation window
When I click the "Associated relationships/designation Save" button
Then I should see "alert as Relationship/Designation is required"
 And I click the "Ok" button on popup 
When I selet the Relationship Designation as "Keep Original" 
When I click the "Associated relationships/designation Save" button
When I click the "Associated relationships/designation Edit" button
When I selet the Relationship Designation as "Equals" 
When I click the "Associated relationships/designation Save" button
Then I should see "alert as Term 2 is required"
 And I click the "Ok" button on popup 
When I selet the Relationship Designation as "Hypernym"
When I enter "term2" in the add relationship designation window
When I click the "Associated relationships/designation Save" button
Then I should see "Invalid relationship error message as Invalid Input - The relationship you are trying to create is invalid because there is an opposite hypernym relationship already existing in the system"

@jregression_mcom_ling
Scenario: As a User, I am able to sort the dictionaries, search for dic, navigate to Individual dic detail page,add a dic from the search Dictionary Name page
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
Then I should see the following "<elements>" as table columns in "Dictionary" page
	|	Dictionary Name				|
	|	Dictionary Type				|
	|	Action(s)					|
  And I should see "Dictionary Name" column in ascending order
  And I should see "Action(s) not sortable"	
When I sort "Dictionary Name" column from ascending order 
Then I should see "Dictionary Name" column in descending order
When I sort "Dictionary Type" column in terms listing page
Then I should see "Dictionary Type" column in ascending order 
When I sort "Dictionary Type" column from ascending order 
Then I should see "Dictionary Type" column in descending order
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
 And I select "BRAND" from dictionary type pulldown
 And I click the dictionary "Save" button 
Then I should see Dictionary detail page	 
When I search for "edit_rel_term_search" from global search
Then I should see dictionaries list filtered by "edit_rel_term_search" 
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window  
When I enter "edit_rel_term_search" in the dictionary name field
 And I select "BRAND" from dictionary type pulldown
 And I click the dictionary "Save" button 
Then I should see "edit_rel_term_search dictionary detail page"

@jregression_mcom_ling
Scenario: As a User I am able to create same dictionaries,cyclical relationships and rules across tenants
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
    And I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	
When I click the Associated Relationships or Designations "Add" button
 And I create "<term1>" having "<relationship>" with "<term2>" and save the relation
 	|	furniture		    |	Hypernym			|	coffee table		    |
    |	saturnqa		    |	Equals			    |	saturntest				|
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   	|	furniture		    |	Hypernym			|	coffee table		    |
    |	saturnqa		    |	Equals			    |	saturntest				|
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click "Browse" check box 
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"    	
When I have logged into Bcom Saturn as a "Merchandise Manager"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
  And I select "BRAND" from dictionary type pulldown
  And I click the dictionary "Save" button 
Then I should see Dictionary detail page
When I create "<term1>" having "<relationship>" with "<term2>" and save the relation in "BCOM"
 	|	coffee table		|	Hypernym			|	furniture |
Then I should see "<term1>" having "<relationship>" with "<term2>" created in dictionary detail page
   	|	coffee table		|	Hypernym			|	furniture		| 
When I search for the Dictionary Terms with "saturnqa"
Then I should see "No records in the search results" 
When I click the "RULES" from the global navigation bar
And I click the "Create Rule" button
Then I should see "Create Rule page"
When I enter rulename as "newrule" 
  And I enter "Effective Date as 12/12/2012"
  And I enter "Expiration Date as 12/12/2013"
  And I enter description as "Automation test"
  And I click "Search" check box 
  And I click the "Save rule" button
Then I should see "Rule Detail page"
  And I should see rulename as "newrule" 
  And I should see "12/12/2012 as Effective Date"
  And I should see "12/12/2013 as Expiration Date"
  #And I should see "SuperBAUser as Owner"
  And I should see description as "Automation test"  		

@jregression_mcom_ling_1_110914422
Scenario: As a user when I type 2 letters or more letters in the global search for dictionary name I get the autosuggest
Given I have logged into Saturn as a Merchandise Manager
Then I should see "Home page"
When I click the "LINGUISTICS" from the global navigation bar 
  And I click the "Dictionaries" button
Then I should see "Dictionaries" listing page
When I click the Dictionary "Add" button
Then I should see the Add Dictionary modal window
When I enter "edit_rel_term_search" in the dictionary name field
    And I select "BRAND" from dictionary type pulldown
	And I click the dictionary "Save" button 
Then I should see Dictionary detail page	
When I search the "Dictionary Names" from global search with "<dicname>"  
  |e|
  |ed|
  |edi|
  |edit| 
When I click the "View Details" link in dictionary page
When I click the Associated Relationships or Designations "Add" button
 And I create "<term1>" having "<relationship>" with "<term2>" and save the relation
    |	blues			|	Equals				|	cyan				|	
	|	bluedress		|	Similar				|	after shave lotion	|   
	|	antipersparants	|	Similar				|	bluecolor 			|	
	|	Dresss			|	Do Not Associate	|	Dressing			|	
	|   antiwrinkles	|	Hypernym			|	wrinkle				|	
	|   makeups			|   Hypernym			| 	Mascara				|
	|   makesofa        | One Way Synonym       |   couch               |	
When I search the "Dictionary Terms" from global search with "<terms>"  
  |b|
  |bl|
  |ant|
  |make|


@jregression_mcom_ling
Scenario: As a user I am able to create hypernym relationship with various arrugument	
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "Dictionary name"
  And I select "Dictionary type"
  And I "click the save button for creating dictionary"
Then I should see "dictionary detailed page"
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | a     | b     | 0           |
               | b     | c     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | a     | d     | 0           |
               | b     | f     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
	
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | b     | g     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | c     | h     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
		
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | c     | i     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | d     | j     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | c     | k     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | f     | l     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | f     | m     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | f     | n     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | i     | o     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | i     | p     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | j     | s     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | d     | hypernym     | s     | 1           |
 | a     | hypernym     | s     | 2           |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | j     | t     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | d     | hypernym     | t     | 1           |
 | a     | hypernym     | t     | 2           |
 | d     | hypernym     | s     | 1           |
 | a     | hypernym     | s     | 2           |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | j     | u     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | d     | hypernym     | u     | 1           |
 | a     | hypernym     | u     | 2           |
 | d     | hypernym     | t     | 1           |
 | a     | hypernym     | t     | 2           |
 | d     | hypernym     | s     | 1           |
 | a     | hypernym     | s     | 2           |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | k     | q     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | q     | 1           |
 | b     | hypernym     | q     | 2           |
 | a     | hypernym     | q     | 3           |
 | d     | hypernym     | u     | 1           |
 | a     | hypernym     | u     | 2           |
 | d     | hypernym     | t     | 1           |
 | a     | hypernym     | t     | 2           |
 | d     | hypernym     | s     | 1           |
 | a     | hypernym     | s     | 2           |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | k     | r     | 0           |
               
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | r     | 1           |
 | b     | hypernym     | r     | 2           |
 | a     | hypernym     | r     | 3           |
 | c     | hypernym     | q     | 1           |
 | b     | hypernym     | q     | 2           |
 | a     | hypernym     | q     | 3           |
 | d     | hypernym     | u     | 1           |
 | a     | hypernym     | u     | 2           |
 | d     | hypernym     | t     | 1           |
 | a     | hypernym     | t     | 2           |
 | d     | hypernym     | s     | 1           |
 | a     | hypernym     | s     | 2           |
 | c     | hypernym     | p     | 1           |
 | b     | hypernym     | p     | 2           |
 | a     | hypernym     | p     | 3           |
 | c     | hypernym     | o     | 1           |
 | b     | hypernym     | o     | 2           |
 | a     | hypernym     | o     | 3           |
 | b     | hypernym     | n     | 1           |
 | a     | hypernym     | n     | 2           |
 | b     | hypernym     | m     | 1           |
 | a     | hypernym     | m     | 2           |
 | b     | hypernym     | l     | 1           |
 | a     | hypernym     | l     | 2           |
 | b     | hypernym     | k     | 1           |
 | a     | hypernym     | k     | 2           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | j     | 1           |
 | b     | hypernym     | i     | 1           |
 | b     | hypernym     | h     | 1           |
 | a     | hypernym     | g     | 1           |
 | a     | hypernym     | f     | 1           |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | h     | 2           |
 | a     | hypernym     | i     | 2           |

@jregression_mcom_ling
Scenario: As a user I am not able to Create a duplicate hypernym within same dictionary type.
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "dictionary name as wish"
  And I select "dictionary type as OCCASION"
  And I "click on Save button for creating dictionary"
Then I should see "dictionary edit page"
When I "create a having hypernym relationship with b and verify"
Then I should see "relationship created"   
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "dictionary name as wish"
  And I select "dictionary type as OCCASION"
  And I "click on Save button for creating dictionary"
Then I should see "dictionary edit page"
When I "create a having hypernym relationship with b and verify"
Then I should see "duplicate relationship error message"

@jregression_mcom_ling
Scenario: As a user I am able to Create a duplicate hypernym within different dictionary type.
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "dictionary name as wish"
  And I select "dictionary type as OCCASION"
  And I "click on Save button for creating dictionary"
Then I should see "dictionary edit page"
When I "create a having hypernym relationship with b and verify"
Then I should see "relationship created"   
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "dictionary name as wish"
  And I select "dictionary type as BRAND"
  And I "click on Save button for creating dictionary"
Then I should see "dictionary edit page"
When I "create a having hypernym relationship with b and verify"
Then I should see "relationship created" 

@jregression_mcom_ling
Scenario: Delete then recreate same relationships and system will automatically update the calcualted relationships
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "Dictionary name"
  And I select "Dictionary type"
  And I "click the save button for creating dictionary"
Then I should see "dictionary detailed page"
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | a     | b     | 0           |
                | a     | d     | 0           |
                | b     | c     | 0           |
                | d     | e     | 0           |
Then I should see "relationships are created"
  And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |
When I "try to delete a hypernym b"
Then I should see "relationships a hypernym b is  deleted"
     And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | e     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | a     | b     | 0           |
Then I should see "relationships are created"
  And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |

@jregression_mcom_ling
Scenario: Able to create hypernym relationships and test invalid hypernym relationships not created with two level tree
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "Dictionary name"
  And I select "Dictionary type"
  And I "click the save button for creating dictionary"
Then I should see "dictionary detailed page"
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | a     | b     | 0           |
               | a     | d     | 0           |
               | b     | c     | 0           |
               | d     | e     | 0           |
  
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |
	
When I "create a having hypernym relationship with b for checking duplicate relationship error"
	Then I should see "duplicate relationship error message"
When I "create c having hypernym relationship with a for checking Invalid relationship error"
	Then I should see "Invalid relationship error message"
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | a     | e     | 0           |
               | c     | d     | 0           |
               
Then I should see "relationships are created"
    And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |
 | c     | hypernym     | e     | 1           |
 | b     | hypernym     | d     | 1           |
 | b     | hypernym     | e     | 2           |
 | a     | hypernym     | d     | 2           |
 | a     | hypernym     | e     | 3           |

When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | c     | e     | 0           |
Then I should see "relationships are created"	
When I "create c having hypernym relationship with e for checking duplicate relationship error"
	Then I should see "duplicate relationship error message"
When I "create e having hypernym relationship with b for checking Invalid relationship error"
	Then I should see "Invalid relationship error message"		   

@jregression_mcom_ling
Scenario: Delete userdefined hypernym relationships and system will automatically delete the calcualted relationships
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "Dictionary name"
  And I select "Dictionary type"
  And I "click the save button for creating dictionary"
Then I should see "dictionary detailed page"
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | a     | b     | 0           |
                | a     | d     | 0           |
                | b     | c     | 0           |
                | d     | e     | 0           |
Then I should see "relationships are created"
  And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |
When I "try to delete a hypernym b"
Then I should see "relationships a hypernym b is  deleted"
     And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | e     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | c     | d     | 0           |
Then I should see "relationships are created"
   And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | e     | 1           |
 | c     | hypernym     | e     | 1           |
 | b     | hypernym     | d     | 1           |
 | b     | hypernym     | e     | 2           |
When I "try to delete d hypernym e"
Then I should see "relationships d hypernym e is  deleted"
   And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | b     | hypernym     | d     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | d     | e     | 0           |
Then I should see "relationships are created" 
When I "try to delete b hypernym c"
Then I should see "relationships b hypernym c is  deleted"
   And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | e     | 1           |
 | a     | hypernym     | e     | 1           |
When I "try to delete c hypernym d"
Then I should see "relationships c hypernym d is  deleted"
   And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | e     | 1           |
When I create "term1 having hypernym relationship with term2 and verify"
                | term1 | term2 | num_of_hops |
                | d     | c     | 0           |
Then I should see "relationships are created" 
   And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
 | a     | hypernym     | e     | 1           |

@jregression_mcom_ling
Scenario: User is only able to edit userdefined hypernym relationships
Given I have logged into Saturn as a Merchandise Manager
When I click the "LINGUISTICS from the global navigation bar" button
  And I click the "Dictionaries" button
Then I should see "dictionary listing page"
When I "click the Add button"
  And I enter "Dictionary name"
  And I select "Dictionary type"
  And I "click the save button for creating dictionary"
Then I should see "dictionary detailed page"
When I create "term1 having hypernym relationship with term2 and verify"
               | term1 | term2 | num_of_hops |
               | a     | b     | 0           |
               | b     | c     | 0           |
Then I should see "relationships are created"
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | a     | hypernym     | c     | 1           |
When I "try to edit b hypernym c as b hypernym a"
	Then I should see "Invalid relationship error message"
When I "try to edit b hypernym c as c hypernym a"
Then I should see "relationships are created"
    And I should see "a hypernym b as user defined relationship" 
    And I should see "c hypernym a as user defined relationship"   	
	And I should "see term1 is relationship of term2 and num of hops calculated relationships created in database"
 | term1 | relationship | term2 | num_of_hops |
 | c     | hypernym     | b     | 1           |
When I "try to edit a hypernym b as c hypernym a"
Then I should see "duplicate relationship error message"
When I "try to edit a hypernym b as c hypernym b"
Then I should see "a hypernym b as user defined relationship" 
     And I should see "c hypernym a as user defined relationship"
	
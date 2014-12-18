@pom 
Feature: To test whether the build is acceptable or not

@regression_bcom_pom
@jregression_bcom_16300_18463_4.4
Scenario: verify that user can filter the rules by Browse
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
Then I should see "All" as defult filter option
 And I should see "All,Search,Browse" filter options available in Merchandising Rules page
When I search "test" as "Rule Name" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Rule Name" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "mmuser" as "Creator" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Creator" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "data of creation" as "Created Date" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Created Date" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "mmuser" as "Modifier" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Modifier" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "data of updation" as "Modified Date" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Modified Date" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "start and end dates" as "Effective Date - Expiration Date" with "Browse" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Browse" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Effective Date - Expiration Date" in "find rules page"

@regression_bcom_pom
@jregression_bcom_16300_18463_4.4
Scenario: verify that user can filter the rules by Search
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
Then I should see "All" as defult filter option
 And I should see "All,Browse,Search" filter options available in Merchandising Rules page
When I search "test" as "Rule Name" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Rule Name" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "mmuser" as "Creator" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Creator" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "data of creation" as "Created Date" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Created Date" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "mmuser" as "Modifier" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Modifier" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "data of updation" as "Modified Date" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Modified Date" in "find rules page"
When I click "Find Rules" from "RULES"
When I search "start and end dates" as "Effective Date - Expiration Date" with "Search" as "filter view type" in "find rules page"
When I navigate to rule detail page by clicking one of rule id
Then I should see "navigation type" as "Search" in "rules detail page"
When I click Return to Merchandising Rule link
Then I should see "Merchandising Rules page with the previous filter selected" as "Effective Date - Expiration Date" in "find rules page"

@regression_bcom_pom
@jregression_18490_bcom_4.5
Scenario: As a user I am able to see 'Priority' column added in the Merchandising Rules Screen
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
Then I should see "Priority" as "column" in "Merchandising Rules listing page"
When I click "Priority" in "Merchandising Rules listing page"
Then I should see "rules sorted" as "Highest Priority to Lowest" in "Merchandising Rules listing page"
When I click "Priority" in "Merchandising Rules listing page"
Then I should see "rules sorted" as "Lowest Priority to Highest" in "Merchandising Rules listing page"

@jregression_Linguistics_bulk_upload
Scenario:Linguistics bulk upload 
Given I have logged into Saturn as a Merchandise user
When I upload file "Lingutics_Bulk_upload.xls"
Then I should see "Dictionary got created" with "uploaded excel sheet"
 And I should see "uploaded excel sheet" is equals to "dictionary in saturn UI"
When I upload file "LinguticsBulkupload_error_validation.xls"
Then I should see "<following errors>" messages 
                 |Empty dictionary name on row number 2|
                 |Invalid relationship type on row number 2|
                 |Absent first term for relationship on row number 3|
                 |Absent second term for this relationship type on row number 3|   

@jregression_rules_bulk_upload
Scenario:Rules bulk upload 
Given I have logged into Saturn as a Merchandise user
When I upload file "Rules_Bulk_Upload.xls"
Then I check rules bulk upload
Then I should see "1" record created in each table "auto_template,auto_template_filter,auto_template_syntax"

@jregression_rules_bulk_upload_error_validation
Scenario:Rules bulk upload error validation
Given I have logged into Saturn as a Merchandise user
When I upload file "RulesBulkUpload_error_validation.xls"
Then I should see "following rules bulk upload errors" messages 
                 |Row 2: rule filter name is blank.|
                 |Row 3: rule name is under three letters long.|
                 |Row 3: TEMPLATE_FILTER_VALUE is not a valid product type value.| 
                 |Row 3: SYNTAX_ATTR_PART_1 cannot be blank.|
                 |Row 3: SYNTAX_ATTR_PART_2 name is not blank, but the prior attribute is blank.|
                 |Row 3: rule rank basis is not a valid whole number.|
                 |Row 3: rule include synonym column must have Y, N, or be blank.|
                 |Row 3: publish column must have ON, OFF, or be blank.|
                 |Row 4: rule filter name is blank.|
                 |Row 4: SYNTAX_ATTR_PART_1 cannot be blank.|
                 |Row 4: SYNTAX_FORM_PART_1 cannot be blank.|

@jregression_Vocabulary_bulk_upload
Scenario:Linguistics bulk upload 
Given I have logged into Saturn as a Merchandise user
When I upload file "Vocabulary_Bulk1.xls"                 

@regression_bcom_pom
@jregression_4.7
@jregression_18639_4.7
@jregression_18639_19149_4.7_1_bcom
@jregression_pom_1
Scenario: Create Trigger Group Error Validation
Given I have logged into Saturn as a Merchandise user
Then I should see "following links" from "Rules navigation bar"
                   |Find Rules|
				   |Create Rule|
				   |Create Trigger Group|
When I click "Create Trigger Group" from "RULES"
When I save the "create trigger group page" with "with out trigger group name and no triggers"
Then I should see "following create trigger group errors" messages
      |Trigger Group name is required|
      |Save at least one trigger before saving the trigger group|
When I click "add trigger" in "create trigger group page"
When I save the "trigger" with "no triggers"      
Then I should see "following create trigger group errors" messages
     |Please select the Trigger Type before saving the Trigger|
When I select "Keyword" in "trigger dropdown"       
When I save the "trigger" with "keyword and no keyword values" 
Then I should see "following create trigger group errors" messages
     |Please input the keyword values to save the trigger.|
When I select "Keyword Pattern" in "trigger dropdown"       
When I save the "trigger" with "keyword Pattern and no attribute type and attribute values" 
Then I should see "following create trigger group errors" messages
     |Please input the keyword values to save the trigger.|
     |Please select the keyword pattern group type to save the Trigger.|
When I select "Result Set" in "trigger dropdown"       
When I save the "trigger" with "result set and no values" 
Then I should see "following create trigger group errors" messages
     |You must select > or <.|
     |Please select the attribute to save the Trigger.|
 When I select "Product Data Match" in "trigger dropdown"       
When I save the "trigger" with "product data match and no values" 
Then I should see "following create trigger group errors" messages
     |Please select the attribute to save the Trigger.|
When I select "Facet Refinement" in "trigger dropdown"       
When I save the "trigger" with "facet refinement and no values" 
Then I should see "following create trigger group errors" messages
     |Please select the Facet to save the Trigger.|                

@regression_bcom_pom
@jregression_4.7
@jregression_19149
@jregression_18639_19149_4.7_bcom
@jregression_pom_1

Scenario: create product data match trigger in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "product data match trigger dropdown"
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Dimension|
                  |Search_Color|
                  |Search_Style|
                  |Search_Type|
                  |Product Noun|
                  |Product Type|
                  |Brand|
When I create "product data macth trigger" with "Search_Type" and the value as "Mini Bags,Eye Treatments"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Occasion" and the value as "Day to Night,Evening/Formal"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Material" and the value as "glass,Wood"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Gender" and the value as "Adult,Child"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Style" and the value as "Relaxed,T-Shirt"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Noun" and the value as "Chip and Dip,Coffee Accessory"
When I select "<following resultset attributes>" from "product data match trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Search_Type|
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Style|
                  |Product Noun|
When I save the "product data match trigger" with "all attributes types"
Then I should see "product data match trigger saved" in "create trigger group"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "product data match triggers displayed" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "Adult" with "Female" from "pdm trigger" in "trigger group detail page"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Type" and the value as "Bed-in-a-Bag,Apparel"
When I select "<following resultset attributes>" from "product data match trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Search_Type|
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Style|
                  |Product Noun|
                  |Product Type|
When I save the "product data match trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "Cancel" in "Trigger Group Alert popup"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
When I click "Copy button" in "rules detail page"
When I replace "Wood" with "Silver" from "pdm trigger" in "trigger group detail page"
When I save the "product data match trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
Then I should see "trigger group name" as "Copy of rulestesting" in "trigger group detail page"
Then I should see "product data match triggers displayed" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Type,Mini Bags,Eye Treatments" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Occasion,Day to Night,Evening/Formal" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Material,Glass,Silver" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Gender,Female,Child" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Style,Relaxed,T-Shirt" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Product Noun,chip and dip,coffee accessory" in "trigger group detail page"
Then I should see "pdm attrubute type and attribute value" as "Product Type,Bed-in-a-Bag,Apparel" in "trigger group detail page"

@regression_bcom_pom
@jregression_4.7
@jregression_19149
@jregression_18639_19149_4.7_5_bcom
@jregression_pom_1
Scenario: create Keyword Pattern trigger in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword Pattern" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "keyword pattern trigger dropdown"
                  |Brand|
                  |Color|
                  |Customer Service|
                  |Gender|
                  |Material|
                  |Miscellaneous|
                  |Occasion|
                  |Product Line|
                  |Product Noun|
                  |Size|
                  |Special Size|
                  |Style|
When I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
#Then I should see "plusicon displayed" in "create trigger group page"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Customer Service" and the value as "CD Player,Multi-Purpose Pot"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Material" and the value as "glass,wood"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Product Noun" and the value as "Food Processor,makeup-brushes"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Style" and the value as "Wall Clock,T Shirt"
When I select "<following resultset attributes>" from "keyword pattern trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Customer Service|
                  |Material|
                  |Occasion|
                  |Product Noun|
                  |Style|
When I save the "keyword pattern trigger" with "all attributes types"
Then I should see "keyword pattern trigger saved" in "create trigger group page"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "tempur-pedic" with "Country Gentlemen" from "keyword pattern trigger" in "trigger group detail page"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Gender" and the value as "Female,Adult"
When I select "<following resultset attributes>" from "keyword pattern trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Customer Service|
                  |Material|
                  |Occasion|
                  |Product Noun|
                  |Style|
                  |Gender|
When I save the "keyword pattern trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "Cancel" in "Trigger Group Alert popup"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
When I click "Copy button" in "rules detail page"
When I replace "back to school/fall" with "men 50+" from "keyword pattern trigger" in "trigger group detail page"
When I save the "keyword pattern trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
Then I should see "trigger group name" as "Copy of rulestesting" in "trigger group detail page"
Then I should see "keyword pattern triggers displayed" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Brand,50 cent,country gentlemen" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Customer Service,cd player,multi-purpose pot" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Material,glass,wood" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Occasion,men 50+,evening" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Product Noun,food processor,makeup-brushes" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Style,wall clock,t shirt" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Gender,female,adult" in "trigger group detail page"

@regression_bcom_pom
@jregression_4.7
@jregression_18639_19149_4.7_6
@jregression_pom_1
Scenario: create result count in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Result Count" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "Result Count trigger dropdown"
                 |Less Than|
                 |Greater Than|
 And I should see "Less Than" as "selected by default" in "create trigger group page"
When I create "result count trigger" with "Greater Than" and the value as "2000"
When I save the "result count trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers" 
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "result cout type and value" as "Greater Than,2000" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I create "result count trigger" with "Less Than" and the value as "1000" 
When I save the "result count trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"                
When I click "Cancel" in "Trigger Group Alert popup"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "result cout type and value" as "Less Than,1000" in "trigger group detail page"
When I click "Copy button" in "rules detail page"
When I create "result count trigger" with "Greater Than" and the value as "2000"
When I save the "result count trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"                
Then I should see "result cout type and value" as "Greater Than,2000" in "trigger group detail page"

@regression_bcom_pom
@jregression_4.7
@jregression_19149
@jregression_18639_19149_4.7_8_bcom
@jregression_pom_1
Scenario: create facet refinement in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans,GUESS by Marciano"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
When I select "<following facets>" from "facet refinement trigger" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Product Color|
                  |Occasion|
When I save the "facet refinement trigger" with "all attributes types"
Then I should see "facet refinement trigger saved" in "create trigger group page"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "facets displayed" in "trigger group detail page"
Then I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger group detail page"
Then I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger group detail page"
Then I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger group detail page"
When I click "Copy button" in "rules detail page"
When I replace "Green" with "red" from "facet refinement trigger" in "trigger group detail page"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "Polo Jeans" with "Cache" from "facet refinement trigger" in "trigger group detail page"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Material" and the value as "glass,wood"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "Cancel" in "Trigger Group Alert popup"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "trigger group name" as "Copy of rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "facets displayed" in "trigger group detail page"
Then I should see "facet type and facet value" as "Brand,GUESS by Marciano,Cache" in "trigger group detail page"
Then I should see "facet type and facet value" as "Product Color,Gold,Red" in "trigger group detail page"
Then I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger group detail page"
Then I should see "facet type and facet value" as "Material,Glass,Wood" in "trigger group detail page"

@jregression_4.7
@jregression_18639_19149_4.7_7
@jregression_pom_1
Scenario: trigges invalid data error validation in create trigger group
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "product data match trigger"
                  |Search_Occasion|error1|
                  |Search_Material|error2|
                  |Search_Gender|error3|
                  |Search_Style|error6|
                  |Search_Type|error7|
                  |Product Noun|error8|
                  |Product Type|error9|
                  |Brand|error10|
When I save the "product data match trigger" with "all attributes types"
Then I should see "following attributes error" messages
    |'error9' is incorrect value for Product Type, please enter valid value to save the Trigger|
    |'error10' is incorrect value for Brand, please enter valid value to save the Trigger|
    |'error7' is incorrect value for Search_Type, please enter valid value to save the Trigger|
    |'error1' is incorrect value for Search_Occasion, please enter valid value to save the Trigger|
    |'error2' is incorrect value for Search_Material, please enter valid value to save the Trigger|
    |'error6' is incorrect value for Search_Style, please enter valid value to save the Trigger|
    |'error8' is incorrect value for Product Noun, please enter valid value to save the Trigger|
    |'error3' is incorrect value for Search_Gender, please enter valid value to save the Trigger|
When I select "Result Set" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "Result Set trigger"
                  |Product Noun|error1|
                  |Normal Color|error2|
                  |Product Type|error3|
                  |Brand|error6|
                  |Category|1234567|
                  |Promo ID|000012|
When I save the "Result set trigger" with "all attributes types"
Then I should see "following attributes error" messages
    |'error3' is incorrect value for Product Type, please enter valid value to save the Trigger|
    |'error6' is incorrect value for Brand, please enter valid value to save the Trigger|
    |'1234567' is incorrect value for Category, please enter valid value to save the Trigger|
    |'error2' is incorrect value for Normal Color, please enter valid value to save the Trigger|
    |'000012' is incorrect value for Promo ID, please enter valid value to save the Trigger|
    |'error1' is incorrect value for Product Noun, please enter valid value to save the Trigger|    
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "Facet Refinement trigger"
                  |Brand|error1|
                  |Product Color|error2|
                  |Material|error3|    
When I save the "facet refinement trigger" with "all attributes types"
Then I should see "following attributes error" messages
         |'error1' is incorrect value for Brand, please enter valid value to save the Trigger|
         |'error2' is incorrect value for Product Color, please enter valid value to save the Trigger|
         |'error3' is incorrect value for Material, please enter valid value to save the Trigger|

@regression_bcom_pom
@jregression_4.7
@jregression_18639_19149_4.7_9
@jregression_pom_1
Scenario: trigges with cancel and delete and edit 
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans"
When I save the "facet refinement trigger" with "all attributes types"
When I edit "facet refinement trigger" with "Brand" and the value as "Cache"
When I save the "facet refinement trigger" with "all attributes types"
Then I should see "facets displayed" in "trigger group detail page"
#Then I should see "facet type and facet value" as "Brand,Cache" in "trigger group detail page"
When I edit "facet refinement trigger" with "Product Color" and the value as "Gold"
When I cancel the "facet refinement trigger" with "all attributes types"
Then I should see "facets displayed" in "trigger group detail page"
#Then I should see "facet type and facet value" as "Brand,Cache" in "trigger group detail page"
When I delete the "facet refinement trigger" with "all attributes types"
Then I should see "<following delete trigger>" messages 
             |Are you sure you want to delete the Trigger?|
When I click "Cancel" in "popup window"
Then I should see "facets displayed" in "trigger group detail page"
#Then I should see "facet type and facet value" as "Brand,Cache" in "trigger group detail page"
When I delete the "facet refinement trigger" with "all attributes types"
Then I should see "<following delete trigger>" messages 
             |Are you sure you want to delete the Trigger?|
When I click "Ok" in "popup window"
When I save the "create trigger group page" with "triggers"
Then I should see "following create trigger group errors" messages
      |Save at least one trigger before saving the trigger group|
      
@regression_bcom_pom      
@jregression_4.7      
@jregression_18639_19149_4.7_3
@jregression_pom_1
Scenario: create result set trigger in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Result Set" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "resultset trigger dropdown"
                  |Product Noun|
                  |Normal Color|
                  |Product Type|
                  |Brand|
                  |Department|
                  |Category|
                  |Price Type|
                  |Promo ID|
When I create "result set trigger" with "Category" and the value as "193,>,70"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Brand" and the value as "Joop!,<,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Noun" and the value as "food storage,>,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Normal Color" and the value as "Blue,<,75"
When I select "<following resultset attributes>" from "resultset trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers without selecting attribute & percentage"
                  |Normal Color|
                  |Brand|
                  |Category|
                  |Product Noun|
When I save the "Result set trigger" with "all attributes types"
Then I should see "result set trigger saved" in "create trigger group"
When I save the "create trigger group page" with "triggers"
When I click "Copy button" in "rules detail page"
When I replace "193" with "194" from "result set trigger" in "trigger group detail page"
When I save the "Result set trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Type" and the value as "Jackets,>,70"
When I select "<following resultset attributes>" from "resultset trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers without selecting attribute & percentage"
                  |Product Noun|
                  |Normal Color|
                  |Brand|
                  |Category|
                  |Product Type|
When I save the "Result set trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
When I click "Cancel" in "Trigger Group Alert popup"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "trigger group name" as "Copy of rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "triggertype" as "Result Set" in "rules detailed page"
Then I should see "194,>,70" as "Category attribute values" in "rules detailed page"
Then I should see "Joop!,<,75" as "Brand attribute values" in "rules detailed page"
Then I should see "food storage,>,75" as "Product Noun attribute values" in "rules detailed page"
Then I should see "Blue,<,75" as "Normal Color attribute values" in "rules detailed page"
Then I should see "Jackets,>,70" as "Product Type attribute values" in "rules detailed page"

@regression_bcom_pom
@jregression_4.7
@jregression_18639_19149_4.7_10
@jregression_pom_1
Scenario: create Keywords in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "keyword search value" as "jeans,tops" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I edit "keyword trigger" with "keyswords" and the value as "color,style"
When I save the "keyword trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
Then I should see "keyword search value" as "jeans,tops,color,style" in "trigger group detail page"

@regression_bcom_pom
@jregression_4.7
@jregression_18639_4.7
@jregression_18639_19149_4.7_11
@jregression_pom_1
Scenario: checking autosuggestion functionality in create trigger group page and error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trirgger page"
When I enter "bran" as "facet name" and select "value randomly from autosuggestion dropdown"
When I enter "ca" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "jea" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "te" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "mo" as "facet value" and select "value randomly from autosuggestion dropdown"
When I save the "facet refinement" with "selected autosuggestion dropdown values"
Then I should see "facets saved which were selected from autosuggestions" in "create group trirgger page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from select trigger dropdown in "create group trigger page"
Then I should see "pdm displayed" in "create group trirgger page"
When I enter "af" as "Search_Type" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "we" as "Search_Occasion" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "leat" as "Search_Material" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "lo" as "Search_Style" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "food s" as "Product Noun" and select "value randomly from pdm autosuggestion dropdown"
When I save the "product data match" with "selected autosuggestion dropdown values"
When I click "add trigger" in "create rule page"
Then I should see "pdm saved which were selected from autosuggestions" in "create group trirgger page"
When I select "Result Set" from select trigger dropdown in "create group trigger page"
Then I should see "resultset displayed" in "create group trirgger page"
When I enter "la" as "Brand" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "cam" as "Product Type" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "sala" as "Product Noun" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "green" as "Normal Color" and select "value randomly from result set autosuggestion dropdown"
When I save the "result set" with "selected autosuggestion dropdown values"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"

@regression_bcom_pom
@jregression_create_rule_page_1
@jregression_pom_1
Scenario: create Keywords in create trigger group page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops,style"
When I save the "keyword trigger" with "all attributes types"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "keyword search value" as "jeans,tops,style" in "trigger group detail page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "tops" with "color" from "keyword trigger" in "trigger group detail page"
When I save the "keyword trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
When I click "Copy button" in "rules detail page"
When I click "Edit trigger" in "rules detailed page"
When I replace "style" with "ck" from "keyword trigger" in "trigger group detail page"
When I save the "keyword trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
Then I should see "rulename" as "Copy of rulestesting" in "rules detailed page"
Then I should see "keyword search value" as "jeans,color,ck" in "trigger group detail page"

@regression_bcom_pom
@jregression_create_rule_page_3
Scenario: create & edit result set trigger in create rule page or rule detail page
Given I have logged into Saturn as a Merchandise user
#When I search for rule name with created category id in Stella as "categoryid_CatHierarchy_Facets"
 #And I click "ruleid" from rulelisting page
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Result Set" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "resultset trigger dropdown"
                  |Product Noun|
                  |Normal Color|
                  |Product Type|
                  |Brand|
                  |Department|
                  |Category|
                  |Price Type|
                  |Promo ID|
When I create "result set trigger" with "Category" and the value as "193,>,70"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Brand" and the value as "Joop!,<,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Noun" and the value as "food storage,>,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Normal Color" and the value as "Blue,<,75"
When I save the "Result set trigger" with "attributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "triggertype" as "Result Set" in "rules detailed page"
Then I should see "193,>,70" as "Category attribute values" in "rules detailed page"
Then I should see "Joop!,<,75" as "Brand attribute values" in "rules detailed page"
Then I should see "food storage,>,75" as "Product Noun attribute values" in "rules detailed page"
Then I should see "Blue,<,75" as "Normal Color attribute values" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Type" and the value as "Jackets,>,70"
When I replace "Joop!" with "Calvin Klein" from "result set trigger" in "trigger group detail page"
When I save the "Result set trigger" with "attributes"
When I save the "rules details page" with "resultset attributes"
When I click "Copy button" in "rules detail page"
When I click "Edit trigger" in "rules detailed page"
When I replace "193" with "194" from "keyword trigger" in "trigger group detail page"
When I save the "Result set trigger" with "attributes"
When I save the "rules details page" with "resultset attributes"
Then I should see "rulename" as "Copy of rulestesting" in "rules detailed page"
Then I should see "194,>,70" as "Category attribute values" in "rules detailed page"
Then I should see "food storage,>,75" as "Product Noun attribute values" in "rules detailed page"
Then I should see "Blue,<,75" as "Normal Color attribute values" in "rules detailed page"
Then I should see "Calvin Klein,<,75" as "Brand attribute values" in "rules detailed page"
Then I should see "Jackets,>,70" as "Product Type attribute values" in "rules detailed page"

@regression_bcom_pom
@jregression_create_rule_page_4_bcom

Scenario: create & edit product data match trigger in create rule page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "product data match trigger dropdown"
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Dimension|
                  |Search_Color|
                  |Search_Style|
                  |Search_Type|
                  |Product Noun|
                  |Product Type|
                  |Brand|
When I create "product data macth trigger" with "Search_Type" and the value as "Mini Bags,Eye Treatments"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Occasion" and the value as "Day to Night,Evening/Formal"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Material" and the value as "glass,Wood"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Gender" and the value as "Adult,Child"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Style" and the value as "Relaxed,T-Shirt"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Noun" and the value as "Chip and Dip,Coffee Accessory"
When I select "<following resultset attributes>" from "product data match trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Search_Type|
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Style|
                  |Product Noun|
When I save the "product data match trigger" with "all attributes types"
Then I should see "product data match trigger saved" in "create trigger group"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "Adult" with "Female" from "pdm trigger" in "trigger group detail page"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Type" and the value as "Bed-in-a-Bag,Apparel"
When I select "<following resultset attributes>" from "product data match trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Search_Type|
                  |Search_Occasion|
                  |Search_Material|
                  |Search_Gender|
                  |Search_Style|
                  |Product Noun|
                  |Product Type|
When I save the "product data match trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
When I click "Copy button" in "rules detail page"
When I click "Edit trigger" in "rules detailed page"
When I replace "Wood" with "Silver" from "keyword trigger" in "trigger group detail page"
When I save the "product data match trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
Then I should see "rulename" as "Copy of rulestesting" in "rules detailed page"
Then I should see "product data match triggers displayed" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Type,Mini Bags,Eye Treatments" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Occasion,Day to Night,Evening/Formal" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Material,Glass,Silver" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Gender,Female,Child" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Search_Style,Relaxed,T-Shirt" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Product Noun,chip and dip,coffee accessory" in "trigger detail page"
Then I should see "pdm attrubute type and attribute value" as "Product Type,Bed-in-a-Bag,Apparel" in "trigger detail page"

@regression_bcom_pom
@jregression_create_rule_page_5

Scenario: create & edit Keyword Pattern trigger in create rule page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword Pattern" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "keyword pattern trigger dropdown"
                  |Brand|
                  |Color|
                  |Customer Service|
                  |Gender|
                  |Material|
                  |Miscellaneous|
                  |Occasion|
                  |Product Line|
                  |Product Noun|
                  |Size|
                  |Special Size|
                  |Style|
When I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
#Then I should see "plusicon displayed" in "create trigger group page"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Customer Service" and the value as "CD Player,Multi-Purpose Pot"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Material" and the value as "glass,wood"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Product Noun" and the value as "Food Processor,makeup-brushes"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Style" and the value as "Wall Clock,T Shirt"
When I select "<following resultset attributes>" from "keyword pattern trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Customer Service|
                  |Material|
                  |Occasion|
                  |Product Noun|
                  |Style|
When I save the "keyword pattern trigger" with "all attributes types"
Then I should see "keyword pattern trigger saved" in "create rule page"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "keyword pattern triggers displayed" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Brand,50 cent,tempur-pedic" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Customer Service,cd player,multi-purpose pot" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Material,glass,wood" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Occasion,back to school/fall,evening" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Product Noun,food processor,makeup-brushes" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Style,wall clock,t shirt" in "trigger detail page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "tempur-pedic" with "Country Gentlemen" from "keyword pattern trigger" in "trigger group detail page"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Gender" and the value as "Female,Adult"
When I select "<following resultset attributes>" from "keyword pattern trigger dropdown" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Customer Service|
                  |Material|
                  |Occasion|
                  |Product Noun|
                  |Style|
                  |Gender|
When I save the "keyword pattern trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "keyword pattern triggers displayed" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Brand,50 cent,country gentlemen" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Customer Service,cd player,multi-purpose pot" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Material,glass,wood" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Occasion,back to school/fall,evening" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Product Noun,food processor,makeup-brushes" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Style,wall clock,t shirt" in "trigger detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Gender,female,adult" in "trigger detail page"

@regression_bcom_pom
@jregression_create_rule_page_6
Scenario: create & edit result count in create rule page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Result Count" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "Result Count trigger dropdown"
                 |Less Than|
                 |Greater Than|
 And I should see "Less Than" as "selected by default" in "create rule page"
When I create "result count trigger" with "Greater Than" and the value as "2000"
When I save the "result count trigger" with "all attributes types"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "trigger group name" as "rulestesting" in "trigger detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger detail page"
Then I should see "result cout type and value" as "Greater Than,2000" in "trigger detail page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I create "result count trigger" with "Less Than" and the value as "1000" 
When I save the "result count trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
Then I should see "result cout type and value" as "Less Than,1000" in "trigger detail page"

@regression_bcom_pom
@jregression_create_rule_page_7_bcom
Scenario: trigges invalid data error validation in create rule
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "product data match trigger"
                  |Search_Occasion|error1|
                  |Search_Material|error2|
                  |Search_Gender|error3|
                  |Search_Style|error6|
                  |Search_Type|error7|
                  |Product Noun|error8|
                  |Product Type|error9|
                  |Brand|error10|
When I save the "product data match trigger" with "all attributes types"
Then I should see "following attributes error" messages
    |'error9' is incorrect value for Product Type, please enter valid value to save the Trigger|
    |'error10' is incorrect value for Brand, please enter valid value to save the Trigger|
    |'error7' is incorrect value for Search_Type, please enter valid value to save the Trigger|
    |'error1' is incorrect value for Search_Occasion, please enter valid value to save the Trigger|
    |'error2' is incorrect value for Search_Material, please enter valid value to save the Trigger|
    |'error6' is incorrect value for Search_Style, please enter valid value to save the Trigger|
    |'error8' is incorrect value for Product Noun, please enter valid value to save the Trigger|
    |'error3' is incorrect value for Search_Gender, please enter valid value to save the Trigger|
When I select "Result Set" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "Result Set trigger"
                  |Product Noun|error1|
                  |Normal Color|error2|
                  |Product Type|error3|
                  |Brand|error6|
                  |Category|1234567|
                  |Promo ID|000012|
When I save the "Result set trigger" with "all attributes types"
Then I should see "following attributes error" messages
    |'error3' is incorrect value for Product Type, please enter valid value to save the Trigger|
    |'error6' is incorrect value for Brand, please enter valid value to save the Trigger|
    |'1234567' is incorrect value for Category, please enter valid value to save the Trigger|
    |'error2' is incorrect value for Normal Color, please enter valid value to save the Trigger|
    |'000012' is incorrect value for Promo ID, please enter valid value to save the Trigger|
    |'error1' is incorrect value for Product Noun, please enter valid value to save the Trigger|    
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
When I validate "following atrributes with Invalidate data" from "Facet Refinement trigger"
                  |Brand|error1|
                  |Product Color|error2|
                  |Material|error3|    
When I save the "facet refinement trigger" with "all attributes types"
Then I should see "following attributes error" messages
         |'error1' is incorrect value for Brand, please enter valid value to save the Trigger|
         |'error2' is incorrect value for Product Color, please enter valid value to save the Trigger|
         |'error3' is incorrect value for Material, please enter valid value to save the Trigger|

@regression_bcom_pom
@jregression_create_rule_page_8_bcom
Scenario: create & edit facet refinement in create rule page and error validation and editing detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans,GUESS by Marciano"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
When I select "<following facets>" from "facet refinement trigger" than I see "not allowed duplicate attributes" and "not saveed triggers with invalid data"
                  |Brand|
                  |Product Color|
                  |Occasion|
When I save the "facet refinement trigger" with "all attributes types"
Then I should see "facet refinement trigger saved" in "create trigger group page"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "facets displayed" in "trigger detail page"
Then I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger detail page"
Then I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger detail page"
Then I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger detail page"
When I click "Edit Rule" in "rules detailed page"
When I click "Edit trigger" in "rules detailed page"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Material" and the value as "glass,wood"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "rules details page" with "resultset attributes"
Then I should see "trigger group name" as "rulestesting" in "trigger detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger detail page"
Then I should see "facets displayed" in "trigger detail page"
Then I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger detail page"
Then I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger detail page"
Then I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger detail page"
Then I should see "facet type and facet value" as "Material,Glass,Wood" in "trigger detail page"

@regression_bcom_pom
@jregression_create_rule_page_9
Scenario: trigges with cancel and delete and edit in Create rule page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create rule page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans"
When I save the "facet refinement trigger" with "attributes"
When I edit "facet refinement trigger" with "Brand" and the value as "Cache"
When I save the "facet refinement trigger" with "attributes"
Then I should see "facets and values displayed" as "Brand,Cache" in "trigger group detail page"
When I edit "facet refinement trigger" with "Product Color" and the value as "Gold"
When I cancel the "facet refinement trigger" with "all attributes types"
Then I should see "facets and values displayed" as "Brand,Cache" in "trigger group detail page"
When I delete the "facet refinement trigger" with "all attributes types"
Then I should see "<following delete trigger>" messages 
             |Are you sure you want to delete the Trigger?|
When I click "Cancel" in "popup window"
Then I should see "facets and values displayed" as "Brand,Cache" in "trigger group detail page"
When I delete the "facet refinement trigger" with "all attributes types"
Then I should see "<following delete trigger>" messages 
             |Are you sure you want to delete the Trigger?|
When I click "Ok" in "popup window"
When I save the "creating rule page" with "triggers"
Then I should see "following create trigger group errors" messages
      |Select at least one Navigation Type before saving rule.|      
      
      

@regression_bcom_pom      
@jregression_create_rule_page_10
Scenario: Create trigger rule page Error Validation
Given I have logged into Saturn as a Merchandise user
Then I should see "following links" from "Rules navigation bar"
                   |Find Rules|
				   |Create Rule|
				   |Find Trigger Groups|
				   |Create Trigger Group|
When I click "Create Rule" from "RULES"
When I click "Search" in "navigation type context attributes" 
When I save the "creating rule page" with "with out trigger group name and no triggers"
Then I should see "following create trigger group errors" messages
      |Rule name is required|
      |Effective date is required|
      |Expiration date is required|
When I click "add trigger" in "create trigger group page"
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |Please select the Trigger Type before saving the Trigger|
When I select "Keyword" in "trigger dropdown"       
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |Please input the keyword values to save the trigger.|
When I select "Keyword Pattern" in "trigger dropdown"       
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |Please input the keyword values to save the trigger.|
     |Please select the keyword pattern group type to save the Trigger.|
When I select "Result Set" in "trigger dropdown"       
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |You must select > or <.|
     |Please select the attribute to save the Trigger.|
 When I select "Product Data Match" in "trigger dropdown"       
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |Please select the attribute to save the Trigger.|
When I select "Facet Refinement" in "trigger dropdown"       
When I click "trigger button" in "create trigger group page"
Then I should see "following create trigger group errors" messages
     |Please select the Facet to save the Trigger.|       

@regression_bcom_pom     
@jregression_create_rule_page_11_bcom
Scenario: checking autosuggestion functionality in create rule page and error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create rule page"
When I enter "bran" as "facet name" and select "value randomly from autosuggestion dropdown"
When I enter "ca" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "jea" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "te" as "facet value" and select "value randomly from autosuggestion dropdown"
When I enter "mo" as "facet value" and select "value randomly from autosuggestion dropdown"
When I save the "facet refinement" with "selected autosuggestion dropdown values"
Then I should see "facets saved which were selected from autosuggestions" in "create rule page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from select trigger dropdown in "create rule page"
Then I should see "pdm displayed" in "create rule page"
When I enter "af" as "Search_Type" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "we" as "Search_Occasion" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "gl" as "Search_Material" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "lo" as "Search_Style" and select "value randomly from pdm autosuggestion dropdown"
When I click "plus symbol" in "pdm create trigger group"
When I enter "food s" as "Product Noun" and select "value randomly from pdm autosuggestion dropdown"
When I save the "product data match" with "selected autosuggestion dropdown values"
When I click "add trigger" in "create rule page"
Then I should see "pdm saved which were selected from autosuggestions" in "create rule page"
When I select "Result Set" from select trigger dropdown in "create rule page"
Then I should see "resultset displayed" in "create rule page"
When I enter "la" as "Brand" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "cam" as "Product Type" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "sala" as "Product Noun" and select "value randomly from result set autosuggestion dropdown"
When I click "plus symbol" in "result set create trigger group"
When I enter "green" as "Normal Color" and select "value randomly from result set autosuggestion dropdown"
When I save the "result set" with "selected autosuggestion dropdown values"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"

@regression_bcom_pom
@jregression_4.7
@jregression_bcom_19150_4.7
Scenario: As a user I want to be able to add a Trigger Group to a Rule and able to verify al the error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "checking_duplicate_triggergroup" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I save the "create trigger group page" with "triggers"
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I save the "trigger" with "result set trigger"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" trigger with "Brand,calvin klein" as "facet type and facet value respectively"
When I save the "trigger" with "facet refinement trigger"
When I click "add trigger" in "create trigger group page"
When I select "Product Data Match" trigger with "Brand,calvin klein" as "attribute type and attribute value respectively"
When I save the "trigger" with "product data match trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group header" as "Trigger Group:" in "trigger group detail page"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "Keyword trigger search value" as "ck" in "trigger group detail page"
Then I should see "Keyword Pattern attributes" as "Brand,ck" in "trigger group detail page"
Then I should see "Result Set attributes" as "Brand,calvin klein,  >" in "trigger group detail page"
Then I should see "Facet Refinement attributes" as "Brand,Calvin Klein" in "trigger group detail page"
Then I should see "Product Data Match atrributes" as "Brand,Calvin Klein" in "trigger group detail page"
When I navigate to "create rule page" from "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "checking_duplicate_triggergroup" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "trigger group" with "trigger group name"
Then I should see "trigger group autosuggestion dropdown" in "create rule page"
When I click "add trigger" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "duplicate trigger group name" as "trigger group name" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
Then I should see "following duplicate trigger group error" messages 
                 |2(or more) of the same Trigger Groups cannot exist in a single rule. Remove duplicate Trigger Group|
When I enter "trigger group name" as "invalid trigger group name" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
Then I should see "popup error" messages 
                 |Trigger Group 'invalid trigger group name' does not exist|
When I click "Ok" in "popup window"

@regression_bcom_pom
@jregression_4.7
@jregression_19380_4.7_2
Scenario: Trigger Action Compatibility validation to be run before any Trigger Groups are edited in rule detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "incompatible_combinations_check" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" trigger with "Brand,calvin klein" as "facet type and facet value respectively"
When I save the "trigger" with "facet refinement trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "incompatible_combinations_check" in "trigger group detail page"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed 
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
When I enter "replace with term" as "wine" in "create rule page"
When I save the "action" with "action atrributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
When I click "Edit Rule" in "rules detailed page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group checkbox enabled" in "trigger detail page"
When I click "trigger group radio button" in "trigger detail page"
When I enter "trigger group name" as "incompatible_combinations_check" in "trigger detail page"
#When I select "trigger group name" from "trigger group autosuggestion drop down" in "trigger detail page"
When I save the "trigger group" with "trigger group name"
Then I should see "popup error" messages 
                 |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|

@regression_bcom_pom
@jregression_4.7
@jregression_18680_4.7
Scenario: Edit Navigation Type with include & exclude option and validation if mm do not select Navigation Type
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I save the "creating rule page" with "triggers"
Then I should see "following create trigger group errors" messages
      |Select at least one Navigation Type before saving rule.|
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "triggers"
Then I should see "includes" as "context atrributes value" in "trigger detail page"
Then I should see "following context attribute values checked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |navigation|Search|
                  |device|PC,Phone,POS,Tablet|
                  |app|Site,Associate,Mobile,MEW,SEO Link Module,Search & Send,MSA|
                  |inventory|Store,Site,Jewelry,Registry,Shoes,Search & Send|
Then I should see "All Countries" as "checked by default" in "trigger detail page"
When I click "Edit Rule" in "rules detailed page"
When I click "Browse" in "navigation type context attributes"
When I save the "rules details page" with "resultset attributes"
Then I should see "following context attribute values checked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |navigation|Search,Browse|
                  |device|PC,Phone,POS,Tablet|
                  |app|Site,Associate,Mobile,MEW,SEO Link Module,Search & Send,MSA|
                  |inventory|Store,Site,Jewelry,Registry,Shoes,Search & Send|
When I click "Edit Rule" in "rules detailed page"
When I click "includes" in "rules detailed page"
Then I should see "excludes" as "context atrributes value" in "trigger detail page"   
#Then I should see "All Countries" as "unchecked" in "trigger detail page"
Then I should see "following context attribute values unchecked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |navigation|Search,Browse|
                  |device|PC,Phone,POS,Tablet|
                  |app|Site,Associate,Mobile,MEW,SEO Link Module,Search & Send,MSA|
                  |inventory|Store,Site,Jewelry,Registry,Shoes,Search & Send|
When I check "following context attribute" 
           |attributesname|attributesvalue|
           |navigation|Search,Browse|
           |device|PC,Phone|
           |app|Site,Associate,Mobile,MSA|
           |inventory|Store,Site,Jewelry,Search & Send|                             
When I save the "rules details page" with "resultset attributes"
Then I should see "following context attribute values checked" from "context attribute trigger"
             |attributesname|attributesvalue|
             |navigation|Search,Browse|
             |device|PC,Phone|
             |app|Site,Associate,Mobile,MSA|
             |inventory|Store,Site,Jewelry,Search & Send|  
Then I should see "following context attribute values unchecked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |device|POS,Tablet|
                  |app|MEW,SEO Link Module,Search & Send|
                  |inventory|Registry,Shoes|      

@regression_bcom_pom
@jregression_4.7
@jregression_19901_1_4.7
Scenario: Trigger Action Compatibility validation to be run before any Trigger Groups are edited
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "compatibility_validation" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" trigger with "Brand,calvin klein" as "facet type and facet value respectively"
When I save the "trigger" with "facet refinement trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group name" as "compatibility_validation" in "trigger group detail page"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed 
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
When I enter "replace with term" as "wine" in "create rule page"
When I save the "action" with "action atrributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
When I click "Edit Rule" in "rules detailed page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group checkbox enabled" in "trigger detail page"
When I click "trigger group radio button" in "trigger detail page"
When I enter "trigger group name" as "compatibility_validation" in "trigger detail page"
#When I select "trigger group name" from "trigger group autosuggestion drop down" in "trigger detail page"
When I save the "trigger group" with "trigger group name"
Then I should see "popup error" messages 
                 |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|

@regression_bcom_pom
@jregression_4.7
@jregression_19901_2_4.7_bcom
Scenario: Trigger Action Compatibility validation when navigate from find rule & edit facets in detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "incompatible_triggergroup_comb" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Keyword" from "trigger drop down" in "create rule page"
 And I enter "keyword search value" as "ck" in "create rule page"
 And I save the "triggers" with "facets"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger detail group page"
When I navigate to "create rule page" from "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "search_by_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "incompatible_triggergroup_comb" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
When I enter "replace with term" as "wine" in "create rule page"
When I save the "action" with "action atrributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
When I click "Find Rules" from "RULES"
When I search for "incompatible_triggergroup_comb" as "Trigger Group Name" by filter options as "All"
Then I should see "incompatible_triggergroup_comb" in Merchandising Rules listing page
When I click "triggergroup link" in "rules listing page" 
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "add trigger" in "trigger group detailed page"
When I select "Facet Refinement" from "trigger drop down" in "create rule page"
 And I enter "facet name and facet value" as "Brand,Cache" in "trigger Group detailed page"
 And I save the "triggers" with "facets"
 And I save the "trigger group details page" with "triggers" 
 And I click "Save" in "Trigger Group Alert popup"
Then I should see "following attributes error" messages
    |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
    
@regression_bcom_pom    
@jregression_4.7
@jregression_18998_4.7_15011311
Scenario: As a user I am able to sort rules by Trigger Group Name in Find Rules page in Saturn
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "find_by_filter_triggergroup" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group header" as "Trigger Group:" in "trigger group detail page"
Then I should see "trigger group name" as "find_by_filter_triggergroup" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "trigger group displayed" in "trigger detail group page"
Then I should see "Keyword trigger search value" as "ck" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "search_by_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "find_by_filter_triggergroup" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
When I navigate to "Find rules" from "rules detailed page"
When I click "Find Rules" from "RULES"
Then I should see "following filter options" from "Filter by dropdown"
               |Filter_Options|
               |Rule Name|
               |Creator|
               |Created Date|
               |Modifier|
               |Modified Date|
               |Effective Date - Expiration Date|
               |Trigger Group Name|
When I sort the "Trigger Group Name" from "find rules page"
Then I should see "Trigger Group Name" as "Lowest to Highest" in "find rules page"
When I sort the "Trigger Group Name" from "find rules page"
Then I should see "Trigger Group Name" as "Highest to Lowest" in "find rules page"
When I search for "find_by_filter_triggergroup" as "Trigger Group Name" by filter options as "All"
Then I should see "find_by_filter_triggergroup" in Merchandising Rules listing page 
 And I should see "Trigger Group Name highlighed in Yellow" in Merchandising Rules listing page 
When I search for "notriggergroup" as "Trigger Group Name" by filter options as "All" 
Then I should see "No Records" in Merchandising Rules listing page

@regression_bcom_pom
@jregression_18679_4.7_1_bcom
Scenario: Remove Facets and RDPP from category overview, category homepage
Given I have logged into Stella as a Merchandise Manager
When I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages
When I create a category as "createcategory" in stella 
Then I should see Category name crated with unique "Category Id" in stella  
When I click "General" in "category overview page"
Then I should not see "following options" in "General menu"
                |Facets|
                |RDPP|
When I navigate to stella "Home" Page
When I select "Categories" from "search dropdown" in "category home page"
 And I click "Go to" in "category home page"
Then I should not see "following options" in "home page dropdown"
                |Facets|
                |RDPP|
@regression_bcom_pom
@jregression_18679_4.7_2_bcom                
Scenario: Remove Facets and RDPP from category advanced page
Given I have logged into Stella as a Merchandise Manager
When I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages
When I create a category as "createcategory" in stella 
Then I should see Category name crated with unique "Category Id" in stella  
When I search for "category" through "Advanced Search" link and selecting "category_type"
Then I should see "category list" with "Action menu" in advanced search page  
When I select "Change Attribute" from "category action menu" in "Advanced category page"
Then I should not see "following options" in "advanced category page"
                |Facets|
                |RDPP|
@regression_bcom_pom
@jregression_18679_4.7_4_bcom
Scenario: Remove Facets and RDPP from saved set category page                  
Given I have logged into Stella as a Merchandise Manager
When I select "Categories" from "search dropdown" in "category home page"
 And I enter "category input value" as "*" in "category home page"
 And I click "Go" in "category home page"    
Then I should see "category listings" in "category search page"
When I select "create" from "category action menu" in "category listing page"
Then I should see "Saved Set" as "default option" in "create from results window"
When I click "Create" in "create from results window"
When I enter "name" as "saturntest" in "create from results window"
When I click "Create" in "create from results window"
When I select "Change Attributes" from "category action menu" in "saved set page"
Then I should not see "following options" in "saved set category page"
                |Facets|
                |RDPP| 
@regression_bcom_pom                
@jregression_18679_4.7_3_bcom
Scenario: If I make Faceted Stop Category as 'Y' for parent category,then no child category created                
Given I have logged into Stella as a Merchandise Manager
When I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages
When I create a category as "parentcategory" in stella 
Then I should see Category name crated with unique "Category Id" in stella 
When I click START EDITING Button
When I checked "Faceted Stop Category" option in Overview section
 And I click SAVE CHANGES Button
 And I navigate to stella "Home" Page
 And I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages    
When I click "Find category" link to add "parentcategory" 
When I create a category as "childcategory" in stella 
Then I should see Category name crated with unique "Category Id" in stella  
Given I have logged into Saturn as a Merchandise user
When I search for rule name with created category id in Stella as "categoryid_CatHierarchy_Facets"
Then I should not see rule name as "Category Id_CatHierarchy_Facets" 

@regression_bcom_pom
@jregression_18679_4.7_5_bcom
Scenario: should not see any new rule for Category id with MSR action 
Given I have logged into Stella as a Merchandise Manager
When I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages
When I create a category as "createcategory" in stella 
Then I should see Category name crated with unique "Category Id" in stella  
When I Hover "General" in Category home page and select "Saved Sets & Queries"
 And I add "Associate a saved set" on child window by selecting "Saved Set Name" and entering "cad" and clicking on "Find" button
 And I select "Saved Set Id" by checked check box for first page and click "ADD SELECTED"
 And I add "Associate a saved set" on child window by selecting "Saved Query Name" and entering "cad" and clicking on "Find" button
 And I select "Saved Query Id" by checked check box for first page and click "ADD SELECTED"
 And I click "save changes" button to save "Saved set queries actions"			  
Given I have logged into Saturn as a Merchandise user
When I search for rule name with created category id in Stella as "categoryid_CatHierarchy_ModifyResults"
Then I should not see rule name as "categoryid_CatHierarchy_ModifyResults"

@regression_bcom_pom
@jregression_18642_4.7_bcom_test
Scenario: Create Category Ids trigger with functional & error validation 
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "category ids enabled" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
Then I should see "Include all children and grandchildren etc" as "checked by default" in "create rule page"
When I uncheck "Include all children and grandchildren etc" in "create rule page"
Then I should see "Except for these Category IDs and their children" as "disabled" in "create rule page"
When I check "Include all children and grandchildren etc" in "create rule page"
Then I should see "Except for these Category IDs and their children" as "enabled" in "create rule page"
When I enter "category ids" as "122000000" in "create rule page"
When I save the "category ids trigger" with "valid ids"
Then I should see "popup error" messages 
                 |Category Id 122000000 does not exist|
When I click "Ok" in "popup window"          
When I enter "category ids" as "193" in "create rule page"
When I enter "category ids and their children" as "416,417,422,423" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I click "add trigger" in "create rule page"
Then I should see "category ids in trigger dropdown" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
When I save the "category ids trigger" with "valid ids"
Then I should see "popup error" messages 
                 |Please fill the fields with category IDs.|
When I click "Ok" in "popup window" 
When I click "cancel" in "create rule page"
When I click "Browse" in "navigation type context attributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "category ids trigger selected with category ids" in "rules detailed page"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "category ids" as "193" in "rules detailed page"
Then I should see "category ids and their children" as "416, 417, 422, 423" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
When I click "edit" in "rule detail page"
When I enter "category ids" as "194" in "create rule page"
When I enter "category ids and their children" as "425,426,427,428" in "create rule page"
When I click "cancel" in "rule detail page"
When I click "edit" in "rule detail page"
When I enter "category ids" as "194" in "create rule page"
When I enter "category ids and their children" as "425,426,427,428" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I save the "rules details page" with "resultset attributes"
Then I should see "category ids" as "194" in "rules detailed page"
Then I should see "category ids and their children" as "425, 426, 427, 428" in "rules detailed page"

@regression_bcom_pom
@jregression_18642_4.7_bcom
Scenario: Edit Category id trigger type to some other trigger type in create rule page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "category ids enabled" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
When I enter "category ids" as "194" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
Then I should see "Execute New Search" as "action disabled" in "create rule page"
When I click "cancel to remove action" in "create rule page"
When I click "edit" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I click "cancel" in "create rule page"
Then I should see "category ids" as "194" in "create rule page"
When I click "edit" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "attributes"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "keyword search value" as "jeans,tops" in "trigger group detail page"

@regression_bcom_pom
@jregression_18642_4.7_bcom
Scenario: All the existing 'Category Hierarchy Facets' triggers will be converted to 'Category Ids' 
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
When I search "CatHierarchy_Facets" as "Rule Name" with "Browse"
When I click "ruleid" in "rules listing page"
Then I should see Publish Flag "ON"
Then I should see "category ids trigger selected with category ids" in "rule detail page"
When I click "Edit Rule" in "rules detailed page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "edit" in "rule detail page"
When I enter "category ids" as "194" in "create rule page"
When I save the "category ids trigger" with "valid ids"
Then I should see "showfacet action table displayed" in "rule detail page"
When I click "edit action" in "rules detail page"
 And I remove "existing facets" from "showfaces displaying table"
 And I select "Accessories Type,Color Family" from "show facets drop down" in "create rule page" 
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "resultset attributes"
Then I should see "showfacet actions displayed" in "rule details page"
Then I should see "category ids" as "194" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "following facets with sequence numbers and displayname" from "show facet table" 
             |Accessories Type|1|Tools & Accessories Type|
             |Color Family    |2|Color                   |

@regression_bcom_pom
@jregression_18642_4.7_bcom
Scenario: All the existing 'Category Hierarchy RDPP' triggers will be converted to 'Category Ids' 
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
When I search "CatHierarchy_RDPP" as "Rule Name" with "Browse"
When I click "ruleid" in "rules listing page"
Then I should see Publish Flag "ON"
Then I should see "category ids trigger selected with category ids" in "rule detail page"
When I click "Edit Rule" in "rules detailed page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "edit" in "rule detail page"
When I enter "category ids" as "194" in "create rule page"
When I save the "category ids trigger" with "valid ids"
Then I should see "rdpp table displayed" in "rules detailed page"
When I click "edit action" in "rules detail page"
When I select "78 - 100DollarSales" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "effective date" as "current date for rdpp algorithm" in "create rule page"
 And I enter "expiration date" as "future date for rdpp algorithm" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "resultset attributes"
Then I should see "category ids" as "194" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "rdpp algorithm type" as "78 - 100DollarSales" in "rules detailed page" 

@regression_bcom_pom
@jregression_18642_4.7_bcom
Scenario: All the existing Category Hierarchy Modify result set trigger  
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
When I search "CatHierarchy_ModifiedResults" as "Rule Name" with "Browse"
When I click "ruleid" in "Find rule page"
Then I should see "Edit button" as "in read only mode" in "rules detail page" 
 And I should see Publish Flag "ON"
 And I should see "category ids trigger selected with category ids" in "rule detail page"   
 And I should see "Include all children and grandchildren etc" as "unchecked by default" in "create rule page"

@regression_bcom_pom
@jregression_18642_4.7_bcom
Scenario: As a user I am able to create 'Category Id's trigger rules with MSR action and able to edit
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "category ids enabled" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
When I enter "category ids" as "193" in "create rule page"
When I enter "category ids and their children" as "416,417,422,423" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
When I enter "product id" as "4199" in "create rule page"
 And I enter "saved set query id" as "10078" in "create rule page"
 And I save the "action" with "action atrributes"
When I click "Browse" in "navigation type context attributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "resultset attributes"
Then I should see "category ids trigger selected with category ids" in "rules detailed page"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "category ids" as "193" in "rules detailed page"
Then I should see "category ids and their children" as "416, 417, 422, 423" in "rules detailed page"
Then I should see "product id" as "4199" in "rules detailed page"
Then I should see "saved set query id" as "10078" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
When I click "edit action" in "rule detail page"
When I enter "product id" as "1082410" in "create rule page"
 And I enter "saved set query id" as "10079" in "create rule page"
 And I save the "action" with "action atrributes"
When I save the "rules details page" with "updated mrs"
Then I should see "category ids trigger selected with category ids" in "rules detailed page"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "category ids" as "193" in "rules detailed page"
Then I should see "category ids and their children" as "416, 417, 422, 423" in "rules detailed page"
Then I should see "product id" as "1082410" in "rules detailed page"
Then I should see "saved set query id" as "10079" in "rules detailed page"

@regression_bcom_pom
@jregression_4193_4.8_bcom
Scenario: Clone a rule & able to make the changes in cloned rule
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test4193" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "rule name,description"
Then I should see Publish Flag "OFF"
Then I should see "rulename" as "test4193" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
When I click "Copy button" in "rules detail page"
When I save the "rules details page" with "cloned rule"
Then I should see Publish Flag "OFF"
Then I should see "rulename" as "Copy of test4193" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Given I have logged into Saturn as a Merchandise user as mmuser
When I search for "rulename" as "Copy of test4193" from "global search"
 And I click "ruleid" from rulelisting page
 And I click "Copy button" in "rules detail page"
When I click "add trigger" in "create rule page"
Then I should see "category ids enabled" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
When I enter "category ids" as "193" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
When I enter "product id" as "4199" in "create rule page"
And I enter "saved set query id" as "100685" in "create rule page"
When I save the "action" with "action atrributes"
When I click "Browse" in "navigation type context attributes"
When I save the "rules details page" with "cloned rule"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "Copy of Copy of test4193" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page" 
Then I should see "product id" as "4199" in "rules detailed page"
Then I should see "saved set query id" as "100685" in "rules detailed page" 
Then I should see "category ids" as "193" in "rules detailed page"
When I click "Copy button" in "rules detail page"
And I enter "duplicate rulename" as "test4193" in "rules detailed page"
Then I should see "duplicate rulename" in "rules detailed page"
 And I save the "rules details page" with "cloned rule"
Then I should see "following error" messages 
               |Duplicate rule name|
When I enter "rulename" as "testcopy" in "saturn main page"
Then I should see "new rulename" in "rules detailed page"
When I save the "rules details page" with "cloned rule"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "testcopy" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page" 
Then I should see "product id" as "4199" in "rules detailed page"
Then I should see "saved set query id" as "100685" in "rules detailed page" 
Then I should see "category ids" as "193" in "rules detailed page"

@regression_bcom_pom
@jregression_19220_4.8_bcom
Scenario: should be default facet display name for facets in show facet action if i do not edit display name field
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19220" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "All" from "show facet filter by drop down" in "create rule page"
 And I click "showfacet find button" in "create rule page"
 And I select "Age Group,Comfort" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "show facet action"
Then I should see Publish Flag "ON"
 And I should see "rulename" as "test19220" in "rules detailed page"
 And I should see "description" as "resultsettesting" in "rules detailed page"
 And I should see "effectivedate" as "today" in "rules detailed page"
 And I should see "expirationdate" as "tomorrow" in "rules detailed page"
 And I should see "facets added with default display name" in "rules detailed page"
 And I should see "All" as "showfacet filter by option" in "rules detailed page"
 #And I should see "Age" as "default show facet display name" for the facet "Age" in "rules detailed page"
 #And I should see "Color" as "default show facet display name" for the facet "Color Family" in "rules detailed page" 
When I click "Edit Rule" in "rules detailed page"
When I click "edit action" in "rule detail page"
 And I select "Collections,Department" from "show facets drop down" in "create rule page"
 And I enter "text1" as "display name" for the facet "Collections"
 And I enter "text2" as "display name" for the facet "Department"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "show facet action"
Then I should see Publish Flag "ON"
 And I should see "rulename" as "test19220" in "rules detailed page"
 And I should see "description" as "resultsettesting" in "rules detailed page"
 And I should see "effectivedate" as "today" in "rules detailed page"
 And I should see "expirationdate" as "tomorrow" in "rules detailed page"
 And I should see "facets added with user defined display name" in "rules detailed page"
 And I should see "All" as "showfacet filter by option" in "rules detailed page"
 #And I should see "Age" as "default show facet display name" for the facet "Age" in "rules detailed page"
 #And I should see "Color" as "default show facet display name" for the facet "Color Family" in "rules detailed page"  
 And I should see "text1" as "default show facet display name" for the facet "Collections" in "rules detailed page"
 And I should see "text2" as "default show facet display name" for the facet "Department" in "rules detailed page"
 
 
@regression_bcom_pom
@jregression_19301_bcom_4.8
Scenario: user able to copy the trigger group
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "test19301" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword Pattern" from "select trigger dropdown" in "create rule page"
Then I should see "keyword pattern attribute options" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
When I save the "keyword pattern trigger" with "attributes types"
Then I should see "keyword pattern trigger saved" in "create trigger group page"
When I save the "create trigger group page" with "triggers"
When I click "Copy button" in "rules detail page"
When I save the "keyword pattern trigger" with "attributes types"
When I save the "trigger group details page" with "triggers"
Then I should see "trigger group name" as "Copy of test19301" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I replace "back to school/fall" with "men 50+" from "keyword pattern trigger" in "trigger group detail page"
When I save the "keyword pattern trigger" with "attributes types"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "trigger group name" as "Copy of test19301" in "trigger group detail page"
Then I should see "keyword pattern triggers displayed" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Brand,50 cent,tempur-pedic" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Occasion,men 50+,evening" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I enter "duplicate triger group name" as "test19301" in "create trigger group page"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "following error" messages
    |Duplicate trigger group name|
When I enter "TriggerGroupName" as "new_trigger_group_name" in "create trigger group page"
When I enter "description" as "trigger_group_testing" in "trigger group detail page"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"       
Then I should see "trigger group name" as "new_trigger_group_name" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Brand,50 cent,tempur-pedic" in "trigger group detail page"
Then I should see "keyword pattern attrubute type and attribute value" as "Occasion,men 50+,evening" in "trigger group detail page"

@regression_bcom_pom
@jregression_20785_bcom_4.8
Scenario: As a user I should see default operator as 'OR' for triggers in trigger group
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "incompatible_combinations_check" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "triggers globaloperator text" as "Please select 'AND' or 'OR' between multiple triggers:" in "create trigger group page"
 And I should see "default globaloperator" as "Or" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" trigger with "Brand,calvin klein" as "facet type and facet value respectively"
When I save the "trigger" with "facet refinement trigger"
When I save the "create trigger group page" with "triggers"
When I click "trigger Group Edit" in "trigger group detailed page"
 And I click "And" in "trigger global operator"
 And I save the "trigger group details page" with "triggers"
 And I click "Save" in "Trigger Group Alert popup"
Then I should see "trigger operator" as "AND" in "trigger group detailed page" 
 
@regression_bcom_pom 
@jregression_18681_4.8
Scenario: Validate Nav Type Browse in rule with Cat ID in trigger 
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test18681" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "category ids enabled" in "create rule page"
When I select "Category Ids" from select trigger dropdown in "create rule page"
When I enter "category ids" as "193" in "create rule page"
When I save the "category ids trigger" with "valid ids"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
When I enter "product id" as "4199" in "create rule page"
And I enter "saved set query id" as "100685" in "create rule page"
When I save the "action" with "action atrributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "category id"
Then I should see "following error" messages 
               |Select Navigation Type Browse before saving rule with Category IDs trigger|
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test18681" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page" 
Then I should see "product id" as "4199" in "rules detailed page"
Then I should see "saved set query id" as "100685" in "rules detailed page" 
Then I should see "category ids" as "193" in "rules detailed page"

@regression_bcom_pom
@multipletriggergroup
Scenario: Multiple triggers in create group page
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "multi_trigger_group_test" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "keyword"
When I select "Keyword" trigger with "ck" as "keyword search value"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria display" in "keyword pattern"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Material,Leather" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Occasion,Back to School/Fall" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Product Noun,Food Processor" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Style,Wall Clock" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Category,193,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Product Noun,food storage,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Normal Color,Blue,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Facet Refinement"
When I select "Facet Refinement" trigger with "Brand,polo jeans" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Product Color,gold" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Occasion,formal" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Material,glass" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Facet Refinement trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Product Data Match"
When I select "Product Data Match" trigger with "Search_Type,Dress" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Occasion,evening" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Material,glass" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Gender,Adult" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Product Noun,dress" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Product Type,Dresses" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Product Data Match"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
Then I should see "all the combination of triggers" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
Then I should see "following triggers has been saved" from "rules detailed page"
          |Keyword Pattern|
          |Result Set|
          |Product Data Match|
          |Keyword|
          |Facet Refinement|
          |Category Ids|
          |Result Count|

@regression_bcom_pom
@Multipletriggers
Scenario: Multiple triggers in create rule page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed  
When I enter "rulename" as "multi_trigger_create_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "keyword"
When I select "Keyword" trigger with "ck" as "keyword search value"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria display" in "keyword pattern"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Material,glass" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Occasion,Back to School/Fall" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Product Noun,Food Processor" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Style,Wall Clock" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Category,193,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Product Noun,food storage,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Normal Color,Blue,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Facet Refinement"
When I select "Facet Refinement" trigger with "Brand,polo jeans" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Product Color,gold" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Occasion,formal" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Material,glass" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Facet Refinement trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Product Data Match"
When I select "Product Data Match" trigger with "Search_Type,Dress" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Occasion,evening" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Material,glass" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Gender,Adult" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Search_Style,short sleeve" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Product Noun,dress" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Product Data Match" trigger with "Product Type,Dresses" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Product Data Match"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger group radio button enabled to include with triggers" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "multi_trigger_group_test" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Browse" in "navigation type context attributes"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
Then I should see "all the combination of triggers" in "trigger group detail page"
Then I should see "following triggers has been saved" from "trigger group detail page"
          |Keyword Pattern|
          |Result Set|
          |Product Data Match|
          |Keyword|
          |Facet Refinement|
          |Result Count|    

@regression_bcom_pom
@jregression_19508_7_4.8_bcom
Scenario: Boost Attribute Values with auto suggestion
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
 And I should see "boostlabel" as "Products will get boosted based on ALL of the attributes in a group." in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I select "Price Type" from "boost attribute autosuggestion" in "create rule page"
 And I check "following attribute values in select attribute values window"
        |LPOS|
        |Special Savings|
        |Ticket|
 And I select "Page Type" from "boost attribute autosuggestion" in "create rule page"
 And I check "following attribute values in select attribute values window"
        |Master|
        |Member|
        |Standard| 
 And I select "Promotion Type" from "boost attribute autosuggestion" in "create rule page"
 And I check "following attribute values in select attribute values window"
        |Bundled GWP|
        |Dollar Off Order|
        |Flat Fee Shipping|              
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page" 
 And I click "addAttributeValue" in "create rule page"
 And I click "boost attribute value cross mark" in "Special Savings"
 And I click "ok in select attribute value window" in "create rule page"
 And I click "boost attribute value cross mark" in "Dollar Off Order"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "modify result set"
Then I should see "following selected attribute values" from "Price Type"
        |LPOS|
        |Ticket|
Then I should see "following selected attribute values" from "Page Type"
        |Master|
        |Member|
        |Standard|
Then I should see "following selected attribute values" from "Promotion Type"
        |Bundled GWP|
        |Flat Fee Shipping|
 
@regression_bcom_pom                  
@jregression_4.8_3_20253_bcom
Scenario: Suppressing certain Actions for certain Triggers: Disable in GUI in rules detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger attributes"
When I click "Edit Rule" in "rules detailed page"
When I click "add action" in "rules detailed pag"
Then I should see "select action drop down displayed" in "rules detailed pag"
When I select "Display Message" from "action drop down" in "rules detailed pag"
 And I enter "display message" as "sorry not avaliable" in "rules detailed page" 
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create trigger group page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
 And I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Result Set|
                  |Product Data Match|
                  |Keyword|
                  |Facet Refinement|
                  |Result Count|
  And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|
When I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"
When I select "RDPP Algorithm" from "action drop down" in "rules detailed page"
Then I should see "rdpp algorithm options enabled" in "create rule page"
When I select "94 - 94_100DollarSales" from "rdpp algorithm type drop down" in "rules detailed page"
 And I enter "effective date" as "current date for rdpp algorithm" in "rules detailed page"
 And I enter "expiration date" as "future date for rdpp algorithm" in "rules detailed page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Result Set|
                  |Product Data Match|
                  |Keyword|
                  |Facet Refinement|
                  |Result Count| 
                  |Category Ids|
When I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"                         
When I select "URL Redirect" from "action drop down" in "rules detailed page"
 And I enter "url" as "http://google.com/" in "rules detailed page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|      
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count| 
When I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"  
When I select "Category Redirect" from "action drop down" in "rules detailed page"
 And I enter "category id" as "193" in "rules detailed page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|      
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
When I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"                       
When I select "PDP Redirect" from "action drop down" in "rules detailed page"
 And I enter "pdp id" as "4199" in "rules detailed page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
                  |Category Ids|  
When I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"   
When I select "Show Media" from "action drop down" in "rules detailed page"
 And I select "Banners" from "select media type dropdown" in "rules detailed page"
 And I enter "media group id" as "510690" in "create rule page"
 And I select "KWS_TOP_BANNER" from "media group location" in "rules detailed page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids| 
 And I click "edit action" in "rules detailed page"
 And I select "Zero Results Media" from "select media type dropdown" in "rules detailed page"
 And I enter "media group id" as "201374" in "rules detailed page"  
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids| 
 And I click "edit action" in "rules detailed page"                 
When I select "Copy Block Media" from "select media type dropdown" in "rules detailed page"  
 And I enter "media group id" as "508921" in "rules detailed page"  
 And I save the "action" with "action atrribute" 
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|        
 And I click "edit action" in "rules detailed page"                                            
Then I should see "select action drop down displayed" in "rules detailed page"
When I select "Show Master or Member Products" from "action drop down" in "rules detailed page"
 And I select "Show only the Master Products" from "select display drop down" in "rules detailed page"
 And I save the "action" with "action atrribute" 
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids| 
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|
 And I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"                  
When I select "Show Facets" from "action drop down" in "rules detailed page"
 And I select "All" from "show facet filter by drop down" in "rules detailed page"
 And I click "showfacet find button" in "rules detailed page"
 And I select "Active Type,Color Family" from "show facets drop down" in "rules detailed page"
 And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids| 
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|                  
 And I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"
When I select "Modify Result Set" from "action drop down" in "rules detailed page"
 And I enter "product id" as "4199" in "rules detailed page"
 And I enter "saved set query id" as "1873" in "rules detailed page"
 And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "rules detailed page"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids| 
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "rules detailed page"
   And I select "Boost Attribute Values" from "mrs action menu" in "rules detailed page"
   And I click "addAttributeValue" in "rules detailed page"
   And I click "Special Offers" in "select attribute values window" 
   And I check "following attribute values in select attribute values window"
        |Special Purchase|
        |Sales & Offers|
        |Gift with Purchase|
   And I click "ok in select attribute value window" in "rules detailed page"     
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids| 
                  |Result Set|
                  |Facet Refinement| 
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "rules detailed pag"
   And I select "Remove" from "mrs action menu" in "rules detailed page"
   And I enter "product id" as "4199" in "rules detailed page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set| 
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
  And I click "edit action" in "rules detailed page"
   And I select "Replace" from "mrs action menu" in "rules detailed page"
   And I enter "product id" as "4199" in "create rule page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|    
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "rules detailed page"
   And I select "Add" from "mrs action menu" in "rules detailed page"
   And I enter "product id" as "4199" in "rules detailed page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids| 
                  |Result Set|
                  |Facet Refinement|   
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
When I select "Keyword" from "trigger drop down" in "rules detailed page"
 And I enter "keyword search value" as "ck" in "rules detailed pag"
 And I save the "triggers" with "keyword"
And I click "edit action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page"
When I select "Execute New Search" from "action drop down" in "rules detailed page"
 And I enter "replace with term" as "wine" in "rules detailed page"
 And I save the "action" with "action atrribute"
 And I click "Edit trigger" in "rules detailed page"
Then I should see "keyword" as "selected" in "trigger drop down"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
                  |Facet Refinement| 
                  |Category Ids| 
                  |Result Set|                 

@regression_bcom_pom
@jregression_pom_1
@jregression_4.8_4_20253_bcom
Scenario: checking actions when selecting triggers in rule detail page
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test20253" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger attributes"
When I click "Edit Rule" in "rules detailed page"
When I click "add trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Keyword" from "trigger drop down" in "rules detailed page"
 And I enter "keyword search value" as "ck" in "rules detailed page"
 And I save the "triggers" with "keyword"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page" 
 And I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search|
 And I should see "following actions disabled" from "action drop down"
                  |Facet Value Sequence|
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Keyword Pattern" from "trigger drop down" in "rules detailed page"                  
 And I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
 And I click "plusicon" in "rules detailed page"
 And I create "keyword pattern trigger dropdown" with "Material" and the value as "Leather,wood"
 And I click "plusicon" in "rules detailed page"
 And I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
 And I click "plusicon" in "rules detailed page"
 And I create "keyword pattern trigger dropdown" with "Product Noun" and the value as "Food Processor,makeup-brushes"
 And I click "plusicon" in "rules detailed page"
 And I create "keyword pattern trigger dropdown" with "Style" and the value as "Wall Clock,T Shirt" 
 And I save the "triggers" with "keyword"
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search| 
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Result Set" from "trigger drop down" in "rules detailed page"                  
 And I create "result set trigger" with "Category" and the value as "193,>,70"
 And I click "plusicon" in "rules detailed page"
 And I create "result set trigger" with "Brand" and the value as "Joop!,<,75"
 And I click "plusicon" in "rules detailed page"
 And I create "result set trigger" with "Product Noun" and the value as "food storage,>,75"
 And I click "plusicon" in "rules detailed page"
 And I create "result set trigger" with "Normal Color" and the value as "Blue,<,75"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Modify Result Set|
                  |Show Master or Member Products|
  And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Facet Refinement" from "trigger drop down" in "rules detailed page"                  
 And I create "facet refinement trigger" with "Brand" and the value as "Polaroid,Poleci"
 And I click "plusicon" in "rules detailed page"
 And I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
 And I click "plusicon" in "rules detailed page"
 And I create "facet refinement trigger" with "Occasion" and the value as "Easter/Spring,formal"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Show Master or Member Products|
                  |Modify Result Set| 
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Product Data Match" from "trigger drop down" in "rules detailed page"
When I create "product data macth trigger" with "Search_Type" and the value as "Dress,Electronics & Gadgets"
When I click "plusicon" in "rules detailed page"
When I create "product data macth trigger" with "Search_Occasion" and the value as "Wear to Work,Evening/Formal"
When I click "plusicon" in "rules detailed page"
When I create "product data macth trigger" with "Search_Material" and the value as "Leather,wood"
When I click "plusicon" in "rules detailed page"
When I create "product data macth trigger" with "Search_Gender" and the value as "Adult,Child"
When I click "plusicon" in "rules detailed page"
When I create "product data macth trigger" with "Search_Style" and the value as "Relaxed,Sleeveless"
When I click "plusicon" in "rules detailed page"
When I create "product data macth trigger" with "Product Noun" and the value as "food storage,cake plate"        
 And I save the "triggers" with "product data match"  
Then I should see "select action drop down displayed" in "rules detailed pag" 
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
 And I should see "following actions disabled" from "action drop down"             
                  |Execute New Search| 
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Result Count" from "trigger drop down" in "rules detailed page"                  
 And I create "result count trigger" with "Greater Than" and the value as "2000"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Master or Member Products|
                  |Execute New Search|
                  |Modify Result Set|
                  |Show Facets|
When I click "Edit trigger" in "rules detailed page"
Then I should see "select trigger drop down displayed" in "rules detailed page"
When I select "Category Ids" from "trigger drop down" in "rules detailed page"                  
 And I enter "category ids" as "193" in "rules detailed page"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Category Redirect|
                  |URL Redirect|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |Display Message|
                  |PDP Redirect|
                  |Execute New Search|                   
                  
                  
                  
 @regression_bcom_pom
@jregression_19302_4.8_bcom
Scenario: Verify Alert for rules using a Trigger Group 
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "test19302" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
When I click "trigger Group Edit" in "trigger Group detailed page"
Then I should see "trigger group displayed" in "trigger group detail page"
Then I should see "See rules using this Trigger Group" in "trigger Group detailed page"
When I click "See rules using this Trigger Group" in "trigger Group detailed page"
Then I should see "Trigger Group Usage" as "popup window" in "trigger Group detailed page"
 And I should see "following Trigger Group Usage" messages
          |Changes to trigger group affects the following rules:|
          |View Rules Details|
When I click "cancel button in trigger group usage window" in "trigger Group detailed page"
 And I save the "trigger group details page" with "triggers"
Then I should see "following Trigger Group Alert" messages
          |Changes to trigger group affects the following rules:|
          |View Rules Details|
          |Continue with Save?|
When I click "Save" in "Trigger Group Alert popup"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_1" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rules detailed page with TG" in "rules detailed page"
 And I should see "rulename,ruleid" in "rules detailed page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_2" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rulename,ruleid" in "rules detailed page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_3" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rulename,ruleid" in "rules detailed page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_4" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rulename,ruleid" in "rules detailed page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_5" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rulename,ruleid" in "rules detailed page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "TG_Associate_Rule_6" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "test19302" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "trigger group"
Then I should see "rulename,ruleid" in "rules detailed page"
When I navigate to "Find rules" from "rules detailed page"
When I click "Find Rules" from "RULES"
When I search for "test19302" as "Trigger Group Name" by filter options as "All"
 And I click "trigger group name" in "Find rule page"
When I click "trigger Group Edit" in "trigger Group detailed page"
Then I should see "See rules using this Trigger Group" in "trigger Group detailed page" 
When I click "See rules using this Trigger Group" in "trigger Group detailed page"
Then I should see "Trigger Group Usage" as "popup window" in "trigger Group detailed page"
 And I should see "following Trigger Group Usage" messages
          |Changes to trigger group affects the following rules:|
          |View Rules Details|
 And I should see "Max Five Rulename - Ruleid" as "associated rules with TG on popup" in "trigger Group detailed page"
When I click "View Rules Details" in "Trigger Group Usage popup"        
Then I should see "all the rules which are associated with TG" in "rules listing page"
When I click "trigger group name" in "Find rule page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I select "Keyword Pattern" from "select trigger dropdown" in "create rule page"
Then I should see "keyword pattern attributes displayed" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
When I save the "keyword pattern trigger" with "all attributes types"
When I save the "trigger group details page" with "triggers"
Then I should see "Max Five Rulename - Ruleid" as "associated rules with TG on popup" in "trigger Group detailed page"
When I click "Save" in "Trigger Group Alert popup"

@regression_bcom_pom
@jregression_19508_1_4.8
Scenario: Create rule with modify result set action with Boost Attribute Values
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
        |Free Shipping|
        |Gift with Purchase|
        |Sales & Offers|
        |Special Purchase|
 And I click "ok in select attribute value window" in "create rule page"
 And I click "addAttributeValue" in "create rule page"
 And I click "Accessories Type" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Cosmetic Bags|
        |Hair Brushes|
        |Hair Dryers|
        |Puffs & Sponges|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test19508" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "following selected attribute values" from "Special Offers"
        |Buy More Save More|
        |Free Shipping|
        |Gift with Purchase|
        |Sales & Offers|
        |Special Purchase|
Then I should see "following selected attribute values" from "Accessories Type"        
        |Cosmetic Bags|
        |Hair Brushes|
        |Hair Dryers|
        |Puffs & Sponges| 

@regression_bcom_pom 
@jregression_19508_2_4.8_bcom
Scenario: modify result set action with Boost Attribute Values for update,cancel & delete
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
        |Free Shipping|
        |Gift with Purchase|
        |Sales & Offers|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 When I click "edit action" in "create rule page"
 And I click "addAttributeValue" in "create rule page"       
 And I click "Special Offers" in "select attribute values window" 
 And I uncheck "Buy More Save More,Free Shipping,Gift with Purchase,Sales & Offers" in "select attribute values window"
 And I click "cancel in select attribute value window" in "create rule page"
Then I should see "popup error" messages 
        |Selecting 'OK' will cancel all your changes and 'Cancel' to come back to previous screen.|
When I click "Ok" in "popup window"
 And I click "addAttributeValue" in "create rule page" 
 And I click "Special Offers" in "select attribute values window" 
 And I uncheck "Buy More Save More,Free Shipping,Gift with Purchase,Sales & Offers" in "select attribute values window"
 And I click "cancel in select attribute value window" in "create rule page"
Then I should see "popup error" messages 
        |Selecting 'OK' will cancel all your changes and 'Cancel' to come back to previous screen.|
When I click "Cancel" in "popup window"
 And I click "Accessories Type" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Cosmetic Bags|
        |Hair Brushes|
        |Hair Dryers|
        |Puffs & Sponges|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test19508" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "following selected attribute values" from "Accessories Type"        
        |Cosmetic Bags|
        |Hair Brushes|
        |Hair Dryers|
        |Puffs & Sponges|
        
@regression_bcom_pom
@jregression_19508_3_4.8_bcom
Scenario: Multiple Boost Attribute Values with modify result set
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
Then I should see "add attribute values plus icon" as "button" in "create rule page"
Then I should see "sequence" as "1" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
        |Free Shipping|
        |Gift with Purchase|
 And I click "ok in select attribute value window" in "create rule page"
 And I click "add attributes plus" in "create rule page"
Then I should see "sequence" as "2" in "create rule page"        
When I click "addAttributeValue" in "create rule page"
  And I click "Accessories Type" in "select attribute values window" 
  And I check "following attribute values in select attribute values window"
        |Cosmetic Bags|
        |Hair Brushes|
        |Hair Dryers|
 And I click "ok in select attribute value window" in "create rule page"
 And I click "add attributes plus" in "create rule page"
Then I should see "sequence" as "3" in "create rule page"        
When I click "addAttributeValue" in "create rule page"
 And I click "Jewelry Material" in "select attribute values window"
 And I check "following attribute values in select attribute values window"
        |Gold|
        |Sterling Silver|
        |Stone Accents|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I delete the "Accessories Type" with "modify result set attribute values"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test19508" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "following selected attribute values" from "Special Offers"        
              |Buy More Save More|
              |Free Shipping|
              |Gift with Purchase|
Then I should see "following selected attribute values" from "Jewelry Material"
        |Gold|
        |Sterling Silver|
        |Stone Accents|
         
@regression_bcom_pom
@jregression_19508_4_4.8_bcom
Scenario: Combined Boost and Boost Attribute Value in modify result set
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
        |Free Shipping|
        |Gift with Purchase|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "add action" in "create rule page"
 And I select "Modify Result Set" from "action drop down" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test19508" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "following selected attribute values" from "Special Offers"        
             |Buy More Save More|
             |Free Shipping|
             |Gift with Purchase|
Then I should see "product id" as "4199" in "rules detailed page"

@regression_bcom_pom
@jregression_19508_5_4.8_bcom
Scenario: Error validation with Boost Attribute Value in modify result set
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I save the "action" with "action atrributes"                
Then I should see "popup error" messages 
        |You should add values for each attribute.|
When I click "Ok" in "popup window"
 And I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
         |Buy More Save More|
         |Free Shipping|
 And I click "boost attribute window ok button" in "create rule page"
 And I remove "1" from "sequence text field"
 And I save the "action" with "action atrributes"
Then I should see "popup error" messages 
        |The sequence number should be a positive number.|
When I click "Ok" in "popup window"
When I enter "sequence value" as "0" in "sequence text field"
 And I save the "action" with "action atrributes"
Then I should see "popup error" messages 
        |The sequence number should be a positive number.|
When I click "Ok" in "popup window"
When I enter "sequence value" as "onlynums" in "sequence text field"
 And I save the "action" with "action atrributes"
Then I should see "popup error" messages 
        |The sequence number should be a positive number.|         
When I click "Ok" in "popup window"

@regression_bcom_pom
@jregression_19508_6_4.8_bcom
Scenario: same sequence number for different groups within one action
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I should see "addAttributeValue" as "button" in "create rule page"
 And I should see "add attribute values plus icon" as "button" in "create rule page"
When I click "addAttributeValue" in "create rule page"
 And I enter "s" as "auto suggestion input value" in "Key in Attribute window"
Then I should not see "autosuggestion drop down" at "Key in Attribute window" 
 And I enter "xx" as "invalid auto suggestion input value" in "Key in Attribute window"
Then I should not see "autosuggestion drop down" at "Key in Attribute window"  
When I enter "sp" as "auto suggestion input value" in "Key in Attribute window"
Then I should see "auto suggestion drop down" in "Key in Attribute window"
When I select "value" from "auto suggestion drop down" in "Key in Attribute window"
When I enter "Special Offers" as "auto suggestion input value" in "Key in Attribute window"
Then I should see "auto suggestion drop down" in "Key in Attribute window"
When I select "Special Offers" from "auto suggestion drop down" in "Key in Attribute window" 
 And I check "following attribute values in select attribute values window"
           |Buy More Save More|
           |Free Shipping|  
 And I click "ok in select attribute value window" in "create rule page"
 And I remove "1" from "sequence text field"
 And I enter "sequence value" as "2" in "sequence text field"
 And I click "add attributes plus" in "create rule page"
Then I should see "sequence" as "2" in "create rule page"        
When I click "addAttributeValue" in "create rule page"
  And I click "Accessories Type" in "select attribute values window" 
  And I check "following attribute values in select attribute values window"
           |Cosmetic Bags|
           |Hair Brushes|
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "category id"
Then I should see Publish Flag "ON"
Then I should see "rulename" as "test19508" in "rules detailed page"
Then I should see "description" as "resultsettesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page"
Then I should see "sequence" as "2" in "create rule page"
Then I should see "following selected attribute values" from "Special Offers"        
             |Buy More Save More|
             |Free Shipping|    
Then I should see "sequence" as "2" in "create rule page"                
Then I should see "following selected attribute values" from "Accessories Type"        
              |Cosmetic Bags|
              |Hair Brushes|



@regression_bcom_pom                  
@jregression_pom_1
@jregression_20253_1_4.8_bcom
Scenario: Suppressing certain Actions for certain Triggers: Disable in GUI
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test19508" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Display Message" from "action drop down" in "create rule page"
 And I enter "display message" as "sorry not avaliable" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create trigger group page"
Then I should see "select trigger drop down displayed" in "create rule page"
 And I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Result Set|
                  |Product Data Match|
                  |Keyword|
                  |Facet Refinement|
                  |Result Count|
  And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "RDPP Algorithm" from "action drop down" in "create rule page"
 And I select "94 - 94_100DollarSales" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "effective date" as "current date for rdpp algorithm" in "create rule page"
 And I enter "expiration date" as "future date for rdpp algorithm" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Result Set|
                  |Product Data Match|
                  |Keyword|
                  |Facet Refinement|
                  |Result Count|
                  |Category Ids|
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"                         
When I select "URL Redirect" from "action drop down" in "create rule page"
 And I enter "url" as "http://google.com/" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|      
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"  
When I select "Category Redirect" from "action drop down" in "create rule page"
 And I enter "category id" as "193" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|      
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"                       
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I enter "pdp id" as "4199" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
                  |Category Ids|  
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"   
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Banners" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "510682" in "create rule page"
 And I select "KWS_TOP_BANNER" from "media group location" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|
 And I click "edit action" in "create rule page"
 And I select "Zero Results Media" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "201540" in "create rule page"  
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|
 And I click "edit action" in "create rule page"                 
When I select "Copy Block Media" from "select media type dropdown" in "create rule page"  
 And I enter "media group id" as "510690" in "create rule page"  
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Result Set|
                  |Facet Refinement|
                  |Result Count|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Category Ids|        
 And I click "edit action" in "create rule page"                                            
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Master or Member Products" from "action drop down" in "create rule page"
 And I select "Show only the Master Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|
 And I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"                  
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "All" from "show facet filter by drop down" in "create rule page"
 And I click "showfacet find button" in "create rule page"
 And I select "Best Gifts,Brand" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|                  
 And I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "create rule page"
   And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
   And I click "addAttributeValue" in "create rule page"
   And I click "Special Offers" in "select attribute values window"
   And I check "following attribute values in select attribute values window"
                |Buy More Save More|
                |Free Shipping|
   And I click "ok in select attribute value window" in "create rule page"     
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "create rule page"
   And I select "Remove" from "mrs action menu" in "create rule page"
   And I enter "product id" as "4199" in "create rule page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
  And I click "edit action" in "create rule page"
   And I select "Replace" from "mrs action menu" in "create rule page"
   And I enter "product id" as "4199" in "create rule page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
   And I click "edit action" in "create rule page"
   And I select "Add" from "mrs action menu" in "create rule page"
   And I enter "product id" as "4199" in "create rule page"
   And I save the "action" with "action atrributes"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
                  |Category Ids|
                  |Result Set|
                  |Facet Refinement|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
When I select "Keyword" from "trigger drop down" in "create rule page"
 And I enter "keyword search value" as "ck" in "create rule page"
 And I save the "triggers" with "keyword"
And I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
 And I enter "replace with term" as "wine" in "create rule page"
 And I save the "action" with "action atrribute"
 And I click "Edit trigger" in "create rule page"
Then I should see "keyword" as "selected" in "trigger drop down"
Then I should see "following triggers enabled" from "trigger drop down"
                  |Keyword Pattern|
                  |Keyword|
                  |Product Data Match|
 And I should see "following triggers disabled" from "trigger drop down"
                  |Result Count|   
                  |Facet Refinement|
                  |Category Ids|
                  |Result Set|                 
         
@regression_bcom_pom
@jregression_pom_1
@jregression_20253_2_4.8_bcom
Scenario: checking actions when selecting triggers
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "test20253" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create trigger group page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Keyword" from "trigger drop down" in "create rule page"
 And I enter "keyword search value" as "ck" in "create rule page"
 And I save the "triggers" with "keyword"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page" 
 And I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search|
 And I should see "following actions disabled" from "action drop down"
                  |Facet Value Sequence|
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Keyword Pattern" from "trigger drop down" in "create rule page"                  
 And I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
 And I click "plusicon" in "create rule page"
 And I create "keyword pattern trigger dropdown" with "Material" and the value as "glass,wood"
 And I click "plusicon" in "create rule page"
 And I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
 And I click "plusicon" in "create rule page"
 And I create "keyword pattern trigger dropdown" with "Product Noun" and the value as "Food Processor,makeup-brushes"
 And I click "plusicon" in "create rule page"
 And I create "keyword pattern trigger dropdown" with "Style" and the value as "Wall Clock,T Shirt" 
 And I save the "triggers" with "keyword"
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search| 
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Result Set" from "trigger drop down" in "create rule page"                  
 And I create "result set trigger" with "Category" and the value as "193,>,70"
 And I click "plusicon" in "create rule page"
 And I create "result set trigger" with "Brand" and the value as "calvin klein,<,75"
 And I click "plusicon" in "create rule page"
 And I create "result set trigger" with "Product Noun" and the value as "food storage,>,75"
 And I click "plusicon" in "create rule page"
 And I create "result set trigger" with "Normal Color" and the value as "Blue,<,75"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Modify Result Set|
                  |Show Master or Member Products|
  And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Facet Refinement" from "trigger drop down" in "create rule page"                  
 And I create "facet refinement trigger" with "Brand" and the value as "Cache,Baby Brezza"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Show Master or Member Products|
                  |Modify Result Set|  
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Product Data Match" from "trigger drop down" in "create rule page"
When I create "product data macth trigger" with "Search_Type" and the value as "Mini Bags,Eye Treatments"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Occasion" and the value as "Day to Night,Evening/Formal"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Material" and the value as "glass,wood"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Gender" and the value as "Adult,Child"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Style" and the value as "Relaxed,T-Shirt"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Noun" and the value as "Chip and Dip,Coffee Accessory"        
 And I save the "triggers" with "product data match"  
Then I should see "select action drop down displayed" in "create rule page" 
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
 And I should see "following actions disabled" from "action drop down"             
                  |Execute New Search| 
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Result Count" from "trigger drop down" in "create rule page"                  
 And I create "result count trigger" with "Greater Than" and the value as "2000"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Master or Member Products|
                  |Execute New Search|
                  |Modify Result Set|
                  |Show Facets|
When I click "Edit trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Category Ids" from "trigger drop down" in "create rule page"                  
 And I enter "category ids" as "194" in "create rule page"
 And I save the "triggers" with "keyword"  
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Category Redirect|
                  |URL Redirect|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |Display Message|
                  |PDP Redirect|
                  |Execute New Search|
                
@regression_bcom_pom                  
@multipleactionstest_bcom
Scenario: Able to create multiple actions
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "multipleactions" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Display Message" from "action drop down" in "create rule page"
 And I enter "display message" as "sorry not avaliable" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
When I select "RDPP Algorithm" from "action drop down" in "create rule page"
Then I should see "RDPP Algorithm drop down,effective,expiration,plusicon and cross mark" in "create rule page"
When I select "64 - 76_50Newness/30Avail/20Sale" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "effective date" as "current date for rdpp algorithm" in "create rule page"
 And I enter "expiration date" as "future date for rdpp algorithm" in "create rule page"
 And I click "plusicon in rdpp algorithm" in "create rule page"
 And I select "52 - 52_80Newness/20Avail" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "effective date & expiration date " as "date which are different from previous for rdpp algorithm" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Banners" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "510682" in "create rule page"
 And I select "KWS_TOP_BANNER" from "media group location" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Zero Results Media" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "201540" in "create rule page"  
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
When I select "Copy Block Media" from "select media type dropdown" in "create rule page"  
 And I enter "media group id" as "510690" in "create rule page"  
 And I save the "action" with "action atrribute"  
When I click "add action" in "create rule page"
When I select "Show Master or Member Products" from "action drop down" in "create rule page"
 And I select "Show only the Master Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Remove" from "mrs action menu" in "create rule page"
  And I enter "product id" as "4199" in "create rule page"
  And I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Add" from "mrs action menu" in "create rule page"
  And I enter "product id" as "4199" in "create rule page"
  And I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window"
 And I check "following attribute values in select attribute values window"
         |Buy More Save More|
         |Free Shipping|    
 And I click "ok in select attribute value window" in "create rule page"       
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "rulename" as "multipleactions" in "rules detail page"
 And I should see "description" as "resultsettesting" in "rules detail page"
 And I should see "effectivedate" as "today" in "rules detail page"
 And I should see "expirationdate" as "tomorrow" in "rules detail page"
 And I should see "Rule Owner" as "SuperBAUser" in "rules detail page"
 And I should see "Rule Detail Edit button" as "enabled" in "rules detail page"
 And I should see "Rule Detail Copy button" as "enabled" in "rules detail page"
 And I should see "Rule Effective State" as "Effective" in "rules detail page" 

@regression_bcom_pom
@category_redirect_action_bcom
@rerun_bcom
Scenario: category redirect action creation,editing,cancel & error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "category_redirect_action" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Category Redirect" from "action drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<following errors>" messages 
            |Category ID is missing.|
When I click "Ok" in "popup window"
Then I should see "select facet button" as "disabled" in "create rule page"
When I enter "category id" as "123456" in "create rule page"
 And I save the "action" with "action atrribute"   
Then I should see "<following errors>" messages 
       |Invalid Category, please enter a valid category id|
When I enter "category id" as "193" in "create rule page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I select "Socks,Multipack" from "facet value sub window" in "create rule page"
 And I click "Ok" in "select facet window"
 And I click "select facet button" in "create rule page"
Then I should see "facet and values" as "Tights and Socks Type&Socks, Multipack" in "select facet window"
When I select "Shoe Occasion" from "facet sub window" in "create rule page"
 And I select "Day to Night,Wear to Work" from "facet value sub window" in "create rule page"
 And I click "Ok" in "select facet window"
 And I save the "action" with "action atrribute"
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I uncheck "Socks" in "select facet window"
 And I click "Cancel" in "select facet window"
Then I should see "facet and values" as "Tights and Socks Type&Socks, Multipack" in "select facet window"
Then I should see "facet and values" as "Shoe Occasion&Day to Night, Wear to Work" in "select facet window" 
 And I click "cancel button to remove the changes from actions" in "create rule page"
Then I should see "facet and values" as "Tights and Socks Type&Socks, Multipack" in "select facet window"
Then I should see "facet and values" as "Shoe Occasion&Day to Night, Wear to Work" in "select facet window" 
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I uncheck "Socks" in "select facet window"
 And I click "Ok" in "select facet window"
 And I save the "action" with "action atrribute"
Then I should see "Add Action" as "disabled" in "create rule page" 
When I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "facet and values" as "Tights and Socks Type&Multipack" in "select facet window"
Then I should see "facet and values" as "Shoe Occasion&Day to Night, Wear to Work" in "select facet window" 
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I select "Socks" from "facet value sub window" in "create rule page"
 And I click "Ok" in "select facet window"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I select "Socks" from "facet value sub window" in "create rule page"
 And I click "Ok" in "select facet window"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "category actions"
Then I should see "facet and values" as "Tights and Socks Type&Socks, Multipack" in "select facet window"
Then I should see "facet and values" as "Shoe Occasion&Day to Night, Wear to Work" in "select facet window" 
Then I should see "rulename" as "Copy of category_redirect_action" in "rules detailed page" 
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I uncheck "Socks" in "select facet window"
 And I click "Ok" in "select facet window"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "rules detail page"
 And I click "select facet button" in "create rule page"
 And I select "Tights and Socks Type" from "facet sub window" in "create rule page"
 And I uncheck "Socks" in "select facet window"
 And I click "Ok" in "select facet window"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "category actions"
Then I should see "facet and values" as "Tights and Socks Type&Multipack" in "select facet window"
Then I should see "facet and values" as "Shoe Occasion&Day to Night, Wear to Work" in "select facet window" 
Then I should see "rulename" as "Copy of category_redirect_action" in "rules detailed page" 

@regression_bcom_pom
@url_redirect_action
@rerun_bcom
Scenario: creating,editing,canceling & error validation for url redirect action
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "urlredirect" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "URL Redirect" from "action drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<following errors>" messages 
            |Url is missing|
When I enter "url" as "http://google.com/" in "create rule page"
 And I save the "action" with "action atrribute"
 And I click "edit action" in "rules detail page"
 And I enter "url" as "http://macys.com/" in "create rule page"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "rules detail page"
 And I enter "url" as "http://domain.com/" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "Add Action" as "disabled" in "create rule page" 
When I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "rulename" as "urlredirect" in "rules detailed page"  
 And I should see "enter url" as "http://domain.com/" in "rules detailed page"
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I enter "url" as "http://googletest.com/" in "create rule page"
 And I click "cancel button to remove the changes from actions" in "create rule page"
Then I should see "enter url" as "http://domain.com/" in "rules detailed page"
When I click "edit action" in "rules detail page"
 And I enter "url" as "http://googletest.com/" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "url redirect action"
Then I should see "rulename" as "Copy of urlredirect" in "rules detailed page"  
 And I should see "enter url" as "http://googletest.com/" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I enter "url" as "http://gspann.com" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "url redirect action"
Then I should see "rulename" as "Copy of urlredirect" in "rules detailed page"  
 And I should see "enter url" as "http://gspann.com" in "rules detailed page" 

@regression_bcom_pom
@pdp_redirect_action_bcom

Scenario: creating,editing,canceling & error validation for pdp redirect
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "pdpredirect" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<following errors>" messages 
            |Product id is missing|
When I enter "pdp id" as "909000" in "create rule page"
Then I should see "<following errors>" messages 
            |Invalid product id|
When I enter "pdp id" as "1082410" in "create rule page"
 And I save the "action" with "action atrribute"
 And I click "edit action" in "create rule page"
 And I enter "pdp id" as "1082409" in "create rule page"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "create rule page"
 And I enter "pdp id" as "1082409" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "Add Action" as "disabled" in "create rule page" 
When I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "rulename" as "pdpredirect" in "rules detailed page"
 And I should see "pdpid" as "1082409" in "rules detailed page"
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I enter "pdp id" as "1082408" in "create rule page"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "create rule page"
 And I enter "pdp id" as "1082408" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "pdp redirect actions"
Then I should see "rulename" as "Copy of pdpredirect" in "rules detailed page"
 And I should see "pdpid" as "1082408" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I enter "pdp id" as "1082407" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "pdp redirect actions"
Then I should see "rulename" as "Copy of pdpredirect" in "rules detailed page"
 And I should see "pdpid" as "1082407" in "rules detailed page"

@regression_bcom_pom 
@show_master_member_products
Scenario: creating,editing,canceling & error validation for show master and member products
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "smmproducts" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Master or Member Products" from "action drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<popup error>" messages 
            |Please select one of the options to display Masters, Members or both to save the Action|
When I click "Ok" in "popup window" 
And I select "Show only the Master Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute" 
 And I click "edit action" in "create rule page"
 And I select "Show only the Member Products" from "select display drop down" in "create rule page"
 And I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "smm product type" as "Show only the Master Products" in "rule detailed page"
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I select "Show only the Member Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "show master and member product action"
Then I should see "smm product type" as "Show only the Member Products" in "rule detailed page"
Then I should see "rulename" as "Copy of smmproducts" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
When I click "edit action" in "rules detail page"
 And I select "Show both Master and Member Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute"
 And I save the "rules details page" with "show master and member product action"
Then I should see "smm product type" as "Show both Master and Member Products" in "rule detailed page"
Then I should see "rulename" as "Copy of smmproducts" in "rules detailed page" 

@regression_bcom_pom
@modify_result_set_action_bcom
Scenario: creating, editing, canceling & error validation for modify result set
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "mrsaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<popup error>" messages 
            |Please enter at least one saved set ID / query ID or product ID to save this action|
When I click "Ok" in "popup window"
 And I select "Replace" from "mrs action menu" in "create rule page"
 And I enter "product id" as "1234567" in "create rule page"
 And I enter "saved set query id" as "98765432" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "<following error>" messages 
            |The following saved set id is invalid: 98765432|
            |The following product id is invalid: 1234567| 
When I enter "product id" as "fkjsnfkj" in "create rule page"
 And I enter "saved set query id" as "fsjdjfhsd" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "<popup error>" messages 
            |Invalid non numeric Product ID|
            |Invalid non numeric Saved Set ID / Query ID|
When I click "Ok" in "popup window" 
 And I enter "product id" as "4199" in "create rule page"
 And I enter "saved set query id" as "100685" in "create rule page"
 And I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
Then I should see "Modify Result Set" as "action disabled" in "create rule page"
When I click "cancel to remove action" in "create rule page"
 And I click "edit action" in "create rule page"
 And I select "Remove" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Add" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Replace" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions" 
Then I should see "<following error>" messages 
         |Replace can't be combined with any other Modify Search Results action|
         |Modify Search Results Add action cannot be combined with Modify Search Results Replace|  
         |Modify Search Results Remove action cannot be combined with Modify Search Results Replace|   
When I click "edit action" in "create rule page"
 And I select "Add" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "creating rule page" with "actions" 
Then I should see "<following error>" messages 
            |There should be only one Modify Search Results Add action per rule.|
When I click "edit action" in "create rule page"
 And I select "Boost" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "creating rule page" with "actions" 
Then I should see "<following error>" messages 
            |Modify Search Results Add action can be combined with at most one Modify Search Results Boost.|
            |There should be only one Modify Search Results Boost action per rule.|             
When I click "edit action" in "create rule page"
 And I select "Remove" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "creating rule page" with "actions"  
Then I should see "modified result set actions" in "rules detailed page"
 And I click "Edit Rule" in "rules detailed page"
 And I edit "Boost" with "Boost Attribute Values" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
 And I click "ok in select attribute value window" in "create rule page"       
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "mrs action"
Then I should see "modified result set actions" in "rules detailed page"
 And I should see "mrs action type" as "Add" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"
 And I should see "mrs action type" as "Boost Attribute Values" in "rules detailed page"
 And I should see "following selected attribute values" from "Special Offers"
        |Buy More Save More|
 When I click "Copy button" in "rules detail page"
 And I edit "Remove" with "Boost" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I select "Boost" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "mrs action"
Then I should see "modified result set actions" in "rules detailed page"
 And I should see "mrs action type" as "Add" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"
 And I should see "mrs action type" as "Boost Attribute Values" in "rules detailed page"
 And I should see "following selected attribute values" from "Special Offers"
        |Buy More Save More|
 And I should see "mrs action type" as "Boost" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"   
 
@regression_bcom_pom
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with keyword
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testkeyword" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testkw" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testkeyword" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page" 
 And I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search|
 And I should see "following actions disabled" from "action drop down"
                  |Facet Value Sequence|
 @regression_bcom_pom                 
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with kwp
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testkwp" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword Pattern" from "select trigger dropdown" in "create rule page"
Then I should see "keyword pattern attributes displayed" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Brand" and the value as "50 cent,Tempur-Pedic"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Customer Service" and the value as "CD Player,Multi-Purpose Pot"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Material" and the value as "Leather,wood"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Occasion" and the value as "Back to School/Fall,evening"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Product Noun" and the value as "Food Processor,makeup-brushes"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Style" and the value as "Wall Clock,T Shirt"
When I click "plusicon" in "create rule page"
When I create "keyword pattern trigger dropdown" with "Gender" and the value as "Female,Adult"
When I save the "keyword pattern trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testkwprule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testkwp" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page" 
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Execute New Search| 
@regression_bcom_pom                  
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with pdm
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testpdm" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Product Data Match" from "select trigger dropdown" in "create rule page"
Then I should see "product data match triiger" in "trigger group drop down"
When I create "product data macth trigger" with "Search_Type" and the value as "Dress,Electronics & Gadgets"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Occasion" and the value as "Wear to Work,Evening/Formal"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Material" and the value as "Leather,wood"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Gender" and the value as "Adult,Child"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Search_Style" and the value as "Relaxed,Sleeveless"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Noun" and the value as "food storage,cake plate"
When I click "plusicon" in "create rule page"
When I create "product data macth trigger" with "Product Type" and the value as "Pendants,Personal Care"
When I save the "product data match trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testpdmrule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testpdm" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "rules detailed page" 
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Media|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  
 @regression_bcom_pom                 
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with result count
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testrc" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Result Count" from "select trigger dropdown" in "create rule page"
Then I should see "result count trigger" in "trigger group drop down"
When I create "result count trigger" with "Greater Than" and the value as "2000"
When I save the "result count trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testrccrule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "create rule page"                         
When I select "URL Redirect" from "action drop down" in "create rule page"
 And I enter "url" as "http://google.com/" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"   
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I enter "pdp id" as "4199" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"   
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "Category Redirect" from "action drop down" in "rules detailed page"
 And I enter "category id" as "121" in "rules detailed page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"   
And I click "edit action" in "create rule page"                                            
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Master or Member Products" from "action drop down" in "create rule page"
 And I select "Show only the Master Products" from "select display drop down" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"  
And I click "edit action" in "create rule page"                                            
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "All" from "show facet filter by drop down" in "create rule page"
 And I click "showfacet find button" in "create rule page"
 And I select "Age Group,Color Family" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"   
And I click "edit action" in "create rule page"                                            
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I enter "saved set query id" as "1873" in "create rule page"
 And I save the "action" with "action atrributes"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I unselect "actions" from "action drop down" in "create rule page"
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Master or Member Products|
                  |Execute New Search|
                  |Modify Result Set|
                  |Show Facets|
                  
@regression_bcom_pom                  
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with category id
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testcategoryid" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
Then I should see "select trigger drop down displayed" in "create rule page"
When I select "Category Ids" from "trigger drop down" in "create rule page"                  
 And I enter "category ids" as "193" in "create rule page"
 And I save the "triggers" with "keyword"  
 And I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testtestcidrule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "rules detailed pag"
Then I should see "select action drop down displayed" in "rules detailed pag"
When I select "Display Message" from "action drop down" in "rules detailed pag"
 And I enter "display message" as "sorry not avaliable" in "rules detailed page" 
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testcategoryid" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I enter "pdp id" as "4199" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testcategoryid" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"  
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "Show Media" from "action drop down" in "rules detailed page"
 And I select "Banners" from "select media type dropdown" in "rules detailed page"
 And I enter "media group id" as "49490" in "create rule page"
 And I select "KWS_TOP_BANNER" from "media group location" in "rules detailed page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testcategoryid" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I unselect "actions" from "action drop down" in "create rule page"
When I enter "trigger group name" as "testcategoryid" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Show Master or Member Products|
                  |Show Facets|
                  |Modify Result Set|
                  |Category Redirect|
                  |URL Redirect|
                  |Show Media|
 And I should see "following actions disabled" from "action drop down"
                  |Display Message|
                  |PDP Redirect|
                  |Execute New Search|

@regression_bcom_pom                 
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with result set
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testrst" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Result Set" from "select trigger dropdown" in "create rule page"
Then I should see "resultset displayed" in "create group trirgger page"
When I create "result set trigger" with "Category" and the value as "193,>,70"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Brand" and the value as "Joop!,<,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Noun" and the value as "food storage,>,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Normal Color" and the value as "Blue,<,75"
When I click "plusicon" in "create rule page"
When I create "result set trigger" with "Product Type" and the value as "Jackets,>,70"
When I save the "Result set trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testrstrule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "create rule page"                         
When I select "URL Redirect" from "action drop down" in "create rule page"
 And I enter "url" as "http://google.com/" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testrst" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I enter "pdp id" as "4199" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testrst" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I select "Category Redirect" from "action drop down" in "rules detailed page"
 And I enter "category id" as "121" in "rules detailed page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testrst" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"  
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "rules detailed page" 
When I unselect "actions" from "action drop down" in "create rule page"
When I enter "trigger group name" as "testrst" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
 And I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Modify Result Set|
                  |Show Master or Member Products|
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|                 
                  
@regression_bcom_pom                       
@jregression_20254_4.10_bcom
Scenario: Suppressing certain Actions in rule page when create trigger group with facet refinement
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "testfrt" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "Polaroid,Poleci"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
When I click "plusicon" in "create rule page"
When I create "facet refinement trigger" with "Occasion" and the value as "Easter/Spring,formal"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testfrtrule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "rules detailed page"
Then I should see "select action drop down displayed" in "create rule page"                         
When I select "URL Redirect" from "action drop down" in "create rule page"
 And I enter "url" as "http://google.com/" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testfrt" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page" 
When I select "PDP Redirect" from "action drop down" in "create rule page"
 And I enter "pdp id" as "4199" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testfrt" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page" 
When I select "Category Redirect" from "action drop down" in "create rule page"
 And I enter "category id" as "193" in "create rule page"
 And I save the "action" with "action atrribute"
When I enter "trigger group name" as "testfrt" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"  
# When I click "edit action" in "create rule page"
# Then I should see "select action drop down displayed" in "create rule page" 
# When I select "Modify Result Set" from "action drop down" in "create rule page"
 # And I enter "product id" as "4199" in "create rule page"
 # And I enter "saved set query id" as "1873" in "create rule page"
 # And I save the "action" with "action atrributes"
# When I enter "trigger group name" as "testfrt" in "create trigger group page"
# When I save the "triggergroup" with "trigger group name"
# Then I should see "popup error" messages 
       # |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
# When I click "Ok" in "popup window" 
When I click "edit action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page" 
When I unselect "actions" from "action drop down" in "create rule page"
When I enter "trigger group name" as "testfrt" in "create trigger group page"
When I save the "triggergroup" with "trigger group name"
 And I should see "following actions enabled" from "action drop down"
                  |RDPP Algorithm|
                  |Display Message|
                  |Show Media|
                  |Show Facets|
                  |Show Master or Member Products|
                  |Modify Result Set|  
 And I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Execute New Search|
                  |Facet Value Sequence|
                  	
@regression_bcom_pom                 
@jregression_20254_4.10_bcom                  
Scenario: verify incompatibility validation with execute new search                    
Given I have logged into Saturn as a Merchandise user                  
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed 
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
When I enter "replace with term" as "wine" in "create rule page"
When I save the "action" with "action atrributes"                  
When I click "add trigger" in "create rule page"
Then I should see "triggergroup button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "testrst" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I enter "trigger group name" as "testrc" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window"   
When I enter "trigger group name" as "testfrt" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 
When I enter "trigger group name" as "testcategoryid" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "triggergroup" with "trigger group name"
Then I should see "popup error" messages 
       |At least one trigger in this Trigger Group is incompatible with an action. Please remove incompatible combinations.|
When I click "Ok" in "popup window" 

@regression_bcom_pom
@jregression_20264_4.10_bcom
Scenario: creating showfacet with Add and Remove operators & checking keep_existing_flag
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showfacetaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "All" from "show facet filter by drop down" in "create rule page"
Then I should see "following showfacet operators" from "show facet operator drop down"  
                    |Add|
                    |Remove|
                    |Replace|
 And I should see "Replace" as "default showacet operator" in "create rulepage"    
 And I should see "Add" as "disabled showacet operator" in "create rulepage"                  
When I select "All" from "show facet filter by drop down" in "create rule page"
 #And I select "Add" from "show facet operators drop down" in "create rule page"
 And I click "showfacet find button" in "create rule page"
 And I select "Age Group,Color Family,Brand,Accessories Type" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I enter "sequence number" as "1" for "Brand" in "create rule page"
 And I select "Collections,Handbag Material" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I click "Accessories Type" in "facets window to make it uncheck"
 And I enter "text1" as "display name" for the facet "Collections"
 And I enter "text2" as "display name" for the facet "Brand"
 And I save the "action" with "action atrributes"    
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "showfacet actions displayed" in "rule details page"
Then I should see "Replace" as "selected show facet operator" in "rules detailed page"
#Then I should see "Add" as "selected show facet operator" in "rules detailed page"
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I select "Remove" from "show facet operators drop down" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "ruleid" in "rules detailed page"
Then I should see "Remove" as "selected show facet operator" in "rules detailed page" 
Then I should see "following facets with sequence numbers and displayname" from "show facet table" 
             |Age Group       |1|Age Category    |
             |Brand           |1|text2           |
             |Color Family    |2|Color           |
             |Collections     |5|text1           |
             |Handbag Material|6|Handbag Material| 
Then I should see "keep_existing_flag" as "Y" in "Saturn Database"

@regression_bcom_pom
@jregression_20264_4.10_bcom
Scenario: Edit Add/Remove options for existing migration CatHierarchy_Facets rule
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
When I search "CatHierarchy_Facets" as "Rule Name" with "Browse"
When I click "ruleid" in "rules listing page"
When I click "Edit Rule" in "rules detailed page"
Then I should see Publish Flag "ON"
Then I should see "showfacet action table displayed" in "rule detail page"
When I click "edit action" in "rules detail page"
 And I select "Add" from "show facet operators drop down" in "create rule page"
 And I save the "action" with "action atrributes"
Then I should see "Add" as "selected show facet operator" in "rules detailed page" 
When I click "edit action" in "rules detail page"
 And I select "Remove" from "show facet operators drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "resultset attributes"
Then I should see "Remove" as "selected show facet operator" in "rules detailed page" 


@regression_bcom_pom
@jregression_4.10_bcom
@jregression_20989_4.10_bcom
Scenario: Verify find trigger functionality from find trigger groups list page
Given I have logged into Saturn as a Merchandise user
When I click "Find Trigger Groups" from "RULES"
 And I click "Trigger Group Name" in "find trigger groups list page"
Then I should see "trigger grops sorted" as "Highest to Lowest" in "find trigger groups list page"
 And I click "Trigger Group Name" in "find trigger groups list page"
Then I should see "trigger grops sorted" as "Lowest to Highest" in "find trigger groups list page"
Then I should see "following trigger group options" from "filter by trigger group drop down"
                    |Trigger Group Name|
                    |Description|
When I enter "triggergroup name" as "test" in "find trigger groups list page"
When I click "filter trigger go button" in "find trigger groups list page"
Then I should see "trigger group name filtered" as "test" in "find trigger groups list page"  
When I click "Next pagination link" in "find trigger groups list page"
Then I should see "trigger group listings which are filtered by searching value" in "find trigger groups list page"
When I click "Previous pagination link" in "find trigger groups list page"
Then I should see "trigger group listings which are filtered by searching value" in "find trigger groups list page"
When I click "trigger group clear link" in "find trigger groups list page"
Then I should see "page loads with all the listings" in "find trigger groups list page" 
When I click "2nd pagination link" in "find trigger groups list page"
When I click "Next pagination link" in "find trigger groups list page"
Then I should see "trigger group listings displayed currently" in "3rd page"
When I click "Previous pagination link" in "find trigger groups list page"
Then I should see "trigger group listings displayed currently" in "2nd page"
When I click "First pagination link" in "find trigger groups list page"
Then I should see "trigger group listing displayed in first page" in "find trigger groups list page"
When I click "Last pagination link" in "find trigger groups list page"
Then I should see "trigger group listing displayed in last page" in "find trigger groups list page"
When I click "trigger group add button" in "find trigger groups list page"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "test_ftgp" in "create trigger group page"
When I enter "description" as "testftgpmessage" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "Cache,Cacharel"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
When I click "Find Trigger Groups" from "RULES"
When I select "Description" from "trigger group drop down" in "find trigger groups list page" 
When I enter "trigger group description" as "testftgpmessage" in "find trigger groups list page"
When I click "filter trigger go button" in "find trigger groups list page"
Then I should see "trigger groups list which are filtered by description" as "testftgpmessage" in "find trigger groups list page" 
 
@regression_bcom_pom    
@jregression_4.7_19149_bcom
Scenario:verfying cancel functionality for create trigger group
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Result Count" from "select trigger dropdown" in "create rule page"
Then I should see "following atrributes" from "Result Count trigger dropdown"
                 |Less Than|
                 |Greater Than|
 And I should see "Less Than" as "selected by default" in "create trigger group page"
When I create "result count trigger" with "Greater Than" and the value as "2000"
When I save the "result count trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers" 
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "result cout type and value" as "Greater Than,2000" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I create "result count trigger" with "Less Than" and the value as "1000" 
When I save the "result count trigger" with "all attributes types"
When I click "rules detail cancel button" in "trigger group detail page"
Then I should see "result cout type and value" as "Greater Than,2000" in "trigger group detail page"
 
 
 
@regression_bcom_pom
@regression_18639_19149_bcom
@jregression_18639_4.7_bcom
Scenario: duplicate trigger group error validation by edit & cancel
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "triggergroupname" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
When I click "Create Trigger Group" from "RULES"
When I enter "duplicate triger group name" as "triggergroupname" in "create trigger group page" 
When I click "add trigger" in "create rule page"
When I select "Keyword" from "select trigger dropdown" in "create rule page"
Then I should see "keyword trigger section displayed" in "create trigger group page"
When I create "Keyword trigger" with "keywords" and the value as "jeans,tops"
When I save the "keyword trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
Then I should see "following error" messages
    |Duplicate trigger group name|
When I enter "new_trigger_group_name" as "triggergroupname1" in "create trigger group page"
When I save the "create trigger group page" with "triggers"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I enter "duplicate triger group name" as "triggergroupname" in "trigger group detail page" 
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"
Then I should see "following error" messages
    |Duplicate trigger group name|
When I enter "new_trigger_group_name" as "triggergroupname2" in "trigger group detail page"
When I enter "description" as "trigger_group_testing" in "trigger group detail page" 
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup"   
Then I should see "trigger group name" as "triggergroupname2" in "trigger group detail page"
Then I should see "trigger group description" as "trigger_group_testing" in "trigger group detail page"
Then I should see "keyword search value" as "jeans,tops" in "trigger group detail page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I click "Edit trigger" in "rules detailed page"
When I edit "keyword trigger" with "keyswords" and the value as "color,style"
When I save the "keyword trigger" with "all attributes types"
When I click "rules detail cancel button" in "trigger group detail page"
Then I should see "trigger group name" as "triggergroupname2" in "trigger group detail page"
Then I should see "trigger group description" as "trigger_group_testing" in "trigger group detail page"
Then I should see "keyword search value" as "jeans,tops" in "trigger group detail page"
 


@regression_bcom_pom
@jregression_19380_4.7_bcom
Scenario: As a user I want to be able to add a Trigger Group to a Rule and able to verify al the error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "checking_duplicate_triggergroup" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I save the "create trigger group page" with "triggers"
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "rulestesting" in "create trigger group page"
When I enter "description" as "resultsettesting" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add trigger" in "create trigger group page"
 And I click "And" in "trigger global operator"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I save the "trigger" with "result set trigger"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" trigger with "Brand,calvin klein" as "facet type and facet value respectively"
When I save the "trigger" with "facet refinement trigger"
When I click "add trigger" in "create trigger group page"
When I select "Product Data Match" trigger with "Brand,calvin klein" as "attribute type and attribute value respectively"
When I save the "trigger" with "product data match trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group header" as "Trigger Group:" in "trigger group detail page"
Then I should see "trigger group name" as "rulestesting" in "trigger group detail page"
Then I should see "trigger group description" as "resultsettesting" in "trigger group detail page"
Then I should see "Keyword trigger search value" as "ck" in "trigger group detail page"
Then I should see "Keyword Pattern attributes" as "Brand,ck" in "trigger group detail page"
Then I should see "Result Set attributes" as "Brand,calvin klein,  >" in "trigger group detail page"
Then I should see "Facet Refinement attributes" as "Brand,Calvin Klein" in "trigger group detail page"
Then I should see "Product Data Match atrributes" as "Brand,Calvin Klein" in "trigger group detail page"
When I navigate to "create rule page" from "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "checking_duplicate_triggergroup" in "create trigger group page"
When I select "trigger group name" from "trigger group autosuggestion drop down" in "create rule page"
When I save the "trigger group" with "trigger group name"
When I click "Search" in "navigation type context attributes"
When I save the "creating rule page" with "triggers"
When I click "Edit Rule" in "rules detailed page"
When I click "add trigger" in "rules detailed page"
And I should see "default globaloperator" as "And" in "create trigger group page"
And I click "Or" in "trigger global operator"
When I click "trigger group radio button" in "rules detailed page"
When I enter "duplicate trigger group name" as "trigger group name" in "rules detailed page"
When I save the "trigger group" with "trigger group name"
Then I should see "following duplicate trigger group error" messages 
                 |2(or more) of the same Trigger Groups cannot exist in a single rule. Remove duplicate Trigger Group|


@regression_bcom_pom
@show_facet_action_bcom_all_option
Scenario:creating,editing,canceling & error validation for show facet action
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showfacetaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "All" from "show facet filter by drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<popup error>" messages 
            |Please select at least one facet to save the action|
When I click "Ok" in "popup window"
 And I select "Product Type" from "show facet filter by drop down" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "<popup error>" messages 
       |Please select at least one facet to save the action|
       |You must select a product type| 
When I click "Ok" in "popup window"
 And I enter "show facet product type" as "xyz" in "create rule page"
 And I click "show facet product type find button" in "create rule page"
Then I should see "following error" messages 
         |'xyz' is an incorrect value for Product Type, please enter valid value to save the Action|
Then I should see "following showfacet operators" from "show facet operator drop down"  
                    |Add|
                    |Remove|
                    |Replace|
  And I should see "Replace" as "default showacet operator" in "create rulepage"                      
When I select "All" from "show facet filter by drop down" in "create rule page"
 And I click "showfacet find button" in "create rule page"
 And I select "Age Group,Color Family,Brand,Accessories Type" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I enter "sequence number" as "1" for "Brand" in "create rule page"
 And I select "Collections,Handbag Material" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I click "Accessories Type" in "facets window to make it uncheck"
 And I enter "text1" as "display name" for the facet "Collections"
 And I enter "text2" as "display name" for the facet "Brand"
 And I save the "action" with "action atrributes"    
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "showfacet actions displayed" in "rule details page"
Then I should see "following facets with sequence numbers and displayname" from "show facet table" 
             |Age Group     |1|Age Category    |
             |Brand         |1|text2           |
             |Color Family  |2|Color           |
             |Collections   |5|text1           |
             |Handbag Material|6|Handbag Material|
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I click "Handbag Material" in "facets window to make it uncheck"  
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "show facet action"
Then I should see "showfacet actions displayed" in "rule details page" 
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I select "Bed Type,Fabric" from "show facets drop down" in "create rule page"
 And I remove "text2" from "display name field" for "Brand"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "show facet action"
Then I should see "showfacet actions displayed" in "rule details page"
Then I should see "following facets with sequence numbers and displayname" from "show facet table" 
             |Age Group    |1|Age Category    |
             |Brand        |1|Designer        |
             |Color Family |2|Color           |
             |Collections  |5|text1           |
             |Bed Type     |5|Bedding Type    |
             |Fabric       |6|Fabric          |
             

@regression_bcom_pom   
@jregression_4.10_bcom
@jregression_21004_4.10_bcom
Scenario: Verify Find Trigger Groups Autocomplete 
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed 
When I enter "TriggerGroupName" as "tgp_auto_complete" in "create trigger group page"
When I enter "description" as "testftgpmessage" in "create trigger group page"
When I click "add trigger" in "create rule page"
When I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "Cache,Cacharel"
When I save the "facet refinement trigger" with "all attributes types"
When I save the "create trigger group page" with "triggers"
When I click "Find Trigger Groups" from "RULES"
When I enter "triggergroup name" as "t" in "find trigger groups list page"
Then I should not see "autosuggestion drop down" at "trigger group name field" 
When I enter "triggergroup name" as "x-y" in "find trigger groups list page"
Then I should not see "autosuggestion drop down" at "trigger group name field" 
When I select "tgp" from "trigger group name autosuggestion drop down" in "find trigger groups list page"
Then I should see "max five unique values in autosuggestion" in "find trigger groups list page"
Then I should see "trigger group name has been selected from autosuggestion" in "find trigger groups list page"
When I click "trigger group clear link" in "find trigger groups list page"
When I enter "trigger group name" as "tg" to have "autosuggestion drop down"
When I append "tg" with "p" in the "same trigger group name field"
Then I should see "autosuggestion drop down refreshed" in "find trigger groups list page"





@regression_bcom_pom
@execute_new_search_action123
Scenario: create,edit,cancel, delete & error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed 
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
Then I should see "Execute New Search" as "action disabled" in "create rule page"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I select "Execute New Search" from "action drop down" in "create rule page"
Then I should see "Search Query" as "Replace ONLY Trigger Terms" in "create rule page"
 And I should see "append flag text" as "Customer sees the keywords they entered on the search results page." in "create rule page"
 And I should see "append flag check box" as "checked" in "create rule page"
When I enter "replace with term" as "red glass" in "create rule page"
When I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
When I enter "replace with term" as "winetest123690!@#%^&*()<>,.;'" in "create rule page"
When I select "Replace ALL Customer Search" from "Search Query" in "create rule page"
When I click "cancel button to remove the changes from actions" in "create rule page"
 And I click "edit action" in "create rule page"
 And I click "Add Filter" in "create rule page"
 And I select "Bed Size" from "facet autosuggestion drop down" in "select facet window"
 And I select "Full,King,Twin" from "facet value frame" in "select facet window"
 And I click "cancel in select attribute value window" in "create rule page"
 And I click "Add Filter" in "create rule page"
 And I select "Bed Size" from "facet autosuggestion drop down" in "select facet window"
 And I select "California King,King,Queen,Full,Twin" from "facet value frame" in "select facet window"
 And I click "ok in select attribute value window" in "create rule page"
 And I click "Add Filter" in "create rule page"
Then I should see "following facets and facet values in select filter window" from "facets filter window"
         |Bed Size|California King, King, Queen, Full, Twin|
When I select "Capacity" from "facet autosuggestion drop down" in "select facet window"
 And I select "1 cup,10 cup,14 cup,12 cup,4 cup" from "facet value frame" in "select facet window"
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I click "facets value cross mark" in "10 cup"
 And I click "facets value cross mark" in "California King"
 And I save the "action" with "action atrributes"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "execute new search action"
Then I should see "following facets and facet values" from "facets summary panel"
           |Bed Size|King, Queen, Full, Twin|
           |Capacity|1 cup, 14 cup, 12 cup, 4 cup| 
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rule detail page"
 And I select "Replace ONLY Trigger Terms" from "Search Query" in "rule detail page"
 And I click "append flag check box" in "rule detail page"
 And I click "Add Filter" in "create rule page"
 And I select "Collections" from "facet autosuggestion drop down" in "select facet window"
 And I select "Classics,Color,Fashion,Precious" from "facet value frame" in "select facet window"
 And I click "ok in select attribute value window" in "create rule page"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "execute new search action"
Then I should see "execute new search action has been updated" in "rule detail page"
Then I should see "Search Query" as "Replace ONLY Trigger Terms" in "rule detail page"
Then I should see "append flag check box" as "unchecked" in "rule detail page"
Then I should see "following facets and facet values" from "facets summary panel"
           |Bed Size|King, Queen, Full, Twin|
           |Capacity|1 cup, 14 cup, 12 cup, 4 cup|  
           |Collections|Classics, Color, Fashion, Precious| 
           
           
@regression_bcom_pom           
@execute_new_search_action
Scenario: Execute New Search action is only with Display Message & switch to other action from ENS 
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed 
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
When I select "Keyword" trigger with "ck" as "keyword search value"
When I save the "trigger" with "keyword trigger"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Execute New Search" from "action drop down" in "create rule page"
When I enter "replace with term" as "red glass" in "create rule page"
When I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
Then I should see "following actions disabled" from "action drop down"
                  |URL Redirect|
                  |Category Redirect|
                  |PDP Redirect|
                  |Show Master or Member Products|
                  |RDPP Algorithm|
                  |Show Media|
                  |Show Facets|
                  |Modify Result Set| 
Then I should see "following actions enabled" from "action drop down"
                |Display Message|
When I click "edit action" in "create rule page"
When I select "any other action" from "action drop down" in "create rule page"
When I select "RDPP Algorithm" from "action drop down" in "create rule page"
When I select "94 - 94_100DollarSales" from "rdpp algorithm type drop down" in "create rule page"
Then I should see "RDPP Algorithm drop down,effective,expiration,plusicon and cross mark" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following actions enabled" from "action drop down"
                |Display Message| 
                |URL Redirect|
                |Category Redirect|
                |PDP Redirect|
                |Show Master or Member Products|
                |RDPP Algorithm|
                |Show Media|
                |Show Facets|
                |Modify Result Set|
          
@Autocomplete_Suggestion_Rules_1
@regression_bcom_pom 
Scenario: creating,editing,cancellation,deletion & error validation for Autocomplete Suggestion Rules
Given I have logged into Saturn as a Merchandise user
When I click "Suggestion Rules" from "AUTOCOMPLETE"
 And I click "Add Rule" in "autosuggestion page"
Then I should see "autosuggestion publish checkbox" as "checked" in "autosuggestion page"
 And I should see "Include Synonyms checkbox" as "unchecked" in "autosuggestion page"
When I click "autosuggestion save button" in "autosuggestion page"
Then I should see "following popup error" messages 
             |Rule Name is required|
             |It is required to apply this rule to a facet|
             |It is required to display pattern|
When I click "Ok" in "popup window"
When I enter "autosuggestion rulename" as "asrule" in "autosuggestion page"
 And I click "Apply Rule Add Facet button" in "autosuggestion page"
 And I click "Ok" in "Select Facet Window in AutoSuggestion page"
Then I should see "popup error" messages 
             |Please select a Facet and a facet value|
When I click "Ok" in "popup window"              
 And I select "Brand" from "facet suggestion dropdown" in "autosuggestion page"
 And I select "360 Sweater" from "facet value suggestion dropdown" in "autosuggestion page"
 And I click "Ok" in "Select Facet Window in AutoSuggestion page"
 And I click "Display Pattern Add Facet button" in "autosuggestion page"
 And I select "Brand,Cookware Type,Gift Type" from "select facets and Text window" in "autosuggestion page"
 And I click "Ok" in "Select Facets and Text Window in AutoSuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
Then I should see "following popup error" messages 
             |Please select syntax in the dropdown for each Pattern|
When I click "Ok" in "popup window" 
When I select "Primary_Form_Normal" from "Select Synatx" in "Brand"  
 And I select "Primary_Form_Noun_Mod" from "Select Synatx" in "Cookware Type" 
 And I select "Primary_Form_Noun_Possessive" from "Select Synatx" in "Gift Type"
 And I enter "autosuggestion rank" as "test123" in "autosuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
Then I should see "following popup error" messages 
             |    The rank field should be a positive number less than 2.000.000.000| 
When I click "Ok" in "popup window" 
 And I enter "autosuggestion rank" as "11.999" in "autosuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
Then I should see "following popup error" messages 
             |    The rank field should be a positive number less than 2.000.000.000| 
When I click "Ok" in "popup window" 
 And I enter "autosuggestion rank" as "20000000002" in "autosuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
Then I should see "following popup error" messages 
             |    The rank field should be a positive number less than 2.000.000.000| 
When I click "Ok" in "popup window" 
 And I enter "autosuggestion rank" as "10000" in "autosuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
Then I should see "suggestion rules" in "Autocomplete Suggestion Rules Lists page"
When I select "Rule Name" from "autosuggestion filter dropdown" in "autosuggestion list page"
 And I enter "suggestion rule name" as "asrule" in "autosuggestion list page"
 And I click "autosuggestion Go button" in "autosuggestion list page"
 And I click "autosuggestion template id" in "autosuggestion list page"
Then I should see "autosuggestion publish checkbox" as "checked" in "autosuggestion page"
 And I should see "Include Synonyms checkbox" as "unchecked" in "autosuggestion page"
 And I should see "autosuggestion rule name" as "asrule" in "autosuggestion page"
 And I should see "autosuggestion rank" as "1000" in "autosuggestion page"
 And I should see "Apply rule facet and facet value" as "Brand,360 Sweater" in "autosuggestion page"
 And I should see "Display Pattern facet and facet syntax" as "Brand,Primary_Form_Normal" in "autosuggestion page"
 And I should see "Display Pattern facet and facet syntax" as "Cookware Type,Primary_Form_Noun_Mod" in "autosuggestion page"
 And I should see "Display Pattern facet and facet syntax" as "Gift Type,Primary_Form_Noun_Possessive" in "autosuggestion page"
When I click "apply rule facet edit button" in "autosuggestion page"
Then I should see "Brand,360 Sweater" in "select facet summary panel"
 And I select "Boot Type" from "facet suggestion dropdown" in "autosuggestion page"
 And I select "Rain" from "facet value suggestion dropdown" in "autosuggestion page"
 And I click "Cancel" in "Select Facet Window in AutoSuggestion page"  
When I click "apply rule facet edit button" in "autosuggestion page"
Then I should see "Brand,360 Sweater" in "select facet summary panel"
 And I select "Body Type" from "facet suggestion dropdown" in "autosuggestion page"
 And I select "Feet" from "facet value suggestion dropdown" in "autosuggestion page"
 And I click "Ok" in "Select Facet Window in AutoSuggestion page" 
 And I click "Display Pattern Add Facet button" in "autosuggestion page"
 And I unselect "Brand" from "select facets and Text window" in "autosuggestion page"
 And I click "Cancel" in "Select Facets and Text Window in AutoSuggestion page"
 And I click "Display Pattern Add Facet button" in "autosuggestion page"
 And I unselect "Brand" from "select facets and Text window" in "autosuggestion page"
 And I select "Add Text to Autosuggest Phrase" from "select facets and text window" in "autosuggestion page"
 And I click "Ok" in "Select Facets and Text Window in AutoSuggestion page"
Then I should see "following text options" from "display pattern text dropdown"
                |in|
                |for|
                |by|
                |-|    
When I select "for" from "display pattern text dropdown" in "autosuggestion page"
 And I click "Cookware Type" in "display pattern facet cross mark"
 And I enter "autosuggestion rank" as "20000" in "autosuggestion page"
 And I append "existing suggestion rule" with "_new" in the "autosuggestion page"
 And I click "Include Synonyms checkbox" in "autosuggestion page"
 And I click "autosuggestion save button" in "autosuggestion page"
 And I select "Rule Name" from "autosuggestion filter dropdown" in "autosuggestion list page"
 And I enter "suggestion rule name" as "asrule" in "autosuggestion list page"
 And I click "autosuggestion Go button" in "autosuggestion list page"
 And I click "autosuggestion template id" in "autosuggestion list page"
Then I should see "autosuggestion publish checkbox" as "checked" in "autosuggestion page"
 And I should see "Include Synonyms checkbox" as "checked" in "autosuggestion page"
 And I should see "autosuggestion rule name" as "asrule" in "autosuggestion page"
 And I should see "autosuggestion rank" as "2000" in "autosuggestion page"
 And I should see "Apply rule facet and facet value" as "Body Type,Boot Type" in "autosuggestion page"
 And I should see "Display Pattern facet and facet syntax" as "Gift Type,Primary_Form_Noun_Possessive" in "autosuggestion page" 
 And I should see "Add Text to Autosuggest Phrase value" as "for" in "autosuggestion page"
When I click "autosuggestion publish checkbox" in "autosuggestion page"
 And I click "autosuggestion cancel button" in "autosuggestion page" 
 And I select "Rule Name" from "autosuggestion filter dropdown" in "autosuggestion list page"
 And I enter "suggestion rule name" as "asrule" in "autosuggestion list page"
 And I click "autosuggestion Go button" in "autosuggestion list page"
 And I click "autosuggestion template id" in "autosuggestion list page"
Then I should see "autosuggestion publish checkbox" as "checked" in "autosuggestion page"              
          
@regression_bcom_pom            
@show_facet_action_bcom_producttype_option
Scenario: creating,editing,canceling & error validation for show facet action with product type
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showfacetaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Facets" from "action drop down" in "create rule page"
 And I select "Product Type" from "show facet filter by drop down" in "create rule page"
 And I enter "show facet product type" as "Boots" in "create rule page"
 And I click "show facet product type find button" in "create rule page"
 And I select "Heel Height,Boot Height,Shoe Type,Gender" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I enter "sequence number" as "1" for "Boot Height" in "create rule page"
 And I select "Age Category" from "show facets drop down" in "create rule page"
 And I save the "action" with "action atrributes"
 And I click "edit action" in "create rule page"
 And I click "Gender" in "facets window to make it uncheck"
 And I enter "text1" as "display name" for the facet "Heel Height"
 #And I enter "text2" as "display name" for the facet "Toe Type"
 And I save the "action" with "action atrributes"    
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "showfacet actions displayed" in "rule details page"
Then I should see "following facets with sequence numbers and displayname" from "show facet table" 
             |Shoe Type   |3|Shoe Type |
             |Heel Height |1|text1     |
             |Boot Height |1|Boot Height|
             |Age Category|5|Age Category|
When I click "Edit Rule" in "rules detailed page"
 And I click "edit action" in "rules detail page"
 And I click "Boot Height" in "facets window to make it uncheck"  
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "show facet action"
Then I should see "showfacet actions displayed" in "rule details page" 
When I click "Copy button" in "rules detail page"
 And I click "edit action" in "rules detail page"
 And I remove "text1" from "display name field" for "Heel Height"
 And I save the "action" with "action atrributes"
 And I save the "rules details page" with "show facet action"
Then I should see "showfacet actions displayed" in "rule details page"

@regression_bcom_pom
@jregression_21795_4.11_1_bcom
Scenario: checking triggers compatibility & error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed  
When I enter "rulename" as "multi_trigger_create_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria display" in "keyword pattern"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Material,Leather" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Occasion,Back to School/Fall" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Product Noun,Food Processor" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Style,Wall Clock" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
Then I should see "following error" messages
    |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
    |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
When I click "Or" in "trigger global operator"  
 And I save the "creating rule page" with "all triggers"
#Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
Then I should see "following triggers has been saved" from "rules detailed page"
          |Keyword Pattern|
          |Category Ids|
          |Category Ids|
And I click "Edit Rule" in "rules detailed page"          
When I replace the "category id trigger" with "result count trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
#When I save the "creating rule page" with "all triggers"
#Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
When I delete the "above result count trigger" from "triggers"
 And I click "Ok" in "popup window" 
 When I save the "rules details page" with "resultset attributes"
#When I save the "creating rule page" with "all triggers"
Then I should see "following triggers has been saved" from "rules detailed page"
          |Keyword Pattern|
          |Result Count|  
          |Category Ids|

@regression_bcom_pom
@jregression_21795_4.11_1_bcom
Scenario: checking triggers compatibility & error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed  
When I enter "rulename" as "multi_trigger_create_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria display" in "keyword pattern"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Material,Leather" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Occasion,Back to School/Fall" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Product Noun,Food Processor" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Keyword Pattern" trigger with "Style,Wall Clock" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "keyword pattern trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
Then I should see "following error" messages
    |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
    #|The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
When I click "Or" in "trigger global operator"  
 And I save the "creating rule page" with "all triggers"
#Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
Then I should see "following triggers has been saved" from "rules detailed page"
          |Keyword Pattern|
          |Category Ids|
          |Category Ids|
And I click "Edit Rule" in "rules detailed page"          
When I replace the "category id trigger" with "result count trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
#When I save the "creating rule page" with "all triggers"
#Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
When I delete the "above result count trigger" from "triggers"
 And I click "Ok" in "popup window" 
 When I save the "rules details page" with "resultset attributes"
#When I save the "creating rule page" with "all triggers"
Then I should see "following triggers has been saved" from "rules detailed page"
          |Keyword Pattern|
          |Result Count|  
          |Category Ids|

@regression_bcom_pom
@jregression_21795_4.11_2_bcom
Scenario: checking triggers compatibility functionality
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
Then I should see "Create Rule page" displayed  
When I enter "rulename" as "multi_trigger_create_rule" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Category,193,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Product Noun,food storage,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Normal Color,Blue,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Facet Refinement"
When I select "Facet Refinement" trigger with "Brand,Calvin Klein" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Product Color,red" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Occasion,Formal" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Material,wood" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Facet Refinement trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
When I click "Edit trigger" in "rules detailed page"
 And I click "Edit Rule" in "rules detailed page"
 And I click "Or" in "trigger global operator"
 And I save the "rules details page" with "triggers"
Then I should see "following triggers has been saved" from "rules detailed page"
          |Result Set|
          |Facet Refinement|
          |Result Count|
          |Category Ids|

@regression_bcom_pom
@jregression_21796_4.11_1_bcom
Scenario: checking triggers compatibility by adding trigger Group to a Rule & error validation
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "tgcompatibility" in "create trigger group page"
When I enter "description" as "tgcompatibility21796" in "create trigger group page"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testing_21796" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "tgcompatibility" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add trigger" in "create rule page"
Then I should see "triggers enabled" in "create rule page"
When I select "Keyword Pattern" trigger with "Brand,Designer" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create rule page"
When I save the "trigger" with "keyword pattern trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
Then I should see "following error" messages
    |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
When I replace the "keyword pattern trigger" with "category ids" in "create rule page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
     |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
When I click "Or" in "trigger global operator"     
When I save the "creating rule page" with "all triggers"
#Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|  
And I click "Edit Rule" in "rules detailed page"   
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "Browse" in "navigation type context attributes"
#When I save the "creating rule page" with "all triggers"
When I save the "rules details page" with "resultset attributes"
Then I should see "following error" messages
    |At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|

@regression_bcom_pom 
@jregression_21797_4.11_2_bcom
Scenario: checking triggers compatibility functionality
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "tgrp_compatibility" in "create trigger group page"
When I enter "description" as "tgcompatibility21797" in "create trigger group page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Category,193,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Product Noun,food storage,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Normal Color,Blue,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Facet Refinement"
When I select "Facet Refinement" trigger with "Brand,Calvin Klein" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Product Color,red" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Occasion,Formal" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Material,Wood" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Facet Refinement trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Category Ids"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I save the "create trigger group page" with "triggers"
When I click "trigger Group Edit" in "trigger Group detailed page"
 And I click "And" in "trigger global operator"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup" 
Then I should see "following triggers has been saved" from "rules detailed page"
          |Result Set|
          |Facet Refinement|
          |Result Count|
          |Category Ids|

@regression_bcom_pom
@jregression_21798_4.11_bcom
Scenario: checking triggers compatibility by editing trigger groups
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "editing_tgpc" in "create trigger group page"
When I enter "description" as "tgcompatibility21798" in "create trigger group page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testing_21799" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "editing_tgpc" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add trigger" in "create rule page"
Then I should see "triggers enabled" in "create rule page"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
When I click "Find Trigger Groups" from "RULES"
When I enter "triggergroup name" as "editing_tgpc" in "find trigger groups list page"
When I click "filter trigger go button" in "find trigger groups list page"
When I click "trigger group name link" in "find trigger group page"
When I click "trigger Group Edit" in "trigger Group detailed page"
When I edit the "trigger group" with "Keyword Pattern Trigger" in "trigger group detailed page"
When I select "Keyword Pattern" trigger with "Brand,ck" as "attribute type and attribute value respectively"
When I save the "trigger" with "keyword pattern trigger"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup" 
Then I should see "following error" messages
    |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|
When I edit the "trigger group" with "Result Count Trigger" in "trigger group detailed page"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
When I save the "trigger" with "result count trigger"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup" 
Then I should see "following error" messages
    |At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
When I edit the "trigger group" with "Category Ids Trigger" in "trigger group detailed page"
When I select "Category Ids" trigger with "193" as "categoty id"
When I save the "trigger" with "category id trigger"
When I save the "trigger group details page" with "triggers"
When I click "Save" in "Trigger Group Alert popup" 
Then I should see "following error" messages
    #|At least one trigger is incompatible with another trigger. Please check trigger compatibility and update|
     |The AND relationship is incompatible with at least one trigger combination. Please check trigger compatibility and update|

@regression_bcom_pom     
@jregression_21796_4.11_2_bcom
Scenario: checking triggers compatibility by adding trigger Group to a Rule
Given I have logged into Saturn as a Merchandise user
When I click "Create Trigger Group" from "RULES"
Then I should see "Create Trigger Group page" displayed
When I enter "TriggerGroupName" as "tgcompatibility" in "create trigger group page"
When I enter "description" as "tgcompatibility21796" in "create trigger group page"
When I click "add trigger" in "create rule page"
Then I should see "trigger criteria displayed" in "Result Set"
When I select "Result Set" trigger with "Brand,calvin klein,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Category,193,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Product Noun,food storage,  >" as "attribute type,attribute value and logicalop respectively"
When I click "plus" in "create trigger group page"
When I select "Result Set" trigger with "Normal Color,Blue,  >" as "attribute type,attribute value and logicalop respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result set trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Facet Refinement"
When I select "Facet Refinement" trigger with "Brand,Calvin Klein" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Product Color,red" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Occasion,Formal" as "attribute type and attribute value respectively"
When I click "plus" in "create trigger group page"
When I select "Facet Refinement" trigger with "Material,Wood" as "attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Facet Refinement trigger"
When I click "add trigger" in "create trigger group page"
Then I should see "trigger criteria displayed" in "Result Count"
When I select "Result Count" trigger with "Greater Than,2000" as "attribute type,attribute type and attribute value respectively"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Result Count trigger"
When I save the "create trigger group page" with "triggers"
Then I should see "trigger group displayed" in "trigger group detail page"
When I click "Create Rule" from "RULES"
When I enter "rulename" as "testing_21796" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add trigger" in "create rule page"
Then I should see "trigger group radio button" as "unchecked" in "create rule page"
When I click "trigger group radio button" in "create rule page"
When I enter "trigger group name" as "tgcompatibility" in "create trigger group page"
When I save the "trigger group" with "trigger group name"
When I click "add trigger" in "create rule page"
Then I should see "triggers enabled" in "create rule page"
When I select "Category Ids" trigger with "193" as "categoty id"
Then I should see "attributes and attribute values has been selected" in "create trigger group"
When I save the "trigger" with "Category Ids trigger"
When I click "Browse" in "navigation type context attributes"
When I save the "creating rule page" with "all triggers"
When I click "Edit trigger" in "rules detailed page"
 And I click "Edit Rule" in "rules detailed page"
 And I click "Or" in "trigger global operator"
 And I save the "rules details page" with "triggers"
Then I should see "following triggers has been saved" from "rules detailed page"
          |Category Ids|          

@regression_bcom_pom
@jregression_22362_4.11_1_bcom
Scenario: Allow Facet Refinement and Modify Result Set Combination with Add, Boost & Boost Attribute Value
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "mrsaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I enter "saved set query id" as "100685" in "create rule page"
 And I save the "action" with "action atrributes"
When I click "add action" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Add" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
 And I click "add action" in "create rule page"
 And I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Boost Attribute Values" from "mrs action menu" in "create rule page"
 And I click "addAttributeValue" in "create rule page"
 And I click "Special Offers" in "select attribute values window" 
 And I check "following attribute values in select attribute values window"
        |Buy More Save More|
 And I click "ok in select attribute value window" in "create rule page"       
 And I save the "action" with "action atrributes"
 And I click "add trigger" in "create rule page"
 And I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans,GUESS by Marciano"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
 And I save the "facet refinement trigger" with "all attributes types"
Then I should see "facet refinement trigger saved" in "create trigger group page"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions" 
Then I should see "modified result set actions" in "rules detailed page"
 And I should see "mrs action type" as "Add" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"
 And I should see "mrs action type" as "Boost Attribute Values" in "rules detailed page"
 And I should see "following selected attribute values" from "Special Offers"
        |Buy More Save More|
 And I should see "facets displayed" in "trigger detail page"
 And I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger detail page"
 And I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger detail page"
 And I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger detail page"
        
@regression_bcom_pom        
@jregression_22362_4.11_2_bcom
Scenario: Allow Facet Refinement and Modify Result Set Combination with Replace
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "mrsaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Replace" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
 And I click "add trigger" in "create rule page"
 And I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans,GUESS by Marciano"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
 And I save the "facet refinement trigger" with "all attributes types"
Then I should see "facet refinement trigger saved" in "create trigger group page"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions" 
Then I should see "modified result set actions" in "rules detailed page"
 And I should see "mrs action type" as "Replace" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"
 And I should see "facets displayed" in "trigger detail page"
 And I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger detail page"
 And I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger detail page"
 And I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger detail page"   
 
@regression_bcom_pom 
@jregression_22362_4.11_3_bcom
Scenario: Allow Facet Refinement and Modify Result Set Combination with Remove
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "mrsaction" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Modify Result Set" from "action drop down" in "create rule page"
 And I select "Remove" from "mrs action menu" in "create rule page"
 And I enter "product id" as "4199" in "create rule page"
 And I save the "action" with "action atrributes" 
 And I click "add trigger" in "create rule page"
 And I select "Facet Refinement" from "select trigger dropdown" in "create rule page"
Then I should see "refine by following facets displayed" in "create group trigger page"
When I create "facet refinement trigger" with "Brand" and the value as "polo jeans,GUESS by Marciano"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Product Color" and the value as "gold,green"
 And I click "plusicon" in "create rule page"
 And I create "facet refinement trigger" with "Occasion" and the value as "birthday,formal"
 And I save the "facet refinement trigger" with "all attributes types"
Then I should see "facet refinement trigger saved" in "create trigger group page"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions" 
Then I should see "modified result set actions" in "rules detailed page"
 And I should see "mrs action type" as "Remove" in "rules detailed page"
 And I should see "product id" as "4199" in "rules detailed page"
 And I should see "facets displayed" in "trigger detail page"
 And I should see "facet type and facet value" as "Brand,Polo Jeans,GUESS by Marciano" in "trigger detail page"
 And I should see "facet type and facet value" as "Product Color,Gold,Green" in "trigger detail page"
 And I should see "facet type and facet value" as "Occasion,Birthday,Formal" in "trigger detail page"
 
@regression_bcom_pom
 @iteration_4.11
@jregression_18999_4.11_bcom
Scenario: Validate Canvas ID 
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showmedia" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Canvas" from "select media type dropdown" in "create rule page"
 And I save the "action" with "action atrribute"    
Then I should see "<popup error>" messages 
            |Invalid Canvas ID or Canvas Name, please enter a valid Canvas ID or Canvas Name|
When I click "Ok" in "popup window" 
When I enter "canvas id or name" as "9090954354" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following error" messages
    |Invalid Canvas ID or Canvas Name; please enter a valid Canvas ID or Canvas Name.|
When I enter "canvas id or name" as "rweiurfh" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following error" messages
    |Invalid Canvas ID or Canvas Name; please enter a valid Canvas ID or Canvas Name.|  
When I enter "canvas id or name" as "101.0001" in "create rule page"
 And I save the "action" with "action atrribute"
Then I should see "following error" messages
    |Invalid Canvas ID or Canvas Name; please enter a valid Canvas ID or Canvas Name.|      
When I enter "canvas id or name" as "400927" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "canvas show media action" 
Then I should see "Select Media Type" as "Canvas" in "rule detail page"
 And I should see "Canvas ID or Name" as "400927 - tenetur_quidem_pariatur" in "rule detail page"
 
@regression_bcom_pom
@iteration_4.11
@jregression_18678_19212_4.11_bcom
Scenario: Autosuggest Canvas Name or ID
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showmedia" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Canvas" from "select media type dropdown" in "create rule page"
 And I enter "canvas id" as "4" in "create rule page"
Then I should see "No Autosuggestion drop down" in "canvas id or name field"
When I append "canvas id" with "0" in the "canvas id or name field"
Then I should see "Autosuggestion drop down with maximum five values" in "canvas id or name field" 
 And I should see "unique autosuggestion values in drop down" in "canvas id or name field"
When I append "canvas id" with "094" in the "canvas id or name field"
Then I should see "Autosuggestion dropdown with maximum five values" in "canvas id or name field" 
 And I should see "Autosuggestion drop down refreshed" in "canvas id or name field"
 And I should see "unique autosuggestion values in drop down" in "canvas id or name field"
When I enter "canvas name" as "F" in "create rule page"
Then I should see "No Autosuggestion drop down" in "canvas id or name field"
When I append "canvas id" with "od" in the "canvas id or name field"
Then I should see "Autosuggestion drop down with maximum five values" in "canvas id or name field" 
 And I should see "unique autosuggestion values in drop down" in "canvas id or name field"
When I append "canvas id" with "sfsb" in the "canvas id or name field"
Then I should see "Autosuggestion dropdown with maximum five values" in "canvas id or name field" 
 And I should see "Autosuggestion drop down refreshed" in "canvas id or name field"
 And I should see "unique autosuggestion values in drop down" in "canvas id or name field" 
When I select "canvas id or name randomly" from "Autosuggestion drop down" in "create rule page" 
 And I save the "action" with "action atrribute"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "canvas show media action" 
Then I should see "Select Media Type" as "Canvas" in "rule detail page"
 And I should see "Canvas ID or Name" as "400922 - Fodsfsb_Esdfsdfsddvent_Date" in "rule detail page"
 
@regression_bcom_pom
@iteration_4.11 
@jregression_18636_4.11_bcom
Scenario: checks canvas functionality by adding multiple canvas and combining with other media types
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "showmedia" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
When I select "Show Media" from "action drop down" in "create rule page"
 And I select "Canvas" from "select media type dropdown" in "create rule page"
When I enter "canvas id or name" as "400922" in "create rule page"
 And I save the "action" with "action atrribute"
When I click "add action" in "create rule page"
 And I select "Show Media" from "action drop down" in "create rule page"
Then I should see "Canvas media type" as "disabled" in "create rule page"
When I select "Zero Results Media" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "201374" in "create rule page"  
 And I save the "action" with "action atrribute" 
When I click "add action" in "create rule page"
 And I select "Show Media" from "action drop down" in "create rule page"
Then I should see "Canvas media type" as "disabled" in "create rule page"
When I select "Zero Results Media" from "select media type dropdown" in "create rule page"
 And I enter "media group id" as "201540" in "create rule page"  
 And I save the "action" with "action atrribute"  
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "show media zero results media" in "rule detailed page" 
 And I should see "media group id" as "201374" in "rule detailed page"
 And I should see "media group id" as "201540" in "rule detailed page"
 And I should see "Select Media Type" as "Canvas" in "rule detail page"
 And I should see "Canvas ID or Name" as "400922 - Fodsfsb_Esdfsdfsddvent_Date" in "rule detail page"
When I click "Edit Rule" in "rules detailed page"
 And I edit the "Canvas media type" with "Zero Results Media" in "rule detail page"
 And I select "Zero Results Media" from "select media type dropdown" in "rules detail page"
 And I enter "media group id" as "201642" in "rules detail page"  
 And I save the "action" with "action atrribute" 
When I click "add action" in "create rule page"
Then I should see "show media action with canvas" in "rules detail page"
When I select "Show Media" from "action drop down" in "rules detail page"
Then I should see "Enabled Canvas media type" in "rules detail page" 
When I click "cancel to remove show media action" in "rule detail page"
When I save the "rules details page" with "show media actions"
Then I should see "show media zero results media" in "rule detail page" 
 And I should see "media group id" as "201374" in "rule detail page"
 And I should see "media group id" as "201540" in "rule detail page"
 And I should see "media group id" as "201642" in "rule detail page"
 
@regression_bcom_pom
@iteration_4.11
@jregression_21943_4.11_bcom
Scenario: Enable editing for migrated MSR rules 
Given I have logged into Saturn as a Merchandise user
When I click "Find Rules" from "RULES"
 And I search "1000008_CatHierarchy_ModifiedResults" as "Rule Name" with "Browse"
 And I click "ruleid" in "Find rule page"
Then I should see "Rule Detail Edit button" as "enabled" in "rules detail page"
 And I should see "Rule Detail Copy button" as "enabled" in "rules detail page"
 And I should see "category ids trigger selected with category ids" in "rule detail page"   
 And I should see "category ids" as "1000008" in "rules detail page"
 And I should see "Include all children and grandchildren etc" as "unchecked by default" in "rule detail page"
 And I should see "modify result set action selected" in "rules detail page"
 And I should see "mrs action type" as "Boost" in "rules detail page"
 And I should see "selected navigation type" as "Browse" in "rules detail page"
 And I should see "following context attribute values checked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |navigation|Browse|
                  |device|PC,Phone,POS,Tablet|
                  |app|Site,Associate,Mobile,MEW,SEO Link Module,Search & Send,MSA|
                  |inventory|Store,Site,Jewelry,Registry,Shoes,Search & Send|
 And I should see "All Countries" as "checked by default" in "trigger detail page"
 And I should see "selected action type" as "Modify Result Set" in "rules detail page"
 And I should see "rulename" as "1000008_CatHierarchy_ModifiedResults" in "rules detail page"
 
@regression_bcom_pom
@jregression_22224_4.11_bcom
Scenario: Additional rule priority values 
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rulestesting" in "saturn main page"
When I enter "description" as "rulestesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
Then I should see "following rule priorities" from "create rule page"
                 |10|
                 |15|
                 |20|
                 |25|
                 |30|
                 |35|
                 |40|
                 |45|
                 |50|
                 |55|
                 |60|
                 |65|
                 |70|
                 |75|
                 |80|
                 |85|
                 |90|
                 |95|
                 |100|
 And I should see "default rule priority" as "65" in "create rule page"
When I select "90" from "rules priority drop down" in "create rule page"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "rule priority"
Then I should see "rule priority" as "90" in "create rule page"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "rulestesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page" 
When I click "Edit Rule" in "rules detailed page"
 And I select "30" from "rules priority drop down" in "create rule page"
 And I save the "rules details page" with "rule priority"
Then I should see "rule priority" as "30" in "create rule page"
Then I should see "rulename" as "rulestesting" in "rules detailed page"
Then I should see "description" as "rulestesting" in "rules detailed page"
Then I should see "effectivedate" as "today" in "rules detailed page"
Then I should see "expirationdate" as "tomorrow" in "rules detailed page" 
 
@regression_bcom_pom
@jregression_18438_4.6_bcom
Scenario: In Stella BCOM I am able to add or remove "Desktop Site, Desktop Registry, Mobile, Tablet" in Display Name drop down  
Given I have logged into Stella as a Merchandise Manager
When I select "Category" from below Create drop down and click go button
Then I should see "Create Category" pages
When I create a category as "createcategory" in stella 
When I click "start editing button" in "Category Overview Page"
Then I should see "following display names" from "display name drop down"
              |Tablet |
              |Mobile|
              |Desktop Site|
              |Desktop Registry|
When I select "Mobile" from drop down and I enter "testing_mobile" as value in text field
 And I click "Add another" in "Category Overview Page"
When I select "Tablet" from drop down and I enter "testing_tablet" as value in text field
 And I click "Add another" in "Category Overview Page"
When I select "Desktop Site" from drop down and I enter "testing_desktop" as value in text field
 And I click "Add another" in "Category Overview Page"
When I select "Desktop Registry" from drop down and I enter "testing_registry" as value in text field
 And I click "Save Changes" in "Category Overview Page"
Then I should see "<following>" option selected in drop down with following "<value>" in category overview section
                 |Desktop Registry      |            testing_registry|
                 |Desktop Site          |            testing_desktop|
                 |Tablet                |            testing_tablet|
                 |Mobile                |            testing_mobile|
Then I should see "4" row stored in "CATEGORY_ATTRIBUTE" table for "created category"
When I click "start editing button" in "Category Overview Page"
 And I remove "Tablet" which has "display name text" as "testing_tablet" from "category overview section"
 And I click "Save Changes" in "Category Overview Page"
Then I should see "3" row stored in "CATEGORY_ATTRIBUTE" table for "created category"
When I click "start editing button" in "Category Overview Page"
 And I remove "Mobile" which has "display name text" as "testing_tablet" from "category overview section"
 And I click "Save Changes" in "Category Overview Page"
Then I should see "2" row stored in "CATEGORY_ATTRIBUTE" table for "created category"
When I click "start editing button" in "Category Overview Page"
 And I remove "Desktop Site" which has "display name text" as "testing_desktop" from "category overview section"
 And I click "Save Changes" in "Category Overview Page"
Then I should see "1" row stored in "CATEGORY_ATTRIBUTE" table for "created category"
When I click "start editing button" in "Category Overview Page"
 And I remove "Desktop Registry" which has "display name text" as "testing_registry" from "category overview section"
 And I click "Save Changes" in "Category Overview Page" 
Then I should see "0" row stored in "CATEGORY_ATTRIBUTE" table for "created category"

@regression_bcom_pom 
@jregression_22924_4.12_bcom_vo_B_02652_22923_4.12_bcom_vo_B_2650
Scenario: Allow overlapping RDPP rule effective dates in a single action with different context actions
Given I have logged into Saturn as a Merchandise user
When I click "Create Rule" from "RULES"
When I enter "rulename" as "rdpp_22924" in "saturn main page"
When I enter "description" as "resultsettesting" in "saturn main page"
When I enter "effectivedate" as "today" in "saturn main page"
When I enter "expirationdate" as "tomorrow date" in "saturn main page"
When I click "add action" in "create rule page"
Then I should see "select action drop down displayed" in "create rule page"
Then I should see "RDPP Algorithm drop down,effective,expiration,plusicon and cross mark" in "create rule page"
When I select "RDPP Algorithm" from "action drop down" in "create rule page"
When I select "80 - Clearance/OH Dollar" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "today's date" as "rdpp algorithm effective date" in "create rule page"
 And I enter "tommorow's date" as "rdpp algorithm expiration date" in "create rule page"
 And I click "plusicon in rdpp algorithm" in "create rule page"
 And I select "64 - SOLDU50_SALE30_NEW20" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "today's date" as "rdpp algorithm effective date" in "create rule page"
 And I enter "tommorow's date" as "rdpp algorithm expiration date" in "create rule page"
 And I click "plusicon in rdpp algorithm" in "create rule page"
 And I select "80 - Clearance/OH Dollar" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "today's date" as "rdpp algorithm effective date" in "create rule page"
 And I enter "tommorow's date" as "rdpp algorithm expiration date" in "create rule page"
 And I save the "action" with "action atrribute"
 And I click "add action" in "create rule page"
Then I should see "RDDP allowed to create more than one" in "create rule page" 
When I select "RDPP Algorithm" from "action drop down" in "create rule page"
When I select "80 - Clearance/OH Dollar" from "rdpp algorithm type drop down" in "create rule page"
 And I enter "today's date" as "rdpp algorithm effective date" in "create rule page"
 And I enter "tommorow's date" as "rdpp algorithm expiration date" in "create rule page"
 And I save the "action" with "action atrribute"
 And I click "Search" in "navigation type context attributes"
 And I save the "creating rule page" with "actions"
Then I should see "rulename" as "rdpp_22924" in "rules detail page"
 And I should see "description" as "resultsettesting" in "rules detail page"
 And I should see "effectivedate" as "today" in "rules detail page"
 And I should see "expirationdate" as "tomorrow" in "rules detail page"
 And I should see "Rule Owner" as "SuperBAUser" in "rules detail page"
 And I should see "Rule Detail Edit button" as "enabled" in "rules detail page"
 And I should see "Rule Detail Copy button" as "enabled" in "rules detail page"
 And I should see Publish Flag "ON"
 And I should see "Rule Effective State" as "Effective" in "rules detail page"
 And I should see "selected action type" as "RDPP Algorithm" in "rules detail page"
Then I should see "RDPP Algorithm drop down,effective,expiration,plusicon and cross mark" in "create rule page"
 And I should see "rdpp algorithm type" as "80 - Clearance/OH Dollar" in "rules detail page"
 And I should see "rdpp effective date" as "today date" in "rules detail page"
 And I should see "rdpp expiration date" as "tommorow date" in "rules detail page"
 And I should see "rdpp algorithm type" as "64 - SOLDU50_SALE30_NEW20" in "rules detail page"
 And I should see "rdpp effective date" as "today date" in "rules detail page"
 And I should see "rdpp expiration date" as "tommorow date" in "rules detail page"
 And I should see "rdpp algorithm type" as "80 - Clearance/OH Dollar" in "rules detail page"
 And I should see "rdpp effective date" as "today date" in "rules detail page"
 And I should see "rdpp expiration date" as "tommorow date" in "rules detail page"
 And I should see "rdpp got saved as new action" in "rule detail page" 
 And I should see "rdpp algorithm type" as "80 - Clearance/OH Dollar" in "rules detail page"
 And I should see "rdpp effective date" as "today date" in "rules detail page"
 And I should see "following context attribute values checked" from "context attribute trigger"
                  |attributesname|attributesvalue|
                  |navigation|Search|
                  |device|PC,Phone,POS,Tablet|
                  |app|Site,Associate,Mobile,MEW,SEO Link Module,Search & Send,MSA|
                  |inventory|Store,Site,Jewelry,Registry,Shoes,Search & Send|

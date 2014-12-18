require 'dbi'
Then /^I connect to the stella database$/ do
$stellahost = $yml_file['stellahost']
$stellasid = $yml_file['stellasid']
$port = $yml_file['port']
$stellausername= $yml_file['stellausername']
$stellapassword = $yml_file['stellapassword'] 
$tenant = $yml_file['tenant']
$conn_string = "DBI:OCI8://#{$stellahost}:#{$port}/#{$stellasid}"
$dbhstella = DBI.connect($conn_string,$stellausername,$stellapassword)
end

Then /^I connect to the stella integration database$/ do
$attrservicehost = "11.120.101.71"
$attrservicesid =  "int12"
$conn_string_stella_in = "DBI:OCI8://#{$attrservicehost}:1521/#{$attrservicesid}"   
$username = "stars_attr"
$password = "stars_attr"  
$tenant = $yml_file['tenant']       
$dbhint = DBI.connect($conn_string_stella_in,$username,$password)
end

Then /^I connect to attribute data base$/ do
$attrservicehost = "dml1-scan"
$attrservicesid =  "dpmqas01"
$conn_string_stella_in = "DBI:OCI8://#{$attrservicehost}:1521/#{$attrservicesid}"   
$username = "stars_attr"
$password = "stars_attr"  
$tenant = $yml_file['tenant']       
$dbattri = DBI.connect($conn_string_stella_in,$username,$password)
end

Then /^I connect to the stella sdt database$/ do
$attrservicehostd = "mdc2vr4213"
$attrservicesidt =  "ci213"
$conn_string_stella_in = "DBI:OCI8://#{$attrservicehostd}:1521/#{$attrservicesidt}"   
$usernamed = "sdt"
$passwordd = "sdt"  
$tenant = $yml_file['tenant']       
$dbhintd = DBI.connect($conn_string_stella_in,$usernamed,$passwordd)
end

When /^I execute a query$/ do
#s = @dbh.select_one("select max(dictionary_id)+1 from dictionary where site_tenant= '#{@tenant}'")
@dic_name = 'from aptana'+ Time.now.to_s
p=$dbhsaturn.prepare("insert into dictionary values(dictionary_seq.nextval, '#{@dic_name}',1,'#{@tenant}', systimestamp, 'teste', systimestamp, 'teste')")
p.execute
$dbhsaturn.commit
coun = $dbhsaturn.select_one("select count(*) from dictionary where dictionary_name ='#{@dic_name}'")
if coun[0].to_i == 1
  puts "dictionary created successfully"
else
  puts "dictionary not created successfully"
end  
end  

Given /^I connect to the database$/ do
$host = $yml_file['host']
$sid = $yml_file['sid']
$port = $yml_file['port']
$username= $yml_file['username']
$password = $yml_file['password']
$tenant = $yml_file['tenant']
$conn_string = "DBI:OCI8://#{$host}:#{$port}/#{$sid}"
$dbhsaturn = DBI.connect($conn_string,$username,$password)
end


When /^I create "([^"]*)" having "([^"]*)" with "([^"]*)"$/ do |arg1, arg2, arg3, table| 
@relationshipscount =0
operatorvalues = { "Similar" => "SIM" , "Do Not Associate" => "DTA" ,"Hypernym" => "HPR" , "Equals" => "EQ", "Keep Original" => "KO", "One Way Synonym" => "SYN", "Phrase" => "PHR", "Stemming Override" => "STO" , "Stop Word" => "SW" }
@tab = table.raw
  @tab.each do
    |value|
    @relationshipscount = @relationshipscount + 1
    t1 = value[0].downcase + Time.now.to_s[0..18]
    operator = operatorvalues[value[1]]
    t2 = value[2].downcase + Time.now.to_s[0..18]
    puts @dictionaryname
@dic_id = $dbhsaturn.select_one("select dictionary_id from dictionary where dictionary_name ='" + "#{@dictionaryname}" + "'")
@dic_id[0]=@dic_id[0].to_i
@dic_type_id = $dbhsaturn.select_one("select dictionary_type_id from dictionary where dictionary_name ='" + "#{@dictionaryname}" + "'")
@dic_type_id[0]=@dic_type_id[0].to_i
st = $dbhsaturn.prepare("insert into linguistic_term values(linguistic_term_seq.nextval,'#{t1}',systimestamp,'teste',systimestamp,'teste')")
st.execute()
st = $dbhsaturn.prepare("insert into linguistic_term values(linguistic_term_seq.nextval,'#{t2}',systimestamp,'teste',systimestamp,'teste')")
st.execute()
st = $dbhsaturn.prepare("insert into linguistic_relationship values(linguistic_relationship_seq.nextval,'#{operator}','#{@dic_id[0]}','#{@dic_type_id[0]}',null,null,null,null,systimestamp,'teste',systimestamp,'teste')")
st.execute()
@term_id1= $dbhsaturn.select_one("select linguistic_term_id from linguistic_term where linguistic_term_value = '#{t1}'")
@term_id1[0]=@term_id1[0].to_i
@term_id2= $dbhsaturn.select_one("select linguistic_term_id from linguistic_term where linguistic_term_value = '#{t2}'")
@term_id2[0]=@term_id2[0].to_i
st = $dbhsaturn.prepare("insert into relationship_term_assn values(linguistic_relationship_seq.currval,'#{@term_id1[0]}','P',systimestamp,'teste',systimestamp,'teste')")
st.execute()
st = $dbhsaturn.prepare("insert into relationship_term_assn values(linguistic_relationship_seq.currval,'#{@term_id2[0]}','C',systimestamp,'teste',systimestamp,'teste')")
st.execute()
$dbhsaturn.commit
end

end 

When /^I create "([^"]*)" having "([^"]*)"$/ do |arg1, arg2, table| 

#@relationshipscount =0
operatorvalues = { "Similar" => "SIM" , "Do Not Associate" => "DTA" ,"Hypernym" => "HPR" , "Equals" => "EQ", "Keep Original" => "KO", "One Way Synonym" => "SYN", "Phrase" => "PHR", "Stemming Override" => "STO" , "Stop Word" => "SW" }
@tab = table.raw
  @tab.each do
    |value|
    @relationshipscount = @relationshipscount + 1
    t1 = value[0].downcase + Time.now.to_s[0..18]
    operator = operatorvalues[value[1]]
     puts @dictionaryname
@dic_id = $dbhsaturn.select_one("select dictionary_id from dictionary where dictionary_name ='" + "#{@dictionaryname}" + "'")
@dic_id[0]=@dic_id[0].to_i
@dic_type_id = $dbhsaturn.select_one("select dictionary_type_id from dictionary where dictionary_name ='" + "#{@dictionaryname}" + "'")
@dic_type_id[0]=@dic_type_id[0].to_i
st = $dbhsaturn.prepare("insert into linguistic_term values(linguistic_term_seq.nextval,'#{t1}',systimestamp,'teste',systimestamp,'teste')")
st.execute()
st = $dbhsaturn.prepare("insert into linguistic_relationship values(linguistic_relationship_seq.nextval,'#{operator}','#{@dic_id[0]}','#{@dic_type_id[0]}',null,null,null,null,systimestamp,'teste',systimestamp,'teste')")
st.execute()
@term_id1= $dbhsaturn.select_one("select linguistic_term_id from linguistic_term where linguistic_term_value = '#{t1}'")
@term_id1[0]=@term_id1[0].to_i
st = $dbhsaturn.prepare("insert into relationship_term_assn values(linguistic_relationship_seq.currval,'#{@term_id1[0]}','P',systimestamp,'teste',systimestamp,'teste')")
st.execute()
$dbhsaturn.commit
end

 
end 

Then /^I should see "([^"]*)" having "([^"]*)" with "([^"]*)" created$/ do |arg1, arg2, arg3, table| 
count=0
   @AllRelationships = true 
  @found = false
  @tablename="TBLrelationships"
@tabcntinfo = "TBLrelationships_info"
@tabnext = "TBLrelationships_next"
@functionality = "srchrelationship" 
   #sleep 10
@tab = table.raw
  @tab.each do
    |value|
@val1 = value[0]
@val2 = value[1]
@val3 = value[2]
findInfo()
puts @found
  if @found == true 
    puts "Relationship created successfully"
   else
    puts "Relationship not created" 
    count=count+1
   end    
 end 
 if count>0
 @AllRelationships = false 
 end
end 

Then /^I should see "([^"]*)" having "([^"]*)"$/ do |arg1, arg2, table| 
  count=0
   @AllRelationships = true 
  @found = false
  @tablename="TBLrelationships"
@tabcntinfo = "TBLrelationships_info"
@tabnext = "TBLrelationships_next"
@functionality = "srchdesignation" 
   #sleep 10
@tab = table.raw
  @tab.each do
    |value|
@val1 = value[0]
@val2 = value[1]

findInfo()
  if @found == true 
    puts "Relationship created successfully"
   else
    puts "Relationship not created" 
    count=count+1
   end    
 end 
 if count>0
 @AllRelationships = false 
 end
end 

Then /^I should see all my relationships created$/ do
  puts "all relationships for this dictionary" + "#{@relationshipscount}"
  puts "dictionaryid is " + "#{@dic_id[0]}"
  totalcount = $dbhsaturn.select_one("select count(*) from linguistic_relationship where dictionary_id=" + "#{@dic_id[0]}")
  puts "totalcount = "
  puts totalcount[0].to_i
  if totalcount[0].to_i == @relationshipscount
  puts "All relationships/designation created successfully"
  else
  puts "All relationships/designations not created successfully" 
 end
end 

Then /^I connect to the astra database$/ do
$astrahost = $yml_file['astrahost']
$astrasid = $yml_file['astrasid']
$port = $yml_file['port']
$astrausername= $yml_file['astrausername']
$astrapassword = $yml_file['astrapassword'] 
$tenant = $yml_file['tenant']
$conn_string = "DBI:OCI8://#{$astrahost}:#{$port}/#{$astrasid}"
$dbhastra = DBI.connect($conn_string,$astrausername,$astrapassword)
end

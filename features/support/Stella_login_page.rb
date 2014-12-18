class StellaLoginPage
  include PageObject
  include DataMagic

  DEFAULT_DATA = {
    'name' => 'Cheezy',
    'address' => '123 Main Street',
    'email' => 'cheezy@example.com',
    'pay_type' => 'Check'
  }

  page_url $yml_file['stellaui']
  $timestamp = Time.now.strftime("%m%d_%I%M%S%p")

  def complete_order(data = {})
    data = DEFAULT_DATA.merge(data)
    puts data['name']
    puts data['address']
    puts data['email']
    puts data['pay_type']
    #DataMagic.yml_directory = 'config/data'
  # DataMagic.yml = nil
   ENV['DATA_MAGIC_FILE'] = 'user.yml'
   data = populate_page_with data_for "valid"
   puts data.class
  # puts data.keys.sort
  # puts data['name'].class
  # puts data['job'].class
  # ENV['DATA_MAGIC_FILE'] = nil

  # puts DataMagic.yml_directory
  DataMagic.load("global.yml")
  populate_page_with data_for("global", data)
   data['firstName'] 
   data['firstName'] = "mmuser"
  # puts populate_page_with data_for("global", data)
  #DataMagic.load("demo.yml")
  #puts populate_page_with data_for("deliverydriver", data)

  DataMagic.yml_directory = 'features/yaml'
  DataMagic.load "example.yml"
   @data = populate_page_with data_for "dm"
   puts @data['street']
   puts @data['value1'].should == "this is value 1"
  #DataMagic.add_translator(Blah)
  #@data1 = populate_page_with data_for "dynamic"
  #puts @data1['blah']
  #@data[key].split(' ').size.should
  # [vala, valb, valc].should include @data[key]
  # value.should >= low.to_i
  # value.should <= high.to_i
  # value = @data[key]
  # value[0,num.to_i].is_integer.should be_true
  end

  table(:fileupload){element(:file_up, :id => "summaryreport-table").table_element}
  select_list(:keytype, :id => "searchCommand.typeKey")
  h2(:error_list){element(:errorfirst,:xpath => "//div[@style='color:red']").h2_element}
  h2(:error_message_verification, :xpath => "//div[@style='color:red']/h2")
  span(:hlm, :class => "yui-dt-label")
  text_field(:username_field, :id => "txtLoginId")
  text_field(:password_field, :id => "login_password")
  button(:loginbutton, :id => "login_loginBtn")
  text_field(:susername_field, :id => "txtUsername")
  text_field(:spassword_field, :id => "txtPassword")
  button(:sloginbutton, :text => "Login")
  link(:productlink, :id => "nav-Product")

  def login_for(user,password)
    self.username_field = user
    self.password_field = password
    self.loginbutton
    wait_until(60, "stella login page loading....") do
      self.title.include? "STELLA - Dashboard"
    end
  end
end

# select distinct category_id from category_facet where category_id in
# (select category_id from category where end_date>=(select sysdate from dual))
#
#
# select * from MERCH_RULE where merch_rule_name like '%_CatHierarchy_Facets%' and merch_rule_end_date >=(select sysdate from dual)
#
#
#

class SaturnLoginPage
  include PageObject

  page_url "#{$yml_file['url']}"

  text_field(:susername_field, :id => "txtUsername")
  text_field(:spassword_field, :id => "txtPassword")
  button(:sloginbutton, :xpath => "//button[@type='submit']")
  div(:outer_div, :class => 'loginBtn')
  link(:nav,:id => "mNavigation")
  def login_in_saturn(user,password)
      self.susername_field = user
      self.spassword_field = password
      self.sloginbutton
      wait_until(60, "saturn login page loading....") do
        self.title.include? "SATURN"
      end
      self.wait_for_ajax
      sleep 3
  end
end

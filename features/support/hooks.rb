Before do
  $dy="newdictionary"+Time.now.strftime("%Y-%m-%d %H%M%S").gsub(" ","-")
  $ie=0
  $rfi=1
  $res=1
  $rd=1
  puts "#{ENV['TEST_ENV']}"
end

 Before do |scenario|
  if scenario.source_tag_names.include? '@pom'
     @browser = Selenium::WebDriver.for :firefox
  @browser.manage.timeouts.implicit_wait = 45
  elsif scenario.source_tag_names.include? '@capybara'
     Capybara.default_driver = :selenium
     Capybara.default_wait_time = 30
     Capybara.default_selector = :xpath
  end
end

After do |scenario|
  if !@browser.nil?
    open_windows = @browser.window_handles
    windows = open_windows.length - 1
    for i in 0..windows
      @browser.switch_to.window(open_windows[i])
      @browser.close
    end
  end
end
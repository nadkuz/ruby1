require 'rspec'
require 'selenium-webdriver'


describe 'HMC login smoke test' do



  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

  end

  after(:each) do
    @driver.quit
  end

  it 'testusers' do
    @driver.get 'http://173.255.253.109:3000'
    @driver.find_element(id: 'user_session_login').send_keys('test')
    @driver.find_element(id: 'user_session_password').send_keys('password')
    @driver.find_element(id: 'user_session_submit').click
    @wait.until{@driver.title.include?("Which Clusters would you like to access? - Hadoop Management Console")}

    @driver.find_element(:link, "Users").click
    res = @driver.find_element(:link, "Hadoop Users")
   # 3) Wait for page and check that page has title Hadoop Users - Hadoop Management Console. Find table by id="hadoop_users" and check that it has more then 10 rows.
   #  4) Find element with id="hadoop_users_filter" and then find text field under it.
 #     5) Input in the field "abrakadabra" and check that table has no rows.
#      6) Input in the field "cos" and check that table has 2 rows in it
     #       7) Input in the field "petr" and check that table has 1 row in it
      #      8) Find link logout and click it

    # Do a find in the list for "cheesecake"
    res = links.find {|el| el.text.include? ("Ares, Apollo (Hadoop Access Test)")}

    res.should_not be_nil
    res.click
    @wait.until{@driver.title.include?("Hadoop Access Testing - Hadoop Management Console")}

    links = @driver.find_elements(:tag_name, "a")
    #puts (links)
    # Do a find in the list for "cheesecake"

    res = links.find {|el| el.text.include? ("Logout")}
    #    links.each do |i|
    #     puts "i  is #{i.text}"
    #   end
    #   end
    @driver.find_element(:link, "M").click
    res = @driver.find_element(:link, "Logout")

    res.should_not be_nil

    res.click

    @wait.until{@driver.find_element(id: 'user_session_login')}

  end
  it 'successful' do
    @driver.get 'http://173.255.253.109:3000'
    @driver.find_element(id: 'user_session_login').send_keys('test')
    @driver.find_element(id: 'user_session_password').send_keys('password')
    @driver.find_element(id: 'user_session_submit').click
    @wait.until{@driver.title.include?("Which Clusters would you like to access? - Hadoop Management Console")}

    links = @driver.find_elements(:tag_name, "a")

      # Do a find in the list for "cheesecake"
    res = links.find {|el| el.text.include? ("Ares, Apollo (Hadoop Access Test)")}

    res.should_not be_nil
    res.click
    @wait.until{@driver.title.include?("Hadoop Access Testing - Hadoop Management Console")}

    links = @driver.find_elements(:tag_name, "a")
   #puts (links)
 # Do a find in the list for "cheesecake"

    res = links.find {|el| el.text.include? ("Logout")}
#    links.each do |i|
 #     puts "i  is #{i.text}"
 #   end
 #   end
    @driver.find_element(:link, "M").click
    res = @driver.find_element(:link, "Logout")

    res.should_not be_nil

    res.click

    @wait.until{@driver.find_element(id: 'user_session_login')}


  end
end
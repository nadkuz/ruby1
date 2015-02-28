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
    res.click
    @wait.until{@driver.title.include?("Hadoop Users - Hadoop Management Console")}

    res=@driver.find_element(id: 'hadoop_users')
    links = res.find_elements(:tag_name, "tr")
    links.should_not be_ni17l
#check rows
    links.count.should be >10

    res=@driver.find_element(id: 'hadoop_users_filter')
    res1=res.find_elements(:tag_name, "input")
    res1.should_not be_nil
    res1[0].send_keys('abrakadabra')

    res1[0].send_keys('')
    res1[0].send_keys('cos')
    links = res.find_elements(:tag_name, "tr")
    links.should_not be_nil
    res1[0].send_keys('')

    res1[0].send_keys('petr')
    links = res.find_elements(:tag_name, "tr")
    links.should_not be_nil

    res=@driver.find_element(id: 'hadoop_users')
    links = res.find_elements(:tag_name, "tr")
    links.should_not be_nil
 #links.should be_empty
    links[0].text.should include("No m")

#check rows



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
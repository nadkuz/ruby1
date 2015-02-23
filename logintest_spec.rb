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

  end
end
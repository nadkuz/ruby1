
require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://173.255.253.109:3000'

  element = @driver.find_element(:id, 'user_session_login')
  element.send_keys "test"

  element = @driver.find_element(:id, 'user_session_password')
  element.send_keys "password"
  element = @driver.find_element(:id, 'user_session_submit')
  element.click
  #@wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @wait.until {@driver.title.should == "Which Clusters would you like to access? - Hadoop Management Console" }
  elements = @driver.find_elements(:tag_name, 'a')

  ares_link = elements.map { |lnk| lnk.text if lnk.text ==  'Hadoop Management Console and has link Ares, Apollo (Hadoop Access Test'}.join
  expect(ares_link).to eql 'Hadoop Management Console and has link Ares, Apollo (Hadoop Access Test'

 # element.submit
  #list
  # assertions

#  Server to test 173.255.253.109:3000
 # 1) Open page and put user="test" (id=user_session_login) and password="password" (id=user_session_password) then click button Sign In (id=user_session_submit)
 #  2) Wait for page and check that page has title =Which Clusters would you like to access?
  # - Hadoop Management Console and has link Ares, Apollo (Hadoop Access Test)
  # (iterate over tags "a" and find one with required name). Click link
  #3) Wait for page and check that page has title and has input element with id Score and link with text Logout. Click the link.
  #4) Check that page login and password fields


end
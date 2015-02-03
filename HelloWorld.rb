# filename: HelloWorld.rb

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
  @driver.get 'http://www.google.com'
  element = @driver.find_element(:name, 'q')
  element.send_keys "Hello World"
  element.submit


end

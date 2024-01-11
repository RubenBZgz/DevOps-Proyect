require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

chrome_options = Selenium::WebDriver::Chrome::Options.new
chrome_options.add_argument("--no-default-browser-check")
chrome_options.add_argument("--disable-dev-shm-usage")

#Documentation: github.com/teamcapybara/capybara
include Capybara::DSL
Capybara.app_host = "http://website" # Using Selenium; connect over network
Capybara.run_server = false # Disable Rack since we are using Selenium.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
    :options => chrome_options
  )
end
Capybara.default_driver = :selenium

describe "Example page render unit tests" do
  it "Shows the Explore California logo" do
    visit('/')
    expect(page.has_selector? '.logo').to be true
  end
end

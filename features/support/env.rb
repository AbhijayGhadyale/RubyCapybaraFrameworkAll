require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'
require 'rspec/core'
require 'rspec/expectations'
require 'selenium/webdriver'
require 'report_builder'
require 'capybara-screenshot/cucumber'
include Capybara::DSL
include RSpec::Matchers
require 'logger'

=begin
1- app_host
      This parameter specifies the default host of the test automation project that you developed and performs your operations through this host. The app host does not change unless you overwrite it.
 E.g.  config.app_host = "https://parabank.parasoft.com/"

2- default_driver
      This parameter specifies which driver will run as the default driver on Capybara. This parameter has driver values such as rack, apparition, selenium. Selenium is recommended for UI processes.
Capybara pre-registers a number of named drivers that use Selenium - they are:
:selenium => Selenium driving Firefox
:selenium_headless => Selenium driving Firefox in a headless configuration
:selenium_chrome => Selenium driving Chrome
:selenium_chrome_headless => Selenium driving Chrome in a headless configuration
E.g.  config.default_driver = :selenium_chrome

  3- default_max_wait_time
      It specifies the maximum wait time for projects which use the Capybara framework. When a step of the test scenario can not get an expected result within the default_max_wait_time, the scenario raises an exception. Let’s say, Capybara.default_max_wait_time = 10 seconds and you’re expecting “Sign Up” button on the current page. With this configuration, Capybara waits to see the button for 10 seconds, maximum.
E.g. config.default_max_wait_time = 10

  4-Capybara.save_path
              If you want to save any output while the test scenario is running, you can use
         this parameter to define the save path of these outputs. If you do not define this
         parameter, you must define the directory manually.
         E.g. config.save_path = "./FailedSnapshots/"

For more info about this topic refer https://www.rubydoc.info/github/jnicklas/capybara/Capybara.configure
=end



Capybara.configure do |config|

  config.run_server = false
  config.default_driver = :selenium_chrome #:selenium, :selenium_headless, :selenium_chrome, :selenium_chrome_headless
  config.app_host = "https://parabank.parasoft.com/"
  config.save_path = "../FailedSnapshots/"
end


#Log

=begin
logdev
The log device. This is a filename (String) or IO object (typically STDOUT, STDERR, or an open file).

shift_age
Number of old log files to keep, or frequency of rotation (daily, weekly or monthly). Default value is 0, which disables log file rotation.
=end

$LOG = Logger.new('log_file.log', 'monthly')



require 'bundler/setup'
Bundler.require

require 'capybara/cucumber'
require 'rspec'
include Capybara::DSL
require 'capybara/dsl'
require 'rspec/core'
require 'rspec/expectations'
include RSpec::Matchers
require 'selenium/webdriver'
Capybara.app_host="https://parabank.parasoft.com/"
Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end




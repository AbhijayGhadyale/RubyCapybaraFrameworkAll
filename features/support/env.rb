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
require 'webdrivers'
require 'logger'
require './features/support/automation_context'
include AutomationContext

begin
  FileUtils.rm_rf('./FailedSnapshots')
  config_file = ENV['TEST_CONFIG'] || 'config'
  config_path = "/conf/#{config_file}.yaml"
  all_config_filepath = File.expand_path(File.dirname(File.basename(Dir.getwd))) + config_path

  AutomationContext.startup all_config_filepath

rescue Exception => e
  puts e.message
  Process.exit(0)
end

#File.delete("log_file.log")
$LOG = Logger.new('log_file.log', 'daily')
# $LOG = Logger.new STDOUT
# $LOG = Logger.new STDERR
# $LOG.datetime_format = '%Y-%m-%d %H:%M:%S%z '

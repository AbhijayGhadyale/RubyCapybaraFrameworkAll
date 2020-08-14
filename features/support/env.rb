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


#time=Time.now.strftime("_%d_%m_%Y_%H_%M_%S_%L")
@LogFile="./logs/previous-logs/log_file#{Time.now.strftime("_%d_%m_%Y_%H_%M_%S_%L")}.log"
$LOG=Logger.new(@LogFile)

begin
  FileUtils.rm_rf('./FailedSnapshots')
  config_file = ENV['TEST_CONFIG'] || 'config'
  config_path = "/config/#{config_file}.yaml"
  all_config_filepath = File.expand_path(File.dirname(File.basename(Dir.getwd))) + config_path

  AutomationContext.startup all_config_filepath
  $LOG.info"############Test Cases Execution Started ################"

rescue Exception => e
  puts e.message
  $LOG.error"Some error occured as:#{e}"
  Process.exit(0)
end

#File.delete("log_file.log")

# $LOG = Logger.new STDOUT
# $LOG = Logger.new STDERR
# $LOG.datetime_format = '%Y-%m-%d %H:%M:%S%z '

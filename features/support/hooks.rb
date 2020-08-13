require 'fileutils'
Before do
  $LOG.info "==========######### Scenario Execution Started ##########==========="
end

After do
  $LOG.info "==========######### Scenario Execution Completed ##########==========="
end
at_exit do


  ReportBuilder.configure do |config|
    config.input_path = 'json-report/testReport.json'
    config.report_path = 'standard-report/std-test-report'
    config.report_types = [:json, :html]
    config.report_title = 'Para Bank Test Results'
    config.include_images = true
    config.additional_info = {browser: 'Chrome', environment: 'Stage 5'}
    config.report_tabs = [:overview, :features, :scenarios, :errors]
  end

  ReportBuilder.build_report
  $LOG.info "############Test Cases Execution Completed ################"
  $LOG.close

  # below code is for creating log file for current executions
  begin
  input = File.open(@LogFile)
  data_to_copy = input.read # gather the data using read() method

  output = File.open("./logs/current-log/current_log_file.log", 'w')
  output.write(data_to_copy)  # write up the data using write() method

  output.close
  input.close
  end
end

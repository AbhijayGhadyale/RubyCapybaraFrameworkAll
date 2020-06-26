require 'report_builder'

After do |scenario|
  if(scenario.failed?)
    page.driver.browser.save_screenshot("html-report/#{scenario.__id__}.png")
    embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
    end
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'json-report/testReport.json'
    config.report_path = 'standard-report/std-test-report'
    config.report_types = [:json,:html]
    config.report_title='Para Bank Test Results'
    config.additional_info = {browser: 'Chrome', environment: 'Stage 5'}
    config.report_tabs = [:overview, :features, :scenarios, :errors]
  end

  ReportBuilder.build_report
end

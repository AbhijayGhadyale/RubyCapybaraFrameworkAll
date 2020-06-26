require 'report_builder'

at_exit do
  ReportBuilder.input_path = 'report.html'
  ReportBuilder.report_path = 'my_test_report'
  ReportBuilder.report_types = [:json, :html]
  ReportBuilder.report_title = 'My Test Results'
  ReportBuilder.additional_info = {Browser: 'Chrome', Environment: 'Stage 5'}

  ReportBuilder.build_report
end



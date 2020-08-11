require './utility/excel_operations'
require 'rubyXL'

Given(/^User have launched the parabank application$/) do
  LoginPageObjects.navigate_to_application
end

And(/^User have entered the wrong Username and Password$/) do
  ExcelOperations.create_excel_file
  ExcelOperations.add_sheet'Login'
  ExcelOperations.get_sheet 'Login'
  ExcelOperations.set_cell 1,0,'john'
  ExcelOperations.set_cell 1,1,'demo'
  ExcelOperations.save_excel './testData/excelTest.xlsx'
  ExcelOperations.parse_excel'./testData/excelTest.xlsx'
  ExcelOperations.get_sheet'Login'

  username=(ExcelOperations.get_cell 1,0).strip
  password=(ExcelOperations.get_cell 1,1).strip

  LoginPageObjects.enter_Username username
  LoginPageObjects.enter_Password password
  ExcelOperations.set_cell 1,2,'Pass'
  ExcelOperations.save_excel './testData/excelTest.xlsx'
 end

When(/^User clicks Login Button$/) do
  LoginPageObjects.click_login
end

Then(/^User gets the error message$/) do
  LoginPageObjects.verify_login_error_message "The username and password could not be verified."
end

And(/^User have entered the correct Username and Password$/) do
  LoginPageObjects.enter_Username "john"
  LoginPageObjects.enter_Password "demo"
end

Then(/^User gets the account overview page$/) do
  LoginPageObjects.verify_title_of_page "ParaBank | Accounts Overview"
end

And(/^User have entered the (.*) username and (.*) password$/) do |username,password|
  LoginPageObjects.enter_Username username
  LoginPageObjects.enter_Password password
end

Then(/^User gets the (.*) text after login$/) do |page_text|
  LoginPageObjects.verify_page_contains_text page_text
end
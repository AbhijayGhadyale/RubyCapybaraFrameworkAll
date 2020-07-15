Given(/^User have launched the parabank application$/) do
  LoginPageObjects.navigate_to_application
end

And(/^User have entered the wrong Username and Password$/) do
   LoginPageObjects.enter_Username "admin"
   LoginPageObjects.enter_Password "admin"
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
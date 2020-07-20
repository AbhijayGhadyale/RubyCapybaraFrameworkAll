When(/^User clicks Open new Account Page$/) do
  OpenAccountPageObjects.click_open_account_page
end

Then(/^User gets the Open new Account Page$/) do
  OpenAccountPageObjects.verify_account_page_displayed
end

And(/^User have logged in with the correct Username and Password$/) do
  LoginPageObjects.enter_Username "demo"
  LoginPageObjects.enter_Password "demo"
  LoginPageObjects.click_login
  LoginPageObjects.verify_title_of_page "ParaBank | Accounts Overview"
end


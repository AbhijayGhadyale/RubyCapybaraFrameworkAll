When(/^User clicks Open new Account Page$/) do
  OpenAccountPageObjects.click_open_Account_Page
end

Then(/^User gets the Open new Account Page$/) do
  OpenAccountPageObjects.verify_Open_New_Account_Page_Displayed
end

And(/^User have logged in with the correct Username and Password$/) do
  LoginPageObjects.enter_Username "demo"
  LoginPageObjects.enter_Password "demo"
  LoginPageObjects.click_login
  LoginPageObjects.verify_title_of_page "ParaBank | Accounts Overview"
end


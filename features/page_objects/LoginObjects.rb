require './framework/base_page'
include UiTest

class LoginPageObjects
  class << self

    UsernameCSS = "input[name='username']"
    PasswordCSS="input[name='password']"
    LoginButtonCSS='input[value="Log In"]'
    LoginErrorMessageCSS='p[class="error"]'

    def navigate_to_application
      #visit ("/parabank/index.htm")
      CommonNavigationControls.navigate_to_url'/parabank/index.htm'
      Capybara.page.driver.browser.manage.window.maximize
    end

    def enter_Username usernameText
      #find(:css, UsernameCSS).set(usernameText)
      CommonTextBoxControls.enter_text(UsernameCSS,'css',usernameText)
    end

    def enter_Password passwordText
      #find(:css,PasswordCSS).set(passwordText)
      CommonTextBoxControls.enter_text(PasswordCSS,'css',passwordText)
    end

    def click_login
      #find(:css, LoginButtonCSS).click
      CommonClickControls.click_on_button LoginButtonCSS,'css'
    end

    def verify_login_error_message messageText
      #find(:css,LoginErrorMessageCSS , :text => messageText)
      CommonFindingControls.verify_locator_text_available LoginErrorMessageCSS,'css',messageText
    end

    def verify_title_of_page pageTitleText
      #expect(page).to have_title pageTitleText
      CommonExpectationControls.expect_page_to_have_title pageTitleText
    end
  end
end

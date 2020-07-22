require './framework/base_page'
include UiTest


class OpenAccountPageObjects
  class << self
    OpenNewAccountLinkXpath = 'a[href="/parabank/openaccount.htm"]'
    OpenAccountPageTitleText = 'ParaBank | Open Account'

    def click_open_account_page
      find(:css, OpenNewAccountLinkXpath).click
    end


    def verify_account_page_displayed
      expect(page).to have_title OpenAccountPageTitleText
    end
  end
end

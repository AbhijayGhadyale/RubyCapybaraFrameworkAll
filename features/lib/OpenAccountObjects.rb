class OpenAccountPageObjects
  class << self
    OpenNewAccountLinkXpath = 'a[href="/parabank/openaccount.htm"]'
    PageTitleText = 'ParaBank | Open Account'

    def click_open_Account_Page
      find(:css, OpenNewAccountLinkXpath).click
    end


    def verify_Open_New_Account_Page_Displayed
      expect(page).to have_title PageTitleText
    end
  end
end

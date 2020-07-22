require './framework/base_page'
include UiTest

class UpdateContactInfoObjects
  class << self

    UpdateContactInfoLinkCSS='a[href="/parabank/updateprofile.htm"]'
    CityCSS="input[name='customer.address.city']"
    PhoneNumberCSS="input[name='customer.phoneNumber']"
    UpdateProfileButtonCSS='input[value="Update Profile"]'
    UpdateInfoMessageCSS='p'

    def click_update_info_link
      CommonClickControls.click_on_link UpdateContactInfoLinkCSS,'css'
    end

    def enter_city_info cityText
      CommonTextBoxControls.enter_text(CityCSS,'css',cityText)
    end

    def enter_phone_number phoneNumberText
      CommonTextBoxControls.enter_text(PhoneNumberCSS,'css',phoneNumberText)
    end

    def click_update_info_button
      CommonClickControls.click_on_button UpdateProfileButtonCSS , 'css'
    end


    def verify_contact_info_page_displayed pageTitleText
      CommonExpectationControls.expect_page_to_have_title pageTitleText
    end

    def verify_update_message_displayed messageText
      CommonFindingControls.verify_locator_text_available UpdateInfoMessageCSS,'css',messageText
    end
  end
end

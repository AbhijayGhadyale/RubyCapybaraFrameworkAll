require 'capybara'
require 'capybara/dsl'
require 'rspec/expectations'
require './framework/custom_capybara/common_click_link_button_controls'
require './framework/custom_capybara/common_check_box_button_controls'
require './framework/custom_capybara/common_drop_down_button_controls'
require './framework/custom_capybara/common_expectation_controls'
require './framework/custom_capybara/common_file_upload_controls'
require './framework/custom_capybara/common_finding_controls'
require './framework/custom_capybara/common_javascript_controls'
require './framework/custom_capybara/common_modals_controls'
require './framework/custom_capybara/common_navigation_controls'
require './framework/custom_capybara/common_querying_controls'
require './framework/custom_capybara/common_radio_button_controls'
require './framework/custom_capybara/common_text_box_controls'

module UiTest
  class BasePage
    class << self
      include RSpec::Matchers
      include Capybara::DSL
      include CommonTextBoxControls
      include CommonNavigationControls
      include CommonExpectationControls
      include CommonModalsControls
      include CommonCheckBoxControls
      include CommonClickControls
      include CommonDropdownControls
      include CommonFileUploadControls
      include CommonFindingControls
      include CommonQueryingControls
      include CommonRadioButtonControls

      # @return [Capybara::Session]
      def page
        # @type [Capybara::Session]
        Capybara.current_session
      end
    end
  end
end

# this class is including all custom capybara methods from respective classed
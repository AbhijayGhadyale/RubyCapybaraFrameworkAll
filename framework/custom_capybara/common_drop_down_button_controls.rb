module CommonDropdownControls
  class << self
    include Capybara::DSL

    def select_text_from_dropdown (locator, locator_type, dropdown_text)
      begin
        case locator_type
        when 'css'
          find(:css, locator).find(:option, dropdown_text).select_option
          $LOG.info "#{dropdown_text} is selected from #{locator}"
        when 'xpath'
          find(:xpath, locator).find(:option, dropdown_text).select_option
          $LOG.info "#{dropdown_text} is selected from #{locator}"
        when ('name' || 'id' || 'link_text')
          find(locator).find(:option, dropdown_text).select_option
          $LOG.info "#{dropdown_text} is selected from #{locator}"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in selecting #{dropdown_text} from #{locator}: #{e}"
        raise
      end
    end

    def select_text_in_drop_down (_dropdown_value, dropdown_text)
      begin
        select(dropdown_text, from: dropdown_element_value)
        $LOG.info "#{dropdown_text} is selected from #{_dropdown_value}"
      rescue Exception => e
        $LOG.error "error in selecting #{dropdown_text} from #{_dropdown_value}: #{e}"
        raise
      end
    end

  end
end

# select('Option', from: 'Select Box')
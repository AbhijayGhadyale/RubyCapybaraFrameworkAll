module CommonTextBoxControls
  class << self
    include Capybara::DSL

    def enter_text (locator, locator_type, text_string)
      begin
        case locator_type
        when 'css'
          find(:css, locator).set(text_string)
          $LOG.info "#{text_string} entered in #{locator}"
        when 'xpath'
          find(:xpath, locator).set(text_string)
          $LOG.info "#{text_string} entered in #{locator}"
        when ('name' || 'id' || 'link_text')
          fill_in locator, with: text_string
          $LOG.info "#{text_string} entered in #{locator}"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in entering #{text_string} in #{locator}: #{e}"
      end
    end

    def clearText (locator, locator_type)
      begin
        case locator_type
        when 'css'
          find(:css, locator).set('')
          $LOG.info "clear is successful for #{locator}"
        when 'xpath'
          find(:xpath, locator).set('')
          $LOG.info "clear is successful for #{locator}"
        when ('name' || 'id' || 'link_text')
          fill_in locator, with: ""
          $LOG.info "clear is successful for #{locator}"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "clear is not successful for #{locator}: #{e}"
      end
    end

  end
end

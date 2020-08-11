module CommonCheckBoxControls
  class << self
    include Capybara::DSL

    def select_check_box (locator, locator_type)
      begin
        case locator_type
        when 'css'
          find(:css, locator).click
          $LOG.info "#{locator} checkbox is selected"
        when 'xpath'
          find(:xpath, locator).click
          $LOG.info "#{locator} checkbox is selected"
        when ('name' || 'id' || 'link_text')
          page.choose(locator)
          $LOG.info "#{locator} checkbox is selected"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in selecting #{locator} checkbox: #{e}"
        raise
      end
    end

    def select_check_box_by_value(checkbox_value)
      begin
        check(checkbox_value)
        $LOG.info "checkbox with value #{checkbox_value} is selected"
      rescue Exception => e
        $LOG.error "error in selecting checkbox with value #{checkbox_value} : #{e}"
        raise
      end
    end

    def unselect_check_box_by_value(checkbox_value)
      begin
        uncheck(checkbox_value)
        $LOG.info "checkbox with value #{checkbox_value} is unselected"
      rescue Exception => e
        $LOG.error "error in unselecting checkbox with value #{checkbox_value} : #{e}"
        raise
      end
    end

  end
end
=begin
check('A Checkbox')
uncheck('A Checkbox')
=end
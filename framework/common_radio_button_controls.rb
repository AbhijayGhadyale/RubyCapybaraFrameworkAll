module CommonRadioButtonControls
  include Capybara::DSL

  def select_radio_button (locator, locator_type)
    begin
      case locator_type
      when 'css'
        find(:css, locator).click
        $LOG.info "#{locator} is selected"
      when 'xpath'
        find(:xpath, locator).click
        $LOG.info "#{locator} is selected"
      when ('name' || 'id' || 'link_text')
        find(locator).click
        $LOG.info "#{locator} is selected"
      else
        -1
      end
    rescue Exception => e
      $LOG.error "error in selecting #{locator}: #{e}"
    end
  end

end





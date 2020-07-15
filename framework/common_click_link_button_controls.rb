module CommonClickControls
  include Capybara::DSL

  def click_on_link (locator, locator_type)
    begin
    case locator_type
    when 'css'
      find(:css, locator).click
      $LOG.info "#{locator} is clicked"
    when 'xpath'
      find(:xpath, locator).click
      $LOG.info "#{locator} is clicked"
    when ('link_text'||'id')
      click_link(locator)
      $LOG.info "#{locator} is clicked"
    else
      -1
    end
    rescue Exception => e
      $LOG.error "error in clicking #{locator}: #{e}"
    end
  end

  def click_on_button (locator, locator_type)
    begin
      case locator_type
      when 'css'
        find(:css, locator).click
        $LOG.info "#{locator} is clicked"
      when 'xpath'
        find(:xpath, locator).click
        $LOG.info "#{locator} is clicked"
      when ('id')
        click_link(locator)
        $LOG.info "#{locator} is clicked"
      else
        -1
      end
    rescue Exception => e
      $LOG.error "error in clicking #{locator}: #{e}"
    end
  end

  def click_on_button_by_balue (button_value)
    begin
      click_button(button_value)
      $LOG.info "#{button_value} is clicked"
    rescue Exception => e
      $LOG.error "error in clicking #{button_value}: #{e}"
    end
  end

end

=begin
click_link('id-of-link')
click_link('Link Text')
click_button('Save')
click_on('Link Text') # clicks on either links or buttons
click_on('Button Value')
=end
module CommonFindingControls
  include Capybara::DSL

  def get_value (locator, locator_type)
    begin
      case locator_type
      when 'css'
        return find_field(:css, locator).value
      when 'xpath'
        return find_field(:xpath, locator).value
      when ('name' || 'id' || 'link_text')
        return find_field(locator).value
      else
        return -1
      end
    rescue Exception => e
      $LOG.error "value is not retrived for #{locator}: #{e}"
    end
  end

end

=begin

=end
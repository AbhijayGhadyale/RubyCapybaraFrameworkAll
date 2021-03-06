module CommonFindingControls
  class << self
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
        raise
      end
    end


    def verify_locator_text_available(locator, locator_type, messageText)
      begin
        case locator_type
        when 'css'
          find(:css,locator , :text => messageText)
          $LOG.info "'#{messageText}' text is available for #{locator}"
        when 'xpath'
          find(:xpath,locator , :text => messageText)
          $LOG.info "'#{messageText}' text is available for #{locator}"
        when ('name' || 'id' || 'link_text')
          find(locator , :text => messageText)
          $LOG.info "'#{messageText}' text is available for #{locator}"
        else
          return -1
        end
      rescue Exception => e
        $LOG.error "'#{messageText}' text is not available for #{locator}: #{e}"
        raise
      end
    end


  end
end


=begin
get_value
this returns value of locator passed as parameter


verify_locator_text_available
this used to find locator passed as argument is having text passed as parameter
=end
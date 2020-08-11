module CommonQueryingControls
  class << self
    include Capybara::DSL

    def check_page_for_selector (locator, locator_type)
      begin
        case locator_type
        when 'css'
          page.has_css?(locator)
          $LOG.info "#{locator} is present in page"
        when 'xpath'
          page.has_xpath?(locator)
          $LOG.info "#{locator} is present in page"
        when ('name' || 'id' || 'link_text')
          page.choose(locator)
          $LOG.info "#{locator} is present in page"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in finding #{locator} in page: #{e}"
        raise
      end
    end

    def check_page_for_content(content_string)
      begin
        page.has_content?(content_string)
        $LOG.info "#{content_string} is present in page"
      rescue Exception => e
        $LOG.error "error in finding #{content_string} in page: #{e}"
        raise
      end
    end

  end
end

=begin
page.has_selector?('table tr')
page.has_selector?(:xpath, './/table/tr')

page.has_xpath?('.//table/tr')
page.has_css?('table tr.foo')
page.has_content?('foo')
=end



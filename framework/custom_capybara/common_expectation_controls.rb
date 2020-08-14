module CommonExpectationControls
  class << self
    include Capybara::DSL
    include Capybara::RSpecMatchers

    def expect_page_to_have_selector(locator, locator_type)
      begin
        case locator_type
        when 'css'
          expect(page).to have_selector(:css, locator)
          $LOG.info "verified as #{locator} is available in page "
        when 'xpath'
          expect(page).to have_selector(:xpath, locator)
          $LOG.info "verified as #{locator} is available in page "
        when ('name' || 'id' || 'link_text')
          expect(page).to have_selector(locator)
          $LOG.info "verified as #{locator} is available in page "
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in verifying #{locator} is available on page: #{e}"
      end
    end

    def expect_page_to_have_content(content_string)
      begin
        expect(page).to have_content(content_string)
        $LOG.info "verified as #{content_string} is available in page "
      rescue Exception => e
        $LOG.error "error in verifying #{content_string} is available on page: #{e}"
        raise
      end
    end


    def expect_page_to_have_title(title_string)
      begin
        expect(page).to have_title title_string
        $LOG.info "verified as page is having #{title_string} as title "
      rescue Exception => e
        $LOG.error "verified as page is not having #{title_string} as title : #{e}"
        raise
      end
    end

  end
end

=begin
These are Rspec methods which are used to verify results
like page have particular selector etc

# expect(page).to have_selector('table tr')
# expect(page).to have_selector(:xpath, './/table/tr')
# expect(page).to have_xpath('.//table/tr')
# expect(page).to have_css('table tr.foo')
# expect(page).to have_content('foo')
=end
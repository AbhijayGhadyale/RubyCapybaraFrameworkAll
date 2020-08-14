module CommonNavigationControls
  class << self
    include Capybara::DSL

    def navigate_to_url(urlpathString)
      begin
        visit(urlpathString)
        Capybara.page.driver.browser.manage.window.maximize
        $LOG.info "navigating to url is successfull "
      rescue Exception => e
        $LOG.error "error in navigating to #{urlpathString}: #{e}"
        raise
      end
    end

  end
end

=begin

this method is used to navigate to particular path of url

=end
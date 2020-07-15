module CommonFileUploadControls
  include Capybara::DSL

  def upload_file(locator, locator_type, path_of_file)
    begin
      case locator_type
      when 'css'
        find(:css, locator).set(path_of_file)
        $LOG.info "uploading file for #{locator} is performed"
      when 'xpath'
        find(:xpath, locator).set(path_of_file)
        $LOG.info "uploading file for #{locator} is performed"
      when ('name' || 'id' || 'link_text')
        attach_file(locator, path_of_file)
        $LOG.info "uploading file for #{locator} is performed"
      else
        -1
      end
    rescue Exception => e
      $LOG.error "error in uploading file for #{locator}: #{e}"
    end
  end

end




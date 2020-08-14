module CommonFileUploadControls
  class << self
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
        raise
      end
    end
  end
end

=begin
# upload_file(locator, locator_type, path_of_file)
# it accepts 3 parameters   locator (value of xpath,value of css  ) ,
                           locator_type (type of locator like css , xpath ),
                           path_of_file ( where file with name is available to upload)

=end
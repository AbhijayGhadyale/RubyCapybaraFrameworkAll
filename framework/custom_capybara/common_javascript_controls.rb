module CommonRadioButtonControls
  class << self
    include Capybara::DSL

    def execute_java_script(js_script)
      begin
        page.execute_script(js_script)
        $LOG.info "#{js_script} code is executed"
      rescue Exception => e
        $LOG.error "#{js_script}code is not executed: #{e}"
        raise
      end
    end

  end

end


=begin
In drivers which support it, you can easily execute JavaScript:

page.execute_script("$('body').empty()")
=end
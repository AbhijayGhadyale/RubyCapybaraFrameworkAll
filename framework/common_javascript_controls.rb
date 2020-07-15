module CommonRadioButtonControls
  include Capybara::DSL

  def execute_java_script(js_script)
    begin
      page.execute_script(js_script)
      $LOG.info "#{js_script} code is executed"
    rescue Exception => e
      $LOG.error "#{js_script}code is not executed: #{e}"
    end
  end



end
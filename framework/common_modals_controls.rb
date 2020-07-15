module CommonModalsControls
  include Capybara::DSL

  def accept_alert_in_page
    begin
      accept_alert
      $LOG.info "alert is accepted"
    rescue Exception => e
      $LOG.error "error in accepting alert: #{e}"
    end
  end

  def accept_alert_after_click(link_text)
    begin
      accept_alert do
        click_link(link_text)
      end
      $LOG.info "alert is accepted after clicked#{link_text}"
    rescue Exception => e
      $LOG.error "error in accepting alert after clicked#{link_text}: #{e}"
    end
  end


  def dismiss_confirm_in_page
    begin
      dismiss_confirm
      $LOG.info "alert is dismissed"
    rescue Exception => e
      $LOG.error "error in dismissing alert: #{e}"
    end
  end

  def dismiss_confirm_after_click(link_text)
    begin
      dismiss_confirm do
        click_link(link_text)
      end
      $LOG.info "alert is dismissed after clicked#{link_text}"
    rescue Exception => e
      $LOG.error "error in dismissing alert after clicked#{link_text}: #{e}"
    end
  end

end

=begin

accept_alert do
  click_link('Show Alert')
end


dismiss_confirm do
  click_link('Show Confirm')
end


accept_prompt(with: 'Linus Torvalds') do
  click_link('Show Prompt About Linux')
end

=end
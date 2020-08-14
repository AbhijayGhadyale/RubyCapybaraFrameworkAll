module CommonCheckBoxControls
  class << self
    include Capybara::DSL

    def select_check_box (locator, locator_type)
      begin
        case locator_type
        when 'css'
          find(:css, locator).click
          $LOG.info "#{locator} checkbox is selected"
        when 'xpath'
          find(:xpath, locator).click
          $LOG.info "#{locator} checkbox is selected"
        when ('name' || 'id' || 'link_text')
          page.choose(locator)
          $LOG.info "#{locator} checkbox is selected"
        else
          -1
        end
      rescue Exception => e
        $LOG.error "error in selecting #{locator} checkbox: #{e}"
        raise
      end
    end

    def select_check_box_by_value(checkbox_value)
      begin
        check(checkbox_value)
        $LOG.info "checkbox with value #{checkbox_value} is selected"
      rescue Exception => e
        $LOG.error "error in selecting checkbox with value #{checkbox_value} : #{e}"
        raise
      end
    end

    def unselect_check_box_by_value(checkbox_value)
      begin
        uncheck(checkbox_value)
        $LOG.info "checkbox with value #{checkbox_value} is unselected"
      rescue Exception => e
        $LOG.error "error in unselecting checkbox with value #{checkbox_value} : #{e}"
        raise
      end
    end

  end
end


=begin

#select_check_box (locator, locator_type)
method accept parameter as locator and its type e.g. input as locator having locator_type css
and performs click operation


#unselect_check_box_by_value(checkbox_value)
method accepts any locator value and performs check


##
Interacting with forms
Full reference: Capybara::Node::Actions

There are a number of tools for interacting with form elements:

fill_in('First Name', with: 'John')
fill_in('Password', with: 'Seekrit')
fill_in('Description', with: 'Really Long Text...')
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', from: 'Select Box')


ref:https://www.rubydoc.info/github/jnicklas/capybara
=end
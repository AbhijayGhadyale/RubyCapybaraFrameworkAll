require './utility/yaml_operations.rb'
require 'yaml'

And(/^user have visited update Contact info Page$/) do
  UpdateContactInfoObjects.click_update_info_link
  UpdateContactInfoObjects.verify_contact_info_page_displayed 'ParaBank | Update Profile'
end

And(/^User have entered below data as contact info$/) do |table|
  # table is a table.hashes.keys # => [:Phone Number, :City]
  table.hashes.each do |column|
    Phone_Number = column["Phone_Number"]
    City = column["City"]
  UpdateContactInfoObjects.enter_phone_number Phone_Number
  UpdateContactInfoObjects.enter_city_info City
    end
end

When(/^User clicks update profile button$/) do
  UpdateContactInfoObjects.click_update_info_button
end

Then(/^User gets the valid message saying profile updated$/) do
  UpdateContactInfoObjects.verify_update_message_displayed'Profile Updated'
end

And(/^User have entered Phone number and city data as contact info$/) do
  dir_to_yaml = './testData/contact_info_test_data.yaml'

  YamlOperations.load_yaml_file dir_to_yaml
  YamlOperations.get_parent'Customer101'
  Yaml_Phone_Number=YamlOperations.get_child 'Customer101' ,'Phone Number'
  Yaml_City=YamlOperations.get_child 'Customer101','City'

  UpdateContactInfoObjects.enter_phone_number Yaml_Phone_Number
  UpdateContactInfoObjects.enter_city_info Yaml_City
end
Given /^the production "(.*)" already exists$/ do |production_name|
  steps %Q{
    And I follow "Add Prod"
    And I fill in "production[name]" with "#{production_name}"
    And I press "Create"
  }
end
Given /^the production "(.*)" already exists$/ do |title|
    Production.create(:name => title)
end
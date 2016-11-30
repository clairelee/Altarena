Given /^the profile "(.*)" already exists$/ do |title|
    Profile.create(:name => title)
end
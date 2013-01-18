Given /^I am a user$/ do
  FactoryGirl.create(:user)
end

When /^I visit the home page$/ do
  visit "/"
end

Then /^I should see the title "([^"]*)"$/ do |text|
  page.should have_selector('h1', :text => text)
end

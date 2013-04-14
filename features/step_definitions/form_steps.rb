When /^"([^\"]*)" is selected for "([^\"]*)"$/ do |selected_value, field|
  select(selected_value, :from => field)
end

When(/^"(.*?)" is entered for "(.*?)"$/) do |value, field|
  fill_in(field, :with => value)
end

When(/^yes is chosen for "(.*?)"$/) do |field|
  find(:xpath, "//input[@id='#{field}']").set(true)
end

When(/^no is chosen for "(.*?)"$/) do |field|
  find(:xpath, "//input[@id='#{field}']").set(false)
end

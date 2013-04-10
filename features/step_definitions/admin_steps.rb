
When /^I visit the admin page$/ do
  visit '/admin/users'
end

When /^I visit new users page$/ do
  visit '/admin/users/new'
end

When /^I add a new guest$/ do
  build_guest
  register_guest
end

##Then

Then /^I should see the admin page$/ do
  current_path.should eql('/admin/users')
end

Then /^I should not see the admin page$/ do
  current_path.should_not eql('/admin/users')
end

Then /^I should see summary links$/ do
  page.should have_xpath(".//a[contains(@href,'/users/summary')]")
  page.should have_xpath(".//a[contains(@href,'/users/summary.pdf')]")
  page.should have_xpath(".//a[contains(@href,'/users/summary.ods')]")
end

Then /^I should see a table of all users$/ do
  current_path.should eql('/admin/users')
  page.should have_selector('table') #pretty bad method of determining this
  page.should have_selector('td', :text => @user[:email])
  page.should have_selector('td', :text => @user[:name])
end

Then /^I should see an add users link$/ do
  current_path.should eql('/admin/users')
  page.should have_xpath(".//a[contains(@href,'/admin/users/new')]")
end

Then /^I should see an new user form$/ do
  page.should have_selector('form')
end


## Given ## 

Given /^I am a user$/ do
  create_user
end

Given /^I am an admin$/ do
  create_admin
end

Given /^I am a signed in "([^"]*)"$/ do |type|
  visit '/users/sign_in'
  method = "create_"+type
  eval(method)
  sign_in
end

## When ##

When /^I visit the site$/ do
  visit root_path
end

When /^I visit the login page$/ do
  visit '/users/sign_in'
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I return to the site$/ do
  visit root_path
end

When /^enter no password$/ do
  @visitor = @visitor.merge(:password => "")
  sign_in
end

When /^enter an invalid password$/ do
  @visitor = @visitor.merge(:password => "wrongone")
  sign_in
end

When /^I sign in with a wrong email$/ do
 @visitor = @visitor.merge(:email => "atestu@example.com")
  sign_in
end

## Then ##

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see the login page$/ do
  current_path.should eql('/users/sign_in')
  page.should have_content("Sign in")
end

Then /^receive a sign in message$/ do
  page.should have_content "You need to sign in or sign up before continuing."
end

Then /^I should see the title "([^"]*)"$/ do |text|
  page.should have_xpath('//h1|//h2',:text => text)
end

Then /^I should see the users page$/ do
  path = user_path(@user)
  current_path.should eql(path)
end

Then /^enter valid login credentials$/ do
  sign_in
end

Then /^I should see the home page$/ do
  current_path.should eql('/')
end

Then /^I should be signed out$/ do
 step "I should see the login page"
end

Then /^see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should see a sign in link$/ do
  page.should have_xpath(".//a[contains(@href,'/users/sign_in')]")
end

Then /^I should see a sign out link$/ do
  page.should have_xpath(".//a[contains(@href,'/users/sign_out')]")
end

Then /^I should see an edit menu link$/ do
  page.should have_xpath("//a[text()='Enter your menu choices']/@href")
end

Then /^no sign in link$/ do
  page.should_not have_xpath(".//a[contains(@href,'/users/sign_in')]")
end

Then /^I should see an admin area link$/ do
  page.should have_xpath(".//a[contains(@href,'/admin/users')]")
end

Then /^I should not see an admin area link$/ do
  page.should_not have_xpath(".//a[contains(@href,'/admin/users')]")
end

Then /^I should see my name$/ do
  page.should have_content "#{@user.name}"
end
























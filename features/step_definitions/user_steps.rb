### Utility methods ###

def create_visitor
 @visitor ||={ :name => "Tester", :email=> "atester@example.com", :password => "auserpass", :password_confirmation => "auserpass" }
end

def create_user
 create_visitor
 #delete_user
 @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def sign_in
 fill_in "user_email", :with => @visitor[:email]
 fill_in "user_password", :with => @visitor[:password]
 click_button "Sign in"
end

## Given ## 

Given /^I am a user$/ do
  create_user
end

Given /^I am logged in$/ do
  visit '/users/sign_in'
  create_user
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

And /^I sign in with a wrong email$/ do
 @visitor = @visitor.merge(:email => "atestu@example.com")
  sign_in
end

## Then ##

Then /^I should see the login page$/ do
  current_path.should eql('/users/sign_in')
  page.should have_content("Sign in")
end

Then /^receive a sign in message$/ do
  page.should have_content "You need to sign in or sign up before continuing."
end


Then /^I should see the title "([^"]*)"$/ do |text|
  page.should have_selector('h1', :text => text)
end

Then /^enter valid login credentials$/ do
  sign_in
end

Then /^I should see the home page$/ do
  current_path.should eql('/')
end

Then /^I should be signed out$/ do
  #current_path.should eql('/users/sign_in')
  pending
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

Then /^no sign in link$/ do
  page.should_not have_xpath(".//a[contains(@href,'/users/sign_in')]")
end















When /^I visit the menu edit page$/ do
  visit edit_user_meal_path(@user, @user.meal)
end

When /^the menu edit form is submitted$/ do
  click_button "Submit Choices"
end

## Then

Then(/^the user should receive an email$/) do
  email = '"'+@user.email+'"'
  #str = email + " should receive an email"
  step  email+ " should receive an email"
end

When(/^the user opens the email$/) do
  email = '"'+@user.email+'"'
  step  email+ " opens the email"
end


Then /^I should see the menu$/ do
  page.should have_content "Menu"
  page.should have_content "Vegetarian Menu"
end

Then /^I should see the menu edit form$/ do
  path = "edit_meal_"+@user.meal.id.to_s
  page.should have_xpath(".//form[@id='"+path+"']")
end

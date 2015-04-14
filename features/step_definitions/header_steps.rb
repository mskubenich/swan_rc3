Given(/^I visit Home Page$/) do
  visit root_path
  @user = create :user
end

When(/^I fill in "Email" with "current_user.email"$/) do
  fill_in("Email", :with => @user.email)
end

And(/^I fill in "Password" with "secret"$/) do
  fill_in("Password", :with => 'secret')
end

And(/^I press button "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should see user full_name$/) do
  expect(page).to have_content(@user.full_name)
end

When(/^I follow "([^"]*)"$/) do |link|
  click_link(link)
end

Then(/^I should not see user full_name$/) do
  expect(page).to_not have_content(@user.full_name)
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

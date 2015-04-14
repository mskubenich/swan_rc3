Given(/^I visit login page and create user$/) do
  visit '/login'
  @current_user = create :user
end

When(/^I fill in "Email" with current_user.email$/) do
  fill_in("Email", :with => @current_user.email)
end

And(/^I fill in "Password" with "secret"$/) do
  fill_in("Password", :with => 'secret')
end

And(/^I press button "Log in"$/) do
  click_button('Log in')
end

Then(/^I should see link "Log out" and press "Log out"$/) do
  expect(page).to have_content('Log out')
  click_link('Log out')
end
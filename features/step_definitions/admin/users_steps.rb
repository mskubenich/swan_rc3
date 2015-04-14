Given(/^I have a registered user$/) do
  @user = create :user
end

When(/^I visit admin page$/) do
  visit '/admin'
end

Then(/^I should see "Users" link$/) do
  expect(page).to have_link 'Users'
end

When(/^I follow "Users" link$/) do
  click_link 'Users'
end

Then(/^I should see "Users list"$/) do
  expect(page).to have_content 'USERS LIST'
  expect(page).to have_selector('td', text: 'User ID')
  expect(page).to have_selector('td', text: 'User name')
  expect(page).to have_selector('td', text: 'User email')

  User.all.each do |user|
    expect(page).to have_selector('td', text: user.id)
    expect(page).to have_selector('td', text: user.full_name)
    expect(page).to have_selector('td', text: user.email)
    end
end

When(/^I follow "Back to Admin page" link$/) do
  click_link 'Back to Admin page'
end

Then(/^I should see "Hallo Admin"$/) do
  expect(page).to have_content 'HELLO ADMIN'
end

When(/^I follow "Show user" link$/) do
  User.all.each do |user|
    click_link user.full_name
    end
end

Then(/^I should see "User's name"$/) do
  User.all.each do |user|
    expect(page).to have_content user.full_name
    end
end

When(/^I follow "Back to users list" link$/) do
  click_link 'Back to users list'
end

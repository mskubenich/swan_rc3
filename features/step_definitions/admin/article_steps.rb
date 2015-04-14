Given(/^I visit admin articles page$/) do
  visit '/admin/articles'
end

Given(/^I have article$/) do
  @article=Article.create(title: 'Example title text',text: 'Example text')
  @article.save
end

When(/^I follow "([^"]*)"$/) do |action|
  click_link action
end

And(/^I fill in title with "([^"]*)"$/) do |title|
  fill_in 'Title', with: title
end

And(/^I fill in text with "([^"]*)"$/) do |text|
  fill_in 'Text', with: text
end

And(/^I press "([^"]*)"$/) do |action|
  click_button action
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

And(/^I confirm the dialog$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see "([^"]*)"$/) do |text|
  expect(page).to_not have_content text
end
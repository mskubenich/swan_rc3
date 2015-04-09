Given /^i am on the login page$/ do

 visit root_path
 click_on 'Sign Up'

end

Given /^i fill in First Name$/ do

  fill_in 'user[first_name]', :with => 'user'

end

Given /^i fill in Last Name$/ do

  fill_in 'user[last_name]', :with => 'example'

end

Given /^i fill in Full Name$/ do

  fill_in 'user[full_name]', :with => 'userexample'

end

Given /^i fill in Email$/ do

  fill_in 'user[email]', :with => 'user@example.com'

end

Given /^i fill in Password$/ do

  fill_in 'user[password]', :with => '1234567'

end

Given /^i fill in Password Confirmation$/ do

  fill_in 'user[password_confirmation]', :with => '1234567'

end

Given /^i press "Register"$/ do

  find("input[type=submit]").click

end

Then /^i should see "([^\"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Given /^i not fill in First Name$/ do

  fill_in 'user[first_name]', :with => ''

end

Then /^they should see an error message$/ do
  expect(page).to have_selector('span.label.label-danger')
end

Given /^i not fill in Last Name$/ do

  fill_in 'user[last_name]', :with => ''

end

Given /^i not fill in Full Name$/ do

  fill_in 'user[full_name]', :with => ''

end

Given /^i not fill in Password$/ do

  fill_in 'user[password]', :with => ''

end

Given /^i fill in invalid Email$/ do

  fill_in 'user[email]', :with => 'example'

end

Given /^i not fill in  Email$/ do

  fill_in 'user[email]', :with => ''

end

Given /^i fill in invalid Password Confirmation$/ do

  fill_in 'user[password_confirmation]', :with => 'example'

end

Given /^i no fill in Password Confirmation$/ do

  fill_in 'user[password_confirmation]', :with => ''

end
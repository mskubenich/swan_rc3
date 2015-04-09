require 'rails_helper'
describe "the signup process", :type => :feature do


  it "signs me in" do
    visit 'users/new'
      fill_in 'user_first_name', :with => 'example'
      fill_in 'user_last_name', :with => 'example'
      fill_in 'user_full_name', :with => 'example'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'user_password_confirmation', :with => 'password'

    click_button 'Enjoy !!!'
    expect(page).to have_content 'Welcome to the Uzhhorod web portal!'
  end
end
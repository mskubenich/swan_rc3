require 'rails_helper'

describe 'Authentication', type: :feature do

  before :each do
    visit login_path
  end

  it 'should login users if email/password match' do
    user = create :user, email: 'john.doe@gmail.com', password: 'secret'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content(user.full_name)
    expect(page).to have_link('Log out')
    expect(page).to have_no_link('Log in')
  end

  it 'should log out user' do
    user = create :user, email: 'john.doe@gmail.com', password: 'secret'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link 'Log out'
    expect(page).to have_no_link('Log out')
    expect(page).to have_content('Welcome to the Uzhgorod web portal')
  end
end

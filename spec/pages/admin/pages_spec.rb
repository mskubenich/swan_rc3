require 'rails_helper'

describe "Admin pages", type: :feature do

  # subject { page }

  describe "index" do

    it "should list each user" do
      create(:user, first_name: "First", last_name: "User", full_name: "First User", email: "first@example.com", password: "secret", password_confirmation: "secret")
      create(:user, first_name: "Second", last_name: "User", full_name: "Second User", email: "second@example.com", password: "secret", password_confirmation: "secret")
      visit admin_path

      expect(page).to have_content('Users list')

      User.all.each do |user|
        expect(page).to have_selector('td', text: user.full_name)
        expect(page).to have_selector('td', text: 'Delete')
      end
    end
  end
end

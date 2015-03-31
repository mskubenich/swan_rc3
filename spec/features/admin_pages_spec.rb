require 'rails_helper'

describe "Admin pages" do

  subject { page }

  describe "index" do
    before do
      FactoryGirl.create(:user, first_nale: "First", last_name: "User", full_name: "First User",
                        email: "first@example.com", password: "secret", password_confirmation: "secret")
      FactoryGirl.create(:user, first_nale: "Second", last_name: "User", full_name: "Second User",
                        email: "second@example.com", password: "secret", password_confirmation: "secret")
      visit admin_path
    end

    it { should have_content('Hello Admin') }
    it { should have_content('Users list') }
    
    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('td', text: user.full_name)
        expect(page).to have_selector('td', text: 'Delete')
      end
    end
  end
end

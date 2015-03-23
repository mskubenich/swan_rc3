require 'rails_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_content('Log in') }
  end

  describe "login" do
    before { visit login_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_content('Log in') }
      it { should have_selector('div.alert') }

      describe "after visiting another page" do
        before { visit root_path }
        it { should_not have_selector('div.alert') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_content(user.full_name) }
      it { should have_link('Log out',    href: logout_path) }
      it { should_not have_link('Log in', href: login_path) }

      describe "logout" do
        before { click_link "Log out" }
        it { should_not have_link('Log out') }
        it { should have_content("Welcome to the Uzhgorod web portal") }
      end
    end
  end
end

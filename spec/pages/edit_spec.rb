require 'spec_helper'

describe "User pages" do

      describe "edit" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit edit_user_path(user) }

        describe "page" do
          it { should have_content("Update your profile") }
          it { should have_title("Edit profile") }
        end

        describe "with invalid information" do
          before { click_button "Save changes" }

          it { should have_content('error') }
        end
      end
end
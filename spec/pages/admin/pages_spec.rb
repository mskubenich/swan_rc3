require 'rails_helper'

describe 'Admin pages', type: :feature do

  before :each do
    visit admin_path
  end

  describe 'Users page' do
    before(:all) { 30.times { user = create :user } }
    after(:all) { User.delete_all }
      
    it 'should have a "Users" link' do
      expect(page).to have_link('Users')
    end

    it "should list each user" do
      visit admin_users_path

      expect(page).to have_content('Users list')

      expect(page).to have_selector('td', text: 'User ID')
      expect(page).to have_selector('td', text: 'User name')
      expect(page).to have_selector('td', text: 'User email')

      User.all.each do |user|
        expect(page).to have_selector('td', text: user.id)
        expect(page).to have_selector('td', text: user.full_name)
        expect(page).to have_selector('td', text: user.email)
      end

      expect(page).to have_selector('div.pagination')
      expect(page).to have_link('Back to Admin page')
    end
  end
end

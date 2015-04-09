require 'rails_helper'

describe 'Friend', type: :feature do

    it 'should check "Request Friendship" link' do
        user1 = create :user
        user2 = create :user
        
        visit login_path
        fill_in 'Email', with: user1.email
        fill_in 'Password', with: user1.password
        click_button 'Log in'

        expect(page).to have_no_link('Request friendship')

        visit(user_path(:id => user2.id))
        expect(page).to have_link('Request friendship')
    end

    it 'should check friends block' do
        user3 = create :user
        user4 = create :user

        visit login_path
        fill_in 'Email', with: user3.email
        fill_in 'Password', with: user3.password
        click_button 'Log in'

        expect(page).to have_content('Friends: 0')
        expect(page).to have_no_content('pending friends')
        expect(page).to have_no_content('requested friend')

        visit(user_path(:id => user4.id))
        expect(page).to have_content('Friends: 0')
        expect(page).to have_no_content('pending friends')
        expect(page).to have_no_content('requested friend')
    end

    it 'should add new friend' do
        user5 = create :user
        user6 = create :user

        visit login_path
        fill_in 'Email', with: user5.email
        fill_in 'Password', with: user5.password
        click_button 'Log in'

        visit(user_path(:id => user6.id))
        click_link 'Request friendship'
        expect(page).to have_content('Friendship request sent!')
        expect(page).to have_content('Friends: 0')

        visit(user_path(:id => user5.id))
        expect(page).to have_content('Friends: 0')
        expect(page).to have_content('1 pending friend')
        expect(page).to have_link('Cancel request')

        click_link 'Cancel request'
        expect(page).to have_content('Friendship request canceled!')
        expect(page).to have_content('Friends: 0')
        expect(page).to have_no_content('1 pending friend')
    end

    it 'should accept friend request' do
        user7 = create :user
        user8 = create :user

        visit login_path
        fill_in 'Email', with: user7.email
        fill_in 'Password', with: user7.password
        click_button 'Log in'

        visit(user_path(:id => user8.id))
        click_link 'Request friendship'
        expect(page).to have_content('Friendship request sent!')
        click_link 'Log out'
        expect(page).to have_content('Welcome to the Uzhgorod web portal')

        visit login_path
        fill_in 'Email', with: user8.email
        fill_in 'Password', with: user8.password
        click_button 'Log in'

        expect(page).to have_content('1 requested friend')
        expect(page).to have_link(user7.full_name)
        expect(page).to have_link('Accept')
        expect(page).to have_link('Decline')

        click_link 'Accept'
        expect(page).to have_content('Friendship accepted!')
        expect(page).to have_content('Friends: 1')
        expect(page).to have_link(user7.full_name)
        expect(page).to have_link('Delete')

        click_link user7.full_name
        expect(page).to have_content('Friends: 1')
        expect(page).to have_link(user8.full_name)

        visit(user_path(:id => user8.id))
        click_link 'Delete'
        expect(page).to have_content('Friendship deleted!')
        expect(page).to have_content('Friends: 0')

        visit(user_path(:id => user7.id))
        expect(page).to have_content('Friends: 0')
    end

    it 'should decline friend request' do
        user9 = create :user
        user10 = create :user

        visit login_path
        fill_in 'Email', with: user9.email
        fill_in 'Password', with: user9.password
        click_button 'Log in'

        visit(user_path(:id => user10.id))
        click_link 'Request friendship'
        expect(page).to have_content('Friendship request sent!')

        visit(user_path(:id => user9.id))
        expect(page).to have_content('1 pending friend')
        click_link 'Log out'
        expect(page).to have_content('Welcome to the Uzhgorod web portal')

        visit login_path
        fill_in 'Email', with: user10.email
        fill_in 'Password', with: user10.password
        click_button 'Log in'

        expect(page).to have_content('1 requested friend')
        expect(page).to have_link(user9.full_name)
        expect(page).to have_link('Accept')
        expect(page).to have_link('Decline')

        click_link 'Decline'
        expect(page).to have_content('Friendship declined!')
        expect(page).to have_content('Friends: 0')
        click_link 'Log out'
        expect(page).to have_content('Welcome to the Uzhgorod web portal')

        visit login_path
        fill_in 'Email', with: user9.email
        fill_in 'Password', with: user9.password
        click_button 'Log in'

        expect(page).to have_content('Friends: 0')
        expect(page).to have_no_content('1 pending friend')
    end
end

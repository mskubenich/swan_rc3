require 'rails_helper'

RSpec.describe Role, type: :model do

  it 'should have many users' do
    role = create :role
    user = create :user

    role.users << user
    role.save
    role.reload

    expect(role.users.count).to eq(1)
    expect(role.users.first.id).to eq(user.id)
  end
end

require 'rails_helper'

describe User do
  it 'should not be valid when email address is already taken' do
    user1 = create :user, email: 'john.rembo@gmail.com'
    user2 = build :user, email: 'john.rembo@gmail.com'
    user2.validate

    expect(user2.valid?).to eq(false)
    expect(user2.errors[:email]).to eq(["has already been taken"])
  end

  it 'should not be valid when email is not present' do
    user = build :user, email: ''
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:email]).to eq(['can\'t be blank', 'is invalid'])
  end

  it 'should not be valid if email doesn\'t match pattern' do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      user = build :user, email: invalid_address
      user.validate

      expect(user.valid?).to eq(false)
      expect(user.errors[:email]).to eq(['is invalid'])
    end
  end

  it 'should be valid' do
    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
      user = build :user, email: valid_address
      user.validate

      expect(user.valid?).to eq(true)
    end
  end
end



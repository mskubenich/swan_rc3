require 'rails_helper'

describe User do
  it 'should not be valid when email address is already taken' do
    user1 = create :user, email: 'john.rembo@gmail.com'
    user2 = build :user, email: 'john.rembo@gmail.com'
    user2.validate

    expect(user2.valid?).to eq(false)
    expect(user2.errors[:email]).to eq(["has already been taken"])

  end
  it 'should not be valid when first name is not present' do
    user = build :user, first_name: ''
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:first_name]).to eq(["can't be blank"])
  end


  it 'should not be valid when first name is too long' do
    user = build :user, first_name: 'a' * 26
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:first_name]).to eq(["is too long (maximum is 25 characters)"])
  end

  it 'should not be valid when last name is not present' do
    user = build :user, last_name: ''
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:last_name]).to eq(["can't be blank"])
  end

  it 'should not be valid when last name is too long' do
    user = build :user, last_name: 'a' * 26
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:last_name]).to eq(["is too long (maximum is 25 characters)"])
  end

  it 'should not be valid when full name is not present' do
    user = build :user, full_name: ''
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:full_name]).to eq(["can't be blank"])
  end

  it 'should not be valid when full name is too long' do
    user = build :user, full_name: 'a' * 51
    user.validate

    expect(user.valid?).to eq(false)
    expect(user.errors[:full_name]).to eq(["is too long (maximum is 50 characters)"])
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

  describe 'password' do
    before :each do
      @user = create :user
    end

    it 'should respond to methods' do
      expect(@user).to respond_to(:password_digest)
      expect(@user).to respond_to(:password)
      expect(@user).to respond_to(:password_confirmation)

      expect(@user).to respond_to(:authenticate)
    end

    it 'should not be less then 6 characters' do
      @user.password = 'a'*4
      @user.password_confirmation = 'a'*4

      expect(@user.valid?).to be(false)
      expect(@user.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
    end

    it 'should be present' do
      @user.password = nil
      @user.password_confirmation = nil

      expect(@user.valid?).to be(false)
      expect(@user.errors[:password]).to eq(['can\'t be blank'])
    end

    it 'should match confirmation' do
      @user.password = 'secret'
      @user.password_confirmation = 'qwerty'

      expect(@user.valid?).to be(false)
      expect(@user.errors[:password_confirmation]).to eq(["doesn't match Password"])
    end
  end

  it 'should authenticate if password is valid' do
    user = create :user, password: 'secret', password_confirmation: 'secret'
    expect(user.authenticate('secret').id).to eq(user.id)
  end

  it 'should\'t  authenticate if password is invalid' do
    user = create :user, password: 'secret', password_confirmation: 'secret'
    expect(user.authenticate('secret1')).to eq(false)
  end

	it "should have many news" do
    user = create :user
    news = create :news, title: 'Example'*5, author: user

    user.save

    expect(user.news.count).to eq (1)
  end

  it 'should have many roles' do
    role = FactoryGirl.create :role
    user = create :user

    user.roles << role
    user.save
    user.reload

    expect(user.roles.count).to eq(1)
    expect(user.roles.first.id).to eq(role.id)
  end
end


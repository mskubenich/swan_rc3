require 'rails_helper'
require 'spec_helper'

describe User do
  before { @user = User.new(first_nale: "Example", last_name: "User", full_name: "Example User",
                            email: "user@example.com", password: "secret") }

  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  it "should be invalid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

	it "should have many news" do
	news = create :news
	user = create :user
	end

	expect(user.news.count).to eq (0)
	user.news = [news]
	user.save

	expect(user.news.count).to eq (1)
	end
end

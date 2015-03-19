require 'spec_helper'

describe User do

before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "123", password_confirmation: "123")
  end
  describe "for User" do
   it "should have many news" do
        news = create :news
        user = create :author
    end

   subject { @user }
  it { should respond_to(:author) }
  it { should respond_to(:news) }
  it { should be_valid }

 
end
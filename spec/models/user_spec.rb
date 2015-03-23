require 'spec_helper'

describe User do
   it "should have many news" do
        news = create :news
        user = create :user
    end

 expect(user.news.count).to eq (0)   
user.news = [news]
user.save

expect(user.news.count).to eq (1)
end
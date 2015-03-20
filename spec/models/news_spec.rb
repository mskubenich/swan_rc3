require 'rails_helper'

describe News do
  before { @news = News.new(body: 'Example',title: 'Example Example') }

  subject { @news }

  describe 'when body and title is valid' do
    it 'should be valid' do
      expect(@news.title.length).to be >= 15
      expect(@news.title).not_to be_blank
      expect(@news.body).not_to be_blank
      expect(@news).to be_valid
    end
  end
end

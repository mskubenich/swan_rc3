require 'rails_helper'

describe Article do
before { @article = Article.new(body: 'Sample text',title: 'Sample title title') }

subject { @article }

describe 'when body and title is valid' do
   it 'should be valid' do
    expect(@article.title.length).to be >= 15
    expect(@article.title).not_to be_blank
    expect(@article.body).not_to be_blank
    expect(@article).to be_valid
   end
  end
end

require 'rails_helper'

describe News do
  it 'should not be valid if body n body is blank' do
    news = build :news, body: '', title: ''
    news.validate

    expect(news.valid?).to eq(false)
    expect(news.errors[:body]).to eq(["can't be blank"])
    expect(news.errors[:title]).to eq(["can't be blank", "is too short (minimum is 15 characters)"])
  end
  it "should belongs to author" do
	author = create :author
	news = create :news
	news.author = author
	news.save

	expect(news.author.id).to eq(author.id)
	end

  it 'should not be valid if title length is less then 15' do
    news = build :news, body: 'test', title: 'test'
    news.validate

    expect(news.valid?).to eq(false)
    expect(news.errors[:title]).to eq(["is too short (minimum is 15 characters)"])
  end

  it 'should be valid' do
    news = build :news, title: 'The best ever title!!!', body: 'Test body.', author_id: 1
    news.validate

    expect(news.valid?).to eq(true)
  end
end

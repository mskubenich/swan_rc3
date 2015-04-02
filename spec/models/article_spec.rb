require 'rails_helper'

describe Article do
  it 'should not be valid if text n body is blank' do
    article = build :article, text: '', title: ''
    article.validate

    expect(article.valid?).to eq(false)
    expect(article.errors[:text]).to eq(["can't be blank"])
    expect(article.errors[:title]).to eq(["can't be blank", "is too short (minimum is 15 characters)"])
  end

  it 'should not be valid if title length is less then 15' do
    article = build :article, text: 'test', title: 'test'
    article.validate

    expect(article.valid?).to eq(false)
    expect(article.errors[:title]).to eq(["is too short (minimum is 15 characters)"])
  end

  it 'should be valid' do
    article = build :article, title: 'The best ever title!!!', text: 'Test text.'
    article.validate

    expect(article.valid?).to eq(true)
  end
end

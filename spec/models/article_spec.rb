require 'rails_helper'

RSpec.describe Article, type: :model do
  	post = Article.new
	assert_not post.valid?
	assert_equal [:title, :body], post.errors.keys
end

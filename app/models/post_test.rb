require 'test_helper'

class PostTest < ActiveSupport::TestCase
	 test "title, body can't be blank" do
	  post = Post.new
	  assert_not post.valid?
	  assert_equal [:title, :body], post.errors.keys
	end
end
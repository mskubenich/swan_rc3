class News < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  validates :user_id, presence: true 
end
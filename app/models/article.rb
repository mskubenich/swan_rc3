class Article < ActiveRecord::Base
  validates_presence_of :text, :title
  validates :title, length: { minimum: 15 }

  belongs_to :user, :class_name => 'User', foreign_key: 'author_id'
  
end
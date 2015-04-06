class Article < ActiveRecord::Base
  validates_presence_of :text, :title
  validates :title, length: { minimum: 15 }   

  belongs_to :author, :class_name => 'User'
  validates :author_id, presence: true
end

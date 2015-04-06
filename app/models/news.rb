class News < ActiveRecord::Base
  validates_presence_of :body, :title
  validates :title, length: { minimum: 15 }

  belongs_to :author, :class_name => 'User'
  validates :author_id, presence: true
end

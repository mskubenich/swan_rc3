class News < ActiveRecord::Base
  validates :body,:title,presence: true
  validates :title,length: {minimum: 15}

  belongs_to :author, :class_name => 'User'
  validates :author_id, presence: true
end
end

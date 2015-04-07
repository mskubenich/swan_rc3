class News < ActiveRecord::Base
  validates_presence_of :body, :title
  validates :title, length: { minimum: 15 }
end

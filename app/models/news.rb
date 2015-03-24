class News < ActiveRecord::Base
  validates :body,:title,presence: true
  validates :title,length: {minimum: 15}
end

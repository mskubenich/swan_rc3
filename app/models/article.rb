class Article < ActiveRecord::Base
  validates :text,:title,presence: true
  validates :title,length: {minimum: 15}
end

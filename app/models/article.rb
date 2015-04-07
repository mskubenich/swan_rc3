class Article < ActiveRecord::Base
  validates_presence_of :text, :title
  validates :title, length: { minimum: 15 }
end
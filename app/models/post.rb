class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  validates :score, numericality: true, allow_blank: false
  validates :title, :presence => true, :length => {:minimum => 15}
end
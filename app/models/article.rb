class Article < ActiveRecord::Base
  validates_presence_of :title, :text
  validates :title, :presence => true, :length => {:minimum => 15}
  validates :title, :presence => true, allow_blank: false
  validates :text, :presence => true, allow_blank: false
end
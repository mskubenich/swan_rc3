class User < ActiveRecord::Base
  has_many :news
end

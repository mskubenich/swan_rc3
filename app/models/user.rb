class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :full_name, presence: true, length: { maximum: 50 }
  has_secure_password

  validates :password, length: { minimum: 6 }
  has_many :news, foreign_key: 'author_id'
end

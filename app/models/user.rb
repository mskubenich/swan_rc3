class User < ActiveRecord::Base
  has_many :news

  has_many :friendships
  has_many :friends,
           -> { where friendships: { status: 'accepted' } },
           through: :friendships

  has_many :requested_friends,
           -> { where friendships: { status: 'requested' } },
           through: :friendships,
           source: :friend

  has_many :pending_friends,
           -> { where friendships: { status: 'pending' } },
           through: :friendships,
           source: :friend

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :full_name, presence: true, length: { maximum: 50 }
  has_secure_password

  validates :password, length: { minimum: 6 }
end

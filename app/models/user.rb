class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :full_name, presence: true, length: { maximum: 50 }
  has_secure_password
  has_and_belongs_to_many :roles

  def user?
    self.roles.map{|r|r.name}.include?('user')
  end
  def admin?
    self.roles.map{|r|r.name}.include?('admin')
  end
end

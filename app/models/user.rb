class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :full_name, presence: true, length: { maximum: 50 }
  has_secure_password

  validates :password, length: { minimum: 6 }

  has_attached_file :avatar, :styles => {:large => "500x500>", :thumb => "100x100>"}, :default_url => '../../public/assets/user_avatars/default_avatar.png'

  validates_attachment :avatar, :content_type => { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }, :size => {:in => 0..1.megabytes}

  has_many :news, foreign_key: 'author_id'
end

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  
   has_attached_file :avatar, :styles => {:large => "500x500>", :thumb => "100x100>"}, :default_url => '../../public/assets/default_avatar.png'
	validates_attachment :avatar,
	:content_type => { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } ,
	:size => {:in => 0..1.megabytes}
end

class User < ActiveRecord::Base
 has_many :reviews
 validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 20 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: { maximum: 30 }, uniqueness: { case_sensitive: false }, 
 format: { with: VALID_EMAIL_REGEX }
 before_save { self.email = email.downcase }
end 
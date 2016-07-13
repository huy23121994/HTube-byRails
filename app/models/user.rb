class User < ActiveRecord::Base

	has_many :posts

	validates :username, presence: true, length: { maximum: 50}
	validates :email, presence: true, uniqueness: true

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end

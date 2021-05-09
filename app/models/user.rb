class User < ActiveRecord::Base
	has_secure_password
	has_many :sections
	has_many :students, through: :sections
	validates :username, presence: true
end
class User < ApplicationRecord
	validates :username, presence: true, 
											 uniqueness: { case_sensitive: false }, 
											 length: { minimin: 3, maximum: 15 }
	has_secure_password
end

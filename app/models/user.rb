class User < ApplicationRecord
    has_secure_password #Handles validating that the password must be filled. Should find way to ensure uniqueness against hashed passwords
    has_many :quotes, dependent: :destroy

    # Validations that require the first name, last name and email to be filled, with emails being unique
    validates :fname, presence: true
    validates :lname, presence: true
    validates :email, presence: true, uniqueness: true

end

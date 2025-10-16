class User < ApplicationRecord
    has_secure_password #Handles validating the password
    has_many :quotes, dependent: :destroy

    # Validations that require the first name, last name and email to be filled
    validates :fname, presence: true
    validates :lname, presence: true
    validates :email, presence: true
end

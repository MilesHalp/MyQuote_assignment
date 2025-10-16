# Miles Halpine 10607950
# Model for the philisophical categories associated with the quotes
class Category < ApplicationRecord
    has_many :quote_categories, dependent: :destroy
    has_many :quotes, through: :quote_categories

    # Validates that each philisophical category added is unique
    validates :cat_name, presence: true, uniqueness: true
end

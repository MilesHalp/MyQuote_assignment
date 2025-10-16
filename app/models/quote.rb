# Miles Halpine 10607950
# Edits made to be in line with modifications made in Workshop 10
# Model file for the app's quotes. 
class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher, optional: true
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories
  accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true

  # Validates that there must be an actual quote present
  validates :quote_text, presence: true
  # Validates that there is at least one category associated with the quote
  validate :min_one_category

  private

  def min_one_category
    if quote_categories.empty?
      errors.add(:base, "Please select at least one category")
    end
  end
end

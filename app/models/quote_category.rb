#Miles Halpine 10607950
# Model file for QuoteCategory. Acts as a join model to resolve the many-to-many relationship between the quote and category model
class QuoteCategory < ApplicationRecord
  belongs_to :quote
  belongs_to :category
  # Requires category to be present for the join
  validates :category_id, presence: true
  # Requires each category to be unique for the join
  validates :category_id, uniqueness: { scope: :quote_id }
end

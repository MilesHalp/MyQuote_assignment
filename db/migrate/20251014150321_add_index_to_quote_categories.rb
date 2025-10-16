# Miles Halpine 10607950
# Code from Chris Wang
# Migration file that requires that both the quote and category to be unique before joining. Means quote cannot have multiple of the same category
class AddIndexToQuoteCategories < ActiveRecord::Migration[8.0]
  def change
    add_index :quote_categories, [:quote_id, :category_id], unique: true
  end
end

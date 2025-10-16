# Miles Halpine 10607950
# This migration file adds a unique indexs to category names, meaning no two categories can have the same name
class AddIndexToCategoryNames < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, :cat_name, unique: true
  end
end

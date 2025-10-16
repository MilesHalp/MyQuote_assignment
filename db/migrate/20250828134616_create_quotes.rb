# Miles Halpine 10607950
# Migration file for creating quotes
class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.text :quote_text, null:false
      t.string :pub_year, null: false, default: "Unknown"
      t.string :user_comment
      t.boolean :is_public, null: true, default: true
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: true, foreign_key: true # Null changed to true so that the philosopher can default to 'Anonymous'

      t.timestamps
    end
  end
end

class CreatePhilosophers < ActiveRecord::Migration[8.0]
  def change
    create_table :philosophers do |t|
      t.string :fname, null: false, default: "Unknown"
      t.string :lname
      t.string :birth_year, null: false, default: "Unknown"
      t.string :death_year
      t.text :biography

      t.timestamps
    end
  end
end

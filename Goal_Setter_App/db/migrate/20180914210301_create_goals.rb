class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false 
      t.text :details, null: false
      t.boolean :private?, default: true
      t.boolean :completed?, default: false
      t.timestamps
    end
    add_index :goals, :title 
  end
end

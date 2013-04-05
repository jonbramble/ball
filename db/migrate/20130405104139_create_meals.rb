class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.text :allergies
      t.string :wine
      t.boolean :vegetarian
      t.boolean :coffee

      t.timestamps
    end
  end
end

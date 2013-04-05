class ChangeMealDefaults < ActiveRecord::Migration
  def change
   remove_column :meals, :coffee
   remove_column :meals, :vegetarian

   add_column :meals, :coffee, :boolean, :default => :true
   add_column :meals, :vegetarian, :boolean, :default => :false
  end
end

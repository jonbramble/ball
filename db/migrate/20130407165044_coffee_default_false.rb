class CoffeeDefaultFalse < ActiveRecord::Migration
  def up
   remove_column :meals, :coffee
   add_column :meals, :coffee, :boolean, :default => :false
  end
end

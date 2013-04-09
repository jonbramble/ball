class MoveChosenAttribute < ActiveRecord::Migration
  def up
   add_column :meals, :chosen, :boolean, :default => :false
   remove_column :users, :chosen
  end

  def down
   add_column :users, :chosen, :boolean, :default => :false
   remove_column :meals, :chosen
  end
end

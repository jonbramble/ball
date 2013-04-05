class AddChosenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chosen, :boolean, :default => :false
    add_column :users, :admin_only, :boolean, :default => :false
  end
end

class AddFriendsToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :friends, :text
  end
end

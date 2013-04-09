class Meal < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :allergies, :coffee, :vegetarian, :wine
 
  belongs_to :user

  WINE = ["Red","White","No Wine Preference", "Soft Drink"]  

end
